variable "environment" {
  description = "Environment, e.g. 'prod', 'staging', 'dev', or 'test'"
}

variable "role_name" {
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "team" {
  default     = ""
  description = "Team responsible for infrastructure"
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = true
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `name`, `environment`, etc."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `policy` or `role`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "convert_case" {
  description = "Convert fields to lower case"
  default     = true
}
