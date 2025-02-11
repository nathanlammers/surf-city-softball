# create each service account
resource "google_service_account" "surf_city_softball_service_accounts" {
  for_each     = var.service_accounts
  account_id   = each.key
  display_name = each.value.display_name
}

# expression to flatten the service account roles into a list of objects
locals {
  service_account_roles = flatten([
    for sa_key, sa in var.service_accounts :
    [
      for role in sa.roles :

      [for member in sa.members :

        {

          member             = member
          service_account_id = google_service_account.surf_city_softball_service_accounts[sa_key].name
          sa_key             = sa_key
          role               = role
        }
      ]
    ]
  ])
}

# create the IAM bindings for each service account
resource "google_service_account_iam_member" "surf_city_softball_bindings" {

  for_each = tomap({
    for sa_role in local.service_account_roles : format("%s%s%s", sa_role.sa_key, ".", sa_role.role) => sa_role
  })

  service_account_id = each.value.service_account_id
  member             = each.value.member
  role               = each.value.role
}

# workload identity pool for keyless service account impersonation
resource "google_iam_workload_identity_pool" "example" {
  workload_identity_pool_id = var.workload_identity_pool_id
  display_name              = var.workload_identity_pool_display_name
  description               = var.workload_identity_pool_description
  disabled                  = var.workload_identity_pool_disabled
}

resource "google_iam_workload_identity_pool_provider" "example" {
  workload_identity_pool_id          = var.workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id
  display_name                       = var.workload_identity_pool_provider_name
  description                        = var.workload_identity_pool_provider_description
  disabled                           = var.workload_identity_pool_disabled
  attribute_condition                = <<EOT
    attribute.repository == "wedge-llc/surf-city-softball" &&
    attribute.repository_id == "910965414" &&
    assertion.ref == "refs/heads/master"
EOT
  attribute_mapping = {
    "google.subject"          = "assertion.sub"
    "attribute.actor"         = "assertion.actor"
    "attribute.aud"           = "assertion.aud"
    "attribute.repository"    = "assertion.repository"
    "attribute.repository_id" = "assertion.repository_id"
    "attribute.ref"           = "assertion.ref"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}
