sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform version
mkdir terraform-project && cd terraform-project
echo 'provider "aws" {
  region = "us-east-1"  # Substitua pela região desejada
}

resource "random_id" "bucket_suffix" {
  byte_length = 8
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}' > main.tf
terraform init
terraform plan
terraform apply
aws s3 ls
terraform destroy