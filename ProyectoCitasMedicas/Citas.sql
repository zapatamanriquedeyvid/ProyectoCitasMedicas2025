-- Active: 1758918205033@@127.0.0.1@3306@citasmedicas2025
DROP DATABASE IF EXISTS CITASMEDICAS2025;
CREATE DATABASE CITASMEDICAS2025;
USE CITASMEDICAS2025;

 CREATE TABLE APODERADO (
    id_apod INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(50) NOT NULL,
    nro_documento VARCHAR(10) NOT NULL,
    nombre_apod VARCHAR(100) NOT NULL,
    apellido_apod VARCHAR(100) NOT NULL,
    parentesco ENUM('PADRE','MADRE','APODERADO') NOT NULL,
    celular_apod CHAR(9) NOT NULL,
    correo_apod VARCHAR(50) NOT NULL
);
 
CREATE TABLE PACIENTE (
    id_paciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(50) NOT NULL,
    nro_documento VARCHAR(10) NOT NULL,
    nombre_paciente VARCHAR(100) NOT NULL,
    apellido_paterno VARCHAR(100) NOT NULL,
    apellido_materno VARCHAR(100) NOT NULL,
    fecha_nac DATE NOT NULL,
    sexo CHAR(1) NOT NULL,
    lugar_naci VARCHAR(100) NOT NULL,
    procedencia VARCHAR(100) NOT NULL,
    tipo_paciente VARCHAR(50) NOT NULL,
    id_apod INT  NOT NULL,
    CONSTRAINT `fk_idApoderado` FOREIGN KEY (`id_apod`) REFERENCES `APODERADO` (`id_apod`)
);

CREATE TABLE USUARIO(
    id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_usuario VARCHAR(100) NOT NULL,
    contraseña VARCHAR(100) NOT NULL,
    cargo VARCHAR(100) NOT NULL
);

CREATE TABLE ESPECIALIDAD(
    id_especialidad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom_especialidad VARCHAR(100) NOT NULL
);

