// The droplet is used as the host runner on Digital Ocean 
// to run jobs in your GitHub Actions workflows.

# Render registration.sh using a `template_file`
data "template_file" "reg_script" {
  template = "${file("./templates/register.sh.tpl")}"

   vars {
    GITHUB_ACCESS_TOKEN = "${var.github_access_token}"
    GITHUB_USERNAME     = "${var.github_username}"
    GITHUB_REPO_NAME    = "${var.github_repo_name}"
  }
}

data "template_cloudinit_config" "script" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.reg_script.rendered}"
  }
}

resource "digitalocean_droplet" "runner" {
  name      = "${var.github_repo_name}-self-hosted-runner-${format("%02d", count.index + 1)}"
  count     = "${var.runner_node_count}"
  size      = "${var.node_size}"
  image     = "${var.ubuntu}"
  region    = "${var.region}"
  ssh_keys  = ["${var.ssh_key_ids}"]
  user_data = "${data.template_cloudinit_config.script.rendered}"
}