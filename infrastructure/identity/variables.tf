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

variable "terraform_sa" {
  description = "The region for the Google Cloud project."
  type = object({
    id           = string
    display_name = string
    roles        = list(string)
  })
}

variable "terraform_sa_wif_role" {
  description = "The role for the workload identity pool provider."
  type        = string

}

variable "wif_pool_provider_attribute_condition" {
  description = "The attribute condition for the workload identity pool provider."
  type        = string
}

variable "wif_pool_provider_issuer_uri" {
  description = "The issuer URI for the workload identity pool provider."
  type        = string
}

variable "wif_pool_provider_attribute_mapping" {
  description = "The attribute mapping for the workload identity pool provider."
  type        = map(string)
}

variable "wif_pool_description" {
  description = "The description of the workload identity pool."
  type        = string
}

variable "wif_pool_disabled" {
  description = "Whether the workload identity pool is disabled."
  type        = bool
}

variable "wif_pool_display_name" {
  description = "The display name of the workload identity pool."
  type        = string

}

variable "wif_pool_id" {
  description = "The ID of the workload identity pool."
  type        = string
}

variable "wif_pool_provider_id" {
  description = "The ID of the workload identity pool provider."
  type        = string
}

variable "wif_pool_provider_name" {
  description = "The name of the workload identity pool provider."
  type        = string
}

variable "wif_pool_provider_disabled" {
  description = "Whether the workload identity pool provider is disabled."
  type        = bool
}

variable "wif_pool_provider_description" {
  description = "The description of the workload identity pool provider."
  type        = string
}
