create schema if not exists ies;
use ies;

create table curso(
    anyo year,
    ciclo varchar(5),
    primary key(anyo,ciclo)
);

create table alumno(
    dni char(9) primary key,
    nombre varchar(50) not null,
    dir VARCHAR(100) default 'Blasco ibañez',
    anyo year,
    ciclo varchar(5),
    foreign key(anyo,ciclo) references curso(anyo,ciclo)  on delete cascade /*Borra al alumno si se borra el curso*/
    /*on delete set null les pone la foreign key en null*/ on update cascade /*Lo mismo pero cuando se cambie la clave primaria de la otra tabla tambien se cambie esta*/
);
