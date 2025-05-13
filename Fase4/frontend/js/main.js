// Variables globales
let empleados = [];
let departamentos = [];

// Inicialización
document.addEventListener('DOMContentLoaded', function() {
  // Cargar datos iniciales
  cargarEmpleados();
  cargarDepartamentos();
  
  // Configurar navegación
  document.querySelectorAll('[data-report]').forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      mostrarReporte(this.getAttribute('data-report'));
    });
  });

  // Configurar botones de búsqueda
  document.getElementById('btnBuscarTurnos').addEventListener('click', buscarTurnos);
  document.getElementById('btnBuscarIncidencias').addEventListener('click', buscarIncidencias);
  document.getElementById('btnBuscarPermisos').addEventListener('click', buscarPermisos);
  document.getElementById('btnBuscarHistorial').addEventListener('click', buscarHistorial);

  // Configurar botones de exportación
  document.getElementById('btnExportarTurnos').addEventListener('click', () => exportarExcel('turnos'));
  document.getElementById('btnExportarIncidencias').addEventListener('click', () => exportarExcel('incidencias'));
  document.getElementById('btnExportarPermisos').addEventListener('click', () => exportarExcel('permisos'));
  document.getElementById('btnExportarHistorial').addEventListener('click', () => exportarExcel('historial'));

  
  document.getElementById('btnExportarTurnosPDF').addEventListener('click', () => exportarPDF('turnos'));
  document.getElementById('btnExportarIncidenciasPDF').addEventListener('click', () => exportarPDF('incidencias'));
  document.getElementById('btnExportarPermisosPDF').addEventListener('click', () => exportarPDF('permisos'));
  document.getElementById('btnExportarHistorialPDF').addEventListener('click', () => exportarPDF('historial'));

  // Mostrar reporte inicial
  mostrarReporte('turnos');
});

// Funciones para cargar datos
async function cargarEmpleados() {
  try {
    mostrarLoading(true);
    const response = await axios.get('/api/reportes/turnos-empleado', {
      params: {
        empleadoId: '',
        fechaInicio: '',
        fechaFin: '',
        tipoTurno: ''
      }
    });
    
    empleados = response.data.data;
    actualizarSelectEmpleados();
  } catch (error) {
    console.error('Error al cargar empleados:', error);
    alert('Error al cargar empleados');
  } finally {
    mostrarLoading(false);
  }
}

async function cargarDepartamentos() {
  try {
    mostrarLoading(true);
    const response = await axios.get('/api/reportes/incidencias-departamento', {
      params: {
        departamentoId: '',
        severidadMin: 1,
        fechaInicio: '',
        fechaFin: ''
      }
    });
    
    departamentos = [...new Set(response.data.data.map(item => item.departamento))];
    actualizarSelectDepartamentos();
  } catch (error) {
    console.error('Error al cargar departamentos:', error);
    alert('Error al cargar departamentos');
  } finally {
    mostrarLoading(false);
  }
}

// Funciones para actualizar selects
function actualizarSelectEmpleados() {
  const selectEmpleado = document.getElementById('empleadoId');
  const selectEmpleadoHistorial = document.getElementById('empleadoHistorial');
  
  // Limpiar selects
  selectEmpleado.innerHTML = '<option value="">Todos</option>';
  selectEmpleadoHistorial.innerHTML = '<option value="">Todos</option>';
  
  // Agregar empleados únicos
  const empleadosUnicos = [...new Map(empleados.map(item => [item.nombre, item])).values()];
  
  empleadosUnicos.forEach(empleado => {
    const option = document.createElement('option');
    option.value = empleado.nombre;
    option.textContent = empleado.nombre;
    
    selectEmpleado.appendChild(option.cloneNode(true));
    selectEmpleadoHistorial.appendChild(option);
  });
}

function actualizarSelectDepartamentos() {
  const selectDepartamento = document.getElementById('departamentoId');
  const selectDepartamentoPermiso = document.getElementById('departamentoPermiso');
  
  // Limpiar selects
  selectDepartamento.innerHTML = '<option value="">Todos</option>';
  selectDepartamentoPermiso.innerHTML = '<option value="">Todos</option>';
  
  // Agregar departamentos
  departamentos.forEach(depto => {
    const option = document.createElement('option');
    option.value = depto;
    option.textContent = depto;
    
    selectDepartamento.appendChild(option.cloneNode(true));
    selectDepartamentoPermiso.appendChild(option);
  });
}

// Funciones para mostrar reportes
function mostrarReporte(reporte) {
  // Ocultar todos los reportes
  document.querySelectorAll('.report-section').forEach(section => {
    section.style.display = 'none';
  });
  
  // Mostrar el reporte seleccionado
  document.getElementById(`${reporte}-report`).style.display = 'block';
  
  // Actualizar el menú de navegación
  document.querySelectorAll('[data-report]').forEach(link => {
    link.classList.remove('active');
  });
  document.querySelector(`[data-report="${reporte}"]`).classList.add('active');
}

// Funciones para buscar datos
async function buscarTurnos() {
  try {
    mostrarLoading(true);
    const params = {
      empleadoId: document.getElementById('empleadoId').value,
      tipoTurno: document.getElementById('tipoTurno').value,
      fechaInicio: document.getElementById('fechaInicioTurnos').value,
      fechaFin: document.getElementById('fechaFinTurnos').value
    };
    
    const response = await axios.get('/api/reportes/turnos-empleado', { params });
    actualizarTablaTurnos(response.data.data);
  } catch (error) {
    console.error('Error al buscar turnos:', error);
    alert('Error al buscar turnos');
  } finally {
    mostrarLoading(false);
  }
}

