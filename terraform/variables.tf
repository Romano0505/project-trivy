variable "project_id" {
  type        = string
  description = "The Google Cloud Project ID"
}

variable "region" {
  type        = string
  description = "The target GCP region for resources"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "The target GCP zone for the VM"
  default     = "us-central1-a"
}
