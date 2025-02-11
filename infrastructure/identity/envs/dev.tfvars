add_terraform_attribution_label = true
project_id                      = "surf-city-softball-dev"
region                          = "us-west2"

service_accounts = {
  "terraform-sa-dev" = {
    display_name = "terraform-sa-dev"
    roles = [
      "roles/editor",
      "roles/iam.serviceAccountTokenCreator"
    ]
    members = [
      "principalSet://iam.googleapis.com/projects/286242985148/locations/global/workloadIdentityPools/surf-city-softball-id-pool-dev/*"
      ]
  }
}

workload_identity_pool_description          = "The workload identity pool for the Surf City Softball project."
workload_identity_pool_disabled             = false
workload_identity_pool_display_name         = "surf-city-softball-id-pool-dev"
workload_identity_pool_id                   = "surf-city-softball-id-pool-dev"
workload_identity_pool_provider_description = "GitHub Actions identity pool provider for automated test"
workload_identity_pool_provider_disabled    = false
workload_identity_pool_provider_id          = "surf-city-softball-id-prov-dev"
workload_identity_pool_provider_name        = "surf-city-softball-id-prov-dev"
