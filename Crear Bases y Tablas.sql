-- Tabla: Clientes
CREATE TABLE Clientes (
    Cliente SERIAL PRIMARY KEY,
    Nombre VARCHAR(100),
    Dirección TEXT,
    FechaAlta DATE,
    Estatus VARCHAR(50),
    credito NUMERIC(10, 2),
    dias_Cred INT,
    nacional BOOLEAN
);

-- Tabla: Articulos
CREATE TABLE Articulos (
    sku SERIAL PRIMARY KEY,
    Descripción TEXT,
    Familia VARCHAR(50),
    SubFamilia VARCHAR(50),
    PesoBase VARCHAR(50)
);

-- Tabla: Ordenes
CREATE TABLE Ordenes (
    OrdendeVenta SERIAL PRIMARY KEY,
    Cliente INT REFERENCES Clientes(Cliente),
    sku INT REFERENCES Articulos(sku),
    toneladas_requeridas NUMERIC(10, 2),
    Maquina VARCHAR(50),
    ancho NUMERIC(10, 2),
    largo NUMERIC(10, 2),
    fecha_de_Alta DATE,
    fecha_de_embarque_requerida DATE,
    fecha_de_producción_requerida DATE,
    Venta_de_Inventario BOOLEAN
);

-- Tabla: Producción
CREATE TABLE Producción (
    Job SERIAL PRIMARY KEY,
    OrdendeVenta INT REFERENCES Ordenes(OrdendeVenta),
    NúmerodeLote INT,
    Cliente INT REFERENCES Clientes(Cliente),
    sku INT REFERENCES Articulos(sku),
    Vendedor VARCHAR(100),
    toneladasrequeridas NUMERIC(10, 2),
    toneladasfabricadas NUMERIC(10, 2),
    Maquina VARCHAR(50),
    ancho NUMERIC(10, 2),
    largo NUMERIC(10, 2),
    fechadeproducción DATE,
    NúmerodeLote_p int
);

-- Tabla: Facturas
CREATE TABLE Facturas (
    Facura_id SERIAL PRIMARY KEY,
    OrdendeVenta INT REFERENCES Ordenes(OrdendeVenta),
    Cliente INT REFERENCES Clientes(Cliente),
    Vendedor VARCHAR(100),
    sku INT REFERENCES Articulos(sku),
    NúmerodeLote INT,
    Fecha_de_Orden DATE,
    Fecha_de_entrega DATE,
    Venta_de_Inventario BOOLEAN,
    Calidad VARCHAR(50),
    Número_de_Remisión INT,
    ToneladasOrdenadas NUMERIC(10, 2),
    Toneladasentregadas NUMERIC(10, 2),
    NúmerodeLote_f int
);