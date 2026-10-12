-- ==========================================
-- TAREA: PRIMEROS PASOS EN SQL
-- INVENTARIO DE UN MINIMARKET
-- MOTOR: POSTGRESQL
-- ==========================================

-- PASO 1: CREAR LA TABLA CATEGORIAS

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- PASO 2: CREAR LA TABLA PRODUCTOS

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL,
    categoria_id INTEGER REFERENCES categorias(id)
);

-- PASO 3: INSERTAR LAS CATEGORIAS

INSERT INTO categorias (nombre)
VALUES
('Bebidas'),
('Snacks'),
('Lacteos');

-- PASO 4: INSERTAR LOS PRODUCTOS

INSERT INTO productos (nombre, precio, stock, categoria_id)
VALUES
('Agua', 0.75, 50, 1),
('Gaseosa', 1.25, 30, 1),
('Jugo', 1.00, 25, 1),
('Papas fritas', 1.50, 20, 2),
('Galletas', 0.80, 40, 2),
('Leche', 1.40, 15, 3);

-- ==========================================
-- EJERCICIO 1:
-- PRODUCTOS DE LA CATEGORIA BEBIDAS
-- ==========================================

SELECT nombre, precio
FROM productos
WHERE categoria_id = 1;

-- ==========================================
-- EJERCICIO 2:
-- PRODUCTO MAS CARO DE LA TIENDA
-- ==========================================

SELECT nombre, precio
FROM productos
ORDER BY precio DESC
LIMIT 1;

-- ==========================================
-- EJERCICIO 3:
-- VALOR TOTAL DEL INVENTARIO
-- ==========================================

SELECT SUM(precio * stock) AS valor_total_inventario
FROM productos;

-- ==========================================
-- EJERCICIO 4:
-- PRODUCTOS CON SUS CATEGORIAS
-- ORDENADOS ALFABETICAMENTE
-- ==========================================

SELECT
    p.nombre AS producto,
    p.precio,
    c.nombre AS categoria
FROM productos p
INNER JOIN categorias c
    ON p.categoria_id = c.id
ORDER BY p.nombre ASC;