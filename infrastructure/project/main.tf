# Creates a new Google Cloud project.
resource "google_project" "surf_city_softball_project" {

  billing_account = var.billing_account_id

  # Required for the project to display in any list of Firebase projects.
  labels = {
    "environment" = var.environment_name
    "firebase"    = var.firebase_enabled
  }

  name            = var.project_name
  project_id      = var.project_id

}

# Enables required APIs.
resource "google_project_service" "surf_city_softball_apis" {
  disable_on_destroy = false
  for_each = toset(var.apis)
  project  = google_project.surf_city_softball_project.project_id
  service  = each.key
}
