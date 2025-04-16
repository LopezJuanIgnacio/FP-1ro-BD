/*1*/
delimiter $$
create procedure insertar_alumno(Id int, nombre varchar(50), apellido1 varchar(50), apellido2 varchar(50), out paramError int)
begin 
	declare EXIT handler for 1062 set paramError=1;
    SET paramError=0;
	insert into alumne values(Id,nombre,apellido1,apellido2);
end $$

delimiter ;
set @a = 0, @b= 0;
call insertar_alumno(1,'Ana','García',null,@a);
call insertar_alumno(1,'Juan','López',null,@b);
select *, @a, @b from alumne;
/*2*/
delimiter $$
create procedure insertar_Pedido(pCodigoCliente int, pCodigoProducto int, pCantidad int)
begin 
    declare varCodPed int;
	declare varPreu decimal(15,2);
	declare EXIT handler for sqlexception  ROLLBACK;
    
    select max(CodigoPedido)+1 into varCodPed from Pedidos;
    
    START transaction;
		select PrecioVenta into varPreu from Productos
		where CodigoProducto=pCodigoProducto;

		insert into Pedidos values (varCodPed, sysdate(),
		adddate(sysdate(),5) ,null,'PENDENT',null, pCodigoCliente);
        
		insert into DetallePedidos values(varCodPed, pCodigoProducto,
		pCantidad, varPreu,1);
    COMMIT;
end $$

delimiter ;
call insertar_Pedido(3,'30310',3);

/*3*/
delimiter //
create procedure borrar_emp(paramCodEmp int)
begin
declare EXIT handler for sqlexception
begin
select ‘No es pot eliminar l’Empleat. Segurament té
Clientes que el referencien’ Missatge;
rollback;
end;
start transaction;
update Empleados
set CodigoJefe=null
where CodigoJefe=paramCodEmp;
delete from Empleados
where CodigoEmpleado= paramCodEmp;
commit;
end //
delimiter ;
call borrar_emp(3);

/*4*/
delimiter //
Create procedure Compra(paramNIF char(9),paramIdComp int ,paramIdBut
int, OUT paramError int)
begin
	declare a int;
	declare exit handler for 1264 ,1062
	begin
		set paramError=1;
		rollback;
	end;
/* Suponemos que la compra NO SE REALIZA.*/
set paramError=1;
select COUNT(*) into a from Comptes where IdCompte=paramIdComp;
if a=1 then
	start transaction;
		set paramError=0;
		update Comptes
		set saldo=saldo-5
		where IdCompte=paramIdComp;
		insert into Entrades values(paramIdBut,paramNIF);
		commit;
	end if;
end//

/*5*/
delimiter //
Create function ListaEmpleados(PPuesto VARCHAR(50)) returns text
begin
	DECLARE salida int default 1;
    DECLARE auxNom, auxApe varchar(50);
    DECLARE res TEXT default '';
	DECLARE cursor1 CURSOR FOR SELECT Nombre, Apellido1 From empleados where PPuesto=Puesto;
    DECLARE continue HANDLER for not found set salida=0;
    
	OPEN cursor1;
	FETCH cursor1 INTO auxNom, auxApe;
	
    IF salida=1 then
		SET res = CONCAT(auxNom,' ', auxApe);
	END IF;
	
    WHILE salida=1 DO
		FETCH cursor1 INTO auxNom, auxApe;
		IF salida=1 then
			SET res = CONCAT(res ,', ',auxNom,' ', auxApe);
		END IF;
	END WHILE;
    
    CLOSE cursor1;
    return res;
end//

DELIMITER ;
SELECT ListaEmpleados('Representante Ventas');
