PGDMP       8            
    |         	   zoologico    17.0    17.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24582 	   zoologico    DATABASE     u   CREATE DATABASE zoologico WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es_CO.UTF-8';
    DROP DATABASE zoologico;
                     postgres    false            �           0    0    DATABASE zoologico    ACL     -   GRANT ALL ON DATABASE zoologico TO adminzoo;
                        postgres    false    5008                        2615    25729    animals    SCHEMA        CREATE SCHEMA animals;
    DROP SCHEMA animals;
                     adminzoo    false            �            1255    25892 $   calcular_descuento(numeric, numeric)    FUNCTION     L  CREATE FUNCTION animals.calcular_descuento(p_costo_base numeric, p_descuento numeric) RETURNS numeric
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_costo_final NUMERIC;
BEGIN
    -- Calcular el costo final aplicando el descuento
    v_costo_final := p_costo_base * (1 - p_descuento / 100);
    RETURN v_costo_final;
END;
$$;
 U   DROP FUNCTION animals.calcular_descuento(p_costo_base numeric, p_descuento numeric);
       animals               adminzoo    false    6            	           1255    25894 (   registrar_visita(integer, integer, date) 	   PROCEDURE       CREATE PROCEDURE animals.registrar_visita(IN p_id_habitat integer, IN p_id_visitante integer, IN p_fecha_visita date)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_costo_base NUMERIC;
    v_descuento NUMERIC;
    v_costo_final NUMERIC;
BEGIN
    -- Obtener el costo base del hÃ¡bitat
    SELECT CostoBase 
    INTO v_costo_base 
    FROM animals.Habitat 
    WHERE ID = p_id_habitat;

    -- Obtener el descuento del tipo de visitante
    SELECT 
            Descuento 
    INTO    v_descuento 
    FROM animals.TIPO_VISITANTES TV
    JOIN animals.VISITANTES V ON V.IDTipoVisitante = TV.ID
    WHERE V.ID = p_id_visitante;

    -- Llamar a la funciÃ³n para calcular el costo final
    v_costo_final := animals.calcular_descuento(v_costo_base, v_descuento);

    -- Insertar la visita en la tabla Habitat_Visitantes con el costo calculado
    INSERT INTO animals.HABITAT_VISITANTES (IDHabitat, IDVisitantes, FechaVisita, CostoFinal)
    VALUES (p_id_habitat, p_id_visitante, p_fecha_visita, v_costo_final);
END;
$$;
 u   DROP PROCEDURE animals.registrar_visita(IN p_id_habitat integer, IN p_id_visitante integer, IN p_fecha_visita date);
       animals               adminzoo    false    6            �            1259    25734    animales    TABLE     �   CREATE TABLE animals.animales (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    fechanac date,
    idcuidador integer NOT NULL,
    idhabitat integer NOT NULL,
    idespecie integer NOT NULL
);
    DROP TABLE animals.animales;
       animals         heap r       adminzoo    false    6            �            1259    25730    animales_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.animales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE animals.animales_id_seq;
       animals               adminzoo    false    6    222            �           0    0    animales_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE animals.animales_id_seq OWNED BY animals.animales.id;
          animals               adminzoo    false    218            �            1259    25731    animales_idcuidador_seq    SEQUENCE     �   CREATE SEQUENCE animals.animales_idcuidador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE animals.animales_idcuidador_seq;
       animals               adminzoo    false    6    222            �           0    0    animales_idcuidador_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE animals.animales_idcuidador_seq OWNED BY animals.animales.idcuidador;
          animals               adminzoo    false    219            �            1259    25733    animales_idespecie_seq    SEQUENCE     �   CREATE SEQUENCE animals.animales_idespecie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE animals.animales_idespecie_seq;
       animals               adminzoo    false    222    6            �           0    0    animales_idespecie_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE animals.animales_idespecie_seq OWNED BY animals.animales.idespecie;
          animals               adminzoo    false    221            �            1259    25732    animales_idhabitat_seq    SEQUENCE     �   CREATE SEQUENCE animals.animales_idhabitat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE animals.animales_idhabitat_seq;
       animals               adminzoo    false    222    6            �           0    0    animales_idhabitat_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE animals.animales_idhabitat_seq OWNED BY animals.animales.idhabitat;
          animals               adminzoo    false    220            �            1259    25803    clima    TABLE     c   CREATE TABLE animals.clima (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE animals.clima;
       animals         heap r       adminzoo    false    6            �            1259    25802    clima_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.clima_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE animals.clima_id_seq;
       animals               adminzoo    false    6    243            �           0    0    clima_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE animals.clima_id_seq OWNED BY animals.clima.id;
          animals               adminzoo    false    242            �            1259    25745    cuidador    TABLE     �   CREATE TABLE animals.cuidador (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    fechacontratacion date NOT NULL,
    salario numeric(10,2) NOT NULL,
    idespecialidad integer NOT NULL
);
    DROP TABLE animals.cuidador;
       animals         heap r       adminzoo    false    6            �            1259    25743    cuidador_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.cuidador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE animals.cuidador_id_seq;
       animals               adminzoo    false    6    225            �           0    0    cuidador_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE animals.cuidador_id_seq OWNED BY animals.cuidador.id;
          animals               adminzoo    false    223            �            1259    25744    cuidador_idespecialidad_seq    SEQUENCE     �   CREATE SEQUENCE animals.cuidador_idespecialidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE animals.cuidador_idespecialidad_seq;
       animals               adminzoo    false    225    6            �           0    0    cuidador_idespecialidad_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE animals.cuidador_idespecialidad_seq OWNED BY animals.cuidador.idespecialidad;
          animals               adminzoo    false    224            �            1259    25753    especialidad    TABLE     j   CREATE TABLE animals.especialidad (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
 !   DROP TABLE animals.especialidad;
       animals         heap r       adminzoo    false    6            �            1259    25752    especialidad_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.especialidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE animals.especialidad_id_seq;
       animals               adminzoo    false    6    227            �           0    0    especialidad_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE animals.especialidad_id_seq OWNED BY animals.especialidad.id;
          animals               adminzoo    false    226            �            1259    25762    especie    TABLE     �   CREATE TABLE animals.especie (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idfamilia integer NOT NULL,
    idestadoconservacion integer NOT NULL
);
    DROP TABLE animals.especie;
       animals         heap r       adminzoo    false    6            �            1259    25759    especie_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.especie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE animals.especie_id_seq;
       animals               adminzoo    false    6    231            �           0    0    especie_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE animals.especie_id_seq OWNED BY animals.especie.id;
          animals               adminzoo    false    228            �            1259    25761     especie_idestadoconservacion_seq    SEQUENCE     �   CREATE SEQUENCE animals.especie_idestadoconservacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE animals.especie_idestadoconservacion_seq;
       animals               adminzoo    false    231    6            �           0    0     especie_idestadoconservacion_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE animals.especie_idestadoconservacion_seq OWNED BY animals.especie.idestadoconservacion;
          animals               adminzoo    false    230            �            1259    25760    especie_idfamilia_seq    SEQUENCE     �   CREATE SEQUENCE animals.especie_idfamilia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE animals.especie_idfamilia_seq;
       animals               adminzoo    false    6    231            �           0    0    especie_idfamilia_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE animals.especie_idfamilia_seq OWNED BY animals.especie.idfamilia;
          animals               adminzoo    false    229            �            1259    25778    estado_conservacion    TABLE     �   CREATE TABLE animals.estado_conservacion (
    id integer NOT NULL,
    codigo character varying(2) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(50) NOT NULL
);
 (   DROP TABLE animals.estado_conservacion;
       animals         heap r       adminzoo    false    6            �            1259    25777    estado_conservacion_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.estado_conservacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE animals.estado_conservacion_id_seq;
       animals               adminzoo    false    235    6            �           0    0    estado_conservacion_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE animals.estado_conservacion_id_seq OWNED BY animals.estado_conservacion.id;
          animals               adminzoo    false    234            �            1259    25771    familia    TABLE     �   CREATE TABLE animals.familia (
    id integer NOT NULL,
    nombrecientifico character varying(50) NOT NULL,
    nombrecomun character varying(50) NOT NULL
);
    DROP TABLE animals.familia;
       animals         heap r       adminzoo    false    6            �            1259    25770    familia_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.familia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE animals.familia_id_seq;
       animals               adminzoo    false    6    233            �           0    0    familia_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE animals.familia_id_seq OWNED BY animals.familia.id;
          animals               adminzoo    false    232            �            1259    25787    habitat    TABLE     �   CREATE TABLE animals.habitat (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idubicacion integer NOT NULL,
    costobase numeric(10,2) NOT NULL,
    idclima integer NOT NULL
);
    DROP TABLE animals.habitat;
       animals         heap r       adminzoo    false    6            �            1259    25784    habitat_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE animals.habitat_id_seq;
       animals               adminzoo    false    239    6            �           0    0    habitat_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE animals.habitat_id_seq OWNED BY animals.habitat.id;
          animals               adminzoo    false    236            �            1259    25786    habitat_idclima_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_idclima_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE animals.habitat_idclima_seq;
       animals               adminzoo    false    6    239            �           0    0    habitat_idclima_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE animals.habitat_idclima_seq OWNED BY animals.habitat.idclima;
          animals               adminzoo    false    238            �            1259    25785    habitat_idubicacion_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_idubicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE animals.habitat_idubicacion_seq;
       animals               adminzoo    false    239    6            �           0    0    habitat_idubicacion_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE animals.habitat_idubicacion_seq OWNED BY animals.habitat.idubicacion;
          animals               adminzoo    false    237            �            1259    25829    habitat_visitantes    TABLE     �   CREATE TABLE animals.habitat_visitantes (
    id integer NOT NULL,
    idhabitat integer NOT NULL,
    idvisitantes integer NOT NULL,
    costofinal numeric(10,2) NOT NULL,
    fechavisita date
);
 '   DROP TABLE animals.habitat_visitantes;
       animals         heap r       adminzoo    false    6            �            1259    25826    habitat_visitantes_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_visitantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE animals.habitat_visitantes_id_seq;
       animals               adminzoo    false    6    252            �           0    0    habitat_visitantes_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE animals.habitat_visitantes_id_seq OWNED BY animals.habitat_visitantes.id;
          animals               adminzoo    false    249            �            1259    25827     habitat_visitantes_idhabitat_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_visitantes_idhabitat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE animals.habitat_visitantes_idhabitat_seq;
       animals               adminzoo    false    6    252            �           0    0     habitat_visitantes_idhabitat_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE animals.habitat_visitantes_idhabitat_seq OWNED BY animals.habitat_visitantes.idhabitat;
          animals               adminzoo    false    250            �            1259    25828 #   habitat_visitantes_idvisitantes_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_visitantes_idvisitantes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE animals.habitat_visitantes_idvisitantes_seq;
       animals               adminzoo    false    252    6            �           0    0 #   habitat_visitantes_idvisitantes_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE animals.habitat_visitantes_idvisitantes_seq OWNED BY animals.habitat_visitantes.idvisitantes;
          animals               adminzoo    false    251            �            1259    25810    tipo_visitantes    TABLE     
  CREATE TABLE animals.tipo_visitantes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descuento numeric(5,2) NOT NULL,
    CONSTRAINT tipo_visitantes_descuento_check CHECK (((descuento >= (0)::numeric) AND (descuento <= (100)::numeric)))
);
 $   DROP TABLE animals.tipo_visitantes;
       animals         heap r       adminzoo    false    6            �            1259    25809    tipo_visitantes_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.tipo_visitantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE animals.tipo_visitantes_id_seq;
       animals               adminzoo    false    245    6            �           0    0    tipo_visitantes_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE animals.tipo_visitantes_id_seq OWNED BY animals.tipo_visitantes.id;
          animals               adminzoo    false    244            �            1259    25796 	   ubicacion    TABLE     g   CREATE TABLE animals.ubicacion (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE animals.ubicacion;
       animals         heap r       adminzoo    false    6            �            1259    25795    ubicacion_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.ubicacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE animals.ubicacion_id_seq;
       animals               adminzoo    false    241    6            �           0    0    ubicacion_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE animals.ubicacion_id_seq OWNED BY animals.ubicacion.id;
          animals               adminzoo    false    240            �            1259    25819 
   visitantes    TABLE     �   CREATE TABLE animals.visitantes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idtipovisitante integer NOT NULL
);
    DROP TABLE animals.visitantes;
       animals         heap r       adminzoo    false    6            �            1259    25817    visitantes_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.visitantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE animals.visitantes_id_seq;
       animals               adminzoo    false    248    6            �           0    0    visitantes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE animals.visitantes_id_seq OWNED BY animals.visitantes.id;
          animals               adminzoo    false    246            �            1259    25818    visitantes_idtipovisitante_seq    SEQUENCE     �   CREATE SEQUENCE animals.visitantes_idtipovisitante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE animals.visitantes_idtipovisitante_seq;
       animals               adminzoo    false    6    248            �           0    0    visitantes_idtipovisitante_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE animals.visitantes_idtipovisitante_seq OWNED BY animals.visitantes.idtipovisitante;
          animals               adminzoo    false    247            �           2604    25737    animales id    DEFAULT     l   ALTER TABLE ONLY animals.animales ALTER COLUMN id SET DEFAULT nextval('animals.animales_id_seq'::regclass);
 ;   ALTER TABLE animals.animales ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    222    218    222            �           2604    25738    animales idcuidador    DEFAULT     |   ALTER TABLE ONLY animals.animales ALTER COLUMN idcuidador SET DEFAULT nextval('animals.animales_idcuidador_seq'::regclass);
 C   ALTER TABLE animals.animales ALTER COLUMN idcuidador DROP DEFAULT;
       animals               adminzoo    false    222    219    222            �           2604    25739    animales idhabitat    DEFAULT     z   ALTER TABLE ONLY animals.animales ALTER COLUMN idhabitat SET DEFAULT nextval('animals.animales_idhabitat_seq'::regclass);
 B   ALTER TABLE animals.animales ALTER COLUMN idhabitat DROP DEFAULT;
       animals               adminzoo    false    220    222    222            �           2604    25740    animales idespecie    DEFAULT     z   ALTER TABLE ONLY animals.animales ALTER COLUMN idespecie SET DEFAULT nextval('animals.animales_idespecie_seq'::regclass);
 B   ALTER TABLE animals.animales ALTER COLUMN idespecie DROP DEFAULT;
       animals               adminzoo    false    222    221    222            �           2604    25806    clima id    DEFAULT     f   ALTER TABLE ONLY animals.clima ALTER COLUMN id SET DEFAULT nextval('animals.clima_id_seq'::regclass);
 8   ALTER TABLE animals.clima ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    243    242    243            �           2604    25748    cuidador id    DEFAULT     l   ALTER TABLE ONLY animals.cuidador ALTER COLUMN id SET DEFAULT nextval('animals.cuidador_id_seq'::regclass);
 ;   ALTER TABLE animals.cuidador ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    223    225    225            �           2604    25749    cuidador idespecialidad    DEFAULT     �   ALTER TABLE ONLY animals.cuidador ALTER COLUMN idespecialidad SET DEFAULT nextval('animals.cuidador_idespecialidad_seq'::regclass);
 G   ALTER TABLE animals.cuidador ALTER COLUMN idespecialidad DROP DEFAULT;
       animals               adminzoo    false    224    225    225            �           2604    25756    especialidad id    DEFAULT     t   ALTER TABLE ONLY animals.especialidad ALTER COLUMN id SET DEFAULT nextval('animals.especialidad_id_seq'::regclass);
 ?   ALTER TABLE animals.especialidad ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    227    226    227            �           2604    25765 
   especie id    DEFAULT     j   ALTER TABLE ONLY animals.especie ALTER COLUMN id SET DEFAULT nextval('animals.especie_id_seq'::regclass);
 :   ALTER TABLE animals.especie ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    228    231    231            �           2604    25766    especie idfamilia    DEFAULT     x   ALTER TABLE ONLY animals.especie ALTER COLUMN idfamilia SET DEFAULT nextval('animals.especie_idfamilia_seq'::regclass);
 A   ALTER TABLE animals.especie ALTER COLUMN idfamilia DROP DEFAULT;
       animals               adminzoo    false    229    231    231            �           2604    25767    especie idestadoconservacion    DEFAULT     �   ALTER TABLE ONLY animals.especie ALTER COLUMN idestadoconservacion SET DEFAULT nextval('animals.especie_idestadoconservacion_seq'::regclass);
 L   ALTER TABLE animals.especie ALTER COLUMN idestadoconservacion DROP DEFAULT;
       animals               adminzoo    false    230    231    231            �           2604    25781    estado_conservacion id    DEFAULT     �   ALTER TABLE ONLY animals.estado_conservacion ALTER COLUMN id SET DEFAULT nextval('animals.estado_conservacion_id_seq'::regclass);
 F   ALTER TABLE animals.estado_conservacion ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    235    234    235            �           2604    25774 
   familia id    DEFAULT     j   ALTER TABLE ONLY animals.familia ALTER COLUMN id SET DEFAULT nextval('animals.familia_id_seq'::regclass);
 :   ALTER TABLE animals.familia ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    233    232    233            �           2604    25790 
   habitat id    DEFAULT     j   ALTER TABLE ONLY animals.habitat ALTER COLUMN id SET DEFAULT nextval('animals.habitat_id_seq'::regclass);
 :   ALTER TABLE animals.habitat ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    236    239    239            �           2604    25791    habitat idubicacion    DEFAULT     |   ALTER TABLE ONLY animals.habitat ALTER COLUMN idubicacion SET DEFAULT nextval('animals.habitat_idubicacion_seq'::regclass);
 C   ALTER TABLE animals.habitat ALTER COLUMN idubicacion DROP DEFAULT;
       animals               adminzoo    false    237    239    239            �           2604    25792    habitat idclima    DEFAULT     t   ALTER TABLE ONLY animals.habitat ALTER COLUMN idclima SET DEFAULT nextval('animals.habitat_idclima_seq'::regclass);
 ?   ALTER TABLE animals.habitat ALTER COLUMN idclima DROP DEFAULT;
       animals               adminzoo    false    239    238    239            �           2604    25832    habitat_visitantes id    DEFAULT     �   ALTER TABLE ONLY animals.habitat_visitantes ALTER COLUMN id SET DEFAULT nextval('animals.habitat_visitantes_id_seq'::regclass);
 E   ALTER TABLE animals.habitat_visitantes ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    249    252    252            �           2604    25833    habitat_visitantes idhabitat    DEFAULT     �   ALTER TABLE ONLY animals.habitat_visitantes ALTER COLUMN idhabitat SET DEFAULT nextval('animals.habitat_visitantes_idhabitat_seq'::regclass);
 L   ALTER TABLE animals.habitat_visitantes ALTER COLUMN idhabitat DROP DEFAULT;
       animals               adminzoo    false    252    250    252            �           2604    25834    habitat_visitantes idvisitantes    DEFAULT     �   ALTER TABLE ONLY animals.habitat_visitantes ALTER COLUMN idvisitantes SET DEFAULT nextval('animals.habitat_visitantes_idvisitantes_seq'::regclass);
 O   ALTER TABLE animals.habitat_visitantes ALTER COLUMN idvisitantes DROP DEFAULT;
       animals               adminzoo    false    252    251    252            �           2604    25813    tipo_visitantes id    DEFAULT     z   ALTER TABLE ONLY animals.tipo_visitantes ALTER COLUMN id SET DEFAULT nextval('animals.tipo_visitantes_id_seq'::regclass);
 B   ALTER TABLE animals.tipo_visitantes ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    245    244    245            �           2604    25799    ubicacion id    DEFAULT     n   ALTER TABLE ONLY animals.ubicacion ALTER COLUMN id SET DEFAULT nextval('animals.ubicacion_id_seq'::regclass);
 <   ALTER TABLE animals.ubicacion ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    240    241    241            �           2604    25822    visitantes id    DEFAULT     p   ALTER TABLE ONLY animals.visitantes ALTER COLUMN id SET DEFAULT nextval('animals.visitantes_id_seq'::regclass);
 =   ALTER TABLE animals.visitantes ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    246    248    248            �           2604    25823    visitantes idtipovisitante    DEFAULT     �   ALTER TABLE ONLY animals.visitantes ALTER COLUMN idtipovisitante SET DEFAULT nextval('animals.visitantes_idtipovisitante_seq'::regclass);
 J   ALTER TABLE animals.visitantes ALTER COLUMN idtipovisitante DROP DEFAULT;
       animals               adminzoo    false    248    247    248            l          0    25734    animales 
   TABLE DATA           [   COPY animals.animales (id, nombre, fechanac, idcuidador, idhabitat, idespecie) FROM stdin;
    animals               adminzoo    false    222   �       �          0    25803    clima 
   TABLE DATA           ,   COPY animals.clima (id, nombre) FROM stdin;
    animals               adminzoo    false    243   �       o          0    25745    cuidador 
   TABLE DATA           [   COPY animals.cuidador (id, nombre, fechacontratacion, salario, idespecialidad) FROM stdin;
    animals               adminzoo    false    225   ��       q          0    25753    especialidad 
   TABLE DATA           3   COPY animals.especialidad (id, nombre) FROM stdin;
    animals               adminzoo    false    227   k�       u          0    25762    especie 
   TABLE DATA           O   COPY animals.especie (id, nombre, idfamilia, idestadoconservacion) FROM stdin;
    animals               adminzoo    false    231   \�       y          0    25778    estado_conservacion 
   TABLE DATA           O   COPY animals.estado_conservacion (id, codigo, nombre, descripcion) FROM stdin;
    animals               adminzoo    false    235   T�       w          0    25771    familia 
   TABLE DATA           E   COPY animals.familia (id, nombrecientifico, nombrecomun) FROM stdin;
    animals               adminzoo    false    233   ��       }          0    25787    habitat 
   TABLE DATA           O   COPY animals.habitat (id, nombre, idubicacion, costobase, idclima) FROM stdin;
    animals               adminzoo    false    239   ��       �          0    25829    habitat_visitantes 
   TABLE DATA           c   COPY animals.habitat_visitantes (id, idhabitat, idvisitantes, costofinal, fechavisita) FROM stdin;
    animals               adminzoo    false    252   �       �          0    25810    tipo_visitantes 
   TABLE DATA           A   COPY animals.tipo_visitantes (id, nombre, descuento) FROM stdin;
    animals               adminzoo    false    245   ��                 0    25796 	   ubicacion 
   TABLE DATA           0   COPY animals.ubicacion (id, nombre) FROM stdin;
    animals               adminzoo    false    241   �       �          0    25819 
   visitantes 
   TABLE DATA           B   COPY animals.visitantes (id, nombre, idtipovisitante) FROM stdin;
    animals               adminzoo    false    248   �       �           0    0    animales_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('animals.animales_id_seq', 95, true);
          animals               adminzoo    false    218            �           0    0    animales_idcuidador_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('animals.animales_idcuidador_seq', 1, false);
          animals               adminzoo    false    219            �           0    0    animales_idespecie_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('animals.animales_idespecie_seq', 1, false);
          animals               adminzoo    false    221            �           0    0    animales_idhabitat_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('animals.animales_idhabitat_seq', 1, false);
          animals               adminzoo    false    220            �           0    0    clima_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('animals.clima_id_seq', 15, true);
          animals               adminzoo    false    242            �           0    0    cuidador_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('animals.cuidador_id_seq', 20, true);
          animals               adminzoo    false    223            �           0    0    cuidador_idespecialidad_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('animals.cuidador_idespecialidad_seq', 1, false);
          animals               adminzoo    false    224            �           0    0    especialidad_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('animals.especialidad_id_seq', 15, true);
          animals               adminzoo    false    226            �           0    0    especie_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('animals.especie_id_seq', 63, true);
          animals               adminzoo    false    228            �           0    0     especie_idestadoconservacion_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('animals.especie_idestadoconservacion_seq', 1, false);
          animals               adminzoo    false    230            �           0    0    especie_idfamilia_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('animals.especie_idfamilia_seq', 1, false);
          animals               adminzoo    false    229            �           0    0    estado_conservacion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('animals.estado_conservacion_id_seq', 9, true);
          animals               adminzoo    false    234            �           0    0    familia_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('animals.familia_id_seq', 22, true);
          animals               adminzoo    false    232            �           0    0    habitat_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('animals.habitat_id_seq', 23, true);
          animals               adminzoo    false    236            �           0    0    habitat_idclima_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('animals.habitat_idclima_seq', 1, false);
          animals               adminzoo    false    238            �           0    0    habitat_idubicacion_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('animals.habitat_idubicacion_seq', 1, false);
          animals               adminzoo    false    237            �           0    0    habitat_visitantes_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('animals.habitat_visitantes_id_seq', 1000, true);
          animals               adminzoo    false    249            �           0    0     habitat_visitantes_idhabitat_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('animals.habitat_visitantes_idhabitat_seq', 1, false);
          animals               adminzoo    false    250            �           0    0 #   habitat_visitantes_idvisitantes_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('animals.habitat_visitantes_idvisitantes_seq', 1, false);
          animals               adminzoo    false    251            �           0    0    tipo_visitantes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('animals.tipo_visitantes_id_seq', 5, true);
          animals               adminzoo    false    244            �           0    0    ubicacion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('animals.ubicacion_id_seq', 20, true);
          animals               adminzoo    false    240            �           0    0    visitantes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('animals.visitantes_id_seq', 1000, true);
          animals               adminzoo    false    246            �           0    0    visitantes_idtipovisitante_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('animals.visitantes_idtipovisitante_seq', 1, false);
          animals               adminzoo    false    247            �           2606    25742    animales animales_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY animals.animales
    ADD CONSTRAINT animales_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY animals.animales DROP CONSTRAINT animales_pkey;
       animals                 adminzoo    false    222            �           2606    25808    clima clima_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY animals.clima
    ADD CONSTRAINT clima_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY animals.clima DROP CONSTRAINT clima_pkey;
       animals                 adminzoo    false    243            �           2606    25751    cuidador cuidador_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY animals.cuidador
    ADD CONSTRAINT cuidador_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY animals.cuidador DROP CONSTRAINT cuidador_pkey;
       animals                 adminzoo    false    225            �           2606    25758    especialidad especialidad_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY animals.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY animals.especialidad DROP CONSTRAINT especialidad_pkey;
       animals                 adminzoo    false    227            �           2606    25769    especie especie_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY animals.especie
    ADD CONSTRAINT especie_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY animals.especie DROP CONSTRAINT especie_pkey;
       animals                 adminzoo    false    231            �           2606    25783 ,   estado_conservacion estado_conservacion_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY animals.estado_conservacion
    ADD CONSTRAINT estado_conservacion_pkey PRIMARY KEY (id);
 W   ALTER TABLE ONLY animals.estado_conservacion DROP CONSTRAINT estado_conservacion_pkey;
       animals                 adminzoo    false    235            �           2606    25776    familia familia_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY animals.familia
    ADD CONSTRAINT familia_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY animals.familia DROP CONSTRAINT familia_pkey;
       animals                 adminzoo    false    233            �           2606    25794    habitat habitat_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY animals.habitat
    ADD CONSTRAINT habitat_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY animals.habitat DROP CONSTRAINT habitat_pkey;
       animals                 adminzoo    false    239            �           2606    25836 *   habitat_visitantes habitat_visitantes_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY animals.habitat_visitantes
    ADD CONSTRAINT habitat_visitantes_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY animals.habitat_visitantes DROP CONSTRAINT habitat_visitantes_pkey;
       animals                 adminzoo    false    252            �           2606    25816 $   tipo_visitantes tipo_visitantes_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY animals.tipo_visitantes
    ADD CONSTRAINT tipo_visitantes_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY animals.tipo_visitantes DROP CONSTRAINT tipo_visitantes_pkey;
       animals                 adminzoo    false    245            �           2606    25801    ubicacion ubicacion_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY animals.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY animals.ubicacion DROP CONSTRAINT ubicacion_pkey;
       animals                 adminzoo    false    241            �           2606    25825    visitantes visitantes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY animals.visitantes
    ADD CONSTRAINT visitantes_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY animals.visitantes DROP CONSTRAINT visitantes_pkey;
       animals                 adminzoo    false    248            �           2606    25837 !   animales animales_idcuidador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.animales
    ADD CONSTRAINT animales_idcuidador_fkey FOREIGN KEY (idcuidador) REFERENCES animals.cuidador(id);
 L   ALTER TABLE ONLY animals.animales DROP CONSTRAINT animales_idcuidador_fkey;
       animals               adminzoo    false    222    225    4791            �           2606    25847     animales animales_idespecie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.animales
    ADD CONSTRAINT animales_idespecie_fkey FOREIGN KEY (idespecie) REFERENCES animals.especie(id);
 K   ALTER TABLE ONLY animals.animales DROP CONSTRAINT animales_idespecie_fkey;
       animals               adminzoo    false    231    222    4795            �           2606    25842     animales animales_idhabitat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.animales
    ADD CONSTRAINT animales_idhabitat_fkey FOREIGN KEY (idhabitat) REFERENCES animals.habitat(id);
 K   ALTER TABLE ONLY animals.animales DROP CONSTRAINT animales_idhabitat_fkey;
       animals               adminzoo    false    239    4801    222            �           2606    25852 %   cuidador cuidador_idespecialidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.cuidador
    ADD CONSTRAINT cuidador_idespecialidad_fkey FOREIGN KEY (idespecialidad) REFERENCES animals.especialidad(id);
 P   ALTER TABLE ONLY animals.cuidador DROP CONSTRAINT cuidador_idespecialidad_fkey;
       animals               adminzoo    false    4793    227    225            �           2606    25862 )   especie especie_idestadoconservacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.especie
    ADD CONSTRAINT especie_idestadoconservacion_fkey FOREIGN KEY (idestadoconservacion) REFERENCES animals.estado_conservacion(id);
 T   ALTER TABLE ONLY animals.especie DROP CONSTRAINT especie_idestadoconservacion_fkey;
       animals               adminzoo    false    235    231    4799            �           2606    25857    especie especie_idfamilia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.especie
    ADD CONSTRAINT especie_idfamilia_fkey FOREIGN KEY (idfamilia) REFERENCES animals.familia(id);
 I   ALTER TABLE ONLY animals.especie DROP CONSTRAINT especie_idfamilia_fkey;
       animals               adminzoo    false    4797    231    233            �           2606    25872    habitat habitat_idclima_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY animals.habitat
    ADD CONSTRAINT habitat_idclima_fkey FOREIGN KEY (idclima) REFERENCES animals.clima(id);
 G   ALTER TABLE ONLY animals.habitat DROP CONSTRAINT habitat_idclima_fkey;
       animals               adminzoo    false    239    243    4805            �           2606    25867     habitat habitat_idubicacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.habitat
    ADD CONSTRAINT habitat_idubicacion_fkey FOREIGN KEY (idubicacion) REFERENCES animals.ubicacion(id);
 K   ALTER TABLE ONLY animals.habitat DROP CONSTRAINT habitat_idubicacion_fkey;
       animals               adminzoo    false    239    4803    241            �           2606    25882 4   habitat_visitantes habitat_visitantes_idhabitat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.habitat_visitantes
    ADD CONSTRAINT habitat_visitantes_idhabitat_fkey FOREIGN KEY (idhabitat) REFERENCES animals.habitat(id);
 _   ALTER TABLE ONLY animals.habitat_visitantes DROP CONSTRAINT habitat_visitantes_idhabitat_fkey;
       animals               adminzoo    false    239    4801    252            �           2606    25887 7   habitat_visitantes habitat_visitantes_idvisitantes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.habitat_visitantes
    ADD CONSTRAINT habitat_visitantes_idvisitantes_fkey FOREIGN KEY (idvisitantes) REFERENCES animals.visitantes(id);
 b   ALTER TABLE ONLY animals.habitat_visitantes DROP CONSTRAINT habitat_visitantes_idvisitantes_fkey;
       animals               adminzoo    false    252    4809    248            �           2606    25877 *   visitantes visitantes_idtipovisitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.visitantes
    ADD CONSTRAINT visitantes_idtipovisitante_fkey FOREIGN KEY (idtipovisitante) REFERENCES animals.tipo_visitantes(id);
 U   ALTER TABLE ONLY animals.visitantes DROP CONSTRAINT visitantes_idtipovisitante_fkey;
       animals               adminzoo    false    248    4807    245            l   �  x�}V�r�F<c�"?�Լ9s���S�#��U�l�2���D4風ݲ�>�<H咓- ��C�a��K�p���I؄�C�B�L#d�S�p>Έ��QD��UL�]���)
 ���6�݉������=�f)_��Y�a?�J��rp���|�&�,fk�ZXx��0���)
