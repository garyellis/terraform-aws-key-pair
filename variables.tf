variable "ssh_key_algorithm" {
  description = "SSH key algorithm"
  type        = string
  default     = "RSA"
}

variable "name" {
  description = "The key name"
  type        = string
}

variable "ssh_key_path" {
  description = "the ssh key path. defaults to ./.ssh"
  type        = string
  default     = ".ssh"
}

variable "tags" {
  description = "A map of tags applied to taggable resources"
  type        = map(string)
  default     = {}
}
