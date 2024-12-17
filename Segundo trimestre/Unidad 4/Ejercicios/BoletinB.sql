create database if not exists boletinB;

use boletinB;

/*2*/
create table
    b (
        b1 int,
        b2 int,
        b3 int not null,
        b4 int,
        primary key (b1, b2)
    );

create table
    c (
        c1 int,
        c2 int,
        c3 int not null,
        primary key (c1),
        unique (c3, c2),
        foreign key (c1, c2) references b (b1, b2)
    );

create table
    a (
        a1 int,
        a2 int,
        a3 int not null,
        primary key (a1, a2),
        foreign key (a2) references c (c1)
    );

/*3*/
create table
    producto (
        cod int not null auto_increment primary key,
        descripcion varchar(50),
        precio float
    );

create table
    empleado (
        DNI int not null primary key,
        nombre varchar(50) not null,
        ap1 varchar(50) not null,
        direccion varchar(50) not null,
        fecha_nacimiento date not null,
        categoria varchar(50),
        fecha_entrada date not null,
        salario float
    );

create table
    cliente (
        CIF int not null primary key,
        nombre varchar(50) not null,
        direccion varchar(50) not null,
        telefono int,
        id_Empleado int,
        foreign key (id_Empleado) references empleado (DNI)
    );

create table
    comando (
        num int not null auto_increment primary key,
        datos varchar(50) not null,
        cliente int,
        foreign key (cliente) references cliente (CIF)
    );

create table
    linea (
        cod int not null,
        num int not null,
        cantidad int not null,
        precio float not null,
        primary key (cod, num),
        foreign key (cod) references producto (cod),
        foreign key (num) references comando (num)
    );

/*4*/
CREATE TABLE
    socis (
        soci_no INT (4),
        cognoms VARCHAR(14),
        telefono CHAR(9) NOT NULL,
        data_alta DONAT DEFAULT '2012-01-01',
        direccion VARCHAR(20),
        codi_postal INT (5) CHECK (codi_postal BETWEEN 28000 AND 28999),
        CONSTRAINT PK_SOCIS PRIMARY KEY (soci_no),
        CONSTRAINT UQ_UNIQUE UNIQUE (cognoms),
    ) engine = innodb;

CREATE TABLE
    PRESTEM (
        num_prestem INT (2) PRIMARY KEY,
        soci_no INT (4),
        CONSTRAINT FK_SOCI_PRESTEM FOREIGN KEY (soci_no) REFERENCES socis (soci_no) ON UPDATE CASCADE
    ) engine = innodb;

alter table prestem
add column data_prestem timestamp default current_timestamp;

Alter table socis
add column cuota float;

Alter table add check (cuota > 5);

/*5*/
create table
    associacio (
        codi int auto_increment primary key,
        nom varchar(50),
        ubicacio varchar(50)
    ) engine = innodb;

alter table associacio modify column codi int (6);

create table
    alpinistes (
        nif int primary key,
        nom varchar(50),
        data_naixement date,
        codi int,
        data_ingres date,
        foreign key (codi) references associacio (codi) on delete set null
    ) engine = innodb;

alter table alpinistes modify column codi int (6);

alter table alpinistes
add column foto blob;

alter table alpinistes modify column data_ingres timestamp DEFAULT CURRENT_TIMESTAMP;

create table
    telefons (nif int, telefon int, primary key (nif, telefon)) engine = innodb;

alter table telefons add constraint fk_nif foreign key (nif) references alpinistes (nif) on delete cascade;

create table
    pics (
        nom varchar(50) primary key,
        alcada float,
        coordenades varchar(50),
        pais varchar(50)
    ) engine = innodb;

alter table pics
add column observacions varchar(200);

alter table pics add unique (coordenades);

create table
    escala (
        nif int,
        nom_pic varchar(50),
        data_inici date,
        temps int,
        oxigen int,
        cara varchar(50),
        primary key (nif, nom_pic),
        foreign key (nif) references alpinistes (nif) on delete cascade on update cascade,
        foreign key (nom_pic) references pics (nom) on delete cascade on update cascade
    ) engine = innodb;

/*6*/
CREATE TABLE
    ARTICLES (
        id_art INTEGER,
        nom VARCHAR(30) default '',
        preu NUMBER default 0.0,
        codi VARCHAR(7) default '',
        id_gru INTEGER default 0 NOT NULL references GRUPS (id_gru),
        CONSTRAINT ART_ID_PK PRIMARY KEY (id_art)
    ) engine = innodb;

CREATE TABLE
    CLIENTES (
        id_cli INTEGER NOT NULL,
        nom VARCHAR(60) default '' NOT NULL,
        direccio VARCHAR(80) default '',
        constraint cli_idc_pk PRIMARY KEY (id_cli)
    ) engine = innodb;

CREATE TABLE
    FACTURES (
        id_fac INTEGER NOT NULL,
        serie VARCHAR(1) default '' NOT NULL,
        num INTEGER default 0 NOT NULL,
        any date,
        id_cli INTEGER default 0 NOT NULL references CLIENTES (id_cli),
        id_vene INTEGER NOT NULL references VENEDORS (id_vene),
        CONSTRAINT FAC_IDF_PK PRIMARY KEY (id_fac)
    ) engine = innodb;

CREATE TABLE
    GRUPS (
        id_gru INTEGER,
        descripcio VARCHAR(15) default '' NOT NULL,
        CONSTRAINT GRU_IDG_PK PRIMARY KEY (id_gru)
    ) engine = innodb;

CREATE TABLE
    LINIES_FACTURA (
        id_lin INTEGER NOT NULL,
        id_fac INTEGER default 0 NOT NULL references FACTURES (id_fac),
        impo FLOAT default 0 NOT NULL,
        id_art INTEGER NOT NULL references ARTICLES (id_art),
        quantitat INTEGER NOT NULL,
        any data default '01/01/2000' NOT NULL,
        id_suc INTEGER default 0 NOT NULL references SUCURSALS (id_suc),
        constraint LIN_PK PRIMARY KEY (id_lin, factura)
    ) engine = innodb;

CREATE TABLE
    SUCURSALS (
        id_suc INTEGER NOT NULL,
        descripcio VARCHAR(15) default '' NOT NULL,
        CONSTRAINT SUC_IDS_PK PRIMARY KEY (id_suc)
    ) engine = innodb;

CREATE TABLE
    VENEDORS (
        id_vene INTEGER NOT NULL,
        nom VARCHAR(50) default '' NOT NULL,
        data_ingres date default '01-01-2000' NOT NULL,
        salari float default 0 NOT NULL,
        CONSTRAINT VENE_IDV_PK PRIMARY KEY (id_vene)
    ) engine = innodb;