variable "region" {
  default = "us-west-2"
}

provider "aws" {
  region = var.region
}

module "aws-key-pair" {
  source = "../"

  name = "example-keypair"
}

output "private_key_path" {
  value = module.aws-key-pair.private_key_path
}

output "public_key_path" {
  value = module.aws-key-pair.public_key_path
}

output "key_pair_name" {
  value = module.aws-key-pair.key_pair_name
}
