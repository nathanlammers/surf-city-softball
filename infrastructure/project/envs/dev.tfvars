# 
apis = [
  "billingbudgets.googleapis.com",
  "cloudbilling.googleapis.com",
  "cloudresourcemanager.googleapis.com",
  "compute.googleapis.com",
  "firebase.googleapis.com",
  "firestore.googleapis.com",
  "privilegedaccessmanager.googleapis.com",
  "serviceusage.googleapis.com",
  "storage.googleapis.com"
]

api_quota_preferences = {
  "billingbudgets-quota-preference-dev" = {
    "api"              = "billingbudgets.googleapis.com"
    "preferred_value" = 1
  }
}

billing_account_id  = "0156BD-FE9F44-8E2226"
environment_name    = "dev"
firebase_enabled    = "enabled"
hostname            = "registry.terraform.io"
project_id          = "surf-city-softball-dev"
project_name        = "surf-city-softball-dev"
region              = "us-west2"
storage_bucket_name = "surf-city-softball-storage-dev"
