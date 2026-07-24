# Enable the Artifact Registry API for this project
resource "google_project_service" "artifact_registry" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"

  disable_on_destroy = false
}

# Provision a private Docker repository in Artifact Registry
resource "google_artifact_registry_repository" "datastream_repo" {
  location      = var.region
  repository_id = "datastream-repo"
  description   = "Private Docker repository for DataStream Airflow images"
  format        = "DOCKER"

  depends_on = [google_project_service.artifact_registry]
}