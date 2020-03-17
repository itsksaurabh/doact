output "runner-id" {
  value = "${digitalocean_droplet.runner.*.id}"
}

output "runner-name" {
  value = "${digitalocean_droplet.runner.*.name}"
}

output "runner-ip" {
  value = "${digitalocean_droplet.runner.*.ipv4_address}"
}