resource "azuredevops_variable_group" "main" {
  project_id   = var.project_id
  name         = var.name
  description  = var.description
  allow_access = var.allow_access

  dynamic "variable" {
    for_each = { for v in var.variables : v.name => v }
    content {
      name         = variable.value.name
      value        = variable.value.is_secret ? null : variable.value.value
      secret_value = variable.value.is_secret ? variable.value.secret_value : null
      is_secret    = variable.value.is_secret
    }
  }

  dynamic "key_vault" {
    for_each = var.key_vault != null ? [var.key_vault] : []
    content {
      name                = key_vault.value.name
      service_endpoint_id = key_vault.value.service_endpoint_id

      dynamic "key_vault_secret" {
        for_each = key_vault.value.variables
        content {
          name = key_vault_secret.value
        }
      }
    }
  }
}
