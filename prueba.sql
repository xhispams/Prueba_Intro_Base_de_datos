-- Crear base de datos
CREATE DATABASE prueba;

--PARTE 2
--Crear tablas
CREATE TABLE categorias(id SERIAL, nombre VARCHAR(50) NOT NULL, descripcion VARCHAR(100) NOT NULL, PRIMARY KEY(id));
CREATE TABLE facturas(num_factura INT, fecha DATE NOT NULL, subtotal INT NOT NULL, iva INT NOT NULL, precio_total INT NOT NULL, PRIMARY KEY(num_factura));
CREATE TABLE clientes(id SERIAL, nombre VARCHAR(100) NOT NULL, rut VARCHAR(13), direccion VARCHAR(100) NOT NULL, PRIMARY KEY(id));
CREATE TABLE productos(id SERIAL, nombre VARCHAR(100), descripcion VARCHAR(100), valor_unitario INT, categoria_id INT, PRIMARY KEY(id), FOREIGN KEY(categoria_id) REFERENCES categorias(id));
CREATE TABLE detalles(id SERIAL, cantidad INT, valor_total INT,producto_id INT, PRIMARY KEY(id), FOREIGN KEY(producto_id) REFERENCES productos(id));
CREATE TABLE factura_detalle(factura_num_factura INT, detalle_id INT, FOREIGN KEY(factura_num_factura) REFERENCES facturas(num_factura), FOREIGN KEY(detalle_id) REFERENCES detalles(id));
CREATE TABLE cliente_factura(factura_num_factura INT, cliente_id INT, FOREIGN KEY(factura_num_factura) REFERENCES facturas(num_factura), FOREIGN KEY(cliente_id) REFERENCES clientes(id));
--insertar datos
    --tabla categorias
    INSERT INTO categorias(nombre, descripcion) VALUES('Intrumentos de Viento', 'Producen el sonido por la vibración del contenido de aire en su interior.');
    INSERT INTO categorias(nombre, descripcion) VALUES('Instrumentos de Percusión', 'Produce el sonido al ser golpeado o agitado.');
    INSERT INTO categorias(nombre, descripcion) VALUES('Instrumentos de Cuerda', 'Producen sonidos por medio de las vibraciones de una o más cuerdas.');

    --tabla clientes
    INSERT INTO clientes(nombre, rut, direccion) VALUES('Álvaro Moya Santana', '15.563.058-2', 'Tarapacá 850, Depto 208');
    INSERT INTO clientes(nombre, rut, direccion) VALUES('Mary Escobar Chamorro', '15.665.948-7', 'Tarapacá 860, Depto 218');
    INSERT INTO clientes(nombre, rut, direccion) VALUES('Julián Moya Escobar', '25.678.685-0', 'Tarapacá 870, Depto 228');
    INSERT INTO clientes(nombre, rut, direccion) VALUES('Beatriz Moya Escobar', '27.066.265-K', 'Tarapacá 880, Depto 238');
    INSERT INTO clientes(nombre, rut, direccion) VALUES('Antonio Moya Escobar', '12.345.678-5', 'Tarapacá 890, Depto 248');

    --tabla facturas
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00001, '2020-11-01', 3700, 703, 4403);
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00002, '2020-11-02', 5500, 1045, 6545);
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00003, '2020-11-03', 3100, 589, 3689);
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00004, '2020-11-04', 3800, 722, 4522);
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00005, '2020-11-05', 3500, 665, 4165);
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00006, '2020-11-02', 3600, 684, 4284);
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00007, '2020-11-06', 4800, 912, 5712);
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00008, '2020-11-07', 4100, 779, 4879);
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00009, '2020-11-08', 5200, 988, 6188);
    INSERT INTO facturas(num_factura, fecha, subtotal, iva, precio_total) VALUES(00010, '2020-11-09', 2200, 418, 2618);

    --tabla productos
    INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES('trombón', 'trombón a vara', 1000, 1);
    INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES('trompeta', 'trompeta en sib', 900, 1);
    INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES('bateria', 'bateria profesional', 1300, 2);
    INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES('pandero', 'pandero', 2000, 2);
    INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES('maracas', 'par de maracas', 2200, 2);
    INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES('charango', 'instrumento de 5 pares de cuerdas', 900, 3);
    INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES('violín', 'instrumento de 4 cuerdas', 800, 3);
    INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES('guitarra', 'instrumento 6 cuerdas', 500, 3);
    
    --tabla detalle
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 1000, 1);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 3, 2700, 6);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 1300, 3);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 2000, 4);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 2200, 5);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 2, 1800, 6);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 800, 7);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 500, 8);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 2, 2000, 1);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 2, 1800, 2);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 900, 2);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 2, 1600, 7);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 2, 1000, 8);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 4, 3600, 6);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 2, 2600, 3);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 2200, 5);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 2, 2000, 1);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 2, 1600, 7);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 500, 8);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 1000, 1);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 900, 2);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 1300, 3);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 2000, 4);
    INSERT INTO detalles(cantidad, valor_total, producto_id) VALUES( 1, 2200, 5);

    --tabla cliente_factura
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00001, 1);
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00002, 1);
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00003, 2);
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00004, 2);
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00005, 2);
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00006, 3);
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00007, 4);
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00008, 4);
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00009, 4);
    INSERT INTO cliente_factura(factura_num_factura, cliente_id) VALUES(00010, 4);

    --tabla factura_detalle
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00001, 1);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00001, 2);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00002, 3);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00002, 4);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00002, 5);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00003, 6);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00003, 7);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00003, 8);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00004, 9);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00004, 10);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00005, 11);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00005, 12);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00005, 13);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00006, 14);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00007, 15);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00007, 16);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00008, 17);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00008, 18);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00008, 19);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00009, 20);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00009, 21);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00009, 22);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00009, 23);
    INSERT INTO factura_detalle(factura_num_factura, detalle_id) VALUES(00010, 24);

--PARTE 3
    --¿Que cliente realizó la compra más cara?
    SELECT clientes.rut, clientes.nombre, facturas.precio_total FROM facturas INNER JOIN cliente_factura ON facturas.num_factura=cliente_factura.factura_num_factura LEFT JOIN clientes ON cliente_factura.cliente_id=clientes.id ORDER BY precio_total DESC LIMIT 1;
    --¿Que cliente pagó sobre 100 de monto?
    SELECT clientes.id, clientes.rut, clientes.nombre, clientes.direccion FROM facturas INNER JOIN cliente_factura ON facturas.num_factura=cliente_factura.factura_num_factura LEFT JOIN clientes ON cliente_factura.cliente_id=clientes.id WHERE precio_total>100 GROUP BY clientes.id, clientes.rut, clientes.nombre, clientes.direccion ORDER BY 1 ASC
    
    --¿Cuantos clientes han comprado el producto 6?.
    SELECT COUNT(clientes.id) FROM clientes
        INNER JOIN cliente_factura ON clientes.id=cliente_factura.cliente_id
        RIGHT JOIN factura_detalle ON cliente_factura.factura_num_factura=factura_detalle.factura_num_factura
        LEFT JOIN detalles ON factura_detalle.detalle_id=detalles.id
    WHERE detalles.producto_id=6;