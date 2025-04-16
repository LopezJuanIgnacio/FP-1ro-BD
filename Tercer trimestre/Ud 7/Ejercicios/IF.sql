/*1*/
DELIMITER $$
CREATE function par( num INT) returns varchar(5)
begin
	if (num mod 2) = 1 then
		return "impar";
    else
		return "par";
	end if;
end$$

select par(3)$$

/*2*/
CREATE function hipotenusa( a INT, b INT) RETURNS double
RETURN SQRT(a * a + b * b);

select hipotenusa(4,4);

/*3*/
CREATE FUNCTION dia_semana(dia INT) RETURNS VARCHAR(10)
BEGIN
    CASE dia
        WHEN 1 THEN RETURN 'lunes';
        WHEN 2 THEN RETURN 'martes';
        WHEN 3 THEN RETURN 'miércoles';
        WHEN 4 THEN RETURN 'jueves';
        WHEN 5 THEN RETURN 'viernes';
        WHEN 6 THEN RETURN 'sábado';
        WHEN 7 THEN RETURN 'domingo';
        ELSE RETURN 'día inválido';
    END CASE;
END;

/*4*/
CREATE FUNCTION mayor(a INT, b int, c int) RETURNS int
BEGIN
    DECLARE mayor INT;
    SET mayor = a;
    IF b > mayor THEN
        SET mayor = b;
    END IF;
    IF c > mayor THEN
        SET mayor = c;
    END IF;
    RETURN mayor;
END$$

/*5*/
CREATE function numAños( a DATE, b DATE) RETURNS int
RETURN abs((datediff(a,b) / 365));

select numAños('2023-05-01', '2024-05-31');

/*6*/
DELIMITER $$
CREATE function numPedidos(pAnio int) returns int
begin
	declare cant int default 0;
    select count(*) into cant from pedidos where year(fechaPedido)=pAnio;
    return cant;
end$$

select numPedidos(2018)$$

/*7*/
DELIMITER $$
CREATE function multPocha(a int, b int) returns int
begin
	declare sum int default 0;
    declare i int default 0;
    
    set i = b;
    
    while i > 0 do
		set i = i -1;
        set sum = sum + a;
    end while;
    
    return sum;
end$$

select multPocha(6, 4)$$

/*8*/
DELIMITER $$
CREATE function factorial(a int) returns int
begin
	declare sum int default 1;
    declare i int default 0;
    
    set i = a;
    
    while i > 0 do
        set sum = sum * i;
		set i = i -1;
    end while;
    
    return sum;
end$$

select factorial(5)$$