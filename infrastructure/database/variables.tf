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