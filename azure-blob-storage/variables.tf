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
