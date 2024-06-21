Create database BD_AppDAM;

Use BD_AppDAM;


-----CREACION DE TABLAS--------------
-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo VARCHAR(100),
    contrasenia VARCHAR(100),
    tipo_usuario VARCHAR(20) -- Puede ser 'administrador', 'miembro', etc.
);

select*from Usuarios;

-- Crear tabla Autores
CREATE TABLE Autores (
    id_autor INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

select*from Autores;

-- Crear tabla Editoriales
CREATE TABLE Editoriales (
    id_editorial INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    correo VARCHAR(100)
);

select*from Editoriales;

-- Crear tabla Categorias
CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(50)
);

select*from Categorias;

-- Crear tabla Estado
CREATE TABLE Estado (
    id_estado INT PRIMARY KEY IDENTITY,
    tipo_estado VARCHAR(50) -- Puede ser 'prestado limitadamente', 'comprado', etc.
);

select*from Estado;

-- Crear tabla Libros
CREATE TABLE Libros (
    id_libro INT PRIMARY KEY IDENTITY,
    titulo VARCHAR(200),
    id_autor INT,
    id_editorial INT,
    descripcion VARCHAR(200),
    imagen VARCHAR(255), -- URL de la imagen
    id_categoria INT,
    id_estado INT,
    FOREIGN KEY (id_autor) REFERENCES Autores(id_autor),
    FOREIGN KEY (id_editorial) REFERENCES Editoriales(id_editorial),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);

select*from Libros;

-------INSERTAR REGISTROS--------
------ Insertar registros en tabla Usuarios
Insert into Usuarios(nombre, apellido, correo, contrasenia, tipo_usuario)
values('Juan', 'Perez', 'juanp@hotmail.com', 'juanp123', 'Empleado');
Go

Insert into Usuarios(nombre, apellido, correo, contrasenia, tipo_usuario)
values('Mario', 'Gomez', 'mariog@hotmail.com', 'mariog123', 'Administrador');
Go

------ Insertar registros en tabla Autores
Insert into Autores(nombre, apellido)
values('Dante', 'Alighieri')
Go;

Insert into Autores(nombre, apellido)
values('Margaret', 'Mitchell')
Go;

------ Insertar registros en tabla Editoriales
Insert into Editoriales(nombre, direccion, correo)
values('Edimat Libros', 'Madrid, España', 'edimat@edimat.es')
Go;

Insert into Editoriales(nombre, direccion, correo)
values('Macmillan Publishers', 'Londres, Reino Unido', 'press.inquiries@macmillan.com')
Go;

------ Insertar registros en tabla Categorias
Insert into Categorias(nombre)
values('Poesía')
Go;

Insert into Categorias(nombre)
values('Novela')
Go;

------ Insertar registros en tabla Estado
Insert into Estado(tipo_estado)
values('Vendido')
Go;

Insert into Estado(tipo_estado)
values('Prestado')
Go;

------ Insertar registros en tabla Libros
------Con la API finalizada

------PROCEDIMIENTOS ALMACENADOS--------------
------SP para tabla Usuarios
CREATE PROCEDURE usp_listaUsuarios
AS
BEGIN
    SELECT id_usuario, nombre, apellido, correo, contrasenia, tipo_usuario
	FROM Usuarios
END;
GO

EXEC usp_listaUsuarios;
GO

CREATE PROCEDURE usp_obtenerUsuarioPorId
@id_usuario int
AS
BEGIN
    SELECT id_usuario, nombre, apellido, correo, contrasenia, tipo_usuario
	FROM Usuarios
	WHERE id_usuario=@id_usuario
END;
GO

EXEC usp_obtenerUsuarioPorId 3;
GO

CREATE PROCEDURE usp_addUsuario
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@correo VARCHAR(100),
@contrasenia VARCHAR(100),
@tipo_usuario VARCHAR(20)
AS
BEGIN
    INSERT INTO Usuarios(nombre, apellido, correo, contrasenia, tipo_usuario)
	VALUES (@nombre, @apellido, @correo, @contrasenia, @tipo_usuario)
END;
GO

EXEC usp_addUsuario 'Pepe', 'Mago', 'pepem@gmail.com', 'pepem123', 'Administrador';
GO

