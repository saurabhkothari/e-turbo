# output.tf

output "instance_name" {
  description = "Name tag of the EC2 instance"
  value = aws_instance.example_instance[*].tags.Name
}

output "instance_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.example_instance[*].public_ip
}
