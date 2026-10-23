CREATE TABLE sesiones (
  id_sesion      INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario     INT NOT NULL,
  token          CHAR(32) NOT NULL UNIQUE,
  dispositivo    VARCHAR(60) NOT NULL,
  plataforma     ENUM('web','android','ios') NOT NULL,
  activa         BOOLEAN NOT NULL DEFAULT TRUE,
  fecha_inicio   DATETIME NOT NULL,
  fecha_expira   DATETIME NOT NULL,
  CONSTRAINT fk_sesion_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  CONSTRAINT chk_expira CHECK (fecha_expira > fecha_inicio)
);
CREATE TABLE servicios (
  id_servicio    INT AUTO_INCREMENT PRIMARY KEY,
  codigo         VARCHAR(10)  NOT NULL UNIQUE,
  nombre         VARCHAR(80)  NOT NULL,
  categoria      ENUM('hosting','correo','almacenamiento','vpn','backup','seguridad') NOT NULL,
  precio_mensual DECIMAL(8,2) NOT NULL,
  disponible     BOOLEAN NOT NULL DEFAULT TRUE,
  id_responsable INT NOT NULL,
  CONSTRAINT fk_servicio_resp FOREIGN KEY (id_responsable) REFERENCES usuarios(id_usuario),
  CONSTRAINT chk_precio CHECK (precio_mensual > 0)
);
