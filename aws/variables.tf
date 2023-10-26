# variables.tf



variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID"
  type        = string
  default     = "ami-067d1e60475437da2" # Replace with your desired AMI ID
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}
variable "instance_name" {
  description = "The custom name for the EC2 instance."
  type        = string
  default = "e-turbo"
}
