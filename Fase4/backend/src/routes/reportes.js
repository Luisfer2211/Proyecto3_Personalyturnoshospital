const express = require('express');
const router = express.Router();
const { pool } = require('../database/db');

// 1. Reporte de Turnos por Empleado
router.get('/turnos-empleado', async (req, res) => {
  const { empleadoId, fechaInicio, fechaFin, tipoTurno } = req.query;
  
  try {
    let query = `
      SELECT e.nombre, e.apellido, t.tipo, h.fecha_asignacion, t.hora_inicio, t.hora_fin
      FROM Horario h
      JOIN Empleado e ON h.id_empleado = e.id_empleado
      JOIN Turno t ON h.id_turno = t.id_turno
      WHERE 1=1`;
    
    const values = [];
    
    if (empleadoId) {
      query += ` AND e.nombre = $${values.length + 1}`;
      values.push(empleadoId);
    }
    
    if (fechaInicio && fechaFin) {
      query += ` AND h.fecha_asignacion BETWEEN $${values.length + 1} AND $${values.length + 2}`;
      values.push(fechaInicio, fechaFin);
    }
    
    if (tipoTurno) {
      query += ` AND t.tipo = $${values.length + 1}`;
      values.push(tipoTurno);
    }
    
    query += ` ORDER BY h.fecha_asignacion DESC`;
    const result = await pool.query(query, values);
    
    res.json({
      count: result.rowCount,
      data: result.rows
    });
  } catch (error) {
    console.error('Error en consulta de turnos:', error);
    res.status(500).json({ error: error.message });
  }
});

// 2. Reporte de Incidencias por Departamento
router.get('/incidencias-departamento', async (req, res) => {
  const { departamentoId, severidadMin, fechaInicio, fechaFin } = req.query;
  
  try {
    let query = `
      SELECT i.descripcion, i.fecha, i.severidad, e.nombre, d.nombre AS departamento
      FROM Incidencia i
      JOIN Empleado e ON i.id_empleado = e.id_empleado
      JOIN Departamento d ON e.id_departamento = d.id_departamento
      WHERE 1=1`;
    
    const values = [];
    
    if (departamentoId) {
      query += ` AND d.nombre = $${values.length + 1}`;
      values.push(departamentoId);
    }
    
    if (severidadMin) {
      query += ` AND i.severidad >= $${values.length + 1}`;
      values.push(severidadMin);
    }
    
    if (fechaInicio && fechaFin) {
      query += ` AND i.fecha BETWEEN $${values.length + 1} AND $${values.length + 2}`;
      values.push(fechaInicio, fechaFin);
    }
    
    query += ` ORDER BY i.fecha DESC`;
    const result = await pool.query(query, values);
    
    res.json({
      count: result.rowCount,
      data: result.rows
    });
  } catch (error) {
    console.error('Error en consulta de incidencias:', error);
    res.status(500).json({ error: error.message });
  }
});

// 3. Reporte de Permisos Solicitados
router.get('/permisos', async (req, res) => {
  const { motivo, fechaInicio, fechaFin, departamentoId } = req.query;
  
  try {
    let query = `
      SELECT p.fecha_inicio, p.fecha_fin, p.motivo, e.nombre, e.apellido, d.nombre AS departamento
      FROM Permiso p
      JOIN Empleado e ON p.id_empleado = e.id_empleado
      JOIN Departamento d ON e.id_departamento = d.id_departamento
      WHERE 1=1`;
    
    const values = [];
    
    if (fechaInicio && fechaFin) {
      query += ` AND p.fecha_inicio BETWEEN $${values.length + 1} AND $${values.length + 2}`;
      values.push(fechaInicio, fechaFin);
    }
    
    if (motivo) {
      query += ` AND p.motivo = $${values.length + 1}`;
      values.push(motivo);
    }
    
    if (departamentoId) {
      query += ` AND d.nombre = $${values.length + 1}`;
      values.push(departamentoId);
    }
    
    query += ' ORDER BY p.fecha_inicio DESC';
    const result = await pool.query(query, values);
    
    res.json({
      count: result.rowCount,
      data: result.rows
    });
  } catch (error) {
    console.error('Error en consulta de permisos:', error);
    res.status(500).json({ error: error.message });
  }
});

// 4. Reporte de Historial Médico
router.get('/historial-medico', async (req, res) => {
  const { diagnostico, fechaInicio, fechaFin, empleadoId } = req.query;
  
  try {
    let query = `
      SELECT hm.fecha_consulta, hm.diagnostico, e.nombre, e.apellido
      FROM Historial_Medico hm
      JOIN Empleado e ON hm.id_empleado = e.id_empleado
      WHERE 1=1`;
    
    const values = [];
    
    if (fechaInicio && fechaFin) {
      query += ` AND hm.fecha_consulta BETWEEN $${values.length + 1} AND $${values.length + 2}`;
      values.push(fechaInicio, fechaFin);
    }
    
    if (diagnostico) {
      query += ` AND hm.diagnostico ILIKE $${values.length + 1}`;
      values.push(`%${diagnostico}%`);
    }
    
    if (empleadoId) {
      query += ` AND e.nombre = $${values.length + 1}`;
      values.push(empleadoId);
    }
    
    query += ' ORDER BY hm.fecha_consulta DESC';
    const result = await pool.query(query, values);
    
    res.json({
      count: result.rowCount,
      data: result.rows
    });
  } catch (error) {
    console.error('Error en consulta de historial médico:', error);
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;