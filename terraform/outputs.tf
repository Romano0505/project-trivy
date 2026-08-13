output "free_vm_name" {
  value       = google_compute_instance.free_vm.name
  description = "The name of the free tier VM instance"
}

output "free_vm_private_ip" {
  value       = google_compute_instance.free_vm.network_interface[0].network_ip
  description = "The internal IP address of the free tier VM"
}

output "vpc_network_name" {
  value       = google_compute_network.vpc_network.name
  description = "The name of the VPC network"
}
