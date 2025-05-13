const express = require('express');
const initDB = require('./database/initDB');
const app = express();

app.use(express.json());
require('dotenv').config();

initDB();

app.get('/', (req, res) => {
  res.json({ message: 'Sistema Hospitalario API' });
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Error interno');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor en puerto ${PORT}`);
});
