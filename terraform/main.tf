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
  client_id = "1a0a32de-3b2f-4790-aa90-5e14b8fb7187"
  client_secret =".5j8Q~ZMnElwru2DoOU-r5oiUJVGYgidEz~.JaWD"
  tenant_id = "31e46a46-0504-4e87-8878-5adea77cdfbe"
  subscription_id ="64db6a2c-2487-4a6f-91f2-ed6b12da00f6"
  
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
