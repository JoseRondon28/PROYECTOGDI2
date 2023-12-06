Create database Diccionario_Datos

go

use Diccionario_Datos;

-- Crear tabla PERSONA
CREATE TABLE PERSONA (
    idPersona INT PRIMARY KEY,
    DNI VARCHAR(20) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    Sexo CHAR(1) NOT NULL
);

-- Crear tabla PACIENTE
CREATE TABLE PACIENTE (
    idPaciente INT PRIMARY KEY,
    IdPersona INT NOT NULL,
    CodigoPaciente VARCHAR(20) NOT NULL,
    direccionSede VARCHAR(100) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    direccionActual VARCHAR(100) NOT NULL,
    FOREIGN KEY (IdPersona) REFERENCES PERSONA(idPersona)
);

-- Crear tabla EMPLEADO
CREATE TABLE EMPLEADO (
    IDEmpleado INT PRIMARY KEY,
    idPersona INT,
    CodigoEmpleado VARCHAR(20) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    Servicio VARCHAR(50) NOT NULL,
    FOREIGN KEY (idPersona) REFERENCES PERSONA(idPersona)
);

-- Crear tabla SEDE
CREATE TABLE SEDE (
    IDsede INT PRIMARY KEY,
    CodigoSede VARCHAR(20) NOT NULL,
    nombreSede VARCHAR(100) NOT NULL,
    direccionSede VARCHAR(100) NOT NULL,
    Provincia VARCHAR(50),
    Departamento VARCHAR(50),
    Distrito VARCHAR(50)
);

-- Crear tabla MEDICAMENTOS
CREATE TABLE MEDICAMENTOS (
    idMedicamento INT PRIMARY KEY,
    CodigoMedicamento VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    p_compra FLOAT,
    p_venta FLOAT
);

-- Crear tabla DETALLE_ATENCION
CREATE TABLE DETALLE_ATENCION (
    idDetallAtencion INT PRIMARY KEY,
    idAtencion INT,
    horaAtencion TIME,
    fechaAtencion DATE,
    observaciones VARCHAR(200),
    idConsultorio INT,
    tipoAtencion VARCHAR(50),
    idCita INT,
    idOrdenEmergencia INT,
    idReceta INT,
    FOREIGN KEY (idAtencion) REFERENCES ORDEN_CITA(idCita),
    FOREIGN KEY (idConsultorio) REFERENCES CONSULTORIO(idconsultorio),
    FOREIGN KEY (idCita) REFERENCES ORDEN_CITA(idCita),
    FOREIGN KEY (idOrdenEmergencia) REFERENCES ORDEN_EMERGENCIA(idOrdenEmergencia),
    FOREIGN KEY (idReceta) REFERENCES RECETA(idReceta)
);

-- Crear tabla ORDEN_CITA
CREATE TABLE ORDEN_CITA (
    idCita INT PRIMARY KEY,
    NroRegistro VARCHAR(20) NOT NULL,
    idPaciente INT NOT NULL,
    idMedico INT NOT NULL,
    idEspecialidad INT NOT NULL,
    idSede INT NOT NULL,
    idUsuario INT NOT NULL,
    fechaRegistro DATE,
    FechaCita DATE,
    HoraCita TIME,
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente),
    FOREIGN KEY (idMedico) REFERENCES EMPLEADO(IDEmpleado),
    FOREIGN KEY (idEspecialidad) REFERENCES ESPECIALIDAD(idEspecialidad),
    FOREIGN KEY (idSede) REFERENCES SEDE(IDsede),
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(isUsuario)
);

-- Crear tabla ESPECIALIDAD
CREATE TABLE ESPECIALIDAD (
    idEspecialidad INT PRIMARY KEY,
    CodigoEspecialidad VARCHAR(20) NOT NULL,
    Descripcion VARCHAR(100),
    precio FLOAT
);

-- Crear tabla CONSULTORIO
CREATE TABLE CONSULTORIO (
    idconsultorio INT PRIMARY KEY,
    CodigoConsultorio VARCHAR(20) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL
);

