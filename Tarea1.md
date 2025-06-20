# Tarea 1

## Descripción de la Base de Datos

La base de datos estará compuesta por información relacionada con una empresas que se dedica a producir papel con un modelo de negocio _make to order_, tomaremos en cuenta sus datos de producción y facturación. Principalmente contara con las siguientes variables 

### Tabla de Ordenes 
- Orden de Venta 
- Cliente  
- sku  
- toneladas requeridas  
- Maquina  
- ancho  
- largo
- fecha de Alta
- fecha de embarque requerida
- fecha de producción requerida
- Venta de Inventario




### Tabla de Producción
- Job 
- Orden de Venta 
- Vendedor
- Cliente  
- sku  
- toneladas requeridas  
- toneladas fabricadas: flotante 
- Maquina  
- ancho  
- largo
- fecha de producción

### Tabla de Facturación
- Facura_id
- Orden de Venta
- Cliente
- Vendedor
- Fecha de Orden
- Fecha de entrega
- sku
- Venta de Inventario
- Calidad
- Número de Lote
- Número de Remisión
- Toneladas Ordenadas
- Toneladas entregadas

### Tabla de Cliente
- Cliente_id
- Cliente
- Dirección 
- Fecha de Alta
- Estatus
- Línea de Credito
- Dias de Credito
- Nacional

### Tabla de Articulos
- sku
- Descripción
- Familia
- SubFamilia
- Peso Base


A continuación, se presenta el tipo de dato que se propone para cada variable:

### Tabla de Producción
- Job: cadena de caracteres
- Orden de Venta: entero
- Cliente : cadena de carcateres
- sku  : entero
- toneladas ordenadas : flotante 
- toneladas fabricadas: flotante 
- Maquina  : cadena de caracteres
- ancho  : Entero
- largo : Entero
- fecha de producción : Fecha

### Tabla de Facturación
- Orden de Venta: Entero
- Cliente: Cadena de Caracteres
- Vendedor: Cadena de Caracteres
- Fecha de Orden: Fecha
- Fecha de entrega: Fecha
- sku: entero
- Venta de Inventario: booleano
- Calidad: Cadena de caracteres
- Número de Lote: entero
- Número de Remisión: entero
- Toneladas Ordenadas: flotante
- Toneladas entregadas: flotante

### Tabla de Cliente
- Cliente_id: entero
- Cliente: cadena de caracteres
- Dirección: cadena de caracteres
- Fecha de Alta: date
- Estatus: booleano
- Línea de Credito: flotante
- Dias de Credito: Entero
- Nacional: booleano

### Tabla de Articulos
- sku: entero
- Descripción: cadena de caracteres
- Familia: cadena de caracteres
- SubFamilia: cadena de caracteres
- Peso Base: flotante


## Sistemas de Gestión de Bases de Datos

Existen numerosos sistemas de gestión de bases de datos (SGBD). Entre los más conocidos y utilizados se encuentran Microsoft SQL Server, MySQL y PostgreSQL. Personalmente, el sistema que más me interesa explorar es **PostgreSQL**, ya que es con el que tengo menor experiencia.

Durante mi investigación sobre PostgreSQL, encontré dos características que considero particularmente interesantes:

1. **Compatibilidad con Python**: PostgreSQL permite la integración con diversos lenguajes de programación, entre ellos Python. Esta funcionalidad permite, por ejemplo, crear funciones dentro de la base de datos utilizando código Python, lo cual es útil para tareas analíticas y de automatización.


## Bibliografía

The PostgreSQL Global Development Group. (s. f.). *About PostgreSQL*. Recuperado de: https://www.postgresql.org/about/


