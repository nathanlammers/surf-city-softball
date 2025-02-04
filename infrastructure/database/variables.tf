variable "add_terraform_attribution_label" {
  description = "Whether to add the Terraform attribution label to the Google Cloud resources."
  type        = bool
}

variable "database_name" {
  description = "The name of the database for Firestore."
  type        = string
}

variable "database_type" {
  description = "The type of database for Firestore."
  type        = string
}

variable "project_id" {
  description = "The project ID for the Google Cloud project."
  type        = string
}

variable "region" {
  description = "The region for the Google Cloud project."
  type        = string
}