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