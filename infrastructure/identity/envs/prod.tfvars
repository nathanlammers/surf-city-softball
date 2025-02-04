add_terraform_attribution_label = true
project_id = "surf-city-softball-prod"
region     = "us-west2"

service_accounts = {
  "terraform-sa-prod" = {
    display_name = "terraform-prod"
    roles = [
      "roles/editor",
      "roles/iam.serviceAccountUser",
    ]
  }
}