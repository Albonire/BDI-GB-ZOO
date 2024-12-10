from database import db

class Animal(db.Model):
    __tablename__ = 'animales'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(50), nullable=False)
    fecha_nacim = db.Column(db.Date)
    id_especie = db.Column(db.Integer, db.ForeignKey('especie.id'))
    id_habitat = db.Column(db.Integer, db.ForeignKey('habitat.id'))
    id_cuidador = db.Column(db.Integer, db.ForeignKey('cuidadores.id'))
