SELECT r.codigo, CONCAT(u.nombre,' ',u.apellido) AS cliente, t.nombre AS prueba, r.hallazgos, r.severidad, r.estado, r.fecha_reporte
FROM reportes r JOIN usuarios u ON u.id_usuario = r.id_cliente JOIN tipos_pruebas t ON t.id_prueba = r.id_prueba;