-- Crear tabla ORDEN_EMERGENCIA
CREATE TABLE ORDEN_EMERGENCIA (
    idOrdenEmergencia INT PRIMARY KEY,
    NroRegistroEmergencia VARCHAR(20) NOT NULL,
    idPaciente INT NOT NULL,
    idMedico INT NOT NULL,
    idEspecialidad INT NOT NULL,
    idSede INT NOT NULL,
    idUsuario INT NOT NULL,
    fechaIngreso DATE,
    HoraIngreso TIME,
    FechaRegistro DATE,
    Estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente),
    FOREIGN KEY (idMedico) REFERENCES EMPLEADO(IDEmpleado),
    FOREIGN KEY (idEspecialidad) REFERENCES ESPECIALIDAD(idEspecialidad),
    FOREIGN KEY (idSede) REFERENCES SEDE(IDsede),
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(isUsuario)
);

-- Crear tabla ORDEN_ATENCION
CREATE TABLE ORDEN_ATENCION (
    idAtencion INT PRIMARY KEY,
    codigoAtencion VARCHAR(20),
    estado VARCHAR(20)
);

-- Crear tabla USUARIO
CREATE TABLE USUARIO (
    isUsuario INT PRIMARY KEY,
    CodigoUsuario VARCHAR(20),
    idempleado INT,
    usuario VARCHAR(50),
    clave VARCHAR(50),
    estado VARCHAR(20),
    FOREIGN KEY (idempleado) REFERENCES EMPLEADO(IDEmpleado)
);

-- Crear tabla BOLETA
CREATE TABLE BOLETA (
    idcomprobante INT PRIMARY KEY,
    codigoBoleta VARCHAR(20)
);

-- Crear tabla COMPROBANTE_PAGO
CREATE TABLE COMPROBANTE_PAGO (
    idcomprobante INT PRIMARY KEY,
    codigoPago VARCHAR(20) NOT NULL,
    fechaRegistro DATE,
    horaRegistro TIME,
    montoTotal DECIMAL(10, 2),
    Forma_pago VARCHAR(50),
    idpersona INT,
    tipoAtencion INT,
    idusuario INT,
    idAtencion INT,
    FOREIGN KEY (idcomprobante) REFERENCES BOLETA(idcomprobante),
    FOREIGN KEY (idpersona) REFERENCES PERSONA(idPersona),
    FOREIGN KEY (idusuario) REFERENCES USUARIO(isUsuario),
    FOREIGN KEY (idAtencion) REFERENCES ORDEN_CITA(idCita)
);

-- Crear tabla DETALLE_HISTORIAL
CREATE TABLE DETALLE_HISTORIAL (
    idHistorial INT PRIMARY KEY,
    fechaRegistro DATE,
    observacion VARCHAR(200),
    peso DECIMAL(10, 2),
    talla DECIMAL(10, 2),
    diagnostico VARCHAR(200),
    idAtencion INT,
    FOREIGN KEY (idAtencion) REFERENCES ORDEN_CITA(idCita)
);

-- Crear tabla DETALLE_RECETA
CREATE TABLE DETALLE_RECETA (
    idDetalleReceta INT PRIMARY KEY,
    idReceta INT NOT NULL,
    idMedicamento INT NOT NULL,
    tipoPresentacion VARCHAR(50),
    Cantidad INT NOT NULL,
    observacion VARCHAR(200),
    FOREIGN KEY (idReceta) REFERENCES RECETA(idReceta),
    FOREIGN KEY (idMedicamento) REFERENCES MEDICAMENTOS(idMedicamento)
);

-- Crear tabla FACTURA
CREATE TABLE FACTURA (
    idcomprobante INT PRIMARY KEY,
    codigofactura VARCHAR(20),
    RUC VARCHAR(20),
    RAZONSOCIAL VARCHAR(100),
    DIRECCION VARCHAR(100)
);

-- Crear tabla HISTORIAL
CREATE TABLE HISTORIAL (
    idhistorial INT PRIMARY KEY,
    nro_historial VARCHAR(20),
    idpaciente INT,
    FOREIGN KEY (idpaciente) REFERENCES PACIENTE(idPaciente)
);

-- Crear tabla RECETA
CREATE TABLE RECETA (
    idReceta INT PRIMARY KEY,
    codigoReceta VARCHAR(20),
    idPaciente INT,
    fechaRegistro DATE,
    horaRegistro TIME,
    est VARCHAR(20),
    FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente)
);
