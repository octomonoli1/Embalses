-- Cabecera creación BBDD
drop database if exists embalses;
create database embalses;
use embalses;

-- Creación del DDL
create table tipo_presa(
	id int primary key auto_increment,
    nombre varchar(100)
);

create table comunidad_autonoma(
	cod int primary key,
    nombre varchar(250)
);

create table provincia(
	cod int primary key,
    nombre varchar(250),
    comunidad int,
    constraint fk_comunidad foreign key (comunidad) references comunidad_autonoma(cod)
);

create table localidad(
	cod_postal int primary key,
    nombre varchar(250),
    provincia int,
    constraint fk_provincia foreign key (provincia) references provincia(cod)
);

create table embalse(
	id int primary key auto_increment,
    nombre varchar(100),
    capacidad decimal(16,2),
    porcentaje_actual decimal(16,2),
    es_navegable boolean default false,
    localidad int,
    constraint fk_localidad foreign key (localidad) references localidad(cod_postal)
);

create table imagen(
	id int primary key auto_increment,
    nombre varchar(100),
    url varchar(250)
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

-- Inserts 
INSERT INTO tipo_presa (nombre) VALUES ('Presa de gravedad');
INSERT INTO tipo_presa (nombre) VALUES ('Presa de arco');
INSERT INTO tipo_presa (nombre) VALUES ('Presa de tierra');
INSERT INTO tipo_presa (nombre) VALUES ('Presa de contrafuerte');
INSERT INTO tipo_presa (nombre) VALUES ('Presa de enrocado');
INSERT INTO tipo_presa (nombre) VALUES ('Presa de materiales sueltos');


INSERT INTO comunidad_autonoma (cod, nombre) VALUES (1, 'Andalucía');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (2, 'Cataluña');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (3, 'Madrid');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (4, 'Castilla y León');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (5, 'Galicia');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (6, 'Castilla-La Mancha');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (7, 'País Vasco');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (8, 'Valencia');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (9, 'Aragón');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (10, 'Extremadura');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (11, 'Cantabria');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (12, 'Murcia');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (13, 'Baleares');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (14, 'La Rioja');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (15, 'Asturias');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (16, 'Navarra');
INSERT INTO comunidad_autonoma (cod, nombre) VALUES (17, 'Canarias');



INSERT INTO provincia (cod, nombre, comunidad) VALUES (1, 'Almería', 1);  -- Andalucía
INSERT INTO provincia (cod, nombre, comunidad) VALUES (2, 'Cádiz', 1);  -- Andalucía
INSERT INTO provincia (cod, nombre, comunidad) VALUES (3, 'Córdoba', 1);  -- Andalucía
INSERT INTO provincia (cod, nombre, comunidad) VALUES (4, 'Granada', 1);  -- Andalucía
INSERT INTO provincia (cod, nombre, comunidad) VALUES (5, 'Huelva', 1);  -- Andalucía
INSERT INTO provincia (cod, nombre, comunidad) VALUES (6, 'Jaén', 1);  -- Andalucía
INSERT INTO provincia (cod, nombre, comunidad) VALUES (7, 'Málaga', 1);  -- Andalucía
INSERT INTO provincia (cod, nombre, comunidad) VALUES (8, 'Sevilla', 1);  -- Andalucía
INSERT INTO provincia (cod, nombre, comunidad) VALUES (9, 'Barcelona', 2);  -- Cataluña
INSERT INTO provincia (cod, nombre, comunidad) VALUES (10, 'Girona', 2);  -- Cataluña
INSERT INTO provincia (cod, nombre, comunidad) VALUES (11, 'Lleida', 2);  -- Cataluña
INSERT INTO provincia (cod, nombre, comunidad) VALUES (12, 'Tarragona', 2);  -- Cataluña
INSERT INTO provincia (cod, nombre, comunidad) VALUES (13, 'Madrid', 3);  -- Madrid
INSERT INTO provincia (cod, nombre, comunidad) VALUES (14, 'Ávila', 4);  -- Castilla y León
INSERT INTO provincia (cod, nombre, comunidad) VALUES (15, 'Burgos', 4);  -- Castilla y León
INSERT INTO provincia (cod, nombre, comunidad) VALUES (16, 'León', 4);  -- Castilla y León
INSERT INTO provincia (cod, nombre, comunidad) VALUES (17, 'Palencia', 4);  -- Castilla y León
INSERT INTO provincia (cod, nombre, comunidad) VALUES (18, 'Salamanca', 4);  -- Castilla y León
INSERT INTO provincia (cod, nombre, comunidad) VALUES (19, 'Segovia', 4);  -- Castilla y León
INSERT INTO provincia (cod, nombre, comunidad) VALUES (20, 'Soria', 4);  -- Castilla y León
INSERT INTO provincia (cod, nombre, comunidad) VALUES (21, 'Valladolid', 4);  -- Castilla y León
INSERT INTO provincia (cod, nombre, comunidad) VALUES (22, 'Zamora', 4);  -- Castilla y León
INSERT INTO provincia (cod, nombre, comunidad) VALUES (23, 'A Coruña', 5);  -- Galicia
INSERT INTO provincia (cod, nombre, comunidad) VALUES (24, 'Lugo', 5);  -- Galicia
INSERT INTO provincia (cod, nombre, comunidad) VALUES (25, 'Ourense', 5);  -- Galicia
INSERT INTO provincia (cod, nombre, comunidad) VALUES (26, 'Pontevedra', 5);  -- Galicia
INSERT INTO provincia (cod, nombre, comunidad) VALUES (27, 'Albacete', 6);  -- Castilla-La Mancha
INSERT INTO provincia (cod, nombre, comunidad) VALUES (28, 'Ciudad Real', 6);  -- Castilla-La Mancha
INSERT INTO provincia (cod, nombre, comunidad) VALUES (29, 'Cuenca', 6);  -- Castilla-La Mancha
INSERT INTO provincia (cod, nombre, comunidad) VALUES (30, 'Guadalajara', 6);  -- Castilla-La Mancha
INSERT INTO provincia (cod, nombre, comunidad) VALUES (31, 'Toledo', 6);  -- Castilla-La Mancha
INSERT INTO provincia (cod, nombre, comunidad) VALUES (32, 'Álava', 7);  -- País Vasco
INSERT INTO provincia (cod, nombre, comunidad) VALUES (33, 'Bizkaia', 7);  -- País Vasco
INSERT INTO provincia (cod, nombre, comunidad) VALUES (34, 'Gipuzkoa', 7);  -- País Vasco
INSERT INTO provincia (cod, nombre, comunidad) VALUES (35, 'Valencia', 8);  -- Comunidad Valenciana
INSERT INTO provincia (cod, nombre, comunidad) VALUES (36, 'Alicante', 8);  -- Comunidad Valenciana
INSERT INTO provincia (cod, nombre, comunidad) VALUES (37, 'Castellón', 8);  -- Comunidad Valenciana
INSERT INTO provincia (cod, nombre, comunidad) VALUES (38, 'Huesca', 9);  -- Aragón
INSERT INTO provincia (cod, nombre, comunidad) VALUES (39, 'Teruel', 9);  -- Aragón
INSERT INTO provincia (cod, nombre, comunidad) VALUES (40, 'Zaragoza', 9);  -- Aragón
INSERT INTO provincia (cod, nombre, comunidad) VALUES (41, 'Badajoz', 10);  -- Extremadura
INSERT INTO provincia (cod, nombre, comunidad) VALUES (42, 'Cáceres', 10);  -- Extremadura
INSERT INTO provincia (cod, nombre, comunidad) VALUES (43, 'Cantabria', 11);  -- Cantabria
INSERT INTO provincia (cod, nombre, comunidad) VALUES (44, 'Murcia', 12);  -- Región de Murcia
INSERT INTO provincia (cod, nombre, comunidad) VALUES (45, 'Palma', 13);  -- Islas Baleares
INSERT INTO provincia (cod, nombre, comunidad) VALUES (46, 'Ibiza', 13);  -- Islas Baleares
INSERT INTO provincia (cod, nombre, comunidad) VALUES (47, 'Formentera', 13);  -- Islas Baleares
INSERT INTO provincia (cod, nombre, comunidad) VALUES (48, 'Logroño', 14);  -- La Rioja
INSERT INTO provincia (cod, nombre, comunidad) VALUES (49, 'Asturias', 15);  -- Asturias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (50, 'Gijón', 15);  -- Asturias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (51, 'Avilés', 15);  -- Asturias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (52, 'Navarra', 16);  -- Navarra
INSERT INTO provincia (cod, nombre, comunidad) VALUES (53, 'Las Palmas', 17);  -- Canarias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (54, 'Santa Cruz de Tenerife', 17);  -- Canarias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (55, 'La Gomera', 17);  -- Canarias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (56, 'La Palma', 17);  -- Canarias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (57, 'Tenerife', 17);  -- Canarias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (58, 'Fuerteventura', 17);  -- Canarias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (59, 'Lanzarote', 17);  -- Canarias
INSERT INTO provincia (cod, nombre, comunidad) VALUES (60, 'El Hierro', 17);  -- Canarias

INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14001, 'Córdoba', 3);  -- Córdoba (capital)
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14002, 'Almodóvar del Río', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14003, 'Baena', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14004, 'Montilla', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14005, 'Pozoblanco', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14006, 'Priego de Córdoba', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14007, 'Lucena', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14008, 'Belmez', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14009, 'La Carlota', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14010, 'Montoro', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14011, 'Cabra', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14012, 'Villanueva de Córdoba', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14013, 'Puente Genil', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14014, 'Fernán Núñez', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14015, 'Espejo', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14016, 'Alcaracejos', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14017, 'Adamuz', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14018, 'Rute', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14019, 'Fuente Palmera', 3);  -- Córdoba
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (14020, 'Iznájar', 3);  -- Córdoba

INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41001, 'Sevilla', 8);  -- Sevilla (capital)
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41002, 'Alcalá de Guadaíra', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41003, 'Camas', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41004, 'Dos Hermanas', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41005, 'Mairena del Aljarafe', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41006, 'Écija', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41007, 'Utrera', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41008, 'La Rinconada', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41009, 'Alcalá del Río', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41010, 'Coria del Río', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41011, 'Brenes', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41012, 'Los Palacios y Villafranca', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41013, 'Sanlúcar la Mayor', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41014, 'Lora del Río', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41015, 'Mairena del Alcor', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41016, 'Castilleja de la Cuesta', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41017, 'Carmona', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41018, 'La Algaba', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41019, 'Tomares', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41020, 'Albaida del Aljarafe', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41021, 'Aznalcóllar', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41022, 'Bormujos', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41023, 'Camas', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41024, 'Cantillana', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41025, 'Castilleja de Guzmán', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41026, 'Castilleja del Campo', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41027, 'El Viso del Alcor', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41028, 'Estepa', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41029, 'Fuentes de Andalucía', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41030, 'La Puebla del Río', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41031, 'La Rinconada', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41032, 'Lantejuela', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41033, 'Los Corrales', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41034, 'Mairena del Alcor', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41035, 'Marchena', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41036, 'Olivares', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41037, 'Osuna', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41038, 'Pedrera', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41039, 'Peñaflor', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41040, 'La Campana', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41041, 'Los Palacios y Villafranca', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41042, 'Salteras', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41043, 'San Juan de Aznalfarache', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41044, 'Sanlúcar la Mayor', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41045, 'Sevilla la Nueva', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41046, 'Tocina', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41047, 'Tomares', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41048, 'Umbrete', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41049, 'Villanueva del Ariscal', 8);  -- Sevilla
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (41050, 'Villanueva de San Juan', 8);  -- Sevilla

INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11001, 'Cádiz', 2);  -- Cádiz (capital)
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11002, 'Algeciras', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11003, 'San Fernando', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11004, 'Jerez de la Frontera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11005, 'Chiclana de la Frontera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11006, 'Puerto Real', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11007, 'La Línea de la Concepción', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11008, 'Rota', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11009, 'Conil de la Frontera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11010, 'El Puerto de Santa María', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11011, 'Sanlúcar de Barrameda', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11012, 'Barbate', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11013, 'Vejer de la Frontera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11014, 'La Isla', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11015, 'Algodonales', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11016, 'Bornos', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11017, 'Benalup-Casas Viejas', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11018, 'Castellar de la Frontera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11019, 'Tarifa', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11020, 'Jimena de la Frontera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11021, 'La Línea', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11022, 'Trebujena', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11023, 'Chiclana de la Frontera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11024, 'El Bosque', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11025, 'Puerto de Santa María', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11026, 'El Gastor', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11027, 'Paterna de Rivera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11028, 'Benalup', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11029, 'Benaocaz', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11030, 'Arcos de la Frontera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11031, 'Cortes de la Frontera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11032, 'Ubrique', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11033, 'Setenil de las Bodegas', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11034, 'Villamartín', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11035, 'Espera', 2);  -- Cádiz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (11036, 'Algodonales', 2);  -- Cádiz

INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21001, 'Huelva', 5);  -- Huelva (capital)
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21002, 'Lepe', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21003, 'Ayamonte', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21004, 'Almonte', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21005, 'Rociana del Condado', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21006, 'Cartaya', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21007, 'Punta Umbría', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21008, 'San Juan del Puerto', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21009, 'Niebla', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21010, 'Bollullos Par del Condado', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21011, 'Chucena', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21012, 'Aljaraque', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21013, 'Trigueros', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21014, 'La Palma del Condado', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21015, 'Valverde del Camino', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21016, 'Villarrasa', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21017, 'Gibraleón', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21018, 'Isla Cristina', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21019, 'La Antilla', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21020, 'Tharsis', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21021, 'Cumbres Mayores', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21022, 'Cumbres de San Bartolomé', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21023, 'El Campillo', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21024, 'Hinojos', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21025, 'Mancomunidad del Condado de Huelva', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21026, 'Villanueva de los Castillejos', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21027, 'Zalamea la Real', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21028, 'Cabezas Rubias', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21029, 'Aracena', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21030, 'Cumbres de San Bartolomé', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21031, 'Fuenteheridos', 5);  -- Huelva
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (21032, 'Galaroza', 5);  -- Huelva

-- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06001, 'Badajoz', 41);  -- Badajoz (capital)
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06002, 'Mérida', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06003, 'Zafra', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06004, 'Don Benito', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06005, 'Villanueva de la Serena', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06006, 'Almendralejo', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06007, 'Badajoz', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06008, 'Montijo', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06009, 'Jerez de los Caballeros', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06010, 'Olivenza', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06011, 'Almendralejo', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06012, 'Fregenal de la Sierra', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06013, 'Badajoz', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06014, 'Villafranca de los Barros', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06015, 'Badajoz', 41);  -- Badajoz
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (06016, 'Fuente de Cantos', 41);  -- Badajoz

-- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10001, 'Cáceres', 42);  -- Cáceres (capital)
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10002, 'Plasencia', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10003, 'Navalmoral de la Mata', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10004, 'Moraleja', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10005, 'Coria', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10006, 'Trujillo', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10007, 'Miajadas', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10008, 'Don Benito', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10009, 'Caminomorisco', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10010, 'Jaraíz de la Vera', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10011, 'Casar de Cáceres', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10012, 'Berlanga', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10013, 'Alcuéscar', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10014, 'Arroyo de la Luz', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10015, 'Hervás', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10016, 'Valencia de Alcántara', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10017, 'Badajoz', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10018, 'La Vera', 42);  -- Cáceres
INSERT INTO localidad (cod_postal, nombre, provincia) VALUES (10019, 'Cáceres', 42);  -- Cáceres

INSERT INTO embalse (nombre, capacidad, porcentaje_actual, es_navegable, localidad) VALUES 
('Embalse de la Breña I', 320.50, 75.20, false, 14002), 
('Embalse de la Breña II', 390.00, 65.45, true, 14002),  
('Embalse de Iznájar', 1150.00, 80.50, true, 14020),  
('Embalse de Cordobilla', 52.90, 55.00, false, 14002),  
('Embalse de San Rafael de Navallana', 120.00, 50.30, true, 14001), 
('Embalse de Guadalhorce', 115.00, 60.00, true, 14012),
('Embalse de La Colada', 46.00, 45.00, false, 14005),  
('Embalse de Zuheros', 40.00, 50.00, false, 14006),
('Embalse de Ochavillo', 85.60, 65.00, true, 14007);  


INSERT INTO especie (nombre_cientifico, nombre_comun, origen, url_imagen, peligro) VALUES
('Salmo trutta', 'Trucha común', 'Europa, Asia', 'https://example.com/trucha_comun.jpg', false),
('Oncorhynchus mykiss', 'Trucha arcoíris', 'América del Norte', 'https://example.com/trucha_arcoiris.jpg', false),
('Esox lucius', 'Lucio', 'Europa, Asia, América del Norte', 'https://example.com/lucio.jpg', false),
('Perca fluviatilis', 'Perca europea', 'Europa, Asia', 'https://example.com/perca_europea.jpg', false),
('Cyprinus carpio', 'Carpa común', 'Asia', 'https://example.com/carpa_comun.jpg', false),
('Silurus glanis', 'Siluro', 'Europa, Asia', 'https://example.com/siluro.jpg', false),
('Sander lucioperca', 'Lucio perca', 'Europa y Asia', 'https://example.com/lucio_perca.jpg', false),
('Alosa alosa', 'Salmón atlántico', 'Ríos de Europa y norte de África', 'https://example.com/salmon_atlantico.jpg', false),
('Anguilla anguilla', 'Anguila europea', 'Europa, Asia', 'https://example.com/anguilla_europea.jpg', true),
('Barbus barbus', 'Barbo común', 'Europa, Asia Occidental', 'https://example.com/barbo_comun.jpg', false),
('Chondrostoma nasus', 'Cacho', 'Europa, España', 'https://example.com/cacho.jpg', false),
('Chondrostoma turbidi', 'Boga', 'España', 'https://example.com/boga.jpg', true),
('Micropterus salmoides', 'Black bass', 'América del Norte', 'https://example.com/black_bass.jpg', false);


use embalses;
select * from embalse;