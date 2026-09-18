# Example: Advanced — Azure DevOps Variable Group

Two groups: one linked to Azure Key Vault (secrets auto-synced), one with plain and inline-secret variables with restricted pipeline access.

```hcl
module "variable_group_keyvault" {
  source = "github.com/Think-Cube/terraform-azuredevops-variable-group?ref=v1.0.0"

  project_id   = "00000000-1111-2222-3333-444444444444"
  name         = "vg-myapp-keyvault-prod"
  description  = "Secrets sourced from Key Vault for production pipelines"
  allow_access = true

  key_vault = {
    name                = "kv-myapp-prod"
    service_endpoint_id = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
    variables           = ["db-connection-string", "storage-account-key", "api-key"]
  }

  variables = [
    {
      name  = "APP_ENV"
      value = "production"
    },
    {
      name  = "LOG_LEVEL"
      value = "warn"
    }
  ]
}

module "variable_group_config" {
  source = "github.com/Think-Cube/terraform-azuredevops-variable-group?ref=v1.0.0"

  project_id   = "00000000-1111-2222-3333-444444444444"
  name         = "vg-myapp-config-prod"
  description  = "Non-secret runtime configuration"
  allow_access = false

  variables = [
    {
      name  = "REGION"
      value = "West Europe"
    },
    {
      name  = "CONTAINER_REGISTRY"
      value = "acrMyAppProd.azurecr.io"
    },
    {
      name         = "SERVICE_PRINCIPAL_SECRET"
      secret_value = "replace-in-pipeline"
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
| <a name="module_variable_group_config"></a> [variable\_group\_config](#module\_variable\_group\_config) | github.com/Think-Cube/terraform-azuredevops-variable-group | v1.0.0 |
| <a name="module_variable_group_keyvault"></a> [variable\_group\_keyvault](#module\_variable\_group\_keyvault) | github.com/Think-Cube/terraform-azuredevops-variable-group | v1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
