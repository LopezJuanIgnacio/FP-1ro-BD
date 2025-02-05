DROP SCHEMA IF EXISTS `restaurante` ;
CREATE SCHEMA  `restaurante` ;
USE `restaurante`;

Create table empleat(
DNI varchar(9) primary key,
Nom varchar(50),
Cognoms varchar(50),
mobil varchar(9),
ss varchar(9) unique);

Create table plat(
Nom varchar(50) primary key,
preu decimal(5,2) check (preu >= 0),
tipus varchar(50));

Create table ingredient(
codi varchar(9)primary key,
Nom varchar(50)
);

/*anysServ lo interprete como un año, pero podria ser el numero cantidad de años en el restaurante o una fecha*/
Create table cuiner(
DNI varchar(9)primary key,
anysServ year  check (anysServ >= 0),
foreign key(DNI) references empleat(DNI) on delete cascade
);

Create table preparar(
Nom varchar(50), 
dni varchar(9),
primary key(Nom,dni),
foreign key(dni) references empleat(DNI) on delete cascade,
foreign key(Nom) references plat(nom) on update cascade
);

Create table punxe(
DNI varchar(9) primary key,
dataNac date not null default '2017-09-09',
DNIcuiner varchar(9),
foreign key(DNI) references empleat(DNI) on delete cascade,
foreign key(DNIcuiner) references cuiner(DNI) on delete cascade
);

Create table porta(
Nom varchar(50),
Codi varchar(9),
Quantitat int check(Quantitat >=0),
primary key(Nom, codi),
foreign key(Codi) references ingredient(Codi) on delete no action on update no action,
foreign key(Nom) references plat(Nom) on update cascade
);