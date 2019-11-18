Proyecto II - Datawarehouse

Configuración del cluster de mongo.

================================================================================================================================

mongod --version

db version v4.2.0
git version: a4b751dcf51dd249c5865812b390cfd1c0129c30
allocator: tcmalloc
modules: none
build environment:
    distmod: 2012plus
    distarch: x86_64
    target_arch: x86_64

mongos --version

mongos version v4.2.0
git version: a4b751dcf51dd249c5865812b390cfd1c0129c30
allocator: tcmalloc
modules: none
build environment:
    distmod: 2012plus
    distarch: x86_64
    target_arch: x86_64

================================================================================================================================    

Arquitectura

1 Router - mongos
1 Servidor de Configuracion - Replica set de 3 config svr
3 Nodos - shards
    - Cada shard son 3 instancias de mongo en un replica set
    

${PATH} = Ubicacion de la carpeta de git 
##"C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse"

mkdir -p {PATH}\Mongo\db\configsvr-db\ventas1-db
mkdir -p {PATH}\Mongo\db\configsvr-db\ventas2-db
mkdir -p {PATH}\Mongo\db\configsvr-db\ventas3-db

mkdir -p {PATH}\Mongo\db\rs1-db\ventas1-db
mkdir -p {PATH}\Mongo\db\rs1-db\ventas2-db
mkdir -p {PATH}\Mongo\db\rs1-db\ventas3-db

mkdir -p {PATH}\Mongo\db\rs1-db\ventas1-db
mkdir -p {PATH}\Mongo\db\rs1-db\ventas2-db
mkdir -p {PATH}\Mongo\db\rs1-db\ventas3-db

mkdir -p {PATH}\Mongo\db\rs1-db\ventas1-db
mkdir -p {PATH}\Mongo\db\rs1-db\ventas2-db
mkdir -p {PATH}\Mongo\db\rs1-db\ventas3-db

================================================================================================================================

Creacion de Replica Set de Servidores de Configuracion

##cd '\Program Files\MongoDB\Server\4.2\bin\'
    
.\mongod.exe --configsvr --port 27701 --replSet RSConfig --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\configsvr-db\ventas1-db" --bind_ip localhost --oplogSize 128

.\mongod.exe --configsvr --port 27702 --replSet RSConfig --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\configsvr-db\ventas2-db" --bind_ip localhost --oplogSize 128

.\mongod.exe --configsvr --port 27703 --replSet RSConfig --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\configsvr-db\ventas3-db" --bind_ip localhost --oplogSize 128

.\mongo.exe --host localhost --port 27701
    
rs.initiate(
  {
    _id: "RSConfig",
    configsvr: true,
    members: [
      { _id : 0, host : "localhost:27701" },
      { _id : 1, host : "localhost:27702" },
      { _id : 2, host : "localhost:27703" }
    ]
  }
)

================================================================================================================================

Creacion de los 3 Nodos Replica Set

*** rs1 ***

.\mongod.exe --shardsvr --port 27711 --replSet RS1 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\rs1-db\ventas1-db" --bind_ip localhost --oplogSize 128

.\mongod.exe --shardsvr --port 27712 --replSet RS1 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\rs1-db\ventas2-db" --bind_ip localhost --oplogSize 128

.\mongod.exe --shardsvr --port 27713 --replSet RS1 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\rs1-db\ventas3-db" --bind_ip localhost --oplogSize 128

.\mongo.exe --host localhost --port 27711
    
rs.initiate(
  {
    _id: "RS1",
    members: [
      { _id : 0, host : "localhost:27711" },
      { _id : 1, host : "localhost:27712" },
      { _id : 2, host : "localhost:27713" }
    ]
  }
)

*** rs2 ***

.\mongod.exe --shardsvr --port 27721 --replSet RS2 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\rs2-db\ventas1-db" --bind_ip localhost --oplogSize 128

.\mongod.exe --shardsvr --port 27722 --replSet RS2 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\rs2-db\ventas2-db" --bind_ip localhost --oplogSize 128

.\mongod.exe --shardsvr --port 27723 --replSet RS2 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\rs2-db\ventas3-db" --bind_ip localhost --oplogSize 128

.\mongo.exe --host localhost --port 27721
    
rs.initiate(
  {
    _id: "RS2",
    members: [
      { _id : 0, host : "localhost:27721" },
      { _id : 1, host : "localhost:27722" },
      { _id : 2, host : "localhost:27723" }
    ]
  }
)

