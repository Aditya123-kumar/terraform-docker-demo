variable "name" {
  description = "Name of the Nginx instance"
  type        = string
}

variable "port" {
  description = "External port for Nginx"
  type        = number
}

variable "image" {
  description = "Docker image to use"
  type        = string
}

variable "network_name" {
  description = "Docker network name"
  type        = string
}