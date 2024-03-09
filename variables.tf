variable "resource_group_name" {
  type = string
  description = "resource group name"
}

variable "resource_group_location" {
  type = string
  description = "resource group location"
}

variable "storage_account_name" {
  type = string
  description = "storage account name"
}

variable "Environment" {
  type = string
  description = "Specify if Environment is Dev or Prod"
}