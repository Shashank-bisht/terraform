terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = "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"
}

# Add a user to the organization
resource "github_repository" "terraform-first-repo" {
  name        = "first_repo_from_terraform"
  description = "test repo for terraform"
  visibility = "public"
  auto_init = true
}

resource "github_repository" "terraform-second-repo" {
  name        = "second_repo_from_terraform"
  description = "test repo for terraform"
  visibility = "public"
  auto_init = true
}