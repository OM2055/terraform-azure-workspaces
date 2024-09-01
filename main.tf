resource "tfe_organization" "test" {
  name  = "TCS_BG"
  email = "omkar.singh1@tcs.com"
}

resource "tfe_workspace" "test" {
  name         = "TEST"
  organization = tfe_organization.test.name
}

resource "tfe_variable" "test" {
  key          = "my_key_name"
  value        = "my_value_name"
  category     = "terraform"
  workspace_id = tfe_workspace.test.id
  description  = "a useful description"
}