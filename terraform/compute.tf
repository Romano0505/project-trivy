resource "google_compute_instance" "airflow_vm" {
  name         = "airflow-vm"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.id
  }

  metadata_startup_script = file("../scripts/startup.sh")

  service_account {
    email  = google_service_account.datastream_sa.email
    scopes = ["cloud-platform"]
  }
} 