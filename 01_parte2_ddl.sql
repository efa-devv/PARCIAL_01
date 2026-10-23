-- PARTE II - DDL - Sistema Empresarial de Servicios Digitales
DROP DATABASE IF EXISTS servicios_digitales;
CREATE DATABASE servicios_digitales CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE servicios_digitales;

CREATE TABLE usuarios (
  id_usuario     INT AUTO_INCREMENT PRIMARY KEY,
  nombre         VARCHAR(50)  NOT NULL,
  apellido       VARCHAR(50)  NOT NULL,
  correo         VARCHAR(100) NOT NULL UNIQUE,
  telefono       VARCHAR(15)  NOT NULL,
  rol            ENUM('cliente','administrador','soporte') NOT NULL DEFAULT 'cliente',
  activo         BOOLEAN NOT NULL DEFAULT TRUE,
  fecha_registro DATE NOT NULL,
  referido_por   INT NULL,
  CONSTRAINT fk_usuario_referido FOREIGN KEY (referido_por) REFERENCES usuarios(id_usuario),
  CONSTRAINT chk_correo CHECK (correo LIKE '%@%.%')
);

CREATE TABLE credenciales (
  id_credencial  INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario     INT NOT NULL UNIQUE,
  username       VARCHAR(50)  NOT NULL UNIQUE,
  password_hash  CHAR(64)     NOT NULL,
  metodo_2fa     ENUM('ninguno','sms','app') NOT NULL DEFAULT 'ninguno',
  bloqueada      BOOLEAN NOT NULL DEFAULT FALSE,
  intentos_fallidos INT NOT NULL DEFAULT 0,
  CONSTRAINT fk_cred_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  CONSTRAINT chk_intentos CHECK (intentos_fallidos BETWEEN 0 AND 5)
);

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

-- Entidad asociativa usuarios N:M servicios
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

SHOW TABLES;
DESCRIBE usuarios;
DESCRIBE contratos;
