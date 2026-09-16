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