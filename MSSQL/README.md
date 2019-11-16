Guia para creacion del Segmento de Bases de Datos

create database [Ventas_ProyectoFinal]

USE [Ventas_ProyectoFinal]

CREATE TABLE [dbo].[GrupoItems](
    [IdGrupo] [nvarchar](255) NOT NULL PRIMARY KEY,
	[Categoria] [nvarchar](255) NOT NULL,
	[Division] [nvarchar](255) NULL
)


CREATE TABLE [dbo].[Items](
    [ID] [int] NULL,
    [IdItem] [int]  NOT NULL PRIMARY KEY,
	[Descripcion] [nvarchar](255) NULL,
	[Grupo] [nvarchar](255) NULL,
	FOREIGN KEY ([Grupo]) REFERENCES [GrupoItems]([IdGrupo])
)


CREATE TABLE [dbo].[Zonas](
    	[IdZona] [int] NOT NULL PRIMARY KEY,
    	[Nombre] [nvarchar](255) NULL,
	[Plazo] [int] NULL
)

CREATE TABLE [dbo].[Vendedores](
    	[IdVendedor] [int] NOT NULL PRIMARY KEY,
    	[Nombre] [nvarchar](255) NULL,
	[CantComision] [int] NULL,
	[Bloqueado] [nvarchar](255) NULL,
	[Activo] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Cobrador] [nvarchar](255) NULL,
	[Promotor] [nvarchar](255) NULL,
	[Tipo] [nvarchar](255) NULL,
	[Canal] [nvarchar](255) NULL
)

CREATE TABLE [dbo].[Canal_Clientes](
    	[IdCode] [int] NOT NULL PRIMARY KEY,
    	[Nombre] [nvarchar](255) NOT NULL,
	[Prioridad] [nvarchar](255) NOT NULL
)


CREATE TABLE [dbo].[Clientes](
    	[IdCliente] [nvarchar](255) NOT NULL PRIMARY KEY,
    	[Nombre]  [nvarchar](255) NULL,
	[Telefono] [nvarchar](255) NULL,
	[CodigoPago] [nvarchar](255) NULL,
	[LimiteCredito] [float] NULL,
	[IdVendedor] [int] NULL,
	[MonedaSN] [nvarchar](255) NULL,
	[DestinoFactura] [nvarchar](255) NULL,
	[Zona] [int] NOT NULL,
	[Ruta] [nvarchar](255) NULL,
	[Canal] [int] NULL,
	FOREIGN KEY ([IdVendedor]) REFERENCES [Vendedores]([IdVendedor]),
	FOREIGN KEY ([Zona]) REFERENCES [Zonas]([IdZona]),
	FOREIGN KEY ([Canal]) REFERENCES [Canal_Clientes]([IdCode])
)


CREATE TABLE [dbo].[Vista_Ventas](
	[IdVenta] [int] IDENTITY(1,1) PRIMARY KEY,
    [Factura] [int]  NULL ,
    [Fecha_Anno] [int]  NULL,
	[Fecha_Mes] [int]  NULL,
	[Fecha_Dia] [int]   NULL,
	[FechaV_Anno] [int]  NULL,
	[FechaV_Mes] [int] NULL,
	[FechaV_Dia] [int]  NULL,
	[Cliente] [nvarchar](255) NULL,
	[Item] [int]  NULL,
	[Cantidad] [int]  NULL,
	[Moneda] [nvarchar](255) NULL,
	[Precio] [money] NULL,
	[Total] [money]  NULL,
	[Almacen] [int] NULL,
	[Vendedor] [int] NULL,
	[TotalUSB] [float] NULL,
	[Impuesto] [float]  NULL,
	[ImpuestoUSB] [float]  NULL,
	[TipoCambio] [int]  NULL,
	[Ganacia] [money] NULL,
	[GanaciaUSB] [money] NULL,
	FOREIGN KEY ([Item] ) REFERENCES [Items]([IdItem]),
	FOREIGN KEY ([Cliente]) REFERENCES [Clientes]([IdCliente]),
	FOREIGN KEY ([Vendedor]) REFERENCES [Vendedores]([IdVendedor])
)

---------------------------------------------------------------------------------------------------------------------------------
NO SE OUCPA PERO SIRVE

	CREATE VIEW [dbo].[Vista_VentasQuery]
	AS
	SELECT      T0.Factura, T0.Fecha_Anno, T0.Fecha_Mes, T0.Fecha_Dia, T0.FechaV_Anno, T0.FechaV_Mes, T0.FechaV_Dia, T0.Cliente,
				T0.Item, T0.Cantidad, T0.Moneda, T0.Precio, T0.Total, T0.Almacen, T0.Vendedor, T0.TotalUSB,	T0.Impuesto, T0.ImpuestoUSB, T0.TipoCambio,
				T0.Ganacia, T0.GanaciaUSB, T2.Division
	FROM        Vista_Ventas T0 LEFT OUTER JOIN Items T1 ON T0.Item = T1.IdItem 
				LEFT OUTER JOIN GrupoItems t2 On T1.Grupo = T2.IdGrupo

	SELECT  * INTO    Ventas_Query FROM    [Vista_VentasQuery]

---------------------------------------------------------------------------------------------------------------------------------
En el Publicador poner estos filtros...

	Item in ( Select IdItem from Items where Grupo in ( Select Grupo from GrupoItems where Division = 'FERRETERIA' ) )

	Item in ( Select IdItem from Items where Grupo in ( Select Grupo from GrupoItems where Division = 'INDUSTRIAL' ) )

