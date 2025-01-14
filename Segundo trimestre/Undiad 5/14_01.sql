/*Funciones de agregacion*/
SELECT COUNT(*) FROM EMPLE; /*Devuelve el número de filas de una tabla*/ /*14*/
SELECT SUM(SALARIO) FROM EMPLE; /*Devuelve la suma de una columna*/ /*10875*/
SELECT AVG(SALARIO) FROM EMPLE; /*Devuelve la media de una columna*/ /*776.7857142857143*/
SELECT MAX(SALARIO) FROM EMPLE; /*Devuelve el valor máximo de una columna*/ /*2450*/
SELECT MIN(SALARIO) FROM EMPLE; /*Devuelve el valor mínimo de una columna*/ /*800*/
SELECT COUNT(DISTINCT DEPT_NO) FROM EMPLE; /*Devuelve el número de valores distintos de una columna*/ /*4*/
SELECT STDDEV(SALARIO) FROM EMPLE; /*Devuelve la desviación estándar de una columna*/ /*667.6986786754765*/
SELECT VARIANCE(SALARIO) FROM EMPLE; /*Devuelve la varianza de una columna*/ /*445.9183673469388*/
SELECT GROUP_CONCAT(SALARIO) FROM EMPLE; /*Devuelve los valores de una columna concatenados*/ /*2450,1600,1250,2975,1250,2850,1500,1100,950,3000,800,1300,1500,950*/
SELECT GROUP_CONCAT(SALARIO ORDER BY SALARIO) FROM EMPLE; /*Devuelve los valores de una columna concatenados y ordenados*/ /*800,950,950,1100,1250,1250,1300,1500,1500,1600,2450,2850,2975,3000*/
SELECT GROUP_CONCAT(SALARIO SEPARATOR ' - ') FROM EMPLE; /*Devuelve los valores de una columna concatenados con un separador*/ /*2450 - 1600 - 1250 - 2975 - 1250 - 2850 - 1500 - 1100 - 950 - 3000 - 800 - 1300 - 1500 - 950*/

/*GROUP BY*/
SELECT DEPT_NO, COUNT(*) FROM EMPLE GROUP BY DEPT_NO; /*Devuelve el número de empleados por departamento*/
/*HAVING*/
SELECT DEPT_NO, COUNT(*) FROM EMPLE GROUP BY DEPT_NO HAVING COUNT(*) > 2; /*Devuelve el número de empleados por departamento que tengan más de 2 empleados*/
/*WITH ROLLUP*/
SELECT DEPT_NO, COUNT(*) FROM EMPLE GROUP BY DEPT_NO WITH ROLLUP; /*Devuelve el número de empleados por departamento y el total*/
