resource "azurerm_resource_group" "example" {
	name = "example-resource"
	location = "West Europe"
}

resource "azurerm_storage_account" "example" {
	name = "storageaccountname"
	resource_group_name = azurerm_resource_group.example.name
	location = azurerm_resource_group.example.location
	account_tier = "Standard"
	account_replication_type = "GRS"
	
	tags = {
		environment = "staging"
	}
}

resource "azurerm_service_plan" "example" {
	name = "example-service"
	resource_group_name = azurerm_resource_grup.example.name
	location = azurerm_resource_group.example.location
	os_type = "Linux"
	sku_name = "P1v2"
}

resource "azurerm_linux_function_app" "example" {
	name = "example-linux-func-app"
	resource_group_name = azurerm_resource_grup.example.name
        location = azurerm_resource_group.example.location
	
	storage_account_name = azurerm_storage_account.example.name
	storage_account_access_key = azurerm_storage_account.example.primary_access_key
	service_plan_id = azurerm_service_plan.example.id

	site_config {}
}

resource "azurerm_function_app_function" "example" {
  name            = "example-function-app-function"
  function_app_id = azurerm_linux_function_app.example.id
  language        = "Python"
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
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
