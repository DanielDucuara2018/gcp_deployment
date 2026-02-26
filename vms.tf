resource "google_compute_instance" "vm_instance" {
  name         = "docker-python-vm"
  machine_type = var.instance_type
  zone         = var.zone

  tags = ["ssh-access", "vpn-access"] # Apply this tag to match firewall rule

  boot_disk {
    initialize_params {
      image = var.ami_id
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.id
    subnetwork = google_compute_subnetwork.public_subnet.name
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }

  metadata_startup_script = file("${path.module}/resources/init.sh")

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }
}
