resource "google_monitoring_dashboard" "airflow_dashboard" {
  dashboard_json = <<EOF
{
  "displayName": "Airflow VM Performance Dashboard",
  "gridLayout": {
    "widgets": [
      {
        "title": "CPU Utilization",
        "xyChart": {
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" resource.type=\"gce_instance\""
              }
            }
          }]
        }
      }
    ]
  }
}
EOF
}