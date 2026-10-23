SELECT c.id_contrato, u.nombre, s.nombre AS servicio, c.plan, p.referencia, p.monto, p.aprobado
FROM contratos c JOIN usuarios u ON u.id_usuario=c.id_usuario
JOIN servicios s ON s.id_servicio=c.id_servicio JOIN pagos p ON p.id_contrato=c.id_contrato;
