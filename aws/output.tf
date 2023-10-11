# output.tf


output "instance_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.example_instance[*].public_ip
}
