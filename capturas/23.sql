SELECT id_usuario, nombre, apellido, nombre_usuario, ciudad, sexo, estado_civil, tipo_empresa, tipo_usuario FROM usuarios;
SELECT tipo_usuario, COUNT(*) AS cantidad FROM usuarios GROUP BY tipo_usuario;
