# Terraform Module — Azure DevOps Variable Group

Provisions an `azuredevops_variable_group` for storing pipeline variables and secrets in Azure DevOps.

## Usage

```hcl
module "variable_group" {
  source = "github.com/Think-Cube/terraform-azuredevops-variable-group?ref=v1.0.0"

  project_id   = "00000000-1111-2222-3333-444444444444"
  name         = "my-variable-group"
  description  = "Application configuration variables"
  allow_access = true

  variables = [
    {
      name  = "APP_ENV"
      value = "production"
    },
    {
      name         = "DB_PASSWORD"
      secret_value = "super-secret-value"
      is_secret    = true
    }
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | ~> 1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuredevops_variable_group.main](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/variable_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_access"></a> [allow\_access](#input\_allow\_access) | Whether to allow access to this variable group from all pipelines in the project. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the variable group. | `string` | `""` | no |
| <a name="input_key_vault"></a> [key\_vault](#input\_key\_vault) | Optional Azure Key Vault configuration to link to this variable group. | <pre>object({<br>    name                = string<br>    service_endpoint_id = string<br>    variables           = list(string)<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the variable group. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the Azure DevOps project in which to create the variable group. | `string` | n/a | yes |
| <a name="input_variables"></a> [variables](#input\_variables) | List of variables to add to the variable group. | <pre>list(object({<br>    name         = string<br>    value        = optional(string)<br>    secret_value = optional(string)<br>    is_secret    = optional(bool, false)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the created variable group. |
| <a name="output_name"></a> [name](#output\_name) | The name of the created variable group. |
<!-- END_TF_DOCS -->