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

CREATE TABLE Conflictos_Horario (
    id_conflicto SERIAL PRIMARY KEY,
    id_empleado INT,
    fecha_conflicto DATE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mensaje TEXT
);

CREATE OR REPLACE FUNCTION registrar_conflicto_horario()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Horario 
        WHERE id_empleado = NEW.id_empleado 
        AND fecha_asignacion = NEW.fecha_asignacion
    ) THEN
        INSERT INTO Conflictos_Horario (id_empleado, fecha_conflicto, mensaje)
        VALUES (NEW.id_empleado, NEW.fecha_asignacion, 'Empleado con turno duplicado en misma fecha');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS tr_validar_turnos ON Horario;

CREATE TRIGGER tr_registrar_conflicto
BEFORE INSERT OR UPDATE ON Horario
FOR EACH ROW EXECUTE FUNCTION registrar_conflicto_horario();


-- Columna derivada (primero debemos agregarla)
ALTER TABLE Empleado ADD COLUMN antiguedad INTEGER;

-- Trigger Function
CREATE OR REPLACE FUNCTION actualizar_antiguedad()
RETURNS TRIGGER AS $$
BEGIN
    NEW.antiguedad := EXTRACT(YEAR FROM AGE(NEW.fecha_ingreso));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER tr_actualizar_antiguedad
BEFORE INSERT OR UPDATE OF fecha_ingreso ON Empleado
FOR EACH ROW EXECUTE FUNCTION actualizar_antiguedad();


-- Tabla de auditoría
CREATE TABLE Auditoria_Historial (
    id_auditoria SERIAL PRIMARY KEY,
    id_historial INT,
    accion VARCHAR(10),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    diagnostico_anterior TEXT,
    diagnostico_nuevo TEXT
);

-- Trigger Function
CREATE OR REPLACE FUNCTION auditoria_historial_medico()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        INSERT INTO Auditoria_Historial (
            id_historial, 
            accion, 
            diagnostico_anterior, 
            diagnostico_nuevo
        ) VALUES (
            OLD.id_historial,
            'UPDATE',
            OLD.diagnostico,
            NEW.diagnostico
        );
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO Auditoria_Historial (
            id_historial, 
            accion, 
            diagnostico_anterior
        ) VALUES (
            OLD.id_historial,
            'DELETE',
            OLD.diagnostico
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER tr_auditoria_historial
AFTER UPDATE OR DELETE ON Historial_Medico
FOR EACH ROW EXECUTE FUNCTION auditoria_historial_medico();