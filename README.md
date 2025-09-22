## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | 1.11.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 1.11.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuredevops_variable_group.groups](https://registry.terraform.io/providers/microsoft/azuredevops/1.11.2/docs/resources/variable_group) | resource |
| [azuredevops_project.main](https://registry.terraform.io/providers/microsoft/azuredevops/1.11.2/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azuredevops_project"></a> [azuredevops\_project](#input\_azuredevops\_project) | Name of the Azure DevOps project where variable groups will be created. | `string` | n/a | yes |
| <a name="input_variable_groups"></a> [variable\_groups](#input\_variable\_groups) | Map of variable groups to create. Each group can be of type "Normal" or "Secret".<br/>Example:<br/>variable\_groups = {<br/>  group1 = {<br/>    type        = "Normal"<br/>    name        = "NormalGroup1"<br/>    description = "Example normal variable group"<br/>    allow\_access = true<br/>    variables = [<br/>      { name = "VAR1", secret\_value = "" },<br/>      { name = "VAR2", secret\_value = "" }<br/>    ]<br/>  }<br/>  group2 = {<br/>    type        = "Secret"<br/>    name        = "SecretGroup1"<br/>    description = "Example secret variable group"<br/>    allow\_access = false<br/>    variables = [<br/>      { name = "SECRET1", secret\_value = "value1", is\_secret = true }<br/>    ]<br/>  }<br/>} | <pre>map(object({<br/>    type         = string<br/>    name         = string<br/>    description  = string<br/>    allow_access = bool<br/>    variables = list(object({<br/>      name         = string<br/>      secret_value = string<br/>      is_secret    = optional(bool, false)<br/>    }))<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_variable_group_ids"></a> [variable\_group\_ids](#output\_variable\_group\_ids) | IDs of the created Azure DevOps variable groups. |
| <a name="output_variable_group_names"></a> [variable\_group\_names](#output\_variable\_group\_names) | Names of the created Azure DevOps variable groups. |
| <a name="output_variable_group_urls"></a> [variable\_group\_urls](#output\_variable\_group\_urls) | Web URLs of the created Azure DevOps variable groups. |
