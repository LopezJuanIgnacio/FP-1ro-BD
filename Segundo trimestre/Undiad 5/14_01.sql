/*JOIN*/
SELECT * FROM EMPLE EMP
JOIN DEPT DEP
ON EMP.DEPT_NO = DEP.DEPT_NO
WHERE DEP.LOC = 'DALLAS';
-- INNER JOIN: Devuelve solo las filas que tienen coincidencias en ambas tablas.
SELECT * FROM EMPLE EMP
INNER JOIN DEPT DEP
ON EMP.DEPT_NO = DEP.DEPT_NO
WHERE DEP.LOC = 'DALLAS';
-- LEFT JOIN: Devuelve todas las filas de la tabla de la izquierda (EMPLE), y las filas coincidentes de la tabla de la derecha (DEPT). Si no hay coincidencia, los resultados de la tabla de la derecha serán NULL.
SELECT * FROM EMPLE EMP
LEFT JOIN DEPT DEP
ON EMP.DEPT_NO = DEP.DEPT_NO
WHERE DEP.LOC = 'DALLAS';
-- RIGHT JOIN: Devuelve todas las filas de la tabla de la derecha (DEPT), y las filas coincidentes de la tabla de la izquierda (EMPLE). Si no hay coincidencia, los resultados de la tabla de la izquierda serán NULL.
SELECT * FROM EMPLE EMP
RIGHT JOIN DEPT DEP
ON EMP.DEPT_NO = DEP.DEPT_NO
WHERE DEP.LOC = 'DALLAS';
-- FULL JOIN: Devuelve todas las filas cuando hay una coincidencia en una de las tablas. Devuelve NULL para las filas sin coincidencia en la otra tabla.
SELECT * FROM EMPLE EMP
FULL JOIN DEPT DEP
ON EMP.DEPT_NO = DEP.DEPT_NO
WHERE DEP.LOC = 'DALLAS';
-- NATURAL JOIN: Realiza un JOIN basado en todas las columnas con el mismo nombre y tipo en ambas tablas. No requiere una condición explícita ON.
SELECT * FROM EMPLE EMP
NATURAL JOIN DEPT DEP
WHERE DEP.LOC = 'DALLAS';

