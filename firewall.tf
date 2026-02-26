resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-access"] # This matches the VM's tag
}

resource "google_compute_firewall" "allow-wireguard" {
  name    = "allow-wireguard"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "udp"
    ports    = ["51820"]
  }

  source_ranges = ["0.0.0.0/0"]  # or restrict to your home IP
  target_tags   = ["vpn-access"] # This matches the VM's tag
}