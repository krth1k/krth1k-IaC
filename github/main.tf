terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.11.1"
    }
  }

  backend "s3" {
    bucket  = "krth1k-terraform-backend"
    key     = "krth1k-IaC/github/terraform.tfstate"
    region  = "ap-south-1"
    profile = "personal"
  }
}

provider "github" {
  token = var.github_token
}

resource "github_repository" "atlas" {
  name        = "Atlas"
  description = "Portfolio infrastructure and web presence"
  visibility  = "public"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}

resource "github_repository" "atlas_tui" {
  name        = "Atlas-TUI"
  description = "SSH-accessible TUI portfolio interface"
  visibility  = "public"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}

resource "github_repository" "krth1k_iac" {
  name        = "krth1k-IaC"
  description = "Homelab infrastructure as code — Ansible + Terraform"
  visibility  = "public"

  has_issues   = true
  has_projects = false
  has_wiki     = false

  delete_branch_on_merge = true
}
