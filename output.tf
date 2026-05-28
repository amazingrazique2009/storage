output "storage_account_id" {
  description = "Resource ID of the storage account"
  value       = azurerm_storage_account.sa.id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.sa.name
}

output "primary_blob_endpoint" {
  description = "Primary blob service endpoint"
  value       = azurerm_storage_account.sa.primary_blob_endpoint
}

output "primary_access_key" {
  description = "Primary access key (sensitive)"
  value       = azurerm_storage_account.sa.primary_access_key
  sensitive   = true
}
