resource "google_firestore_database" "surf_city_softball_firestore" {
  project     = var.project_id
  name        = var.database_name
  location_id = var.region
  type        = var.database_type
}