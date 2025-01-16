variable "bundle_id" {
  description = "The bundle ID of the iOS app"
  type        = string
}

variable "display_name" {
  description = "The display name of the Firebase app"
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
