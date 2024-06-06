terraform {
  required_providers {
    azurerm={
        source = "hashicorp/azurerm"
        version = "2.46.0"
    }

  }
}

provider "azurerm" {
  features {
    
  }
  client_id = "217de3dd-14c6-499d-9062-ba5e1239a3ec"
  client_secret ="t2l8Q~JCABp3559sADCTVY.CneJ3M0sFhhy-Cdoh"
  tenant_id = "5e5a34e0-99a9-4308-a4d1-d586f6525073"
  subscription_id ="3b38742b-11a9-4933-9dd1-267a806bc59a"
  
}

terraform {
  backend "azurerm" {
    resource_group_name = "#{ResourceGroupName}#"
    storage_account_name = "#{terraformstorageaccount}#"
    container_name = "con2"
    key = "prod.terraform.tfstate"
    
  }
}

variable "rgname" {}
variable "location" {}
variable "aspname" {}
variable "webappname" {}


module "web_mysql"{
    source = "./modules"
    rgname=var.rgname
    location=var.location
    aspname=var.aspname
    webappname=var.webappname
}
