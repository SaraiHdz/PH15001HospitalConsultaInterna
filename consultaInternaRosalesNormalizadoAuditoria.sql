
/*A. CREACIÓN DE BASE DE DATOS Y TODAS SUS TABLAS*/
create database ConsultaInternaRosalesNormalizadoAudi

use ConsultaInternaRosalesNormalizadoAudi

ALTER AUTHORIZATION ON DATABASE::ConsultaInternaRosalesNormalizadoAudi TO sa;
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
nombreServicio varchar (30) NOT NULL
)


create table habitacion
(
codHab int NOT NULL PRIMARY KEY,
codServicio int FOREIGN KEY REFERENCES servicio (codServicio),
numHab int NOT NULL
)


create table cama
(
codCama int NOT NULL PRIMARY KEY,
codHab int FOREIGN KEY REFERENCES habitacion (codHab),
numCama int not null
)


create table interna
(
codInterna int NOT NULL PRIMARY KEY,
codSignosVitales int FOREIGN KEY REFERENCES signosVitales (codSignosVitales),
referenciaInterna int not null,
codPruebasMedicas int FOREIGN KEY REFERENCES pruebasMedicas (codPruebasMedicas),
codCama int FOREIGN KEY REFERENCES cama (codCama),
fechaIngresoInterna date NOT NULL,
fechaSalidaInterna date NOT NULL
)


create table historialClinico
(
codHistorialCli int NOT NULL PRIMARY KEY,
codInterna int FOREIGN KEY REFERENCES interna (codInterna),
fechaRegHistorialCli date NOT NULL
)


create table expediente
(
codExp int NOT NULL PRIMARY KEY,
codHistorialCli int FOREIGN KEY REFERENCES historialClinico (codHistorialCli)
)


select * from paciente
select * from habitacion
select * from servicio
select * from cama
select * from pruebasMedicas
select * from signosVitales
select * from interna
select * from historialClinico
select * from expediente
select * from auditoriaInformatica


/*B. AGREGACIÓN DE 10 REGISTROS POR TABLA*/
/*Registro de pacientes*/
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (1,'Nicole', 'Ramirez', 'Rodriguez', 'Lopez','F', '20000101', '00056','048542224')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (2,'Carlos', 'Rodas', 'Guzman', '','M', '20000301', '00096','987654321')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (3,'Sofia', 'Linares', 'Sosa', 'Diaz','F', '20000201', '00776','234567890')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (4,'Pedro', 'Hernandez', 'Linares', '','M', '20000601', '00666','162839450')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (5,'Juan', 'Perez', 'Rodriguez', '','M', '20000401', '00556','761293042')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (6,'Luis', 'Sosa', 'Diaz', '','M', '20000501', '000446','987654321')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (7,'Ana', 'Cruz', 'Suarez', 'Perez','F', '20000801', '00336','123456789')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (8,'Eva', 'Diaz', 'Rodriguez', 'Sanchez','F', '20000901', '0005234','345612789')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (9,'Kenia', 'Suarez', 'Guzman', 'Lopez','F', '20000401', '000876','098712345')
insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (10,'Karla', 'Guzman', 'Perez', 'Cruz','F', '20000401', '000135','543216789')


/*Registro de los Servicios*/
insert into servicio (codServicio, nombreServicio) values (1,'Cirujia')
insert into servicio (codServicio, nombreServicio) values (2,'Maternidad')
insert into servicio (codServicio, nombreServicio) values (3,'Pediatria')
insert into servicio (codServicio, nombreServicio) values (4,'UCI')
insert into servicio (codServicio, nombreServicio) values (5,'Ortopedas')
insert into servicio (codServicio, nombreServicio) values (6,'Neumologia')
insert into servicio (codServicio, nombreServicio) values (7,'Laboratorio')
insert into servicio (codServicio, nombreServicio) values (8,'Observacion')
insert into servicio (codServicio, nombreServicio) values (9,'Emergencia')
insert into servicio (codServicio, nombreServicio) values (10,'Sala de Espera')


/*Registro de las Habitaciones*/
insert into habitacion (codHab, codServicio, numHab) values (1, 1, 1)
insert into habitacion (codHab, codServicio, numHab) values (2, 9, 1)
insert into habitacion (codHab, codServicio, numHab) values (3, 8, 1)
insert into habitacion (codHab, codServicio, numHab) values (4, 7, 1)
insert into habitacion (codHab, codServicio, numHab) values (5, 6, 1)
insert into habitacion (codHab, codServicio, numHab) values (6, 5, 1)
insert into habitacion (codHab, codServicio, numHab) values (7, 4, 1)
insert into habitacion (codHab, codServicio, numHab) values (8, 3, 1)
insert into habitacion (codHab, codServicio, numHab) values (9, 2, 1)
insert into habitacion (codHab, codServicio, numHab) values (10, 1, 1)



