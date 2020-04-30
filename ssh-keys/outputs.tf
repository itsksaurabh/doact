output "ssh_key_id" {
  value = "${digitalocean_ssh_key.user.id}"
}