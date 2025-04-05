use jardineria;
create table tabla1 (
id int auto_increment primary key,
nombre varchar(50) not null,
fecha date not null,
fechaIntro date not null);

/*1*/
insert into tabla1 (nombre, fecha, fechaIntro) 
select c.NombreCliente, min(p.fechapedido), curdate() from Clientes as c
natural join pedidos as p
group by c.NombreCliente

/*2*/
insert into tabla1 (nombre, fecha, fechaIntro)
select e.Nombre, p.FechaPago, curdate() from pagos as p
natural join clientes as c
inner join empleados as e on e.CodigoEmpleado = c.CodigoEmpleadoRepVentas

/*3*/
update detallepedidos as dp
natural join productos as p
set dp.precioUnidad = round(dp.precioUnidad*1.1, 2)
where p.gama like 'Aromáticas'

/*4*/
update Pedidos
set FechaEntrega=adddate(FechaPedido,10)
where 
datediff(FechaEntrega,FechaPedido)<0 
or FechaEntrega is null

/*5*/
update Clientes as c
set c.LimiteCredito=round(c.LimiteCredito*1.2,2)
where 
3 < (select count(*) from pedidos as p where p.CodigoCliente = c.CodigoCliente)

/*6*/
update Clientes as c
set c.NombreCliente=lower(c.NombreCliente)
where c.CodigoCliente not in (select p.CodigoCliente from pagos as p)

/*7*/
update Productos as p
set p.Nombre = upper(p.Nombre)
where 100 <= (select sum(dp.Cantidad) from detallepedidos as dp where dp.CodigoProducto = p.CodigoProducto)

/*8*/
delete from clientes as c
where c.CodigoCliente not in (select p.CodigoCliente from pedidos as p)

/*9*/
delete dp.* from detallepedidos as dp
natural join clientes as c
natural join pedidos as p
where c.Pais like 'España' and year(p.fechaPedido) = 2017

/*10*/
delete from productos as p
where p.CodigoProducto not in (select dp.CodigoProducto from detallepedidos as dp)