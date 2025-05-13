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


