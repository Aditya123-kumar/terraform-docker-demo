output "nginx_1_url" {
  description = "URL of first Nginx container"
  value       = "http://localhost:${var.nginx_port_1}"
}

output "nginx_2_url" {
  description = "URL of second Nginx container"
  value       = "http://localhost:${var.nginx_port_2}"
}

output "docker_network" {
  description = "Terraform Docker network"
  value       = docker_network.terraform_network.name
}

output "project_name_upper" {
  value = local.project_name_upper
}

output "environment_upper" {
  value = local.environment_upper
}

output "project_name_clean" {
  value = local.project_name_clean
}

output "formatted_name" {
  value = local.formatted_name
}