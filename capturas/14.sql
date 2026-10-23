SELECT id_usuario, nombre, apellido, correo, rol
FROM usuarios
WHERE rol = 'cliente' AND activo = TRUE AND YEAR(fecha_registro) = 2025
ORDER BY apellido;
