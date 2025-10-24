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
    anios_servicio VARCHAR(10) NOT NULL,
    url_perfil VARCHAR(100) NOT NULL,
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
    tipo_atencion VARCHAR(100) DEFAULT 'CONSULTA MEDICA' not null,
    fecha_emision DATETIME,
    estado ENUM('PENDIENTE', 'ATENDIDA') DEFAULT 'PENDIENTE' not null,
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
ADD CONSTRAINT `chk_dnimed` CHECK (`dni_medico` REGEXP '[0-9]{8}'),
ADD CONSTRAINT `uq_telfmed` UNIQUE (`telef_medico`),
ADD CONSTRAINT `chk_telfmed` CHECK (`telef_medico` REGEXP '9[0-9]{8}'),
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
SELECT * FROM APODERADO;
SELECT * FROM PACIENTE;
SELECT * FROM USUARIO;
SELECT * FROM ESPECIALIDAD;
SELECT * FROM MEDICO;
SELECT * FROM DIA_TRABAJO;
SELECT * FROM CITA;
SELECT * FROM ADMINISTRADOR;
-- Inserts de las tablas
INSERT INTO USUARIO (nom_usuario, contraseña, cargo) VALUES
('admin1', 'password1', 'ADMINISTRADOR'),
('medico1', 'password2', 'MEDICO'),
('medico2', 'password3', 'MEDICO'),
('medico3', 'password4', 'MEDICO'),
('medico4', 'password5', 'MEDICO'),
('medico5', 'password6', 'MEDICO'),
('medico6', 'password7', 'MEDICO'),
('medico7', 'password8', 'MEDICO'),
('medico8', 'password9', 'MEDICO'),
('medico9', 'password10', 'MEDICO'),
('medico10', 'password11', 'MEDICO'),
('medico11', 'password12', 'MEDICO'),
('medico13', 'password13', 'MEDICO'),
('medico14', 'password14', 'MEDICO'),
('medico15', 'password15', 'MEDICO'),
('medico16', 'password16', 'MEDICO'),
('medico17', 'password17', 'MEDICO'),
('medico18', 'password18', 'MEDICO'),
('medico19', 'password19', 'MEDICO');
INSERT INTO ESPECIALIDAD (nom_especialidad) VALUES
('Oftalmologia'),
('Dermatologia'),
('Nefrologia'),
('Pediatria'),
('Psicologia'),
('Neumologia');
INSERT INTO APODERADO (tipo_documento, nro_documento, nombre_apod, apellido_apod, parentesco, celular_apod, correo_apod) VALUES
('DNI', '12345678', 'Carlos', 'Gomez', 'PADRE', '912345678', 'carlos.gomez@example.com');
INSERT INTO PACIENTE (tipo_documento, nro_documento, nombre_paciente, apellido_paterno, apellido_materno, fecha_nac, sexo, lugar_naci, procedencia, tipo_paciente, id_apod) VALUES
('DNI', '87654321', 'Ana', 'Lopez', 'Martinez', '1990-05-15', 'F', 'Lima', 'Lima', 'SIS', 1);
INSERT INTO MEDICO (dni_medico, nombre_medico, apellido_medico, telef_medico, correo_medico, anios_servicio, url_perfil, id_especialidad, id_usuario) VALUES
('92812371', 'Luis', 'Ramirez Soto', '987654321', 'luis.ramirez@example.com', '5 años', 'https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-17012.jpg', 1, 2),
('92812372', 'Miguel', 'Torres Medrano', '987654322', 'miguel.torres@example.com', '10 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-40767.jpg', 1, 3),
('92812373', 'Deyvid', 'Hilario Quispe', '987654323', 'deydid.hilario@example.com', '11 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-28813.jpg', 1, 4),
('92812374', 'Diego', 'Milagros Peña', '987654324', 'diego.milagros@example.com', '9 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-81181.jpg', 2, 5),
('92812375', 'Jordan', 'Marruecos Temo', '987654325', 'jordan.marruecos@example.com', '8 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-58575.jpg', 2, 6),
('92812376', 'Sancho', 'Chahua Choque', '987654326', 'sancho.chahua@example.com', '5 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-26318.jpg', 2, 7),
('92812377', 'Rodrigo', 'Mendes Salazar', '987654327', 'rodrigo.mendes@example.com', '20 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-35718.jpg', 3, 8),
('92812378', 'Harold', 'Cahuantico Paria', '987654328', 'harold.cahuantico@example.com', '13 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-70458.jpg', 3, 9),
('92812379', 'Samanta', 'Solorzano Paredes', '987654119', 'samanta.solorzano@example.com', '13 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-47936.jpg', 3, 10),
('92812370', 'Lucia', 'Callo Carazas', '987654101', 'lucia.callo@example.com', '3 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-72454.jpg', 4, 11),
('92812311', 'Daniel', 'Rivera Nieto', '987654391', 'daniel.rivera@example.com', '10 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-44430.jpg', 4, 12),
('92812321', 'Jesus', 'Saavedra Bocangel', '987654381', 'jesus.saavedra@example.com', '7 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-30181.jpg', 4, 13),
('92812331', 'Manuel', 'Melendes Rivas', '987654371', 'manuel.melendez@example.com', '6 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-54185.jpg', 5, 14),
('92812341', 'Cris', 'Vergara Medina', '987654361', 'cris.vergara@example.com', '11 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-52143.jpg', 5, 15),
('92812351', 'Josep', 'Andaluz Lozano', '987654351', 'josep.andaluz@example.com', '5 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-26933.jpg', 5, 16),
('92812361', 'Caren', 'Guevara Valencia', '987654341', 'caren.guevara@example.com', '2 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-31169.jpg', 6, 17),
('92812541', 'Pedro', 'Ramos Carbajal', '987654331', 'pedro.ramos@example.com', '8 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-74182.jpg', 6, 18),
('92812381', 'Juan', 'Hermes Molina', '987654311', 'juan.hermes@example.com', '9 años','https://www.qualab.com.pe/STAFF02/staff-oracle/upload/foto-54295.jpg', 6, 19);

