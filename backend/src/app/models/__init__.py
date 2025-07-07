from src.app.models.clima import ClimaModel
from src.app.models.ubicacion import UbicacionModel
from src.app.models.habitat import HabitatModel
from src.app.models.especie import EspecieModel
from src.app.models.animales import AnimalesModel
from src.app.models.especialidad import EspecialidadModel
from src.app.models.cuidador import CuidadorModel
from src.app.models.estado_conservacion import EstadoConservacionModel
from src.app.models.familia import FamiliaModel

# Asegúrate de que todos los modelos estén disponibles al importar desde models
__all__ = [
    "ClimaModel",
    "UbicacionModel",
    "HabitatModel",
    "EspecieModel",
    "AnimalesModel",
    "EspecialidadModel",
    "CuidadorModel",
    "EstadoConservacionModel",
    "FamiliaModel"
]