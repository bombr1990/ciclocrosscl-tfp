-- ============================================
-- SCRIPT DE CONFIGURACIÓN DE SUPABASE
-- Tabla: deportistas
-- ============================================

-- 1. Crear la tabla deportistas
CREATE TABLE IF NOT EXISTS deportistas (
    id BIGSERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    gender TEXT NOT NULL,
    club TEXT NOT NULL,
    victories INTEGER DEFAULT 0,
    participations INTEGER DEFAULT 0,
    avatar TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- 2. Habilitar Row Level Security (RLS)
ALTER TABLE deportistas ENABLE ROW LEVEL SECURITY;

-- 3. Crear política para permitir lectura pública
CREATE POLICY "Permitir lectura pública de deportistas"
ON deportistas
FOR SELECT
TO public
USING (true);

-- 4. Crear política para inserción (solo usuarios autenticados)
-- Si quieres permitir inserción pública, cambia 'authenticated' por 'public'
CREATE POLICY "Permitir inserción a usuarios autenticados"
ON deportistas
FOR INSERT
TO authenticated
WITH CHECK (true);

-- 5. Crear política para actualización (solo usuarios autenticados)
CREATE POLICY "Permitir actualización a usuarios autenticados"
ON deportistas
FOR UPDATE
TO authenticated
USING (true);

-- 6. Crear política para eliminación (solo usuarios autenticados)
CREATE POLICY "Permitir eliminación a usuarios autenticados"
ON deportistas
FOR DELETE
TO authenticated
USING (true);

-- 7. Insertar datos de prueba
INSERT INTO deportistas (name, category, gender, club, victories, participations, avatar) VALUES
('Juan Pérez', 'elite', 'M', 'CX Santiago', 12, 45, 'https://i.pravatar.cc/150?img=12'),
('María González', 'elite', 'F', 'Team Valparaíso', 15, 38, 'https://i.pravatar.cc/150?img=5'),
('Carlos Rodríguez', 'master', 'M', 'CX Santiago', 8, 52, 'https://i.pravatar.cc/150?img=33'),
('Andrea Silva', 'junior', 'F', 'Concepción CX', 5, 20, 'https://i.pravatar.cc/150?img=9'),
('Roberto Fernández', 'master', 'M', 'Team Valparaíso', 10, 60, 'https://i.pravatar.cc/150?img=15'),
('Laura Martínez', 'elite', 'F', 'CX Santiago', 18, 42, 'https://i.pravatar.cc/150?img=20'),
('Diego López', 'principiante', 'M', 'Concepción CX', 2, 15, 'https://i.pravatar.cc/150?img=51'),
('Sofía Torres', 'junior', 'F', 'Team Valparaíso', 7, 25, 'https://i.pravatar.cc/150?img=44'),
('Andrés Morales', 'elite', 'M', 'Bike Team Sur', 14, 48, 'https://i.pravatar.cc/150?img=11'),
('Valentina Rojas', 'master', 'F', 'CX Norte', 9, 35, 'https://i.pravatar.cc/150?img=23'),
('Patricio Campos', 'principiante', 'M', 'Bike Team Sur', 3, 18, 'https://i.pravatar.cc/150?img=52'),
('Camila Vega', 'junior', 'F', 'CX Norte', 6, 22, 'https://i.pravatar.cc/150?img=31'),
('Fernando Soto', 'elite', 'M', 'Team Valparaíso', 16, 50, 'https://i.pravatar.cc/150?img=13'),
('Isidora Bravo', 'master', 'F', 'CX Santiago', 11, 40, 'https://i.pravatar.cc/150?img=26'),
('Matías Herrera', 'junior', 'M', 'Concepción CX', 4, 19, 'https://i.pravatar.cc/150?img=58');

-- 8. Crear índices para mejorar el rendimiento
CREATE INDEX idx_deportistas_category ON deportistas(category);
CREATE INDEX idx_deportistas_gender ON deportistas(gender);
CREATE INDEX idx_deportistas_club ON deportistas(club);
CREATE INDEX idx_deportistas_name ON deportistas(name);

-- 9. Función para actualizar updated_at automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = TIMEZONE('utc', NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 10. Trigger para actualizar updated_at
CREATE TRIGGER update_deportistas_updated_at
BEFORE UPDATE ON deportistas
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

-- ============================================
-- FIN DEL SCRIPT
-- ============================================
