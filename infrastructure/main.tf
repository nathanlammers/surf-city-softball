# Terraform configuration to set up providers by version.
terraform {
  required_providers {

    # Google Cloud provider for all stable features.
    google = {
      source  = "hashicorp/google"
      version = "6.14.1"
    }
    
    # Google Cloud provider for beta features (Firebase).
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "6.14.1"
    }
  }
}

# Configures the providers to not use the resource block's specified project for quota checks.
# This provider should only be used during project creation and initializing services.
provider "google" {
  alias = "no_user_project_override"
  user_project_override = false
}

provider "google-beta" {
  alias = "no_user_project_override"
  user_project_override = false
}

# Retrieve data from the Google Cloud Billing Account.
data "google_billing_account" "surf_city_softball_billing" {
  open = true
  billing_account = "0156BD-FE9F44-8E2226"
}

# Set a budget for the project.
resource "google_billing_budget" "surf_city_softball_budget" {
  billing_account = data.google_billing_account.surf_city_softball_billing.id
  amount {
    specified_amount {
      currency_code = "USD"
      units = "5"
    }
  }
  
  # Waits for the required APIs to be enabled.
  depends_on = [
    google_project_service.surf_city_softball_apis
  ]
}

# Creates a new Google Cloud project.
resource "google_project" "surf_city_softball_project" {
  provider   = google.no_user_project_override

  name       = "surf-city-softball-dev"
  project_id = "surf-city-softball-dev"
  billing_account = data.google_billing_account.surf_city_softball_billing.id
  deletion_policy = "DELETE"

  # Required for the project to display in any list of Firebase projects.
  labels = {
    "environment" = "dev"
    "firebase" = "enabled"
  }
}

# Enables required APIs.
resource "google_project_service" "surf_city_softball_apis" {
  provider = google.no_user_project_override
  project  = google_project.surf_city_softball_project.project_id
  for_each = toset([
    "billingbudgets.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "firebase.googleapis.com",
    "firestore.googleapis.com",
    "serviceusage.googleapis.com",
  ])
  service = each.key

  # Don't disable the service if the resource block is removed by accident.
  disable_on_destroy = false
}

# Enables Firebase services for the new project created above.
resource "google_firebase_project" "surf_city_softball_firebase_project" {
  provider = google-beta
  project  = google_project.surf_city_softball_project.project_id

  # Waits for the required APIs to be enabled.
  depends_on = [
    google_project_service.surf_city_softball_apis
  ]
}

# Creates a Firebase Apple App in the new project created above.
resource "google_firebase_apple_app" "surf_city_softball_firebase_apple_app" {
  provider = google-beta
  bundle_id = "wedge.surf-city-softball"
  project      = google_project.surf_city_softball_project.project_id
  display_name = "Surf City Softball (Dev)"

  # Wait for Firebase to be enabled in the Google Cloud project before creating this App.
  depends_on = [
    google_firebase_project.surf_city_softball_firebase_project
  ]
}

resource "google_firestore_database" "surf_city_softball_firestore" {
  project     = "surf-city-softball-dev"
  name        = "surf-city-softball-dev"
  location_id = "us-west2"
  type        = "FIRESTORE_NATIVE"

  depends_on = [
    google_project.surf_city_softball_project,
    google_project_service.surf_city_softball_apis
  ]
}