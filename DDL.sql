CREATE DATABASE Taller_2;
USE Taller_2;

CREATE TABLE Autores(
    id_Autores INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(75) NOT NULL,
    Fecha_de_nacimiento DATETIME NOT NULL,
    Nacionalidad VARCHAR(75)
);

CREATE TABLE libros_detalle_Autor (
    id_Libros_detalle_Autores INT AUTO_INCREMENT PRIMARY KEY,
    id_ISBN INT,
    id_Autores INT,
    FOREIGN KEY (id_ISBN) REFERENCES Libros (id_ISBN),
    FOREIGN KEY (id_Autores) REFERENCES Autores (id_Autores)
);

CREATE TABLE Editoriales (
    id_Editoritales INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(75) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(75) NOT NULL
);

CREATE TABLE Pedidos (
    id_Pedidos INT AUTO_INCREMENT PRIMARY KEY,
    Estado VARCHAR(150) NOT NULL,
    Fecha_de_compra DATETIME,
    FOREIGN KEY (id_Clientes) REFERENCES Clientes (id_Clientes),
    FOREIGN KEY (id_Pedidos_detalle_Transaccion) REFERENCES Pedidos_detalle_Transaccion(id_Pedidos_detalle_Transaccion)
);

CREATE TABLE Clientes (
    id_Clientes INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(75) NOT NULL,
    Correo_electronico VARCHAR(150) NOT NULL,
    Telefono VARCHAR(75) NOT NULL,
    FOREIGN KEY (id_Direccion) REFERENCES Direccion (id_Direccion)
);

CREATE TABLE Direccion (
    id_Direccion INT AUTO_INCREMENT PRIMARY KEY,
    Ciudad VARCHAR(75) NOT NULL,
    Zona VARCHAR(75) NOT NULL,
    Calle VARCHAR(75)
);

CREATE TABLE Pedidos_detalle_Transaccion (
    id_Pedidos_detalle_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_Pedidos INT,
    id_Transaccion INT,
    FOREIGN KEY (id_Pedidos) REFERENCES Pedidos (id_Pedidos),
    FOREIGN KEY (id_Transaccion) REFERENCES Transaccion (id_Transaccion) 
);

CREATE TABLE Transaccion (
    id_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    Metodo_de_pago VARCHAR(75) NOT NULL,
    Monto_total DECIMAL(100) NOT NULL,
    Fecha_de_transaccion DATETIME
);

CREATE TABLE Libros (
    ISBN INT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Categoria VARCHAR(100) NOT NULL,
    Fecha_de-publicacion DATETIME NOT NULL
    Precio DECIMAL NOT NULL,
    Stock INT NOT NULL,
    FOREIGN KEY (id_Libros_detalle_Autor) REFERENCES Libros_detalle_Autores(id_Libros_detalle_Autores),
    FOREIGN KEY (id_Editoriales) REFERENCES Editoriales(id_Editoriales)
);
