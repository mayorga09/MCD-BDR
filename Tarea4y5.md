# Tarea 4 y 5 
## Agregar datos
Para agregar datos fiticios a mi base de datos utilice la plataforma http://filldb.info/dummy de la cual descargue en formato csv los archivos y mediante el uso PSQL que es la consola de PostgreSQL ingrese los datos de la siguiente manera. 

\copy articulos FROM 'C:/Users/USER/Documents/Clientes.csv' DELIMITER ',' CSV HEADER

\copy clientes FROM 'C:/Users/USER/Documents/Clientes.csv' DELIMITER ',' CSV HEADER

\copy facturas FROM 'C:/Users/USER/Documents/Facturas.csv' DELIMITER ',' CSV HEADER

\copy ordenes FROM 'C:/Users/USER/Documents/Ordenes.csv' DELIMITER ',' CSV HEADER

\copy produccion FROM 'C:/Users/USER/Documents/Produccion.csv' DELIMITER ',' CSV HEADER

## Hallazgos, dificultades o recomendaciones
Durante la carga de los archivos la principal dificultad que tuve fue que en los archivos que exportaba la pagina el salto de linea era tambien representado por una coma, por lo que tuve que quitar esa ultima guardando en el formato correcto el archivo, esto quizas se podía solucionar mediante el uso de tablas temporales para reformatear antes de guardar en las tablas originales o usar herramientas externas para automatizar el proceso