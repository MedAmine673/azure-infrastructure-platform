terraform{
    backend "azurerm"{
        resource_group_name = "rg-tfstate"
        storage_account_name = "tfstate12347"
        container_name = "tfstate-dev"
        key = "dev.tfstate"
    }
}