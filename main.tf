locals {
  docker_registry_url = "https://index.docker.io"
  docker_image_name   = "jalalhejazi/container-webapp"
  docker_image_tag    = "latest"
}

resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}

# Desired state: Resource Group
resource "azurerm_resource_group" "group" {
  name     = "${var.project_name}-${random_integer.suffix.result}"
  location = var.region

  tags = {
    description = var.description,
    environment = var.environment,
    owner       = var.owner
  }
}

# Desired state: App Service Plan (Hardware to use)
resource "azurerm_app_service_plan" "plan" {
  name                = "${var.region}-${var.environment}-${var.project_name}-service-plan-${random_integer.suffix.result}"
  location            = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name

  kind     = "Linux"
  reserved = true

  sku {
    tier = "Basic"
    size = "B1"
  }
  tags = {
    description = var.description,
    environment = var.environment,
    owner       = var.owner
  }
}

resource "azurerm_app_service" "myapp" {
  name                = "${var.project_name}-${var.region}-${random_integer.suffix.result}"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|${local.docker_image_name}:${local.docker_image_tag}"

    always_on = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = local.docker_registry_url
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    description = var.description,
    environment = var.environment,
    owner       = var.owner
  }
}


output "hostname" {
  value = "https://${azurerm_app_service.myapp.default_site_hostname}"
}

