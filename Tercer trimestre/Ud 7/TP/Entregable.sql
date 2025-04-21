delimiter //
create procedure borrar_Jefes()
begin
    declare salida int default 1;
    declare CodJefe int;
	declare cursor1 cursor for select distinct CodigoJefe from Empleados where CodigoJefe is not null;
    
    declare continue handler for sqlexception rollback;
    declare continue handler for not found set salida=0;
    
    open cursor1;

    fetch next from cursor1 into CodJefe;
    while salida=1 do
        begin
            start transaction;
            update Empleados set CodigoJefe=null where CodigoJefe=CodJefe;
            delete from Empleados where CodigoEmpleado=CodJefe;
            commit;
            fetch next from cursor1 into CodJefe;
        end;
    end while;
    close cursor1;
    
end //
    
delimiter ;
CALL borrar_Jefes();