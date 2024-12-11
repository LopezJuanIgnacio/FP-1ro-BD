create  database if not exists prueba;
use prueba;
drop if exists table alumnos;
create table alumnos (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50),
    fecha_nacimiento date,
    dni varchar(10) unique,
    check (length(dni) = 8 or length(dni) = 10)
);
create table notas (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_alumno int unique,
    nota int,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id) ON DELETE CASCADE ON UPDATE CASCADE
);

alter table alumnos add column apellido varchar(50);
alter table alumnos drop column apellido;
alter table alumnos modify column nombre varchar(100);
alter table alumnos modify column nombre Nombre;
alter table alumnos change column nombre nombre_alumno varchar(100);

rename table alumnos to estudiantes;
truncate table estudiantes; /*elimina registros de la tabla, pero no la tabla*/

add constraint fk_alumno foreign key (id_alumno) references alumnos(id) on delete cascade on update cascade;
add constraint nombre_unico unique (nombre_alumno);

drop if exists table alumnos;
drop if exists table notas;
drop if exists database prueba;

/*Resumen*/
create table coches(
    id int not null auto_increment primary key,
    marca varchar(50),
    modelo varchar(50),
    matricula varchar(10) unique,
    color varchar(20),
    codProp VARCHAR(10),
    constraint fk_Propietario foreign key (codProp) references propietarios(codProp) on delete cascade on update cascade,
    check (length(matricula) = 7 or length(matricula) = 8),
    check (color in ('rojo', 'verde', 'azul', 'amarillo'))
);