/*Registro de Camas*/
insert into cama (codCama, codHab, numCama) values (1, 1, 1)
insert into cama (codCama, codHab, numCama) values (5, 10, 11)
insert into cama (codCama, codHab, numCama) values (2, 9, 12)
insert into cama (codCama, codHab, numCama) values (3, 8, 13)
insert into cama (codCama, codHab, numCama) values (4, 7, 14)
insert into cama (codCama, codHab, numCama) values (6, 6, 15)
insert into cama (codCama, codHab, numCama) values (7, 5, 16)
insert into cama (codCama, codHab, numCama) values (8, 4, 17)
insert into cama (codCama, codHab, numCama) values (9, 3, 18)
insert into cama (codCama, codHab, numCama) values (10, 2, 19)


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
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (1, 1, 36.5, 110, 70, 1.65)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (2, 2, 36, 120, 70, 1.60)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (3, 3, 37.5, 130, 70, 1.70)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (4, 4, 38.5, 140, 70, 1.65)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (5, 5, 36.5, 150, 70, 1.73)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (6, 9, 37, 160, 70, 1.62)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (7, 10, 36.5, 170, 70, 1.80)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (8, 7, 38, 180, 70, 1.49)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (9, 6, 39, 110, 70, 1.79)
insert into signosVitales (codSignosVitales, codPac, tempSignosVitales, presionSignosVitales, pesoSignosVitales, alturaSignosVitales) values (10, 8, 36.5, 120, 70, 1.69)

/*Registro de Interna*/
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (1, 10, 00321, 10, 3, '20190401', '20190406')
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (2, 9, 00321, 8, 6, '20190101', '20190403')
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (3, 8, 00321, 6, 9, '20190101', '20190404')
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (4, 7, 00321, 4, 1, '20190201', '20190402')
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (5, 6, 00321, 2, 2, '20190405', '20190409')
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (6, 5, 00321, 1, 4, '20190402', '20190406')
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (7, 4, 00321, 3, 8, '20190301', '20190401')
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (8, 3, 00321, 5, 10, '20190207', '20190408')
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (9, 2, 00321, 7, 5, '20190419', '20190422')
insert into interna (codInterna, codSignosVitales, referenciaInterna, codPruebasMedicas, codCama, fechaIngresoInterna, fechaSalidaInterna) values (10, 1, 00321, 9, 7, '20190422', '20190428')


/*Registro de Historial Clinico*/
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (1, 1, '20190407')
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (2, 3, '20190212')
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (3, 5, '20190315')
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (4, 7, '20190305')
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (5, 9, '20190206')
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (6, 2, '20190108')
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (7, 4, '20190102')
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (8, 6, '20190309')
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (9, 10, '20190417')
insert into historialClinico (codHistorialCli, codInterna, fechaRegHistorialCli) values (10, 8, '20190327')


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
usuarioAudInfo varchar (30) NOT NULL,
nombreTablaAudInfo varchar (30) NOT NULL,
tipoModAudInfo varchar (30) NOT NULL,
campoModificaAudInfo varchar (30) NOT NULL
)

insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (11,'Karla', 'Ramirez', 'Sosa', 'Sanchez','F', '20000501', '00077','048542356')
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, usuarioAudInfo, nombreTablaAudInfo, tipoModAudInfo, campoModificaAudInfo) values (1, '20190430', 'KSOSA', 'paciente', 'insert', 11)

insert into paciente (codPac, nombrePac, primerApellidoPac, segundoApellidoPac, apellidoCasadoPac, generoPac, fechaNacPac, registroUnicoPac, duiPac) values (11,'Kenia', 'Cruz', 'Perez', 'Cienfuegos','F', '20000502', '00027','012342356')
insert into auditoriaInformatica (codAudInfo, fechaAudInfo, usuarioAudInfo, nombreTablaAudInfo, tipoModAudInfo, campoModificaAudInfo) values (2, '20190501', 'KSOSA', 'paciente', 'insert', 12)


/*D. CONSULTAS*/
/*eventos registrados durante el mes en curso*/
select * from auditoriaInformatica where fechaAudInfo between '20190402' and '20190502'

/*eventos registrados los ultimos 6 meses a partir de la fecha*/
select * from auditoriaInformatica where fechaAudInfo between '20181202' and '20190502'