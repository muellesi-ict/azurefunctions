# Azure App Service Configuration Analysis

## Project Details

*Subscription*
```
Azure for Students
```

*Resource Group*
```
test-dev-sql
```

## Instance Details

*Name*
```
Web App name: azurewebsites.net
```

*Publish*
```
Code
```

*Runtime stack*
```
Node 20 LTS
```

*Operating System*
```
Linux
```

*Region*
```
North Europe
```

## Pricing Plans

*App Service plan*
```
ASP-testdev-b8ae (F1)
```

*Pricing plan*
```
Free F1 (Shared infrastructure)
```

## Zone Redundancy

*Zone redundancy*
```
Not enabled
```

**Note:** The minimum App Service plan instance count for zone redundancy is three.

*Current instance count*
```
One
```

*Zone redundancy status*
```
Disabled
```

# Terraform Setup Guide

## Step 3: Create a Terraform Configuration File

Create a new directory for your Terraform configuration and navigate into it. Create a file named `main.tf` and add the following configuration:

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "test-dev-sql"
  location = "North Europe"
}

resource "azurerm_app_service_plan" "example" {
  name                = "ASP-testdev-b8ae"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "azurewebsitesnet"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    linux_fx_version = "NODE|20-lts"
  }
}
```

## Step 4: Initialize Terraform

Run the following command to initialize Terraform. This will download the necessary provider plugins.

```bash
terraform init
```

## Step 5: Plan the Deployment

Run the following command to create an execution plan.

```bash
terraform plan
```

## Step 6: Apply the Configuration

Apply the configuration to create the resources in Azure.

```bash
terraform apply
```

You will be prompted to confirm that you want to create the resources. Type `yes` and press Enter.

### Explanation:

- **Provider Block**: Configures the Azure provider.
- **Resource Group**: Creates a resource group named `test-dev-sql` in the `North Europe` region.
- **App Service Plan**: Defines an App Service Plan with the Free tier (`F1`) and Linux as the operating system.
- **App Service**: Creates an App Service with Node 20 LTS as the runtime stack.

This configuration will set up an Azure App Service similar to the one described in your image. Make sure to replace placeholders and adjust configurations as necessary for your specific setup.
