const express = require('express');
const cors = require('cors');
const initDB = require('./database/initDB');
const app = express();

app.use(cors({
  origin: '*', 
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(express.json());
require('dotenv').config();

initDB();

const reportesRouter = require('./routes/reportes');
app.use('/api/reportes', reportesRouter);

app.use(express.static('public'));

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