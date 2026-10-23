UPDATE usuarios SET telefono = '67778888' WHERE id_usuario = 16;
SELECT id_usuario, nombre, telefono FROM usuarios WHERE id_usuario = 16;
UPDATE usuarios SET activo = FALSE WHERE id_usuario = 16;
SELECT id_usuario, nombre, apellido, activo FROM usuarios WHERE id_usuario = 16;
