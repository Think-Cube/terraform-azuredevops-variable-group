output "variable_group_ids" {
  description = "IDs of the created Azure DevOps variable groups."
  value       = { for k, group in azuredevops_variable_group.groups : k => group.id }
}

output "variable_group_names" {
  description = "Names of the created Azure DevOps variable groups."
  value       = { for k, group in azuredevops_variable_group.groups : k => group.name }
}

output "variable_group_urls" {
  description = "Web URLs of the created Azure DevOps variable groups."
  value       = { for k, group in azuredevops_variable_group.groups : k => group.project_id }
}