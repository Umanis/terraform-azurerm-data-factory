resource "azurerm_monitor_diagnostic_setting" "standard" {
  name                           = "standard_metrics"
  target_resource_id             = azurerm_data_factory.factory.id
  log_analytics_workspace_id     = var.standard_analytics_workspace_id
  log_analytics_destination_type = "Dedicated"

  count = local.enable_standard_metrics ? 1 : 0

  dynamic "log" {
    for_each = toset(local.logs)
    content {
      category = log.key
      enabled  = true

      retention_policy {
        enabled = local.enable_retention
        days    = local.metrics_retention_days
      }
    }
  }

  dynamic "log" {
    for_each = toset(var.disabled_logs)
    content {
      category = log.key
      enabled  = false

      retention_policy {
        enabled = false
        days    = 0
      }
    }
  }


  dynamic "metric" {
    for_each = toset(local.metrics)
    content {
      category = metric.key
      enabled  = true

      retention_policy {
        enabled = local.enable_retention
        days    = local.metrics_retention_days
      }
    }
  }
}


resource "azurerm_monitor_diagnostic_setting" "monitoring" {
  name                           = "monitoring_metrics"
  target_resource_id             = azurerm_data_factory.factory.id
  log_analytics_workspace_id     = var.monitoring_workspace_id
  log_analytics_destination_type = "Dedicated"

  count = local.enable_monitoring_metrics ? 1 : 0

  dynamic "log" {
    for_each = toset(var.disabled_logs)
    content {
      category = log.key
      enabled  = false

      retention_policy {
        enabled = false
        days    = 0
      }
    }
  }

  dynamic "log" {
    for_each = toset(local.logs)
    content {
      category = log.key
      enabled  = true

      retention_policy {
        enabled = local.enable_retention
        days    = local.metrics_retention_days
      }
    }
  }
}