INSERT INTO DIA_TRABAJO (dia_semana, hora_inicio, hora_fin, id_medico) VALUES
('lunes', '08:00:00', '12:00:00', 1),
('martes', '08:00:00', '13:00:00', 1),
('miércoles', '08:00:00', '10:00:00', 1),
('jueves', '08:00:00', '11:00:00', 1),
('viernes', '08:00:00', '9:00:00', 1);
INSERT INTO CITA (fecha_cita, hora_cita, tipo_atencion, fecha_emision, estado, id_medico, id_paciente) VALUES
('2025-10-07', '09:30', 'Consulta General', '2025-10-01', 'PENDIENTE', 1, 1);
INSERT INTO ADMINISTRADOR (dni_admin, nombre_admin, apellido_admin, telef_admin, correo_admin, id_usuario) VALUES
('22223333', 'Maria', 'Fernandez', '912345678', 'maria.fernandez@example.com', 1);

INSERT INTO APODERADO (tipo_documento, nro_documento, nombre_apod, apellido_apod, parentesco, celular_apod, correo_apod) VALUES
('DNI', '10000001', 'Rosa', 'Pérez', 'MADRE', '911111111', 'rosa.perez@example.com'),
('DNI', '10000002', 'Carlos', 'Ramos', 'PADRE', '911111112', 'carlos.ramos@example.com'),
('DNI', '10000003', 'Lucía', 'Torres', 'MADRE', '911111113', 'lucia.torres@example.com'),
('DNI', '10000004', 'Manuel', 'García', 'PADRE', '911111114', 'manuel.garcia@example.com'),
('DNI', '10000005', 'Patricia', 'López', 'MADRE', '911111115', 'patricia.lopez@example.com'),
('DNI', '10000006', 'Ricardo', 'Salazar', 'PADRE', '911111116', 'ricardo.salazar@example.com'),
('DNI', '10000007', 'Teresa', 'Mendoza', 'MADRE', '911111117', 'teresa.mendoza@example.com'),
('DNI', '10000008', 'Jorge', 'Ramírez', 'PADRE', '911111118', 'jorge.ramirez@example.com'),
('DNI', '10000009', 'Marta', 'Silva', 'MADRE', '911111119', 'marta.silva@example.com'),
('DNI', '10000010', 'Pedro', 'Campos', 'PADRE', '911111120', 'pedro.campos@example.com'),
('DNI', '10000011', 'Elena', 'Vargas', 'MADRE', '911111121', 'elena.vargas@example.com'),
('DNI', '10000012', 'Julio', 'Santos', 'PADRE', '911111122', 'julio.santos@example.com'),
('DNI', '10000013', 'Adriana', 'Flores', 'MADRE', '911111123', 'adriana.flores@example.com'),
('DNI', '10000014', 'Luis', 'Gómez', 'PADRE', '911111124', 'luis.gomez@example.com'),
('DNI', '10000015', 'Claudia', 'Morales', 'MADRE', '911111125', 'claudia.morales@example.com');

