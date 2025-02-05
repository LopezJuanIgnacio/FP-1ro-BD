/*1*/
SELECT * FROM Oficinas 
WHERE pais in (select pais from clientes where codigoCliente = 7)
/*2*/
select * from productos
where precioventa < (select avg(precioventa) from productos where gama='Ornamentales')
/*3*/
select p.CodigoPedido, FechaPedido, FechaEntrega,
CodigoCliente, count(*) as cantidad from pedidos as p
inner join detallepedidos as d on d.codigopedido = p.CodigoPedido
group by p.CodigoPedido, FechaPedido, FechaEntrega, CodigoCliente
having cantidad <(select count(*)
from detallepedidos
where CodigoPedido=1)
/*4*/
select *
from Pedidos
where FechaPedido<(Select FechaPedido
from Pedidos
where CodigoPedido=14)
/*5*/
select *
from Pedidos
where year(FechaPedido)<>(Select year(FechaPedido)
from Pedidos
where CodigoPedido=1)
/*6*/
select CodigoPedido, sum(cantidad*PrecioUnidad)
from DetallePedidos
group by CodigoPedido
having sum(cantidad*PrecioUnidad)<
(select sum(cantidad*PrecioUnidad)
from DetallePedidos
where CodigoPedido=1 )
/*7*/
select ciudad, count(*) as cantidad from clientes
group by ciudad
having cantidad >(select count(*)
from clientes
where ciudad = 'London')
/*8*/
select * from clientes
where ciudad in (select ciudad from oficinas)
/*9*/
select * from pedidos
where CodigoCliente in (select CodigoCliente from pagos)
/*10*/
select * from productos
where precioventa not in (select precioventa from productos where gama='Herramientas')
/*11*/
select distinct p.* from detallepedidos as d
inner join pedidos as p on p.CodigoPedido = d.CodigoPedido 
where d.CodigoProducto not in (select CodigoProducto from productos where gama='Herramientas')
/*12*/
select CodigoCliente, min(FechaPedido)
from Pedidos
where CodigoCliente in (select CodigoCliente
from Pedidos
where year(FechaPedido)=2018)
Group by CodigoCliente
/*13*/
select *
from Pedidos
where FechaPedido in (select FechaPago from Pagos)
/*14*/
select * from productos
where precioventa >all(select avg(PrecioVenta) from productos group by gama)
/*15*/
select Nombre, PrecioVenta
from Productos
where CodigoProducto NOT IN(select CodigoProducto
from detallepedidos)
/*16*/
select *
from pagos
where cantidad >=All(select Cantidad from Pagos)
/*17*/
select *
from pagos
where FechaPago like '2018%' and cantidad >=All
(select Cantidad
from Pagos
where FechaPago like '2018%')
/*18*/
select e.nombre, e.CodigoEmpleado, count(*) as cantidad from clientes as c
inner join empleados as e on e.CodigoEmpleado = c.CodigoEmpleadoRepVentas
group by e.nombre, e.CodigoEmpleado
having cantidad >=all(select count(*) from clientes as c1
inner join empleados as e1 on e1.CodigoEmpleado = c1.CodigoEmpleadoRepVentas
group by e1.nombre, e1.CodigoEmpleado)
/*19*/
select g.gama, g.DescripcionTexto, count(*) from gamasproductos as g
inner join productos as p on p.Gama = g.Gama
group by g.gama, g.DescripcionTexto
having count(*) <=all(select count(*) from productos group by gama)
/*20*/
select p.* from detallepedidos as d
inner join pedidos as p on p.CodigoPedido = d.CodigoPedido
group by codigopedido
having sum(PrecioUnidad * Cantidad) <=all(select sum(PrecioUnidad * Cantidad) 
from detallepedidos group by CodigoPedido)
/*21*/
select Year(FechaPedido), count(*)
from Pedidos
group by Year(FechaPedido)
having count(*)>=all(select count(*)
from Pedidos
group by Year(FechaPedido)
/*22*/
select j.CodigoEmpleado, j.nombre, j.apellido1,j.apellido2
from Empleados j inner join Empleados e on
j.CodigoEmpleado=e.CodigoJefe
group by j.CodigoEmpleado, j.nombre, j.apellido1,j.apellido2
having count(*)>=all(select count(*)
from Empleados
group by CodigoJefe)
/*23*/
Select *
From Productos
Where PrecioVenta =ANY(select PrecioVenta
From Productos
Group by PrecioVenta
Having count(*)=1)