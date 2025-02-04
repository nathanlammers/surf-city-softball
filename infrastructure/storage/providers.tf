provider "google" {
  add_terraform_attribution_label = var.add_terraform_attribution_label
  project = var.project_id
  region  = var.region
}
