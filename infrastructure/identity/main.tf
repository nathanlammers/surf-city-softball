resource "google_service_account" "surf_city_softball_service_accounts" {
  for_each = var.service_accounts
  account_id   = each.key
  display_name = each.value.display_name
}

resource "google_service_account_iam_member" "surf_city_softball_bindings" {

    for_each = tomap({
    for sa_role in local.service_account_roles : format("%s%s%s", sa_role.sa_key, ".", sa_role.role) => sa_role
  })

    service_account_id = each.value.service_account_id
    member = each.value.member
    role = each.value.role
}

locals {
    service_account_roles = flatten([
        for sa_key, sa in var.service_accounts:
            [
            for role in sa.roles : {
                
                member = format("%s%s", "serviceAccount:", google_service_account.surf_city_softball_service_accounts[sa_key].email)
                service_account_id = google_service_account.surf_city_softball_service_accounts[sa_key].name
                sa_key = sa_key
                role = role
            }
            ]
    ])
}
