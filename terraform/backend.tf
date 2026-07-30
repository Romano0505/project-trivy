terraform {
  backend "gcs" {
    bucket  = "project_trivy_1"   # Replace with your actual bucket name
    prefix  = "terraform/state"    # Creates a folder inside the bucket for organization
  }
}