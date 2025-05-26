# Tarea 1

## Descripción de la Base de Datos

La base de datos estará compuesta por información relacionada con las rutas de transporte público que existen en el estado de Nuevo León. Los atributos considerados son los siguientes:

- Ruta de transporte  
- Costo del pasaje  
- Cantidad de unidades  
- Tiempo medio de ruta  
- Cantidad de paradas  
- Número de municipios que recorre  
- Municipio de origen  
- Municipio de destino  

A continuación, se presenta el tipo de dato que se propone para cada variable:

1. **Ruta**: Cadena de caracteres  
2. **Costo del pasaje**: Numérico real  
3. **Cantidad de unidades**: Numérico entero  
4. **Tiempo medio de ruta**: Numérico real  
5. **Cantidad de paradas**: Numérico entero  
6. **Número de municipios que recorre**: Numérico entero  
7. **Municipio de origen**: Cadena de caracteres  
8. **Municipio de destino**: Cadena de caracteres  

## Sistemas de Gestión de Bases de Datos

Existen numerosos sistemas de gestión de bases de datos (SGBD). Entre los más conocidos y utilizados se encuentran Microsoft SQL Server, MySQL y PostgreSQL. Personalmente, el sistema que más me interesa explorar es **PostgreSQL**, ya que es con el que tengo menor experiencia.

Durante mi investigación sobre PostgreSQL, encontré dos características que considero particularmente interesantes:

1. **Compatibilidad con Python**: PostgreSQL permite la integración con diversos lenguajes de programación, entre ellos Python. Esta funcionalidad permite, por ejemplo, crear funciones dentro de la base de datos utilizando código Python, lo cual es útil para tareas analíticas y de automatización.

2. **Tipo de dato geométrico**: PostgreSQL incluye soporte para tipos de datos geométricos como puntos, líneas y polígonos. Esta característica es especialmente valiosa para el análisis geoespacial y puede ser de gran utilidad en proyectos de ciencia de datos relacionados con el transporte público.

## Bibliografía

The PostgreSQL Global Development Group. (s. f.). *About PostgreSQL*. Recuperado de: https://www.postgresql.org/about/


