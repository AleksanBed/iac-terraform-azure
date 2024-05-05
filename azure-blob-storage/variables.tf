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

variable "storage_container_name" {
	type = string
	default = "vhds"
}

variable "blob_name" {
	type = string
	default = "content.zip"
}

variable "container_access_type" {
	type = string
	default = "private"
}

variable "source_file_path" {
	type = string
	default = "some-local-file.zip"
}
