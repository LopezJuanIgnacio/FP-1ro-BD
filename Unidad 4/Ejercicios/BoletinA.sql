create database if not exists boletinA;
use boletinA;
/*1*/
create table peliculas(
    cod_pel int primary key not null check(cod_pel > 0),
    nom varchar(50) not null,
    director varchar(50),
    any year,
    genere enum('suspens', 'acció', 'terror', 'comèdia', 'drama', 'cienciafic'),
    visionada enum('si','no')
);
/*2*/
create table pais(
    nomene_p varchar(30) primary key,
    bandera varchar(70),
    renda float
);
create table ciutat(
    nomene_c varchar(40),
    habitants int,
    nomene_p varchar(30),
    primary key(nomene_c, nomene_p),
    foreign key (nomene_c) references pais(nomene_p)
);
/*3*/
create table plet(
    cod_plet int primary key,
    resultat enum('culpable', 'inocente', 'sobresegut')
);
create table recurs(
    cod_rec int,
    dat date,
    cod_plet int references plet(cod_plet),
    primary key(cod_rec, cod_plet)
);
/*4*/
create table empleat(
    cod_emp int primary key,
    telf varchar(9)
);
create table client(
    dni varchar(9) primary key,
    nom varchar(30),
    cognoms varchar(60)
);
create table cotxe(
    n_bastidor varchar(30) primary key,
    marca varchar(30),
    model varchar(15),
    color enum('rojo', 'verde', 'azul', 'amarillo'),
    matricula VARCHAR(7) unique
);
create table venda(
    cod_emp int not null references empleat(cod_emp),
    dni varchar(9) references client(dni),
    n_bastidor varchar(30) references cotxe(n_bastidor),
    fecha date not null,
    preu int not null check(preu > 0),
    primary key(dni, n_bastidor)
);
/*5*/
alter table plet add jutge varchar(50);
/*6*/
ALTER TABLE EMPLEAT ADD nom VARCHAR(50);
/*7*/
alter table venda modify preu float;
/*8*/
alter table peliculas drop director;
/*9*/
drop table peliculas;
/*10*/
ALTER TABLE CIUTAT ADD constraint habitanstMayorACero check(habitants > 0);