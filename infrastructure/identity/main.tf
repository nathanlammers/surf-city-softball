# create the terraform service account
resource "google_service_account" "surf_city_softball_sa_terraform" {
  account_id   = var.terraform_sa.id
  display_name = var.terraform_sa.display_name
}

# create the IAM bindings for each service account
resource "google_service_account_iam_member" "surf_city_softball_terraform_sa_roles" {
  service_account_id = google_service_account.surf_city_softball_sa_terraform.id
  for_each           = toset(var.terraform_sa.roles)
  member             = format("%s%s", "serviceAccount:", google_service_account.surf_city_softball_sa_terraform.email)
  role               = each.value
}

# workload identity pool for keyless service account impersonation
resource "google_iam_workload_identity_pool" "surf_city_softball_wif_id_pool" {
  workload_identity_pool_id = var.wif_pool_id
  display_name              = var.wif_pool_display_name
  description               = var.wif_pool_description
  disabled                  = var.wif_pool_disabled
}

# workload identity pool provider for github actions
resource "google_iam_workload_identity_pool_provider" "surf_city_softball_wif_pool_provider" {
  workload_identity_pool_id          = var.wif_pool_id
  workload_identity_pool_provider_id = var.wif_pool_provider_id
  display_name                       = var.wif_pool_provider_name
  description                        = var.wif_pool_provider_description
  disabled                           = var.wif_pool_disabled
  attribute_condition                = var.wif_pool_provider_attribute_condition
  attribute_mapping                  = var.wif_pool_provider_attribute_mapping
  oidc {
    issuer_uri = var.wif_pool_provider_issuer_uri
  }
}

# attach the workload identity pool provider to the service account
resource "google_service_account_iam_member" "surf_city_softball_terraform_sa_members" {
  service_account_id = google_service_account.surf_city_softball_sa_terraform.name
  for_each           = toset(var.terraform_sa_wif_roles)
  member             = format("%s%s%s", "principalSet://iam.googleapis.com/", google_iam_workload_identity_pool.surf_city_softball_wif_id_pool.name, "/*")
  role               = each.key
}
