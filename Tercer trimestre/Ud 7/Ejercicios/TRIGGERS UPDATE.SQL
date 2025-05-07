/*1*/
create table trabajador (id int auto_increment,
nombre varchar(30),
salario decimal(6,2),
tipoJornada varchar(20) not null,
FechaNac Date,
Edad int,
primary key (id));

delimiter //
create trigger bef_ins_tra before insert on trabajador
for each row
begin
	if(new.tipoJornada not in ('COMPLETA', 'MEDIA')) then
		set new.tipoJornada = 'MEDIA';
	end if;
    if(new.tipoJornada like'MEDIA' and new.salario <500) then
		set new.salario = 500;
	end if;
    if(new.tipoJornada like'COMPLETA' and new.salario <1000) then
		set new.salario = 1000;
	end if;
    set new.edad=truncate(datediff(now(),new.FechaNac)/365,0);
end //

delimiter ;
insert into trabajador values(null,'Pepe',800,'COMPLETA','2000-01-01',96);
SELECT * FROM trabajador;

/*2*/
delimiter //
create trigger bef_upd_tra before update on trabajador
for each row
begin
	 if(new.tipoJornada not in ('COMPLETA', 'MEDIA')) then
		set new.tipoJornada = old.tipoJornada ;
	end if;
    
	if(new.tipoJornada like old.tipoJornada and (old.salario - new.salario > old.salario*0.1 and new.salario - old.salario > old.salario*0.1)) then
		set new.salario =  old.salario*1.1;
	elseif(new.tipoJornada like 'COMPLETA' and old.tipoJornada like 'MEDIA' and new.salario <1000) then
		set new.salario = 1000;
	elseif(new.tipoJornada like 'MEDIA' and old.tipoJornada like 'COMPLETA' and new.salario < 500) then
		set new.salario = 500;
	end if;
    
end //

delimiter ;
insert into trabajador values(null,'Ana',800,'MEDIA','2022-01-01',96);
UPDATE trabajador
SET TipoJornada='COMPLETA', SALARIO=100;
SELECT * FROM trabajador;

/*3*/
create table AuditorTrabajador (
NumOperacion int primary key auto_increment,
IdTrabajador int(11),
hora timestamp default CURRENT_TIMESTAMP,
tipo varchar(10),
usuario varchar(100));

delimiter //
create trigger aft_upd_tra after update on trabajador
for each row
begin
	insert into AuditorTrabajador values (null, new.id, default, 'UPD', user());
end //
create trigger aft_ins_tra after insert on trabajador
for each row
begin
	insert into AuditorTrabajador values (null, new.id, default, 'INS', user());
end //
create trigger aft_del_tra after delete on trabajador
for each row
begin
	insert into AuditorTrabajador values (null, old.id, default, 'DEL', user());
end //

delimiter ;
insert into trabajador values(null,'Rocío',1800,'COMPLETA','1995-01-01',25);
UPDATE trabajador
SET TipoJornada='COMPLETA', SALARIO=100;
DELETE FROM Trabajador where Id=1;
SELECT * FROM AuditorTrabajador;

/*4*/
delimiter //
create trigger bef_ins_cli before insert on clientes
for each row
begin
if new.limiteCredito<50 and new.pais='España' then
set new.limiteCredito=50;
end if;
end //
create trigger bef_upd_cli before update on clientes
for each row
begin
if new.limiteCredito<50 and new.pais='España' then
set new.limiteCredito=50;
end if;
end //