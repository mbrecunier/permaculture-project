--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: companions; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE companions (
    id integer NOT NULL,
    name character varying,
    planting_season character varying,
    health_benefits character varying,
    other_uses text,
    img_url character varying
);


ALTER TABLE companions OWNER TO "Guest";

--
-- Name: companions_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE companions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE companions_id_seq OWNER TO "Guest";

--
-- Name: companions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE companions_id_seq OWNED BY companions.id;


--
-- Name: nutrientneeds; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE nutrientneeds (
    id integer NOT NULL,
    description character varying
);


ALTER TABLE nutrientneeds OWNER TO "Guest";

--
-- Name: nutrientneeds_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE nutrientneeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nutrientneeds_id_seq OWNER TO "Guest";

--
-- Name: nutrientneeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE nutrientneeds_id_seq OWNED BY nutrientneeds.id;


--
-- Name: plants; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE plants (
    id integer NOT NULL,
    plant_name character varying,
    planting_season character varying,
    img_url character varying,
    health_benefits text
);


ALTER TABLE plants OWNER TO "Guest";

--
-- Name: plants_companions; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE plants_companions (
    id integer NOT NULL,
    plant_id integer,
    companion_id integer,
    cohab_benefits text
);


ALTER TABLE plants_companions OWNER TO "Guest";

--
-- Name: plants_companions_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE plants_companions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plants_companions_id_seq OWNER TO "Guest";

--
-- Name: plants_companions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE plants_companions_id_seq OWNED BY plants_companions.id;


--
-- Name: plants_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE plants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plants_id_seq OWNER TO "Guest";

--
-- Name: plants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE plants_id_seq OWNED BY plants.id;


--
-- Name: plants_nutrientneeds; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE plants_nutrientneeds (
    id integer NOT NULL,
    plant_id integer,
    nutrientproperty_id integer
);


ALTER TABLE plants_nutrientneeds OWNER TO "Guest";

--
-- Name: plants_nutrientneeds_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE plants_nutrientneeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plants_nutrientneeds_id_seq OWNER TO "Guest";

--
-- Name: plants_nutrientneeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE plants_nutrientneeds_id_seq OWNED BY plants_nutrientneeds.id;


--
-- Name: tools; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE tools (
    id integer NOT NULL,
    tool_name character varying,
    img_url character varying
);


ALTER TABLE tools OWNER TO "Guest";

--
-- Name: tools_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE tools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tools_id_seq OWNER TO "Guest";

--
-- Name: tools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE tools_id_seq OWNED BY tools.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    password character varying
);


ALTER TABLE users OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_plants; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE users_plants (
    id integer NOT NULL,
    user_id integer,
    plant_id integer
);


ALTER TABLE users_plants OWNER TO "Guest";

--
-- Name: users_plants_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE users_plants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_plants_id_seq OWNER TO "Guest";

--
-- Name: users_plants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE users_plants_id_seq OWNED BY users_plants.id;


--
-- Name: users_tools; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE users_tools (
    id integer NOT NULL,
    user_id integer,
    tool_id integer
);


ALTER TABLE users_tools OWNER TO "Guest";

--
-- Name: users_tools_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE users_tools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_tools_id_seq OWNER TO "Guest";

