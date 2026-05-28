terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

# ── Resource Group ──────────────────────────────────────────────────────────
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# ── Storage Account ─────────────────────────────────────────────────────────
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = var.replication_type

  # Secure defaults
  min_tls_version           = "TLS1_2"
  enable_https_traffic_only = true
  allow_nested_items_to_be_public = false

  blob_properties {
    # ── Versioning ──────────────────────────────────────────────────────────
    versioning_enabled = true

    # Keep soft-deleted versions for 7 days (recommended alongside versioning)
    delete_retention_policy {
      days = 7
    }

    # Optional: keep soft-deleted containers for 7 days
    container_delete_retention_policy {
      days = 7
    }
  }

  tags = var.tags
}

# ── Storage Container (optional example) ────────────────────────────────────
resource "azurerm_storage_container" "example" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
