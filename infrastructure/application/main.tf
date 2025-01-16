resource "google_firebase_project" "surf_city_softball_firebase_project" {
  provider = google-beta
}

resource "google_firebase_apple_app" "surf_city_softball_firebase_apple_app" {
  bundle_id    = var.bundle_id
  display_name = var.display_name
  project      = var.project_id
  provider     = google-beta
}
