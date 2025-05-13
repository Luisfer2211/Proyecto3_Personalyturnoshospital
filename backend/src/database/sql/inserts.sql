-- inserts.sql
-------------------------------------------
-- Tablas maestras (valores fijos)
-------------------------------------------

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

-------------------------------------------
-- Empleados (120 registros)
-------------------------------------------
INSERT INTO Empleado (nombre, apellido, fecha_ingreso, id_departamento, id_rol)
SELECT 
  nombres[n],
  apellidos[a],
  CURRENT_DATE - INTERVAL '1 year' * RANDOM() * 5,
  (random() * 11 + 1)::int,
  (random() * 7 + 1)::int
FROM 
  generate_series(1,120) AS id,
  (SELECT ARRAY['Juan','María','Carlos','Ana','Luis','Laura','Pedro','Sofía','Andrés','Carmen']) AS nombres(nombres),
  (SELECT ARRAY['Gómez','López','Martínez','García','Rodríguez','Fernández','Pérez','Sánchez','Ramírez','Torres']) AS apellidos(apellidos),
  generate_series(1,12) AS n,
  generate_series(1,10) AS a;

-------------------------------------------
-- Teléfonos (2 por empleado = 240 registros)
-------------------------------------------
INSERT INTO Telefono_Empleado (id_empleado, numero)
SELECT 
  id_empleado,
  CONCAT('+5025', FLOOR(RANDOM() * 9000000 + 1000000)::TEXT
FROM generate_series(1,120) AS id_empleado
CROSS JOIN generate_series(1,2);

-------------------------------------------
-- Asignación de Especialidades (3 por médico = 60 registros)
-------------------------------------------
INSERT INTO Empleado_Especialidad (id_empleado, id_especialidad)
SELECT 
  e.id_empleado,
  (random() * 9 + 1)::int
FROM Empleado e
WHERE e.id_rol = 1  -- Solo médicos
CROSS JOIN generate_series(1,3);

-------------------------------------------
-- Permisos (2 por empleado = 240 registros)
-------------------------------------------
INSERT INTO Permiso (id_empleado, fecha_inicio, fecha_fin, motivo)
SELECT
  id_empleado,
  CURRENT_DATE - INTERVAL '1 month' * RANDOM() * 6,
  CURRENT_DATE - INTERVAL '1 month' * RANDOM() * 6 + INTERVAL '1 week',
  (ARRAY['Vacaciones','Enfermedad','Permiso personal','Capacitación'])[FLOOR(RANDOM()*4+1)]
FROM generate_series(1,120) AS id_empleado
CROSS JOIN generate_series(1,2);

-------------------------------------------
-- Incidencias (200 registros)
-------------------------------------------
INSERT INTO Incidencia (id_empleado, descripcion, fecha, severidad)
SELECT
  (random() * 119 + 1)::int,
  (ARRAY['Retraso','Falta injustificada','Error médico','Equipo dañado'])[FLOOR(RANDOM()*4+1)],
  CURRENT_DATE - INTERVAL '1 month' * RANDOM() * 12,
  (random() * 4 + 1)::int
FROM generate_series(1,200);

-------------------------------------------
-- Horarios (3 por empleado = 360 registros)
-------------------------------------------
INSERT INTO Horario (id_empleado, id_turno, fecha_asignacion)
SELECT
  id_empleado,
  (random() * 2 + 1)::int,
  CURRENT_DATE - INTERVAL '1 week' * RANDOM() * 52
FROM generate_series(1,120) AS id_empleado
CROSS JOIN generate_series(1,3);

-------------------------------------------
-- Historial Médico (1 por empleado = 120 registros)
-------------------------------------------
INSERT INTO Historial_Medico (id_empleado, fecha_consulta, diagnostico)
SELECT
  id_empleado,
  CURRENT_DATE - INTERVAL '1 month' * RANDOM() * 12,
  (ARRAY['Saludable','Hipertensión','Diabetes','Alergia a penicilina'])[FLOOR(RANDOM()*4+1)]
FROM generate_series(1,120) AS id_empleado;