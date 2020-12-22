variable "name" {
  description = "Name of AWS Account"
}

variable "email" {
  description = "Primary contact email address for an account"
  default     = ""
}

variable "environment" {
  description = "Optional, name of environment"
  default     = ""
}
