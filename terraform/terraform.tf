# CI & DEV VIRTUAL MACHINES
resource "google_compute_address" "static" {
  count     = length(var.vm_name)
  name      =  "${var.vm_name[count.index]}-gh"
  region    =  var.region
}
resource "google_compute_instance" "ncdev" {
  count         = length(var.vm_name)
  name          = "${var.vm_name[count.index]}-gh"
  machine_type  = var.machine_type
  zone          = var.zone
  tags          = var.main_tags
  boot_disk {
    initialize_params {
      size  = "30"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = var.network
    access_config {
            nat_ip = google_compute_address.static[count.index].address
    }
  }
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
  }
}

#REGISTRY VIRTUAL MACHINE
resource "google_compute_instance" "registry" {
  name         = "registry"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.registry_tags
  boot_disk {
    initialize_params {
      size  = "30"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network    = var.network
    network_ip = var.registry_network_ip
    access_config {
      nat_ip       = var.registry_nat_ip
      network_tier = var.network_tier
    }
  }
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
  }
}
