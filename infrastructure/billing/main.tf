# Creates a new Google Cloud project.
resource "google_project" "surf_city_softball_project" {
  provider   = google.no_user_project_override

  name       = var.project_name
  project_id = var.project_id
  billing_account = data.google_billing_account.surf_city_softball_billing.id
  deletion_policy = "DELETE"

  # Required for the project to display in any list of Firebase projects.
  labels = {
    "environment" = var.environment_name
    "firebase" = "enabled"
  }
}

# Enables required APIs.
resource "google_project_service" "surf_city_softball_apis" {
  provider = google.no_user_project_override
  project  = google_project.surf_city_softball_project.project_id
  for_each = toset(var.apis)
  service = each.key

  # Don't disable the service if the resource block is removed by accident.
  disable_on_destroy = false
}