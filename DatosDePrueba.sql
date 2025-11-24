-- Script SQL para añadir MÁS DATOS DE PRUEBA a Recyclon
-- Este script usa los IDs REALES de la base de datos

USE Pubs;
GO

-- =============================================
-- MÁS USUARIOS (Clientes)
-- =============================================
INSERT INTO Usuario (username, password, nombre, apellidos, email, telefono, direccion, rol) VALUES
('ana.lopez', 'ana123', 'Ana', 'López Sánchez', 'ana.lopez@email.com', '645678901', 'C/ Ecológica 45, Madrid', 'CLIENTE'),
('carlos.diaz', 'carlos123', 'Carlos', 'Díaz Moreno', 'carlos.diaz@email.com', '656789012', 'Av. Verde 78, Bilbao', 'CLIENTE'),
('laura.gomez', 'laura123', 'Laura', 'Gómez Torres', 'laura.gomez@email.com', '667890123', 'Plaza Sostenible 12, Zaragoza', 'CLIENTE'),
('miguel.ruiz', 'miguel123', 'Miguel', 'Ruiz Navarro', 'miguel.ruiz@email.com', '678901234', 'C/ Renovable 33, Málaga', 'CLIENTE'),
('sofia.martin', 'sofia123', 'Sofía', 'Martín Castro', 'sofia.martin@email.com', '689012345', 'Av. Naturaleza 56, Granada', 'CLIENTE'),
('admin2', 'admin123', 'Admin', 'Secundario', 'admin2@recyclon.com', '900987654', 'C/ Gestión 10, Madrid', 'ADMIN');
GO

-- =============================================
-- MÁS CATEGORÍAS
-- =============================================
INSERT INTO categoria (nombre, descripcion) VALUES
('Accesorios de Escritorio', 'Complementos y accesorios ecológicos para el escritorio'),
('Almacenamiento', 'Cajas, contenedores y soluciones de almacenamiento sostenibles'),
('Presentación Ecológica', 'Material para presentaciones y exposiciones sostenibles');
GO

-- =============================================
-- VARIABLES PARA ALMACENAR IDs REALES
-- =============================================
DECLARE @cat1 INT, @cat2 INT, @cat3 INT, @cat4 INT, @cat5 INT, @cat6 INT, @cat7 INT;

-- Obtener IDs reales de categorías
SELECT @cat1 = id FROM categoria WHERE nombre = 'Papel Reciclado';
SELECT @cat2 = id FROM categoria WHERE nombre = 'Escritura Ecológica';
SELECT @cat3 = id FROM categoria WHERE nombre = 'Organización Sostenible';
SELECT @cat4 = id FROM categoria WHERE nombre = 'Material de Oficina';
SELECT @cat5 = id FROM categoria WHERE nombre = 'Accesorios de Escritorio';
SELECT @cat6 = id FROM categoria WHERE nombre = 'Almacenamiento';
SELECT @cat7 = id FROM categoria WHERE nombre = 'Presentación Ecológica';

-- =============================================
-- MÁS PRODUCTOS usando IDs reales
-- =============================================

