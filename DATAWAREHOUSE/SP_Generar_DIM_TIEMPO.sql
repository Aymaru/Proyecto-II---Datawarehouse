CREATE PROCEDURE [dbo].[generarDimTiempo]
AS

DECLARE @fecha AS DATE
DECLARE @dia AS INT
DECLARE @mes AS INT
DECLARE @año AS INT
DECLARE @trimestre AS NVARCHAR(50)
DECLARE @cantidad_de_dias_a_generar AS INT

-- 3653 dias son 10 años desde el 1 de enero del 2010 hasta el 1 de enero del 2020
SET @cantidad_de_dias_a_generar = 3653;
SELECT @fecha = convert(datetime, '01/01/2010', 103)

WHILE @cantidad_de_dias_a_generar > 0  
BEGIN 
	SELECT  @dia = DAY(@fecha)
	SELECT  @mes = MONTH(@fecha)
	SELECT  @año = YEAR(@fecha)
	SELECT @trimestre = CASE(@mes) 
			WHEN 1 THEN 'I Trimestre'
            WHEN 2 THEN 'I Trimestre' 
			WHEN 3 THEN 'I Trimestre'
            WHEN 4 THEN 'II Trimestre'  
			WHEN 5 THEN 'II Trimestre'
            WHEN 6 THEN 'II Trimestre'  
			WHEN 7 THEN 'III Trimestre'
            WHEN 8 THEN 'III Trimestre'  
			WHEN 9 THEN 'III Trimestre'       
            ELSE 'IV Trimestre' 
	END;

	INSERT INTO [DATAWAREHOUSE_Ventas].[dbo].[DWV_DIM_TIEMPO]
			   ([idDImTiempo]
			   ,[dia]
			   ,[mes]
			   ,[año]
			   ,[trimestre])
		 VALUES
			   (@fecha
			   ,@dia
			   ,@mes
			   ,@año
			   ,@trimestre)
	SELECT  @fecha = DATEADD(day, 1, @fecha)
	SET @cantidad_de_dias_a_generar = @cantidad_de_dias_a_generar - 1
END
GO