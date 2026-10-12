variable "nginx_port_1" {
  description = "External port for first Nginx container"
  type        = number
  default     = 8085
}

variable "nginx_port_2" {
  description = "External port for second Nginx container"
  type        = number
  default     = 8086
}
variable "nginx_apps" {
  description = "Nginx containers and external ports"
  type        = map(number)
}