CREATE TABLE MEDICO (
    id_medico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dni_medico CHAR(8) NOT NULL,
    nombre_medico VARCHAR(100) NOT NULL,
    apellido_medico VARCHAR(100) NOT NULL,
    telef_medico CHAR(9) NOT NULL,
    correo_medico VARCHAR(50) NOT NULL,
    id_especialidad INT  NOT NULL,
    id_usuario INT  NOT NULL,
    CONSTRAINT `fk_idUsuarioMedico` FOREIGN KEY (`id_usuario`) REFERENCES `USUARIO` (`id_usuario`),
    CONSTRAINT `fk_idEspecialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `ESPECIALIDAD` (`id_especialidad`)

);


CREATE TABLE  DIA_TRABAJO(
    id_diaTrabajo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dia_semana VARCHAR(20) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    id_medico INT  NOT NULL,
    CONSTRAINT `fk_idMedicoDia` FOREIGN KEY (`id_medico`) REFERENCES `MEDICO` (`id_medico`)
);

CREATE TABLE CITA(
    id_cita INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fecha_cita DATE NOT NULL,
    hora_cita TIME NOT NULL,
    tipo_atencion VARCHAR(100) DEFAULT 'CONSULTA MEDICA',
    fecha_emision DATETIME,
    estado ENUM('PENDIENTE', 'ATENDIDA') DEFAULT 'PENDIENTE',
    id_medico INT  NOT NULL,
    id_paciente INT  NOT NULL,
    CONSTRAINT `fk_idMedicoCita` FOREIGN KEY (`id_medico`) REFERENCES `MEDICO` (`id_medico`),
    CONSTRAINT `fk_idPacienteCita` FOREIGN KEY (`id_paciente`) REFERENCES `PACIENTE` (`id_paciente`)
);

CREATE TABLE ADMINISTRADOR(
    id_administrador INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dni_admin CHAR(8) NOT NULL,
    nombre_admin VARCHAR(100) NOT NULL,
    apellido_admin VARCHAR(100) NOT NULL,
    telef_admin CHAR(9) NOT NULL,
    correo_admin VARCHAR(50) NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT `fk_idUsuarioAdmin` FOREIGN KEY (`id_usuario`) REFERENCES `USUARIO` (`id_usuario`),
    CONSTRAINT `uq_idUsuarioAdmin` UNIQUE (`id_usuario`)
);

-- ALTER TABLE APODERADO DROP INDEX uq_rrodocapod;

-- Apoderado
ALTER TABLE apoderado
ADD CONSTRAINT `uq_rrodocapod` UNIQUE (`nro_documento`),
ADD CONSTRAINT `uq_celapod` UNIQUE (`celular_apod`),
ADD CONSTRAINT `chk_celapod` CHECK (`celular_apod` REGEXP '9[0-9]{8}$'),
ADD CONSTRAINT `uq_correoapod` UNIQUE (`correo_apod`),
ADD CONSTRAINT `chk_correoapod` CHECK (`correo_apod` LIKE '%@%.%'),
ADD CONSTRAINT `chk_dniapod` CHECK (`nro_documento` REGEXP '^[0-9]{8}$|^[0-9]{10}$'),
ADD CONSTRAINT `chk_parent` CHECK (`parentesco` IN ('PADRE','MADRE','APODERADO'));


-- Paciente
ALTER TABLE paciente
ADD CONSTRAINT `uq_pac_documento` UNIQUE (`nro_documento`),
ADD CONSTRAINT `chk_tipo_documento` CHECK (`tipo_documento` IN ('DNI', 'CARNET DE EXTRANJERIA')),
ADD CONSTRAINT `chk_pac_documento` CHECK (`nro_documento` REGEXP '^[0-9]{8}$' OR `nro_documento` REGEXP '^[0-9]{10}$'),
ADD CONSTRAINT `chk_pac_sexo` CHECK (`sexo` IN ('M', 'F')),
ADD CONSTRAINT `chk_pac_tipo` CHECK (`tipo_paciente` IN ('SIS', 'GRATUITO'));

-- Usuario
ALTER TABLE usuario
ADD CONSTRAINT `uq_nomusu` UNIQUE (`nom_usuario`),
ADD CONSTRAINT `uq_contrausu` UNIQUE (`nom_usuario`);

-- Medico
ALTER TABLE medico
ADD CONSTRAINT `uq_dnimed` UNIQUE (`dni_medico`),
ADD CONSTRAINT `chk_dnimed` CHECK (`dni_medico` LIKE '[0-9]{8}'),
ADD CONSTRAINT `uq_telfmed` UNIQUE (`telef_medico`),
ADD CONSTRAINT `chk_telfmed` CHECK (`telef_medico` REGEXP '9[0-9]{8}$'),
ADD CONSTRAINT `uq_correomed` UNIQUE (`correo_medico`),
ADD CONSTRAINT `chk_correomed` CHECK (`correo_medico` LIKE '%@%.%');

-- Dia de Trabajo
ALTER TABLE dia_trabajo
ADD CONSTRAINT `chk_diasemana` CHECK (`dia_semana` IN ('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo'));

-- Cita
ALTER TABLE cita
ADD CONSTRAINT `chk_estadocita` CHECK (`estado` IN ('PENDIENTE', 'ATENDIDA'));

-- administrador
ALTER TABLE administrador
ADD CONSTRAINT `uq_ad_documento` UNIQUE (`dni_admin`),
ADD CONSTRAINT `chk_ad_documento` CHECK (`dni_admin` REGEXP '^[0-9]{8}$|^[0-9]{10}$'), 
ADD CONSTRAINT `chk_ad_telf` CHECK (`telef_admin` REGEXP '9[0-9]{8}$'),
ADD CONSTRAINT `chk_ad_correo` CHECK (`correo_admin` LIKE '%@%.%');

ALTER TABLE especialidad
ADD CONSTRAINT `uq_nomesp` UNIQUE (`nom_especialidad`);

-- select de las tablas
-- SELECT * FROM APODERADO;
-- SELECT * FROM PACIENTE;
-- SELECT * FROM USUARIO;
-- SELECT * FROM ESPECIALIDAD;
-- SELECT * FROM MEDICO;
-- SELECT * FROM DIA_TRABAJO;
-- SELECT * FROM CITA;
-- SELECT * FROM ADMINISTRADOR;

insert into 
  apoderado (tipo_documento, nro_documento, nombre_apod, apellido_apod, parentesco, celular_apod, correo_apod)
values('dni', '98765432', 'juanito', 'perez perez', 'padre', '987654321', 'perezjuanito@gmail.com');

insert into 
  paciente (tipo_documento, nro_documento, nombre_paciente, apellido_paterno, apellido_materno, fecha_nac, sexo, lugar_naci, procedencia, tipo_paciente, id_apod)
values('dni','87654321','pedro','perez','mamani','2025-09-27','M','su casa','lima','SIS',1);
