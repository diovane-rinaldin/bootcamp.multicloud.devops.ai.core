sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo docker run hello-world
sudo systemctl enable docker
docker --version
sudo usermod -a -G docker $(whoami)
newgrp docker

cd terraform-project
rm main.tf
echo 'provider "aws" {
  region = "us-east-1"  # Altere para sua região preferida
}

# Tabelas DynamoDB
resource "aws_dynamodb_table" "cloudmart_products" {
  name           = "cloudmart-products"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "cloudmart_orders" {
  name           = "cloudmart-orders"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "cloudmart_tickets" {
  name           = "cloudmart-tickets"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}' > main.tf
terraform init
terraform plan
terraform apply
cd ..
mkdir -p challenge-day2/backend && cd challenge-day2/backend
cd challenge-day2/backend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-backend.zip
unzip cloudmart-backend.zip
rm cloudmart-backend.zip
echo 'PORT=5000
AWS_REGION=us-east-1
BEDROCK_AGENT_ID=<seu-bedrock-agent-id>
BEDROCK_AGENT_ALIAS_ID=<seu-bedrock-agent-alias-id>
OPENAI_API_KEY=<sua-chave-api-openai>
OPENAI_ASSISTANT_ID=<seu-id-assistente-openai>' > .env
echo 'FROM node:18
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 5000
CMD ["npm", "start"]' > Dockerfile
docker build -t cloudmart-backend .
docker run -d -p 5000:5000 --env-file .env cloudmart-backend
cd ..
mkdir frontend && cd frontend
wget https://tcb-public-events.s3.amazonaws.com/mdac/resources/day2/cloudmart-frontend.zip
unzip cloudmart-frontend.zip
rm cloudmart-frontend.zip
echo 'VITE_API_BASE_URL=http://<seu-ip-ec2>:5000/api' > .env
echo 'FROM node:16-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:16-alpine
WORKDIR /app
RUN npm install -g serve
COPY --from=build /app/dist /app
ENV PORT=5001
ENV NODE_ENV=production
EXPOSE 5001
CMD ["serve", "-s", ".", "-l", "5001"]' > Dockerfile
docker build -t cloudmart-frontend .
docker run -d -p 5001:5001 cloudmart-frontend
docker ps