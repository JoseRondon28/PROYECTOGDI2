use Clinica
go
CREATE PROCEDURE sp_CrearEspecialidad
    @Nombre NVARCHAR(50),
    @Descripcion NVARCHAR(150),
    @Estado BIT = 1
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Especialidad(Nombre, Descripcion, Estado)
    VALUES (@Nombre, @Descripcion, @Estado);

    SELECT 'Registro insertado correctamente.' AS Mensaje;
END
GO
CREATE PROCEDURE sp_ModificarEspecialidad
    @ID_Especialidad INT,
    @Nombre NVARCHAR(50),
    @Descripcion NVARCHAR(150),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Especialidad
    SET Nombre = @Nombre, Descripcion = @Descripcion, Estado = @Estado
    WHERE ID_Especialidad = @ID_Especialidad;

    SELECT 'Registro modificado correctamente.' AS Mensaje;
END
GO
CREATE PROCEDURE sp_EliminarEspecialidad
    @ID_Especialidad INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Especialidad
    WHERE ID_Especialidad = @ID_Especialidad;
END
GO
CREATE PROCEDURE sp_CrearMedico
    @Nombres NVARCHAR(100),
    @Apellidos NVARCHAR(100),
    @ID_Especialidad INT,
    @ID_Usuario INT = 0, 
    @Estado BIT = 1
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Medico(Nombres, Apellidos, ID_Especialidad, ID_Usuario, Estado)
    VALUES (@Nombres, @Apellidos, @ID_Especialidad, @ID_Usuario, @Estado);

    SELECT 'Registro insertado correctamente.' AS Mensaje;
END
GO
CREATE PROCEDURE sp_ModificarMedico
    @ID_Medico INT,
    @Nombres NVARCHAR(100),
    @Apellidos NVARCHAR(100),
    @ID_Especialidad INT,
    @ID_Usuario INT,
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Medico
    SET Nombres = @Nombres, Apellidos = @Apellidos, ID_Especialidad = @ID_Especialidad, ID_Usuario = @ID_Usuario, Estado = @Estado
    WHERE ID_Medico = @ID_Medico;

    SELECT 'Registro modificado correctamente.' AS Mensaje;
END
GO
CREATE PROCEDURE sp_EliminarMedico
    @ID_Medico INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Medico
    WHERE ID_Medico = @ID_Medico;
END
GO
CREATE PROCEDURE sp_CrearPaciente
    @Nombres NVARCHAR(100),
    @Apellidos NVARCHAR(100),
    @Peso FLOAT,
    @Altura FLOAT,
    @Edad INT,
    @Telefono NVARCHAR(9),
    @Alergias NVARCHAR(200),
    @Enfermedades NVARCHAR(200),
    @Tipo_Sangre NVARCHAR(5),
    @Estado BIT = 1
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Paciente(Nombres, Apellidos, Peso, Altura, Edad, Telefono, Alergias, Enfermedades, Tipo_Sangre, Estado)
    VALUES (@Nombres, @Apellidos, @Peso, @Altura, @Edad, @Telefono, @Alergias, @Enfermedades, @Tipo_Sangre, @Estado);

    SELECT 'Registro insertado correctamente.' AS Mensaje;
END
GO
CREATE PROCEDURE sp_ConsultarPaciente
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM Paciente WHERE ID_Paciente = @Id;
END
GO
CREATE PROCEDURE sp_ConsultarCitaPorID
    @ID_Cita INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM Cita WHERE ID_Cita = @ID_Cita;
END
GO
CREATE PROCEDURE sp_ConsultarCitasPorMedico
    @ID_Medico INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT * FROM Cita WHERE ID_Medico = @ID_Medico;
END
GO
CREATE PROCEDURE sp_CrearServicio
    @Nombre_Servicio NVARCHAR(50),
    @Descripcion_Servicio NVARCHAR(150),
    @Precio_Servicio DECIMAL(20, 2),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Servicio (Nombre_Servicio, Descripcion_Servicio, Precio_Servicio, Estado)
    VALUES (@Nombre_Servicio, @Descripcion_Servicio, @Precio_Servicio, CASE WHEN @Estado IS NULL THEN 1 ELSE @Estado END);
END
GO
CREATE PROCEDURE sp_ModificarServicio
    @ID_Servicio INT,
    @Nombre_Servicio NVARCHAR(50),
    @Descripcion_Servicio NVARCHAR(150),
    @Precio_Servicio DECIMAL(20, 2),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Servicio
    SET Nombre_Servicio = @Nombre_Servicio,
        Descripcion_Servicio = @Descripcion_Servicio,
        Precio_Servicio = @Precio_Servicio,
        Estado = @Estado
    WHERE ID_Servicio = @ID_Servicio;
END
GO
CREATE PROCEDURE sp_EliminarServicio
    @ID_Servicio INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Servicio
    WHERE ID_Servicio = @ID_Servicio;
END
GO
CREATE PROCEDURE sp_CrearUsuario
    @Nombre_Usuario NVARCHAR(50),
    @Contrasena_Usuario NVARCHAR(100),
    @Rol_Usuario NVARCHAR(20),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Usuario (Nombre_Usuario, Contrasena_Usuario, Rol_Usuario, Estado)
    VALUES (@Nombre_Usuario, @Contrasena_Usuario, @Rol_Usuario, COALESCE(@Estado, 1));
END
GO
CREATE PROCEDURE sp_ModificarUsuario
    @ID_Usuario INT,
    @Nombre_Usuario NVARCHAR(50),
    @Contrasena_Usuario NVARCHAR(100),
    @Rol_Usuario NVARCHAR(20),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Usuario
    SET 
        Nombre_Usuario = @Nombre_Usuario,
        Contrasena_Usuario = @Contrasena_Usuario,
        Rol_Usuario = @Rol_Usuario,
        Estado = COALESCE(@Estado, Estado)
    WHERE ID_Usuario = @ID_Usuario;
