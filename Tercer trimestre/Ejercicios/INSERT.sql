/*1*/
insert into
    empleados
values
    (
        32,
        'Pedro',
        'Rodriguez',
        'Perez',
        '3897',
        'pedri@gmail.com',
        'TAL-ES',
        DEFAULT,
        DEFAULT
    ),
    (
        33,
        'Raúl',
        'Pérez',
        DEFAULT,
        '3897',
        'raul@jardineria.es',
        '
TAL-ES',
        DEFAULT,
        DEFAULT
    ),
    (
        34,
        'María',
        'García',
        DEFAULT,
        '3897',
        'maria@jardineria.es
',
        'TAL-ES',
        DEFAULT,
        DEFAULT
    )
/*2*/
INSERT INTO Clientes VALUES
(39,'EMPRESA39',DEFAULT,DEFAULT,'393939393','5556901746'
,'False Street 52 2 A',DEFAULT,'San Francisco', DEFAULT,
DEFAULT, DEFAULT,32, DEFAULT),
(40,'EMPRESA40',DEFAULT,DEFAULT,'393939393','5556901746'
,'False Street 52 2 A',DEFAULT,'San Francisco', DEFAULT,
DEFAULT, DEFAULT,33, DEFAULT),
(41,'EMPRESA41',DEFAULT,DEFAULT,'393939393','5556901746'
,'False Street 52 2 A',DEFAULT,'San Francisco', DEFAULT,
DEFAULT, DEFAULT,34, DEFAULT)
/*3*/
INSERT INTO PedidosHistorico
SELECT CodigoPedido, FechaPedido, FechaEsperada,
FechaEntrega,CodigoCliente, CURDATE()
FROM Pedidos
WHERE FechaEntrega IS NOT NULL
/*4*/
INSERT INTO detallepedidosh
SELECT CodigoPedido, CodigoProducto, Cantidad,
PrecioUnidad,NumeroLinea
FROM detallepedidos
WHERE CodigoPedido IN(SELECT CodigoPedido FROM
PedidosHistorico)
