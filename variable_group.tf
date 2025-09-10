resource "azuredevops_variable_group" "groups" {
  for_each     = var.variable_groups
  project_id   = data.azuredevops_project.main.id
  name         = each.value.name
  description  = each.value.description
  allow_access = each.value.allow_access

  dynamic "variable" {
    for_each = each.value.variables
    content {
      name         = variable.value.name
      secret_value = variable.value.secret_value
      is_secret    = lookup(variable.value, "is_secret", false)
    }
  }
}
