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

resource "azurerm_service_plan" "example" {
	name = var.service_plan_name
	resource_group_name = azurerm_resource_group.example.name
	location = azurerm_resource_group.example.location
	os_type = "Linux"
	sku_name = var.service_plan_sku_name
}

resource "azurerm_linux_function_app" "example" {
	name = var.function_app_name
	resource_group_name = azurerm_resource_group.example.name
        location = azurerm_resource_group.example.location
	storage_account_name = azurerm_storage_account.example.name
	storage_account_access_key = azurerm_storage_account.example.primary_access_key
	service_plan_id = azurerm_service_plan.example.id

	site_config {}
}

resource "azurerm_function_app_function" "example" {
  name            = var.function_name
  function_app_id = azurerm_linux_function_app.example.id
  language        = var.function_app_language
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = var.function_http_methods
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  })
}
