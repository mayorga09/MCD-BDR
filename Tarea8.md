# Tarea 8
## Crear un Trigger
La función de nuestro trigger es cerrar las ordenes de venta que ya se facturaron al 100% o más 
```sql 
CREATE OR REPLACE FUNCTION actualizar_closed()
RETURNS TRIGGER AS $$
BEGIN
  -- Revisa el total facturado para la orden afectada
  UPDATE ordenes
  SET closed = CASE 
                 WHEN (SELECT SUM(toneladasentregadas) 
                       FROM facturas f
                       WHERE f.ordendeventa = NEW.id_orden) 
                      >= (SELECT toneladas_requeridas 
                          FROM ordenes O
                          WHERE O.ordendeventa = NEW.ordendeventa)
                 THEN 1
                 ELSE 0
               END
  WHERE ordendeventa = NEW.ordendeventa;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_actualizar_closed
AFTER INSERT OR UPDATE ON facturas
FOR EACH ROW
EXECUTE FUNCTION actualizar_closed(); 

```

## Crear una vista
Para nuestra vista generamos una consulta que se usa de manera regular, que es el backorder, basicamente esto nos muestra todos los pedidos que no estan cerrados y tienen toneladas pendientes de fabricar o de facturar

```sql 
CREATE OR REPLACE VIEW backorder AS

SELECT
T1.ordendeventa,
Tons_Req,
Tons_Prod,
Tons_Fact,
Tons_Req-Tons_Prod as Tons_Pendientes_Fabricar,
Tons_Req - Tons_Fact as Tons_Pendientes
FROM (SELECT
o.ordendeventa,
sum(o.toneladas_requeridas) as Tons_Req,
coalesce(sum(toneladasfabricadas)) as Tons_Prod,
coalesce(sum(f.toneladasentregadas)) as Tons_Fact
FROM ordenes O
left join facturas f on O.ordendeventa = f.ordendeventa
left join produccion p on O.ordendeventa=p.ordendeventa
where O.closed=0
group by o.ordendeventa
) T1 
```

