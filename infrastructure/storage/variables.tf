variable "project_name" {
  description = "The name of the Google Cloud project"
  type        = string
}

variable "project_id" {
  description = "The ID of the Google Cloud project"
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

variable "region" {
  description = "The region to deploy resources in"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment"
  type        = string
}