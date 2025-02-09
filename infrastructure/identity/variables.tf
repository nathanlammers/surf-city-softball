variable "add_terraform_attribution_label" {
  description = "Whether to add the Terraform attribution label to the Google Cloud resources."
  type        = bool
}

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

variable "workload_identity_pool_description" {
  description = "The description of the workload identity pool."
  type        = string
}

variable "workload_identity_pool_disabled" {
  description = "Whether the workload identity pool is disabled."
  type        = bool
}

variable "workload_identity_pool_display_name" {
  description = "The display name of the workload identity pool."
  type        = string

}

variable "workload_identity_pool_id" {
  description = "The ID of the workload identity pool."
  type        = string
}

variable "workload_identity_pool_provider_id" {
  description = "The ID of the workload identity pool provider."
  type        = string
}

variable "workload_identity_pool_provider_name" {
  description = "The name of the workload identity pool provider."
  type        = string
}

variable "workload_identity_pool_provider_disabled" {
  description = "Whether the workload identity pool provider is disabled."
  type        = bool
}

variable "workload_identity_pool_provider_description" {
  description = "The description of the workload identity pool provider."
  type        = string
}
