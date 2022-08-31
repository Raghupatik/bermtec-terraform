variable "key_name" {
  type    = string
  default = "Test"
}

variable "access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "secret_key" {
  type = string
  nullable = false
}

variable "ami" {
  type = string
}

variable "instance_type" {}
variable "instance_name" {}

variable "location" {}