CREATE PROCEDURE usp_updateUsuario
@id_usuario INT,
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@correo VARCHAR(100),
@contrasenia VARCHAR(100),
@tipo_usuario VARCHAR(20)
AS
BEGIN
    UPDATE Usuarios
	SET nombre = @nombre, apellido = @apellido, correo = @correo, contrasenia = @contrasenia, tipo_usuario = @tipo_usuario
	WHERE id_usuario = @id_usuario
END;
GO

EXEC usp_updateUsuario 3, 'Tito', 'Pana', 'titop@gmail.com', 'titop123', 'Maestro';
GO

CREATE PROCEDURE usp_deleteUsuario
@id_usuario int
AS
BEGIN
    DELETE
	FROM Usuarios
	WHERE id_usuario=@id_usuario
END;
GO

EXEC usp_deleteUsuario 3;
GO

------SP para tabla Autores
CREATE PROCEDURE usp_listaAutores
AS
BEGIN
    SELECT id_autor, nombre, apellido
	FROM Autores
END;
GO

EXEC usp_listaAutores;
GO

CREATE PROCEDURE usp_obtenerAutorPorId
@id_autor int
AS
BEGIN
	SELECT id_autor, nombre, apellido
	FROM Autores
	WHERE id_autor=@id_autor
END;
GO

EXEC usp_obtenerAutorPorId 3;
GO

CREATE PROCEDURE usp_addAutor
@nombre VARCHAR(50),
@apellido VARCHAR(50)
AS
BEGIN
    INSERT INTO Autores(nombre, apellido)
	VALUES (@nombre, @apellido)
END;
GO

EXEC usp_addAutor 'Autor3', 'ApeAutor3';
GO

CREATE PROCEDURE usp_updateAutor
@id_autor INT,
@nombre VARCHAR(50),
@apellido VARCHAR(50)
AS
BEGIN
    UPDATE Autores
	SET nombre = @nombre, apellido = @apellido
	WHERE id_autor = @id_autor
END;
GO

EXEC usp_updateAutor 3, 'NomAutor3', 'ApeAutor3';
GO

CREATE PROCEDURE usp_deleteAutor
@id_autor int
AS
BEGIN
    DELETE
	FROM Autores
	WHERE id_autor=@id_autor
END;
GO

EXEC usp_deleteAutor 3;
GO

------SP para tabla Editoriales
CREATE PROCEDURE usp_listaEditoriales
AS
BEGIN
    SELECT id_editorial, nombre, direccion, correo
	FROM Editoriales
END;
GO

EXEC usp_listaEditoriales;
GO

CREATE PROCEDURE usp_obtenerEditorialPorId
@id_editorial int
AS
BEGIN
	SELECT id_editorial, nombre, direccion, correo
	FROM Editoriales
	WHERE id_editorial=@id_editorial
END;
GO

EXEC usp_obtenerEditorialPorId 3;
GO

CREATE PROCEDURE usp_addEditorial
@nombre VARCHAR(100),
@direccion VARCHAR(255),
@correo VARCHAR(100)
AS
BEGIN
    INSERT INTO Editoriales(nombre, direccion, correo)
	VALUES (@nombre, @direccion, @correo)
END;
GO

EXEC usp_addEditorial 'Editorial', 'DirecEditorial', 'correoEditorial';
GO

CREATE PROCEDURE usp_updateEditorial
@id_editorial INT,
@nombre VARCHAR(100),
@direccion VARCHAR(255),
@correo VARCHAR(100)
AS
BEGIN
    UPDATE Editoriales
	SET nombre = @nombre, direccion = @direccion, correo = @correo
	WHERE id_editorial = @id_editorial
END;
GO

EXEC usp_updateEditorial 3, 'Editorial3', 'DireccEditorial3', 'CorreoEditorial3';
GO

CREATE PROCEDURE usp_deleteEditorial
@id_editorial int
AS
BEGIN
    DELETE
	FROM Editoriales
	WHERE id_editorial=@id_editorial
END;
GO

EXEC usp_deleteEditorial 3;
GO

------SP para tabla Categorias
CREATE PROCEDURE usp_listaCategorias
AS
BEGIN
    SELECT id_categoria, nombre
	FROM Categorias
END;
GO

EXEC usp_listaCategorias;
GO

CREATE PROCEDURE usp_obtenerCategoriaPorId
@id_categoria int
AS
BEGIN
	SELECT id_categoria, nombre
	FROM Categorias
	WHERE id_categoria=@id_categoria
END;
GO

