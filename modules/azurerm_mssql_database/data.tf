data "azurerm_mssql_server" "data_block_mssql_server"{
    name = var.sql_server_name
    resource_group_name = var.resource_group_name
}