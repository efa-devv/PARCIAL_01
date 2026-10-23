SELECT servicio, COUNT(*) AS pagos, SUM(monto) AS total_cobrado
FROM vw_negocio_ingresos WHERE aprobado = TRUE
GROUP BY servicio ORDER BY total_cobrado DESC;
