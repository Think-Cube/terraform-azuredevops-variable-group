variable "project_id" {
  description = "The ID of the Azure DevOps project in which to create the variable group."
  type        = string
}

variable "name" {
  description = "The name of the variable group."
  type        = string
}

variable "description" {
  description = "The description of the variable group."
  type        = string
  default     = ""
}

variable "allow_access" {
  description = "Whether to allow access to this variable group from all pipelines in the project."
  type        = bool
  default     = true
}

variable "variables" {
  description = "List of variables to add to the variable group."
  type = list(object({
    name         = string
    value        = optional(string)
    secret_value = optional(string)
    is_secret    = optional(bool, false)
  }))
  default = []
}

variable "key_vault" {
  description = "Optional Azure Key Vault configuration to link to this variable group."
  type = object({
    name                = string
    service_endpoint_id = string
    variables           = list(string)
  })
  default = null
}
