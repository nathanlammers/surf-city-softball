variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_cidr_range" {
  description = "The CIDR range for the subnet"
  type        = string
}

variable "project_id" {
  description = "The Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "The region for the VPC"
  type        = string
}

variable "google_provider_version" {
  description = "The terraform provider version for Google Cloud"
  type        = string
}

variable "google_beta_provider_version" {
  description = "The terraform provider version for Google Cloud Beta"
  type        = string
}