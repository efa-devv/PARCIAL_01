-- PARTE II - DML
USE servicios_digitales;

INSERT INTO usuarios (nombre,apellido,correo,telefono,rol,activo,fecha_registro,referido_por) VALUES
('Carlos','González','carlos.gonzalez@correo.com','62792285','administrador',TRUE,'2025-01-01',NULL),
('María','Rodríguez','maria.rodriguez@correo.com','69843470','soporte',TRUE,'2025-02-03',NULL),
('José','Pérez','jose.perez@correo.com','65142886','cliente',TRUE,'2025-03-05',NULL),
('Ana','Castillo','ana.castillo@correo.com','65291201','cliente',TRUE,'2025-04-07',2),
('Luis','Batista','luis.batista@correo.com','62218459','cliente',TRUE,'2025-05-09',3),
('Sofía','Herrera','sofia.herrera@correo.com','66083294','cliente',TRUE,'2025-06-11',4),
('Miguel','Samaniego','miguel.samaniego@correo.com','67655079','cliente',TRUE,'2025-07-13',4),
('Valeria','Moreno','valeria.moreno@correo.com','62986415','cliente',TRUE,'2025-08-15',4),
('Jorge','Vásquez','jorge.vasquez@correo.com','64745783','cliente',TRUE,'2025-09-17',5),
('Daniela','Jaén','daniela.jaen@correo.com','67006791','cliente',FALSE,'2025-10-19',6),
('Ricardo','Cedeño','ricardo.cedeno@correo.com','67051040','cliente',TRUE,'2025-11-21',5),
('Gabriela','Ortega','gabriela.ortega@correo.com','69661551','cliente',TRUE,'2025-12-23',11),
('Andrés','Quintero','andres.quintero@correo.com','63701978','cliente',TRUE,'2025-01-25',3),
('Paola','Barría','paola.barria@correo.com','65619271','cliente',FALSE,'2025-02-27',9),
('Fernando','Sánchez','fernando.sanchez@correo.com','61177927','cliente',TRUE,'2025-03-02',3);

INSERT INTO credenciales (id_usuario,username,password_hash,metodo_2fa,bloqueada,intentos_fallidos) VALUES
(1,'cgonzalez','07de0a79c0a51f63c7ebdb2d3b65683887d6c2b22702ae44223f5cd42d81f0cd','app',FALSE,0),
(2,'mrodriguez','704c4fc63a6f738b4bec977bd2496709435dfe90265027d2ad381c60bd2e6744','ninguno',FALSE,2),
(3,'jperez','4229bb5243aac89b404887795a0d94ea6d9dd2bd51aad7fe168182d1275271a5','sms',FALSE,0),
(4,'acastillo','92f14677d33eec2f84e22f6bc43080637badd0133f27e346ce4c0ba73f956587','ninguno',FALSE,1),
(5,'lbatista','b58a6a6e3dd8496f196dfc710b5ce20db571599447f5d3140d98e1a975faba32','ninguno',FALSE,1),
(6,'sherrera','f9e2bc11baaee9bbd6aa52b7e655eb2584967d232d65a92d14f419aab25e5def','sms',FALSE,2),
(7,'msamaniego','f6daa8bf26b3231a087e4bb0ca21c959f645c94dd5a90c3de170aa7759c34cf1','sms',FALSE,2),
(8,'vmoreno','872938fcb520c6d879d9d7ba235a2b080c608fbb935ab164fccc8d02d0bbf450','ninguno',FALSE,2),
(9,'jvasquez','57239bb41848726ea196fabb261ad39786b79ba0cf7a2d2e5ceebca57cb6f4b7','app',FALSE,0),
(10,'djaen','9a8c718e3402484a65cb40ce24a914ea79011b797e81ef4618bf423ee782445f','app',FALSE,2),
(11,'rcedeno','2e8e306d7b72b2701581e2247bf65957abacbc9ce3f9bbf5350c1f14a90ef98b','app',FALSE,2),
(12,'gortega','a0938f16188cbe506dfa05a6fb88a65dbcc803c495f51139c6ee63634543aabd','sms',FALSE,0),
(13,'aquintero','fc2919789092870e4665a7374829f4037e338adda2d3fae3c9ec3d222c36b157','ninguno',FALSE,2),
(14,'pbarria','7993a35959dd042faf0daab23c0762aaf62c11a1a7283d172340e2f68bb230ac','sms',TRUE,5),
(15,'fsanchez','a90698e674b5df054f96bfe8706f65ff5694cbe79e8bb45895c82f53977dca99','app',FALSE,2);