END
GO
CREATE PROCEDURE sp_EliminarUsuario
    @ID_Usuario INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Usuario
    WHERE ID_Usuario = @ID_Usuario;
END
GO
CREATE PROCEDURE sp_CrearConsulta
    @ID_Cita INT,
    @Descripcion_Consulta NVARCHAR(200),
    @Diagnostico NVARCHAR(200),
    @Receta NVARCHAR(500),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Consulta (ID_Cita, Descripcion_Consulta, Diagnostico, Receta, Estado)
    VALUES (@ID_Cita, @Descripcion_Consulta, @Diagnostico, @Receta, COALESCE(@Estado, 1));
END
GO
CREATE PROCEDURE sp_ModificarConsulta
    @ID_Consulta INT,
    @Descripcion_Consulta NVARCHAR(200),
    @Diagnostico NVARCHAR(200),
    @Receta NVARCHAR(500),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Consulta
    SET 
        Descripcion_Consulta = @Descripcion_Consulta,
        Diagnostico = @Diagnostico,
        Receta = @Receta,
        Estado = COALESCE(@Estado, Estado)
    WHERE ID_Consulta = @ID_Consulta;
END
GO
CREATE PROCEDURE sp_EliminarConsulta
    @ID_Consulta INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Consulta
    WHERE ID_Consulta = @ID_Consulta;
END
GO
CREATE PROCEDURE sp_CrearPago
    @Fecha_Pago DATETIME,
    @ID_Paciente INT,
    @ID_Usuario INT,
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Pago (Fecha_Pago, ID_Paciente, ID_Usuario, Estado)
    VALUES (@Fecha_Pago, @ID_Paciente, @ID_Usuario, COALESCE(@Estado, 1));
END
GO
CREATE PROCEDURE sp_ModificarPago
    @ID_Pago INT,
    @Fecha_Pago DATETIME,
    @ID_Paciente INT,
    @ID_Usuario INT,
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Pago
    SET 
        Fecha_Pago = @Fecha_Pago,
        ID_Paciente = @ID_Paciente,
        ID_Usuario = @ID_Usuario,
        Estado = COALESCE(@Estado, Estado)
    WHERE ID_Pago = @ID_Pago;
END
GO
CREATE PROCEDURE sp_EliminarPago
    @ID_Pago INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Pago
    WHERE ID_Pago = @ID_Pago;
END
GO
CREATE PROCEDURE sp_CrearDetallePago
    @ID_Pago INT,
    @ID_Servicio INT,
    @Cantidad INT,
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Detalle_Pago (ID_Pago, ID_Servicio, Cantidad, Estado)
    VALUES (@ID_Pago, @ID_Servicio, @Cantidad, COALESCE(@Estado, 1));
END
GO
CREATE PROCEDURE sp_ModificarDetallePago
    @ID_Detalle_Pago INT,
    @ID_Pago INT,
    @ID_Servicio INT,
    @Cantidad INT,
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Detalle_Pago
    SET 
        ID_Pago = @ID_Pago,
        ID_Servicio = @ID_Servicio,
        Cantidad = @Cantidad,
        Estado = COALESCE(@Estado, Estado)
    WHERE ID_Detalle_Pago = @ID_Detalle_Pago;
END
GO
CREATE PROCEDURE sp_EliminarDetallePago
    @ID_Detalle_Pago INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Detalle_Pago
    WHERE ID_Detalle_Pago = @ID_Detalle_Pago;
END
GO
CREATE PROCEDURE sp_CrearDiaMedico
    @ID_Medico INT,
    @Dia NVARCHAR(1),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Dia_Medico (ID_Medico, Dia, Estado)
    VALUES (@ID_Medico, @Dia, COALESCE(@Estado, 1));
END
GO
CREATE PROCEDURE sp_ModificarDiaMedico
    @ID_Dia_Medico INT,
    @ID_Medico INT,
    @Dia NVARCHAR(1),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Dia_Medico
    SET 
        ID_Medico = @ID_Medico,
        Dia = @Dia,
        Estado = COALESCE(@Estado, Estado)
    WHERE ID_Dia_Medico = @ID_Dia_Medico;
END
GO
CREATE PROCEDURE sp_EliminarDiaMedico
    @ID_Dia_Medico INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Dia_Medico
    WHERE ID_Dia_Medico = @ID_Dia_Medico;
END
GO
CREATE PROCEDURE sp_CrearHoraMedico
    @ID_Dia_Medico INT,
    @Hora_Inicial NVARCHAR(15),
    @Hora_Final NVARCHAR(15),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Hora_Medico (ID_Dia_Medico, Hora_Inicial, Hora_Final, Estado)
    VALUES (@ID_Dia_Medico, @Hora_Inicial, @Hora_Final, COALESCE(@Estado, 1));
END
GO
CREATE PROCEDURE sp_ModificarHoraMedico
    @ID_Hora_Medico INT,
    @ID_Dia_Medico INT,
    @Hora_Inicial NVARCHAR(15),
    @Hora_Final NVARCHAR(15),
    @Estado BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Hora_Medico
    SET 
        ID_Dia_Medico = @ID_Dia_Medico,
        Hora_Inicial = @Hora_Inicial,
        Hora_Final = @Hora_Final,
        Estado = COALESCE(@Estado, Estado)
    WHERE ID_Hora_Medico = @ID_Hora_Medico;
END
GO
CREATE PROCEDURE sp_EliminarHoraMedico
    @ID_Hora_Medico INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Hora_Medico
    WHERE ID_Hora_Medico = @ID_Hora_Medico;
END
GO