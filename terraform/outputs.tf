output "airflow_vm_name" {
  value       = google_compute_instance.airflow_vm.name
  description = "The name of the Airflow VM instance"
}

output "airflow_vm_private_ip" {
  value       = google_compute_instance.airflow_vm.network_interface[0].network_ip
  description = "The internal IP address of the Airflow VM"
}

output "vpc_network_name" {
  value       = google_compute_network.vpc_network.name
  description = "The name of the VPC network"
}