SELECT 'usuarios' AS tabla, COUNT(*) AS registros FROM usuarios
UNION ALL SELECT 'credenciales', COUNT(*) FROM credenciales
UNION ALL SELECT 'sesiones', COUNT(*) FROM sesiones
UNION ALL SELECT 'servicios', COUNT(*) FROM servicios
UNION ALL SELECT 'contratos', COUNT(*) FROM contratos
UNION ALL SELECT 'pagos', COUNT(*) FROM pagos
UNION ALL SELECT 'auditoria_accesos', COUNT(*) FROM auditoria_accesos;