async function buscarIncidencias() {
  try {
    mostrarLoading(true);
    const params = {
      departamentoId: document.getElementById('departamentoId').value,
      severidadMin: document.getElementById('severidadMin').value,
      fechaInicio: document.getElementById('fechaInicioIncidencias').value,
      fechaFin: document.getElementById('fechaFinIncidencias').value
    };
    
    const response = await axios.get('/api/reportes/incidencias-departamento', { params });
    actualizarTablaIncidencias(response.data.data);
  } catch (error) {
    console.error('Error al buscar incidencias:', error);
    alert('Error al buscar incidencias');
  } finally {
    mostrarLoading(false);
  }
}

async function buscarPermisos() {
  try {
    mostrarLoading(true);
    const params = {
      motivo: document.getElementById('motivoPermiso').value,
      departamentoId: document.getElementById('departamentoPermiso').value,
      fechaInicio: document.getElementById('fechaInicioPermisos').value,
      fechaFin: document.getElementById('fechaFinPermisos').value
    };
    
    const response = await axios.get('/api/reportes/permisos', { params });
    actualizarTablaPermisos(response.data.data);
  } catch (error) {
    console.error('Error al buscar permisos:', error);
    alert('Error al buscar permisos');
  } finally {
    mostrarLoading(false);
  }
}

async function buscarHistorial() {
  try {
    mostrarLoading(true);
    const params = {
      diagnostico: document.getElementById('diagnosticoHistorial').value,
      empleadoId: document.getElementById('empleadoHistorial').value,
      fechaInicio: document.getElementById('fechaInicioHistorial').value,
      fechaFin: document.getElementById('fechaFinHistorial').value
    };
    
    const response = await axios.get('/api/reportes/historial-medico', { params });
    actualizarTablaHistorial(response.data.data);
  } catch (error) {
    console.error('Error al buscar historial médico:', error);
    alert('Error al buscar historial médico');
  } finally {
    mostrarLoading(false);
  }
}

// Funciones para actualizar tablas
function actualizarTablaTurnos(data) {
  const tbody = document.getElementById('turnosTableBody');
  tbody.innerHTML = '';
  
  data.forEach(item => {
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td>${item.nombre} ${item.apellido || ''}</td>
      <td>${item.tipo}</td>
      <td>${item.fecha_asignacion}</td>
      <td>${item.hora_inicio}</td>
      <td>${item.hora_fin}</td>
    `;
    tbody.appendChild(tr);
  });
}

function actualizarTablaIncidencias(data) {
  const tbody = document.getElementById('incidenciasTableBody');
  tbody.innerHTML = '';
  
  data.forEach(item => {
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td>${item.nombre}</td>
      <td>${item.departamento}</td>
      <td>${item.descripcion}</td>
      <td>${item.fecha}</td>
      <td>${item.severidad}</td>
    `;
    tbody.appendChild(tr);
  });
}

function actualizarTablaPermisos(data) {
  const tbody = document.getElementById('permisosTableBody');
  tbody.innerHTML = '';
  
  data.forEach(item => {
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td>${item.nombre} ${item.apellido || ''}</td>
      <td>${item.departamento}</td>
      <td>${item.motivo}</td>
      <td>${item.fecha_inicio}</td>
      <td>${item.fecha_fin}</td>
    `;
    tbody.appendChild(tr);
  });
}

function actualizarTablaHistorial(data) {
  const tbody = document.getElementById('historialTableBody');
  tbody.innerHTML = '';
  
  data.forEach(item => {
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td>${item.nombre} ${item.apellido || ''}</td>
      <td>${item.fecha_consulta}</td>
      <td>${item.diagnostico}</td>
    `;
    tbody.appendChild(tr);
  });
}

// Función para exportar a Excel
function exportarExcel(tipo) {
  let table, fileName;
  
  switch(tipo) {
    case 'turnos':
      table = document.getElementById('turnosTableBody');
      fileName = 'reporte_turnos.xlsx';
      break;
    case 'incidencias':
      table = document.getElementById('incidenciasTableBody');
      fileName = 'reporte_incidencias.xlsx';
      break;
    case 'permisos':
      table = document.getElementById('permisosTableBody');
      fileName = 'reporte_permisos.xlsx';
      break;
    case 'historial':
      table = document.getElementById('historialTableBody');
      fileName = 'reporte_historial.xlsx';
      break;
    default:
      return;
  }
  
  // Crear hoja de trabajo
  const ws = XLSX.utils.table_to_sheet(table);
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, "Reporte");
  
  // Descargar archivo
  XLSX.writeFile(wb, fileName);
}

function exportarPDF(tipo) {
  const { jsPDF } = window.jspdf;
  const doc = new jsPDF();
  let table, title;

  switch(tipo) {
    case 'turnos':
      table = document.querySelector('#turnos-report table');
      title = 'Reporte de Turnos';
      break;
    case 'incidencias':
      table = document.querySelector('#incidencias-report table');
      title = 'Reporte de Incidencias';
      break;
    case 'permisos':
      table = document.querySelector('#permisos-report table');
      title = 'Reporte de Permisos';
      break;
    case 'historial':
      table = document.querySelector('#historial-report table');
      title = 'Reporte de Historial Médico';
      break;
    default:
      return;
  }

  html2canvas(table).then((canvas) => {
    const imgData = canvas.toDataURL('image/png');
    const imgWidth = doc.internal.pageSize.getWidth() - 20;
    const imgHeight = (canvas.height * imgWidth) / canvas.width;

    doc.setFontSize(18);
    doc.text(title, 10, 10);
    doc.addImage(imgData, 'PNG', 10, 20, imgWidth, imgHeight);
    doc.save(`reporte_${tipo}.pdf`);
  });
}

// Función para mostrar/ocultar loading
function mostrarLoading(mostrar) {
  document.getElementById('loading').style.display = mostrar ? 'block' : 'none';
}