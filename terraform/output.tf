output "registry_ip" {
  value = google_compute_instance.registry.network_interface.0.access_config.0.nat_ip
}
output "vm_ip" {
  [
    for vm_name in google_compute_instance.ncdev : google_compute_instance.vm_name.network_interface.0.access_config.0.nat_ip
  ]
}
#output "vm_ci_l2_ip" {
#  value = google_compute_instance.vm_ci_l2.network_interface.0.access_config.0.nat_ip
#}
