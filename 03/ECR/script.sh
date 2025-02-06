mkdir ecr && cd ecr
echo 'provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "virginia"
  region = "us-east-1"  # ECR Public só está disponível em us-east-1
}

# Repositório público para o backend
resource "aws_ecrpublic_repository" "cloudmart_backend" {
  provider = aws.virginia
  repository_name = "cloudmart/backend"
}

# Repositório público para o frontend
resource "aws_ecrpublic_repository" "cloudmart_frontend" {
  provider = aws.virginia
  repository_name = "cloudmart/frontend"
}' > main.tf

terraform init
terraform plan
terraform apply