*** rs3 ***

.\mongod.exe --shardsvr --port 27731 --replSet RS3 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\rs3-db\ventas1-db" --bind_ip localhost --oplogSize 128

.\mongod.exe --shardsvr --port 27732 --replSet RS3 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\rs3-db\ventas2-db" --bind_ip localhost --oplogSize 128

.\mongod.exe --shardsvr --port 27733 --replSet RS3 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\rs3-db\ventas3-db" --bind_ip localhost --oplogSize 128

.\mongo.exe --host localhost --port 27731
    
rs.initiate(
  {
    _id: "RS3",
    members: [
      { _id : 0, host : "localhost:27731" },
      { _id : 1, host : "localhost:27732" },
      { _id : 2, host : "localhost:27733" }
    ]
  }
)

================================================================================================================================

Conectar el router con el cluster (mongos)

.\mongos.exe --configdb RSConfig/localhost:27701,localhost:27702,localhost:27703 --port 27700 --bind_ip localhost

.\mongo.exe --host localhost --port 27700

sh.addShard( "RS1/localhost:27711")

sh.addShard( "RS2/localhost:27721")

sh.addShard( "RS3/localhost:27731")

sh.enableSharding("ventas")

sh.shardCollection("ventas.facturas", { idFactura : 1 } )
sh.shardCollection("ventas.clientes", { IDCliente : 1 } )
sh.shardCollection("ventas.vendedores", { IDVendedor : 1 } )


.\mongod.exe  --port 27017 --dbpath "C:\Users\ayma-93\Documents\TEC\Semestre II - 2019\Bases de Datos II\Proyectos\Proyecto-II---Datawarehouse\Mongo\db\test" --bind_ip localhost --oplogSize 128

================================================================================================================================

Crear las colecciones facturas, cliente y vendedores en la base de datos ventas

Desde powershell

.\mongo.exe --host localhost --port 27700

use ventas
db.createCollection( "facturas")
db.createCollection( "clientes")
db.createCollection( "vendedores")
db.facturas.createIndex( { "idFactura": 1, "item.idItem": 1 } )
db.clientes.createIndex( { "IDCliente": 1 } )
db.clientes.createIndex( { "IDVendedor": 1 } )

================================================================================================================================

JSON Coleccion facturas

{
    "idFactura" : "xxx",
    "fecha" : "xxx",
    "fechaVencimiento" : "xxx",
    "idCliente" : "xxx",
    "idItem" : "xxx",
    "item" : [
        {
            "idItem" : "xxx",
            "idItemAdicional" : "xxx",
            "descripcion" : "xxx",
            "grupo" : [
                {
                    "idGrupo" : "xxx",
                    "categoria" : "xxx",
                    "division" : "xxx"
                }
            ]
        }
    ],
    "cantidad" : "xxx",
    "moneda" : "xxx",
    "precio" : "xxx",
    "total" : "xxx",
    "almacén" : "xxx",
    "idVendedor" : "xxx",
    "totalUSD" : "xxx",
    "impuesto" : "xxx",
    "impuestoUSD" : "xxx",
    "tipoCambio" : "xxx",
    "ganacia" : "xxx",
    "gananciaUSD" : "xxx",
    "idItemNoReconocido" : 2
}

================================================================================================================================

JSON Coleccion clientes

{
    "IDCliente" : "xxx",
    "NombreCliente" : "xxx",
    "Telefono" : "xxx",
    "Condicion_pago" : "xxx",
    "Limite_credito" : "xxx",
    "IDVendedor" : "xxx",
    "Moneda" : "xxx",
    "Codigo_pais" : "xxx",
    "Ruta" : "xxx",
    "Canal" : [
        {
            "IDCanal" : 0,
            "NombreCanal" : "xxx",
            "Prioridad" : "xxx"
        }
    ],
    "Zona" : [
        {
            "IDZona" : "xxx",
            "NombreZona" : "xxx",
            "Plazo" : 0
        }
    ]
}

================================================================================================================================

JSON Coleccion vendedores

{
    "IDVendedor" : 4,
    "Nombre" : "xxx",
    "Comision" : 2,
    "Bloqueado" : "xxx",
    "Activo" : "xxx",
    "Email" : "xxx",
    "EsCobrador" : "xxx",
    "EsPromotor" : "xxx",
    "Tipo" : "xxx",
    "Canal" : "xxx"
}