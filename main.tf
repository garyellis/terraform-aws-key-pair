locals {
  private_key_filename = format("%s/%s", var.ssh_key_path, var.name)
  public_key_filename  = format("%s.pub", local.private_key_filename)
}

# setup the private key
resource "tls_private_key" "private_key" {
  algorithm = var.ssh_key_algorithm
}

resource "local_file" "private_key" {
  depends_on = [tls_private_key.private_key]

  sensitive_content    = tls_private_key.private_key.private_key_pem
  directory_permission = "0700"
  filename             = local.private_key_filename
  file_permission      = "0400"
}

resource "local_file" "public_key" {
  depends_on = [tls_private_key.private_key]

  content              = tls_private_key.private_key.public_key_openssh
  directory_permission = "0700"
  filename             = local.public_key_filename
  file_permission      = "0400"
}

resource "aws_key_pair" "key_pair" {
  depends_on = [tls_private_key.private_key]

  key_name   = var.name
  public_key = tls_private_key.private_key.public_key_openssh
  tags       = merge(map("Name", var.name), var.tags)
}