INSERT INTO PACIENTE (tipo_documento, nro_documento, nombre_paciente, apellido_paterno, apellido_materno, fecha_nac, sexo, lugar_naci, procedencia, tipo_paciente, id_apod) VALUES
('DNI', '20000001', 'Diego', 'Ramos', 'Pérez', '2015-03-15', 'M', 'Lima', 'Lima', 'SIS', 1),
('DNI', '20000002', 'Valeria', 'Ramos', 'Gómez', '2013-07-22', 'F', 'Arequipa', 'Arequipa', 'GRATUITO', 2),
('DNI', '20000003', 'Mateo', 'Torres', 'Salinas', '2017-02-10', 'M', 'Cusco', 'Cusco', 'SIS', 3),
('DNI', '20000004', 'Luciana', 'García', 'Huamán', '2016-06-03', 'F', 'Lima', 'Callao', 'SIS', 4),
('DNI', '20000005', 'Sofía', 'López', 'Reyes', '2014-11-25', 'F', 'Piura', 'Piura', 'GRATUITO', 5),
('DNI', '20000006', 'Sebastián', 'Salazar', 'Cruz', '2018-09-14', 'M', 'Lambayeque', 'Chiclayo', 'SIS', 6),
('DNI', '20000007', 'Camila', 'Mendoza', 'Luna', '2012-01-19', 'F', 'Lima', 'Lima', 'SIS', 7),
('DNI', '20000008', 'Thiago', 'Ramírez', 'Campos', '2019-04-30', 'M', 'Cusco', 'Cusco', 'GRATUITO', 8),
('DNI', '20000009', 'María', 'Silva', 'Cáceres', '2015-12-01', 'F', 'Trujillo', 'La Libertad', 'SIS', 9),
('DNI', '20000010', 'Andrés', 'Campos', 'Soto', '2011-10-21', 'M', 'Tacna', 'Tacna', 'GRATUITO', 10),
('DNI', '20000011', 'Gabriela', 'Vargas', 'Flores', '2016-08-05', 'F', 'Lima', 'Lima', 'SIS', 11),
('DNI', '20000012', 'Daniel', 'Santos', 'Rojas', '2017-12-09', 'M', 'Ica', 'Ica', 'GRATUITO', 12),
('DNI', '20000013', 'Martina', 'Flores', 'Díaz', '2014-04-12', 'F', 'Lima', 'Lima', 'SIS', 13),
('DNI', '20000014', 'Emilio', 'Gómez', 'Peña', '2013-03-08', 'M', 'Arequipa', 'Arequipa', 'GRATUITO', 14),
('DNI', '20000015', 'Alexa', 'Morales', 'Suárez', '2015-09-17', 'F', 'Lima', 'Lima', 'SIS', 15);

INSERT INTO DIA_TRABAJO (dia_semana, hora_inicio, hora_fin, id_medico) VALUES
('Lunes', '09:00:00', '13:00:00', 2),
('Martes', '09:00:00', '13:00:00', 2),
('Miercoles', '09:00:00', '13:00:00', 2),
('Jueves', '09:00:00', '13:00:00', 2),
('Viernes', '09:00:00', '13:00:00', 2),

('Lunes', '14:00:00', '18:00:00', 3),
('Martes', '14:00:00', '18:00:00', 3),
('Miercoles', '14:00:00', '18:00:00', 3),
('Jueves', '14:00:00', '18:00:00', 3),
('Viernes', '14:00:00', '18:00:00', 3),

('Lunes', '08:00:00', '12:30:00', 4),
('Martes', '08:00:00', '12:30:00', 4),
('Miercoles', '08:00:00', '12:30:00', 4),
('Jueves', '08:00:00', '12:30:00', 4),
('Viernes', '08:00:00', '12:30:00', 4),

