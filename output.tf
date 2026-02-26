output "static_ip" {
  value       = google_compute_address.static_ip.address
  description = "Static IP to whitelist on crypto.com OTC"
}
