variable "key_name" {
  type    = string
  default = "Test"
}

variable "key" {
  type        = string
  description = "AWS Access Key"
}

variable "secret" {
  type = string
  nullable = false
}

variable "ami" {
  type = string
}

variable "instance_type" {}
variable "instance_name" {}

variable "region" {}