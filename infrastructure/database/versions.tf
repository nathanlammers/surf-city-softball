terraform {
  required_version = "1.10.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.16.0"
      hostname = "registry.terraform.io"
    }
  }
}
