provider "google" {
  add_terraform_attribution_label = var.add_terraform_attribution_label
  billing_project                 = var.project_id
  project                         = var.project_id
  region                          = var.region
  user_project_override           = var.user_project_override
}
