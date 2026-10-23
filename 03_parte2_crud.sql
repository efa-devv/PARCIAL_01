-- PARTE II - CRUD sobre la entidad principal: usuarios
USE servicios_digitales;

-- CREATE: registrar un usuario nuevo
INSERT INTO usuarios (nombre,apellido,correo,telefono,rol,activo,fecha_registro,referido_por)
VALUES ('Alexis','Luo','alexis.luo@correo.com','61234567','cliente',TRUE,CURDATE(),3);
SELECT * FROM usuarios WHERE correo = 'alexis.luo@correo.com';

-- READ: clientes activos registrados en 2025, ordenados por apellido
SELECT id_usuario, nombre, apellido, correo, rol
FROM usuarios
WHERE rol = 'cliente' AND activo = TRUE AND YEAR(fecha_registro) = 2025
ORDER BY apellido;

-- UPDATE: cambio de telefono controlado por la clave primaria
UPDATE usuarios SET telefono = '67778888' WHERE id_usuario = 16;
SELECT id_usuario, nombre, telefono FROM usuarios WHERE id_usuario = 16;

-- DELETE logico: se desactiva en vez de borrar (tiene sesiones, contratos y pagos asociados)
UPDATE usuarios SET activo = FALSE WHERE id_usuario = 16;
SELECT id_usuario, nombre, apellido, activo FROM usuarios WHERE id_usuario = 16;
