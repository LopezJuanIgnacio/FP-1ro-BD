SELECT
    Fecha,
    'patatin',
    5 * 3 AS Resultado
FROM
    Ventas
/*Funciones para cadenas*/
SELECT CONCAT('El cliente ', NombreContacto, ' tiene el teléfono ', Telefono) FROM clientes; /*Concatena cadenas*/
ASCII('A'); /*Devuelve el valor ASCII de un caracter*/  /*65*/
BIN(65); /*Devuelve el valor binario de un número*/ /*1000001*/
CHAR(65); /*Devuelve el caracter de un valor ASCII*/ /*A*/
CHAR_LENGTH('Hola'); /*Devuelve la longitud de una cadena*/ /*4*/
CONVERT('Hola', BINARY); /*Convierte una cadena a otro tipo de dato*/
INSERT('Hola', 2, 0, 'adios'); /*Inserta una cadena en otra cadena*/ /*Hadiosola*/
LCASE('HOLA'); /*Convierte una cadena a minúsculas*/ /*hola*/
UPPER('hola'); /*Convierte una cadena a mayúsculas*/ /*HOLA*/
LEFT('Hola', 2); /*Devuelve los primeros caracteres de una cadena*/ /*Ho*/

/*Funciones para números*/
SELECT ABS(-5); /*Devuelve el valor absoluto de un número*/ /*5*/
SELECT CEIL(5.5); /*Devuelve el entero más cercano hacia arriba*/ /*6*/
SELECT FLOOR(5.5); /*Devuelve el entero más cercano hacia abajo*/ /*5*/
SELECT ROUND(5.5); /*Devuelve el entero más cercano*/ /*6*/
SIN(PI()); /*Devuelve el seno de un número*/ /*0*/
LOG10(100); /*Devuelve el logaritmo en base 10 de un número*/ /*2*/
MOD(10, 3); /*Devuelve el resto de una división*/ /*1*/
POWER(2, 3); /*Devuelve el resultado de elevar un número a otro*/ /*8*/
SQRT(9); /*Devuelve la raíz cuadrada de un número*/ /*3*/

/*Funciones de fecha*/
SELECT ADDDATE('2017-06-15', INTERVAL 1 DAY); /*Añade una cantidad de tiempo a una fecha*/ /*2017-06-16*/
SELECT CURDATE(); /*Devuelve la fecha actual*/ /*2017-06-15*/
SELECT CURTIME(); /*Devuelve la hora actual*/ /*12:00:00*/
SELECT DATE('2017-06-15 12:00:00'); /*Devuelve la fecha de una fecha y hora*/ /*2017-06-15*/
SELECT DAY('2017-06-15'); /*Devuelve el día de una fecha*/ /*15*/
SELECT DAYNAME('2017-06-15'); /*Devuelve el nombre del día de una fecha*/ /*Thursday*/
SELECT DAYOFMONTH('2017-06-15'); /*Devuelve el día del mes de una fecha*/ /*15*/
SELECT DAYOFWEEK('2017-06-15'); /*Devuelve el día de la semana de una fecha*/ /*5*/
SELECT DAYOFYEAR('2017-06-15'); /*Devuelve el día del año de una fecha*/ /*166*/
SELECT EXTRACT(YEAR FROM '2017-06-15'); /*Devuelve una parte de una fecha*/ /*2017*/
SELECT HOUR('2017-06-15 12:00:00'); /*Devuelve la hora de una fecha*/ /*12*/
SELECT MINUTE('2017-06-15 12:00:00'); /*Devuelve los minutos de una fecha*/ /*0*/
SELECT MONTH('2017-06-15'); /*Devuelve el mes de una fecha*/ /*6*/
SELECT MONTHNAME('2017-06-15'); /*Devuelve el nombre del mes de una fecha*/ /*June*/
SELECT NOW(); /*Devuelve la fecha y hora actual*/ /*2017-06-15 12:00:00*/
SELECT TIME('2017-06-15 12:00:00'); /*Devuelve la hora de una fecha y hora*/ /*12:00:00*/

/*Funciones de control de flujo*/
SELECT IF(1=1, 'Verdadero', 'Falso'); /*Devuelve un valor si se cumple una condición*/ /*Verdadero*/
SELECT CASE WHEN 1=1 THEN 'Verdadero' ELSE 'Falso' END; /*Devuelve un valor si se cumple una condición*/ /*Verdadero*/
SELECT COALESCE(NULL, 'No es nulo'); /*Devuelve el primer valor no nulo*/ /*No es nulo*/ /*Sirve para evitar errores de nulos y q siempre devuelva algo*/

/*ORDER BY*/
SELECT * FROM productos ORDER BY PrecioUnidad; /*Devuelve los productos ordenados por precio*/
SELECT * FROM productos ORDER BY PrecioUnidad DESC; /*Devuelve los productos ordenados por precio de forma descendente*/

/*WHERE*/
SELECT * FROM productos WHERE PrecioUnidad > 20; /*Devuelve los productos con un precio mayor a 20*/
SELECT * FROM productos WHERE PrecioUnidad BETWEEN 10 AND 20; /*Devuelve los productos con un precio entre 10 y 20*/
SELECT * FROM productos WHERE Categoria = 'Bebidas' AND PrecioUnidad > 20; /*Devuelve los productos de la categoría bebidas con un precio mayor a 20*/
SELECT * FROM productos WHERE Categoria = 'Bebidas' OR Categoria = 'Carnes'; /*Devuelve los productos de la categoría bebidas o carnes*/
SELECT * FROM productos WHERE NOT Categoria = 'Bebidas'; /*Devuelve los productos que no son de la categoría bebidas*/
SELECT * FROM productos WHERE Categoria IN ('Bebidas', 'Carnes'); /*Devuelve los productos de la categoría bebidas o carnes*/
SELECT * FROM productos WHERE Categoria LIKE 'B%'; /*Devuelve los productos de la categoría que empieza por B*/

/*LIMIT*/
SELECT * FROM productos LIMIT 5; /*Devuelve los 5 primeros productos*/
SELECT * FROM productos LIMIT 5, 5; /*Devuelve los 5 productos después de los 5 primeros*/