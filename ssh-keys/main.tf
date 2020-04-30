// Define SSH key resources to allow you to manage SSH keys for Droplet access. 
// Keys created with this resource can be referenced in your droplet configuration via their ID or fingerprint.
resource "digitalocean_ssh_key" "user" {
  name       = "${var.ssh_key_name}-rsa"
  public_key = "${file("./user_id_rsa.pub")}"
}
