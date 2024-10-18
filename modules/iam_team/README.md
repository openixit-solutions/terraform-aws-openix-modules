# IAM Team

Creates IAM resources for users (if is required), groups and memberships.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.group](https://registry.terraform.io/providers/hashicorp/aws/3.29.1/docs/resources/iam_group) | resource |
| [aws_iam_user.users](https://registry.terraform.io/providers/hashicorp/aws/3.29.1/docs/resources/iam_user) | resource |
| [aws_iam_group_membership.membership](https://registry.terraform.io/providers/hashicorp/aws/3.29.1/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy.group_policy](https://registry.terraform.io/providers/hashicorp/aws/3.29.1/docs/resources/iam_group_policy) | resource |

## Inputs

### Required

| Name | Description | Type |
|------|-------------|------|
| <a name="input_group_name"></a> [group_name](#input\_group_name) | The group's name. The name must consist of upper and lowercase alphanumeric characters with no spaces. You can also include any of the following characters: =,.@-_.. Group names are not distinguished by case. | `string` |
| <a name="input_members"></a> [members](#input\_members) | IAM user members list. | `list(string)` |

### Optional

| Name | Description | Type | Default |
|------|-------------|------|---------|
| <a name="input_group_path"></a> [group_path](#input\_group_path) | Path in which to create the group. | `string` | `/` |
| <a name="input_group_policy"></a> [group_policy](#input\_group_policy) | Team group policy to attachment. | `any` | `null` |
| <a name="input_members_path"></a> [members_path](#input\_members_path) | Path in which to create the user. | `string` | `/` |
| <a name="input_create_users"></a> [create_users](#input\_create_users) | Enable user creation. | `bool` | `false` |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of tags for the IAM Team. | `any` | `{ Terraform = true }` |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_arn"></a> [group_arn](#output\_group_arn) | The ARN assigned by AWS for this team group. |
| <a name="output_group_id"></a> [group_id](#output\_group_id) | The team group's ID. |
| <a name="output_group_name"></a> [group_name](#output\_group_name) | The team group's name. |
| <a name="output_users"></a> [users](#output\_users) | Displays the list of users. When create_users is disabled, the value is {}. |
<!-- END_TF_DOCS -->
