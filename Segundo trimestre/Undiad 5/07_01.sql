SELECT
    Fecha,
    'patatin',
    5 * 3 AS Resultado
FROM
    Ventas
    /*Funciones de cadenas*/
SELECT
    CONCAT (
        'Código de Cliente: ',
        CodigoCliente,
        ' Persona de contacto: ',
        NombreContacto,
        ' ',
        ApellidoContacto
    ) -- Concatena el código de cliente, nombre y apellido de contacto
    UPPER(NombreContacto) AS NombreMayusculas, -- Convierte el nombre de contacto a mayúsculas
    LOWER(ApellidoContacto) AS ApellidoMinusculas, -- Convierte el apellido de contacto a minúsculas
    LENGTH (NombreContacto) AS LongitudNombre, -- Obtiene la longitud del nombre de contacto
    SUBSTRING(NombreContacto, 1, 3) AS SubcadenaNombre, -- Obtiene una subcadena del nombre de contacto
    REPLACE (NombreContacto, 'a', 'o') AS NombreReemplazado -- Reemplaza 'a' por 'o' en el nombre de contacto
FROM
    Clientes
    /*Funciones de agregación*/
SELECT
    MAX(PrecioVenta), -- Obtiene el precio de venta más alto
    MIN(PrecioVenta), -- Obtiene el precio de venta más bajo
    AVG(PrecioVenta) -- Calcula el precio de venta promedio
    COUNT(*) -- Cuenta el número de registros
    SUM(Cantidad * PrecioUnidad) -- Suma la cantidad por el precio de unidad
FROM
    Productos
    /*Funciones de numeros*/
SELECT
    ROUND(PrecioVenta, 2) AS PrecioRedondeado, -- Redondea el precio de venta a 2 decimales
    CEIL(PrecioVenta) AS PrecioTecho, -- Redondea el precio de venta hacia arriba
    FLOOR(PrecioVenta) AS PrecioPiso, -- Redondea el precio de venta hacia abajo
    ABS(PrecioVenta) AS PrecioAbsoluto, -- Devuelve el valor absoluto del precio de venta
    POWER(PrecioVenta, 2) AS PrecioCuadrado, -- Eleva el precio de venta al cuadrado
    SQRT(PrecioVenta) AS RaizCuadradaPrecio, -- Calcula la raíz cuadrada del precio de venta
    MOD(PrecioVenta, 10) AS RestoDivision -- Calcula el resto de la división del precio de venta por 10
FROM
    Productos
    /*Funciones de fecha*/
SELECT
    YEAR (FechaPedido) AS AñoPedido, -- Obtiene el año de la fecha de pedido
    MONTH (FechaPedido) AS MesPedido, -- Obtiene el mes de la fecha de pedido
    DAY (FechaPedido) AS DiaPedido, -- Obtiene el día de la fecha de pedido
    DATE_FORMAT (FechaPedido, '%d/%m/%Y') AS FechaFormateada -- Formatea la fecha de pedido en formato dd/mm/yyyy
FROM
    Pedidos
    /*Funciones logicas*/
SELECT
    IF (PrecioVenta > 100, 'Caro', 'Barato') AS EstadoPrecio, -- Devuelve 'Caro' si el precio de venta es mayor a 100, 'Barato' si no
    CASE
        WHEN PrecioVenta > 100 THEN 'Caro'
        WHEN PrecioVenta < 50 THEN 'Barato'
        ELSE 'Normal'
    END AS EstadoPrecio2 -- Devuelve 'Caro' si el precio de venta es mayor a 100, 'Barato' si es menor a 50, 'Normal' si no
FROM
    Productos
    /*Ejemplo de COALESCE*/
SELECT
    COALESCE(Telefono, 'No disponible') AS TelefonoCliente -- Devuelve el teléfono del cliente, o 'No disponible' si es NULL
FROM
    Clientes
    /*WHERE*/
SELECT
    MAX(PrecioVenta),
    MIN(PrecioVenta),
    AVG(PrecioVenta)
FROM
    Productos
WHERE
    Gama = 'Herramientas'
    AND PrecioVenta > 100
    AND PrecioVenta != 200
    /*Funciones de agregación con BETWEEN en WHERE*/
SELECT
    MAX(PrecioVenta),
    MIN(PrecioVenta),
    AVG(PrecioVenta)
FROM
    Productos
WHERE
    PrecioVenta BETWEEN 50 AND 150
    /*Funciones de agregación con IN en WHERE*/
SELECT
    MAX(PrecioVenta),
    MIN(PrecioVenta),
    AVG(PrecioVenta)
FROM
    Productos
WHERE
    Gama IN ('Herramientas', 'Aromáticas')
    /*Funciones de agregación con LIKE en WHERE*/
SELECT
    MAX(PrecioVenta),
    MIN(PrecioVenta),
    AVG(PrecioVenta)
FROM
    Productos
WHERE
    Nombre LIKE '%Café%'
    /*ORDER BY*/
SELECT
    CodigoProducto,
    Nombre,
    PrecioVenta
FROM
    Productos
ORDER BY
    PrecioVenta DESC
    /*LIMIT*/
SELECT
    CodigoProducto,
    Nombre,
    PrecioVenta
FROM
    Productos
LIMIT 5
    /*GROUP BY*/
SELECT
    Gama,
    COUNT(*) AS CantidadProductos
FROM
    Productos
GROUP BY
    Gama
    /*HAVING*/
SELECT
    Gama,
    COUNT(*) AS CantidadProductos
FROM
    Productos
GROUP BY
    Gama
HAVING
    COUNT(*) > 5