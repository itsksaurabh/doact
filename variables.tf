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
  default     = "1gb"
}

variable "region" {
  description = "Selected data center."
  type        = "string"
  default     = "blr1"
}

variable "github_username" {
  description = "Github Username."
  type        = "string"
}

variable "github_repo_name" {
  description = "Name of the target repository."
  type        = "string"
}

variable "github_access_token" {
  description = "Personal access token for the admin access to the repository"
  type        = "string"
}

variable "ssh_key_ids" {
  type = "list"
  description = "A list of SSH IDs or fingerprints to enable in the format ["12345", "123456"]"
}
