/*A. CREACIÓN DE BASE DE DATOS Y TODAS SUS TABLAS*/
create database ConsultaInternaRosalesNormalizadoAudiFinal

use ConsultaInternaRosalesNormalizadoAudiFinal

ALTER AUTHORIZATION ON DATABASE::ConsultaInternaRosalesNormalizadoAudiFinal TO sa;
GO

create table paciente
(
codPac int NOT NULL PRIMARY KEY,
nombrePac varchar(50) NOT NULL, 
primerApellidoPac varchar(50) NOT NULL,
segundoApellidoPac varchar(50) NOT NULL,
apellidoCasadoPac varchar(50) NOT NULL,
generoPac varchar (1) not null,
fechaNacPac date NOT NULL,
registroUnicoPac varchar(15) NOT NULL,
duiPac varchar(9) NOT NULL
)


create table signosVitales
(
codSignosVitales int NOT NULL PRIMARY KEY,
codPac int FOREIGN KEY REFERENCES paciente (codPac),
tempSignosVitales float NOT NULL, 
presionSignosVitales float NOT NULL,
pesoSignosVitales float not null,
alturaSignosVitales float not null
)


create table pruebasMedicas
(
codPruebasMedicas int NOT NULL PRIMARY KEY,
pruebasMedicas varchar (30)
)


create table servicio
(
codServicio int NOT NULL PRIMARY KEY,
nombreServicio varchar (30) NOT NULL,
camasDisponibles int not null,
camasExistentes int not null
)


create table cama
(
codCama int NOT NULL PRIMARY KEY,
codServicio int FOREIGN KEY REFERENCES servicio (codServicio),
numCama int not null,
)


create table ConsultaInterna
(
codConInterna int NOT NULL PRIMARY KEY,
codSignosVitales int FOREIGN KEY REFERENCES signosVitales (codSignosVitales),
referenciaConInterna int not null,
codPruebasMedicas int FOREIGN KEY REFERENCES pruebasMedicas (codPruebasMedicas),
codCama int FOREIGN KEY REFERENCES cama (codCama),
fechaIngresoConInterna date NOT NULL,
fechaSalidaConInterna date NOT NULL
)


create table historialClinico
(
codHistorialCli int NOT NULL PRIMARY KEY,
codConInterna int FOREIGN KEY REFERENCES ConsultaInterna (codConInterna),
fechaRegHistorialCli date NOT NULL
)


create table expediente
(
codExp int NOT NULL PRIMARY KEY,
codHistorialCli int FOREIGN KEY REFERENCES historialClinico (codHistorialCli)
)


select * from paciente
select * from servicio
select * from cama
select * from pruebasMedicas
select * from signosVitales
select * from ConsultaInterna
select * from historialClinico
select * from expediente
select * from auditoriaInformatica


/*B. AGREGACIÓN DE 10 REGISTROS POR TABLA*/
/*Registro de pacientes*/
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (1,'Nicole', 'Ramirez', 'Rodriguez', 'Lopez','F', '20000101', '00056','048542224')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (2,'Carlos', 'Rodas', 'Guzman', '','M', '20000301', '00096','987654321')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (3,'Sofia', 'Linares', 'Sosa', 'Diaz','F', '20000201', '00776','234567890')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (4,'Pedro', 'Hernandez', 'Linares', '','M', '20000601', '00666','162839450')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (5,'Juan', 'Perez', 'Rodriguez', '','M', '20000401', '00556','761293042')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (6,'Luis', 'Sosa', 'Diaz', '','M', '20000501', '000446','987654321')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (7,'Ana', 'Cruz', 'Suarez', 'Perez','F', '20000801', '00336','123456789')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (8,'Eva', 'Diaz', 'Rodriguez', 'Sanchez','F', '20000901', '0005234','345612789')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (9,'Kenia', 'Suarez', 'Guzman', 'Lopez','F', '20000401', '000876','098712345')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (10,'Karla', 'Guzman', 'Perez', 'Cruz','F', '20000401', '000135','543216789')


/*Registro de los Servicios*/
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (1,'Cirujia', 5, 10)
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (2,'Maternidad', 15, 30)
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (3,'Pediatria', 10, 25)
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (4,'UCI', 19, 30)
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (5,'Ortopedas', 14, 22)
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (6,'Neumologia', 11, 19)
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (7,'Laboratorio', 5, 12)
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (8,'Observacion', 7, 19)
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (9,'Emergencia', 19, 33)
insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (10,'Sala de Espera', 10, 16)


