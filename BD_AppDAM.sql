Create database BD_AppDAM;

Use BD_AppDAM;


-----CREACION DE TABLAS--------------
-- Crear tabla LoginApp
CREATE TABLE LoginApp (
    id_login int primary key identity,
	usuario VARCHAR(50),
	contrasenia VARCHAR(50)
);

select*from LoginApp;

-- Crear tabla Categoria
CREATE TABLE Categoria (
    id_categoria int primary key identity,
	nombre VARCHAR(80),
	descripcion VARCHAR(80)
);
select*from Categoria;

-- Crear tabla Producto
CREATE TABLE Producto (
    id_producto int primary key identity,
	nombre VARCHAR(80),
	precio decimal (10,2),
	descripcion VARCHAR(80),
	foto VARCHAR(80),
	id_categoria int,
	Foreign key (id_categoria) references Categoria(id_categoria)
);

select*from Producto;

-- Crear tabla Pedido
CREATE TABLE Pedido (
    id_pedido int primary key identity,
	nom_cli VARCHAR(80),
	num_mesa int,
	detalle VARCHAR(80),
	precio decimal (10,2),
	id_producto int,
	Foreign key (id_producto) references Producto(id_producto)
);

select*from Pedido;


-------INSERTAR REGISTROS--------
------ Insertar registros en tabla LoginApp
Insert into LoginApp(usuario, contrasenia)
values('miguel','miguel23');
Go
Insert into LoginApp(usuario, contrasenia)
values('juan','juan123');
Go

------ Insertar registros en tabla Categoria
Insert into Categoria(nombre, descripcion)
values('Entradas', 'Platos de entrada');
Go
Insert into Categoria(nombre, descripcion)
values('Postres', 'Postres diversos');
Go

------ Insertar registros en tabla Producto
Insert into Producto(nombre, precio, descripcion, foto, id_categoria)
values('Sopa 1', 12.50, 'Sopa n° 1', 'sopa1.jpg', 1);
Go
Insert into Producto(nombre, precio, descripcion, foto, id_categoria)
values('Postre 1', 7.90, 'Postre n° 1', 'postre1.jpg', 2);
Go

------ Insertar registros en tabla Pedido
Insert into Pedido(nom_cli, num_mesa, detalle, precio, id_producto)
values('Cliente1', 1, 'Pedido n° 1', 12.50, 1);
Go
Insert into Pedido(nom_cli, num_mesa, detalle, precio, id_producto)
values('Cliente2', 2, 'Pedido n° 2', 7.90, 2);
Go


------PROCEDIMIENTOS ALMACENADOS--------------
------SP para tabla LoginApp
CREATE PROCEDURE usp_listaLoginApp
AS
BEGIN
    SELECT id_login, usuario, contrasenia
	FROM LoginApp
END;
GO

EXEC usp_listaLoginApp;
GO

CREATE PROCEDURE usp_obtenerLoginAppPorId
@id_login int
AS
BEGIN
    SELECT id_login, usuario, contrasenia
	FROM LoginApp
	WHERE id_login=@id_login
END;
GO

EXEC usp_obtenerLoginAppPorId 1;
GO

CREATE PROCEDURE usp_addLoginApp
@usuario VARCHAR(50),
@contrasenia VARCHAR(50)

AS
BEGIN
    INSERT INTO LoginApp(usuario, contrasenia)
	VALUES (@usuario, @contrasenia)
END;
GO

EXEC usp_addLoginApp 'pedrito', 'pedrito123';
GO

CREATE PROCEDURE usp_updateLoginApp
@id_login int, 
@usuario VARCHAR(50), 
@contrasenia VARCHAR(50)
AS
BEGIN
    UPDATE LoginApp
	SET usuario = @usuario, contrasenia = @contrasenia
	WHERE id_login = @id_login
END;
GO

EXEC usp_updateLoginApp 3, 'tito', 'tito123';
GO

CREATE PROCEDURE usp_deleteLoginApp
@id_login int
AS
BEGIN
    DELETE
	FROM LoginApp
	WHERE id_login=@id_login
END;
GO

EXEC usp_deleteLoginApp 3;
GO

------SP para tabla Categoria
CREATE PROCEDURE usp_listaCategoria
AS
BEGIN
    SELECT id_categoria, nombre, descripcion
	FROM Categoria
END;
GO

EXEC usp_listaCategoria;
GO

CREATE PROCEDURE usp_obtenerCategoriaPorId
@id_categoria int
AS
BEGIN
	SELECT id_categoria, nombre, descripcion
	FROM Categoria
	WHERE id_categoria=@id_categoria
END;
GO

EXEC usp_obtenerCategoriaPorId 1;
GO

CREATE PROCEDURE usp_addCategoria
@nombre VARCHAR(80),
@descripcion VARCHAR(80)
AS
BEGIN
    INSERT INTO Categoria(nombre, descripcion)
	VALUES (@nombre, @descripcion)
