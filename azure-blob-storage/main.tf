resource "azurerm_resource_group" "example" {
	name = var.resource_group_name
	location = var.resource_group_location
}

resource "azurerm_storage_account" "example" {
	name = var.storage_account_name
	resource_group_name = azurerm_resource_group.example.name
	location = azurerm_resource_group.example.location
	account_tier = var.storage_account_tier
	account_replication_type = var.storage_account_replication_type
	
	tags = {
		environment = "staging"
	}
}

resource "azurerm_storage_container" "example" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example" {
  name                   = "content.zip"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = "some-local-file.zip"
}
