variable "location" {
  description = "location"
  type        = string
  default     = "North Europe"
}

variable "resource_group_name" {
  description = "resource_group_name"
  type        = string
  default     = "flypaper-upchuck-trimester-yearly"
}

variable "app_service_plan_name" {
  description = "app_service_plan_name"
  type        = string
  default     = "unlikable-rack-quarters-blitz"
}

variable "app_service_name" {
  description = "app_service_name"
  type        = string
  default     = "proving-primary-work-rhyme"
}

variable "cosmos_db_account_name" {
  description = "cosmos_db_account_name"
  type        = string
  default     = "fever-retiring-reverse-iron"
}

variable "cosmos_db_name" {
  description = "cosmos_db_name"
  type        = string
  default     = "envelope-washbasin-unbounded-bobbing"
}

variable "cosmos_db_container_name" {
  description = "cosmos_db_container_name"
  type        = string
  default     = "require-glorifier-unscrew-untimely"
}

variable "node_version" {
  description = "node_version"
  type        = string
  default     = "20"
}

variable "function_app_settings" {
  description = "function_app_settings"
  type        = map(string)
  default = {
    "ENABLE_ORYX_BUILD"              = "true",
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true",
    "CosmosDB"                       = "AccountEndpoint=https://db-cosmos-prod-7a1dac5d.documents.azure.com:443/;AccountKey=KCFSwii8cpISoF2hWpOy02226gy0WnmSv1wqHYpzrx2rjKulMcH2s37whuVFlCmMJg5skQsL6gruACDb0IWGkA==;"
  }
}

variable "web_app_settings" {
  description = "web_app_settings"
  type        = map(string)
  default = {
    "ENABLE_ORYX_BUILD"              = "true",
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true",
    "FUNC_URL"                       = "https://margin-lavish-stage-spindle.azurewebsites.net/api/items?"
  }
}

variable "azure_storage_account_name" {
  description = "azure_storage_account_name"
  type        = string
  default     = "paternalargueboring"
}

variable "function_app_name" {
  description = "function_app_name"
  type        = string
  default     = "margin-lavish-stage-spindle"
}

variable "web_app_name" {
  description = "web_app_name"
  type        = string
  default     = "footman-chaffing-ebook-autograph"
}
