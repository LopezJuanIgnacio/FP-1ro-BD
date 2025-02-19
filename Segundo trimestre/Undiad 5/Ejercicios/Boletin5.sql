/*1*/
select * from clientes as c
where not exists(select * from oficinas as o where o.Ciudad = c.Ciudad)
/*2*/
select * from clientes as c
where exists(select * from pagos as p where p.CodigoCliente = c.CodigoCliente)
/*3*/
select Ciudad, count(*) from clientes as c
where not exists(select count(*) from clientes as c1 group by Ciudad having count(c.CodigoCliente) < count(c1.CodigoCliente))
group by Ciudad
/*4*/
select * from productos as p1
where p1.gama != 'Herramientas' and exists(select precioventa from productos as p2 where p2.gama = 'Herramientas' and p2.precioventa = p1.precioventa)


/*14*/
select *
from Productos p
where NOT EXISTS( SELECT Gama
from Productos p1
group by Gama
having AVG(p1.PrecioVenta)>p.PrecioVenta)
/*15*/
select Nombre, PrecioVenta
from Productos p
where NOT EXISTS (SELECT * from DetallePedidos
where DetallePedidos.CodigoProducto=p.CodigoProducto)
/*16*/
select *
from pagos p
where NOT EXISTS(select * from Pagos p1
WHERE p1.cantidad>p.cantidad )
/*17*/
select *
from pagos p
where FechaPago like '2018%' AND
NOT EXISTS(select * from Pagos p1
WHERE p1.cantidad>p.cantidad AND
FechaPago like '2018%' )
/*18*/
select CodigoEmpleado,nombre,Apellido1,Apellido2
from empleados e inner join Clientes c on
e.CodigoEmpleado=c.Codigoempleadorepventas
group by CodigoEmpleado,nombre,Apellido1,Apellido2
having NOT EXISTS(select count(*)
from Clientes c1
group by CodigoEmpleadorepventas
HAVING
COUNT(c1.CodigoCliente)>COUNT(c.CodigoCliente))
/*19*/
select productos.gama, DescripcionTexto
from productos p natural join gamasproductos
group by productos.gama, DescripcionTexto
having NOT EXISTS(select count(*) from productos p1
group by gama
having count(p1.CodigoProducto)<count(p.CodigoProduto))
/*20*/
select Pedidos.CodigoPedido, FechaPedido, FechaEntrega,
CodigoCliente, sum(cantidad*PrecioUnidad) Importe
from Pedidos natural join detallepedidos dp
group by Pedidos.CodigoPedido, FechaPedido, FechaEntrega,
CodigoCliente
having NOT EXISTS(SELECT COUNT(*)
from detallepedidos dp1
group by CodigoPedido
HAVING sum(dp1.cantidad* dp1PrecioUnidad)<
sum(dp.cantidad* dpPrecioUnidad) )
/*21*/
select Year(FechaPedido), count(*)
from Pedidos p
group by Year(FechaPedido)
having NOT EXISTS(select count(*)
from Pedidos p1
group by Year(FechaPedido)
having count(p1.CodigoPedido)>count(p.CodigoPedido))
/*22*/
select j.CodigoEmpleado, j.nombre, j.apellido1,j.apellido2
from Empleados j inner join Empleados e on
j.CodigoEmpleado=e.CodigoJefe
group by j.CodigoEmpleado, j.nombre, j.apellido1,j.apellido2
having NOT EXISTS(select count(*)
from Empleados e1
group by CodigoJefe
HAVING count(e1.CodigoEmpleado)>
count(e.CodigoEmpleado))
/*23*/
Select *
From Productos p
Where NOT EXISTS(select * From Productos p1
Where p.PrecioVenta=p1.PrecioVenta AND
p.CodigoProducto<>p1.CodigoProducto)

