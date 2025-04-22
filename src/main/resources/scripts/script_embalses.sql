-- Cabecera creación BBDD
drop database if exists embalses;
create database embalses;
use embalses;

create table embalse(
	id int primary key auto_increment,
	localizador char(3),
	tipo varchar(50),
    nombre varchar(100),
    capacidad decimal(16,2),
    capacidad_actual decimal(16,2),
    provincia varchar(50),
    sistema varchar(50),
    cuenca varchar(50),
    rio varchar(100),
    localizacion varchar(250),
    presa varchar(100)
);

create table especie(
	id int primary key auto_increment,
    nombre_cientifico varchar(100),
    nombre_comun varchar(100),
    origen varchar(100),
    url_imagen varchar(250),
    peligro boolean default false
);

create table habitat(
	embalse int,
    especie int,
    constraint pk_habitat primary key(embalse, especie),
    constraint fk_embalse foreign key (embalse) references embalse(id),
    constraint fk_especie foreign key (especie) references especie(id)
);

CREATE TABLE authority (
    id INT AUTO_INCREMENT PRIMARY KEY,
    authority VARCHAR(50) NOT NULL
);

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    enabled BOOLEAN DEFAULT TRUE,
    authority int not null,
    foreign key (authority) references authority(id)
);

insert into authority (authority) values ('ADMIN');
insert into user (username, password, authority) values ('admin','admin', 1);