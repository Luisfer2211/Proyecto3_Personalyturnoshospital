const fs = require('fs');
const path = require('path');
const { pool } = require('./db');

const initDatabase = async () => {
  try {
    // Ejecutar script de creación
    const createSql = fs.readFileSync(path.join(__dirname, 'sql/create.sql'), 'utf8');
    await pool.query(createSql);
    
    console.log('Tablas creadas exitosamente');
    
    // Ejecutar inserts (si existe el archivo)
    const insertsPath = path.join(__dirname, 'sql/inserts.sql');
    if (fs.existsSync(insertsPath)) {
      const insertSql = fs.readFileSync(insertsPath, 'utf8');
      await pool.query(insertSql);
      console.log('Datos de prueba insertados');
    }
    
  } catch (error) {
    console.error('Error inicializando BD:', error);
    process.exit(1);
  }
};

module.exports = initDatabase;
