# main.tf

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "us-east-1" # Replace with your desired AWS region
}

resource "aws_instance" "example_instance" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
}

output "instance_id" {
  value = aws_instance.example_instance[*].id
}
