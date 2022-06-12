output "internal_ip_address_dvps" {
  value = yandex_compute_instance.dvps.network_interface.0.ip_address
}

output "external_ip_address_dvps" {
  value = yandex_compute_instance.dvps.network_interface.0.nat_ip_address
}