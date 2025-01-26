# input variables for the project module
variable "apis" {
  description = "The list of APIs to enable"
  type        = list(string)
}

variable "api_quota_preferences" {
  description = "The name of the quota preference"
  type = map(object({
    api             = string
    preferred_value = number
  }))
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

variable "storage_bucket_name" {
  description = "The name of the Google Cloud Storage bucket"
  type        = string
}
