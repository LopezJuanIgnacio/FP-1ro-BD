/*1*/
delimiter //
create trigger bef_del_cli before delete on clientes
for each row 
begin
	delete from detallepedidos
	where CodigoPedido in (select CodigoPedido from Pedidos
		where CodigoCliente=OLD.CodigoCliente);
        
	delete from Pedidos
		where CodigoCliente= OLD.CodigoCliente;
end//

/*2*/
set @clientesEliminadosHoy=0;

create trigger bef_del_cli before delete on clientes
for each row set @clientesEliminadosHoy =  @clientesEliminadosHoy + 1;

/*3*/
Create table descatalogados(
CodigoProducto varchar(15),
Nombre varchar(70),
Fecha date,
usuario varchar(70));

create trigger aft_del_pro before delete on productos
for each row insert into descatalogados values (old.CodigoProducto, old.Nombre, date(), user());
