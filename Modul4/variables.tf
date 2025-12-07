#Variables resource group

variable "rgname" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-mm42-demo"
}

variable "location" {
  description = "The location of your resource group"
  type        = string
  default     = "westeurope"
}

#Variable Storage account
variable "saname" {
  description = "Name of Storage account"
  type        = string
  default     = "satfdemo001"
}

/*
#Variable database
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
*/

#Variable networking
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

#variable Virtual machine
variable "vmname" {
  type    = string
  default = "vm-mm24-demo-001"

}

variable "subnet_id" {
  description = "Id of the subnet"
  type        = string
  default     = ""

}
variable "nicname" {
  description = "The name of the network interface"
  type        = string
  default     = "nic-mm24-demo-001"

}
variable "subnetname" {
  type    = string
  default = "subnet-mm24-demo-001"

}

variable "vm_size" {
  type = string
  default = "Standard_DS1_v2"
}