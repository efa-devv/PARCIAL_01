CREATE TABLE tipos_pruebas (
  id_prueba     INT AUTO_INCREMENT PRIMARY KEY,
  referencia    VARCHAR(10)  NOT NULL UNIQUE,
  nombre        VARCHAR(80)  NOT NULL,
  descripcion   VARCHAR(255) NOT NULL,
  fecha_ingreso DATE NOT NULL,
  estado        ENUM('Activo','Desactivado') NOT NULL DEFAULT 'Activo'
);
CREATE TABLE pagos (
  id_pago            INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario         INT NOT NULL,
  marca_tarjeta      ENUM('VISA','MasterCard','American Express','Discover','Diners Club') NOT NULL,
  numero_tarjeta     VARCHAR(19) NOT NULL,
  nombre_titular     VARCHAR(100) NOT NULL,
  cvc                VARCHAR(4) NOT NULL,
  expiracion         CHAR(7) NOT NULL,
  tarjeta_por_defecto BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT fk_pago_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  CONSTRAINT uq_tarjeta UNIQUE (numero_tarjeta),
  CONSTRAINT chk_expiracion CHECK (expiracion REGEXP '^(0[1-9]|1[0-2])/[0-9]{4}$')
);
CREATE TABLE reportes (
  id_reporte    INT AUTO_INCREMENT PRIMARY KEY,
  codigo        VARCHAR(15) NOT NULL UNIQUE,
  id_cliente    INT NOT NULL,
  id_prueba     INT NOT NULL,
  titulo        VARCHAR(120) NOT NULL,
  hallazgos     INT NOT NULL DEFAULT 0,
  severidad     ENUM('Baja','Media','Alta','Critica') NOT NULL,
  estado        ENUM('En progreso','Entregado','Cerrado') NOT NULL,
  fecha_reporte DATE NOT NULL,
  CONSTRAINT fk_reporte_cliente FOREIGN KEY (id_cliente) REFERENCES usuarios(id_usuario),
  CONSTRAINT fk_reporte_prueba  FOREIGN KEY (id_prueba)  REFERENCES tipos_pruebas(id_prueba),
  CONSTRAINT chk_hallazgos CHECK (hallazgos >= 0)
);
