ALTER TABLE ordenes ADD COLUMN closed integer DEFAULT 0;

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

UPDATE ordenes o
SET closed = CASE 
               WHEN (SELECT COALESCE(SUM(toneladasentregadas), 0) 
                     FROM facturas f
                     WHERE f.ordendeventa = o.ordendeventa) 
                    >= toneladas_requeridas
               THEN 1
               ELSE 0
             END;