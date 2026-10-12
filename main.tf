terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Docker Network
resource "docker_network" "terraform_network" {
  name = "terraform-network"
}

# Nginx Image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# First Nginx Container
resource "docker_container" "nginx_1" {
  name  = "terraform-nginx-1"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8085
  }

  networks_advanced {
    name = docker_network.terraform_network.name
  }
}

# Second Nginx Container
resource "docker_container" "nginx_2" {
  name  = "terraform-nginx-2"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8086
  }

  networks_advanced {
    name = docker_network.terraform_network.name
  }
}
resource "docker_container" "nginx_count" {
  count = 3

  name  = "terraform-nginx-count-${count.index + 1}"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8090 + count.index
  }

  networks_advanced {
    name = docker_network.terraform_network.name
  }
}

resource "docker_container" "nginx_each" {
  for_each = var.nginx_apps

  name  = "${local.common_prefix}-nginx-${each.key}"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = each.value
  }

  networks_advanced {
    name = docker_network.terraform_network.name
  }
}
module "nginx_blue" {
  source = "./modules/nginx"

  name         = "blue"
  port         = 8120
  image        = "nginx:latest"
  network_name = docker_network.terraform_network.name
}

module "nginx_green" {
  source = "./modules/nginx"

  name         = "green"
  port         = 8121
  image        = "nginx:latest"
  network_name = docker_network.terraform_network.name
}

