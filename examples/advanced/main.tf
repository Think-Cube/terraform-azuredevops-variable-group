# Variable group linked to Azure Key Vault — secrets are pulled automatically
module "variable_group_keyvault" {
  source = "../.."

  project_id   = "00000000-1111-2222-3333-444444444444"
  name         = "vg-myapp-keyvault-prod"
  description  = "Secrets sourced from Key Vault for production pipelines"
  allow_access = true

  key_vault = {
    name                = "kv-myapp-prod"
    service_endpoint_id = "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee"
    variables           = ["db-connection-string", "storage-account-key", "api-key"]
  }

  # Plain variables can still be added alongside key vault variables
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

# Separate group for non-secret pipeline config
module "variable_group_config" {
  source = "../.."

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
