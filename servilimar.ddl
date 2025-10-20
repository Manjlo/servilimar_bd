CREATE TABLE Ciudad (
    ciudad_id SERIAL PRIMARY KEY,
    nombre_ciudad VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10)
);

CREATE TABLE Condicion (
    condicion_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Tipo_Usuario (
    tipo_usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Usuario (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    tipo_usuario_id INT REFERENCES Tipo_Usuario(tipo_usuario_id),
    ciudad_id INT REFERENCES Ciudad(ciudad_id)
);

-- Relación muchos a muchos entre Usuario y Condicion
CREATE TABLE Usuario_Condicion (
    usuario_id INT REFERENCES Usuario(usuario_id),
    condicion_id INT REFERENCES Condicion(condicion_id),
    PRIMARY KEY (usuario_id, condicion_id)
);

CREATE TABLE Servicio (
    servicio_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    estado VARCHAR(20)
);

CREATE TABLE Empleado (
    empleado_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuario(usuario_id),
    cargo VARCHAR(100),
    departamento VARCHAR(100)
);

CREATE TABLE Turno (
    turno_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuario(usuario_id),
    servicio_id INT REFERENCES Servicio(servicio_id),
    empleado_id INT REFERENCES Empleado(empleado_id),
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME,
    estado VARCHAR(20),
    nombre_servicio VARCHAR(100)
);

CREATE TABLE Medio_Notificacion (
    medio_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Notificacion (
    notificacion_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuario(usuario_id),
    medio_id INT REFERENCES Medio_Notificacion(medio_id),
    mensaje TEXT NOT NULL,
    fecha_envio TIMESTAMP DEFAULT NOW(),
    estado VARCHAR(20)
);