('Lunes', '09:00:00', '13:00:00', 5),
('Martes', '09:00:00', '13:00:00', 5),
('Miercoles', '09:00:00', '13:00:00', 5),
('Jueves', '09:00:00', '13:00:00', 5),
('Viernes', '09:00:00', '13:00:00', 5),

('Lunes', '14:00:00', '18:00:00', 6),
('Martes', '14:00:00', '18:00:00', 6),
('Miercoles', '14:00:00', '18:00:00', 6),
('Jueves', '14:00:00', '18:00:00', 6),
('Viernes', '14:00:00', '18:00:00', 6),

('Lunes', '08:00:00', '12:00:00', 7),
('Martes', '08:00:00', '12:00:00', 7),
('Miercoles', '08:00:00', '12:00:00', 7),
('Jueves', '08:00:00', '12:00:00', 7),
('Viernes', '08:00:00', '12:00:00', 7),

('Lunes', '09:00:00', '13:00:00', 8),
('Martes', '09:00:00', '13:00:00', 8),
('Miercoles', '09:00:00', '13:00:00', 8),
('Jueves', '09:00:00', '13:00:00', 8),
('Viernes', '09:00:00', '13:00:00', 8),

('Lunes', '13:00:00', '17:00:00', 9),
('Martes', '13:00:00', '17:00:00', 9),
('Miercoles', '13:00:00', '17:00:00', 9),
('Jueves', '13:00:00', '17:00:00', 9),
('Viernes', '13:00:00', '17:00:00', 9),

('Lunes', '08:00:00', '12:00:00', 10),
('Martes', '08:00:00', '12:00:00', 10),
('Miercoles', '08:00:00', '12:00:00', 10),
('Jueves', '08:00:00', '12:00:00', 10),
('Viernes', '08:00:00', '12:00:00', 10),

('Lunes', '09:00:00', '13:00:00', 11),
('Martes', '09:00:00', '13:00:00', 11),
('Miercoles', '09:00:00', '13:00:00', 11),
('Jueves', '09:00:00', '13:00:00', 11),
('Viernes', '09:00:00', '13:00:00', 11),

('Lunes', '14:00:00', '18:00:00', 12),
('Martes', '14:00:00', '18:00:00', 12),
('Miercoles', '14:00:00', '18:00:00', 12),
('Jueves', '14:00:00', '18:00:00', 12),
('Viernes', '14:00:00', '18:00:00', 12),

('Lunes', '08:30:00', '12:30:00', 13),
('Martes', '08:30:00', '12:30:00', 13),
('Miercoles', '08:30:00', '12:30:00', 13),
('Jueves', '08:30:00', '12:30:00', 13),
('Viernes', '08:30:00', '12:30:00', 13),

('Lunes', '09:30:00', '13:30:00', 14),
('Martes', '09:30:00', '13:30:00', 14),
('Miercoles', '09:30:00', '13:30:00', 14),
('Jueves', '09:30:00', '13:30:00', 14),
('Viernes', '09:30:00', '13:30:00', 14),

('Lunes', '14:00:00', '18:00:00', 15),
('Martes', '14:00:00', '18:00:00', 15),
('Miercoles', '14:00:00', '18:00:00', 15),
('Jueves', '14:00:00', '18:00:00', 15),
('Viernes', '14:00:00', '18:00:00', 15),

('Lunes', '08:00:00', '12:00:00', 16),
('Martes', '08:00:00', '12:00:00', 16),
('Miercoles', '08:00:00', '12:00:00', 16),
('Jueves', '08:00:00', '12:00:00', 16),
('Viernes', '08:00:00', '12:00:00', 16),

('Lunes', '09:00:00', '13:00:00', 17),
('Martes', '09:00:00', '13:00:00', 17),
('Miercoles', '09:00:00', '13:00:00', 17),
('Jueves', '09:00:00', '13:00:00', 17),
('Viernes', '09:00:00', '13:00:00', 17),

('Lunes', '13:00:00', '17:00:00', 18),
('Martes', '13:00:00', '17:00:00', 18),
('Miercoles', '13:00:00', '17:00:00', 18),
('Jueves', '13:00:00', '17:00:00', 18),
('Viernes', '13:00:00', '17:00:00', 18);