variable "auto_create_subnetworks" {
  description = "Whether to create subnetworks automatically"
  type        = bool
}

variable "network_name" {
  description = "The network name"
  type       = string
}

variable "project_id" {
  description = "The project ID"
  type = string
}

variable "region" {
  description = "The region"
  type        = string
}

variable "subnet_cidr_range" {
  description = "The subnet CIDR range"
  type        = string
}

variable "subnet_name" {
  description = "The subnet name"
  type        = string
}
