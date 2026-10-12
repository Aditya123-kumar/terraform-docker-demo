resource "docker_container" "nginx_from_data" {
  name  = "terraform-nginx-data"
  image = data.docker_image.nginx_existing.name

  ports {
    internal = 80
    external = 8110
  }

  networks_advanced {
    name = docker_network.terraform_network.name
  }
}