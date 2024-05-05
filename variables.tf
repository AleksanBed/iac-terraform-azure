variable "resource_group_name" {
	type = string
	default = "example-resource"
}

variable "resource_group_location" {
	type = string
	default = "West Europe"
}

variable "storage_account_name" {
	type = string
	default = "storage-account-name"
}

variable "storage_account_tier" {
	type = string
	default = "Standard"
}

variable "storage_account_replication_type" {
	type = string
	default = "GRS"
}

variable "service_plan_name" {
	type = string
	default = "example-service"
}

variable "service_plan_sku_name" {
	type = string
	default = "P1v2"
}

variable "function_app_name" {
	type = string
	default = "example-linux-func-app"
}

variable "function_app_language" {
	type = string
	default = "Python"
}

variable "function_name" {
	type = string
	default = "example-function-app-function"
}

variable "function_http_methods" {
	type = list(string)
	default = ["get", "post"]
}
