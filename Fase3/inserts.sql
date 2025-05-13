-- Limpieza inicial
TRUNCATE Historial_Medico, Horario, Incidencia, Permiso, Empleado_Especialidad, Telefono_Empleado, Empleado, Departamento, Rol, Turno, Especialidad RESTART IDENTITY CASCADE;

-- Departamentos (12 registros)
INSERT INTO Departamento (nombre, responsable) VALUES
('Urgencias', 'Dr. Carlos Méndez'),
('Pediatría', 'Dra. Laura Gómez'),
('Cirugía', 'Dr. Roberto Jiménez'),
('Oncología', 'Dra. Sofía Ramírez'),
('Cardiología', 'Dr. Andrés López'),
('Administración', 'Lic. María Fernández'),
('Enfermería', 'Lic. Pedro Navarro'),
('Laboratorio', 'Bioq. Ana Castro'),
('Rayos X', 'Tec. Javier Ruiz'),
('Farmacia', 'Lic. Carmen Vargas'),
('Psiquiatría', 'Dr. Luis Herrera'),
('Limpieza', 'Sr. Manuel Ortiz');

-- Roles (8 registros)
INSERT INTO Rol (nombre) VALUES
('Médico'),
('Enfermero'),
('Administrativo'),
('Técnico'),
('Farmacéutico'),
('Bioquímico'),
('Mantenimiento'),
('Director');

-- Turnos (3 registros)
INSERT INTO Turno (tipo, hora_inicio, hora_fin) VALUES
('matutino', '07:00:00', '15:00:00'),
('vespertino', '15:00:00', '23:00:00'),
('nocturno', '23:00:00', '07:00:00');

-- Especialidades (10 registros)
INSERT INTO Especialidad (nombre) VALUES
('Traumatología'),
('Pediatría'),
('Cardiología'),
('Oncología'),
('Cirugía General'),
('Psiquiatría'),
('Radiología'),
('Anestesiología'),
('Ginecología'),
('Dermatología');

-- Empleados (20 registros de ejemplo)
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES
('Juan', 'Gómez', '2020-05-15', 1, 1),
('María', 'López', '2019-08-22', 2, 1),
('Carlos', 'Martínez', '2021-03-10', 3, 1),
('Ana', 'García', '2022-01-30', 4, 1),
('Luis', 'Rodríguez', '2020-11-05', 5, 1),
('Laura', 'Fernández', '2018-07-14', 6, 3),
('Pedro', 'Pérez', '2021-09-18', 7, 2),
('Sofía', 'Sánchez', '2019-04-25', 8, 5),
('Andrés', 'Ramírez', '2022-02-12', 9, 4),
('Carmen', 'Torres', '2020-10-08', 10, 5),
('Jorge', 'Díaz', '2021-06-19', 11, 1),
('Patricia', 'Ruiz', '2019-12-03', 12, 7),
('Ricardo', 'Hernández', '2020-08-27', 1, 1),
('Elena', 'Jiménez', '2022-04-11', 2, 2),
('Fernando', 'Morales', '2018-11-15', 3, 1),
('Lucía', 'Ortega', '2021-07-22', 4, 1),
('Roberto', 'Castro', '2019-09-30', 5, 1),
('Mónica', 'Vargas', '2020-03-05', 6, 3),
('Daniel', 'Romero', '2022-01-17', 7, 2),
('Adriana', 'Silva', '2018-05-20', 8, 5);

-- Teléfonos (2 por empleado = 40 registros)
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES
(1, '+50251234567'), (1, '+50257654321'),
(2, '+50252345678'), (2, '+50258765432'),
(3, '+50253456789'), (3, '+50259876543'),
(4, '+50254567890'), (4, '+50250987654'),
(5, '+50255678901'), (5, '+50251098765'),
(6, '+50256789012'), (6, '+50252109876'),
(7, '+50257890123'), (7, '+50253210987'),
(8, '+50258901234'), (8, '+50254321098'),
(9, '+50259012345'), (9, '+50255432109'),
(10, '+50250123456'), (10, '+50256543210'),
(11, '+50251234560'), (11, '+50257654320'),
(12, '+50252345670'), (12, '+50258765430'),
(13, '+50253456780'), (13, '+50259876540'),
(14, '+50254567800'), (14, '+50250987650'),
(15, '+50255678000'), (15, '+50251098700'),
(16, '+50256780000'), (16, '+50252109800'),
(17, '+50257800000'), (17, '+50253210900'),
(18, '+50258900000'), (18, '+50254321000'),
(19, '+50259000000'), (19, '+50255432100'),
(20, '+50250000000'), (20, '+50256543200');

-- Asignación de Especialidades (3 por médico = 18 registros)
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES
(1, 1), (1, 3), (1, 5),
(2, 2), (2, 4), (2, 6),
(3, 3), (3, 5), (3, 7),
(4, 4), (4, 6), (4, 8),
(5, 5), (5, 7), (5, 9),
(11, 1), (11, 2), (11, 10);

-- Permisos (2 por empleado = 40 registros)
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES
(1, '2023-01-10', '2023-01-15', 'Vacaciones'),
(1, '2023-03-05', '2023-03-07', 'Enfermedad'),
(2, '2023-02-20', '2023-02-25', 'Vacaciones'),
(2, '2023-04-10', '2023-04-12', 'Capacitación'),
(3, '2023-01-15', '2023-01-20', 'Permiso personal'),
(3, '2023-05-01', '2023-05-03', 'Enfermedad'),
(4, '2023-03-01', '2023-03-05', 'Vacaciones'),
(4, '2023-06-10', '2023-06-12', 'Capacitación'),
(5, '2023-02-10', '2023-02-15', 'Permiso personal'),
(5, '2023-04-20', '2023-04-22', 'Enfermedad'),
(6, '2023-01-05', '2023-01-10', 'Vacaciones'),
(6, '2023-05-15', '2023-05-17', 'Capacitación'),
(7, '2023-03-10', '2023-03-15', 'Permiso personal'),
(7, '2023-06-01', '2023-06-03', 'Enfermedad'),
(8, '2023-02-15', '2023-02-20', 'Vacaciones'),
(8, '2023-04-05', '2023-04-07', 'Capacitación'),
(9, '2023-01-20', '2023-01-25', 'Permiso personal'),
(9, '2023-05-10', '2023-05-12', 'Enfermedad'),
(10, '2023-03-15', '2023-03-20', 'Vacaciones'),
(10, '2023-06-05', '2023-06-07', 'Capacitación');

-- Incidencias (20 registros)
INSERT INTO Incidencia (id_empleado, descripcion, fecha, severidad) VALUES
(1, 'Llegada tarde', '2023-01-05', 2),
(2, 'Falta sin justificación', '2023-02-10', 3),
(3, 'Error en medicación', '2023-03-15', 4),
(4, 'Equipo dañado', '2023-04-20', 3),
(5, 'Incumplimiento de protocolo', '2023-05-25', 4),
(6, 'Retraso en informe', '2023-06-30', 2),
(7, 'Falta a reunión', '2023-01-10', 2),
(8, 'Error en inventario', '2023-02-15', 3),
(9, 'Uso incorrecto de equipo', '2023-03-20', 4),
(10, 'Incumplimiento de horario', '2023-04-25', 3),
(11, 'Falta de material', '2023-05-30', 2),
(12, 'Limpieza insuficiente', '2023-06-05', 1),
(13, 'Retraso en entrega', '2023-01-15', 2),
(14, 'Error en diagnóstico', '2023-02-20', 4),
(15, 'Equipo no funcionando', '2023-03-25', 3),
(16, 'Falta a capacitación', '2023-04-30', 2),
(17, 'Incumplimiento de normas', '2023-05-05', 3),
(18, 'Error en facturación', '2023-06-10', 2),
(19, 'Uso inadecuado de recursos', '2023-01-20', 3),
(20, 'Falta de comunicación', '2023-02-25', 2);

