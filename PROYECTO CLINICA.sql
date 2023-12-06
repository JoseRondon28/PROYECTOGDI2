CREATE DATABASE Clinica;
GO

USE Clinica;
GO

-- Creación de la tabla Especialidad
CREATE TABLE Especialidad (
    ID_Especialidad INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(150) NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL
);
GO

-- Creación de la tabla Medico
CREATE TABLE Medico (
    ID_Medico INT PRIMARY KEY IDENTITY(1,1),
    Nombres NVARCHAR(100) NOT NULL,
    Apellidos NVARCHAR(100) NOT NULL,
    ID_Especialidad INT NOT NULL,
    FOREIGN KEY (ID_Especialidad) REFERENCES Especialidad(ID_Especialidad),
    ID_Usuario INT DEFAULT 0 NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL
);
GO

-- Tabla Paciente
CREATE TABLE Paciente (
    ID_Paciente INT IDENTITY(1,1) PRIMARY KEY,
    Nombres NVARCHAR(100) NOT NULL,
    Apellidos NVARCHAR(100) NOT NULL,
    Peso FLOAT NOT NULL,
    Altura FLOAT NOT NULL,
    Edad INT NOT NULL,
    Telefono NVARCHAR(9) NOT NULL,
    Alergias NVARCHAR(200) NOT NULL,
    Enfermedades NVARCHAR(200) NOT NULL,
    Tipo_Sangre NVARCHAR(5) NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL
);

-- Tabla Cita
CREATE TABLE Cita (
    ID_Cita INT IDENTITY(1,1) PRIMARY KEY,
    Fecha_Cita DATE NOT NULL,
    Hora_Cita NVARCHAR(15) NOT NULL,
    Dia_Cita NVARCHAR(15) NOT NULL,
    Semana_Cita INT NOT NULL,
    ID_Medico INT NOT NULL,
    ID_Paciente INT NOT NULL,
    Estado NVARCHAR(15) NOT NULL,
    FOREIGN KEY (ID_Medico) REFERENCES Medico(ID_Medico),
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    ID_Servicio INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Servicio NVARCHAR(50) NOT NULL,
    Descripcion_Servicio NVARCHAR(150) NOT NULL,
    Precio_Servicio DECIMAL(20, 2) NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL
);

-- Tabla Usuario
CREATE TABLE Usuario (
    ID_Usuario INT IDENTITY(1,1) PRIMARY KEY,
    Nombre_Usuario NVARCHAR(50) NOT NULL,
    Contrasena_Usuario NVARCHAR(100) NOT NULL,
    Rol_Usuario NVARCHAR(20) NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL
);

-- Tabla Consulta
CREATE TABLE Consulta (
    ID_Consulta INT IDENTITY(1,1) PRIMARY KEY,
    ID_Cita INT NOT NULL,
    Descripcion_Consulta NVARCHAR(200) NOT NULL,
    Diagnostico NVARCHAR(200) NOT NULL,
    Receta NVARCHAR(500) NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL,
    FOREIGN KEY (ID_Cita) REFERENCES Cita(ID_Cita)
);

-- Tabla Pago
CREATE TABLE Pago (
    ID_Pago INT IDENTITY(1,1) PRIMARY KEY,
    Fecha_Pago DATETIME DEFAULT GETDATE() NOT NULL,
    ID_Paciente INT NOT NULL,
    ID_Usuario INT NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL,
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

-- Tabla Detalle_Pago
CREATE TABLE Detalle_Pago (
    ID_Detalle_Pago INT IDENTITY(1,1) PRIMARY KEY,
    ID_Pago INT NOT NULL,
    ID_Servicio INT NOT NULL,
    Cantidad INT NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL,
    FOREIGN KEY (ID_Pago) REFERENCES Pago(ID_Pago),
    FOREIGN KEY (ID_Servicio) REFERENCES Servicio(ID_Servicio)
);

-- Tabla Dia_Medico
CREATE TABLE Dia_Medico (
    ID_Dia_Medico INT IDENTITY(1,1) PRIMARY KEY,
    ID_Medico INT NOT NULL,
    Dia NVARCHAR(1) NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL,
    FOREIGN KEY (ID_Medico) REFERENCES Medico(ID_Medico)
);

-- Tabla Hora_Medico
CREATE TABLE Hora_Medico (
    ID_Hora_Medico INT IDENTITY(1,1) PRIMARY KEY,
    ID_Dia_Medico INT NOT NULL,
    Hora_Inicial NVARCHAR(15) NOT NULL,
    Hora_Final NVARCHAR(15) NOT NULL,
    Estado BIT DEFAULT 1 NOT NULL,
    FOREIGN KEY (ID_Dia_Medico) REFERENCES Dia_Medico(ID_Dia_Medico)
);