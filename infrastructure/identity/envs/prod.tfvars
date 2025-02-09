add_terraform_attribution_label = true
project_id                      = "surf-city-softball-prod"
region                          = "us-west2"

service_accounts = {
  "terraform-sa-prod" = {
    display_name = "terraform-prod"
    roles = [
      "roles/iam.workloadIdentityPoolAdmin",
      "roles/editor",
      "roles/iam.serviceAccountUser"
    ]
  }
}

workload_identity_pool_description          = "The workload identity pool for the Surf City Softball project."
workload_identity_pool_disabled             = false
workload_identity_pool_display_name         = "surf-city-softball-id-pool-prod"
workload_identity_pool_id                   = "surf-city-softball-id-pool-prod"
workload_identity_pool_provider_description = "GitHub Actions identity pool provider for automated test"
workload_identity_pool_provider_disabled    = false
workload_identity_pool_provider_id          = "surf-city-softball-id-prov-prod"
workload_identity_pool_provider_name        = "surf-city-softball-id-prov-prod"
