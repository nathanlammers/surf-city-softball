# Required versions & sources for Terraform itself and the Google Cloud providers.
terraform {

  required_providers {

    # google cloud provider for all stable features
    google = {
      source  = "registry.terraform.io/hashicorp/google"
      version = "6.14.1"
    }

  }

  # Version of Terraform itself.
  required_version = "1.10.3"
}
