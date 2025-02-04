variable "add_terraform_attribution_label" {
  description = "Whether to add the Terraform attribution label to the Google Cloud resources."
  type        = bool
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment"
  type        = string
}

variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources in"
  type        = string
}

variable "storage_class" {
  description = "The storage class of the bucket"
  type        = string
}

variable "versioning_enabled" {
  description = "Enable versioning on the bucket"
  type        = bool
}