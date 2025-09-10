variable "azuredevops_project" {
  description = "Name of the Azure DevOps project where variable groups will be created."
  type        = string
}

variable "variable_groups" {
  description = <<EOT
Map of variable groups to create. Each group can be of type "Normal" or "Secret".
Example:
variable_groups = {
  group1 = {
    type        = "Normal"
    name        = "NormalGroup1"
    description = "Example normal variable group"
    allow_access = true
    variables = [
      { name = "VAR1", secret_value = "" },
      { name = "VAR2", secret_value = "" }
    ]
  }
  group2 = {
    type        = "Secret"
    name        = "SecretGroup1"
    description = "Example secret variable group"
    allow_access = false
    variables = [
      { name = "SECRET1", secret_value = "value1", is_secret = true }
    ]
  }
}
EOT
  type = map(object({
    type         = string
    name         = string
    description  = string
    allow_access = bool
    variables = list(object({
      name         = string
      secret_value = string
      is_secret    = optional(bool, false)
    }))
  }))
}
