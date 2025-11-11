output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.main.id
}

output "storage_account_name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.main.name
}

output "container_id" {
  description = "The ID of the Storage Container."
  value       = azurerm_storage_container.task_artifacts.id
}

output "container_name" {
  description = "The name of the Storage Container."
  value       = azurerm_storage_container.task_artifacts.name
}
