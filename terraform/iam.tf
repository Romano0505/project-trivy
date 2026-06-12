resource "google_service_account" "airflow_sa" {
  account_id   = "airflow-sa"
  display_name = "Airflow Service Account"
}

resource "google_project_iam_member" "roles" {
  for_each = toset([
    "roles/storage.admin",
    "roles/compute.viewer"
  ])

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.airflow_sa.email}"
}