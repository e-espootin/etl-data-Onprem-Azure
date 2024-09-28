output "data_factory_name" {
  value = azurerm_data_factory.main.name
}

output "data_factory_pipeline_name" {
  value = azurerm_data_factory_pipeline.test.name
}
