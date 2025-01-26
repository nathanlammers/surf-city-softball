variable "add_terraform_attribution_label" {
  description = "Whether to add the Terraform attribution label to resources"
  type        = bool
  default     = true
}

variable "billing_account_id" {
  description = "The ID of the billing account to associate with the project"
  type        = string
}

variable "budget_amount" {
  description = "The amount to set for the budget"
  type        = string
}

variable "budget_currency_code" {
  description = "The currency code to use for the budget"
  type        = string
}

variable "budget_display_name" {
  description = "The display name of the budget"
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

variable "user_project_override" {
  description = "The project to use for user project override"
  type        = bool
}