-- Más productos de Papel Reciclado
INSERT INTO productos (nombre, descripcion, precio, stock, imagen, id_categoria) VALUES
('Libreta Tamaño Bolsillo', 'Libreta A6 de 60 hojas papel reciclado', 2.80, 220, 'https://images.unsplash.com/photo-1517842645767-c639042777db?w=400', @cat1),
('Agenda 2025 Ecológica', 'Agenda anual tamaño A5, papel 100% reciclado', 12.50, 85, 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=400', @cat1),
('Post-it Reciclados', 'Pack 4 blocs notas adhesivas recicladas colores', 5.20, 160, 'https://images.unsplash.com/photo-1586075010923-2dd4570fb338?w=400', @cat1),
('Cuaderno Espiral A5', 'Cuaderno espiral 120 hojas microperforadas recicladas', 6.30, 95, 'https://images.unsplash.com/photo-1531346878377-a5be20888e57?w=400', @cat1),

-- Más productos de Escritura Ecológica
('Rotuladores Punta Fina', 'Set 10 rotuladores punta fina colores, tinta lavable', 8.90, 70, 'https://images.unsplash.com/photo-1560015534-cee980ba7e36?w=400', @cat2),
('Subrayadores Ecológicos', 'Pack 4 subrayadores fluorescentes biodegradables', 4.75, 130, 'https://images.unsplash.com/photo-1586075010923-2dd4570fb338?w=400', @cat2),
('Pluma Estilográfica Bambú', 'Pluma estilográfica cuerpo bambú con cartuchos recargables', 15.50, 45, 'https://images.unsplash.com/photo-1455390582262-044cdead277a?w=400', @cat2),
('Portaminas Ecológico', 'Portaminas 0.7mm cuerpo madera reciclada', 3.80, 110, 'https://images.unsplash.com/photo-1513542789411-b6a5d4f31634?w=400', @cat2),

-- Más productos de Organización Sostenible
('Bandejas Apilables', 'Set 3 bandejas apilables cartón prensado reciclado', 14.20, 55, 'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?w=400', @cat3),
('Separadores de Cartón', 'Pack 10 separadores A4 cartón reciclado colores', 3.60, 140, 'https://images.unsplash.com/photo-1544816155-12df9643f363?w=400', @cat3),
('Portadocumentos A4', 'Portadocumentos con cierre elástico, plástico reciclado', 2.90, 200, 'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=400', @cat3),

-- Más productos de Material de Oficina
('Perforadora Ecológica', 'Perforadora 2 taladros capacidad 30 hojas, metal reciclado', 9.80, 65, 'https://images.unsplash.com/photo-1564594634551-2f6fd3a47abe?w=400', @cat4),
('Tijeras Profesionales', 'Tijeras 21cm acero inoxidable reciclado', 7.50, 90, 'https://images.unsplash.com/photo-1590486145762-87fc47a05808?w=400', @cat4),
('Regla de Madera 30cm', 'Regla madera reciclada certificada FSC', 2.20, 180, 'https://images.unsplash.com/photo-1513542789411-b6a5d4f31634?w=400', @cat4),
('Cúter Metálico', 'Cúter profesional cuerpo metálico reciclado', 4.90, 100, 'https://images.unsplash.com/photo-1572297794754-c7a8c45a3ff4?w=400', @cat4),
('Gomas de Borrar', 'Pack 5 gomas de borrar caucho natural', 1.80, 250, 'https://images.unsplash.com/photo-1625225233840-695456021cde?w=400', @cat4),

-- Productos de Accesorios de Escritorio
('Portalápices Bambú', 'Organizador de escritorio bambú 4 compartimentos', 11.50, 75, 'https://images.unsplash.com/photo-1586075010923-2dd4570fb338?w=400', @cat5),
('Soporte para Móvil', 'Soporte ajustable madera reciclada', 8.20, 95, 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=400', @cat5),
('Calendario de Mesa', 'Calendario perpetuo madera sostenible', 9.90, 60, 'https://images.unsplash.com/photo-1506784983877-45594efa4cbe?w=400', @cat5),
('Alfombrilla Ratón Corcho', 'Alfombrilla ratón corcho natural rectangular', 6.50, 120, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400', @cat5),

-- Productos de Almacenamiento
('Cajas Archivo Cartón', 'Pack 5 cajas archivo dorso 10cm cartón reciclado', 16.80, 40, 'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?w=400', @cat6),
('Revistero Vertical', 'Revistero 3 compartimentos cartón prensado', 7.40, 85, 'https://images.unsplash.com/photo-1544816155-12df9643f363?w=400', @cat6),
('Organizador Cajones', 'Separadores modulares cajón plástico reciclado', 5.60, 110, 'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=400', @cat6),
('Carpeta Colgante Pack', 'Pack 25 carpetas colgantes cartón reciclado', 19.50, 35, 'https://images.unsplash.com/photo-1544816155-12df9643f363?w=400', @cat6),

-- Productos de Presentación Ecológica
('Fundas Portafolios A4', 'Pack 100 fundas transparentes recicladas multitaladro', 8.50, 90, 'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=400', @cat7),
('Dossier con Pinza', 'Dossier A4 con pinza lateral cartón reciclado', 1.50, 300, 'https://images.unsplash.com/photo-1544816155-12df9643f363?w=400', @cat7),
('Pizarra Corcho 60x40', 'Pizarra tablón anuncios corcho natural marco madera', 22.50, 25, 'https://images.unsplash.com/photo-1611162617213-7d7a39e9b1d7?w=400', @cat7),
('Rotafolios Ecológico', 'Bloc rotafolios 20 hojas papel reciclado 68x98cm', 14.90, 30, 'https://images.unsplash.com/photo-1586075010923-2dd4570fb338?w=400', @cat7);

GO

-- =============================================
-- MÁS PEDIDOS usando IDs reales de usuarios
-- =============================================

DECLARE @ana INT, @carlos INT, @laura INT, @miguel INT, @sofia INT, @cliente1 INT;

-- Obtener IDs reales de usuarios
SELECT @ana = id FROM Usuario WHERE username = 'ana.lopez';
SELECT @carlos = id FROM Usuario WHERE username = 'carlos.diaz';
SELECT @laura = id FROM Usuario WHERE username = 'laura.gomez';
SELECT @miguel = id FROM Usuario WHERE username = 'miguel.ruiz';
SELECT @sofia = id FROM Usuario WHERE username = 'sofia.martin';
SELECT @cliente1 = id FROM Usuario WHERE username = 'cliente1';

-- Pedidos de Ana López
INSERT INTO pedidos (fechaPedido, total, estado, id_usuario) VALUES
(DATEADD(day, -10, GETDATE()), 38.50, 'ENTREGADO', @ana),
(DATEADD(day, -3, GETDATE()), 27.90, 'ENVIADO', @ana);

-- Pedidos de Carlos Díaz
INSERT INTO pedidos (fechaPedido, total, estado, id_usuario) VALUES
(DATEADD(day, -8, GETDATE()), 52.30, 'ENTREGADO', @carlos),
(DATEADD(hour, -12, GETDATE()), 19.80, 'PENDIENTE', @carlos);

-- Pedidos de Laura Gómez
INSERT INTO pedidos (fechaPedido, total, estado, id_usuario) VALUES
(DATEADD(day, -15, GETDATE()), 71.40, 'ENTREGADO', @laura),
(DATEADD(day, -4, GETDATE()), 33.60, 'PROCESANDO', @laura);

-- Pedidos de Miguel Ruiz
INSERT INTO pedidos (fechaPedido, total, estado, id_usuario) VALUES
(DATEADD(day, -6, GETDATE()), 44.20, 'ENVIADO', @miguel);

-- Pedidos de Sofía Martín
INSERT INTO pedidos (fechaPedido, total, estado, id_usuario) VALUES
(DATEADD(day, -20, GETDATE()), 89.70, 'ENTREGADO', @sofia),
(DATEADD(day, -7, GETDATE()), 56.30, 'ENTREGADO', @sofia),
(DATEADD(hour, -6, GETDATE()), 12.50, 'PENDIENTE', @sofia);

-- Otro pedido del cliente1
INSERT INTO pedidos (fechaPedido, total, estado, id_usuario) VALUES
(DATEADD(hour, -3, GETDATE()), 28.70, 'PENDIENTE', @cliente1);

GO

-- =============================================
-- LÍNEAS DE PEDIDO usando nombres para buscar IDs
-- =============================================

DECLARE @pedidoId INT, @productoId INT;

-- Obtener el último pedido de Ana (hace 10 días) - debería ser el penúltimo que insertamos
SELECT TOP 1 @pedidoId = id FROM pedidos WHERE id_usuario = (SELECT id FROM Usuario WHERE username = 'ana.lopez') ORDER BY fechaPedido DESC OFFSET 1 ROWS;

-- Obtener IDs de productos por nombre
INSERT INTO lineas_pedido (id_pedido, id_producto, cantidad, precioUnitario, subtotal)
SELECT @pedidoId, id, 2, 2.80, 5.60 FROM productos WHERE nombre = 'Libreta Tamaño Bolsillo'
UNION ALL
SELECT @pedidoId, id, 1, 12.50, 12.50 FROM productos WHERE nombre = 'Agenda 2025 Ecológica'
UNION ALL
SELECT @pedidoId, id, 2, 6.30, 12.60 FROM productos WHERE nombre = 'Cuaderno Espiral A5'
UNION ALL
SELECT @pedidoId, id, 1, 4.75, 4.75 FROM productos WHERE nombre = 'Subrayadores Ecológicos';

-- Segundo pedido de Ana (hace 3 días)
SELECT TOP 1 @pedidoId = id FROM pedidos WHERE id_usuario = (SELECT id FROM Usuario WHERE username = 'ana.lopez') ORDER BY fechaPedido DESC;

INSERT INTO lineas_pedido (id_pedido, id_producto, cantidad, precioUnitario, subtotal)
SELECT @pedidoId, id, 1, 15.50, 15.50 FROM productos WHERE nombre = 'Pluma Estilográfica Bambú'
UNION ALL
SELECT @pedidoId, id, 1, 9.80, 9.80 FROM productos WHERE nombre = 'Perforadora Ecológica';

-- Más líneas de pedido para otros usuarios (simplificado)
-- Puedes añadir más siguiendo el mismo patrón

GO

-- =============================================
-- CONSULTAS DE VERIFICACIÓN
-- =============================================

PRINT '=== RESUMEN DE DATOS ===';
PRINT '';

SELECT 'Total Usuarios: ' + CAST(COUNT(*) AS VARCHAR) AS Resumen FROM Usuario;
SELECT 'Total Categorías: ' + CAST(COUNT(*) AS VARCHAR) AS Resumen FROM categoria;
SELECT 'Total Productos: ' + CAST(COUNT(*) AS VARCHAR) AS Resumen FROM productos;
SELECT 'Total Pedidos: ' + CAST(COUNT(*) AS VARCHAR) AS Resumen FROM pedidos;
SELECT 'Total Líneas de Pedido: ' + CAST(COUNT(*) AS VARCHAR) AS Resumen FROM lineas_pedido;

PRINT '';
PRINT '=== PRODUCTOS POR CATEGORÍA ===';
SELECT c.nombre AS Categoria, COUNT(p.id) AS Total_Productos
FROM categoria c
LEFT JOIN productos p ON c.id = p.id_categoria
GROUP BY c.nombre
ORDER BY c.nombre;

PRINT '';
PRINT '=== PEDIDOS POR USUARIO (Clientes) ===';
SELECT u.nombre + ' ' + ISNULL(u.apellidos, '') AS Cliente, COUNT(p.id) AS Total_Pedidos
FROM Usuario u
LEFT JOIN pedidos p ON u.id = p.id_usuario
WHERE u.rol = 'CLIENTE'
GROUP BY u.nombre, u.apellidos
ORDER BY COUNT(p.id) DESC;

PRINT '';
PRINT '=== PRODUCTOS CON STOCK BAJO (menos de 50) ===';
SELECT nombre, stock, precio
FROM productos
WHERE stock < 50
ORDER BY stock;

GO

PRINT '';
PRINT '✅ Datos de prueba adicionales insertados correctamente';
GO

-- Script simple para agregar líneas de pedido a los nuevos pedidos

DECLARE @pedidoAna1 INT, @pedidoAna2 INT;
DECLARE @pedidoCarlos1 INT, @pedidoCarlos2 INT;
DECLARE @pedidoLaura1 INT, @pedidoLaura2 INT;

-- Obtener IDs de pedidos recientes por usuario
SELECT @pedidoAna1 = MIN(id) FROM pedidos WHERE id_usuario = (SELECT id FROM Usuario WHERE username = 'ana.lopez');
SELECT @pedidoAna2 = MAX(id) FROM pedidos WHERE id_usuario = (SELECT id FROM Usuario WHERE username = 'ana.lopez');

SELECT @pedidoCarlos1 = MIN(id) FROM pedidos WHERE id_usuario = (SELECT id FROM Usuario WHERE username = 'carlos.diaz');
SELECT @pedidoCarlos2 = MAX(id) FROM pedidos WHERE id_usuario = (SELECT id FROM Usuario WHERE username = 'carlos.diaz');

SELECT @pedidoLaura1 = MIN(id) FROM pedidos WHERE id_usuario = (SELECT id FROM Usuario WHERE username = 'laura.gomez');
SELECT @pedidoLaura2 = MAX(id) FROM pedidos WHERE id_usuario = (SELECT id FROM Usuario WHERE username = 'laura.gomez');

-- Líneas para pedidos de Ana
INSERT INTO lineas_pedido (id_pedido, id_producto, cantidad, precioUnitario, subtotal)
SELECT @pedidoAna1, id, 2, 2.80, 5.60 FROM productos WHERE nombre = 'Libreta Tamaño Bolsillo'
UNION ALL
SELECT @pedidoAna1, id, 1, 12.50, 12.50 FROM productos WHERE nombre = 'Agenda 2025 Ecológica'
UNION ALL
SELECT @pedidoAna2, id, 1, 15.50, 15.50 FROM productos WHERE nombre = 'Pluma Estilográfica Bambú';

-- Líneas para pedidos de Carlos
INSERT INTO lineas_pedido (id_pedido, id_producto, cantidad, precioUnitario, subtotal)
SELECT @pedidoCarlos1, id, 2, 12.50, 25.00 FROM productos WHERE nombre = 'Agenda 2025 Ecológica'
UNION ALL
SELECT @pedidoCarlos2, id, 2, 5.20, 10.40 FROM productos WHERE nombre = 'Post-it Reciclados';

-- Líneas para pedidos de Laura
INSERT INTO lineas_pedido (id_pedido, id_producto, cantidad, precioUnitario, subtotal)
SELECT @pedidoLaura1, id, 2, 16.80, 33.60 FROM productos WHERE nombre = 'Cajas Archivo Cartón'
UNION ALL
SELECT @pedidoLaura2, id, 1, 22.50, 22.50 FROM productos WHERE nombre = 'Pizarra Corcho 60x40';

PRINT 'Líneas de pedido agregadas correctamente';
GO