


variable "location" {
  type        = string
  description = "Deployment location"
  default     = "northeurope"
}

variable "owner" {
  type        = string
  description = "owner name"
  default     = "bb"

}

variable "resourcename" {
  type        = string
  description = "resource name"
  default     = "generiskressurs"


}

variable "type" {
  type        = string
  description = "resource type. ex. demo, project, planning"
  default     = "vnett"


}