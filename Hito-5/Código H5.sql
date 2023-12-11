CREATE DATABASE APP_DB_PRODUCTOS
USE APP_DB_PRODUCTOS
--1
CREATE TABLE promociones
(
 tipo VARCHAR(100) NOT NULL,
 fecha_inicio DATE NOT NULL,
 fecha_fin DATE NOT NULL,
 id_promocion INTEGER PRIMARY KEY NOT NULL
);
INSERT INTO promociones (tipo, fecha_inicio, fecha_fin, id_promocion) 
VALUES ('Descuento', '2023-12-01', '2023-12-15', 1);
INSERT INTO promociones (tipo, fecha_inicio, fecha_fin, id_promocion) 
VALUES ('Oferta Especial', '2023-12-05', '2023-12-20', 2);
INSERT INTO promociones (tipo, fecha_inicio, fecha_fin, id_promocion) 
VALUES ('Rebaja de Temporada', '2023-12-10', '2023-12-31', 3);
INSERT INTO promociones (tipo, fecha_inicio, fecha_fin, id_promocion) 
VALUES ('Cupón de Regalo', '2023-12-15', '2023-12-25', 4);
--------------------------------------------------
--2-----------------------------------------------------
CREATE TABLE proveedores
(
 nombre VARCHAR(100) NOT NULL,
 direccion VARCHAR(200) NOT NULL,
 telefono INTEGER NOT NULL,
 id_proveedor INTEGER PRIMARY KEY NOT NULL
);
INSERT INTO proveedores (nombre, direccion, telefono, id_proveedor) 
VALUES ('Proveedor A', '123 Calle Principal', 123456, 1);
INSERT INTO proveedores (nombre, direccion, telefono, id_proveedor) 
VALUES ('Proveedor B', '456 Avenida Secundaria', 987654, 2);
INSERT INTO proveedores (nombre, direccion, telefono, id_proveedor) 
VALUES ('Proveedor C', '789 Carretera Central', 246810, 3);
INSERT INTO proveedores (nombre, direccion, telefono, id_proveedor) 
VALUES ('Proveedor D', '012 Calle Secundaria', 3691234, 4);
---------------------------------------------------------
---3--------------------------------------------------
CREATE TABLE categorias 
(
 nombre VARCHAR(50) NOT NULL,
 id_categoria INTEGER PRIMARY KEY NOT NULL
);
INSERT INTO categorias (nombre, id_categoria)
VALUES ('Electrónicos', 1);
INSERT INTO categorias (nombre, id_categoria) 
VALUES ('Ropa', 2);
INSERT INTO categorias (nombre, id_categoria) 
VALUES ('Hogar', 3);
INSERT INTO categorias (nombre, id_categoria) 
VALUES ('videojuegos', 4);
-------------------------------------------------------------
--4------------------------------------------------------
CREATE TABLE inventario 
( 
 cantidad_disp INTEGER NOT NULL,
 fecha_entrada DATE NOT NULL,
 fecha_salida DATE NOT NULL,
 id_inventario INTEGER PRIMARY KEY NOT NULL
);
INSERT INTO inventario (cantidad_disp, fecha_entrada, fecha_salida, id_inventario) 
VALUES (100, '2023-11-01', '2023-12-01', 1);
INSERT INTO inventario (cantidad_disp, fecha_entrada, fecha_salida, id_inventario)
VALUES (150, '2023-11-15', '2023-12-15', 2);
INSERT INTO inventario (cantidad_disp, fecha_entrada, fecha_salida, id_inventario) 
VALUES (200, '2023-11-30', '2023-12-30', 3);
INSERT INTO inventario (cantidad_disp, fecha_entrada, fecha_salida, id_inventario) 
VALUES (120, '2023-12-05', '2023-12-31', 4);
---------------------------------------------------------------
---5---------------------------------------------------------------
CREATE TABLE productos 
(
 nombre VARCHAR(100) NOT NULL,
 descripcion VARCHAR(100) NOT NULL,
 precio INTEGER NOT NULL,
 categoria VARCHAR(50) NOT NULL,
 id_promocion INTEGER NOT NULL,
 id_proveedor INTEGER NOT NULL,
 id_categoria INTEGER NOT NULL,
 id_inventario INTEGER NOT NULL,
 id_producto INT PRIMARY KEY NOT NULL,
 FOREIGN KEY (id_promocion) REFERENCES promociones(id_promocion),
 FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
 FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
 FOREIGN KEY (id_inventario) REFERENCES inventario(id_inventario)
 );
