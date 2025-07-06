const API_URL = 'http://localhost:8000';

// Cargar datos iniciales
async function loadInitialData() {
    try {
        console.log('Cargando datos iniciales...');
        const [animales, cuidadores, habitats, especies] = await Promise.all([
            fetch(`${API_URL}/animales`).then(r => {
                if (!r.ok) throw new Error(`Error en /animales: ${r.status}`);
                return r.json();
            }),
            fetch(`${API_URL}/cuidadores`).then(r => {
                if (!r.ok) throw new Error(`Error en /cuidadores: ${r.status}`);
                return r.json();
            }),
            fetch(`${API_URL}/habitats`).then(r => {
                if (!r.ok) throw new Error(`Error en /habitats: ${r.status}`);
                return r.json();
            }),
            fetch(`${API_URL}/especies`).then(r => {
                if (!r.ok) throw new Error(`Error en /especies: ${r.status}`);
                return r.json();
            })
        ]);

        console.log('Datos recibidos:', { animales, cuidadores, habitats, especies });
        
        // Poblar los selects con los datos
        populateSelect('cuidadorSelect', cuidadores);
        populateSelect('habitatSelect', habitats);
        populateSelect('especieSelect', especies);

        mostrarAnimales(animales);
    } catch (error) {
        console.error('Error cargando datos:', error);
        alert('Error cargando datos: ' + error.message);
    }
}

// Poblar select
function populateSelect(selectId, items) {
    const select = document.getElementById(selectId);
    if (select) {
        select.innerHTML = '<option value="">Seleccione...</option>';
        items.forEach(item => {
            const option = document.createElement('option');
            option.value = item.id;
            option.textContent = item.nombre;
            select.appendChild(option);
        });
    }
}

// Registrar animal
document.getElementById('registroForm')?.addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const animalData = {
        nombre: document.getElementById('nombreAnimal').value,
        fecha_nacimiento: document.getElementById('fechaNacimiento').value,
        cuidador_id: parseInt(document.getElementById('cuidadorSelect').value),
        habitat_id: parseInt(document.getElementById('habitatSelect').value),
        especie_id: parseInt(document.getElementById('especieSelect').value)
    };

    try {
        const response = await fetch(`${API_URL}/animales`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(animalData)
        });

        if (response.ok) {
            alert('Animal registrado exitosamente');
            document.getElementById('registroForm').reset();
            const modal = bootstrap.Modal.getInstance(document.getElementById('registrarModal'));
            if (modal) modal.hide();
        } else {
            const errorData = await response.json();
            alert('Error al registrar el animal: ' + (errorData.detail || 'Error desconocido'));
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Error al registrar el animal');
    }
});

function mostrarAnimales(animales) {
    const tbody = document.querySelector('#tablaAnimales tbody');
    tbody.innerHTML = '';
    animales.forEach(animal => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${animal.id}</td>
            <td>${animal.nombre}</td>
            <td>${animal.fecha_nacimiento || ''}</td>
            <td>${animal.cuidador_id || ''}</td>
            <td>${animal.habitat_id || ''}</td>
            <td>${animal.especie_id || ''}</td>
            <td>
                <button class="btn btn-danger btn-sm" onclick="eliminarAnimal(${animal.id})">Eliminar</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

async function eliminarAnimal(id) {
    if (!confirm('¿Seguro que deseas eliminar este animal?')) return;
    try {
        const res = await fetch(`${API_URL}/animales/${id}`, { method: 'DELETE' });
        if (res.ok) {
            alert('Animal eliminado');
            loadInitialData();
        } else {
            alert('Error al eliminar el animal');
        }
    } catch (e) {
        alert('Error al eliminar el animal');
    }
}

// Event Listeners
document.addEventListener('DOMContentLoaded', () => {
    loadInitialData();
});