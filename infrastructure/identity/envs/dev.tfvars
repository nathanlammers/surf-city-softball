project_id = "surf-city-softball-dev"
region     = "us-west2"

service_accounts = {
  "terraform-sa-dev" = {
    display_name = "terraform-dev"
    roles = [
      "roles/editor",
      "roles/iam.serviceAccountUser",
    ]
  }
}