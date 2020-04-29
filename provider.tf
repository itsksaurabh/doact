// Define Infrastructure providers
provider "digitalocean" {
  token = "${var.do_token}"
  version = "~> v1.14.0"
}

provider "template"{
  version = "~> 2.1"
}