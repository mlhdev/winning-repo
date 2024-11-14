# Set the Terraform version
terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Provider configuration
provider "github" {
  token = var.github_token  # GitHub token (use Terraform variable or environment variable)
  owner = var.github_owner  # GitHub organization or username
}

# Define variables for sensitive information
variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_owner" {
  type = string
}

# Create a new GitHub repository
resource "github_repository" "winning_repo" {
  name        = "winning-repo"     # Name of the repository
  description = "A Terraform managed GitHub repository"
#  private     = true              # Set to true if you want a private repository

  # Optional settings
  visibility  = "public"           # Options: public, private, internal
  has_issues  = true               # Enable issues
  has_wiki    = true               # Enable wiki
  has_projects = false             # Enable projects
  delete_branch_on_merge = true    # Auto delete branches after PR merge
}

output "repository_url" {
  value = github_repository.winning_repo.html_url
}


