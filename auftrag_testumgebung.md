# Terraform Setup Guide

## Step 1: Create a Variables File

1. **Create a `variables.tf` File:**

   In your Terraform project directory, create a new file named:

   ```
   variables.tf
   ```

2. **Declare Variables:**

   In the `variables.tf` file, declare variables for any values that you want to reuse or that might change.

   ```
   variable "location" {
     description = "The Azure region where resources will be deployed"
     type        = string
     default     = "North Europe"
   }
   ```

   ```
   variable "resource_group_name" {
     description = "The name of the resource group"
     type        = string
     default     = "test-dev-sql"
   }
   ```

   ```
   variable "app_service_plan_name" {
     description = "The name of the App Service Plan"
     type        = string
     default     = "ASP-testdev-b8ae"
   }
   ```

   ```
   variable "app_service_name" {
     description = "The name of the App Service"
     type        = string
     default     = "azurewebsitesnet"
   }
   ```

   ```
   variable "cosmos_db_account_name" {
     description = "The name of the Cosmos DB account"
     type        = string
     default     = "db-cosmos-prod-7a1dac5d"
   }
   ```

   ```
   variable "cosmos_db_name" {
     description = "The name of the Cosmos DB database"
     type        = string
     default     = "DemoDatabase"
   }
   ```

   ```
   variable "cosmos_db_container_name" {
     description = "The name of the Cosmos DB container"
     type        = string
     default     = "Items"
   }
   ```

## Step 2: Use Variables in Your Main Configuration

1. **Create a `main.tf` File:**

   In your Terraform project directory, create a new file named:

   ```
   main.tf
   ```

2. **Reference Variables in `main.tf`:**

   ```
   provider "azurerm" {
     features {}
   }
   ```

   ```
   resource "azurerm_resource_group" "example" {
     name     = var.resource_group_name
     location = var.location
   }
   ```

   ```
   resource "azurerm_app_service_plan" "example" {
     name                = var.app_service_plan_name
     location            = azurerm_resource_group.example.location
     resource_group_name = azurerm_resource_group.example.name
     kind                = "Linux"
     reserved            = true

     sku {
       tier = "Free"
       size = "F1"
     }
   }
   ```

   ```
   resource "azurerm_app_service" "example" {
     name                = var.app_service_name
     location            = azurerm_resource_group.example.location
     resource_group_name = azurerm_resource_group.example.name
     app_service_plan_id = azurerm_app_service_plan.example.id

     site_config {
       linux_fx_version = "NODE|20-lts"
     }
   }
   ```

   ```
   resource "azurerm_cosmosdb_account" "example" {
     name                = var.cosmos_db_account_name
     location            = azurerm_resource_group.example.location
     resource_group_name = azurerm_resource_group.example.name
     offer_type          = "Standard"
     kind                = "GlobalDocumentDB"

     consistency_policy {
       consistency_level       = "BoundedStaleness"
       max_interval_in_seconds = 10
       max_staleness_prefix    = 200
     }

     geo_location {
       location          = var.location
       failover_priority = 0
     }
   }
   ```

   ```
   resource "azurerm_cosmosdb_sql_database" "example" {
     name                = var.cosmos_db_name
     resource_group_name = azurerm_resource_group.example.name
     account_name        = azurerm_cosmosdb_account.example.name
   }
   ```

   ```
   resource "azurerm_cosmosdb_sql_container" "example" {
     name                = var.cosmos_db_container_name
     resource_group_name = azurerm_resource_group.example.name
     account_name        = azurerm_cosmosdb_account.example.name
     database_name       = azurerm_cosmosdb_sql_database.example.name
     partition_key_path  = "/id"
   }
   ```

## Step 3: Initialize Terraform

Run the following command to initialize Terraform:

```
terraform init
```

## Step 4: Plan the Deployment

Run the following command to create an execution plan:

```
terraform plan
```

## Step 5: Apply the Configuration

Apply the configuration to create the resources in Azure:

```
terraform apply
```

You will be prompted to confirm that you want to create the resources. Type `yes` and press Enter.

### Explanation:

- **Provider Block**: Configures the Azure provider.
- **Resource Group**: Creates a resource group in the specified location.
- **App Service Plan**: Defines an App Service Plan with the Free tier (`F1`) and Linux as the operating system.
- **App Service**: Creates an App Service with Node 20 LTS as the runtime stack.
- **Cosmos DB Account**: Sets up a Cosmos DB account with specified consistency policies and geo-location.
- **SQL Database and Container**: Creates a database and container within Cosmos DB.

This configuration will set up an Azure App Service and Cosmos DB using Terraform, adhering to best practices for maintainability and clarity.
