CREATE DATABASE IF NOT EXISTS bd_login2
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_0900_ai_ci;

USE bd_login2;
CREATE TABLE `usuarios` (
	`curp` VARCHAR(18) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nombre` VARCHAR(25) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`apellidos` VARCHAR(25) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`contrasena` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`usuario_generado_automaticamente` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_0900_ai_ci',
	PRIMARY KEY (`curp`) USING BTREE
)
COLLATE='utf8mb4_0900_ai_ci'
ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS problematica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    alcaldia VARCHAR(50) NOT NULL
);

ALTER TABLE problematica
    MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY,
    ADD COLUMN fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Crear una nueva tabla para almacenar las rutas de las imágenes
CREATE TABLE IF NOT EXISTS imagenes_problematica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_problematica INT,
    ruta_imagen VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_problematica) REFERENCES problematica(id) ON DELETE CASCADE
);



select * from usuarios;