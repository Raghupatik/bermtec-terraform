variable "access_key" {
  type        = string
  description = "access_key"
  default = ""
}

variable "secret_key" {
  type        = string
  description = "secret_key"
  default = ""
}

variable "location" {
  type    = string
  
  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.location))
    error_message = "Must be valid AWS Region names."
  }
}

  variable "bucketname" {
    type = string
    description = "describe your variable"
  }
