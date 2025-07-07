-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS repositorio_academico;
USE repositorio_academico;

-- Tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    tipo ENUM('admin', 'director', 'profesor') NOT NULL,
    carrera_id INT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de carreras
CREATE TABLE carreras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    director_id INT NULL,
    FOREIGN KEY (director_id) REFERENCES usuarios(id)
);

-- Tabla de archivos
CREATE TABLE archivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    ruta_archivo VARCHAR(255) NOT NULL,
    tipo_archivo VARCHAR(50) NOT NULL,
    tamanio INT NOT NULL,
    carrera_id INT NOT NULL,
    usuario_id INT NOT NULL,
    fecha_subida DATETIME DEFAULT CURRENT_TIMESTAMP,
    visibilidad ENUM('publico', 'privado') DEFAULT 'publico',
    FOREIGN KEY (carrera_id) REFERENCES carreras(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Tabla de comentarios
CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contenido TEXT NOT NULL,
    archivo_id INT NOT NULL,
    usuario_id INT NOT NULL,
    visibilidad ENUM('publico', 'privado') DEFAULT 'publico',
    fecha_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (archivo_id) REFERENCES archivos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Insertar datos iniciales
-- Contraseñas en texto plano (como solicitaste)
INSERT INTO usuarios (username, password, nombre, email, tipo, carrera_id) VALUES 
('admin', 'admin123', 'Administrador Principal', 'admin@universidad.edu', 'admin', NULL),
('director1', 'director123', 'Director de Software', 'director@universidad.edu', 'director', 1),
('profesor1', 'profesor123', 'Profesor Martínez', 'martinez@universidad.edu', 'profesor', 1),
('profesor2', 'profesor123', 'Profesor Gómez', 'gomez@universidad.edu', 'profesor', 1),
('profesor3', 'profesor123', 'Profesor Rodríguez', 'rodriguez@universidad.edu', 'profesor', 1);

-- Corregir INSERT de carreras (eliminar punto y coma y actualizar descripciones)
INSERT INTO carreras (nombre, descripcion, director_id) VALUES 
('Ingenieria en Desarrollo y Gestion de Software', 'Carrera enfocada en el desarrollo de software y gestión de proyectos tecnológicos', 2),
('Ingenieria en Mecatronica', 'Integración de sistemas mecánicos, electrónicos y de control para crear sistemas automatizados', NULL),
('Ingenieria en Mantenimiento Industrial', 'Formación en gestión del mantenimiento de sistemas industriales y maquinaria', NULL),
('Licenciatura en Inovacion de Negocios y Mercadotecnia', 'Desarrollo de habilidades para la innovación empresarial y estrategias de mercado', NULL),
('Licenciatura en Diseno y Gestion de Redes Logisticas', 'Planificación y optimización de redes de suministro y distribución', NULL);

-- Aumentar tamaño de campo password para hashes
ALTER TABLE usuarios MODIFY password VARCHAR(255) NOT NULL;

-- Agregar índices
CREATE INDEX idx_usuarios_username ON usuarios(username);
CREATE INDEX idx_usuarios_email ON usuarios(email);
CREATE INDEX idx_archivos_carrera ON archivos(carrera_id);
CREATE INDEX idx_archivos_usuario ON archivos(usuario_id);
UPDATE usuarios SET carrera_id = 1 WHERE id = 2;
