resource "google_compute_instance" "free_vm" {
  name         = "free-tier-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a" 

  # 🚩 MISCONFIG 1: Enabling IP forwarding allows the VM to route traffic 
  # like a router, which Trivy flags as a HIGH severity risk.
  can_ip_forward = true

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      type  = "pd-standard" 
      size  = 30            
    }
  }

  network_interface {
    network = "default"

    # 🚩 MISCONFIG 2: Assigning a direct public IP address to a compute 
    # instance is a classic security risk flagged by Trivy (HIGH).
    access_config {
      network_tier = "STANDARD"
    }
  }

  # 🚩 MISCONFIG 3: Granting the default service account full access 
  # to the entire Google Cloud Platform API is a CRITICAL risk.
  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}