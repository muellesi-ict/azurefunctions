provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "1e8c48fb-7b50-41d8-bc34-83473faeb371"
}
