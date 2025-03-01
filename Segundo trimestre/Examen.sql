/*EXAMEN A Juan Ignacio Lopez*/
/*1*/
select distinct c.NombreCliente, concat(c.NombreContacto, ' ', c.ApellidoContacto) as 'Nombre completo contacto' from clientes as c
left join pedidos as p on p.CodigoCliente = c.CodigoCliente
where ((c.Pais like 'E%'  or pais like 'A%') and (c.NombreCliente like '%Garden%' or c.NombreCliente like '%Jard%') )
or (c.Pais != 'España' and YEAR(p.FechaPedido) =  2019);

/*2*/
select distinct o.* from oficinas as o
inner join empleados as e on e.CodigoOficina = o.CodigoOficina
inner join clientes as c on c.CodigoEmpleadoRepVentas = e.CodigoEmpleado
where c.Ciudad in ('New York','Madrid','San Fransisco', 'Sydney', 'Miami');

/*3*/
select count(*) as NroPedidos, MIN(p.FechaPedido) as fechaPrimerPedido, MAX(p.FechaPedido) as fechaUltimoPedido, year(p.FechaPedido) as 'Año' from pedidos as p
left join clientes as c on c.CodigoCliente = p.CodigoCliente
where c.pais = 'España'
group by year(p.FechaPedido);

/*4*/
select gama from productos
group by gama
having avg(PrecioVenta) > 10 and min(PrecioVenta)  > 1;

/*5*/
select * from clientes as c
where 2 >= (select count(p.IDTransaccion) from pagos as p where p.CodigoCliente = c.CodigoCliente);

/*6*/
select c.pais, coalesce(sum(dp.Cantidad * dp.PrecioUnidad), 0) as 'Importe Total' from clientes as c
left join pedidos as p on p.CodigoCliente = c.CodigoCliente
left join detallepedidos as dp on dp.CodigoPedido = p.CodigoPedido
group by c.pais;

/*7*/
select p.gama,count(distinct p.CodigoProducto) as 'Numero de pedidos', sum(dp.cantidad) as 'Cantidad Total', sum(dp.cantidad * dp.PrecioUnidad) as 'Importe total' 
from productos as p
inner join detallepedidos as dp on dp.CodigoProducto = p.CodigoProducto
group by p.gama;

/*8*/
select p.Nombre
from productos as p
inner join detallepedidos as dp on dp.CodigoProducto = p.CodigoProducto
group by p.Nombre
having not exists(select sum(dp2.cantidad)
from productos as p2
inner join detallepedidos as dp2 on dp2.CodigoProducto = p2.CodigoProducto
group by p2.CodigoProducto
having sum(dp2.cantidad) > sum(dp.cantidad)
);

/*9*/
select p.*
from productos as p
where p.PrecioVenta < (select avg(p2.PrecioVenta) from productos as p2 where p.gama = p2.gama);