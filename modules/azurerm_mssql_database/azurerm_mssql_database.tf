resource "azurerm_mssql_database" "sql_database_child"{
    name = var.mssql_database_name
    server_id = data.azurerm_mssql_server.data_block_mssql_server.id
}