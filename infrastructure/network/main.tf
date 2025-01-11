resource "google_compute_network" "surf_city_softball_network" {
  name                    = var.network_name
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "surf_city_softball_subnet" {
  name          = var.subnet_name
  region        = var.region
  network       = google_compute_network.surf_city_softball_network.name
  ip_cidr_range = var.subnet_cidr_range
}
