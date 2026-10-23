-- PARTE II - VISTAS
USE servicios_digitales;

-- 1. Vista de negocio: usuarios + servicios + pagos
CREATE OR REPLACE VIEW vw_negocio_ingresos AS
SELECT u.id_usuario, CONCAT(u.nombre,' ',u.apellido) AS cliente,
       s.nombre AS servicio, c.plan, c.estado AS estado_contrato,
       p.referencia, p.monto, p.metodo, p.aprobado, p.fecha_pago
FROM usuarios u
JOIN contratos c ON c.id_usuario = u.id_usuario
JOIN servicios s ON s.id_servicio = c.id_servicio
JOIN pagos p     ON p.id_contrato = c.id_contrato;

-- 2. Vista de seguridad: sin password_hash ni token
CREATE OR REPLACE VIEW vw_seguridad_usuarios AS
SELECT u.id_usuario, u.nombre, u.apellido, u.correo, u.rol, u.activo,
       cr.username, cr.metodo_2fa, cr.bloqueada
FROM usuarios u
JOIN credenciales cr ON cr.id_usuario = u.id_usuario;

-- 3. Vista de auditoria: accesos con estado del usuario
CREATE OR REPLACE VIEW vw_auditoria_accesos AS
SELECT a.codigo_evento, a.fecha_evento, cr.username, a.accion, a.exitoso,
       a.ip_origen, u.activo AS usuario_activo, cr.bloqueada
FROM auditoria_accesos a
JOIN usuarios u ON u.id_usuario = a.id_usuario
LEFT JOIN credenciales cr ON cr.id_usuario = a.id_usuario;

SHOW FULL TABLES WHERE Table_type = 'VIEW';

-- Uso real de las vistas
SELECT servicio, COUNT(*) AS pagos, SUM(monto) AS total_cobrado
FROM vw_negocio_ingresos WHERE aprobado = TRUE
GROUP BY servicio ORDER BY total_cobrado DESC;

SELECT * FROM vw_seguridad_usuarios LIMIT 10;

SELECT * FROM vw_auditoria_accesos WHERE exitoso = FALSE ORDER BY fecha_evento;