--
-- Name: users_tools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE users_tools_id_seq OWNED BY users_tools.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY companions ALTER COLUMN id SET DEFAULT nextval('companions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY nutrientneeds ALTER COLUMN id SET DEFAULT nextval('nutrientneeds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY plants ALTER COLUMN id SET DEFAULT nextval('plants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY plants_companions ALTER COLUMN id SET DEFAULT nextval('plants_companions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY plants_nutrientneeds ALTER COLUMN id SET DEFAULT nextval('plants_nutrientneeds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY tools ALTER COLUMN id SET DEFAULT nextval('tools_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users_plants ALTER COLUMN id SET DEFAULT nextval('users_plants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users_tools ALTER COLUMN id SET DEFAULT nextval('users_tools_id_seq'::regclass);


--
-- Data for Name: companions; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY companions (id, name, planting_season, health_benefits, other_uses, img_url) FROM stdin;
\.


--
-- Name: companions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('companions_id_seq', 1, false);


--
-- Data for Name: nutrientneeds; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY nutrientneeds (id, description) FROM stdin;
\.


--
-- Name: nutrientneeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('nutrientneeds_id_seq', 1, false);


--
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY plants (id, plant_name, planting_season, img_url, health_benefits) FROM stdin;
1	tomatoes	After last frost	img/tomato.jpg	Source of vitamin C. Lycopene linked to cancer prevention.
2	liberty apples	Early Spring	img/appletree.jpg	Twice the antioxidant value of golden delicous apples.
3	kale	Early Spring and Late Fall	img/kale.jpg	Vitamin A: 206% of the RDA (from beta-carotene). Vitamin K: 684% of the RDA
4	broccoli	Early Spring and Fall	img/broccoli.jpg	Great source of vitamins K and C. Good source of folate.
5	beets	March/April	img/beets.jpg	Great source of vitamins C and Iron. Good source of magnesium.
6	romaine lettuce	March/April	img/romainelettuce.jpg	\N
7	cucumber	Spring: no less than two week after last frost 	img/cucumber.jpg	Excellent source of vitamin K and molybdenum. They are also a very good source of the pantothenic acid and contain copper, potassium, manganese, vitamin C, phosphorus, magnesium, biotin, and vitamin B1
8	carrots	April	img/carrot.jpg	Rich in vitamin A, Vitamin C, Vitamin K, vitamin B8, pantothenic acid, folate, potassium, iron, copper, and manganese
9	cauliflower	Fall 6-8 weeks before fall frost	img/cauliflower.jpg	\N
10	onions	Plant as soon as the ground can be worked in the spring	img/onion.jpg	High in vitamin C, onions are a good source of dietary fiber, and folic acid.
11	potatoes	Early Spring	img/potato.jpg	Potatoes are a very good source of vitamin B6 and a good source ofpotassium, copper, vitamin C, manganese, phosphorus, niacin, dietary fiber, and pantothenic acid.
12	runner bean	Early Spring (perennial)	img/runnerbean.jpg	Protein, Thiamin, Riboflavin, Niacin, Vitamin B6, Calcium, Iron, Magnesium, Phosphorus, Potassium and Copper, and a very good source of Dietary Fiber, Vitamin A, Vitamin C, Vitamin K, Folate and Manganese
13	arugula	Early Spring or Fall	img/arugula.jpg	It is good source of Protein, Thiamin, Riboflavin, Vitamin B6, Pantothenic Acid, Zinc and Copper, and a very good source of Dietary Fiber, Vitamin A, Vitamin C, Vitamin K
14	strawberries	Early Spring	img/strawberries.jpg	Have a unique combination of antioxidant and anti-inflammatory nutrients. They are also an excellent source of dietary fiber and Vitamins C and K. AND, a very good source of manganese, pantothenic acid, vitamin B1, and iodine. AND, a good source of folic acid, biotin, and vitamin B6!
15	squash	summer and winter varietals	img/squash.jpg	Potassium, Vitamin C, Fiber, Vitamin B-6, Vitamin A, Magnesium, Iron
\.


--
-- Data for Name: plants_companions; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY plants_companions (id, plant_id, companion_id, cohab_benefits) FROM stdin;
\.


--
-- Name: plants_companions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('plants_companions_id_seq', 1, false);


--
-- Name: plants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('plants_id_seq', 1, false);


--
-- Data for Name: plants_nutrientneeds; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY plants_nutrientneeds (id, plant_id, nutrientproperty_id) FROM stdin;
\.


--
-- Name: plants_nutrientneeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('plants_nutrientneeds_id_seq', 1, false);


--
-- Data for Name: tools; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY tools (id, tool_name, img_url) FROM stdin;
2	Phillips Head Screwdriver	Phillips-head-screwdriver.jpg
3	Hammer	hammer.jpg
\.


--
-- Name: tools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('tools_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY users (id, name, password) FROM stdin;
1	chalmie	1234
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Data for Name: users_plants; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY users_plants (id, user_id, plant_id) FROM stdin;
1	1	1
2	1	2
\.


--
-- Name: users_plants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('users_plants_id_seq', 2, true);


--
-- Data for Name: users_tools; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY users_tools (id, user_id, tool_id) FROM stdin;
\.


--
-- Name: users_tools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('users_tools_id_seq', 1, false);


--
-- Name: companions_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY companions
    ADD CONSTRAINT companions_pkey PRIMARY KEY (id);


--
-- Name: nutrientneeds_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY nutrientneeds
    ADD CONSTRAINT nutrientneeds_pkey PRIMARY KEY (id);


--
-- Name: plants_companions_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY plants_companions
    ADD CONSTRAINT plants_companions_pkey PRIMARY KEY (id);


--
-- Name: plants_nutrientneeds_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY plants_nutrientneeds
    ADD CONSTRAINT plants_nutrientneeds_pkey PRIMARY KEY (id);


--
-- Name: plants_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (id);


--
-- Name: tools_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY tools
    ADD CONSTRAINT tools_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_plants_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY users_plants
    ADD CONSTRAINT users_plants_pkey PRIMARY KEY (id);


--
-- Name: users_tools_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY users_tools
    ADD CONSTRAINT users_tools_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

