variable "apis" {
  description = "The list of APIs to enable"
  type        = list(string)
}

variable "environment_name" {
  description = "The name of the environment"
  type        = string
}

variable "google_beta_provider_version" {
  description = "The terraform provider version for Google Cloud Beta"
  type        = string
}

variable "google_provider_version" {
  description = "The terraform provider version for Google Cloud"
  type        = string
}

variable "prefix" {
  description = "The prefix to define the path for the backend file in GCS"
  type        = string
}

variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "project_name" {
  description = "The name of the Google Cloud project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
}

variable "storage_bucket_name" {
  description = "The name of the Google Cloud Storage bucket"
  type        = string
}