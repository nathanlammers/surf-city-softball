variable "add_terraform_attribution_label" {
  description = "Whether to add the Terraform attribution label"
  type        = string
}

variable "apis" {
  description = "The list of APIs to enable"
  type        = list(string)
}

variable "billing_account_id" {
  description = "The ID of the Google Cloud billing account"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment"
  type        = string
}

variable "firebase_enabled" {
  description = "Whether Firebase is enabled"
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