END;
GO

EXEC usp_addCategoria 'Ensaladas', 'Ensaladas diversas';
GO

CREATE PROCEDURE usp_updateCategoria
@id_categoria INT,
@nombre VARCHAR(80),
@descripcion VARCHAR(80)
AS
BEGIN
    UPDATE Categoria
	SET nombre = @nombre, descripcion = @descripcion
	WHERE id_categoria = @id_categoria
END;
GO

EXEC usp_updateCategoria 3, 'Acompañamientos', 'Platos de acompañamiento';
GO

CREATE PROCEDURE usp_deleteCategoria
@id_categoria int
AS
BEGIN
    DELETE
	FROM Categoria
	WHERE id_categoria=@id_categoria
END;
GO

EXEC usp_deleteCategoria 3;
GO

------SP para tabla Producto
CREATE PROCEDURE usp_listaProducto
AS
BEGIN
    SELECT id_producto, nombre, precio, descripcion, foto, id_categoria
	FROM Producto
END;
GO

EXEC usp_listaProducto;
GO

CREATE PROCEDURE usp_obtenerProductoPorId
@id_producto int
AS
BEGIN
	SELECT id_producto, nombre, precio, descripcion, foto, id_categoria
	FROM Producto
	WHERE id_producto=@id_producto
END;
GO

EXEC usp_obtenerProductoPorId 1;
GO

CREATE PROCEDURE usp_addProducto
@nombre VARCHAR(80),
@precio decimal (10,2),
@descripcion VARCHAR(80),
@foto VARCHAR(80),
@id_categoria int

AS
BEGIN
    INSERT INTO Producto(nombre, precio, descripcion, foto, id_categoria)
	VALUES (@nombre, @precio, @descripcion, @foto, @id_categoria)
END;
GO

EXEC usp_addProducto 'Sopa 2', 15.30, 'Sopa n° 2', 'sopa2.jpg', 1;
GO

CREATE PROCEDURE usp_updateProducto
@id_producto INT,
@nombre VARCHAR(80),
@precio decimal (10,2),
@descripcion VARCHAR(80),
@foto VARCHAR(80),
@id_categoria int
AS
BEGIN
    UPDATE Producto
	SET nombre = @nombre, precio = @precio, descripcion = @descripcion, foto = @foto, id_categoria = @id_categoria
	WHERE id_producto = @id_producto
END;
GO

EXEC usp_updateProducto 3, 'Postre 2', 20.50, 'Postre n° 2', 'postre2.jpg', 2 ;
GO

CREATE PROCEDURE usp_deleteProducto
@id_producto int
AS
BEGIN
    DELETE
	FROM Producto
	WHERE id_producto=@id_producto
END;
GO

EXEC usp_deleteProducto 3;
GO

------SP para tabla Pedido
CREATE PROCEDURE usp_listaPedido
AS
BEGIN
    SELECT id_pedido, nom_cli, num_mesa, detalle, precio, id_producto
	FROM Pedido
END;
GO

EXEC usp_listaPedido;
GO

CREATE PROCEDURE usp_obtenerPedidoPorId
@id_pedido int
AS
BEGIN
	SELECT id_pedido, nom_cli, num_mesa, detalle, precio, id_producto
	FROM Pedido
	WHERE id_pedido=@id_pedido
END;
GO

EXEC usp_obtenerPedidoPorId 1;
GO

CREATE PROCEDURE usp_addPedido
@nom_cli VARCHAR(80),
@num_mesa int,
@detalle VARCHAR(80),
@precio decimal (10,2),
@id_producto int
AS
BEGIN
    INSERT INTO Pedido(nom_cli, num_mesa, detalle, precio, id_producto)
	VALUES (@nom_cli, @num_mesa, @detalle, @precio, @id_producto)
END;
GO

EXEC usp_addPedido 'Cliente3', 3, 'Pedido n° 3', 20.5, 1;
GO

CREATE PROCEDURE usp_updatePedido
@id_pedido int,
@nom_cli VARCHAR(80),
@num_mesa int,
@detalle VARCHAR(80),
@precio decimal (10,2),
@id_producto int
AS
BEGIN
    UPDATE Pedido
	SET nom_cli = @nom_cli, num_mesa = @num_mesa, detalle = @detalle, precio = @precio, id_producto = @id_producto
	WHERE id_pedido = @id_pedido
END;
GO

EXEC usp_updatePedido 3, 'Cliente n°3', 4, 'Pedido para cliente 3', 22.5, 2;
GO

CREATE PROCEDURE usp_deletePedido
@id_pedido INT
AS
BEGIN
    DELETE
	FROM Pedido
	WHERE id_pedido=@id_pedido
END;
GO

EXEC usp_deletePedido 3;
GO