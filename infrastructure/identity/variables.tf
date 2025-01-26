variable "project_id" {
  description = "The project ID for the Google Cloud project."
  type        = string
}

variable "region" {
  description = "The region for the Google Cloud project."
  type        = string
}

variable "service_accounts" {
  description = "The region for the Google Cloud project."
  type = map(object({
    display_name = string
    roles        = list(string)
  }))
}
