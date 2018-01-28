DROP DATABASE IF EXISTS TorneoDeFutbol;
CREATE DATABASE TorneoDeFutbol;
use TorneoDeFutbol;

CREATE TABLE CANCHAS(
canId int(5) NOT NULL auto_increment,
canNombre varchar(600),
canDomicilio varchar(1000),
PRIMARY KEY(canId)
);

CREATE TABLE CLUBES(
cluId int(5) NOT NULL auto_increment,
cluNombre varchar(1000),
cluDomicilio varchar(1000),
PRIMARY KEY(cluId)
);

CREATE TABLE INSCRIPCIONES(
insId int(10) NOT NULL auto_increment,
canId int,
cluId int,
insFechaInscripcion timestamp,
PRIMARY KEY(insId),
FOREIGN KEY(canId) REFERENCES CANCHAS(canId),
FOREIGN KEY(cluId) REFERENCES CLUBES(cluId)
);

CREATE TABLE JUGADORES(
jugTipoDocumento int NOT NULL,
jugNroDocumento varchar(100) NOT NULL,
jugNombre varchar(100) NOT NULL,
jugApellido varchar(100) NOT NULL,
jugFechaNacimiento DATETIME,
PRIMARY KEY(jugTipoDocumento, jugNroDocumento)
);

CREATE TABLE DETALLES_INSCRIPCION(
dinId int(10) NOT NULL auto_increment,
jugTipoDocumento int,
jugNroDocumento varchar(100),
PRIMARY KEY(dinId),
FOREIGN KEY(jugTipoDocumento, jugNroDocumento) REFERENCES JUGADORES(jugTipoDocumento, jugNroDocumento)
);

CREATE TABLE GOLES(
golId BIGINT NOT NULL auto_increment,
golEnContra CHAR(1) NOT NULL,
golTiempoJuego DATETIME,
PRIMARY KEY(golId) 
);

CREATE TABLE ESTADOS(
estId int(10) NOT NULL auto_increment,
estAmbito char(1) NOT NULL,
estNombre varchar(50) NOT NULL,
estDescripcion varchar(1000),
PRIMARY KEY(estId)
);

CREATE TABLE PARTIDOS(
parId BIGINT NOT NULL auto_increment,
estId int(10),
parFecha DATETIME,
parId_GanadorPartidoLocal BIGINT,
parId_GanadorPartidoVisitante BIGINT,
cluId_Local int(5),
parNombre varchar(100),
parPuntajeObtenidoVisitante int(10),
parPuntajeObtenidoLocal int(10),
cluId_Visitante int(5),
PRIMARY KEY(parId),
FOREIGN KEY(parId_GanadorPartidoLocal) REFERENCES PARTIDOS(parId),
FOREIGN KEY(parId_GanadorPartidoVisitante) REFERENCES PARTIDOS(parId),
FOREIGN KEY(cluId_Local) REFERENCES CLUBES(cluId),
FOREIGN KEY(cluId_Visitante) REFERENCES CLUBES(cluId)
);

CREATE TABLE TIPOS_SANCIONES(
tsaId int(10) NOT NULL auto_increment,
tsaNombre varchar(500),
tsaDescripcion varchar(500),
PRIMARY KEY(tsaId)
);

CREATE TABLE ACTUACIONES_JUGADORES(
acjId int(10) NOT NULL auto_increment,
acjCalificacion int(10),
golId bigint,
parId bigint,
acjTiempoJugado datetime,
acjTitular char(1),
dinId int(10),
PRIMARY KEY(acjId),
FOREIGN KEY(parId) REFERENCES PARTIDOS(parId),
FOREIGN KEY(dinId) REFERENCES DETALLES_INSCRIPCION(dinId)
);

CREATE TABLE SANCIONES(
sanId int(10) NOT NULL auto_increment,
sanCantidadPartidosExpulsado int(5),
sanTiempoJuego DATETIME,
tsaId int(10),
acjId int(10),
PRIMARY KEY(sanId),
FOREIGN KEY(tsaId) REFERENCES TIPOS_SANCIONES(tsaId),
FOREIGN KEY(acjId) REFERENCES ACTUACIONES_JUGADORES(acjId)
);

CREATE TABLE ROLES(
rolId int(50) NOT NULL auto_increment,
rolNombre varchar(500),
PRIMARY KEY(rolId)
);

CREATE TABLE ARBITROS(
arbId int(50) NOT NULL auto_increment,
arbNombre varchar(500),
arbApellido varchar(500),
arbDni varchar(1000),
arbFechaNac datetime,
PRIMARY KEY(arbId)
);

CREATE TABLE ASIGNACIONES(
asiId int(50) NOT NULL auto_increment,
rolId int(50),
arbId int(50),
parId bigint,
PRIMARY KEY(asiId),
FOREIGN KEY(rolId) REFERENCES ROLES(rolId),
FOREIGN KEY(arbId) REFERENCES ARBITROS(arbId),
FOREIGN KEY (parId) REFERENCES PARTIDOS(parId)
);

CREATE TABLE TIPOS_CAMPEONATOS(
tcaId int(10) NOT NULL auto_increment,
tcaNombre varchar(100),
tcaMesInicioSugerido varchar(500),
PRIMARY KEY(tcaId)
);

CREATE TABLE SISTEMA_CAMPEONATO(
scaId int(10) NOT NULL auto_increment,
scaCaracteristicas varchar(3000),
scaNombre varchar(500),
scaValorPartidoGanado int(50),
scaValorPartidoEmpatado int(50),
PRIMARY KEY(scaId)
);

CREATE TABLE CAMPEONATO(
camId int(10) NOT NULL auto_increment,
camFechaDeFin datetime,
camFechaDeInicio datetime,
tcaId int(10),
scaId int(10),
PRIMARY KEY(camId),
FOREIGN KEY(tcaId) REFERENCES TIPOS_CAMPEONATOS(tcaId),
FOREIGN KEY(scaId) REFERENCES SISTEMA_CAMPEONATO(scaId)
);

INSERT INTO CLUBES(cluNombre) VALUES('Egipto'), ('Marruecos'), 
('Nigeria'), ('Senegal'), ('Túnez'), ('Arabia Saudí'), ('Australia'), ('Japón'),
('República de Corea'),('RI de Irán'), ('Alemania'), ('Bélgica'), ('Croacia'), 
('Dinamarca'), ('España'), ('Francia'), ('Inglaterra'), ('Islandia'), ('Polonia'), 
('Portugal'), ('Rusia'), ('Serbia'), ('Suecia'), ('Suiza'), ('Costa Rica'), 
('México'), ('Panamá'), ('Argentina'), ('Brasil'), ('Colombia'), ('Perú'), ('Uruguay');

