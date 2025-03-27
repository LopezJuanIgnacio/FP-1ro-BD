/*1*/
Update Empleados
Set Nombre = UPPER(Nombre), Apellido1=UPPER(Apellido1)

/*2*/
update Empleados
Set Apellido1= LOWER (Apellido1)
Where Apellido2 not like ""

/*3*/
Update Empleados
Set Apellido1= LOWER (Apellido1), Apellido2= LOWER
(Apellido2)
Where Apellido2 is not null and
CodigoOficina in (select CodigoOficina
From Oficinas
Where pais in (“España”, “Spain”))

/*4*/
update Productos
set PrecioVenta=ROUND(PrecioVenta*0.9,2)
where CodigoProducto not in(select CodigoProducto from
DetallePedidos)

/*5*/
update Productos
set PrecioVenta=round(PrecioVenta*1.15,2)
where CodigoProducto in
(select DetallePedidos.CodigoProducto
from DetallePedidos inner join Pedidos on
DetallePedidos.CodigoPedido=Pedidos.CodigoPedido
where year(FechaPedido)=2019
Group by DetallePedidos.CodigoProducto
having sum(Cantidad*PrecioUnidad)>150)

/*6*/
update Productos
set PrecioVenta=PrecioVenta - 5
where ((PrecioVenta - PrecioProovedor) / PrecioVenta) < 0.1

/*7*/
update Productos
set PrecioVenta=round(PrecioVenta*1.05,2)
where CodigoProducto in
(select DetallePedidos.CodigoProducto
from DetallePedidos
Group by DetallePedidos.CodigoProducto
having sum(Cantidad)>100)

/*8*/
update Productos
set PrecioVenta=round(PrecioVenta*1.05,2)
where CodigoProducto in
(select DetallePedidos.CodigoProducto
from DetallePedidos
Group by DetallePedidos.CodigoProducto
having count(*)>6)

/*9*/
update Clientes
set Nombre=UPPER(Nombre), Apellido1=UPPER(Apellido1)
where CodigoCliente in
(select CodigoCliente from Pedidos
natural join detallepedidos
Group by CodigoCliente
having sum(Cantidad*PrecioUnidad)>3000
)

/*10*/
update Empleados
set Nombre=upper(Nombre)
where CodigoEmpleado in (select CodigoEmpleadoRepVentas
from Clientes
group by CodigoEmpleadoRepVentas
having count(*)>=3)

/*11*/
update Pedidos
set FechaEsperada=adddate(FechaPedido,7)
where FechaEsperada is null or
datediff(FechaEsperada,FechaPedido)<3

/*12*/
update Pedidos
set FechaEsperada=adddate(FechaPedido,7)
where 
datediff(FechaEntrega,FechaPedido)<0

