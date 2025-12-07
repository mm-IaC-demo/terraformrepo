variable "saname" {
  description = "Name of Storage account"
  type        = string
  default     = "satfdemo001"
}
variable "mssqlname" {
  description = "The name of the SQL database"
  type        = string
  default     = "mssqldb001"
}

variable "mssqldbname" {
  description = "The name of the SQL database"
  type        = string
  default     = "mssqldb001"
}

variable "rgname" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-mm24-demo-001"
}

variable "location" {
  description = "The location of your resource group"
  type        = string
  default     = "westeurope"
}

