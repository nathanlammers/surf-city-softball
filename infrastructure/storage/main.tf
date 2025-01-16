resource "google_storage_bucket" "surf_city_softball_storage" {
  name          = var.bucket_name
  location      = var.region
  storage_class = var.storage_class

  versioning {
    enabled = var.versioning_enabled
  }

  labels = {
    environment = var.environment_name
  }
}