output "network_id" {
  value = google_compute_network.surf_city_softball_network.id
}

output "subnet_id" {
  value = google_compute_subnetwork.surf_city_softball_subnet.id
}

output "network_self_link" {
  description = "The self link of the network"
  value       = google_compute_network.surf_city_softball_network.self_link
}

output "subnet_self_link" {
  description = "The self link of the subnet"
  value       = google_compute_subnetwork.surf_city_softball_subnet.self_link
}
