"""crear tablas nuevamente

Revision ID: 31268014def3
Revises: 
Create Date: 2024-12-14 18:00:13.228296

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '31268014def3'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('climas',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre', sa.String(length=50), nullable=True),
    sa.Column('descripcion', sa.String(length=200), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_climas_id'), 'climas', ['id'], unique=False)
    op.create_table('especialidades',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre', sa.String(length=50), nullable=True),
    sa.Column('descripcion', sa.String(length=200), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_especialidades_id'), 'especialidades', ['id'], unique=False)
    op.create_table('estados_conservacion',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre', sa.String(length=50), nullable=True),
    sa.Column('descripcion', sa.String(length=200), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_estados_conservacion_id'), 'estados_conservacion', ['id'], unique=False)
    op.create_table('ubicaciones',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre', sa.String(length=50), nullable=True),
    sa.Column('descripcion', sa.String(length=200), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_ubicaciones_id'), 'ubicaciones', ['id'], unique=False)
    op.create_table('cuidadores',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre', sa.String(length=50), nullable=True),
    sa.Column('apellido', sa.String(length=50), nullable=True),
    sa.Column('dni', sa.String(length=20), nullable=True),
    sa.Column('telefono', sa.String(length=20), nullable=True),
    sa.Column('especialidad_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['especialidad_id'], ['especialidades.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_cuidadores_id'), 'cuidadores', ['id'], unique=False)
    op.create_table('habitats',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre', sa.String(length=50), nullable=True),
    sa.Column('descripcion', sa.String(length=200), nullable=True),
    sa.Column('clima_id', sa.Integer(), nullable=True),
    sa.Column('ubicacion_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['clima_id'], ['climas.id'], ),
    sa.ForeignKeyConstraint(['ubicacion_id'], ['ubicaciones.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_habitats_id'), 'habitats', ['id'], unique=False)
    op.create_table('especies',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre_cientifico', sa.String(length=100), nullable=True),
    sa.Column('nombre_comun', sa.String(length=100), nullable=True),
    sa.Column('descripcion', sa.String(length=500), nullable=True),
    sa.Column('habitat_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['habitat_id'], ['habitats.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_especies_id'), 'especies', ['id'], unique=False)
    op.create_table('animales',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('nombre', sa.String(length=50), nullable=True),
    sa.Column('fecha_nacimiento', sa.Date(), nullable=True),
    sa.Column('sexo', sa.String(length=1), nullable=True),
    sa.Column('especie_id', sa.Integer(), nullable=True),
    sa.Column('habitat_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['especie_id'], ['especies.id'], ),
    sa.ForeignKeyConstraint(['habitat_id'], ['habitats.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_index(op.f('ix_animales_id'), 'animales', ['id'], unique=False)
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_index(op.f('ix_animales_id'), table_name='animales')
    op.drop_table('animales')
    op.drop_index(op.f('ix_especies_id'), table_name='especies')
    op.drop_table('especies')
    op.drop_index(op.f('ix_habitats_id'), table_name='habitats')
    op.drop_table('habitats')
    op.drop_index(op.f('ix_cuidadores_id'), table_name='cuidadores')
    op.drop_table('cuidadores')
    op.drop_index(op.f('ix_ubicaciones_id'), table_name='ubicaciones')
    op.drop_table('ubicaciones')
    op.drop_index(op.f('ix_estados_conservacion_id'), table_name='estados_conservacion')
    op.drop_table('estados_conservacion')
    op.drop_index(op.f('ix_especialidades_id'), table_name='especialidades')
    op.drop_table('especialidades')
    op.drop_index(op.f('ix_climas_id'), table_name='climas')
    op.drop_table('climas')
    # ### end Alembic commands ###
