# Tarea 9
## Funciones 

Este documento describe dos funciones en SQL:

1. **Cálculo manual de la correlación de Pearson entre dos columnas numéricas**
2. **Cálculo de la distancia geográfica entre dos coordenadas usando la fórmula de Haversine**

---

## 1.  Función: `calcular_correlacion_manual`

Calcula manualmente el coeficiente de correlación de **Pearson** entre dos columnas de una tabla, sin usar la función `corr()` incorporada.

###  Fórmula utilizada:

$$
r = \frac{n \sum xy - \sum x \sum y}{\sqrt{(n \sum x^2 - (\sum x)^2)(n \sum y^2 - (\sum y)^2)}}
$$


### 🔧 Definición:

```sql
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

```
## 2.  Función: `haversine_distancia`

Calcula la distancia entre dos puntos geográficos dados por sus coordenadas **latitud** y **longitud**, usando la **fórmula de Haversine**.

###  Fórmula:

$$
a = \sin^2\left(\frac{\Delta \varphi}{2}\right) + \cos(\varphi_1) \cdot \cos(\varphi_2) \cdot \sin^2\left(\frac{\Delta \lambda}{2}\right)
$$

$$
c = 2 \cdot \text{atan2}(\sqrt{a}, \sqrt{1 - a})
$$

$$
d = R \cdot c
$$

Donde:

$$
 \varphi = \text{latitud en radianes}
$$
$$
 \lambda = \text{longitud en radianes}
$$
$$
 R = \text{radio de la Tierra (aprox. 6371 km)}
$$

### 🔧 Definición:

```sql
CREATE OR REPLACE FUNCTION haversine_distancia(
    lat1 DOUBLE PRECISION,
    lon1 DOUBLE PRECISION,
    lat2 DOUBLE PRECISION,
    lon2 DOUBLE PRECISION
)
RETURNS DOUBLE PRECISION AS $$
DECLARE
    radio_tierra CONSTANT DOUBLE PRECISION := 6371; -- en kilómetros
    dlat DOUBLE PRECISION;
    dlon DOUBLE PRECISION;
    a DOUBLE PRECISION;
    c DOUBLE PRECISION;
BEGIN
    dlat := radians(lat2 - lat1);
    dlon := radians(lon2 - lon1);

    a := sin(dlat/2)^2 + cos(radians(lat1)) * cos(radians(lat2)) * sin(dlon/2)^2;
    c := 2 * atan2(sqrt(a), sqrt(1 - a));

    RETURN radio_tierra * c;
END;
$$ LANGUAGE plpgsql;
```


---

##  Notas adicionales

- Ambas funciones están escritas en **PL/pgSQL** y pueden ejecutarse directamente en una base de datos PostgreSQL.
- En la función de correlación, se omiten los valores nulos automáticamente.
- La distancia se calcula en **kilómetros**, pero puedes cambiar el radio de la Tierra a 3959 si prefieres millas.

