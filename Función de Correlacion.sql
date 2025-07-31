CREATE OR REPLACE FUNCTION calcular_correlacion_manual(
    tabla TEXT,
    columna_x TEXT,
    columna_y TEXT
)
RETURNS NUMERIC AS $$
DECLARE
    consulta TEXT;
    sum_x NUMERIC;
    sum_y NUMERIC;
    sum_xy NUMERIC;
    sum_x2 NUMERIC;
    sum_y2 NUMERIC;
    n INTEGER;
    numerador NUMERIC;
    denominador NUMERIC;
    correlacion NUMERIC;
BEGIN
    consulta := format('
        SELECT 
            COUNT(*)::INT,
            SUM(%I)::NUMERIC,
            SUM(%I)::NUMERIC,
            SUM(%I * %I)::NUMERIC,
            SUM(POWER(%I, 2))::NUMERIC,
            SUM(POWER(%I, 2))::NUMERIC
        FROM %I
        WHERE %I IS NOT NULL AND %I IS NOT NULL',
        columna_x, columna_y, columna_x, columna_y, columna_x, columna_y,
        tabla, columna_x, columna_y
    );

    EXECUTE consulta INTO n, sum_x, sum_y, sum_xy, sum_x2, sum_y2;

    numerador := n * sum_xy - sum_x * sum_y;
    denominador := sqrt((n * sum_x2 - sum_x^2) * (n * sum_y2 - sum_y^2));

    IF denominador = 0 THEN
        RETURN NULL; -- No se puede dividir entre 0
    END IF;

    correlacion := numerador / denominador;

    RETURN correlacion;
END;
$$ LANGUAGE plpgsql;