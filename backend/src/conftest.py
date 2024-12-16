# backend/src/conftest.py
import sys
from pathlib import Path

# Obtener la ruta del directorio actual
current_dir = Path(__file__).parent.parent
sys.path.append(str(current_dir))