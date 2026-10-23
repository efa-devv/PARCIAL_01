INSERT INTO usuarios (nombre,apellido,correo,telefono,rol,activo,fecha_registro,referido_por)
VALUES ('Alexis','Luo','alexis.luo@correo.com','61234567','cliente',TRUE,CURDATE(),3);
SELECT * FROM usuarios WHERE correo = 'alexis.luo@correo.com';
