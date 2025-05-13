-- Eliminar tablas si existen (para pruebas)
DROP TABLE IF EXISTS Empleado_Especialidad CASCADE;
DROP TABLE IF EXISTS Asignacion_Turno CASCADE;
DROP TABLE IF EXISTS Telefono_Empleado CASCADE;
DROP TABLE IF EXISTS Historial_Medico CASCADE;
DROP TABLE IF EXISTS Horario CASCADE;
DROP TABLE IF EXISTS Incidencia CASCADE;
DROP TABLE IF EXISTS Permiso CASCADE;
DROP TABLE IF EXISTS Empleado CASCADE;
DROP TABLE IF EXISTS Departamento CASCADE;
DROP TABLE IF EXISTS Turno CASCADE;
DROP TABLE IF EXISTS Rol CASCADE;
DROP TABLE IF EXISTS Especialidad CASCADE;

-- Tablas principales
CREATE TABLE Departamento (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    responsable VARCHAR(100) NOT NULL
);

CREATE TABLE Rol (
    id_rol SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_ingreso DATE NOT NULL DEFAULT CURRENT_DATE,
    id_departamento INT NOT NULL REFERENCES Departamento(id_departamento),
    id_rol INT NOT NULL REFERENCES Rol(id_rol)
);

CREATE TABLE Turno (
    id_turno SERIAL PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('matutino', 'vespertino', 'nocturno')),
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL
);

CREATE TABLE Especialidad (
    id_especialidad SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Tablas relacionadas 1:N
CREATE TABLE Permiso (
    id_permiso SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL REFERENCES Empleado(id_empleado),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL CHECK (fecha_fin >= fecha_inicio),
    motivo TEXT NOT NULL
);

CREATE TABLE Incidencia (
    id_incidencia SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL REFERENCES Empleado(id_empleado),
    descripcion TEXT NOT NULL,
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    severidad INT NOT NULL CHECK (severidad BETWEEN 1 AND 5)
);

CREATE TABLE Historial_Medico (
    id_historial SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL REFERENCES Empleado(id_empleado),
    fecha_consulta DATE NOT NULL DEFAULT CURRENT_DATE,
    diagnostico TEXT NOT NULL
);

-- Tabla para atributo multivaluado
CREATE TABLE Telefono_Empleado (
    id_telefono SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL REFERENCES Empleado(id_empleado),
    numero VARCHAR(15) NOT NULL UNIQUE CHECK (numero ~ '^\+?[0-9]{8,15}$')
);

-- Tablas de cruce N:M
CREATE TABLE Empleado_Especialidad (
    id_empleado INT REFERENCES Empleado(id_empleado),
    id_especialidad INT REFERENCES Especialidad(id_especialidad),
    PRIMARY KEY (id_empleado, id_especialidad)
);

CREATE TABLE Asignacion_Turno (
    id_asignacion SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL REFERENCES Empleado(id_empleado),
    id_turno INT NOT NULL REFERENCES Turno(id_turno),
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    UNIQUE (id_empleado, id_turno, fecha)
);

-- Tabla auxiliar para horarios (relación 1:N con Turno)
CREATE TABLE Horario (
    id_horario SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL REFERENCES Empleado(id_empleado),
    id_turno INT NOT NULL REFERENCES Turno(id_turno),
    fecha_asignacion DATE NOT NULL DEFAULT CURRENT_DATE
);