INSERT INTO productos (nombre, descripcion, precio, categoria, id_promocion, id_proveedor, id_categoria, id_inventario, id_producto) 
VALUES ('Smartphone', 'Último modelo con cámara de alta resolución', 800, 'Electrónicos', 1, 1, 1, 1, 1);
INSERT INTO productos (nombre, descripcion, precio, categoria, id_promocion, id_proveedor, id_categoria, id_inventario, id_producto) 
VALUES ('Camisa', 'Camisa de algodón de alta calidad', 50, 'Ropa', 2, 2, 2, 2, 2);
INSERT INTO productos (nombre, descripcion, precio, categoria, id_promocion, id_proveedor, id_categoria, id_inventario, id_producto) 
VALUES ('Sofá', 'Sofá de tres plazas con diseño moderno', 700, 'Hogar', 3, 3, 3,3, 3);
INSERT INTO productos (nombre, descripcion, precio, categoria, id_promocion, id_proveedor, id_categoria, id_inventario, id_producto) 
VALUES ('play 5', 'Frecuencia variable de GPU hasta 2.23 GHz (10.3 TFLOPS)', 10, 'videojuegos', 4, 4, 4, 4, 4);
------------------------------------------------------------------------
 ----6-----------------------------------------------------------------
CREATE TABLE pedidos
(
 nombre_pedido VARCHAR(100) NOT NULL,
 fecha_pedido DATE NOT NULL,
 estado VARCHAR(50) NOT NULL,
 id_pedido INTEGER PRIMARY KEY NOT NULL
);
INSERT INTO pedidos (nombre_pedido, fecha_pedido, estado, id_pedido) 
VALUES ('Pedido 1', '2023-12-01', 'En Proceso', 1);
INSERT INTO pedidos (nombre_pedido, fecha_pedido, estado, id_pedido) 
VALUES ('Pedido 2', '2023-12-05', 'En Proceso', 2);
INSERT INTO pedidos (nombre_pedido, fecha_pedido, estado, id_pedido) 
VALUES ('Pedido 3', '2023-12-10', 'Entregado', 3);
INSERT INTO pedidos (nombre_pedido, fecha_pedido, estado, id_pedido) 
VALUES ('Pedido 4', '2023-12-15', 'En Proceso', 4);
------------------------------------------------------------------------------
--7----------------------------------------------------------------------
CREATE TABLE comentarios
( 
 comentario_cliente VARCHAR(200) NOT NULL,
 fecha_comentario DATE NOT NULL,
 id_comentario INTEGER PRIMARY KEY NOT NULL
);
INSERT INTO comentarios (comentario_cliente, fecha_comentario, id_comentario) 
VALUES ('Excelente servicio, muy satisfecho con mi compra.', '2023-12-01', 1);
INSERT INTO comentarios (comentario_cliente, fecha_comentario, id_comentario) 
VALUES ('El producto llegó en mal estado, espero una pronta solución.', '2023-12-05', 2);
INSERT INTO comentarios (comentario_cliente, fecha_comentario, id_comentario) 
VALUES ('Buena atención al cliente, definitivamente volveré a comprar.', '2023-12-10', 3);
INSERT INTO comentarios (comentario_cliente, fecha_comentario, id_comentario) 
VALUES ('El envío se retrasó, necesito una explicación.', '2023-12-15', 4);
--------------------------------------------------------------------------------
--8--------------------------------------------------------------------------
CREATE TABLE clientes 
(
 nombre VARCHAR(50) NOT NULL,
 direccion VARCHAR(100) NOT NULL,
 telefonno INTEGER NOT NULL,
 id_pedido INTEGER NOT NULL,
 id_comentario INTEGER NOT NULL,
 id_cliente INTEGER PRIMARY KEY NOT NULL,
 FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
 FOREIGN KEY (id_comentario) REFERENCES comentarios(id_comentario)
);
INSERT INTO clientes (nombre, direccion, telefonno, id_pedido, id_comentario, id_cliente) 
VALUES ('juan Matinez', '456 Calle Principal', 123456, 1, 1, 11);
INSERT INTO clientes (nombre, direccion, telefonno, id_pedido, id_comentario, id_cliente) 
VALUES ('pedro Hernande', '789 Avenida Secundaria', 98765, 2, 2, 22);
INSERT INTO clientes (nombre, direccion, telefonno, id_pedido, id_comentario, id_cliente) 
VALUES ('jose Perez', '012 Carretera Central', 246810, 3, 3, 33);
INSERT INTO clientes (nombre, direccion, telefonno, id_pedido, id_comentario, id_cliente)
VALUES ('fernando Condori', '123 Calle Secundaria', 36912, 4, 4, 44);
------------------------------------------------------------------------------
---9----------------------------------------------------------------------------
CREATE TABLE ventas  
( 
fecha_venta DATE NOT NULL, 
total INTEGER NOT NULL, 
id_cliente INTEGER NOT NULL, 
id_venta INTEGER PRIMARY KEY NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
INSERT INTO ventas (fecha_venta, total, id_cliente, id_venta) 
VALUES ('2023-12-01', 800, 11, 12);
INSERT INTO ventas (fecha_venta, total, id_cliente, id_venta) 
VALUES ('2023-12-05', 50, 22, 23);
INSERT INTO ventas (fecha_venta, total, id_cliente, id_venta) 
VALUES ('2023-12-10', 700, 33, 34);
INSERT INTO ventas (fecha_venta, total, id_cliente, id_venta) 
VALUES ('2023-12-15', 10, 44, 45);
---10---------------------------------------------------------------------------
------
CREATE TABLE detalle_ventas
(
 cantidad INTEGER NOT NULL,
 subtotal INTEGER NOT NULL,
 id_producto INTEGER NOT NULL,
 id_venta INTEGER NOT NULL,
 id_detalle INTEGER PRIMARY KEY NOT NULL,
 FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
 FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
);
INSERT INTO detalle_ventas (cantidad, subtotal, id_producto, id_venta, id_detalle) 
VALUES (2, 1600, 1, 12, 111);
INSERT INTO detalle_ventas (cantidad, subtotal, id_producto, id_venta, id_detalle) 
VALUES (1, 50, 2, 23, 222);
INSERT INTO detalle_ventas (cantidad, subtotal, id_producto, id_venta, id_detalle) 
VALUES (1, 700, 3, 34, 333);
INSERT INTO detalle_ventas (cantidad, subtotal, id_producto, id_venta, id_detalle) 
VALUES (1, 10, 4, 45, 444);
-----
SELECT * FROM promociones;
SELECT * FROM proveedores;
SELECT * FROM categorias;
SELECT * FROM inventario;
SELECT * FROM productos;
SELECT * FROM pedidos;
SELECT * FROM comentarios;
SELECT * FROM clientes;
SELECT * FROM ventas;
SELECT * FROM detalle_ventas;
---4 Joins con más de 5 tablas:
--¿Cuáles son los nombres de los productos, nombres de categorías, 
--precios de los productos, nombres de proveedores y direcciones de proveedores?

SELECT productos.nombre, 
       categorias.nombre,
	   productos.precio,
	   proveedores.nombre,
	   proveedores.direccion 
FROM productos 
INNER JOIN categorias ON productos.id_categoria = categorias.id_categoria 
INNER JOIN proveedores ON productos.id_proveedor = proveedores.id_proveedor 
INNER JOIN detalle_ventas ON productos.id_producto = detalle_ventas.id_producto 
INNER JOIN ventas ON detalle_ventas.id_venta = ventas.id_venta;

--.¿Cuáles son los detalles de los pedidos realizados, incluyendo el
--nombre del cliente, el estado del pedido y cualquier comentario asociado? 
SELECT
v.fecha_venta,
v.total,
d.cantidad,
p.nombre AS producto,
c.nombre AS cliente
FROM ventas v
INNER JOIN detalle_ventas d ON v.id_venta = d.id_venta
INNER JOIN productos p ON d.id_producto = p.id_producto
INNER JOIN clientes c ON v.id_cliente = c.id_cliente;


----¿Cuál es la fecha de venta, nombre del producto y nombre del cliente
--para las ventas de productos de la categoría 'Electrónicos'?

SELECT v.fecha_venta, p.nombre AS producto, c.nombre AS cliente
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN detalle_ventas dv ON v.id_venta = dv.id_venta
JOIN productos p ON dv.id_producto = p.id_producto
JOIN categorias cat ON p.categoria = cat.nombre
WHERE cat.nombre = 'Electrónicos';

---¿Cuáles son los nombres de los productos, su descripciones del producto, 
--nombre de los proveedores el nombre de la categorías y tipos de promoción?
SELECT 
    pr.nombre AS proveedor,
    p.nombre AS producto,
    p.descripcion,
    c.nombre AS categoria,
    prom.tipo AS tipo
FROM 
    productos p
INNER JOIN promociones prom ON p.id_promocion = prom.id_promocion
INNER JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor
INNER JOIN categorias c ON p.id_categoria = c.id_categoria;

--¿Cuáles son los nombres de los productos, tipos de promociones, 
--nombres de proveedores, nombres de categorías y cantidades disponibles en inventario para los productos?

SELECT productos.nombre, 
       promociones.tipo, 
	   proveedores.nombre, 
	   categorias.nombre, 
	   inventario.cantidad_disp
FROM productos 
JOIN promociones ON productos.id_promocion = promociones.id_promocion 
JOIN proveedores ON productos.id_proveedor = proveedores.id_proveedor 
JOIN categorias ON productos.id_categoria = categorias.id_categoria 
JOIN inventario ON productos.id_inventario = inventario.id_inventario;

--¿Cuáles son los nombres de los pedidos, estados de los pedidos, nombres de clientes, 
--nombres de productos y fechas de venta?

SELECT pedidos.nombre_pedido,
       pedidos.estado, 
	   clientes.nombre, 
	   productos.nombre, 
	   ventas.fecha_venta 
FROM pedidos 
JOIN clientes ON pedidos.id_pedido = clientes.id_pedido 
JOIN ventas ON clientes.id_cliente = ventas.id_cliente 
JOIN detalle_ventas ON ventas.id_venta = detalle_ventas.id_venta 
JOIN productos ON detalle_ventas.id_producto = productos.id_producto;

--¿Cuáles son las fechas de venta, nombres de clientes 
--y nombres de proveedores asociados a las ventas donde el proveedor es 'Proveedor A'

SELECT v.fecha_venta, c.nombre, pr.nombre 
FROM ventas v 
JOIN clientes c ON v.id_cliente = c.id_cliente 
JOIN detalle_ventas dv ON v.id_venta = dv.id_venta 
JOIN productos p ON dv.id_producto = p.id_producto 
JOIN proveedores pr ON p.id_proveedor = pr.id_proveedor 
WHERE pr.nombre = 'Proveedor A';

---Funciones de agregacion
SELECT COUNT(*) AS total_pedidos FROM pedidos;
SELECT SUM(precio) AS total_ventas FROM productos;
SELECT AVG(precio) AS promedio_precio FROM productos;
SELECT MAX(precio) AS precio_maximo FROM productos;
SELECT MIN(precio) AS precio_minimo FROM productos;

----Funciones de Agregación con inner join

--¿Cuántos productos hay en cada categoría y cuál es el nombre de cada categoría?

SELECT categorias.nombre AS categoria, COUNT(productos.id_producto) AS cantidad_productos
FROM categorias
INNER JOIN productos ON categorias.id_categoria = productos.id_categoria
INNER JOIN inventario ON productos.id_inventario = inventario.id_inventario
GROUP BY categorias.nombre;

--¿Cuál es el promedio de ventas para cada categoría de productos en la base de datos,
--considerando las ventas totales de cada producto dentro de esa categoría?

SELECT categorias.nombre AS categoria,
       AVG(ventas.total) AS promedio_venta
FROM categorias
INNER JOIN productos ON categorias.id_categoria = productos.id_categoria
INNER JOIN detalle_ventas ON productos.id_producto = detalle_ventas.id_producto
INNER JOIN ventas ON detalle_ventas.id_venta = ventas.id_venta
GROUP BY categorias.nombre;

--¿Cuál es el total de ventas por categoría de productos
--, considerando las ventas totales de cada producto dentro de esa categoría?

SELECT c.nombre, SUM(v.total) as total_ventas 
FROM ventas v 
INNER JOIN clientes cl ON v.id_cliente = cl.id_cliente
INNER JOIN detalle_ventas dv ON v.id_venta = dv.id_venta
INNER JOIN productos p ON dv.id_producto = p.id_producto 
INNER JOIN categorias c ON p.id_categoria = c.id_categoria 
GROUP BY c.nombre;

--¿Cuál es el precio máximo al que se ha vendido un producto para cada proveedor 
--considerando los detalles de las ventas y los productos asociados a cada proveedor?
SELECT pv.nombre, MAX(p.precio) as max_precio_venta 
FROM productos p 
INNER JOIN proveedores pv ON p.id_proveedor = pv.id_proveedor 
INNER JOIN detalle_ventas dv ON p.id_producto = dv.id_producto 
INNER JOIN ventas v ON dv.id_venta = v.id_venta 
GROUP BY pv.nombre;

--¿Cuál es el precio mínimo al que se ha vendido un producto para cada proveedor
--considerando los detalles de las ventas y los productos asociados a cada proveedor?
SELECT pv.nombre, MIN(p.precio) as min_precio_venta 
FROM productos p 
INNER JOIN proveedores pv ON p.id_proveedor = pv.id_proveedor
INNER JOIN detalle_ventas dv ON p.id_producto = dv.id_producto 
INNER JOIN ventas v ON dv.id_venta = v.id_venta
GROUP BY pv.nombre;