INSERT INTO sesiones (id_usuario,token,dispositivo,plataforma,activa,fecha_inicio,fecha_expira) VALUES
(1,'cfcd208495d565ef66e7dff9f98764da','Xiaomi Redmi Note 12','android',FALSE,'2026-09-01 08:15:00','2026-09-02 08:15:00'),
(2,'c4ca4238a0b923820dcc509a6f75849b','iPhone 15 Pro','ios',TRUE,'2026-09-02 09:15:00','2026-09-03 09:15:00'),
(3,'c81e728d9d4c2f636f067f89cc14862c','Motorola G84','android',TRUE,'2026-09-03 10:15:00','2026-09-04 10:15:00'),
(4,'eccbc87e4b5ce2fe28308fd9f2a7baf3','iPad 10','ios',FALSE,'2026-09-04 11:15:00','2026-09-05 11:15:00'),
(5,'a87ff679a2f3e71d9181a67b7542122c','Xiaomi Redmi Note 12','android',TRUE,'2026-09-05 12:15:00','2026-09-06 12:15:00'),
(6,'e4da3b7fbbce2345d7772b0674a318d5','Motorola G84','android',TRUE,'2026-09-06 13:15:00','2026-09-07 13:15:00'),
(7,'1679091c5a880faf6fb5e6087eb1b2dc','iPhone 15 Pro','ios',FALSE,'2026-09-07 14:15:00','2026-09-08 14:15:00'),
(8,'8f14e45fceea167a5a36dedd4bea2543','PC Escritorio Lenovo','web',TRUE,'2026-09-08 15:15:00','2026-09-09 15:15:00'),
(9,'c9f0f895fb98ab9159f51fd0297e236d','iPhone 15 Pro','ios',TRUE,'2026-09-09 16:15:00','2026-09-10 16:15:00'),
(10,'45c48cce2e2d7fbdea1afc51c7c6ad26','iPhone 13','ios',FALSE,'2026-09-10 17:15:00','2026-09-11 17:15:00'),
(11,'d3d9446802a44259755d38e6d163e820','iPhone 13','ios',TRUE,'2026-09-11 08:15:00','2026-09-12 08:15:00'),
(12,'6512bd43d9caa6e02c990b0a82652dca','iPhone 13','ios',TRUE,'2026-09-12 09:15:00','2026-09-13 09:15:00'),
(13,'c20ad4d76fe97759aa27a0c99bff6710','iPhone 15 Pro','ios',FALSE,'2026-09-13 10:15:00','2026-09-14 10:15:00'),
(14,'c51ce410c124a10e0db5e4b97fc2af39','iPhone 15 Pro','ios',TRUE,'2026-09-14 11:15:00','2026-09-15 11:15:00'),
(15,'aab3238922bcc25a6f606eb525ffdc56','iPhone 13','ios',TRUE,'2026-09-15 12:15:00','2026-09-16 12:15:00');

INSERT INTO servicios (codigo,nombre,categoria,precio_mensual,disponible,id_responsable) VALUES
('HOST-B','Hosting Básico','hosting',4.99,TRUE,1),
('HOST-P','Hosting Pro','hosting',12.50,TRUE,2),
('MAIL-5','Correo Corporativo 5 cuentas','correo',9.00,TRUE,1),
('MAIL-20','Correo Corporativo 20 cuentas','correo',29.00,TRUE,2),
('CLD-100','Almacenamiento 100 GB','almacenamiento',2.99,TRUE,1),
('CLD-1T','Almacenamiento 1 TB','almacenamiento',9.99,TRUE,2),
('VPN-IND','VPN Individual','vpn',5.50,TRUE,1),
('VPN-EMP','VPN Empresarial','vpn',45.00,TRUE,2),
('BKP-D','Backup Diario','backup',15.00,TRUE,1),
('BKP-S','Backup Semanal','backup',7.00,FALSE,2),
('SEC-WAF','Firewall de Aplicaciones Web','seguridad',35.00,TRUE,1),
('SEC-AV','Antivirus Corporativo','seguridad',18.00,TRUE,2),
('SEC-SSL','Certificado SSL','seguridad',6.00,TRUE,1),
('HOST-V','Servidor VPS','hosting',25.00,TRUE,2),
('CLD-5T','Almacenamiento 5 TB','almacenamiento',39.99,FALSE,1);

