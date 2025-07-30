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