------------------------------
create database [Ventas_ProyectoFinal]

USE [Ventas_ProyectoFinal]

CREATE TABLE [dbo].[GrupoItems](
    [IdGrupo] [nvarchar](255) NOT NULL PRIMARY KEY,
	[Categoria] [nvarchar](255) NOT NULL,
	[Division] [nvarchar](255) NULL
)


CREATE TABLE [dbo].[Items](
    [ID] [int] NULL,
    [IdItem] [int]  NOT NULL PRIMARY KEY,
	[Descripcion] [nvarchar](255) NULL,
	[Grupo] [nvarchar](255) NULL,
	FOREIGN KEY ([Grupo]) REFERENCES [GrupoItems]([IdGrupo])
)


CREATE TABLE [dbo].[Zonas](
    	[IdZona] [int] NOT NULL PRIMARY KEY,
    	[Nombre] [nvarchar](255) NULL,
	[Plazo] [int] NULL
)

CREATE TABLE [dbo].[Vendedores](
    	[IdVendedor] [int] NOT NULL PRIMARY KEY,
    	[Nombre] [nvarchar](255) NULL,
	[CantComision] [int] NULL,
	[Bloqueado] [nvarchar](255) NULL,
	[Activo] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Cobrador] [nvarchar](255) NULL,
	[Promotor] [nvarchar](255) NULL,
	[Tipo] [nvarchar](255) NULL,
	[Canal] [nvarchar](255) NULL
)

CREATE TABLE [dbo].[Canal_Clientes](
    	[IdCode] [int] NOT NULL PRIMARY KEY,
    	[Nombre] [nvarchar](255) NOT NULL,
	[Prioridad] [nvarchar](255) NOT NULL
)


CREATE TABLE [dbo].[Clientes](
    	[IdCliente] [nvarchar](255) NOT NULL PRIMARY KEY,
    	[Nombre]  [nvarchar](255) NULL,
	[Telefono] [nvarchar](255) NULL,
	[CodigoPago] [nvarchar](255) NULL,
	[LimiteCredito] [float] NULL,
	[IdVendedor] [int] NULL,
	[MonedaSN] [nvarchar](255) NULL,
	[DestinoFactura] [nvarchar](255) NULL,
	[Zona] [int] NOT NULL,
	[Ruta] [nvarchar](255) NULL,
	[Canal] [int] NULL,
	FOREIGN KEY ([IdVendedor]) REFERENCES [Vendedores]([IdVendedor]),
	FOREIGN KEY ([Zona]) REFERENCES [Zonas]([IdZona]),
	FOREIGN KEY ([Canal]) REFERENCES [Canal_Clientes]([IdCode])
)


CREATE TABLE [dbo].[Vista_Ventas](
	[IdVenta] [int] IDENTITY(1,1) PRIMARY KEY,
    [Factura] [int]  NULL ,
    [Fecha_Anno] [int]  NULL,
	[Fecha_Mes] [int]  NULL,
	[Fecha_Dia] [int]   NULL,
	[FechaV_Anno] [int]  NULL,
	[FechaV_Mes] [int] NULL,
	[FechaV_Dia] [int]  NULL,
	[Cliente] [nvarchar](255) NULL,
	[Item] [int]  NULL,
	[Cantidad] [int]  NULL,
	[Moneda] [nvarchar](255) NULL,
	[Precio] [money] NULL,
	[Total] [money]  NULL,
	[Almacen] [int] NULL,
	[Vendedor] [int] NULL,
	[TotalUSB] [float] NULL,
	[Impuesto] [float]  NULL,
	[ImpuestoUSB] [float]  NULL,
	[TipoCambio] [int]  NULL,
	[Ganacia] [money] NULL,
	[GanaciaUSB] [money] NULL,
	FOREIGN KEY ([Item] ) REFERENCES [Items]([IdItem]),
	FOREIGN KEY ([Cliente]) REFERENCES [Clientes]([IdCliente]),
	FOREIGN KEY ([Vendedor]) REFERENCES [Vendedores]([IdVendedor])
)

---------------------------------------------------------------------------------------------------------------------------------
NO SE OUCPA PERO SIRVE

	CREATE VIEW [dbo].[Vista_VentasQuery]
	AS
	SELECT      T0.Factura, T0.Fecha_Anno, T0.Fecha_Mes, T0.Fecha_Dia, T0.FechaV_Anno, T0.FechaV_Mes, T0.FechaV_Dia, T0.Cliente,
				T0.Item, T0.Cantidad, T0.Moneda, T0.Precio, T0.Total, T0.Almacen, T0.Vendedor, T0.TotalUSB,	T0.Impuesto, T0.ImpuestoUSB, T0.TipoCambio,
				T0.Ganacia, T0.GanaciaUSB, T2.Division
	FROM        Vista_Ventas T0 LEFT OUTER JOIN Items T1 ON T0.Item = T1.IdItem 
				LEFT OUTER JOIN GrupoItems t2 On T1.Grupo = T2.IdGrupo

	SELECT  * INTO    Ventas_Query FROM    [Vista_VentasQuery]

---------------------------------------------------------------------------------------------------------------------------------
En el Publicador poner estos filtros...

	Item in ( Select IdItem from Items where Grupo in ( Select Grupo from GrupoItems where Division = 'FERRETERIA' ) )

	Item in ( Select IdItem from Items where Grupo in ( Select Grupo from GrupoItems where Division = 'INDUSTRIAL' ) )
