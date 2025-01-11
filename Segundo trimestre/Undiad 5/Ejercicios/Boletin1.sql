/*1*/
select * from pedidos where YEAR(FechaPedido) = 2019;
/*2*/
select * from pedidos where YEAR(FechaPedido) = 2019 OR YEAR(FechaPedido) = 2016; 
/*3*/
select * from CLIENTES WHERE PAIS != 'España' AND PAIS != 'Spain' AND NombreCliente like 'a%' or NombreCliente like '%a'; 
/*4*/
select * from productos WHERE (precioventa < 3 or precioventa > 50) and (gama in ('Aromáticas', 'Herramientas')); 
/*5*/
select *
from Oficinas
where Ciudad in ('Londres','Madrid','Barcelona')
/*6*/
select *
from Oficinas
where Pais like '%b%' or Pais like '%s%';
/*7*/
select *
from Oficinas
where Pais like '%a%' and Pais like '%s%'
/*8*/
select *
from Pedidos
where FechaPedido like '2017-02%'
/*9*/
SELECT *
FROM Oficinas
WHERE Pais <>’EEUU’ and (Ciudad LIKE ‘a%’ OR Ciudad LIKE ‘%a’
/*10*/
SELECT CodigoProducto, Nombre, PrecioVenta, PrecioProveedor,
PrecioVenta - PrecioProveedor AS ‘Beneficio neto’,
(PrecioVenta - PrecioProveedor)/PrecioVenta  AS ‘Porcentaje Beneficio’
FROM Productos;
/*11*/
Select CodigoPedido, YEAR(FechaPedido)
From Pedidos
/*12*/
select CodigoProducto, Nombre, ROUND(PrecioVenta/0.93,2) AS 'Dolares' from productos; 
/*13*/
Select CONCAT(‘Código de Cliente: ‘, CodigoCliente, ‘ Persona de
contacto: ‘ , NombreContacto, ‘ ‘,ApellidoContacto)
FROM Clientes;
/*14*/
Select MAX(PrecioVenta), MIN(PrecioVenta), AVG(PrecioVenta)
FROM Productos
/*15*/
Select MAX(PrecioVenta), MIN(PrecioVenta), AVG(PrecioVenta)
FROM Productos
WHERE Gama=’Herramientas
/*16*/
Select COUNT(*), SUM(Cantidad*PrecioUnidad)
FROM DetallePedidos
Where CodigoPedido=1
/*17*/
Select COUNT(*) ‘Número de Clientes’, COUNT(DISTINCT Pais) ‘Número de
países’
From Clientes
/*18*/
Select COUNT(DISTINCT CodigoProducto)
FROM DetallePedidos
/*19*/
Select COUNT(*), COUNT(DISTINCT CodigoCliente)
From Pagos
/*20*/
SELECT MIN(FechaPedido), MAX(FechaPedido)
FROM Pedidos
/*21*/
Select COUNT(*), COUNT(CodigoJefe)
From Empleados