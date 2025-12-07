variable "nsgname" {
  description = "The name of the network security group"
  type        = string
  default     = "nsg-mm24-demo-001"
}

variable "vnetname" {
  description = "The name of the vnet"
  type        = string
  default     = "vnet-mm24-demo-001"
}

variable "rgname" {
  description = "The name of the resource group"
  type        = string
  default     = "rg-mm24-demo"
}

variable "location" {
  description = "The location of your resource group"
  type        = string
  default     = "westeurope"
}

variable "subnetname" {
    type = string
    default = "subnet-mm24-demo-001"

  
}