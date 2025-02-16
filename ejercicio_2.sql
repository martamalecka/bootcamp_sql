-- Crear la tabla de alumnos
CREATE TABLE keepcoding.alumnos (
    alumno_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_1 VARCHAR(50) NOT NULL,
    apellido_2 VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    bootcamp_id INT,
    curso_id INT,
    fecha_registro DATE NOT NULL,
    CONSTRAINT fk_bootcamp FOREIGN KEY (bootcamp_id) REFERENCES keepcoding.bootcamps(bootcamp_id),
    CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES keepcoding.cursos(curso_id)
);

-- Crear la tabla de profesores
CREATE TABLE keepcoding.profesores (
    profesor_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_1 VARCHAR(50) NOT NULL,
    apellido_2 VARCHAR(50),
    email VARCHAR(100) NOT NULL UNIQUE,
    modulo_id INT,
    curso_id INT,
    fecha_registro DATE NOT NULL,
    CONSTRAINT fk_modulo FOREIGN KEY (modulo_id) REFERENCES keepcoding.modulos(modulo_id),
    CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES keepcoding.cursos(curso_id)
);

-- Crear la tabla de bootcamps
CREATE TABLE keepcoding.bootcamps (
    bootcamp_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edicion INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    precio VARCHAR(20) NOT NULL,
    moneda VARCHAR(3) NOT NULL,
    descripcion VARCHAR(200),
    fecha_creacion DATE NOT NULL,
    categoria_id INT NOT NULL,
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES keepcoding.categorias(categoria_id)
);

-- Crear la tabla de módulos
CREATE TABLE keepcoding.modulos (
    modulo_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    fecha_creacion DATE NOT NULL,
    fecha_actualizacion DATE,
    bootcamp_id INT NOT NULL,
    CONSTRAINT fk_bootcamp FOREIGN KEY (bootcamp_id) REFERENCES keepcoding.bootcamps(bootcamp_id)
);

-- Crear la tabla de cursos
CREATE TABLE keepcoding.cursos (
    curso_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edicion INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    de_pago BOOLEAN NOT NULL,
    precio VARCHAR(20),
    moneda VARCHAR(3),
    descripcion VARCHAR(200),
    fecha_creacion DATE NOT NULL,
    categoria_id INT NOT NULL,
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES keepcoding.categorias(categoria_id)
);

-- Crear la tabla de categorías
CREATE TABLE keepcoding.categorias (
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
