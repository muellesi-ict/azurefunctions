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

variable "node_version" {
  description = "Die Node.js-Version, die ich überall verwende"
  type        = string
  default     = "20"
}

variable "function_app_settings" {
  description = "Application settings for the Function App"
  type        = map(string)
  default = {
    "ENABLE_ORYX_BUILD"              = "true",
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true",
    "CosmosDB"                       = "AccountEndpoint=https://db-cosmos-prod-7a1dac5d.documents.azure.com:443/;AccountKey=KCFSwii8cpISoF2hWpOy02226gy0WnmSv1wqHYpzrx2rjKulMcH2s37whuVFlCmMJg5skQsL6gruACDb0IWGkA==;"
  }
}

variable "web_app_settings" {
  description = "Application settings for the Web App"
  type        = map(string)
  default = {
    "ENABLE_ORYX_BUILD"              = "true",
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true",
    "FUNC_URL"                       = "https://example-function-app.azurewebsites.net/api/getItems"
  }
}

variable "azure_storage_account_name" {
  description = "Name des Storage-Accounts"
  type        = string
  default     = "paternalargueboring"
}

variable "function_app_name" {
  description = "Name der Funcion-App"
  type        = string
  default     = "margin-lavish-stage-spindle"
}

variable "web_app_name" {
  description = "Name der Web-App"
  type        = string
  default     = "footman-chaffing-ebook-autograph"
}
