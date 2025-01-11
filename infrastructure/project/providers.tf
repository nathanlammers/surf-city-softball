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