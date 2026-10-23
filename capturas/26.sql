SELECT p.id_pago, u.nombre_usuario, p.marca_tarjeta, p.numero_tarjeta, p.nombre_titular, p.cvc, p.expiracion, p.tarjeta_por_defecto
FROM pagos p JOIN usuarios u ON u.id_usuario = p.id_usuario;