INSERT INTO contratos (id_usuario,id_servicio,plan,renovacion_auto,fecha_inicio,estado) VALUES
(3,3,'anual',FALSE,'2026-01-01','activo'),
(9,2,'anual',TRUE,'2026-02-02','activo'),
(11,10,'mensual',TRUE,'2026-03-03','activo'),
(9,8,'anual',TRUE,'2026-04-04','activo'),
(5,9,'trimestral',FALSE,'2026-05-05','activo'),
(10,5,'trimestral',TRUE,'2026-06-06','activo'),
(10,7,'trimestral',TRUE,'2026-07-07','activo'),
(12,14,'mensual',TRUE,'2026-08-08','cancelado'),
(7,8,'trimestral',FALSE,'2026-09-09','activo'),
(6,8,'anual',TRUE,'2026-01-10','activo'),
(10,2,'anual',TRUE,'2026-02-11','activo'),
(5,8,'anual',TRUE,'2026-03-12','suspendido'),
(7,10,'trimestral',FALSE,'2026-04-13','activo'),
(3,14,'anual',TRUE,'2026-05-14','activo'),
(9,7,'mensual',TRUE,'2026-06-15','activo');

INSERT INTO pagos (id_contrato,referencia,monto,metodo,aprobado,fecha_pago) VALUES
(1,'PAG-2026-0001',108.00,'yappy',TRUE,'2026-01-01 09:30:00'),
(2,'PAG-2026-0002',150.00,'yappy',TRUE,'2026-02-02 10:30:00'),
(3,'PAG-2026-0003',7.00,'paypal',TRUE,'2026-03-03 11:30:00'),
(4,'PAG-2026-0004',540.00,'yappy',TRUE,'2026-04-04 12:30:00'),
(5,'PAG-2026-0005',45.00,'yappy',FALSE,'2026-05-05 13:30:00'),
(6,'PAG-2026-0006',8.97,'yappy',TRUE,'2026-06-06 14:30:00'),
(7,'PAG-2026-0007',16.50,'transferencia',TRUE,'2026-07-07 15:30:00'),
(8,'PAG-2026-0008',25.00,'tarjeta',TRUE,'2026-08-08 16:30:00'),
(9,'PAG-2026-0009',135.00,'paypal',TRUE,'2026-09-09 09:30:00'),
(10,'PAG-2026-0010',540.00,'yappy',TRUE,'2026-01-10 10:30:00'),
(11,'PAG-2026-0011',150.00,'tarjeta',TRUE,'2026-02-11 11:30:00'),
(12,'PAG-2026-0012',540.00,'paypal',FALSE,'2026-03-12 12:30:00'),
(13,'PAG-2026-0013',21.00,'tarjeta',TRUE,'2026-04-13 13:30:00'),
(14,'PAG-2026-0014',300.00,'tarjeta',TRUE,'2026-05-14 14:30:00'),
(15,'PAG-2026-0015',5.50,'transferencia',TRUE,'2026-06-15 15:30:00');

INSERT INTO auditoria_accesos (codigo_evento,id_usuario,accion,exitoso,ip_origen,fecha_evento) VALUES
('EV-1000',5,'login',TRUE,'190.36.0.151','2026-10-01 07:00:00'),
('EV-1001',9,'logout',TRUE,'190.102.183.254','2026-10-02 08:07:00'),
('EV-1002',5,'login_fallido',FALSE,'190.59.17.245','2026-10-03 09:14:00'),
('EV-1003',3,'login',TRUE,'190.228.101.1','2026-10-04 10:21:00'),
('EV-1004',4,'cambio_password',TRUE,'190.94.135.47','2026-10-05 11:28:00'),
('EV-1005',4,'login',TRUE,'190.83.169.75','2026-10-06 12:35:00'),
('EV-1006',14,'login_fallido',FALSE,'190.214.188.9','2026-10-07 13:42:00'),
('EV-1007',9,'logout',TRUE,'190.182.81.131','2026-10-08 14:49:00'),
('EV-1008',11,'login',TRUE,'190.245.101.94','2026-10-09 15:56:00'),
('EV-1009',14,'bloqueo',FALSE,'190.155.196.63','2026-10-10 16:03:00'),
('EV-1010',7,'login',TRUE,'190.169.160.125','2026-10-11 17:10:00'),
('EV-1011',15,'login',TRUE,'190.186.16.64','2026-10-12 18:17:00'),
('EV-1012',11,'logout',TRUE,'190.139.240.199','2026-10-13 07:24:00'),
('EV-1013',14,'login_fallido',FALSE,'190.116.45.68','2026-10-14 08:31:00'),
('EV-1014',13,'login',TRUE,'190.56.66.52','2026-10-15 09:38:00');

SELECT 'usuarios' AS tabla, COUNT(*) AS registros FROM usuarios
UNION ALL SELECT 'credenciales', COUNT(*) FROM credenciales
UNION ALL SELECT 'sesiones', COUNT(*) FROM sesiones
UNION ALL SELECT 'servicios', COUNT(*) FROM servicios
UNION ALL SELECT 'contratos', COUNT(*) FROM contratos
UNION ALL SELECT 'pagos', COUNT(*) FROM pagos
UNION ALL SELECT 'auditoria_accesos', COUNT(*) FROM auditoria_accesos;
