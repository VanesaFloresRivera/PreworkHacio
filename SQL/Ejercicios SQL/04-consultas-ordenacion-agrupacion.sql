
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
	select "Title"	as "Nombre_album" 
	from "Album" a 
	order by "Title" 

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
	select "AlbumId" as "Album_maxima_canciones", count("TrackId") as "Num_canciones"
	from "Track" t 
	group by "AlbumId"
	order by "Num_canciones" DESC
	limit 1

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
	select "Composer" as "Compositor",
		round(avg("Milliseconds"),2) as "Promedio_Duracion",
		round(stddev("Milliseconds"),2) as "Desviacion_estandar_duracion",
		round(variance("Milliseconds"),2) as "Varianza_duracion"
	from "Track" t 
	group by "Composer";

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
	select "Name" as "Titulo", "UnitPrice" as "Precio"
	from "Track" t 
	limit 10;
   

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
	select "FirstName" as "Nombre_empleado"	
	from "Employee" e
	order by "EmployeeId" desc;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
	select count(*) as "Recuento_generos"
	from "Genre" g ;

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
	select "FirstName" as "Nombre_cliente",
		"Country" as "Pais"
	from "Customer" c
	order by "Nombre_cliente"
	limit 5;
	
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
	select "Country" as "Pais_cliente",
		COUNT("CustomerId") as "Num_clientes"
	from "Customer" c 
	group by "Country";

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 100.
	select "BillingCountry" as "Pais_factura",
		sum("Total") as "Suma_facturas"
	from "Invoice" i 
	group by "BillingCountry" 
	having sum("Total") > 100;

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
	select "Country" as "Pais_cliente", 
		count("CustomerId") as "Num_clientes"
	from "Customer" c 
	group by "Country" 
	having count("CustomerId") > 5;

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
   select "MediaTypeId",
   		count("TrackId") as "Num_pistas"
   from "Track" t 
   where "Milliseconds" > 250000
   group by "MediaTypeId" ;

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
 	select "Country" as "pais_cliente",
 		"SupportRepId" as "ID_Representante",
 		count("CustomerId") as "Num_clientes"
 	from "Customer" c 
 	where "SupportRepId" < 5
   	group by "SupportRepId", "Country"
   	order by "pais_cliente";
   	
   	
-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
   select "CustomerId" as "ID_cliente",
   "BillingPostalCode" as "codigo_postal",
   	count("InvoiceId") as "num_compras"
   from "Invoice" i 
   group by "CustomerId", "BillingPostalCode" 
   having count("InvoiceId") > 5;
   

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
 	select "MediaTypeId" as "Tipo_medio",
 		count("TrackId") as "Num_total_pistas"
 	from "Track" t 
 	where "UnitPrice" > 0.99 and "Milliseconds" > 200000
 	group by "MediaTypeId" ;

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.
	select "Country" as "pais_Cliente",
		"State" as "Estado",
		count("CustomerId") as "Num_clientes"
	from "Customer" c 
	where "SupportRepId" > 3 and "Company" <> 'null'
	group by "Country", "State" 
 	
 	
 	
 	
 	