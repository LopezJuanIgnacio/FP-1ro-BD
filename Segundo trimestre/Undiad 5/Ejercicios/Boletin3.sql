/*1*/
select codigocliente, count(*), max(FechaPedido), min(FechaPedido) from pedidos group by CodigoCliente;
/*2*/
select  gama, max(PrecioVenta), min(PrecioVenta), avg(PrecioVenta) 
from productos 
group by Gama;
/*3*/
select codigopedido, sum(PrecioUnidad * cantidad) from detallepedidos group by codigopedido;
/*4*/
select concat(E.nombre, E.apellido1, E.apellido2)  AS nomCom, count(*) from clientes as C right join empleados as E on E.CodigoEmpleado = C.CodigoEmpleadoRepVentas group by nomCom
/*5*/
select ciudad, pais, count(*) from oficinas as O right join empleados as E on E.CodigoOficina = O.CodigoOficina where pais != 'españa' group by ciudad, pais ;
/*6*/
select  clientes.CodigoCliente, NombreCliente,year(FechaPago), sum(Cantidad) 
from pagos inner join clientes on clientes.CodigoCliente= pagos.CodigoCliente 
group by clientes.CodigoCliente, NombreCliente,year(FechaPago);
/*7*/
select j.CodigoEmpleado, concat(j.nombre,' ',j.apellido1), count(*) 
from empleados em inner join empleados j on em.CodigoJefe=j.CodigoEmpleado 
group by j.CodigoEmpleado, concat(j.nombre,' ',j.apellido1)
/*8*/
select count(*), clientes.NombreCliente, clientes.LineaDireccion1 
from pedidos inner join clientes on clientes.CodigoCliente= pedidos.CodigoCliente 
group by clientes.CodigoCliente,clientes.NombreCliente, clientes.LineaDireccion1 
having count(*) >3
/*9*/
select count(DISTINCT p.CodigoPedido),NombreCliente, LineaDireccion1 
from pedidos p inner join clientes c on c.CodigoCliente= p.CodigoCliente inner join 
DetallePedidos d on d.CodigoPedido=p.CodigoPedido 
group by c.CodigoCliente,NombreCliente, LineaDireccion1 
having sum(Cantidad*PrecioUnidad)>1000 
/*10*/
select  gama, max(PrecioVenta), min(PrecioVenta), avg(PrecioVenta) 
from productos 
group by Gama
having count(*)>10;
/*11*/
select min(FechaPedido), NombreCliente, max(FechaPedido) 
from pedidos inner join clientes on pedidos.CodigoCliente = clientes.CodigoCliente 
group by clientes.CodigoCliente, NombreCliente 
having max(year(FechaPedido)>=2018)
/*12*/
select concat(Nombre, ' ', Apellido1) NombreCompleto, count(*) 'nº de clientes'
from empleados inner join clientes on empleados.CodigoEmpleado = 
clientes.CodigoEmpleadoRepVentas 
inner join oficinas on empleados.CodigoOficina = oficinas.codigoOficina 
where oficinas.ciudad in ('Madrid', 'Barcelona')
group by CodigoEmpleado,concat(Nombre, ' ', Apellido1) 
having count(*)>2
/*13*/
select  oficinas.CodigoOficina, LineaDireccion1, count(*) 
from empleados   inner join oficinas on empleados.CodigoOficina= 
oficinas.CodigoOficina 
where Pais not in ('España', 'Spain')
group by oficinas.CodigoOficina, LineaDireccion1 
having count(CodigoEmpleado)<10
/*14*/
select  clientes.CodigoCliente, NombreCliente,year(FechaPago), sum(Cantidad) 
from pagos inner join clientes on clientes.CodigoCliente= pagos.CodigoCliente 
where year(FechaPago)>=2017
group by clientes.CodigoCliente, NombreCliente,year(FechaPago)