// Declare global variables
// Set the variable value in *.tfvars file
// or using -var="do_token=..." CLI option
// or set an env var with export TF_VAR_do_token="..."
variable "do_token" {
  description = "Your DigitalOcean API token."
}

variable "runner_node_count" {
  description = "Number of runner Droplets to provision."
  default     = 1
}

variable "ubuntu" {
  description = "Default Ubuntu LTS image."
  type        = "string"
  default     = "ubuntu-18-04-x64"
}

variable "node_size" {
  description = "Selected size for your provisioned Droplets."
  type        = "string"
  default     = "512mb"
}

variable "region" {
  description = "Selected data center."
  type        = "string"
  default     = "blr1"
}

variable "project" {
  description = "Project name used for resource naming."
  type        = "string"
}
