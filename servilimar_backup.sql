--
-- PostgreSQL database dump
--

\restrict qGiu3HjxWXP5ZkyYbfjwrL4eYaGRNGO7eZWGs0hkHRTYRzt29ZAmFMLNQf7Tnwf

-- Dumped from database version 14.19 (Debian 14.19-1.pgdg13+1)
-- Dumped by pg_dump version 14.19 (Debian 14.19-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.ciudad (
    ciudad_id integer NOT NULL,
    nombre_ciudad character varying(100) NOT NULL,
    codigo_postal character varying(10)
);


ALTER TABLE public.ciudad OWNER TO ulimar;

--
-- Name: ciudad_ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: ulimar
--

CREATE SEQUENCE public.ciudad_ciudad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudad_ciudad_id_seq OWNER TO ulimar;

--
-- Name: ciudad_ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ulimar
--

ALTER SEQUENCE public.ciudad_ciudad_id_seq OWNED BY public.ciudad.ciudad_id;


--
-- Name: condicion; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.condicion (
    condicion_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE public.condicion OWNER TO ulimar;

--
-- Name: condicion_condicion_id_seq; Type: SEQUENCE; Schema: public; Owner: ulimar
--

CREATE SEQUENCE public.condicion_condicion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.condicion_condicion_id_seq OWNER TO ulimar;

--
-- Name: condicion_condicion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ulimar
--

ALTER SEQUENCE public.condicion_condicion_id_seq OWNED BY public.condicion.condicion_id;


--
-- Name: empleado; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.empleado (
    empleado_id integer NOT NULL,
    usuario_id integer,
    cargo character varying(100),
    departamento character varying(100)
);


ALTER TABLE public.empleado OWNER TO ulimar;

--
-- Name: empleado_empleado_id_seq; Type: SEQUENCE; Schema: public; Owner: ulimar
--

CREATE SEQUENCE public.empleado_empleado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleado_empleado_id_seq OWNER TO ulimar;

--
-- Name: empleado_empleado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ulimar
--

ALTER SEQUENCE public.empleado_empleado_id_seq OWNED BY public.empleado.empleado_id;


--
-- Name: medio_notificacion; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.medio_notificacion (
    medio_id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.medio_notificacion OWNER TO ulimar;

--
-- Name: medio_notificacion_medio_id_seq; Type: SEQUENCE; Schema: public; Owner: ulimar
--

CREATE SEQUENCE public.medio_notificacion_medio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medio_notificacion_medio_id_seq OWNER TO ulimar;

--
-- Name: medio_notificacion_medio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ulimar
--

ALTER SEQUENCE public.medio_notificacion_medio_id_seq OWNED BY public.medio_notificacion.medio_id;


--
-- Name: notificacion; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.notificacion (
    notificacion_id integer NOT NULL,
    usuario_id integer,
    medio_id integer,
    mensaje text NOT NULL,
    fecha_envio timestamp without time zone DEFAULT now(),
    estado character varying(20)
);


ALTER TABLE public.notificacion OWNER TO ulimar;

--
-- Name: notificacion_notificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: ulimar
--

CREATE SEQUENCE public.notificacion_notificacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificacion_notificacion_id_seq OWNER TO ulimar;

--
-- Name: notificacion_notificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ulimar
--

ALTER SEQUENCE public.notificacion_notificacion_id_seq OWNED BY public.notificacion.notificacion_id;


--
-- Name: servicio; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.servicio (
    servicio_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    estado character varying(20)
);


ALTER TABLE public.servicio OWNER TO ulimar;

--
-- Name: servicio_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: ulimar
--

CREATE SEQUENCE public.servicio_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servicio_servicio_id_seq OWNER TO ulimar;

--
-- Name: servicio_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ulimar
--

ALTER SEQUENCE public.servicio_servicio_id_seq OWNED BY public.servicio.servicio_id;


--
-- Name: tipo_usuario; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.tipo_usuario (
    tipo_usuario_id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.tipo_usuario OWNER TO ulimar;

--
-- Name: tipo_usuario_tipo_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: ulimar
--

CREATE SEQUENCE public.tipo_usuario_tipo_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_usuario_tipo_usuario_id_seq OWNER TO ulimar;

--
-- Name: tipo_usuario_tipo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ulimar
--

ALTER SEQUENCE public.tipo_usuario_tipo_usuario_id_seq OWNED BY public.tipo_usuario.tipo_usuario_id;


--
-- Name: turno; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.turno (
    turno_id integer NOT NULL,
    usuario_id integer,
    servicio_id integer,
    empleado_id integer,
    fecha date NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone,
    estado character varying(20),
    nombre_servicio character varying(100)
);


ALTER TABLE public.turno OWNER TO ulimar;

--
-- Name: turno_turno_id_seq; Type: SEQUENCE; Schema: public; Owner: ulimar
--

CREATE SEQUENCE public.turno_turno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.turno_turno_id_seq OWNER TO ulimar;

--
-- Name: turno_turno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ulimar
--

ALTER SEQUENCE public.turno_turno_id_seq OWNED BY public.turno.turno_id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.usuario (
    usuario_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    tipo_usuario_id integer,
    ciudad_id integer
);


ALTER TABLE public.usuario OWNER TO ulimar;

--
-- Name: usuario_condicion; Type: TABLE; Schema: public; Owner: ulimar
--

CREATE TABLE public.usuario_condicion (
    usuario_id integer NOT NULL,
    condicion_id integer NOT NULL
);


ALTER TABLE public.usuario_condicion OWNER TO ulimar;

--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: ulimar
--

CREATE SEQUENCE public.usuario_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_usuario_id_seq OWNER TO ulimar;

--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ulimar
--

ALTER SEQUENCE public.usuario_usuario_id_seq OWNED BY public.usuario.usuario_id;


--
-- Name: ciudad ciudad_id; Type: DEFAULT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN ciudad_id SET DEFAULT nextval('public.ciudad_ciudad_id_seq'::regclass);


--
-- Name: condicion condicion_id; Type: DEFAULT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.condicion ALTER COLUMN condicion_id SET DEFAULT nextval('public.condicion_condicion_id_seq'::regclass);


--
-- Name: empleado empleado_id; Type: DEFAULT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.empleado ALTER COLUMN empleado_id SET DEFAULT nextval('public.empleado_empleado_id_seq'::regclass);


--
-- Name: medio_notificacion medio_id; Type: DEFAULT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.medio_notificacion ALTER COLUMN medio_id SET DEFAULT nextval('public.medio_notificacion_medio_id_seq'::regclass);


--
-- Name: notificacion notificacion_id; Type: DEFAULT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.notificacion ALTER COLUMN notificacion_id SET DEFAULT nextval('public.notificacion_notificacion_id_seq'::regclass);


--
-- Name: servicio servicio_id; Type: DEFAULT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.servicio ALTER COLUMN servicio_id SET DEFAULT nextval('public.servicio_servicio_id_seq'::regclass);


--
-- Name: tipo_usuario tipo_usuario_id; Type: DEFAULT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.tipo_usuario ALTER COLUMN tipo_usuario_id SET DEFAULT nextval('public.tipo_usuario_tipo_usuario_id_seq'::regclass);


--
-- Name: turno turno_id; Type: DEFAULT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.turno ALTER COLUMN turno_id SET DEFAULT nextval('public.turno_turno_id_seq'::regclass);


--
-- Name: usuario usuario_id; Type: DEFAULT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.usuario ALTER COLUMN usuario_id SET DEFAULT nextval('public.usuario_usuario_id_seq'::regclass);


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.ciudad (ciudad_id, nombre_ciudad, codigo_postal) FROM stdin;
1	Cali	760001
2	Bogotá	110111
\.


--
-- Data for Name: condicion; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.condicion (condicion_id, nombre, descripcion) FROM stdin;
1	Embarazo	Usuario embarazado
2	Silla de ruedas	Requiere acceso especial
3	Adulto mayor	Mayor de 60 años
\.


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.empleado (empleado_id, usuario_id, cargo, departamento) FROM stdin;
1	1	Técnico	Operaciones
\.


--
-- Data for Name: medio_notificacion; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.medio_notificacion (medio_id, nombre) FROM stdin;
1	Correo
2	SMS
3	Teléfono
\.


--
-- Data for Name: notificacion; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.notificacion (notificacion_id, usuario_id, medio_id, mensaje, fecha_envio, estado) FROM stdin;
1	2	1	Su turno ha sido agendado	2025-10-19 23:36:27.692608	Enviado
2	3	2	Tiene un turno pendiente	2025-10-19 23:36:27.692608	Pendiente
\.


--
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.servicio (servicio_id, nombre, descripcion, estado) FROM stdin;
1	Despacho	Entrega de artículos	\N
2	Atención al Cliente	Gestión de solicitudes	\N
3	Consultoría	Asesoría especializada	\N
\.


--
-- Data for Name: tipo_usuario; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.tipo_usuario (tipo_usuario_id, nombre) FROM stdin;
1	Cliente
2	Empleado
3	Proveedor
\.


--
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.turno (turno_id, usuario_id, servicio_id, empleado_id, fecha, hora_inicio, hora_fin, estado, nombre_servicio) FROM stdin;
1	2	1	1	2025-10-20	08:00:00	09:00:00	Confirmado	\N
2	3	2	1	2025-10-21	09:00:00	10:30:00	Pendiente	\N
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.usuario (usuario_id, nombre, apellido, tipo_usuario_id, ciudad_id) FROM stdin;
1	Jhonatan	Castaño	2	1
2	Valentina	Ruiz	1	2
3	Carlos	López	3	1
\.


--
-- Data for Name: usuario_condicion; Type: TABLE DATA; Schema: public; Owner: ulimar
--

COPY public.usuario_condicion (usuario_id, condicion_id) FROM stdin;
2	3
3	2
\.


--
-- Name: ciudad_ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ulimar
--

SELECT pg_catalog.setval('public.ciudad_ciudad_id_seq', 2, true);


--
-- Name: condicion_condicion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ulimar
--

SELECT pg_catalog.setval('public.condicion_condicion_id_seq', 3, true);


--
-- Name: empleado_empleado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ulimar
--

SELECT pg_catalog.setval('public.empleado_empleado_id_seq', 1, true);


--
-- Name: medio_notificacion_medio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ulimar
--

SELECT pg_catalog.setval('public.medio_notificacion_medio_id_seq', 3, true);


--
-- Name: notificacion_notificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ulimar
--

SELECT pg_catalog.setval('public.notificacion_notificacion_id_seq', 2, true);


--
-- Name: servicio_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ulimar
--

SELECT pg_catalog.setval('public.servicio_servicio_id_seq', 3, true);


--
-- Name: tipo_usuario_tipo_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ulimar
--

SELECT pg_catalog.setval('public.tipo_usuario_tipo_usuario_id_seq', 3, true);


--
-- Name: turno_turno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ulimar
--

SELECT pg_catalog.setval('public.turno_turno_id_seq', 2, true);


--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ulimar
--

SELECT pg_catalog.setval('public.usuario_usuario_id_seq', 3, true);


--
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (ciudad_id);


--
-- Name: condicion condicion_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.condicion
    ADD CONSTRAINT condicion_pkey PRIMARY KEY (condicion_id);


--
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (empleado_id);


--
-- Name: medio_notificacion medio_notificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.medio_notificacion
    ADD CONSTRAINT medio_notificacion_pkey PRIMARY KEY (medio_id);


--
-- Name: notificacion notificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.notificacion
    ADD CONSTRAINT notificacion_pkey PRIMARY KEY (notificacion_id);


--
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (servicio_id);


--
-- Name: tipo_usuario tipo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (tipo_usuario_id);


--
-- Name: turno turno_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (turno_id);


--
-- Name: usuario_condicion usuario_condicion_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.usuario_condicion
    ADD CONSTRAINT usuario_condicion_pkey PRIMARY KEY (usuario_id, condicion_id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id);


--
-- Name: empleado empleado_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);


--
-- Name: notificacion notificacion_medio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.notificacion
    ADD CONSTRAINT notificacion_medio_id_fkey FOREIGN KEY (medio_id) REFERENCES public.medio_notificacion(medio_id);


--
-- Name: notificacion notificacion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.notificacion
    ADD CONSTRAINT notificacion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);


--
-- Name: turno turno_empleado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_empleado_id_fkey FOREIGN KEY (empleado_id) REFERENCES public.empleado(empleado_id);


--
-- Name: turno turno_servicio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_servicio_id_fkey FOREIGN KEY (servicio_id) REFERENCES public.servicio(servicio_id);


--
-- Name: turno turno_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.turno
    ADD CONSTRAINT turno_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);


--
-- Name: usuario usuario_ciudad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_ciudad_id_fkey FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(ciudad_id);


--
-- Name: usuario_condicion usuario_condicion_condicion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.usuario_condicion
    ADD CONSTRAINT usuario_condicion_condicion_id_fkey FOREIGN KEY (condicion_id) REFERENCES public.condicion(condicion_id);


--
-- Name: usuario_condicion usuario_condicion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.usuario_condicion
    ADD CONSTRAINT usuario_condicion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(usuario_id);


--
-- Name: usuario usuario_tipo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ulimar
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_tipo_usuario_id_fkey FOREIGN KEY (tipo_usuario_id) REFERENCES public.tipo_usuario(tipo_usuario_id);


--
-- PostgreSQL database dump complete
--

\unrestrict qGiu3HjxWXP5ZkyYbfjwrL4eYaGRNGO7eZWGs0hkHRTYRzt29ZAmFMLNQf7Tnwf

