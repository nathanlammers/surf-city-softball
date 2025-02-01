# Required versions & sources for Terraform itself and the Google Cloud providers.
terraform {

  required_providers {

    # google cloud provider for all stable features
    google = {
      source  = "hashicorp/google"
      version = "6.16.0"
      hostname = "registry.terraform.io"
    }
    
  }

  # Version of Terraform itself.
  required_version = "1.10.3"
}