Y��8>��%�3dt�����!�hq �}8J=̊]+��߫���ވ�\�4���mG�T��H��S��t�#�9L1a�m�Pƥh\��k�&C��i(c�������w�$n��RN0̾9t}�Q�a�֓��)�e,��ni��4�0�4Q�QsP�S9^$D*��d���.�%�ܕ@������o�@�Ĥ�lc�����0Τ��8�O��!��Z��kl]�KZr�d����4k�&��r��9��Zi�5�?��:Ӗ����)w�1qթ�NZb���n��]Q��5���dJ�u�N��7�<�Z�4�~~{�c�K$�4p5f,�q�e����V�u�M������&JQqx��©��J��i�<��>,C6P�h���-�2Vi�����q�O�QI7���ӎi�J��,�i�@	�L�r��<'�P�����a�(d/�j�\Oq{�梐���kQ]^t��H6L���\�/��e�n낔K�Qϴ��~�Q4���媂�U[�$��/&����q��c$�kñ�ō�`�2F��~�"Q��4��k��%2�Y�w°�s��f,�N��3��I'�ִ�O}����s��},*�%}2��I��f�i9�5��"h!��V��t��%��2S-���k�V�����a^4�iQ
�bV��9�kʊ��fŇ�vi�ٚ�E��>~_<��ےQ죅��JQj��%3>Y3�}%����˸e�_r./�Z�������­��q;�j��IB.�Jx�^�}��Z�U��"R�^jxð�;�@��e��_�AUkG�Xk�'o,���s�����Z^���>&q�����-i4*9Bt�ϧcޘO��k��g�ױjV���k�Jt�P�uږ��=s��0����V�Ĩ���V�`/�7����U��m����v�	Q䂛@H2��ힺ��aXFz��<�u�),_!�'e6�s���Ut�����n��§0!�y��R+�[,��B��ve���&�2��Z꣟. ���e��}���>�xz/��b����3c�_�.�      �   �   x�5�?�@���0���Hdpc���-)w~z�g�����t��,���,�XBO���x��&�d�+xj��G��D��oOХ!�KghU>*[��qθ=��L�<ҠkV����s	�����dUP�e�k��_�4%      o   �  x�U�Mn�0��3���C�.�Iaحag�k�� Y,(ˋ��K/��t��v�#�03�{O�|��X����)�R�R+�\��A)�H��a|�b1~��t���H��QIGh`fC�{�<~�/�T�T�L:�|�X7G�GIERW@U�d�������m_�VR�$CI�c;+^|n�g�*��E�X²y\+������N�+X�h�G8�7��<KRF']�5��O^�l��D���I��%CٻNl���I�g�0��FY!���uL�i���jZq(��h�/~?�z��{7�ٕ��}&�Px�]�Z�;�����S9�'�A����zh������ΐMn���i�m'����c���Qs>CӋ':�rw�EDE<��E]��B�m��n�6\�VS��{�쪂�`�m�o���8�`S��]�l��Yk�#�f���e�ߔNȐ�sߏg�lC��'*c��p�����f�,      q   �   x�U��N�@����'@li�9Fi�*��,Y%6�n���x#���e3�	���'�9a�{�%�ʵ#��$��+~�1Ík&�vg)��k��j�!�,ݸ���ᷮaMY]��f�W�[��hO?uα;⎄�~A^�+�V���	��&���/��!#���JR�=�+���y�����-fB-�jvc�A�za�2`��U�q�R���8����W ��qv      u   �  x�mT;n�@����	�/����HlǈA����Xr�%i���K)�tiy��!IR�3o��f�Tï�J���t��c/��\�� �^#۰+�h��םr<J)m{u3��;K!eޒ6��vjV��:g�/�qB�]�%y��A@7Jn�<���pm'4�ϭ�o�4�Ѥ�5��xT\�1֕��#�4\��ե%"�S �ԋm�������oIW�s������I�BW-�h�-F��i]8m&1�+[�D.�"��8���v<�dJ(�6{]5\��4���u�w�k-�g���N�	�*�_������0�3$���7�s����S�iy�zx�t.\VG�n�o���1����f ���/X���PO�'��M�(�,�N�ǈ�o,���{�Yc��w=9'tg]ח�mII[6�kåmi�D���79w5����6��l�<XHT���BW��2��qS����,v�/�2�\�� ��yB��UCPf�+�08��ºJ��@�'t.�y�k ����t̕����+�h�S�rMj�<��N7�ea��b��X��F���`� ���
�l�����jtJ�l!	i����RĈ�z'6;��j4�����8�:9��LD�#��8\l����q��u�c�U�Kʭ���NPc,hy�/���3!�='г�[���]
�.N��k�"��.Ax�N^�
iú��l��۳WD[~��h�I~{�y��{      y   *  x�m�MN1���)r ��?,K;�j�
l��-�2�(Ɍ�^�#p1���Y�s��~�%P�C����-���ݡbi�)�����Y

e\�M�{�<�׃,"��SvY��b�`<�*ؖ<��X9��a��9R#vI�����+�k��#��)���s�W�w>Pą'����C֢mhɨ�Z�{1�P��[l(�^��Q�L�՞�؅�׊����"��Z<��a�����-��d̒��b}��)A-�w��Jbs\��ӵy��*���]16Rj&�N�u5��?T�IH��.�qn��a䥛      w   `  x�-PKN$1];�� ��/��#$`#6��t���I��s�Yp
.���"��l?�����Tc��V��P�9�M�ѐsX�9O4��Vl��w{���%��.�Afnl��H�K<�Q\�8aȵj�w�)�+xL�36ލ�5_�3���G�gѼ�0u�T�`���Ze���ԬK��m�?����t����3���葂D��%�{
��<N�����3�:s�Jj�]o>��J�p�T|Ï��ncm�}3;���/��a6���-*GI��
68�C;b�L�.��?��D{N�`7f��������im$��Y�������+=<e�][Aô�3��	��%�X��^<�R\}=q�}4ٻ�      }     x�MRK��0]�N�K�~�LH`��ʦƭ��RG��\'�"�}�<94���U��)zL�C�wk-�i�)���} %4}�9o�;>V<g&O�9#�Ƴ��)x~ǔ1��֑�b��i�R]K�5��\���J�������'wK9��7R����4�.�
�r!J5���ӻ�|�R���y�{���@�e�dD�/)��T��\�R4�zR������J˚jY�P��z �^��9�ש���/��T���#�e�B-ן�Oo��g��2 ?�P���|����XEM�r�Wd�27e�3�|�uL��&�k��`h��������9 ���[���3��S^[t�)tB98t�^!o��-�C��h��$�y��A���@7P�*�w���ߦ�i�Z���2���=l�	�BE�ZR���yC�`���J�0B���j����>�=2��`���5Q�ǌ��{ o�ak��n�5=�<�[Lhs/c�.P�[�8�i��G
1�-$'�J!�_��p      �      x�u][�캭�v�ew���K�?����u�M%���mK	� W�b�z�W,��oNW
)���_��ċ��őS�΀��_h����-骳\���MM�p���/W�W�c|�X�%���W�;s�Ɯ�;��=^kW�Wk�i��i�X����v���`�����ug��R�ܙjwwګ���3�i��M�c�g7�b?�]x��{����9퟈����c�?����\�Gc+��U{r,,i��{Ci-P���r�T��i��������~��_:F���[��>��|{@�3}{_�4��]���9׸ޗ��o\�Ng���'Ϋh�o�q�C�cm3�K[��^s�챉���}oO1~K]W�_���׵+�_��b�u��p_��\���Iw�`�f��g��R�}��,%����[�C�����W����>����8y�>�_Ӿ�>h����h���l�>��7m�����_�����h�`��Ox���wʮ�b��]�.f	%�����l,gcx�Ѯڥ�U���a�����?�؞{�>��X|�'��՛�M37[ۨ1p��c�aζaؔ��:/|\8ֽ����5���ND�,�f
aY����`��(#�ǝt`�f�y[З�O��y^���3-�o+�W�o-X�T�[�H��b��Y|��'{����G��^�a��d�`z~Ӟ��T���z�T?�o�p�<i��4��)�����`�<M���<�Z`�*sd5���Hf�����>�X�qM0�Q�Nfۥ?j�b�r�/k�
���M��4��^�#�������{}yظ�Wǭ������f��˺�i��_��:pP�\<U��܊ټ�[�;��U�Q�1=��ko��n���f��g�tfg�8�i;�p\�����-�]5c�Ŷ�43,������>����}�q�l�mN�[N��X\����c���s=�!�Y�c�ü�7ז��p��YXε�i�J���@�0_��E.ۖ���~:]��,� �t>6hWͭ�I���w������1���f����-��b�>�=ۢ��ϟᛥ��xN�h*?h?����Y;�}�行@%��s�0�񱟱7nX����7nMu;C���6�&�f���l̎O��ms3�������3G��v�;���N�<i�Z!�������We��X~��_�?Y=�_w��t���BXmh}�[��N��Q0ߚ���I�['�Z�m��L��߁��I�� ��;͕��	@:���@���,�
��(�
���؝�;f��i5�~*7�����,��a`�r��ǃ����!l��d�0�窡� _4z϶���������j�R��9�W���1�]��o�W��ω؀�����W�>�a��l��I�d�nւ�j/{�m�n��ŵw����7ak��0�7|N��u��s.'����b�
>��\G0ivl�@���?{[�Y"|k��f� ������Z0YǊ ����m1,\�R3���Q#�(�>��Ј���A0k�Y���c9쟙9��C|g n{,L����l����-��x��Jx�yvf�[�/�01��s�-���^{+�	�l0�m��6w�}y �l��6�q�Cf[#��	$���J� �'R�T)A�O3C)��<�f2�"��Ծa<�i�e �<����##��q�d��g%+I�w����a��w3�U����v9+�q����R��j�Iw�LK�Ƿ��y\mH3]؊\I q.ώ��m�f,�9�iw�8+��0Y�am��!�ìu%��>��-��� ��9ᑳmϊ�k�
ΐ������F~�^���
@7���z4����c�erE�D�u�A<�'6���w:��� ݘ$V��f��:Vf��z�a���M��M7�9��4�-�#I�h:,���"�J~����(��������� G9�l�����y"�Bl�������t����2�p������.�n7~�Mk�w*�nĜ��ɓ(���&�����I�M#�6�  2˃���4Mc9}~�I��cv��?0��B3���Wj��7|����I��!�I���/kf�7��h�a��6����\S�Fv0Zٻ=�36;��N��Y[�weX��\�3�f۝��9�[U�'�Q���@v w��lG��2\n�k�S��3@���0]{�;���U:��)�t�5m��/�N��a��`�f7r���)\�g���9ܹ�p�n�:��Ńν�x�ۈ�8��9�H�'�Ȱ�1N�P�<�cɶ�X/��v̷��d����:V��Ol�RM���?̲��?{h�d0���ĥ3��
g�[B�W*O^�BUg\Fz���!D���$��@�ƶa^�����y`;��̦I�=�e ���v�QＰ����e���6o�4,<J�����"N�9����!�cH���~x;Ka��n���V��aA.�}�(Lx� �r�]�@�˝vÞ(��vu��9�M��@F!��8�
�g?,�ՇCR�	�j����K�.�nwJ���;d�\��A�P�\���t4=vٖK[�j',�V&�"侻���� hvܘ��̻��O;9�L�ow-b�S�q�in^:ܦ����䜇��jWAR��r0X`�A�4�����E��^��yƮ��83\v���S(�D��磴�l3ȁ���QH���V���wXah>%��a��DBXF����8j�#ox�~��);Fgz-T���!����t�sV���Gwr)k�z>�72�Ĺ�͒;�,�l��Ȣ����HbeY;sGa��8���2��B^��F�l�I�W�$O���K�U�
��w����h�p�-�c;Q
m#;��a��cYZ�O���2��,#c����Y�qWm������`\3�^>\����ΰ���}{rEZ8��2����C�:�XN!�':�/�Y��l�d'�k���U�K @a��JP��(�8*#��D��J��~�2)$��9�x���{[�X��:�r����w�y�+�?\J��E"~�����#�^�?��#5�s�����4^�Jw�l���ko��CSEt�R�'7��)F+O��N�q�a�Df���Y�P�^m�/�,���B%f;x�ɴY��_�I�T�
����K�$k7��?�̣6bO�Z3�N�e~��Ԓ}I�+����;� ����/�`'�e��p�:�����������.�@y�4>i����`gpY��%���=�?�ݎ0�E����wͲ�N��%)H�O,�Q+�1x4V��Qc�i@�X��Hg���`T���r�M��N��}v��y%�a��wFi��Ȣ�pKI�]� Ȳp�Ϣ�͕"��Ż�Ȏ4�I`%`7E�@�\yV;���آ��;�j�q0��\��8��#�;�(x�>����D��wg<ty�^G0��6�A%�qT2��N����F^ >��k�p�����A �S���?�����5u/+ˣ9O�Vi$���8�5x�h���xa8V�s (��,t�V��L+-�930\��[-��e%�KM�~e;�S�GK�����$!�ފT˂�VY�W����,5�,��v���劬�_�q
3�����EkT��#J�fWu�kX��=q�<�#����gj�!��T�z�7ޛM�db��c�3?���>(�AAVj(f�"�3"�$q�S��	y4ٖF�EHd�ߑ~2	�U*;� �6�Q��#~ >�*TzɌ��wz�UhP�u��s�kM8gR�t�cߨ�ȋy�}W��Y�B���I�,���]����P����1�7� �t���(@� �N
���\���M{v�����iO.�Ъ�)R�Jv�Pۄ��? ����]��6��;(�50�����^G��+�!�+㓕C���JH�P� G�y�2�fdx�x����^g=Z$�����p���,�T��r[��N*rei����(i�a��nP8�Ւ"��o��m�Z��*Fi�N����O�k�pG�Iݙ���<�9X�r_�I�    �FZ>���(�F=C>�Y�,�^�·|4-�Gn���<P',��G�c{\�`�C؈'�djH��,n���:�]����??�V]'���$��fߐ�x��Q�J���'_��|0�cn$��}�m	Z�_:ȫP$XbW��e�w��B,$�������R�d�Wcp\�_�7t�U!��݌�9� �bCv@r*�+[�<��
+�̓�:^lb!R��0�n.',�<�@*\�������Tx� a\�h����%+��*������A� \�{Q	'P_� ���I�SPT�|I�'� ����u�	����|o2��R���`Ϥ/����pxI��5;X�v"2�yҪP��H�_�����l\44B��J��IG�(F�D�˳�C���:�(�X���ep���V�"ڙ�͍îv�u�<ι�W�~��lǸ2JܭC8Od@�N�G�'P�S���m�*%�!E��ߙ�ۂ��ދ�J�l5"�
��-��؃	՘���¬�D���-oO�m��"I�-��I���r8N/,��`%"Y�}��:Ix���,�*��( ���__㢜�q~��y
�t�� f��Yc!|�ᴜG!t�2�?���"��$"��f&1��y��p�`\U�L-b�oP`�(�E{0dO�y�{X���]�Ip0�/�lw�Pk�s�(�pT�I��f�7�T����l}�?�A�;�2����?�x��,5���	+nP�(�� �MK�}��z鈫$�Gt�\XTc!J���w�sR|���N���ٓq'��/��D���3�Y�l�e�q�p�2J�z����VXH��LI�!�-���MK)"�ʙ�w]V%z��,���z��GyUfqsWV�v�4-���4Xri\�ҹ�33�+���×�"+�~� �o�"��+�l�/C<��$�����ҋ�u��H'�5���R�(���-̏�TMOT�!a�e���r�n )�������k3*25��{\�m(��d;�Z�.���v����uK�j�r����`���ɵe�w��4f;}�W��/n��R}�JN\��6_�	V$l�g	�p��M��ި��i��;bۣ�*%�n�*Ats�X8`�2v�t7H�w�d���J�;w4 �|BV���ĝ"3�9�����c,��6u��=�R�����Dq(�rr������J ��/*�}uLXi�ãx��Q劔3��*����,nz��$���;�s�^U���+��=0V*g��lIl��a������J��^��3˖+:9��N\U�" }��r�ɒ�O�L�|�U��O��#Z����$\OC��X�(�ז�D��¾�#1f�͊{�<��>�nv�trZ��u7�,h7|^IT�Q]8^;�Ο�J4�M0���1?�+�.>D��Z��*��{���*���zan�/d�L���<͚��P�ig�n�*�}�9a縥���-KP�m:.ާ��梔�녨%�Q~k���U�g�EuLe�A�p��~W�2��b�͕E�~���^K�{2�iOMZϙۊ�,(Ipŝ��ĳ�����3
7v�Q�|��H@O���/��#c(�I����	 (���͓S7[b������T�*��U?�/���	�%W霙��1
\�D��	�Wu�(��)�g��ô�b��"��5�,���&�|X&K�U,|'NKܦ̺N{�IB�╛o�M��Z��A�{�I?@���()���nc��"ĪZQ�7���5�����V��� ��=d�T���K!�&Rk�� K))�� ��M}{7SU�x�u��S�~�e^�S��Dl�	��}^�P���������囻�����M��0aSx�I1�0��i�Y��[�p�,�պ���Y�R�~�/�~���C���SٳӀ/\����u&S�0w��Z� ���Ԓ�A8��*ظ�[�̸���.���n��7�V�pdq��Y8�}���o{�A�þ�eB�t@5N?@C0�B�յ�n��#x��M�JI	�C/�wRI
z���T�b#�<lQ$m�+$z��KﵣRa.zSG��T@Q�n�~j+�Z��� �w#��?0����ˬ۷ю�	��N��U��6��d>>�͕�q��*7�]٢Z�xn)�p�V�������;p�m�����ͮ���q��&m�G�#���+�:\#�I!���"II�[��N5���n<�����\td�QٳJd��$��(��W۷<��94�#���	�=	���{9)�:q�|�#y	��Ҟk�c��M�N�Y�(��d;{���LD�G�3���\)��B�+��S�(�`��woz�l���*Wk�5Y��9v�{���#t8d��r�T�;Ax��Fu�ɰ(���=�h^�^�Z`�ގ�!�#?��e�\f� ���N�Q���JO�����"L[`�XʩF�y�t:+Ax�.@������ǟ0o�A��o�&2�r/ݥ��/<ٝ��ԗ�T|CN�Ŏ�j����O��A�+ �\D@b6�������gE
"��G��xi�-Q�5a�N�,ג�C�|PE�QHl���{<����8M���i�5����\�6W�
�CDV��2���l����>b�R]���P�qE-�wy�JZ��-5M��K+o��CC.�'~�Am� l�oG�4�i��ϾV�g_,-|�H��˒j�\���Ț7�鮟�'\��f�g=��j#t%��=����,*ɉ��̩�YѮ�KO�r��8�	���Q��
9���F{�e�~��N�u#�V�ٰ���T%�"��խ��UTo���y�\Ҝ���+�ˤl�ӑ~fZ�:r'�O�Ɓ"~Ѻ���ѮLaS��^�&\��Jؕ��Wa]jg��RO�^l��/gKR�QWt�@�x��ީ+�rg��<jy{�>.���J��w��=��Z~<:��Rj>�B��F�"�x�[Kn"O"�-����4�&��=�N	Ok$k��Xp��&9� �1��o�Y�;�[��4j�'���i�Lg�֕z�5�W�c꼹GI�Ƒ�Q��(���6��k�o3�jr ��@;Y��hCr�.�I*��أ8��`)^-	D�Mg8k�,�K5��?�����Y�΁�-Ij��[�%���8�b̡��#�GOB��+?�x���S�a�NWL:��P9炰y )��r��(�n �%�t�M�&^���.��WM-�a:l*������������2�mdL�t��p���Z�7�5S�M�Vz;a��&�- ���x���kP��җ{\�]D�8s�Fav\5K��7��:.8�z���zꗛ~ܡ��v8�#���/;}����N)?ӫ�?�`k�^����L�m���G�g�xڏ���G�4�g�Q���I�wD����x~�|]�3��S�n�l��c_�f���hH�b ��R����$�<��?|���f@�Ҏs.���O�u�wmE�|m՝�T#lE�|��c>@Z�j���AVlи�|-O霟+C��]^�1��l�h^�L^wwk#�d���e�U?���ʱ5��U,VO�H*��2�f"�YZƑ�3��CY߮W'uh�P���ɷxhz�f�EM3�{`X�hN\}���}�2
u)��>lg��xI�H�ax�!��)���)C��t@�[��r	��t5�r��Ƹ���c����=�K�Q-���(�C�UK�;�9,��?ǣ�&�k.u�'���gWky� ��)���'��Ù5wrs�w�e%_Ӌw��](�ݙ�Uu�S!����\q�R޿��r�R�l#E�ud3�f�����>�xl��bb��7f]k.�k�	��;;�.*0}J�g�j�!�{���X�=���p����sx�ࡨ�1>o�k�bo��H�����"U톥�����Μ"�)9�jx/�q�5uU]*H�~�x��4Qbd�UcUڵ��K�Щ��aO޶A�5 �q�	�ٮ��z(��b�:�� �����-�nN�l���.�^~<�|b�У17T�k��lme�z�Lkbe���Ý6=�Ib󥳛h6�eN�1�N�z�Ad���&e'% b  �߃�����Ї����Q����^�u��HyQ���)gtVؤ�['��PQ���8b6$�*�Te���2�>x���(��1:8��x)b�>0K�D���Ԋ��6�޽����]�ifg9ap�'���tCv�O�y��:���Sx��l����I���n�ҕ;#*�0�Iޚ/֧Fڝ<�f�s:c�����Ө>G�a6)�5d�|%�u�H�x��$elmŤ���V�k����
Ǆ�zy-����t����|� �F}��z"'����C�,�P�3Ő��5]~�I�]˲#* �r[f�C�i�`~�HCcr9���Te�,?�Yk� X�l�����ꏨ6đ��R���w��:߲�0r���a����g|�����SS6"�|�0V�S3�5L |h�l�{v(�;�ξ+͠�!z8ęS?[4i��=6+�	%Q���_q����&��@I��k�^ڎ7����I`<"�6?f�����Px��E����+�����ƅL1D%��[$�3��5{ׅ:�!���uZc���Qw��'6/y����̳X4$r/7q<�4�M�����G��Z���rԃ`~����FYd`<&7��Ǽ�׸>9kظg��[s�.߯���nH#��Y[>n���v�*�s�_�8M朗�E����M�lg�U�.�������ߘ�_��ܢǍ p�����n�S�Cj�LQ�Ӫ����L����ReC(��/�����^5��l�Eɗx�4VMF�4?��f7���D~�Q���T�}ؘ�D�C(��9�&�r���R��A#K��ai0�Y�.G!��lʶB7q��A���Au�N�iӪqlUT���'�ҩpCC�9�����<d�I��K���=b����M?K���耵�U����srbcQ��?�ÓS�Lˋ�=^/�%6'u���\-�׾��Š1���w1>kĿ�.��"d4�lf �3��k:�/CE.�^L}�b@��1P�T�Ul^%�Bf�����1L����<��)�y�֌I�ڈ��/O���b{M�H+{s�/U�|h>Mqi�-FZ�U��yC�2[��!���έ��;�s�-�"T�P<�Ԇ�~(n2BB}8��0��^ʫQ%�$��#���rq:���l�AC�.��`S�((��a5Ŗ�Iao�l�U���x�M�a3��~�?}�̧���	���\�n���O��ŌX��94��:�W>K�QN���H�8%������!&O���#���`
��緵���od��O�'	"�*�s�(�$@}�_6�L�oy�܀YIXfԸ�9N\�e�5�'�*�r����%��CԹ�1���](�$:;�yo�^N@� ��Bf�^^��}T�T$�R�{2
S�U���K)'iK��e�Y��4��P��GON�\Sj�M$�#�E�j룺�fr�{��rΪʻ�m+)Ƴ�0s<�nH��#�q�g�'�b�2p��u�����9����I~79�4�CH@I �Ƥ<�h*�ÀoL����	�!�K�������:kHF��#U7Y,{���=��'Ԣpo��h���;��28���i7_:�K8�k�;9c�)U5r��Ԕ`��� �� �-�V��}o�]�s�5�xL��t��Ś�~����-�G��P��>6M��4�ǟq�KI�
�~\O���9��C�[�ҡ����e���"�
l����M�n�����4D8��zZS&��cA��(��tQ��ן�ϒ�Go�f�iMd�M�48@?���l�>t�j�z��H���HE�Ԡ��ΰE�[C,�Y�?/�D{��8�/TS�9l
ȣ�d��i%����!Fy�9p�� ����p������� �p
,U��,}����e��Se����%��spa��/{P��9p@�j)؎tN�\��e͉m{�y�y�8��K~�I9a����`dV�Ѣ6�1�G*ʏ�p����-d�Z���nb��:�}�����s�r%��4�y/��E�+OB~r�+�6x��v�9՗�U�M��ċR!o�:	칿�8�s�9s�$��S�^�de��:��Д�������sՓ�<y6��"��)궷��������=      �   f   x�-�1� �Ṝ�'0�z G���$J������������*��Z�a��YP�\��R�����4�3���nn8�.�h"��c	tS������1��         �   x�E�Kn� @��)8A��I�$���������=VG"L
�j��3�bŶ����Fţ~r�
���"��	�GP�~���a�l�X`�l���iہΉEX�7,1Cۄl�k���Ւ~vm�6;��� �L�@����+ƨ���;��q��$�������) ��z��&m����D^�Jm�]���J}�J=a���$��ѵ�;��A���]f�T�OC�}@_S�w��gI1��9>�����
 ��z      �      x�m}�v�J��}E�@�b��0IJ��EQ�������ɪ�J� 6��uH��k~`�]2z�;n���#3��N�O%��gĎ��Yr�U�MU��E{,k���&�W��M�q]�6��W39��M�&�ms�������,^-���;v��:L>�U�իerWv�+�cr��k'��X�d�j����k�]��=�x�[w|1M�l�z_un�'W���k��?�My�6����u�-{��_��y�Gw��~�z���c�a�Er���ñ�\�[��k��DWrԳ��j�'��۲kNߛm�<yۗ��^�f�%�B�巒��g0����t�����mUW����%Z$]w����e��]��N܆k����˭��-1�]YWG7�Rv��0��C�:M��uUuX&Lx�&���䮭˭�N�ztU�x+K>�ѣk80�	��'���~:Lnk���
t�}琪��0�@���>�⸦<�ɻ�yr��6-�,�(�=��x�ɦ5�o�Θ��؟��r$�E��h9з��c�0�M�p��K�{��8mP��з-[W�[,�Ahs�q����g�&ok�[�egXȺ]�,�<K�<r�����q�J�"Oޡ�v��}i����6�m9�"���zW�y�Ip<h[�%�ޞ{����-f�g��16�y���A�<�y��������gLj���q�/,ԥ;��q%��}�w��v�����*y�-�8��ǲ�~��G�i�7�S��}v��5���+�Ȓ������\�����^;������|Դ�N�����U�$���?�O-wy�!��C���~>��f	?9y�ۍ3tS���,�V���p_��#^�t�|g�`�^Z���qq������C���n�g��%���B���.�����'�c��l*^�!>"9ִ��2K�j�o�I���Tq4�����#g�̓�h�HoJ�ܻ����=Vx��kwĿ�u�H����<q�}��tV����湝������n1?
@V�Y;�X6[N-���=\�]��2H�ɛWRl�����Y����V�U�2c�������*M(�xc�I����F��D�t�NΈ-_�|������K{u�[���.����5V���q�Ζa�*=�z�r���j����Ky���~�[TBZ�6�f�7�(��A�9�w�-���ap]����+������sK�"�P��Մ��A�����V�e�L�-�q�q��\�4�����q1���Am��\�4K.;H��<3��S�_���]���=�A�\���j��� ����~�$��A��ش���v.�%�Dy)�l�`K��k]�z�y��2�J�@��(\��7����n��R�d;�m��W�2�R�0�t�����W;[%ʮ�Kb߹}/!�m�ty&O?���R�=��|t���F���k*�!��e��D�5�ܟS�| |���R�Y��p��O�Y��Ϣ4噘\��*��gl�<a{����wT�s<��ZI|qQ�Md�r:�2���ښ_ZbK�m����^�����UrSA��?��]E5�C)�m�v���:�7�9p�i|;K�<�H�V{��v�t��
�r�30�Oɛ���zU����,�E�� ;8,��p��NZ�'�-�z�����׃�-l?Pή�;���j�+ '����A�����d�Z�n�U�C]�Ԧ��56dT��9T����@E#�^�ɗ���`k��n���GC�3��H��C;�!x�h�e�'y. u�fQ�4�+�\uhp7���>N2u�%����q���u߅~xT�W���W��k���9N��z���l��`9�������gG�^:�ᠦ4�h���$d���(�{�{'``pHC͓�8����5F��s�H��-�.�N��k���"�$���U'*��+�,| �����-y�aP��m� �W���w�b����M���� WBBRXҗ;e��Qk: ���U,p��n`o+���$�n��rS/�8�8kP��Onǽ�.ӷ���k��7�X?x ��e Z�F\[8n>>
%ί�~�w8wOnz�m��tkg����ћ>�2n���5Ƚ�F�@9�Gq��~Ԑq_�~��@'2&��]��{��8a�
8�о�Ғ�K��-�I���]�Qβ }�"�5/��v�����=$�Y�4ְ۝�[@�aѨ�#�{"ԍ��s��������o�8@ݏ�7�/����w,kԀ|wa��2�� d��0���K@���'� ��T=W�{WK޺)�ق�Ϛh-�j�iM�W@��w ŎO�Q���v �9mُ�Uq��j�u�9�p����Ϛ�����8��j̠�=�x�]�ճ`f'��G ~�:�U>:��%/Ɖ�_C�@'�N X:���M;��:r� ��3��F�K�tm^��]U�WX�u����S�\��e��E���h���crG���k��,��7<�JqX1�f�� ���O�m)��i��� �������ٕ��0z�FmS�l5.����ܹ^�
�cEe�ӆYay��4�#���j�I�_qU�������^���#Y{�v0���%�L	6��뤯f+-Y���J�b�W7�YڀăO����o�jg��~+��E��� G+�#zڷZx`��ؗ���X���/�u� �[���bGwە��q��K�s�om��\(�X.�b�R�Joݽ��Uu��S�hN і�9 R���:p*W�)G�'����_��})�=ݕ�
HP[f.�}����v�FN?�!p���)���u���[mu�����Kie@����,=j�z)�#�|��3�i�-&�c9"&���X�.eE�2������{�j���D�OS��@��a��}0/��53�ݿs��)P�WN�wϟ{�%����c�-^5΂�*��#��.���:B<z�2�)����Er~�xW>���8#���w�@�,�
G�M�*�`<���R��cIGM>�[uZ�N�{�J���[�3�\����6��ٔG@�sc����W�R"=��ٚ������3@�����l��5<=<XW����ȓ�I ��e}�`�����4�"z�>���_�`G�/�֌Pؤ��I�3-0PZ Sj�Q[��|UX��Ԏ��j
�;q	���ZY��è^�b��a>g~Q�J�8*���ݝ��I��-~(鵘#{���O D��e�Z�E��6Xi��)���s@���@�B��;@���R�|c7|�'���k+�&!�{��y�񀾚&a�J)�9��yw P2�_�K齔�\,2� g 4����h+���Z4A@pU��s@�7{�l[�����y�xtrҵ���Ã ����,[j�to�羔�����2b~ߴ���0�1b^z�Dν���OF_� ��?0�s�#7#�L�O��vty��Yr�sOu�ݗTZM�ehF:�f{Y7=����ܔ�r�%����H~����H� q�v>��/��}�3s�dw(a��~��Xv��
�,'Ppa� ms �?`��b���` � A���;
#S��Zl��=����05w����c��zJ��Ԅ�^���o,v�t�����P��V;U�d��;�vx��빘G�>�n��zs�s��ך�BQ��ѯ�gjX��+L�Hz���hr���%pk@���]8;�ɣ8L�1�2\��	�����AP	��W�=h/�e�����|9X������(g�cOI��$qJ�>%C�5��rAQ�as�����}Zᄮ���������	h|�nZj&�X�{��>��#� ��ǂK��� �i>W�^-�n�kg�S���&���������se��J8[����'7�<;�Z����+��M���3T��ws�bo��x)�� ��ޕp�;��́�i��s�PHb���`�����U��X��P�
{N����g���A��52���֙w�|����%]�p>t.'^�{�"FE̡	���c�2��i��-詭���A�Ɓ{�)�D�/Xs��p[M�4��})��a ��    �i�c�{���m�90�9����"��(`ju��A�)���R~5�������N�������T��E'A7������6-��S��E����
Q�����2�������_�����N�W�����؇�P�
��
��ϧ��_>��f�i��Y��x�䣃H�G�]ӳ3w	�8��ˑ3��/�!qx���.�Q��@cG?_ﶝ?���q�d��:���pp��1Dh��*�_���_X �7_;�33a��P5�s biH��E��<�+�7��g[[a`��|�p�d�ʗ�8�>D�(��Ñ�{omf��4�<a�s.��Mn�Nn��>��>��C���P�a����4oO/��������O��F����QD62q�����|����EW]�ד�NMEr]>u��{���~o��ի������Lu�Yz��R\��H�^����@璘��Е����� �&t���KA a |A�+#
�3�m�Ng`tk��e�w�a�@��e�К!_�yx�D�7󸆸�"�6Խ}�H.��D���Gś�Z���Ʀ.'�iw>R�6��BS��-Z �Į�r�kW�ɸ �ŭ7�rCo)�.�����n�ٱ�d3 ]�XI.��>�X8;�������p��G��!(7c#�p1�����5�������uz�Hn*g�L��h�A�[�\~�&�W���ς	v�;d�a)N��|�3��%�W&  �>C7)(:~�e�Wy�V8���2R�a7�{i�S���w�G���kb��w�B��<83�l��@,\@�pW.��@�$�Rt�3Jz��� 8Z��l���;Y��!a�||�,��߁p�Wh�mO��o���isT�X>����X ���AP��H��4��U�E3CM=e�um��� =����gp�n��JX�!�@z	_,,퐏�F��D����o���i�^r�1n��� �^1fN9�y!Sϰ�(] ؆h�aD�k�zy�6L��=b ~��c�ۂA����R-#$ʏE�y�qO?idR)9Xś���8{, o)�*7�
&�j� #��@���0@�ג�P���U#m�9�o�}��7F�E���"�3�f�ra��� ~)t�t;�s�O����%�<� ��pxj�q
L�M�֕} ˵�3|�V���1������b��ɸ��U[D𻖏�{JG�%=�w��[�`�)�ޛ�^�{� F��������B����Igz  %~�Ȏ���r�;G~jm�#].b�L%7� ��O~vp����>��Y��[Z>��V�WtO�-�-b��{�Ôͅ�!�/=]Tq8-����R���؀������9}	�IL3�#���@vʖ�u+��4a�Ч����b�|/3�n�3㹔�\֌秬��iH���qz��'8���y�"+G���� �&�ځ�ǟg޴��4�e�'�����۔J^-��*��� ��nx%�Y����)��j>�3u���^��$la�V|K��l�Z��@D���r� eŏ�i�12H�/��(n;*҈i��
��iT3h���gW,
�Qh�Ytxjt��� �
��`�y+zc��XW%����3]{:�{�ʑlA�`تy��\�w�'ǁ����$G���蓛�=}W4�^����2W/e�犔B��M�N/���p
��Z;�=JY�q4��n�h�������UP�^EpI2�n1��o����	_���{�l�~i^b"�"S��˽��V>�"/�NN���*�	-���g�Y�FБ�md�z/XXc|�U�dy��(�Pe;�S���/����3��إ@�F�:��^LG�x���\�2<V��%�"�5B%��
9}?�S����C�Z�%"p�V�r	�{��;�� ������d�ܙ?��=A����5�au��ܳc�T@�a�j!�5���9ƹQfpe�J~��s��Ӹ΍C��!�+1^���kc�C`�/�M&��f'
�|�S�~0*)߁�����!P3��&����fw��T�gI�.w�Z@Ư)���,����2��^�b�c��4�� |�p|=�Ƽ>}g����8A��/[f��y��2',�T�c�cNG�_�$i��>}��By��"6XNYw��9���Qa�� �o�g��g�頻�g�\Э:ϒ; �'�9!��FQ	�%�2������%�d�%���zC�bA\ 䫲�v��a�y�3�r�ȠP(+H4�����M���xn��"`[��~
��x�_�8�ni�#%��{�<�=�Ib�;��%���k��~Lj��z.��H�3�� &h�_�������%0�(��|��b`��c��K�ň�l����/�o�����-�g�h:s:oI��e`M���QP����ezQ�jP��!H�v��nM`r�nz��u�����:�X~���Q!�����*@�E�EnG��9��g[EOm+vL��+͐2�D�H�,�#H~��:�K"�Oī��Erd4��r1k�����J6��Z 0���J����.�xS�H.?��h@b�T;�1��0��
&���g�8��
�篖"�����lq�����SY�K`��b�޶�s�@�f];�n�ma�xp�����wQ�Qň�Kn}���"��ݷ��;K�݆]�ȳT@�������	\4 ؛G��EG�ڝ~Az�����-3);P3�W-�����������ϕb�5PK�$V�"��L���e�ow���� +�텮DL��[!/�d�g�Ro�+��il��ր����؀��5���d�m~��Euz��eaY�1?����%0���yO�b�t��x���u�$�tE�b�ѻҨ�#gвH=����o�C�kq`���c�Ͳ@����r�j"���%=��s��{��,�3R��6'ݣ�g�D�������6#��������"���$]��+�C�m4��qvVg� �i���wH��)g�Bߥ{n;Yw+���a��ah�y]�;�����vA!�� !+���} ?3�I�0��/��5��'8�Hj�ԇȄwZ�2��Ѳ�| �6�
�w�"��w�GJ��B�W��na:��G�%*�ef���@e�5��j手1H�qu�>�..d=�W՞�8�E��"��
wL�#Qܧӱun�"�D�8O؈�8�+��;o�˿�ё,�VrŹ3f?J�L�[>a�n��V+5���J%m�ռ�p�I�/��UV@�X�j�s�lʵ�5�b��0�ԇ��B�Ci�qIa"5&����5�E���d�g��7�^�����Q,f������0߅ō&K���$�V�����nN����b9x����Z
��J��P�xwѮQ�l�O�ǘ���*w�ݶ�sf�5ܸ���o�U��\\sK��R�Ĳ�� �v�[�>95�������V��	"��Q��u�:h�Go;\!+�M>H���R�X�Gֽ�8�e�}�!��{:J<�G-�'bŀ{�����w�ڊݱ�l`K���w����fu�ʡ	�7Ơ�I�gw��{pr)�V3o���W[����l�(���tx��ڙ��/-�,��!Y ��0�m�@q���1p�Z�(	�þ���3��,8����E�B2"8�����g�d��+��cE���C7��q�
8b���HU?�����`�'7:;O�>�,��!2�)8�88�h��k�p�Y3J�V�K�ȥ_�]We,-�m()oF�zr~��J��2���fr��Zv�%A���IoZ���#���sk�B1�6O3�T<� ��M��r��K��VYșt�"�e���ĺ���%_�e�6�q�Ʋ�$MVܒA����hm����g+o���ŕu��,l��d�s背9�Y9���픿�[q�HI�īv�!g�I���+����=���{���%H�2g��S�a- �O���r��#�èߕ	ȝl1����<C���eh�Sѱ!���t�s����]�=�Bt��1�_{B    K�ǁE��bl{����,�c�|w�H�G׀�8�������t�S�<�9r^���[��I����%��r}�a�	����g)Z+��Ջ�������*�XJ>��~���<�4F�
�8뇔�Nl��qL1k��B�X�g��[VH���L���8N���1�	�d���!���rk0=3J��idL�&��1i$��ņ�	6F�t�!f�鋀�Qཁ��\��O5玲�r���.n�#c{����z#z6L4ِ�[�PIj�Ng��;�Ҹ�*+=p��w�N�ъ1��Qe�c�D���LIs����Hɻ���c �Au�!�]e�X�tr[R;��E�k�ȓ�M��fq�w���>Yxk͟I5��@�L�(̽#N��/� �2�_��b�&N�l+�N>���F'F	��9:�b��'��_B8|"��$��ߪG��Ak������@���� _��{�i(蝌Wr�Z~��=R2�]-�2�I���"	i32ӫPW!�{��$�Ey�4U�)�
H�Ɲ��H}΀��ptt��!�%�6Rf�)�:
�Yf�b��`�\�SX��B���,w����
`O��Q��Ҳ򉚽<1,���V���/���%}��>޷�<����;Z!s����/Z�Y��΃���/M�W��Q��@{a�n[��e*��\n\b�rL+,���4�<L�X�o2�9���`��{��}�7�My�tR�Z*)�q�/�G��@Z��Ee�`�;+����2��Q���|�J K}��2p�S����V�Pވ�r�:X&�֮	>&�!삮V��"/�"�6���|�R���d�h1��R3�C��^NCi6�v�qvD����3�_����F��y��(3㢑�Ib^-����bew���%���.�82ŞɪHӁ��l�F�Y�:�aX�[U-I�4d���˜Ɠ"�(se�i�S����D�)^�!յO����fg�Kk,�͂���\&.�X�G����f�j
����[�-��l��� �D3�g^�F�=�i�f4�]+v�9"���S��5$gXИ�� �wm�^r�y��1]��z�/[��'�H�fX-����#��;Q�����\f)��N�F�NA)���'1Meę��%gI�3Jy���)Y���_���r4e�{]��.\(���mfG�+�۱0�eϐ�]�}�s3�Y���e(��2�ܱP���d`���!����3�N�p��Q1I���:� ���oOߏL���� ��#�Θ��/���vK�D�we�ëxհ�P'kq���'ҐyʚqY��2S�0
��y��)�Q˽\s(��h��\��m������������O��M��C�s[%�@���qN/S�ݴ��*a!��)N���-0	�5��2�U��������|kIށ�G�Ȁ�}��ō.�{�D� �ɫ$D�];Lo���GB�m��N+?Z$7�3I�s#�
^���.%�c�C�*s�Bdn���/Qv��lW���
6���N��v�$~EČ�͌��D ໩��pʳH�(�l�Ѥ_2:c~�� �h�Qh4h3A�i�������ڞSS4
��õ 5#����
�\��](�#w�� ���ĄhJ�ϓ�>�|�����?�vă�t���'���&U3E�0i b_�lLF��i��,Ʋϳ��+B��Vt�ln�'+օ̣�4���P��7L7䖅6k����UOfr=8,��K
�m�V+��X�C�sM�6[,"��^�2��SZFH�9ʅ�T9�eVW�yo>[���jTY�����Ƶ4T#ğO ���J���F����)�(B�F�<�}bV���>	�C�`�^�v����)�����$R�X�i\"D��m��._� BE���0��^��?W�([�t����휅4`���Yj�e�ąL�	/
/f��&W��x���cl_�oM��vd@q,@̡���f!W���d��B��/�ȥ$b�葵�ǎ����$�L�yV��`>�)��&f#f��f�(�7_��VΒ�ec.`4l�v>ꝭdlm�	����ދ��&��:n���E��,=10�>yK����Q��Jza�H�p/�
�b1����G�E��p9�kV�C�e}5�n���MC0�U�VC�+o�����R!i��8����A|R&�o���;��
n��ٲ��4�kt��5<A�"]��1��U��b��"�/�=�~�aUm%Y|�F�"�N'T�T�5�$��� ��dh�%s� П��F�=�PxpҲj�U�����(�P�7��H��0�Fal_=�K8u��2	4�dut���u��cd1���Y�����¤Y�p6������Y>�@�<��W�+��a��[b1[6-5R�&�U��S�P2�G�39�� c��gy��2�h� E�vu��%���Vu�8.J"�[��W���S0a�;��W���_��k*+�!���W|� p(��}�DK�
U]��2�23�*���xqH9�_KG�10no���V�]��y�)y��#z��Q�K|u�y:�fΦ�'�(��|F@Ll`YWue�;j�<J)���)�!�B�|�4�ujI�4.l��p�!P}!�0ڊ��+c��u�2O�����MXDG����S�s2�c������z��|�Z҄r`�(�<��K��>99�/9AR�j����~96�BZ�z����k��%�rr0,�_�V1������9�+7U�3�uKj�J&(N��҈.��F�Y��,f�+�]5]������g#xa�X���eu%��EG�V�^Oc�XI��]ZY��G�,1��!8/;���/�t�P��W�a��!��~��C2D����Kd����9��<}�Y�*D�sՏp�(�	�^p[�J� Mxĺy1�j�S>ƍ���	��'��*gA$�e�i��bn�Z�)K�`��:z�v!�'�F"
ƴXF�/��.W�Z�*c�uX��7`���V�B7���e`�y�5U�V�V�p��~���i�>S~2?�k�dh�4��� A�,~>Y�Y��q�ʗ�`�:����ӫh]Z�*O�^H_ L�Yc"vli�d���!���y�9��&R1S�3u����FIM}��iv��A��\��,P����U�s�˦���V&:{X�tT�%�Z������}��D; ��Z�S�8K�w�W�P�,��FT���7���UH>��y4$=�)�q<p�ZʣO���<=�l�q�.��6�ڗ�J_K�cm|5��y/�ްE��G���`�|�X;B_o�sTw��' #Z'=�FvH0c�t���!?�Ũ��{b���Q5����&,6[%��q���ԐP�7���k�'���F���r3c�6�U��4���8��k��jC|k����r��L���W5���ق��R9|V3�C��P7B�8�|'�9f'��FN˜��|�Ԫ�b#2fx���!�<�.-��=��C�|��~�φ%�0��g����<�h=�������z{t8;�	�n�������<WXa�Mh�8�Y�OG�p|`-��m�d��J�L#����o�Qϒ�ↄ9�UĚeVst����I�Ԛ�5�/�9XӨ�F }�_F�狹W�����l �� ���/��~ �Eh�8��U���ܣ,�`8T���|���9Y����b��H����B()��bT���UL<g�T��JY\��Ȅ�,b!���C�faq�ʧ�r��u]fMM-���[1���*�l"��ş+(�C�����Y)Z_�Ck��rnr���̮x\G�����&����|����B1��x}-�+Ɍ+�,Nl9�>�ᷖ�To#�A���-��kn©�5ض
)��j�t���@���g�~C�;Ȣ�[i�*x=�U,�PQ��^�y��p}ΪQ��ɥcQJ����gs_xlT��o�@BpC}:����#{1.�O���1g��|�o��; ��yB]IL`�{�,�0�c��l��������|-�(S�q�*�f�`�W#�y��5�����؍�m9�H���O\.�g9<���_���H�l�=�X�n,�S   n�J��1�K5��D���<z%�"�����(1�UJj��	{��,����"�j�k�+@�	.	�TXQ�6���R�,+�f�@�w��kG�S(x]�lQ(��/����ndBKB@��g`̰���+˳"[��a1M�Kh��D=�(r.�|t��/��?ԙld�?#x������g'�'3�gF�뻣%c��� RG+sH��)���G�V��:Ʋ�j^�1y�A�+�`E�C���P����Xy�Xe��{1��|�D���\K��^N�Y(?��_S�y~���T
�������X��1�C������!��&��`�rD��6�W1�B��"q�#'h��ħ�jo��Zv	�:���O�ezk��7�`�9|XW�P�j���סJi1�#;�Ie��3�+t&����Zp`�R>U��K���H?hݘ-nE$�m,�߁��8��|q�*� �ԌknT�Ɗ��Zv1�6Ļ�p�u�Ja�=��<l�oF5�T���Cz���W��4�=_���0���V��@�=��w��PU����=g����K��sU�e����t?��w�X7�V�G0��"�nl{������.kdNo{哱Sr5/#I�=V�MՃ<x*f#:e*��g�R�bրi���;�͡�'���m�bY�e��?����Q��	�hN�j������� ]#T
:߯;9�?2�O�5�4�`�W��o}aZ�S���,�˿�dDu�̱�m��"�;	1>_Abv��+x��������ի��pq     