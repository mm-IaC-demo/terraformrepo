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

variable "vmname" {
  type    = string
  default = "vm-mm24-demo.001"

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
variable "vm_size" {
  type = string
}