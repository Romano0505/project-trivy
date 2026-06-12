terraform {
  backend "gcs" {
    bucket = "datastream2-tf-state" # Change this to your unique bucket name
    prefix = "terraform/state"
  }
} 