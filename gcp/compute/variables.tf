
variable "instance_count" {}


variable "default_machine_type" {
  description = "Default machine type for instances"
  type        = string
  default     = "e2-medium"
}

variable "instance_name" {
  type        = string
}

variable "new_machine_type" {
  description = "New machine type for the instance"
  type        = string
}
