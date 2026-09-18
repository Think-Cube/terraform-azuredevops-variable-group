# Example: Basic — Azure DevOps Variable Group

Provisions a variable group with one plain and one secret variable, accessible to all project pipelines.

```hcl
module "variable_group" {
  source = "github.com/Think-Cube/terraform-azuredevops-variable-group?ref=v1.0.0"

  project_id   = "00000000-1111-2222-3333-444444444444"
  name         = "vg-myapp-prod"
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

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_variable_group"></a> [variable\_group](#module\_variable\_group) | github.com/Think-Cube/terraform-azuredevops-variable-group | v1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
