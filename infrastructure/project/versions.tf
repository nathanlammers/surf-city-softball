# required versions & sources
terraform {

  # version of terraform itself
  required_version = "1.10.3"

  required_providers {

    # google cloud provider for all stable features
    google = {
      source  = "registry.terraform.io/hashicorp/google"
      version = "6.14.1"
    }

  }

}