-- Horarios (3 por empleado = 60 registros)
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES
(1, 1, '2023-01-01'), (1, 2, '2023-01-08'), (1, 3, '2023-01-15'),
(2, 2, '2023-01-02'), (2, 3, '2023-01-09'), (2, 1, '2023-01-16'),
(3, 3, '2023-01-03'), (3, 1, '2023-01-10'), (3, 2, '2023-01-17'),
(4, 1, '2023-01-04'), (4, 2, '2023-01-11'), (4, 3, '2023-01-18'),
(5, 2, '2023-01-05'), (5, 3, '2023-01-12'), (5, 1, '2023-01-19'),
(6, 3, '2023-01-06'), (6, 1, '2023-01-13'), (6, 2, '2023-01-20'),
(7, 1, '2023-01-07'), (7, 2, '2023-01-14'), (7, 3, '2023-01-21'),
(8, 2, '2023-01-08'), (8, 3, '2023-01-15'), (8, 1, '2023-01-22'),
(9, 3, '2023-01-09'), (9, 1, '2023-01-16'), (9, 2, '2023-01-23'),
(10, 1, '2023-01-10'), (10, 2, '2023-01-17'), (10, 3, '2023-01-24'),
(11, 2, '2023-01-11'), (11, 3, '2023-01-18'), (11, 1, '2023-01-25'),
(12, 3, '2023-01-12'), (12, 1, '2023-01-19'), (12, 2, '2023-01-26'),
(13, 1, '2023-01-13'), (13, 2, '2023-01-20'), (13, 3, '2023-01-27'),
(14, 2, '2023-01-14'), (14, 3, '2023-01-21'), (14, 1, '2023-01-28'),
(15, 3, '2023-01-15'), (15, 1, '2023-01-22'), (15, 2, '2023-01-29'),
(16, 1, '2023-01-16'), (16, 2, '2023-01-23'), (16, 3, '2023-01-30'),
(17, 2, '2023-01-17'), (17, 3, '2023-01-24'), (17, 1, '2023-01-31'),
(18, 3, '2023-01-18'), (18, 1, '2023-01-25'), (18, 2, '2023-02-01'),
(19, 1, '2023-01-19'), (19, 2, '2023-01-26'), (19, 3, '2023-02-02'),
(20, 2, '2023-01-20'), (20, 3, '2023-01-27'), (20, 1, '2023-02-03');

-- Historial Médico (1 por empleado = 20 registros)
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES
(1, '2023-01-05', 'Saludable'),
(2, '2023-02-10', 'Hipertensión leve'),
(3, '2023-03-15', 'Alergia estacional'),
(4, '2023-04-20', 'Saludable'),
(5, '2023-05-25', 'Diabetes tipo 2'),
(6, '2023-06-30', 'Saludable'),
(7, '2023-01-10', 'Alergia a penicilina'),
(8, '2023-02-15', 'Saludable'),
(9, '2023-03-20', 'Hipertensión controlada'),
(10, '2023-04-25', 'Saludable'),
(11, '2023-05-30', 'Asma leve'),
(12, '2023-06-05', 'Saludable'),
(13, '2023-01-15', 'Alergia a polvo'),
(14, '2023-02-20', 'Saludable'),
(15, '2023-03-25', 'Hipertensión'),
(16, '2023-04-30', 'Saludable'),
(17, '2023-05-05', 'Diabetes tipo 1'),
(18, '2023-06-10', 'Saludable'),
(19, '2023-01-20', 'Alergia a mariscos'),
(20, '2023-02-25', 'Saludable');

INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado21', 'Apellido21', '2021-01-22', 11, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (21, '5550000211');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (21, '5550000212');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (21, '2021-04-19', '2021-04-26', 'Motivo permiso 1 empleado 21');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (21, '2021-03-26', '2021-04-02', 'Motivo permiso 2 empleado 21');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (21, '2021-07-11', 'Incidencia para empleado 21', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (21, 3, '2021-07-18');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (21, 3, '2021-07-30');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (21, 1, '2021-06-10');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (21, '2021-02-21', 'Consulta m�dica general del empleado 21');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado22', 'Apellido22', '2021-01-23', 3, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (22, '5550000221');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (22, '5550000222');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (22, '2021-02-16', '2021-02-23', 'Motivo permiso 1 empleado 22');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (22, '2021-04-09', '2021-04-15', 'Motivo permiso 2 empleado 22');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (22, '2021-02-07', 'Incidencia para empleado 22', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (22, 3, '2021-04-22');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (22, 2, '2021-02-21');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (22, 3, '2021-06-09');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (22, '2021-02-22', 'Consulta m�dica general del empleado 22');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado23', 'Apellido23', '2021-01-24', 12, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (23, '5550000231');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (23, '5550000232');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (23, '2021-04-20', '2021-04-21', 'Motivo permiso 1 empleado 23');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (23, '2021-04-19', '2021-04-21', 'Motivo permiso 2 empleado 23');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (23, '2021-02-17', 'Incidencia para empleado 23', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (23, 2, '2021-08-04');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (23, 1, '2021-07-03');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (23, 1, '2021-02-14');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (23, '2021-02-23', 'Consulta m�dica general del empleado 23');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (23, 1);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado24', 'Apellido24', '2021-01-25', 3, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (24, '5550000241');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (24, '5550000242');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (24, '2021-02-11', '2021-02-12', 'Motivo permiso 1 empleado 24');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (24, '2021-04-04', '2021-04-14', 'Motivo permiso 2 empleado 24');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (24, '2021-02-14', 'Incidencia para empleado 24', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (24, 3, '2021-05-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (24, 2, '2021-04-15');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (24, 2, '2021-07-04');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (24, '2021-02-24', 'Consulta m�dica general del empleado 24');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado25', 'Apellido25', '2021-01-26', 10, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (25, '5550000251');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (25, '5550000252');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (25, '2021-03-13', '2021-03-22', 'Motivo permiso 1 empleado 25');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (25, '2021-03-22', '2021-03-25', 'Motivo permiso 2 empleado 25');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (25, '2021-06-30', 'Incidencia para empleado 25', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (25, 1, '2021-07-19');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (25, 3, '2021-07-19');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (25, 1, '2021-06-02');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (25, '2021-02-25', 'Consulta m�dica general del empleado 25');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado26', 'Apellido26', '2021-01-27', 2, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (26, '5550000261');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (26, '5550000262');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (26, '2021-03-08', '2021-03-11', 'Motivo permiso 1 empleado 26');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (26, '2021-03-10', '2021-03-15', 'Motivo permiso 2 empleado 26');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (26, '2021-08-03', 'Incidencia para empleado 26', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (26, 2, '2021-04-13');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (26, 3, '2021-02-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (26, 2, '2021-07-29');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (26, '2021-02-26', 'Consulta m�dica general del empleado 26');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado27', 'Apellido27', '2021-01-28', 5, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (27, '5550000271');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (27, '5550000272');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (27, '2021-03-01', '2021-03-04', 'Motivo permiso 1 empleado 27');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (27, '2021-02-13', '2021-02-17', 'Motivo permiso 2 empleado 27');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (27, '2021-02-18', 'Incidencia para empleado 27', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (27, 1, '2021-04-30');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (27, 1, '2021-05-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (27, 3, '2021-02-23');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (27, '2021-02-27', 'Consulta m�dica general del empleado 27');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (27, 5);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado28', 'Apellido28', '2021-01-29', 7, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (28, '5550000281');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (28, '5550000282');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (28, '2021-03-12', '2021-03-15', 'Motivo permiso 1 empleado 28');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (28, '2021-03-27', '2021-04-05', 'Motivo permiso 2 empleado 28');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (28, '2021-04-15', 'Incidencia para empleado 28', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (28, 2, '2021-08-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (28, 1, '2021-03-22');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (28, 3, '2021-08-05');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (28, '2021-02-28', 'Consulta m�dica general del empleado 28');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (28, 5);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado29', 'Apellido29', '2021-01-30', 11, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (29, '5550000291');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (29, '5550000292');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (29, '2021-03-29', '2021-04-04', 'Motivo permiso 1 empleado 29');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (29, '2021-03-07', '2021-03-13', 'Motivo permiso 2 empleado 29');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (29, '2021-05-25', 'Incidencia para empleado 29', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (29, 2, '2021-03-10');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (29, 1, '2021-06-10');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (29, 3, '2021-02-03');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (29, '2021-03-01', 'Consulta m�dica general del empleado 29');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado30', 'Apellido30', '2021-01-31', 9, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (30, '5550000301');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (30, '5550000302');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (30, '2021-04-07', '2021-04-13', 'Motivo permiso 1 empleado 30');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (30, '2021-02-10', '2021-02-13', 'Motivo permiso 2 empleado 30');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (30, '2021-04-14', 'Incidencia para empleado 30', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (30, 2, '2021-05-15');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (30, 3, '2021-06-04');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (30, 1, '2021-03-28');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (30, '2021-03-02', 'Consulta m�dica general del empleado 30');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado31', 'Apellido31', '2021-02-01', 7, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (31, '5550000311');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (31, '5550000312');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (31, '2021-02-06', '2021-02-14', 'Motivo permiso 1 empleado 31');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (31, '2021-03-24', '2021-04-02', 'Motivo permiso 2 empleado 31');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (31, '2021-03-17', 'Incidencia para empleado 31', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (31, 1, '2021-07-08');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (31, 2, '2021-06-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (31, 3, '2021-05-20');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (31, '2021-03-03', 'Consulta m�dica general del empleado 31');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado32', 'Apellido32', '2021-02-02', 7, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (32, '5550000321');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (32, '5550000322');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (32, '2021-02-25', '2021-02-27', 'Motivo permiso 1 empleado 32');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (32, '2021-05-03', '2021-05-12', 'Motivo permiso 2 empleado 32');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (32, '2021-05-14', 'Incidencia para empleado 32', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (32, 3, '2021-05-31');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (32, 2, '2021-03-15');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (32, 2, '2021-04-27');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (32, '2021-03-04', 'Consulta m�dica general del empleado 32');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado33', 'Apellido33', '2021-02-03', 9, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (33, '5550000331');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (33, '5550000332');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (33, '2021-03-31', '2021-04-07', 'Motivo permiso 1 empleado 33');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (33, '2021-03-19', '2021-03-23', 'Motivo permiso 2 empleado 33');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (33, '2021-02-19', 'Incidencia para empleado 33', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (33, 3, '2021-03-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (33, 3, '2021-03-06');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (33, 1, '2021-04-15');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (33, '2021-03-05', 'Consulta m�dica general del empleado 33');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado34', 'Apellido34', '2021-02-04', 12, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (34, '5550000341');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (34, '5550000342');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (34, '2021-05-06', '2021-05-10', 'Motivo permiso 1 empleado 34');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (34, '2021-02-12', '2021-02-14', 'Motivo permiso 2 empleado 34');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (34, '2021-03-03', 'Incidencia para empleado 34', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (34, 2, '2021-04-22');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (34, 3, '2021-03-06');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (34, 3, '2021-08-13');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (34, '2021-03-06', 'Consulta m�dica general del empleado 34');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado35', 'Apellido35', '2021-02-05', 6, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (35, '5550000351');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (35, '5550000352');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (35, '2021-02-19', '2021-03-01', 'Motivo permiso 1 empleado 35');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (35, '2021-04-08', '2021-04-18', 'Motivo permiso 2 empleado 35');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (35, '2021-05-02', 'Incidencia para empleado 35', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (35, 1, '2021-06-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (35, 1, '2021-07-31');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (35, 3, '2021-03-29');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (35, '2021-03-07', 'Consulta m�dica general del empleado 35');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (35, 5);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado36', 'Apellido36', '2021-02-06', 12, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (36, '5550000361');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (36, '5550000362');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (36, '2021-05-11', '2021-05-19', 'Motivo permiso 1 empleado 36');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (36, '2021-03-30', '2021-04-08', 'Motivo permiso 2 empleado 36');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (36, '2021-04-26', 'Incidencia para empleado 36', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (36, 1, '2021-02-12');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (36, 1, '2021-07-01');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (36, 1, '2021-03-04');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (36, '2021-03-08', 'Consulta m�dica general del empleado 36');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado37', 'Apellido37', '2021-02-07', 2, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (37, '5550000371');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (37, '5550000372');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (37, '2021-04-13', '2021-04-16', 'Motivo permiso 1 empleado 37');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (37, '2021-03-16', '2021-03-23', 'Motivo permiso 2 empleado 37');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (37, '2021-03-12', 'Incidencia para empleado 37', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (37, 1, '2021-07-28');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (37, 2, '2021-04-22');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (37, 1, '2021-05-08');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (37, '2021-03-09', 'Consulta m�dica general del empleado 37');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado38', 'Apellido38', '2021-02-08', 7, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (38, '5550000381');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (38, '5550000382');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (38, '2021-03-31', '2021-04-03', 'Motivo permiso 1 empleado 38');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (38, '2021-04-06', '2021-04-07', 'Motivo permiso 2 empleado 38');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (38, '2021-02-24', 'Incidencia para empleado 38', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (38, 3, '2021-08-15');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (38, 1, '2021-05-15');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (38, 3, '2021-07-16');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (38, '2021-03-10', 'Consulta m�dica general del empleado 38');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (38, 4);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado39', 'Apellido39', '2021-02-09', 7, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (39, '5550000391');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (39, '5550000392');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (39, '2021-05-11', '2021-05-17', 'Motivo permiso 1 empleado 39');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (39, '2021-04-09', '2021-04-13', 'Motivo permiso 2 empleado 39');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (39, '2021-02-26', 'Incidencia para empleado 39', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (39, 2, '2021-07-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (39, 3, '2021-05-28');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (39, 2, '2021-04-15');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (39, '2021-03-11', 'Consulta m�dica general del empleado 39');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado40', 'Apellido40', '2021-02-10', 11, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (40, '5550000401');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (40, '5550000402');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (40, '2021-04-07', '2021-04-13', 'Motivo permiso 1 empleado 40');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (40, '2021-04-24', '2021-04-29', 'Motivo permiso 2 empleado 40');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (40, '2021-07-11', 'Incidencia para empleado 40', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (40, 2, '2021-03-21');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (40, 2, '2021-05-12');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (40, 3, '2021-06-12');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (40, '2021-03-12', 'Consulta m�dica general del empleado 40');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado41', 'Apellido41', '2021-02-11', 9, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (41, '5550000411');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (41, '5550000412');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (41, '2021-02-27', '2021-03-08', 'Motivo permiso 1 empleado 41');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (41, '2021-05-01', '2021-05-09', 'Motivo permiso 2 empleado 41');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (41, '2021-08-08', 'Incidencia para empleado 41', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (41, 2, '2021-03-24');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (41, 3, '2021-06-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (41, 1, '2021-05-05');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (41, '2021-03-13', 'Consulta m�dica general del empleado 41');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado42', 'Apellido42', '2021-02-12', 12, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (42, '5550000421');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (42, '5550000422');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (42, '2021-05-12', '2021-05-15', 'Motivo permiso 1 empleado 42');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (42, '2021-03-14', '2021-03-15', 'Motivo permiso 2 empleado 42');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (42, '2021-07-31', 'Incidencia para empleado 42', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (42, 2, '2021-07-12');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (42, 3, '2021-02-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (42, 3, '2021-03-09');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (42, '2021-03-14', 'Consulta m�dica general del empleado 42');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado43', 'Apellido43', '2021-02-13', 7, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (43, '5550000431');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (43, '5550000432');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (43, '2021-04-09', '2021-04-18', 'Motivo permiso 1 empleado 43');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (43, '2021-03-27', '2021-03-29', 'Motivo permiso 2 empleado 43');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (43, '2021-08-08', 'Incidencia para empleado 43', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (43, 3, '2021-05-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (43, 3, '2021-06-27');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (43, 1, '2021-03-02');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (43, '2021-03-15', 'Consulta m�dica general del empleado 43');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (43, 2);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado44', 'Apellido44', '2021-02-14', 4, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (44, '5550000441');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (44, '5550000442');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (44, '2021-03-20', '2021-03-25', 'Motivo permiso 1 empleado 44');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (44, '2021-02-15', '2021-02-16', 'Motivo permiso 2 empleado 44');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (44, '2021-02-21', 'Incidencia para empleado 44', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (44, 2, '2021-03-11');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (44, 1, '2021-08-24');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (44, 2, '2021-02-17');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (44, '2021-03-16', 'Consulta m�dica general del empleado 44');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado45', 'Apellido45', '2021-02-15', 1, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (45, '5550000451');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (45, '5550000452');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (45, '2021-03-25', '2021-04-04', 'Motivo permiso 1 empleado 45');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (45, '2021-03-13', '2021-03-19', 'Motivo permiso 2 empleado 45');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (45, '2021-05-15', 'Incidencia para empleado 45', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (45, 2, '2021-07-24');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (45, 1, '2021-06-01');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (45, 2, '2021-03-31');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (45, '2021-03-17', 'Consulta m�dica general del empleado 45');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado46', 'Apellido46', '2021-02-16', 9, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (46, '5550000461');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (46, '5550000462');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (46, '2021-04-19', '2021-04-27', 'Motivo permiso 1 empleado 46');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (46, '2021-03-27', '2021-03-30', 'Motivo permiso 2 empleado 46');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (46, '2021-05-17', 'Incidencia para empleado 46', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (46, 2, '2021-04-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (46, 3, '2021-04-20');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (46, 2, '2021-06-05');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (46, '2021-03-18', 'Consulta m�dica general del empleado 46');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado47', 'Apellido47', '2021-02-17', 10, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (47, '5550000471');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (47, '5550000472');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (47, '2021-03-23', '2021-03-24', 'Motivo permiso 1 empleado 47');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (47, '2021-03-12', '2021-03-20', 'Motivo permiso 2 empleado 47');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (47, '2021-05-01', 'Incidencia para empleado 47', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (47, 2, '2021-07-31');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (47, 2, '2021-07-22');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (47, 1, '2021-07-03');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (47, '2021-03-19', 'Consulta m�dica general del empleado 47');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado48', 'Apellido48', '2021-02-18', 2, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (48, '5550000481');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (48, '5550000482');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (48, '2021-05-03', '2021-05-11', 'Motivo permiso 1 empleado 48');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (48, '2021-03-04', '2021-03-10', 'Motivo permiso 2 empleado 48');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (48, '2021-07-11', 'Incidencia para empleado 48', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (48, 2, '2021-07-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (48, 3, '2021-03-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (48, 3, '2021-07-17');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (48, '2021-03-20', 'Consulta m�dica general del empleado 48');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (48, 1);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado49', 'Apellido49', '2021-02-19', 7, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (49, '5550000491');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (49, '5550000492');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (49, '2021-03-23', '2021-03-29', 'Motivo permiso 1 empleado 49');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (49, '2021-02-23', '2021-02-27', 'Motivo permiso 2 empleado 49');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (49, '2021-05-20', 'Incidencia para empleado 49', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (49, 3, '2021-02-28');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (49, 1, '2021-08-15');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (49, 3, '2021-06-30');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (49, '2021-03-21', 'Consulta m�dica general del empleado 49');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado50', 'Apellido50', '2021-02-20', 8, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (50, '5550000501');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (50, '5550000502');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (50, '2021-03-31', '2021-04-01', 'Motivo permiso 1 empleado 50');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (50, '2021-03-20', '2021-03-28', 'Motivo permiso 2 empleado 50');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (50, '2021-06-05', 'Incidencia para empleado 50', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (50, 1, '2021-08-30');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (50, 3, '2021-08-26');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (50, 1, '2021-03-15');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (50, '2021-03-22', 'Consulta m�dica general del empleado 50');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado51', 'Apellido51', '2021-02-21', 3, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (51, '5550000511');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (51, '5550000512');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (51, '2021-02-22', '2021-02-25', 'Motivo permiso 1 empleado 51');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (51, '2021-05-16', '2021-05-21', 'Motivo permiso 2 empleado 51');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (51, '2021-03-06', 'Incidencia para empleado 51', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (51, 1, '2021-05-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (51, 2, '2021-04-01');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (51, 2, '2021-05-16');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (51, '2021-03-23', 'Consulta m�dica general del empleado 51');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado52', 'Apellido52', '2021-02-22', 10, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (52, '5550000521');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (52, '5550000522');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (52, '2021-02-26', '2021-03-02', 'Motivo permiso 1 empleado 52');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (52, '2021-03-31', '2021-04-08', 'Motivo permiso 2 empleado 52');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (52, '2021-07-26', 'Incidencia para empleado 52', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (52, 3, '2021-03-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (52, 3, '2021-07-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (52, 2, '2021-08-06');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (52, '2021-03-24', 'Consulta m�dica general del empleado 52');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado53', 'Apellido53', '2021-02-23', 10, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (53, '5550000531');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (53, '5550000532');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (53, '2021-05-27', '2021-05-28', 'Motivo permiso 1 empleado 53');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (53, '2021-03-25', '2021-04-01', 'Motivo permiso 2 empleado 53');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (53, '2021-08-08', 'Incidencia para empleado 53', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (53, 2, '2021-03-10');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (53, 2, '2021-05-17');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (53, 3, '2021-04-23');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (53, '2021-03-25', 'Consulta m�dica general del empleado 53');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado54', 'Apellido54', '2021-02-24', 5, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (54, '5550000541');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (54, '5550000542');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (54, '2021-04-15', '2021-04-20', 'Motivo permiso 1 empleado 54');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (54, '2021-05-10', '2021-05-17', 'Motivo permiso 2 empleado 54');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (54, '2021-07-24', 'Incidencia para empleado 54', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (54, 1, '2021-05-02');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (54, 1, '2021-04-30');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (54, 3, '2021-03-20');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (54, '2021-03-26', 'Consulta m�dica general del empleado 54');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado55', 'Apellido55', '2021-02-25', 5, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (55, '5550000551');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (55, '5550000552');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (55, '2021-03-24', '2021-03-27', 'Motivo permiso 1 empleado 55');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (55, '2021-04-16', '2021-04-21', 'Motivo permiso 2 empleado 55');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (55, '2021-05-31', 'Incidencia para empleado 55', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (55, 1, '2021-04-19');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (55, 1, '2021-03-21');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (55, 1, '2021-04-04');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (55, '2021-03-27', 'Consulta m�dica general del empleado 55');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (55, 2);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado56', 'Apellido56', '2021-02-26', 10, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (56, '5550000561');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (56, '5550000562');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (56, '2021-06-01', '2021-06-09', 'Motivo permiso 1 empleado 56');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (56, '2021-03-24', '2021-04-02', 'Motivo permiso 2 empleado 56');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (56, '2021-07-05', 'Incidencia para empleado 56', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (56, 1, '2021-09-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (56, 1, '2021-07-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (56, 3, '2021-08-07');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (56, '2021-03-28', 'Consulta m�dica general del empleado 56');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado57', 'Apellido57', '2021-02-27', 9, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (57, '5550000571');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (57, '5550000572');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (57, '2021-06-07', '2021-06-11', 'Motivo permiso 1 empleado 57');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (57, '2021-05-24', '2021-05-31', 'Motivo permiso 2 empleado 57');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (57, '2021-06-27', 'Incidencia para empleado 57', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (57, 3, '2021-05-25');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (57, 3, '2021-03-28');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (57, 3, '2021-04-17');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (57, '2021-03-29', 'Consulta m�dica general del empleado 57');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado58', 'Apellido58', '2021-02-28', 10, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (58, '5550000581');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (58, '5550000582');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (58, '2021-05-17', '2021-05-22', 'Motivo permiso 1 empleado 58');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (58, '2021-03-18', '2021-03-28', 'Motivo permiso 2 empleado 58');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (58, '2021-04-25', 'Incidencia para empleado 58', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (58, 1, '2021-07-27');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (58, 2, '2021-05-03');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (58, 1, '2021-08-21');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (58, '2021-03-30', 'Consulta m�dica general del empleado 58');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado59', 'Apellido59', '2021-03-01', 10, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (59, '5550000591');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (59, '5550000592');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (59, '2021-05-24', '2021-05-26', 'Motivo permiso 1 empleado 59');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (59, '2021-04-24', '2021-04-25', 'Motivo permiso 2 empleado 59');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (59, '2021-05-21', 'Incidencia para empleado 59', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (59, 3, '2021-04-04');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (59, 2, '2021-06-21');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (59, 3, '2021-08-17');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (59, '2021-03-31', 'Consulta m�dica general del empleado 59');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (59, 1);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado60', 'Apellido60', '2021-03-02', 5, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (60, '5550000601');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (60, '5550000602');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (60, '2021-05-14', '2021-05-16', 'Motivo permiso 1 empleado 60');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (60, '2021-04-18', '2021-04-26', 'Motivo permiso 2 empleado 60');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (60, '2021-05-17', 'Incidencia para empleado 60', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (60, 1, '2021-07-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (60, 2, '2021-05-31');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (60, 3, '2021-05-05');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (60, '2021-04-01', 'Consulta m�dica general del empleado 60');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (60, 5);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado61', 'Apellido61', '2021-03-03', 4, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (61, '5550000611');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (61, '5550000612');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (61, '2021-05-13', '2021-05-18', 'Motivo permiso 1 empleado 61');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (61, '2021-05-15', '2021-05-22', 'Motivo permiso 2 empleado 61');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (61, '2021-04-05', 'Incidencia para empleado 61', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (61, 1, '2021-05-13');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (61, 1, '2021-07-02');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (61, 1, '2021-07-01');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (61, '2021-04-02', 'Consulta m�dica general del empleado 61');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado62', 'Apellido62', '2021-03-04', 1, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (62, '5550000621');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (62, '5550000622');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (62, '2021-04-22', '2021-05-01', 'Motivo permiso 1 empleado 62');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (62, '2021-03-22', '2021-03-27', 'Motivo permiso 2 empleado 62');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (62, '2021-03-16', 'Incidencia para empleado 62', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (62, 2, '2021-06-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (62, 2, '2021-05-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (62, 1, '2021-03-16');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (62, '2021-04-03', 'Consulta m�dica general del empleado 62');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado63', 'Apellido63', '2021-03-05', 4, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (63, '5550000631');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (63, '5550000632');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (63, '2021-04-14', '2021-04-17', 'Motivo permiso 1 empleado 63');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (63, '2021-04-09', '2021-04-14', 'Motivo permiso 2 empleado 63');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (63, '2021-07-13', 'Incidencia para empleado 63', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (63, 1, '2021-06-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (63, 3, '2021-05-02');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (63, 3, '2021-08-13');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (63, '2021-04-04', 'Consulta m�dica general del empleado 63');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado64', 'Apellido64', '2021-03-06', 10, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (64, '5550000641');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (64, '5550000642');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (64, '2021-05-11', '2021-05-18', 'Motivo permiso 1 empleado 64');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (64, '2021-04-05', '2021-04-13', 'Motivo permiso 2 empleado 64');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (64, '2021-05-03', 'Incidencia para empleado 64', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (64, 1, '2021-06-16');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (64, 3, '2021-09-17');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (64, 2, '2021-09-06');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (64, '2021-04-05', 'Consulta m�dica general del empleado 64');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (64, 2);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado65', 'Apellido65', '2021-03-07', 12, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (65, '5550000651');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (65, '5550000652');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (65, '2021-06-13', '2021-06-22', 'Motivo permiso 1 empleado 65');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (65, '2021-03-16', '2021-03-19', 'Motivo permiso 2 empleado 65');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (65, '2021-08-08', 'Incidencia para empleado 65', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (65, 1, '2021-06-02');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (65, 3, '2021-09-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (65, 1, '2021-09-07');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (65, '2021-04-06', 'Consulta m�dica general del empleado 65');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado66', 'Apellido66', '2021-03-08', 12, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (66, '5550000661');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (66, '5550000662');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (66, '2021-03-12', '2021-03-14', 'Motivo permiso 1 empleado 66');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (66, '2021-03-10', '2021-03-15', 'Motivo permiso 2 empleado 66');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (66, '2021-04-22', 'Incidencia para empleado 66', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (66, 1, '2021-09-12');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (66, 1, '2021-03-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (66, 2, '2021-05-02');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (66, '2021-04-07', 'Consulta m�dica general del empleado 66');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado67', 'Apellido67', '2021-03-09', 11, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (67, '5550000671');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (67, '5550000672');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (67, '2021-06-02', '2021-06-03', 'Motivo permiso 1 empleado 67');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (67, '2021-06-04', '2021-06-07', 'Motivo permiso 2 empleado 67');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (67, '2021-08-07', 'Incidencia para empleado 67', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (67, 3, '2021-04-26');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (67, 1, '2021-04-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (67, 3, '2021-09-07');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (67, '2021-04-08', 'Consulta m�dica general del empleado 67');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado68', 'Apellido68', '2021-03-10', 9, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (68, '5550000681');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (68, '5550000682');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (68, '2021-04-29', '2021-05-06', 'Motivo permiso 1 empleado 68');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (68, '2021-04-04', '2021-04-08', 'Motivo permiso 2 empleado 68');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (68, '2021-05-11', 'Incidencia para empleado 68', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (68, 2, '2021-03-11');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (68, 1, '2021-09-06');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (68, 2, '2021-04-29');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (68, '2021-04-09', 'Consulta m�dica general del empleado 68');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado69', 'Apellido69', '2021-03-11', 12, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (69, '5550000691');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (69, '5550000692');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (69, '2021-03-13', '2021-03-18', 'Motivo permiso 1 empleado 69');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (69, '2021-04-28', '2021-05-07', 'Motivo permiso 2 empleado 69');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (69, '2021-04-21', 'Incidencia para empleado 69', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (69, 3, '2021-05-25');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (69, 2, '2021-03-19');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (69, 3, '2021-03-30');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (69, '2021-04-10', 'Consulta m�dica general del empleado 69');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado70', 'Apellido70', '2021-03-12', 8, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (70, '5550000701');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (70, '5550000702');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (70, '2021-05-04', '2021-05-10', 'Motivo permiso 1 empleado 70');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (70, '2021-03-19', '2021-03-24', 'Motivo permiso 2 empleado 70');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (70, '2021-05-22', 'Incidencia para empleado 70', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (70, 1, '2021-08-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (70, 1, '2021-08-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (70, 1, '2021-08-24');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (70, '2021-04-11', 'Consulta m�dica general del empleado 70');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado71', 'Apellido71', '2021-03-13', 7, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (71, '5550000711');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (71, '5550000712');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (71, '2021-06-05', '2021-06-07', 'Motivo permiso 1 empleado 71');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (71, '2021-06-09', '2021-06-19', 'Motivo permiso 2 empleado 71');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (71, '2021-09-02', 'Incidencia para empleado 71', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (71, 1, '2021-08-24');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (71, 3, '2021-05-31');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (71, 2, '2021-06-10');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (71, '2021-04-12', 'Consulta m�dica general del empleado 71');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado72', 'Apellido72', '2021-03-14', 5, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (72, '5550000721');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (72, '5550000722');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (72, '2021-03-25', '2021-03-26', 'Motivo permiso 1 empleado 72');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (72, '2021-05-17', '2021-05-22', 'Motivo permiso 2 empleado 72');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (72, '2021-09-25', 'Incidencia para empleado 72', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (72, 2, '2021-05-26');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (72, 3, '2021-03-16');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (72, 2, '2021-03-24');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (72, '2021-04-13', 'Consulta m�dica general del empleado 72');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado73', 'Apellido73', '2021-03-15', 2, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (73, '5550000731');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (73, '5550000732');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (73, '2021-05-10', '2021-05-14', 'Motivo permiso 1 empleado 73');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (73, '2021-05-25', '2021-06-03', 'Motivo permiso 2 empleado 73');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (73, '2021-08-24', 'Incidencia para empleado 73', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (73, 2, '2021-06-17');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (73, 2, '2021-04-01');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (73, 2, '2021-06-19');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (73, '2021-04-14', 'Consulta m�dica general del empleado 73');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado74', 'Apellido74', '2021-03-16', 3, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (74, '5550000741');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (74, '5550000742');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (74, '2021-04-07', '2021-04-15', 'Motivo permiso 1 empleado 74');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (74, '2021-03-31', '2021-04-01', 'Motivo permiso 2 empleado 74');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (74, '2021-08-23', 'Incidencia para empleado 74', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (74, 3, '2021-03-23');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (74, 1, '2021-07-19');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (74, 1, '2021-06-18');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (74, '2021-04-15', 'Consulta m�dica general del empleado 74');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado75', 'Apellido75', '2021-03-17', 10, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (75, '5550000751');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (75, '5550000752');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (75, '2021-05-07', '2021-05-14', 'Motivo permiso 1 empleado 75');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (75, '2021-04-29', '2021-05-09', 'Motivo permiso 2 empleado 75');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (75, '2021-09-25', 'Incidencia para empleado 75', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (75, 3, '2021-05-18');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (75, 1, '2021-07-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (75, 3, '2021-07-13');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (75, '2021-04-16', 'Consulta m�dica general del empleado 75');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (75, 1);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado76', 'Apellido76', '2021-03-18', 2, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (76, '5550000761');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (76, '5550000762');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (76, '2021-06-04', '2021-06-14', 'Motivo permiso 1 empleado 76');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (76, '2021-06-04', '2021-06-14', 'Motivo permiso 2 empleado 76');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (76, '2021-05-16', 'Incidencia para empleado 76', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (76, 1, '2021-09-22');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (76, 1, '2021-07-17');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (76, 3, '2021-08-07');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (76, '2021-04-17', 'Consulta m�dica general del empleado 76');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (76, 4);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado77', 'Apellido77', '2021-03-19', 1, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (77, '5550000771');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (77, '5550000772');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (77, '2021-03-22', '2021-03-27', 'Motivo permiso 1 empleado 77');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (77, '2021-05-16', '2021-05-26', 'Motivo permiso 2 empleado 77');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (77, '2021-08-20', 'Incidencia para empleado 77', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (77, 2, '2021-04-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (77, 2, '2021-07-03');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (77, 1, '2021-05-27');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (77, '2021-04-18', 'Consulta m�dica general del empleado 77');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (77, 1);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado78', 'Apellido78', '2021-03-20', 3, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (78, '5550000781');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (78, '5550000782');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (78, '2021-06-23', '2021-06-28', 'Motivo permiso 1 empleado 78');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (78, '2021-03-28', '2021-03-30', 'Motivo permiso 2 empleado 78');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (78, '2021-05-08', 'Incidencia para empleado 78', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (78, 1, '2021-05-08');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (78, 3, '2021-05-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (78, 2, '2021-07-02');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (78, '2021-04-19', 'Consulta m�dica general del empleado 78');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado79', 'Apellido79', '2021-03-21', 10, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (79, '5550000791');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (79, '5550000792');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (79, '2021-06-11', '2021-06-17', 'Motivo permiso 1 empleado 79');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (79, '2021-03-22', '2021-04-01', 'Motivo permiso 2 empleado 79');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (79, '2021-06-11', 'Incidencia para empleado 79', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (79, 1, '2021-04-27');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (79, 2, '2021-07-24');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (79, 2, '2021-10-04');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (79, '2021-04-20', 'Consulta m�dica general del empleado 79');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (79, 3);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado80', 'Apellido80', '2021-03-22', 9, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (80, '5550000801');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (80, '5550000802');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (80, '2021-05-16', '2021-05-24', 'Motivo permiso 1 empleado 80');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (80, '2021-05-01', '2021-05-07', 'Motivo permiso 2 empleado 80');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (80, '2021-05-10', 'Incidencia para empleado 80', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (80, 3, '2021-05-13');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (80, 2, '2021-07-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (80, 1, '2021-09-24');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (80, '2021-04-21', 'Consulta m�dica general del empleado 80');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (80, 5);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado81', 'Apellido81', '2021-03-23', 9, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (81, '5550000811');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (81, '5550000812');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (81, '2021-04-24', '2021-05-02', 'Motivo permiso 1 empleado 81');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (81, '2021-06-02', '2021-06-03', 'Motivo permiso 2 empleado 81');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (81, '2021-09-26', 'Incidencia para empleado 81', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (81, 2, '2021-06-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (81, 3, '2021-07-09');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (81, 2, '2021-04-10');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (81, '2021-04-22', 'Consulta m�dica general del empleado 81');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado82', 'Apellido82', '2021-03-24', 9, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (82, '5550000821');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (82, '5550000822');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (82, '2021-06-03', '2021-06-05', 'Motivo permiso 1 empleado 82');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (82, '2021-06-18', '2021-06-20', 'Motivo permiso 2 empleado 82');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (82, '2021-07-19', 'Incidencia para empleado 82', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (82, 2, '2021-06-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (82, 3, '2021-05-12');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (82, 3, '2021-08-30');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (82, '2021-04-23', 'Consulta m�dica general del empleado 82');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado83', 'Apellido83', '2021-03-25', 8, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (83, '5550000831');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (83, '5550000832');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (83, '2021-04-01', '2021-04-07', 'Motivo permiso 1 empleado 83');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (83, '2021-06-16', '2021-06-17', 'Motivo permiso 2 empleado 83');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (83, '2021-04-06', 'Incidencia para empleado 83', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (83, 1, '2021-05-18');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (83, 2, '2021-08-08');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (83, 3, '2021-07-06');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (83, '2021-04-24', 'Consulta m�dica general del empleado 83');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado84', 'Apellido84', '2021-03-26', 7, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (84, '5550000841');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (84, '5550000842');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (84, '2021-04-08', '2021-04-11', 'Motivo permiso 1 empleado 84');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (84, '2021-05-16', '2021-05-26', 'Motivo permiso 2 empleado 84');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (84, '2021-05-26', 'Incidencia para empleado 84', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (84, 2, '2021-08-06');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (84, 2, '2021-05-18');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (84, 3, '2021-04-01');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (84, '2021-04-25', 'Consulta m�dica general del empleado 84');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado85', 'Apellido85', '2021-03-27', 9, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (85, '5550000851');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (85, '5550000852');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (85, '2021-05-17', '2021-05-24', 'Motivo permiso 1 empleado 85');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (85, '2021-06-15', '2021-06-21', 'Motivo permiso 2 empleado 85');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (85, '2021-06-22', 'Incidencia para empleado 85', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (85, 3, '2021-09-12');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (85, 2, '2021-07-28');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (85, 2, '2021-07-27');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (85, '2021-04-26', 'Consulta m�dica general del empleado 85');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado86', 'Apellido86', '2021-03-28', 6, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (86, '5550000861');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (86, '5550000862');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (86, '2021-04-18', '2021-04-28', 'Motivo permiso 1 empleado 86');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (86, '2021-07-06', '2021-07-16', 'Motivo permiso 2 empleado 86');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (86, '2021-08-27', 'Incidencia para empleado 86', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (86, 1, '2021-04-16');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (86, 2, '2021-09-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (86, 2, '2021-04-19');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (86, '2021-04-27', 'Consulta m�dica general del empleado 86');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado87', 'Apellido87', '2021-03-29', 2, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (87, '5550000871');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (87, '5550000872');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (87, '2021-05-20', '2021-05-26', 'Motivo permiso 1 empleado 87');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (87, '2021-04-14', '2021-04-16', 'Motivo permiso 2 empleado 87');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (87, '2021-05-24', 'Incidencia para empleado 87', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (87, 2, '2021-03-30');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (87, 2, '2021-06-09');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (87, 1, '2021-08-30');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (87, '2021-04-28', 'Consulta m�dica general del empleado 87');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado88', 'Apellido88', '2021-03-30', 4, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (88, '5550000881');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (88, '5550000882');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (88, '2021-04-06', '2021-04-07', 'Motivo permiso 1 empleado 88');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (88, '2021-06-30', '2021-07-04', 'Motivo permiso 2 empleado 88');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (88, '2021-09-16', 'Incidencia para empleado 88', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (88, 2, '2021-07-19');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (88, 2, '2021-08-08');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (88, 3, '2021-05-05');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (88, '2021-04-29', 'Consulta m�dica general del empleado 88');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado89', 'Apellido89', '2021-03-31', 3, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (89, '5550000891');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (89, '5550000892');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (89, '2021-06-19', '2021-06-26', 'Motivo permiso 1 empleado 89');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (89, '2021-06-22', '2021-06-30', 'Motivo permiso 2 empleado 89');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (89, '2021-10-03', 'Incidencia para empleado 89', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (89, 1, '2021-05-21');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (89, 3, '2021-09-22');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (89, 3, '2021-06-02');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (89, '2021-04-30', 'Consulta m�dica general del empleado 89');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (89, 1);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado90', 'Apellido90', '2021-04-01', 6, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (90, '5550000901');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (90, '5550000902');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (90, '2021-07-10', '2021-07-16', 'Motivo permiso 1 empleado 90');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (90, '2021-05-08', '2021-05-16', 'Motivo permiso 2 empleado 90');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (90, '2021-05-23', 'Incidencia para empleado 90', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (90, 3, '2021-10-06');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (90, 2, '2021-05-16');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (90, 2, '2021-09-04');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (90, '2021-05-01', 'Consulta m�dica general del empleado 90');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (90, 4);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado91', 'Apellido91', '2021-04-02', 6, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (91, '5550000911');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (91, '5550000912');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (91, '2021-06-18', '2021-06-22', 'Motivo permiso 1 empleado 91');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (91, '2021-06-05', '2021-06-15', 'Motivo permiso 2 empleado 91');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (91, '2021-06-12', 'Incidencia para empleado 91', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (91, 2, '2021-10-12');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (91, 3, '2021-09-11');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (91, 1, '2021-08-15');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (91, '2021-05-02', 'Consulta m�dica general del empleado 91');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado92', 'Apellido92', '2021-04-03', 5, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (92, '5550000921');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (92, '5550000922');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (92, '2021-05-16', '2021-05-26', 'Motivo permiso 1 empleado 92');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (92, '2021-07-11', '2021-07-17', 'Motivo permiso 2 empleado 92');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (92, '2021-07-29', 'Incidencia para empleado 92', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (92, 1, '2021-06-09');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (92, 2, '2021-09-27');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (92, 2, '2021-10-18');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (92, '2021-05-03', 'Consulta m�dica general del empleado 92');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado93', 'Apellido93', '2021-04-04', 1, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (93, '5550000931');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (93, '5550000932');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (93, '2021-05-27', '2021-05-31', 'Motivo permiso 1 empleado 93');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (93, '2021-04-29', '2021-05-09', 'Motivo permiso 2 empleado 93');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (93, '2021-05-20', 'Incidencia para empleado 93', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (93, 2, '2021-06-09');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (93, 1, '2021-08-01');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (93, 3, '2021-10-05');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (93, '2021-05-04', 'Consulta m�dica general del empleado 93');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado94', 'Apellido94', '2021-04-05', 2, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (94, '5550000941');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (94, '5550000942');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (94, '2021-07-02', '2021-07-10', 'Motivo permiso 1 empleado 94');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (94, '2021-05-26', '2021-05-31', 'Motivo permiso 2 empleado 94');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (94, '2021-06-07', 'Incidencia para empleado 94', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (94, 1, '2021-05-06');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (94, 1, '2021-07-22');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (94, 2, '2021-05-06');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (94, '2021-05-05', 'Consulta m�dica general del empleado 94');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado95', 'Apellido95', '2021-04-06', 2, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (95, '5550000951');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (95, '5550000952');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (95, '2021-04-30', '2021-05-02', 'Motivo permiso 1 empleado 95');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (95, '2021-05-14', '2021-05-22', 'Motivo permiso 2 empleado 95');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (95, '2021-09-04', 'Incidencia para empleado 95', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (95, 2, '2021-08-30');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (95, 2, '2021-04-20');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (95, 2, '2021-06-07');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (95, '2021-05-06', 'Consulta m�dica general del empleado 95');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (95, 3);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado96', 'Apellido96', '2021-04-07', 3, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (96, '5550000961');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (96, '5550000962');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (96, '2021-06-25', '2021-07-02', 'Motivo permiso 1 empleado 96');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (96, '2021-04-30', '2021-05-08', 'Motivo permiso 2 empleado 96');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (96, '2021-08-14', 'Incidencia para empleado 96', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (96, 3, '2021-08-17');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (96, 2, '2021-05-23');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (96, 3, '2021-07-28');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (96, '2021-05-07', 'Consulta m�dica general del empleado 96');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado97', 'Apellido97', '2021-04-08', 5, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (97, '5550000971');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (97, '5550000972');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (97, '2021-06-16', '2021-06-17', 'Motivo permiso 1 empleado 97');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (97, '2021-04-10', '2021-04-17', 'Motivo permiso 2 empleado 97');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (97, '2021-10-18', 'Incidencia para empleado 97', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (97, 1, '2021-05-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (97, 1, '2021-09-03');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (97, 2, '2021-07-06');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (97, '2021-05-08', 'Consulta m�dica general del empleado 97');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado98', 'Apellido98', '2021-04-09', 7, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (98, '5550000981');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (98, '5550000982');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (98, '2021-05-16', '2021-05-20', 'Motivo permiso 1 empleado 98');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (98, '2021-05-20', '2021-05-23', 'Motivo permiso 2 empleado 98');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (98, '2021-10-10', 'Incidencia para empleado 98', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (98, 3, '2021-10-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (98, 1, '2021-07-03');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (98, 2, '2021-05-15');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (98, '2021-05-09', 'Consulta m�dica general del empleado 98');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado99', 'Apellido99', '2021-04-10', 2, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (99, '5550000991');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (99, '5550000992');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (99, '2021-05-03', '2021-05-07', 'Motivo permiso 1 empleado 99');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (99, '2021-05-02', '2021-05-11', 'Motivo permiso 2 empleado 99');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (99, '2021-06-17', 'Incidencia para empleado 99', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (99, 1, '2021-06-06');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (99, 3, '2021-04-13');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (99, 3, '2021-05-20');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (99, '2021-05-10', 'Consulta m�dica general del empleado 99');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (99, 1);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado100', 'Apellido100', '2021-04-11', 5, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (100, '5550001001');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (100, '5550001002');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (100, '2021-06-24', '2021-06-28', 'Motivo permiso 1 empleado 100');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (100, '2021-07-16', '2021-07-19', 'Motivo permiso 2 empleado 100');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (100, '2021-06-13', 'Incidencia para empleado 100', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (100, 1, '2021-07-08');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (100, 2, '2021-06-12');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (100, 1, '2021-04-17');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (100, '2021-05-11', 'Consulta m�dica general del empleado 100');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado101', 'Apellido101', '2021-04-12', 8, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (101, '5550001011');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (101, '5550001012');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (101, '2021-07-04', '2021-07-10', 'Motivo permiso 1 empleado 101');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (101, '2021-07-17', '2021-07-22', 'Motivo permiso 2 empleado 101');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (101, '2021-08-17', 'Incidencia para empleado 101', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (101, 2, '2021-06-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (101, 1, '2021-09-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (101, 1, '2021-06-08');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (101, '2021-05-12', 'Consulta m�dica general del empleado 101');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado102', 'Apellido102', '2021-04-13', 5, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (102, '5550001021');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (102, '5550001022');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (102, '2021-07-02', '2021-07-03', 'Motivo permiso 1 empleado 102');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (102, '2021-04-21', '2021-04-24', 'Motivo permiso 2 empleado 102');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (102, '2021-07-13', 'Incidencia para empleado 102', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (102, 3, '2021-09-07');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (102, 3, '2021-08-28');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (102, 1, '2021-06-04');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (102, '2021-05-13', 'Consulta m�dica general del empleado 102');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado103', 'Apellido103', '2021-04-14', 1, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (103, '5550001031');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (103, '5550001032');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (103, '2021-06-29', '2021-07-03', 'Motivo permiso 1 empleado 103');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (103, '2021-06-06', '2021-06-14', 'Motivo permiso 2 empleado 103');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (103, '2021-07-02', 'Incidencia para empleado 103', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (103, 1, '2021-06-08');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (103, 1, '2021-05-11');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (103, 1, '2021-08-16');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (103, '2021-05-14', 'Consulta m�dica general del empleado 103');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado104', 'Apellido104', '2021-04-15', 6, 2);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (104, '5550001041');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (104, '5550001042');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (104, '2021-05-19', '2021-05-25', 'Motivo permiso 1 empleado 104');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (104, '2021-04-19', '2021-04-22', 'Motivo permiso 2 empleado 104');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (104, '2021-08-30', 'Incidencia para empleado 104', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (104, 1, '2021-05-12');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (104, 1, '2021-10-08');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (104, 2, '2021-06-04');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (104, '2021-05-15', 'Consulta m�dica general del empleado 104');
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad) VALUES (104, 4);
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado105', 'Apellido105', '2021-04-16', 8, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (105, '5550001051');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (105, '5550001052');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (105, '2021-05-02', '2021-05-10', 'Motivo permiso 1 empleado 105');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (105, '2021-06-28', '2021-07-06', 'Motivo permiso 2 empleado 105');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (105, '2021-10-04', 'Incidencia para empleado 105', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (105, 3, '2021-10-25');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (105, 3, '2021-05-23');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (105, 3, '2021-06-27');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (105, '2021-05-16', 'Consulta m�dica general del empleado 105');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado106', 'Apellido106', '2021-04-17', 6, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (106, '5550001061');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (106, '5550001062');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (106, '2021-06-01', '2021-06-11', 'Motivo permiso 1 empleado 106');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (106, '2021-06-04', '2021-06-11', 'Motivo permiso 2 empleado 106');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (106, '2021-06-17', 'Incidencia para empleado 106', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (106, 1, '2021-09-10');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (106, 1, '2021-06-10');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (106, 2, '2021-08-23');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (106, '2021-05-17', 'Consulta m�dica general del empleado 106');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado107', 'Apellido107', '2021-04-18', 9, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (107, '5550001071');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (107, '5550001072');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (107, '2021-06-03', '2021-06-12', 'Motivo permiso 1 empleado 107');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (107, '2021-05-24', '2021-05-31', 'Motivo permiso 2 empleado 107');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (107, '2021-04-29', 'Incidencia para empleado 107', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (107, 1, '2021-08-14');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (107, 3, '2021-06-11');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (107, 2, '2021-09-25');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (107, '2021-05-18', 'Consulta m�dica general del empleado 107');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado108', 'Apellido108', '2021-04-19', 12, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (108, '5550001081');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (108, '5550001082');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (108, '2021-05-14', '2021-05-16', 'Motivo permiso 1 empleado 108');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (108, '2021-07-24', '2021-07-28', 'Motivo permiso 2 empleado 108');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (108, '2021-05-25', 'Incidencia para empleado 108', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (108, 3, '2021-07-18');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (108, 2, '2021-09-30');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (108, 3, '2021-06-24');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (108, '2021-05-19', 'Consulta m�dica general del empleado 108');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado109', 'Apellido109', '2021-04-20', 5, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (109, '5550001091');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (109, '5550001092');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (109, '2021-06-08', '2021-06-10', 'Motivo permiso 1 empleado 109');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (109, '2021-07-01', '2021-07-03', 'Motivo permiso 2 empleado 109');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (109, '2021-05-21', 'Incidencia para empleado 109', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (109, 2, '2021-06-23');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (109, 3, '2021-07-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (109, 2, '2021-07-02');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (109, '2021-05-20', 'Consulta m�dica general del empleado 109');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado110', 'Apellido110', '2021-04-21', 1, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (110, '5550001101');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (110, '5550001102');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (110, '2021-05-12', '2021-05-21', 'Motivo permiso 1 empleado 110');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (110, '2021-06-08', '2021-06-18', 'Motivo permiso 2 empleado 110');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (110, '2021-10-15', 'Incidencia para empleado 110', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (110, 3, '2021-07-03');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (110, 2, '2021-05-24');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (110, 3, '2021-08-29');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (110, '2021-05-21', 'Consulta m�dica general del empleado 110');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado111', 'Apellido111', '2021-04-22', 11, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (111, '5550001111');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (111, '5550001112');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (111, '2021-06-06', '2021-06-08', 'Motivo permiso 1 empleado 111');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (111, '2021-07-25', '2021-07-31', 'Motivo permiso 2 empleado 111');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (111, '2021-06-09', 'Incidencia para empleado 111', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (111, 3, '2021-09-17');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (111, 3, '2021-08-30');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (111, 3, '2021-07-21');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (111, '2021-05-22', 'Consulta m�dica general del empleado 111');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado112', 'Apellido112', '2021-04-23', 7, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (112, '5550001121');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (112, '5550001122');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (112, '2021-06-05', '2021-06-09', 'Motivo permiso 1 empleado 112');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (112, '2021-05-08', '2021-05-13', 'Motivo permiso 2 empleado 112');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (112, '2021-09-08', 'Incidencia para empleado 112', 1);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (112, 2, '2021-05-15');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (112, 3, '2021-09-20');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (112, 3, '2021-08-23');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (112, '2021-05-23', 'Consulta m�dica general del empleado 112');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado113', 'Apellido113', '2021-04-24', 8, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (113, '5550001131');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (113, '5550001132');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (113, '2021-05-28', '2021-06-01', 'Motivo permiso 1 empleado 113');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (113, '2021-07-02', '2021-07-08', 'Motivo permiso 2 empleado 113');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (113, '2021-11-05', 'Incidencia para empleado 113', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (113, 1, '2021-10-16');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (113, 3, '2021-09-25');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (113, 3, '2021-10-23');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (113, '2021-05-24', 'Consulta m�dica general del empleado 113');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado114', 'Apellido114', '2021-04-25', 8, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (114, '5550001141');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (114, '5550001142');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (114, '2021-05-21', '2021-05-28', 'Motivo permiso 1 empleado 114');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (114, '2021-06-07', '2021-06-12', 'Motivo permiso 2 empleado 114');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (114, '2021-05-15', 'Incidencia para empleado 114', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (114, 3, '2021-05-10');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (114, 3, '2021-11-08');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (114, 1, '2021-06-14');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (114, '2021-05-25', 'Consulta m�dica general del empleado 114');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado115', 'Apellido115', '2021-04-26', 1, 4);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (115, '5550001151');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (115, '5550001152');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (115, '2021-08-01', '2021-08-09', 'Motivo permiso 1 empleado 115');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (115, '2021-05-20', '2021-05-21', 'Motivo permiso 2 empleado 115');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (115, '2021-11-09', 'Incidencia para empleado 115', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (115, 1, '2021-06-11');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (115, 1, '2021-09-18');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (115, 3, '2021-07-26');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (115, '2021-05-26', 'Consulta m�dica general del empleado 115');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado116', 'Apellido116', '2021-04-27', 11, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (116, '5550001161');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (116, '5550001162');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (116, '2021-06-01', '2021-06-03', 'Motivo permiso 1 empleado 116');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (116, '2021-06-23', '2021-07-03', 'Motivo permiso 2 empleado 116');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (116, '2021-06-08', 'Incidencia para empleado 116', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (116, 2, '2021-09-05');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (116, 3, '2021-06-24');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (116, 3, '2021-06-17');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (116, '2021-05-27', 'Consulta m�dica general del empleado 116');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado117', 'Apellido117', '2021-04-28', 4, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (117, '5550001171');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (117, '5550001172');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (117, '2021-07-16', '2021-07-17', 'Motivo permiso 1 empleado 117');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (117, '2021-06-14', '2021-06-17', 'Motivo permiso 2 empleado 117');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (117, '2021-10-25', 'Incidencia para empleado 117', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (117, 2, '2021-10-18');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (117, 1, '2021-08-18');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (117, 1, '2021-09-29');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (117, '2021-05-28', 'Consulta m�dica general del empleado 117');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado118', 'Apellido118', '2021-04-29', 6, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (118, '5550001181');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (118, '5550001182');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (118, '2021-05-19', '2021-05-26', 'Motivo permiso 1 empleado 118');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (118, '2021-06-02', '2021-06-12', 'Motivo permiso 2 empleado 118');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (118, '2021-08-17', 'Incidencia para empleado 118', 2);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (118, 3, '2021-05-25');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (118, 3, '2021-06-16');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (118, 1, '2021-08-26');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (118, '2021-05-29', 'Consulta m�dica general del empleado 118');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado119', 'Apellido119', '2021-04-30', 1, 3);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (119, '5550001191');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (119, '5550001192');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (119, '2021-06-25', '2021-06-27', 'Motivo permiso 1 empleado 119');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (119, '2021-06-20', '2021-06-21', 'Motivo permiso 2 empleado 119');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (119, '2021-10-16', 'Incidencia para empleado 119', 4);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (119, 2, '2021-11-16');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (119, 3, '2021-09-09');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (119, 3, '2021-07-22');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (119, '2021-05-30', 'Consulta m�dica general del empleado 119');
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol) VALUES ('Empleado120', 'Apellido120', '2021-05-01', 7, 1);
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (120, '5550001201');
INSERT INTO Telefono_Empleado (id_empleado, numero) VALUES (120, '5550001202');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (120, '2021-06-02', '2021-06-07', 'Motivo permiso 1 empleado 120');
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo) VALUES (120, '2021-05-18', '2021-05-27', 'Motivo permiso 2 empleado 120');
INSERT INTO Incidencia (id_empleado, fecha, descripcion, severidad) VALUES (120, '2021-07-08', 'Incidencia para empleado 120', 3);
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (120, 2, '2021-07-30');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (120, 3, '2021-09-29');
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion) VALUES (120, 2, '2021-10-25');
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico) VALUES (120, '2021-05-31', 'Consulta m�dica general del empleado 120');
