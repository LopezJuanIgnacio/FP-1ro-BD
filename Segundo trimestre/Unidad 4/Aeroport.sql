DROP SCHEMA IF EXISTS `aeroport` ;
CREATE SCHEMA  `aeroport` ;
USE `aeroport`;

Create table pais(
Codi varchar(9) primary key,
nom varchar(50)
);

Create table viatger(
dni varchar(9) primary key,
nom varchar(50),
Tel varchar(9),
Cog1 varchar(50),
Cog2 varchar(50),
Adre varchar(50)
);

Create table empleat(
Nemp int primary key,
nom varchar(50),
Tel varchar(9),
Cog1 varchar(50),
Cog2 varchar(50),
Adre varchar(50),
Data_ent date default '2017-09-09'
);

Create table ciutat(
nom varchar(50),
codpais varchar(9),
numHabitants int check(numHabitants >=0),
primary key(nom, codpais),
foreign key(codpais) references pais(Codi)
);

Create table aeroport(
Cod int auto_increment primary key,
nom varchar(50),
nomciu varchar(50) not null,
codpais varchar(9) not null,
foreign key(nomciu,codpais) references ciutat(nom,codpais)
);

Create table vol_gen(
num int primary key ,
hora time,
Codorig int not null,
Coddesti int not null,
foreign key(Codorig) references aeroport(Cod) on delete no action on update no action,
foreign key(Coddesti) references aeroport(Cod) on delete no action on update no action
);

Create table vol_real(
num int,
data_vol date default '2017-09-09',
Numplaces int check(Numplaces >= 0),
primary key(num, data_vol),
foreign key(num) references vol_gen(num) on delete cascade
);

Create table reserva(
num int,
data_res date default (CURDATE()),
Nemp int not null,
dni varchar(9),
primary key(num, data_res, dni),
foreign key(num, data_res) references vol_real(num, data_VOL) on delete cascade,
foreign key(Nemp) references empleat(Nemp),
foreign key(dni) references viatger(dni)
);