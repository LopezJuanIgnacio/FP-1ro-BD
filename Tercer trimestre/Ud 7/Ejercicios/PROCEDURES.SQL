/*1*/
DELIMITER //
CREATE PROCEDURE consultarClientesPais (IN pais VARCHAR(50))
BEGIN
    SELECT c.*
    FROM Clientes AS c
    WHERE c.Pais = pais;
END //

call consultarClientesPais("España")//

/*2 y 3*/
DELIMITER //
CREATE PROCEDURE consultarPagosForma (IN forma VARCHAR(50))
BEGIN
    SELECT MAX(P.Cantidad), MIN(P.Cantidad), AVG(P.Cantidad),  SUM(P.Cantidad), COUNT(*) 
    FROM Pagos AS P
    WHERE P.FormaPago = forma;
END //

call consultarPagosForma("PayPal")//

/*4*/
DELIMITER //
CREATE PROCEDURE calcular_max_min_media(IN gama VARCHAR(50), OUT MAXP DECIMAL(15,2), OUT MINP DECIMAL(15,2), OUT AVGP DECIMAL(15,2))
BEGIN
SELECT MAX(P.PrecioVenta), MIN(P.PrecioVenta), AVG(P.PrecioVenta) INTO MAXP, MINP, AVGP
    FROM Productos AS P
    WHERE P.Gama = gama;
END //

SET @MAXP= 0,@MINP= 0,@AVGP= 0 //
call calcular_max_min_media("Herramientas",@MAXP,@MINP,@AVGP)//
SELECT @MAXP,@MINP,@AVGP//

/*5*/
DELIMITER //
CREATE PROCEDURE aumentar_porcentaje(IN cod INT, IN num INT)
BEGIN
    UPDATE Clientes AS c
    SET c.LimiteCredito = ROUND(c.LimiteCredito * (1 + (num/100)), 2)
    WHERE c.CodigoCliente = cod;
END //

CALL aumentar_porcentaje(12, 50) //

/*6*/
DELIMITER //
CREATE PROCEDURE eliminar_pedido(IN cod INT)
BEGIN
    DELETE FROM detallepedidos as dp
    WHERE dp.CodigoPedido = cod;
    DELETE FROM Pedidos as p
    WHERE p.CodigoPedido = cod;
END //

CALL eliminar_pedido(12) //