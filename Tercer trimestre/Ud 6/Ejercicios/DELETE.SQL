/*1*/
DELETE FROM Clientes
WHERE CodigoCliente IN( 50, 51, 52);
DELETE FROM Empleados
WHERE CodigoCliente IN( 35,36,37);

/*2*/
delete from Clientes
where CodigoCliente not in(Select CodigoCliente from
Pedidos) and Pais not like "España"

/*3*/
delete from Empleados
where CodigoEmpleado not in(Select CodigoEmpleadoRepVentas
from Clientes)  and Puesto like "Representante Ventas"

/*4*/
delete from Productos
where CodigoProducto not in(Select CodigoProducto from
DetallePedidos)and Gama like "Herramientas"

/*5*/
delete from Pedidos
where CodigoPedido not in(Select CodigoPedido from
DetallePedidos)