/*1*/
delimiter //
create trigger bef_ins_ped before insert on pedidos for each row
begin
	if (new.fechaPedido > new.fechaEsperada) then
		set new.fechaEsperada = adddate(new.fechaPedido, 3);
    end if;
    if (new.fechaPedido > new.fechaEntrega) then
		set new.fechaEntrega  = new.fechaEsperada;
    end if;
end //
delimiter ;
INSERT INTO Pedidos VALUES (1000,'2016-01-17','2016-01-10','2016-01-02','Entregado','Pagado a plazos',5);
select * from pedidos;
/*2*/
create table RegistroPedidos (
NumOperacion int primary key auto_increment,
CodigoPedido int(11),
hora timestamp default CURRENT_TIMESTAMP,
tipo varchar(10));
delimiter //
create trigger aft_ins_ped after insert on pedidos for each row
begin
	insert into RegistroPedidos values (null, new.CodigoPedido, default, 'INS');
end //
delimiter ;
INSERT INTO Pedidos VALUES (1001,'2016-01-17','2016-01-10','2016-01-02','Entregado','Pagado a plazos',5);
select * from RegistroPedidos;
/*3*/
delimiter //
create trigger bef_ins_pro before insert on productos for each row 
begin
	if new.PrecioVenta <= 0 then 
		set new.PrecioVenta = 1;
	end if;
end //
/*4*/
delimiter //
create trigger bef_ins_det before insert on detallepedidos for each row 
begin
	declare min decimal(10,2);
    select PrecioVenta into min from productos where CodigoProducto = new.CodigoProducto;
	if new.Cantidad <= 0 then 
		set new.Cantidad = 1;
	end if;
    if new.PrecioUnidad < min then 
		set new.PrecioUnidad = min;
	end if;
end //

delimiter ;
insert into detallepedidos values (1,'11679',0,5,10);
select * from detallepedidos;