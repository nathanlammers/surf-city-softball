# Create a network and subnet for the Surf City Softball application
resource "google_compute_network" "surf_city_softball_network" {
  auto_create_subnetworks = var.auto_create_subnetworks
  name                    = var.network_name
  project                 = var.project_id
}

resource "google_compute_subnetwork" "surf_city_softball_subnet" {
  name          = var.subnet_name
  region        = var.region
  network       = google_compute_network.surf_city_softball_network.name
  ip_cidr_range = var.subnet_cidr_range
}
