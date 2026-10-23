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
