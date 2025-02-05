provider "aws" {
  region = "us-east-1"  # Defina a região que você deseja usar
}

# Criando uma IAM Role chamada EC2Admin
resource "aws_iam_role" "EC2Admin" {
  name = "EC2Admin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "AdministratorAccess" {
  role       = aws_iam_role.EC2Admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "EC2Admin_profile"
  role = aws_iam_role.EC2Admin.name
}

# Criando o par de chaves RSA
resource "tls_private_key" "workstation_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Criando o par de chaves na AWS usando a chave pública gerada
resource "aws_key_pair" "workstation_key" {
  key_name   = "workstation_key"
  public_key = tls_private_key.workstation_key.public_key_openssh
}

# Criando um Security Group com permissão para todo tráfego externo
resource "aws_security_group" "workstation_sg" {
  name        = "workstation-sg"
  description = "Security group for workstation instance"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Pegando a VPC padrão
data "aws_vpc" "default" {
  default = true
}

# Pegando a subnet da zona de disponibilidade 'us-east-1a' (ou a zona de sua escolha)
data "aws_subnet" "default" {
  vpc_id             = data.aws_vpc.default.id
  availability_zone  = "us-east-1a"  # Especificando uma zona de disponibilidade
}

# Criando a instância EC2 com o nome workstation e a role EC2Admin associada
resource "aws_instance" "workstation" {
  ami             = "ami-0ac80df6eff0e70b5"  # AMI Amazon Linux 2 (us-east-1)
  instance_type   = "t2.micro"
  subnet_id       = data.aws_subnet.default.id
  vpc_security_group_ids = [aws_security_group.workstation_sg.id]

  key_name        = aws_key_pair.workstation_key.key_name
  iam_instance_profile = aws_iam_instance_profile.iam_instance_profile.name

  tags = {
    Name = "workstation"
  }
}

# Output da chave pública gerada
output "workstation_public_key" {
  value = tls_private_key.workstation_key.public_key_openssh
}

# Criando o orçamento de 10 USD mensais no AWS Budgets
resource "aws_budgets_budget" "ec2" {
  name              = "budget-ec2-monthly"
  budget_type       = "COST"
  limit_amount      = "10"
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2017-07-01_00:00"
  time_unit         = "MONTHLY"

  cost_filter {
    name = "Service"
    values = [
      "Amazon Elastic Compute Cloud - Compute",
    ]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["seu-email@dominio.com"]  # Substitua pelo seu e-mail
  }

  # Tags para o orçamento
  tags = {
    Tag1 = "Cost"
    Tag2 = "Monthly"
    Tag3 = "EC2"
  }
}