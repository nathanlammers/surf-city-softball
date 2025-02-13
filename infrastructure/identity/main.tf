# create each service account
resource "google_service_account" "surf_city_softball_service_accounts" {
  for_each     = var.service_accounts
  account_id   = each.key
  display_name = each.value.display_name
}

# workload identity pool for keyless service account impersonation
resource "google_iam_workload_identity_pool" "example" {
  workload_identity_pool_id = var.wif_pool_id
  display_name              = var.wif_pool_display_name
  description               = var.wif_pool_description
  disabled                  = var.wif_pool_disabled
}

# expression to flatten the service account roles into a list of objects
locals {
  service_account_roles = flatten([
    for sa_key, sa in var.service_accounts :
    [
      for role in sa.roles : {

        member             = format("%s%s", "serviceAccount:", google_service_account.surf_city_softball_service_accounts[sa_key].email)
        service_account_id = google_service_account.surf_city_softball_service_accounts[sa_key].name
        sa_key             = sa_key
        role               = role
      }
    ]
  ])
}

# create the IAM bindings for each service account
resource "google_service_account_iam_member" "surf_city_softball_sa_bindings" {

  for_each = tomap({
    for sa_role in local.service_account_roles : format("%s%s%s", sa_role.sa_key, ".", sa_role.role) => sa_role
  })

  service_account_id = each.value.service_account_id
  member             = each.value.member
  role               = each.value.role
}

# workload identity pool provider for github actions
resource "google_iam_workload_identity_pool_provider" "example" {
  workload_identity_pool_id          = var.wif_pool_id
  workload_identity_pool_provider_id = var.wif_pool_provider_id
  display_name                       = var.wif_pool_provider_name
  description                        = var.wif_pool_provider_description
  disabled                           = var.wif_pool_disabled
  attribute_condition                = var.wif_pool_provider_attribute_condition
  attribute_mapping = var.wif_pool_provider_attribute_mapping
  oidc {
    issuer_uri = var.wif_pool_provider_issuer_uri
  }
}
