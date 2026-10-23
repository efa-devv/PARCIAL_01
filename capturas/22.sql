SELECT 'usuarios' AS modulo, COUNT(*) AS registros FROM usuarios
UNION ALL SELECT 'autenticacion', COUNT(*) FROM autenticacion
UNION ALL SELECT 'tipos_pruebas', COUNT(*) FROM tipos_pruebas
UNION ALL SELECT 'pagos', COUNT(*) FROM pagos
UNION ALL SELECT 'reportes', COUNT(*) FROM reportes;
