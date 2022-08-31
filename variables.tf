variable "key_name" {
  type    = string
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

variable "instance_type" {
  type= string
}
variable "instance_name" {}

variable "bucketname" {
    type = string
    description = "describe your variable"
  }

variable "location" {
  type=string
  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.location))
    error_message = "Must be valid AWS Region names."
  }
}