EXEC usp_obtenerCategoriaPorId 1;
GO

CREATE PROCEDURE usp_addCategoria
@nombre VARCHAR(50)
AS
BEGIN
    INSERT INTO Categorias(nombre)
	VALUES (@nombre)
END;
GO

EXEC usp_addCategoria 'Infantil';
GO

CREATE PROCEDURE usp_updateCategoria
@id_categoria INT,
@nombre VARCHAR(50)
AS
BEGIN
    UPDATE Categorias
	SET nombre = @nombre
	WHERE id_categoria = @id_categoria
END;
GO

EXEC usp_updateCategoria 3, 'Comedia';
GO

CREATE PROCEDURE usp_deleteCategoria
@id_categoria INT
AS
BEGIN
    DELETE
	FROM Categorias
	WHERE id_categoria=@id_categoria
END;
GO

EXEC usp_deleteCategoria 3;
GO

------SP para tabla Estado
CREATE PROCEDURE usp_listaEstado
AS
BEGIN
    SELECT id_estado, tipo_estado
	FROM Estado
END;
GO

EXEC usp_listaEstado;
GO

CREATE PROCEDURE usp_obtenerEstadoPorId
@id_estado int
AS
BEGIN
	SELECT id_estado, tipo_estado
	FROM Estado
	WHERE id_estado=@id_estado
END;
GO

EXEC usp_obtenerEstadoPorId 1;
GO

CREATE PROCEDURE usp_addEstado
@tipo_estado VARCHAR(50)
AS
BEGIN
    INSERT INTO Estado(tipo_estado)
	VALUES (@tipo_estado)
END;
GO

EXEC usp_addEstado 'Pendiente';
GO

CREATE PROCEDURE usp_updateEstado
@id_estado INT,
@tipo_estado VARCHAR(50)
AS
BEGIN
    UPDATE Estado
	SET tipo_estado = @tipo_estado
	WHERE id_estado = @id_estado
END;
GO

EXEC usp_updateEstado 3, 'Reservado';
GO

CREATE PROCEDURE usp_deleteEstado
@id_estado int
AS
BEGIN
    DELETE
	FROM Estado
	WHERE id_estado=@id_estado
END;
GO

EXEC usp_deleteEstado 3;
GO

------SP para tabla Libros
CREATE PROCEDURE usp_listaLibros
AS
BEGIN
    SELECT id_libro, titulo, id_autor, id_editorial, descripcion, imagen, id_categoria, id_estado 
	FROM Libros
END;
GO

EXEC usp_listaLibros;
GO

CREATE PROCEDURE usp_obtenerLibroPorId
@id_libro int
AS
BEGIN
	SELECT id_libro, titulo, id_autor, id_editorial, descripcion, imagen, id_categoria, id_estado 
	FROM Libros
	WHERE id_libro=@id_libro
END;
GO

EXEC usp_obtenerLibroPorId 1;
GO

CREATE PROCEDURE usp_addLibro
@titulo VARCHAR(200),
@id_autor INT,
@id_editorial INT,
@descripcion VARCHAR(200),
@imagen VARCHAR(255),
@id_categoria INT,
@id_estado INT
AS
BEGIN
    INSERT INTO Libros(titulo,id_autor, id_editorial, descripcion, imagen, id_categoria, id_estado)
	VALUES (@titulo, @id_autor, @id_editorial, @descripcion, @imagen, @id_categoria, @id_estado)
END;
GO

--EXEC usp_addLibro ''; 
--GO

CREATE PROCEDURE usp_updateLibro
@id_libro INT,
@titulo VARCHAR(200),
@id_autor INT,
@id_editorial INT,
@descripcion VARCHAR(200),
@imagen VARCHAR(255),
@id_categoria INT,
@id_estado INT
AS
BEGIN
    UPDATE Libros
	SET titulo = @titulo, id_autor = @id_autor, id_editorial = @id_editorial, descripcion = @descripcion, 
		imagen = @imagen, id_categoria = @id_categoria, id_estado = @id_estado
	WHERE id_libro = @id_libro
END;
GO

--EXEC usp_updateLibro 1, '', '', '';
--GO

CREATE PROCEDURE usp_deleteLibro
@id_libro INT
AS
BEGIN
    DELETE
	FROM Libros
	WHERE id_libro=@id_libro
END;
GO

--EXEC usp_deleteLibro 1;
--GO