################################################################################
# data factory
################################################################################
resource "azurerm_data_factory" "main" {
  name                = "adatafactory-dev-etl-onprem"
  resource_group_name = var.resource_group
  location            = var.location
}

resource "azurerm_data_factory_pipeline" "test" {
  name            = "example_etl_pipeline"
  data_factory_id = azurerm_data_factory.main.id
  variables = {
    "bob" = "item1"
  }
 activities_json = <<JSON
[
    {
    "name": "loadIntoSQL",
    "properties": {
        "activities": [
            {
                "name": "Lookup_tablesList",
                "type": "Lookup",
                "dependsOn": [],
                "policy": {
                    "timeout": "0.12:00:00",
                    "retry": 0,
                    "retryIntervalInSeconds": 30,
                    "secureOutput": false,
                    "secureInput": false
                },
                "userProperties": [
                    {
                        "name": "configfilename",
                        "value": "lookup-config.csv"
                    }
                ],
                "typeProperties": {
                    "source": {
                        "type": "BlobSource",
                        "recursive": true
                    },
                    "dataset": {
                        "referenceName": "dataset_dev_cindia_stg_lookup_file",
                        "type": "DatasetReference",
                        "parameters": {
                            "configfilename": "lookup-config.csv"
                        }
                    },
                    "firstRowOnly": false
                }
            },
            {
                "name": "ForEach_tables",
                "type": "ForEach",
                "dependsOn": [
                    {
                        "activity": "Lookup_tablesList",
                        "dependencyConditions": [
                            "Succeeded"
                        ]
                    }
                ],
                "userProperties": [],
                "typeProperties": {
                    "items": {
                        "value": "@activity('Lookup_tablesList').output.value",
                        "type": "Expression"
                    },
                    "activities": [
                        {
                            "name": "Copy-parquet-into-mssql-tables",
                            "type": "Copy",
                            "dependsOn": [],
                            "policy": {
                                "timeout": "0.12:00:00",
                                "retry": 0,
                                "retryIntervalInSeconds": 30,
                                "secureOutput": false,
                                "secureInput": false
                            },
                            "userProperties": [],
                            "typeProperties": {
                                "source": {
                                    "type": "ParquetSource",
                                    "storeSettings": {
                                        "type": "AzureBlobStorageReadSettings",
                                        "recursive": true,
                                        "wildcardFolderPath": "uploaded-files",
                                        "wildcardFileName": {
                                            "value": "@concat(item().table, '*.parquet')",
                                            "type": "Expression"
                                        },
                                        "enablePartitionDiscovery": false
                                    },
                                    "formatSettings": {
                                        "type": "ParquetReadSettings"
                                    }
                                },
                                "sink": {
                                    "type": "SqlServerSink",
                                    "writeBehavior": "insert",
                                    "sqlWriterUseTableLock": true
                                },
                                "enableStaging": false
                            },
                            "inputs": [
                                {
                                    "referenceName": "Parquet1_test",
                                    "type": "DatasetReference"
                                }
                            ],
                            "outputs": [
                                {
                                    "referenceName": "dataset_sql_dev_cindia_stg",
                                    "type": "DatasetReference",
                                    "parameters": {
                                        "tablename": {
                                            "value": "@concat('salesLT.', item().table)",
                                            "type": "Expression"
                                        }
                                    }
                                }
                            ]
                        }
                    ]
                }
            }
        ],
        "annotations": []
    }
}
]
  JSON

}

################################################################################
# create new linked service to azure sql database
################################################################################
resource "azurerm_data_factory_linked_service_sql_server" "example" {
  name                = "linked-service-sql-dev-cindia-stg"
  data_factory_id     = azurerm_data_factory.main.id
  #connection_string   = "Server=tcp:${var.mssql_instance}.database.windows.net,1433;Initial Catalog=${var.mssql_database};User ID=${var.mssql_user};Password=${var.mssql_password};Trusted_Connection=True;Encrypt=True;Connection Timeout=30;" 
  connection_string   = "Server=tcp:${var.mssql_instance}.database.windows.net,1433;Initial Catalog=${var.mssql_database};Persist Security Info=False;User ID=${var.mssql_user};Password=${var.mssql_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;" 
}

# create a dataset for Azure data factory
resource "azurerm_data_factory_dataset_sql_server_table" "example" {
  name                = "dataset_sql_dev_cindia_stg"
  data_factory_id     = azurerm_data_factory.main.id
  linked_service_name = azurerm_data_factory_linked_service_sql_server.example.name
  #table_name          = 
} 

################################################################################
# add azurerm_data_factory_linked_service_azure_blob_storage
################################################################################
resource "azurerm_data_factory_linked_service_azure_blob_storage" "example" {
  name                = "linked-service-azure-blob-storage-dev-cindia-stg"
  data_factory_id     = azurerm_data_factory.main.id
  connection_string   = var.azure_blob_storage_connection_string

}

# dataset for azure blob storage
resource "azurerm_data_factory_dataset_azure_blob" "example" {
  name                = "dataset_azure_blob_storage_dev_india_stg"
  data_factory_id     = azurerm_data_factory.main.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.example.name

  path     = var.uploaded_path
  filename = var.sample_filename
}

# dataset for azure blob storage - lookup file
resource "azurerm_data_factory_dataset_azure_blob" "dataset-lookup-file" {
  name                = "dataset_dev_cindia_stg_lookup_file"
  data_factory_id     = azurerm_data_factory.main.id
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.example.name

  path     = var.uploaded_path
  filename = var.lookup_filename 
}
################################################################################