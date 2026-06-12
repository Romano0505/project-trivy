resource "google_compute_instance" "airflow_vm" {
  name         = "airflow-vm"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.id

    access_config {}
  }

  metadata_startup_script = file("${path.module}/../scripts/startup.sh")

  service_account {
    email  = google_service_account.airflow_sa.email
    scopes = ["cloud-platform"]
  }
}