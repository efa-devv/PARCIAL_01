CREATE DATABASE pixel_security_360 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pixel_security_360;
CREATE TABLE usuarios (
  id_usuario      INT AUTO_INCREMENT PRIMARY KEY,
  nombre          VARCHAR(50)  NOT NULL,
  apellido        VARCHAR(50)  NOT NULL,
  nombre_usuario  VARCHAR(30)  NOT NULL UNIQUE,
  token           CHAR(32)     NOT NULL UNIQUE,
  contrasena      CHAR(64)     NOT NULL,
  ciudad          VARCHAR(50)  NOT NULL,
  sexo            ENUM('Masculino','Femenino') NOT NULL,
  estado_civil    ENUM('Soltero','Casado','Divorciado','Viudo','Unido') NOT NULL,
  tipo_empresa    ENUM('Publica','Privada') NOT NULL,
  direccion       VARCHAR(150) NOT NULL,
  tipo_usuario    ENUM('Cliente','Administrador','Vendedor','Ejecutivo','Otros') NOT NULL
);
CREATE TABLE autenticacion (
  id_autenticacion INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario       INT NOT NULL,
  nombre_usuario   VARCHAR(30) NOT NULL,
  contrasena       CHAR(64)    NOT NULL,
  agente_usuario   VARCHAR(80) NOT NULL,
  token            CHAR(32)    NOT NULL UNIQUE,
  fecha_acceso     DATETIME    NOT NULL,
  CONSTRAINT fk_auth_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
