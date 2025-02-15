# create the terraform service account
resource "google_service_account" "surf_city_softball_sa_terraform" {
  account_id   = var.terraform_sa.id
  display_name = var.terraform_sa.display_name
}

# give the terraform service account the necessary roles
resource "google_project_iam_member" "surf_city_softball_terraform_sa_roles" {
  project  = var.project_id
  for_each = toset(var.terraform_sa.roles)
  member   = format("%s%s", "serviceAccount:", google_service_account.surf_city_softball_sa_terraform.email)
  role     = each.value
}

# give the terraform service account the billing role
resource "google_billing_account_iam_member" "surf_city_softball_terraform_sa_billing_role" {
  billing_account_id = var.billing_account_id
  member   = format("%s%s", "serviceAccount:", google_service_account.surf_city_softball_sa_terraform.email)
  role     = var.terraform_sa_billing_role
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
resource "google_project_iam_member" "surf_city_softball_terraform_sa_members" {
  project  = var.project_id
  role = var.terraform_sa_wif_role
  member   = format("%s%s%s", "principalSet://iam.googleapis.com/", google_iam_workload_identity_pool.surf_city_softball_wif_id_pool.name, "/*")
}
