resource "docker_container" "nginx" {
  name  = "terraform-module-nginx-${var.name}"
  image = var.image

  ports {
    internal = 80
    external = var.port
  }

  networks_advanced {
    name = var.network_name
  }
}