// Declare global variables
// Set the variable value in *.tfvars file
// or using -var="do_token=..." CLI option
// or set an env var with export TF_VAR_do_token="..."
variable "do_token" {
  description = "Your DigitalOcean API token."
}

variable "ssh_key_name" {
  type        = "string"
}