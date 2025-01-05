# Terraform configuration to set up providers by version.
terraform {
  required_providers {
    
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "6.14.1"
    }
  }
}

provider "google-beta" {
  user_project_override = true
}

# Configures the provider to not use the resource block's specified project for quota checks.
# This provider should only be used during project creation and initializing services.
provider "google-beta" {
  alias = "no_user_project_override"
  user_project_override = false
}

# Creates a new Google Cloud project.
resource "google_project" "default" {
  provider   = google-beta.no_user_project_override

  name       = "surf-city-softball-dev"
  project_id = "surf-city-softball-dev"

  # Required for the project to display in any list of Firebase projects.
  labels = {
    "firebase" = "enabled"
  }
}

# Enables required APIs.
resource "google_project_service" "default" {
  provider = google-beta.no_user_project_override
  project  = google_project.default.project_id
  for_each = toset([
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "firebase.googleapis.com",
    # Enabling the ServiceUsage API allows the new project to be quota checked from now on.
    "serviceusage.googleapis.com",
  ])
  service = each.key

  # Don't disable the service if the resource block is removed by accident.
  disable_on_destroy = false
}

# Enables Firebase services for the new project created above.
resource "google_firebase_project" "default" {
  provider = google-beta
  project  = google_project.default.project_id

  # Waits for the required APIs to be enabled.
  depends_on = [
    google_project_service.default
  ]
}

# Creates a Firebase Android App in the new project created above.
resource "google_firebase_apple_app" "default" {
  provider = google-beta
  bundle_id = "wedge.surf-city-softball"
  project      = google_project.default.project_id
  display_name = "Surf City Softball"

  # Wait for Firebase to be enabled in the Google Cloud project before creating this App.
  depends_on = [
    google_firebase_project.default,
  ]
}

resource "google_firestore_database" "database" {
  project     = "surf-city-softball-dev"
  name        = "surf-city-softball-dev"
  location_id = "us-west2"
  type        = "FIRESTORE_NATIVE"
}