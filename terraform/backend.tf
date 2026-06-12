terraform {
  backend "gcs" {
    bucket = "project-repo-498812-terraform-state" # Change this to your unique bucket name
    prefix = "terraform/state"
  }
} 