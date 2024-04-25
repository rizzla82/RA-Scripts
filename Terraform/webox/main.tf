provider "docker" {
  host = "unix:///var/run/docker.sock"
}
resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}
resource "docker_container" "nginx-server" {
  count = 15
  name = "nginx-server-${count.index+1}"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = "80${count.index+1}"
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/radmin/projects/Terraform/webox/www"
    read_only = true
  }
}