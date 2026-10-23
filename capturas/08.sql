CREATE TABLE contratos (
  id_contrato    INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario     INT NOT NULL,
  id_servicio    INT NOT NULL,
  plan           ENUM('mensual','trimestral','anual') NOT NULL,
  renovacion_auto BOOLEAN NOT NULL DEFAULT TRUE,
  fecha_inicio   DATE NOT NULL,
  estado         ENUM('activo','suspendido','cancelado') NOT NULL DEFAULT 'activo',
  CONSTRAINT uq_usuario_servicio UNIQUE (id_usuario, id_servicio),
  CONSTRAINT fk_contrato_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  CONSTRAINT fk_contrato_servicio FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);
CREATE TABLE pagos (
  id_pago        INT AUTO_INCREMENT PRIMARY KEY,
  id_contrato    INT NOT NULL,
  referencia     VARCHAR(20) NOT NULL UNIQUE,
  monto          DECIMAL(8,2) NOT NULL,
  metodo         ENUM('tarjeta','transferencia','yappy','paypal') NOT NULL,
  aprobado       BOOLEAN NOT NULL DEFAULT FALSE,
  fecha_pago     DATETIME NOT NULL,
  CONSTRAINT fk_pago_contrato FOREIGN KEY (id_contrato) REFERENCES contratos(id_contrato),
  CONSTRAINT chk_monto CHECK (monto > 0)
);
CREATE TABLE auditoria_accesos (
  id_evento      INT AUTO_INCREMENT PRIMARY KEY,
  codigo_evento  VARCHAR(20) NOT NULL UNIQUE,
  id_usuario     INT NOT NULL,
  accion         ENUM('login','logout','login_fallido','cambio_password','bloqueo') NOT NULL,
  exitoso        BOOLEAN NOT NULL,
  ip_origen      VARCHAR(45) NOT NULL,
  fecha_evento   DATETIME NOT NULL,
  CONSTRAINT fk_audit_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