/*Registro de Camas*/
insert into cama (codCama, codServicio, numCama) values (1, 1, 1)
insert into cama (codCama, codServicio, numCama) values (5, 10, 11)
insert into cama (codCama, codServicio, numCama) values (2, 9, 12)
insert into cama (codCama, codServicio, numCama) values (3, 8, 13)
insert into cama (codCama, codServicio, numCama) values (4, 7, 14)
insert into cama (codCama, codServicio, numCama) values (6, 6, 15)
insert into cama (codCama, codServicio, numCama) values (7, 5, 16)
insert into cama (codCama, codServicio, numCama) values (8, 4, 17)
insert into cama (codCama, codServicio, numCama) values (9, 3, 18)
insert into cama (codCama, codServicio, numCama) values (10, 2, 19)


/*Registro de Pruebas Medicas*/
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (1, 'Radiografia')
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (2, 'VIH')
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (3, 'Sangre')
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (4, 'Heces')
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (5, 'Orina')
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (6, 'TAC')
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (7, 'Ultrasonografia')
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (8, 'Mamografia')
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (9, 'Endoscopia')
insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (10, 'Ecocardiograma')


/*Registro de Signos Vitales*/
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (1, 1, 36.5, 110, 70, 1.65)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (2, 2, 36, 120, 70, 1.60)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (3, 3, 37.5, 130, 70, 1.70)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (4, 4, 38.5, 140, 70, 1.65)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (5, 5, 36.5, 150, 70, 1.73)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (6, 9, 37, 160, 70, 1.62)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (7, 10, 36.5, 170, 70, 1.80)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (8, 7, 38, 180, 70, 1.49)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (9, 6, 39, 110, 70, 1.79)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) 
values (10, 8, 36.5, 120, 70, 1.69)


/*Registro de Consulta Interna*/
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (1, 10, 00321, 10, 3, '20190401', '20190406')
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (2, 9, 00321, 8, 6, '20190101', '20190403')
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (3, 8, 00321, 6, 9, '20190101', '20190404')
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (4, 7, 00321, 4, 1, '20190201', '20190402')
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (5, 6, 00321, 2, 2, '20190405', '20190409')
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (6, 5, 00321, 1, 4, '20190402', '20190406')
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (7, 4, 00321, 3, 8, '20190301', '20190401')
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (8, 3, 00321, 5, 10, '20190207', '20190408')
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (9, 2, 00321, 7, 5, '20190419', '20190422')
insert into ConsultaInterna (CodconInterna, codSignosVitales, referenciaConInterna, codPruebasMedicas, codCama, fechaIngresoConInterna, fechaSalidaConInterna) 
values (10, 1, 00321, 9, 7, '20190422', '20190428')


/*Registro de Historial Clinico*/
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (1, 1, '20190407')
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (2, 3, '20190212')
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (3, 5, '20190315')
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (4, 7, '20190305')
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (5, 9, '20190206')
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (6, 2, '20190108')
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (7, 4, '20190102')
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (8, 6, '20190309')
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (9, 10, '20190417')
insert into historialClinico (codHistorialCli, codConInterna, fechaRegHistorialCli) values (10, 8, '20190327')


/*Registro de Expediente*/
insert into expediente (codExp, codHistorialCli) values (1, 2)
insert into expediente (codExp, codHistorialCli) values (2, 4)
insert into expediente (codExp, codHistorialCli) values (3, 6)
insert into expediente (codExp, codHistorialCli) values (4, 8)
insert into expediente (codExp, codHistorialCli) values (5, 10)
insert into expediente (codExp, codHistorialCli) values (6, 1)
insert into expediente (codExp, codHistorialCli) values (7, 3)
insert into expediente (codExp, codHistorialCli) values (8, 6)
insert into expediente (codExp, codHistorialCli) values (9, 9)
insert into expediente (codExp, codHistorialCli) values (10, 5)



/*C. TABLAS DE AUDITORIA*/
create table auditoriaInformatica
(
codAudInfo int NOT NULL PRIMARY KEY,
fechaAudInfo date NOT NULL,
codUsuarios int FOREIGN KEY REFERENCES usuarios (codUsuarios),
codTablas int FOREIGN KEY REFERENCES tablas (codtablas),
codTipoMov int FOREIGN KEY REFERENCES tipoMovimiento (codTipoMov),
campoModificaAudInfo varchar (30) NOT NULL
)

