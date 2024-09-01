resource "tfe_organization" "test" {
  name  = "TCS_BG"
  email = "omkar.singh1@tcs.com"
}

resource "tfe_variable_set" "test" {
  name         = "Test Varset"
  description  = "Some description."
  global       = false
  organization = tfe_organization.test.name
}

resource "tfe_variable" "test-a" {
  key             = "seperate_variable"
  value           = "my_value_name"
  category        = "terraform"
  description     = "a useful description"
  variable_set_id = tfe_variable_set.test.id
}

resource "tfe_variable" "test-b" {
  key             = "another_variable"
  value           = "my_value_name"
  category        = "env"
  description     = "an environment variable"
  variable_set_id = tfe_variable_set.test.id
}