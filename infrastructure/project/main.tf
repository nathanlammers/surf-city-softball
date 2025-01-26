# creates the google cloud project
resource "google_project" "surf_city_softball_project" {

  billing_account = var.billing_account_id

  # required for the project to display in any list of firebase projects
  labels = {
    "environment" = var.environment_name
    "firebase"    = var.firebase_enabled
  }

  name       = var.project_name
  project_id = var.project_id

}

# enables required APIs
resource "google_project_service" "surf_city_softball_apis" {

  for_each = toset(var.apis)
  project  = google_project.surf_city_softball_project.project_id
  service  = each.key
}
