resource "google_compute_firewall" "allow_ssh" {
  name    = "datastream-allow-ssh"
  network = google_compute_network.vpc.id

  description = "Allow SSH access to VM for management"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}