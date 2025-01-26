resource "google_billing_budget" "surf_city_softball_budget" {
  billing_account = var.billing_account_id
  display_name    = var.budget_display_name
  provider = google
  amount {
    specified_amount {
      currency_code = var.budget_currency_code
      units         = var.budget_amount
    }
  }
}
