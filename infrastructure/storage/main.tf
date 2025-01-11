resource "google_storage_bucket" "surf_city_softball_terraform_state" {
  name          = var.environment_name
  location      = "US"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  labels = {
    environment = var.environment_name
  }
}