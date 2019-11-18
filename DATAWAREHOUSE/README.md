Proyecto II - Datawarehouse

Data Warehouse para ventas.
Hecho en SQL Server.

Para crear el data warehouse, desde MSSMS.

Primero crear una nueva base de datos con el nombre: DATAWAREHOUSE_Ventas
y el owner: sa

Luego ejecutar el script "Scrips para generar tablas del data warehouse ventas.sql"

Para cargar datos al data warehouse, ejecute los etls que cargan los datos de sql, mysql y mongodb.

Para cargar la dimension tiempo, primero ejecutar el script SP_Generar_DIM_TIEMPO.sql
luego en sql

USE [DATAWAREHOUSE_Ventas]
EXECUTE [dbo].[generarDimTiempo]