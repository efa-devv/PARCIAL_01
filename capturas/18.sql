SELECT * FROM vw_seguridad_usuarios LIMIT 10;
SELECT * FROM vw_auditoria_accesos WHERE exitoso = FALSE ORDER BY fecha_evento;
