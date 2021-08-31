output "name" {
  value       = azurerm_data_factory.factory.name
  description = "The instance name."
}

output "identity" {
  value       = azurerm_data_factory.factory.identity
  description = "The assigned identity."
}
