# terraform-aws-key-pair
Generate ssh keys and import the public key to an AWS key-pair.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| local | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The key name | `string` | n/a | yes |
| ssh\_key\_algorithm | SSH key algorithm | `string` | `"RSA"` | no |
| ssh\_key\_path | the ssh key path. defaults to .ssh | `string` | `".ssh"` | no |
| tags | A map of tags associated to taggable resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_pair\_name | n/a |
| private\_key\_path | n/a |
| public\_key\_path | n/a |