create table usuarios
(
codUsuarios int NOT NULL PRIMARY KEY,
Usuarios Varchar (15) NOT NULL
)

create table tablas
(
codTablas int not null PRIMARY KEY,
tablas varchar (50) not null
)

create table tipoMovimiento
(
codTipoMov int not null PRIMARY KEY,
movimiento varchar(12) not null
)

SELECT * FROM usuarios
SELECT * FROM tablas
SELECT * FROM tipoMovimiento

/*Registro de Usuarios*/
insert into usuarios (codUsuarios, Usuarios) values (1, 'RPORTILLO')
insert into usuarios (codUsuarios, Usuarios) values (2, 'KSOSA')
insert into usuarios (codUsuarios, Usuarios) values (3, 'KCRUZ')

/*Registro de TABLAS*/
insert into tablas (codTablas, tablas) values (1, 'PACIENTE')
insert into tablas (codTablas, tablas) values (2, 'SERVICIO')
insert into tablas (codTablas, tablas) values (3, 'PRUEBAS MEDICAS')
insert into tablas (codTablas, tablas) values (4, 'SIGNOS VITALES')

/*Registro de TABLAS*/
insert into tipoMovimiento (codTipoMov, movimiento) values (1, 'UPDATE')
insert into tipoMovimiento (codTipoMov, movimiento) values (2, 'INSERT')
insert into tipoMovimiento (codTipoMov, movimiento) values (3, 'DELETE')

select* from paciente
select* from auditoriaInformatica
/*MODIFICACIONES A TABLA PACIENTE*/
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (11,'Karla', 'Ramirez', 'Sosa', 'Sanchez','F', '20000501', '00077','048542356')
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo)
values (1, '20190430', '1', '1', '2', 11)

insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (12,'Kenia', '2', 'Perez', 'Cienfuegos','F', '20000502', '00027','012342356')
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (2, '20190501', '3', '1', '2', 12)

update paciente set registroUnicoPac = '000556' where codPac =1 
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (3, '20190501', '1', '1', '1', 1)



insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) 
values (13,'Kenia', '3', 'Perez', 'Cienfuegos','F', '20000502', '00027','012342356')
delete from paciente where codPac =13
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (4, '20190505', '2', '1', '3', 13)


/*MODIFICACIONES A TABLA SERVICIO*/
update servicio set nombreServicio = 'Unidad de Cuidados Intensivos' where codServicio =4 
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (5, '20190505', '1', '2', '1', 4)

update servicio set nombreServicio = 'Unidad de Emergencias' where codServicio =9 
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (6, '20190506', '3', '2', '1', 9)


insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (11,'Radiografia', 2, 5)
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (7, '20190509', '1', '2', '2', 11)

insert into servicio (codServicio, nombreServicio, camasDisponibles, camasExistentes) values (12,'Morgue', 5, 10)
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (8, '20190511', '3', '2', '2', 12)


/*MODIFICACIONES A TABLA PRUEBAS MEDICAS*/
update pruebasMedicas set pruebasMedicas = 'VIH/SIDA' where codPruebasMedicas =2 
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (9, '20190515', '2', '3', '1', 2)

update pruebasMedicas set pruebasMedicas = 'HEMOGRAMA' where codPruebasMedicas =3 
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (10, '20190516', '1', '3', '1', 9)


insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (11, 'HEMOGLOBINA')
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (11, '20190520', '3', '3', '2', 11)

insert into pruebasMedicas(codPruebasMedicas, pruebasMedicas) values (12, 'EMBARAZO')
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (12, '20190521', '2', '3', '2', 12)


/*MODIFICACIONES A TABLA SIGNOS VITALES*/
update signosVitales set tempSignosVitales = 40 where codPac =1
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (13, '20190525', '1', '4', '1', 1)

update signosVitales set tempSignosVitales = 39.5 where codPac =9
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (14, '20190526', '1', '4', '1', 9)

update signosVitales set tempSignosVitales = 35.5 where codPac =10
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, codUsuarios, codTablas, codTipoMov, campoModificaAudInfo) 
values (15, '20190528', '1', '4', '1', 10)


/*D. CONSULTAS*/
/*eventos registrados durante el mes en curso*/
select * from auditoriaInformatica where fechaAudInfo between '20190430' and '20190530'

/*eventos registrados los ultimos 6 meses a partir de la fecha*/
select * from auditoriaInformatica where fechaAudInfo between '20181230' and '20190530'