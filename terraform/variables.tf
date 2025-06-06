variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "North Europe"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "flypaper-upchuck-trimester-yearly"
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
  default     = "unlikable-rack-quarters-blitz"
}

variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
  default     = "proving-primary-work-rhyme"
}

variable "cosmos_db_account_name" {
  description = "The name of the Cosmos DB account"
  type        = string
  default     = "fever-retiring-reverse-iron"
}

variable "cosmos_db_name" {
  description = "The name of the Cosmos DB database"
  type        = string
  default     = "envelope-washbasin-unbounded-bobbing"
}

variable "cosmos_db_container_name" {
  description = "The name of the Cosmos DB container"
  type        = string
  default     = "require-glorifier-unscrew-untimely"
}