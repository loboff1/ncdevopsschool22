output "vm_ip_address" {
  value = [ 
    for vm in google_compute_instance.ncdev :
   "ip address ${vm.name} = ${vm.network_interface.0.access_config.0.nat_ip}"
  ]
}
output "registry_ip" {
  value = google_compute_instance.registry.network_interface.0.access_config.0.nat_ip
}

