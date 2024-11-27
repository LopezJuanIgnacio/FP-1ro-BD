drop if exists database prueba;
create if not exists database prueba;
use prueba;
drop if exists table alumnos;
create table alumnos (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(50),
    fecha_nacimiento date,
);
create table notas (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_alumno int,
    nota int,
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id) ON DELETE CASCADE ON UPDATE CASCADE
);
