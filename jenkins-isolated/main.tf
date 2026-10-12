
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "demo" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_network" "demo" {
  name = "jenkins-approval-demo-net"
}

resource "docker_container" "demo" {
  name  = "jenkins-approval-demo-nginx"
  image = docker_image.demo.image_id

  networks_advanced {
    name = docker_network.demo.name
  }

  ports {
    internal = 80
    external = 18080
  }
}

output "demo_url" {
  value = "http://localhost:18080"
}