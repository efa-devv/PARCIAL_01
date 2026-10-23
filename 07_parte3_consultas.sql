-- PARTE III - Consultas de verificacion de cada modulo
USE pixel_security_360;
SELECT id_usuario, nombre, apellido, nombre_usuario, ciudad, sexo, estado_civil, tipo_empresa, tipo_usuario FROM usuarios;
SELECT tipo_usuario, COUNT(*) AS cantidad FROM usuarios GROUP BY tipo_usuario;
SELECT id_autenticacion, nombre_usuario, agente_usuario, token, fecha_acceso FROM autenticacion;
SELECT referencia, nombre, fecha_ingreso, estado FROM tipos_pruebas;
SELECT referencia, nombre, descripcion FROM tipos_pruebas WHERE referencia IN ('PT-001','PT-002','PT-003','PT-004');
SELECT p.id_pago, u.nombre_usuario, p.marca_tarjeta, p.numero_tarjeta, p.nombre_titular, p.cvc, p.expiracion, p.tarjeta_por_defecto
FROM pagos p JOIN usuarios u ON u.id_usuario = p.id_usuario;
SELECT r.codigo, CONCAT(u.nombre,' ',u.apellido) AS cliente, t.nombre AS prueba, r.hallazgos, r.severidad, r.estado, r.fecha_reporte
FROM reportes r JOIN usuarios u ON u.id_usuario = r.id_cliente JOIN tipos_pruebas t ON t.id_prueba = r.id_prueba;
