add_terraform_attribution_label = true
project_id                      = "surf-city-softball-dev"
region                          = "us-west2"

terraform_sa = {
  id           = "terraform-sa-dev"
  display_name = "terraform-sa-dev"
  roles = [
    "roles/editor"
  ]
}

terraform_sa_wif_role                 = "roles/iam.workloadIdentityUser"
wif_pool_description                  = "The workload identity pool for the Surf City Softball project."
wif_pool_disabled                     = false
wif_pool_display_name                 = "surf-city-softball-wif-pool-dev"
wif_pool_id                           = "surf-city-softball-wif-pool-dev"
wif_pool_provider_description         = "GitHub Actions identity pool provider for automated test"
wif_pool_provider_disabled            = false
wif_pool_provider_id                  = "surf-city-softball-wif-prov-dev"
wif_pool_provider_name                = "surf-city-softball-wif-prov-dev"
wif_pool_provider_attribute_condition = <<EOT
    attribute.repository == "wedge-llc/surf-city-softball" &&
    attribute.repository_id == "910965414" &&
    assertion.ref == "refs/heads/master"
EOT

wif_pool_provider_attribute_mapping = {
  "google.subject"          = "assertion.sub"
  "attribute.actor"         = "assertion.actor"
  "attribute.aud"           = "assertion.aud"
  "attribute.repository"    = "assertion.repository"
  "attribute.repository_id" = "assertion.repository_id"
  "attribute.ref"           = "assertion.ref"
}
wif_pool_provider_issuer_uri = "https://token.actions.githubusercontent.com"
