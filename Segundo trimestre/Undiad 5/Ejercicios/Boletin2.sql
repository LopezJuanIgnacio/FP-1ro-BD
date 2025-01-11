/*1*/
SELECT pedidos.*
FROM Pedidos NATURAL JOIN Clientes
WHERE (year(FechaPedido)=2019 OR year(FechaPedido)=2016) AND NombreCliente
like 'Tendo Garden%';
/*2*/
select Pedidos.*
from pedidos inner join clientes on Pedidos.CodigoCliente=Clientes.CodigoCliente
where FechaPedido >= '2016/06/01' and FechaPedido <='2018/05/31' and Pais like
'España';
/*3*/
select *
from Oficinas
where Pais not like 'EEUU' and (Ciudad like 'A%' or Ciudad like '%A')
/*4*/
select distinct P.Nombre, DP.cantidad
from productos AS P
inner join DetallePedidos AS DP on P.CodigoProducto=DP.CodigoProducto
where DP.Cantidad>= 50;
/*5*/
select CodigoPedido, nombre, PrecioUnidad, Cantidad, PrecioUnidad* Cantidad
from Productos p inner join DetallePedidos dp on
p.CodigoProducto=dp.CodigoProducto
/*6*/
select distinct Pedidos.*
from Pedidos inner join detallepedidos on
Pedidos.CodigoPedido=DetallePedidos.CodigoPedido inner join productos on
detallepedidos.CodigoProducto= productos.Codigoproducto
where Gama like 'Aromáticas'
/*7*/
select distinct E.* from empleados as E
inner join clientes AS C ON C.CodigoEmpleadoRepVentas = E.CodigoEmpleado
inner join pedidos AS P ON P.CodigoCliente = C.CodigoCliente
where C.Pais = 'USA' AND year(P.FechaPedido) = 2019
/*8*/
select concat(emp.Nombre, ' ', emp.Apellido1, ' ', emp.Apellido2) NombreEmpleado,
concat (jefe.nombre, ' ', jefe.Apellido1, ' ', jefe.Apellido2) as NombreJefe
from empleados emp inner join Empleados jefe on emp.CodigoJefe=
jefe.CodigoEmpleado
/*9*/
select concat(emp.Nombre, ' ', emp.Apellido1), emp.Puesto,
emp.CodigoOficina,jefe.Nombre
from Empleados emp inner join Empleados jefe on emp.CodigoJefe=
jefe.CodigoEmpleado
where emp.CodigoOficina like 'SYD-AU' or emp.Puesto like 'Representante Ventas'
and jefe.Nombre like 'Amy%'
/*10*/
select DISTINCT Oficinas.*
from Oficinas natural join Empleados inner join Clientes on
Empleados.CodigoEmpleado=Clientes.CodigoEmpleadoRepVentas
where Oficinas.Pais like 'España' and Oficinas.CodigoOficina not like 'B%' and
(clientes.Ciudad=Oficinas.ciudad or clientes.pais != Oficinas.pais)
/*11*/
Select distinct c.*
From Pedidos p right join Clientes c on p.CodigoCliente=c.CodigoCliente
left join Pagos pa on pa.CodigoCliente=c.CodigoCliente
where year(fechaPago)=2018 or year(fechaPedido)=2017