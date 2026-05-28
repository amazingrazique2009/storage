variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "rg-storage-demo"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Globally unique storage account name (3–24 lowercase alphanumeric chars)"
  type        = string
  default     = "stversioning001"
}

variable "replication_type" {
  description = "Storage replication type: LRS | GRS | RAGRS | ZRS | GZRS"
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "Name of the blob container"
  type        = string
  default     = "mycontainer"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
