--Promedio de Toneladas Requeridas
select
avg(toneladas_requeridas)
from ordenes

--Toneladas Facturadas de Inventarios
Select
count(facura_id) as Facturas --Corregir nombre
from facturas

--Cuantil que sea diferente a la mediana 

Select
toneladasentregadas,
CASE
	WHEN PERCENTIL = 50 THEN 'Es La Mediana'
	Else 'No es La mediana'
end as EsLaMediana
from(Select
toneladasentregadas,
NTILE(100) OVER (ORDER BY toneladasentregadas DESC) AS Percentil 
from facturas) as  Percentil


--Moda del sku
select
sku,
count(facura_id) as Facturas
from facturas
group by sku 
order by Facturas
limit 1
