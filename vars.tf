variable "ServiceName" {
  type     = string
  description = "The name of all resources referring to the service name."
  default = "fleet"
}

variable "ServiceNameAlphanumeric" {
  type     = string
  description = "The name of all resources referring to the service name."
  default = "fleet"
}

variable "Location" {
  type    = string
  description = "Resource location"
  default = "westeurope"
}

variable "EnvironmentPrefix" {
  type     = string
  description = "The prefix of all resources referring to environment type. Choose p for production, t for testing and a for acceptance. Only 1 character."
  default = "t"
}
