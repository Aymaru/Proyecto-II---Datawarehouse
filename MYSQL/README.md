Proyecto II - Datawarehouse

Pongan aqui la informacion de como configurar cada base y como ejecutar los etls.
CREATE DATABASE Ventas_ProyectoFinal;

USE Ventas_ProyectoFinal;

CREATE TABLE GrupoItems(
	IdGrupo nvarchar(255) NOT NULL PRIMARY KEY,
	Categoria nvarchar(255) NULL,
	Division nvarchar(255) NULL
);


CREATE TABLE Items(
	ID int NULL,
	IdItem int  NOT NULL PRIMARY KEY,
	Descripcion nvarchar(255) NULL,
	Grupo nvarchar(255) NULL,
	FOREIGN KEY (Grupo) REFERENCES GrupoItems(IdGrupo)
);


CREATE TABLE Zonas(
	IdZona int NOT NULL PRIMARY KEY,
	Nombre nvarchar(255) NULL,
	Plazo int NULL
);

CREATE TABLE Vendedores(
	IdVendedor int NOT NULL PRIMARY KEY,
	Nombre nvarchar(255) NULL,
	CantComision int NULL,
	Bloqueado nvarchar(255) NULL,
	Activo nvarchar(255) NULL,
	Email nvarchar(255) NULL,
	Cobrador nvarchar(255) NULL,
	Promotor nvarchar(255) NULL,
	Tipo nvarchar(255) NULL,
	Canal nvarchar(255) NULL
);

CREATE TABLE Canal_Clientes(
	IdCode int NOT NULL PRIMARY KEY,
	Nombre nvarchar(255) NOT NULL,
	Prioridad nvarchar(255) NOT NULL
);


CREATE TABLE Clientes(
	IdCliente nvarchar(255) NOT NULL PRIMARY KEY,
	Nombre nvarchar(255)  NULL,
	Telefono nvarchar(255) NULL,
	CodigoPago nvarchar(255) NULL,
	LimiteCredito float NULL,
	IdVendedor int NULL,
	MonedaSN nvarchar(255) NULL,
	DestinoFactura nvarchar(255) NULL,
	Zona int NOT NULL,
	Ruta nvarchar(255) NULL,
	Canal int NULL,
	FOREIGN KEY (IdVendedor) REFERENCES Vendedores(IdVendedor),
	FOREIGN KEY (Zona) REFERENCES Zonas(IdZona),
	FOREIGN KEY (Canal) REFERENCES Canal_Clientes(IdCode)
);


CREATE TABLE Vista_Ventas(
	IdVenta int AUTO_INCREMENT PRIMARY KEY,
    	Factura int NULL ,
    	Fecha_Anno int  NULL,
	Fecha_Mes int NULL,
	Fecha_Dia int  NULL,
	FechaV_Anno int  NULL,
	FechaV_Mes int NULL,
	FechaV_Dia int  NULL,
	Cliente nvarchar(255) NULL,
	Item int  NULL,
	Cantidad int  NULL,
	Moneda nvarchar(255) NULL,
	Precio float NULL,
	Total float  NULL,
	Almacen int NULL,
	Vendedor int NULL,
	TotalUSB float NULL,
	Impuesto float  NULL,
	ImpuestoUSB float  NULL,
	TipoCambio int  NULL,
	Ganacia DECIMAL(13, 4) NULL,
	GanaciaUSB DECIMAL(13, 4) NULL,
	FOREIGN KEY (Item) REFERENCES Items(IdItem),
	FOREIGN KEY (Cliente) REFERENCES Clientes(IdCliente),
	FOREIGN KEY (Vendedor) REFERENCES Vendedores(IdVendedor)
)

=SUBSTITUTE(P2:P13;",";"";1)

=SUBSTITUTE(P2:P13;",";"";2)

=IF(W2 = "";VALUE(U2);VALUE(W2))