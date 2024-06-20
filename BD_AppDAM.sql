Create database BD_AppDAM;

Use BD_AppDAM;

-- Crear tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo VARCHAR(100),
    contraseña VARCHAR(100),
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

