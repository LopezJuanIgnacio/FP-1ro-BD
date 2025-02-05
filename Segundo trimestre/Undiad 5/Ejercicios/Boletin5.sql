/*1*/
select * from clientes as c
where not exists(select * from oficinas as o where o.Ciudad = c.Ciudad)
/*2*/
select * from clientes as c
where exists(select * from pagos as p where p.CodigoCliente = c.CodigoCliente)
/*3*/
select Ciudad, count(*) as cantidad from clientes
group by Ciudad
having count(*) >=any(select count(*) from clientes group by Ciudad)
/*4*/
select * from productos
where gama != 'Herramientas' and precioventa in (select precioventa from productos where gama = 'Herramientas')