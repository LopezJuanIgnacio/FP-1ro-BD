select * from productos
where precioventa >=(select avg(precioventa) from productos)

select * from productos
where precioventa in(40,30,65)

/*No funciona cuando el resultado de ciudad da null*/
select * from clientes
where ciudad not in(select ciudad from oficinas where ciudad is not null)

/*ANY (que se cumpla para al menos uno de la lista) y ALL (que se cumpla para todos en la lista)*/
select * from productos
where precioventa>any(select precioventa from productos 
						where gama like 'Herramientas')
/*Buscar el producto con el mayor precion*/
select * from productos
where precioventa=(select max(precioventa) from productos 
						where gama like 'Herramientas')
/*Lo mismo pero con all*/
select * from productos
where precioventa>=all(select precioventa from productos 
						where gama like 'Herramientas')
    
/*Correladas (osea que cada subconsulta va a dar un resultado diferente por cada fila)*/
select * from productos as p
where precioventa <>all(select Precioventa from productos as D where D.codigoproducto != p.CodigoProducto)

/*empleados con mayor cantidad de clientes*/
select e.nombre, e.codigoempleado, e.codigooficina, count(*) as contClientes
from clientes c inner join empleados e on c.CodigoEmpleadoRepVentas = e.CodigoEmpleado
group by e.nombre, e.codigoempleado, e.codigooficina
having contClientes >=all(select count(*) as contClientes
from clientes c inner join empleados e on c.CodigoEmpleadoRepVentas = e.CodigoEmpleado
group by e.codigoempleado)

/*EXIST*/
/*DEVUELVE VERDADERO O FALSO DEPENDIENDO DE SI LA CONSULTA DEVUELVE ALGO O NO*/
/*ejemplo precio unico con exists*/
select * from productos p
where not exists(select * 
				from productos p1 
				where p.PrecioVenta = p1.PrecioVenta and p.CodigoProducto != p1.CodigoProducto)

/*ejemplo precio mayor*/
select * from productos p
where not exists(select * 
				from productos p1 
				where p.PrecioVenta < p1.PrecioVenta)

/*ejemplo clientes con oficina*/
select * from clientes c
where exists(select * 
				from oficinas o
				where c.ciudad = o.ciudad)
