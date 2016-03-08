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
-- Name: companions; Type: TABLE; Schema: public; Owner: xanadu; Tablespace: 
--

CREATE TABLE companions (
    id integer NOT NULL,
    name character varying,
    planting_season character varying,
    health_benefits character varying,
    other_uses text,
    img_url character varying
);


ALTER TABLE companions OWNER TO xanadu;

--
-- Name: companions_id_seq; Type: SEQUENCE; Schema: public; Owner: xanadu
--

CREATE SEQUENCE companions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE companions_id_seq OWNER TO xanadu;

--
-- Name: companions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xanadu
--

ALTER SEQUENCE companions_id_seq OWNED BY companions.id;


--
-- Name: nutrientneeds; Type: TABLE; Schema: public; Owner: xanadu; Tablespace: 
--

CREATE TABLE nutrientneeds (
    id integer NOT NULL,
    description character varying
);


ALTER TABLE nutrientneeds OWNER TO xanadu;

--
-- Name: nutrientneeds_id_seq; Type: SEQUENCE; Schema: public; Owner: xanadu
--

CREATE SEQUENCE nutrientneeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nutrientneeds_id_seq OWNER TO xanadu;

--
-- Name: nutrientneeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xanadu
--

ALTER SEQUENCE nutrientneeds_id_seq OWNED BY nutrientneeds.id;


--
-- Name: plants; Type: TABLE; Schema: public; Owner: xanadu; Tablespace: 
--

CREATE TABLE plants (
    id integer NOT NULL,
    plant_name character varying,
    planting_season character varying,
    img_url character varying,
    health_benefits text
);


ALTER TABLE plants OWNER TO xanadu;

--
-- Name: plants_companions; Type: TABLE; Schema: public; Owner: xanadu; Tablespace: 
--

CREATE TABLE plants_companions (
    id integer NOT NULL,
    plant_id integer,
    companion_id integer,
    cohab_benefits text
);


ALTER TABLE plants_companions OWNER TO xanadu;

--
-- Name: plants_companions_id_seq; Type: SEQUENCE; Schema: public; Owner: xanadu
--

CREATE SEQUENCE plants_companions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plants_companions_id_seq OWNER TO xanadu;

--
-- Name: plants_companions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xanadu
--

ALTER SEQUENCE plants_companions_id_seq OWNED BY plants_companions.id;


--
-- Name: plants_id_seq; Type: SEQUENCE; Schema: public; Owner: xanadu
--

CREATE SEQUENCE plants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plants_id_seq OWNER TO xanadu;

--
-- Name: plants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xanadu
--

ALTER SEQUENCE plants_id_seq OWNED BY plants.id;


--
-- Name: plants_nutrientneeds; Type: TABLE; Schema: public; Owner: xanadu; Tablespace: 
--

CREATE TABLE plants_nutrientneeds (
    id integer NOT NULL,
    plant_id integer,
    nutrientproperty_id integer
);


ALTER TABLE plants_nutrientneeds OWNER TO xanadu;

--
-- Name: plants_nutrientneeds_id_seq; Type: SEQUENCE; Schema: public; Owner: xanadu
--

CREATE SEQUENCE plants_nutrientneeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plants_nutrientneeds_id_seq OWNER TO xanadu;

--
-- Name: plants_nutrientneeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xanadu
--

ALTER SEQUENCE plants_nutrientneeds_id_seq OWNED BY plants_nutrientneeds.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: xanadu; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    password character varying
);


ALTER TABLE users OWNER TO xanadu;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: xanadu
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO xanadu;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xanadu
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_plants; Type: TABLE; Schema: public; Owner: xanadu; Tablespace: 
--

CREATE TABLE users_plants (
    id integer NOT NULL,
    user_id integer,
    plant_id integer
);


ALTER TABLE users_plants OWNER TO xanadu;

--
-- Name: users_plants_id_seq; Type: SEQUENCE; Schema: public; Owner: xanadu
--

CREATE SEQUENCE users_plants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_plants_id_seq OWNER TO xanadu;

--
-- Name: users_plants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xanadu
--

ALTER SEQUENCE users_plants_id_seq OWNED BY users_plants.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xanadu
--

ALTER TABLE ONLY companions ALTER COLUMN id SET DEFAULT nextval('companions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xanadu
--

ALTER TABLE ONLY nutrientneeds ALTER COLUMN id SET DEFAULT nextval('nutrientneeds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xanadu
--

ALTER TABLE ONLY plants ALTER COLUMN id SET DEFAULT nextval('plants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xanadu
--

ALTER TABLE ONLY plants_companions ALTER COLUMN id SET DEFAULT nextval('plants_companions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xanadu
--

ALTER TABLE ONLY plants_nutrientneeds ALTER COLUMN id SET DEFAULT nextval('plants_nutrientneeds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xanadu
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: xanadu
--

ALTER TABLE ONLY users_plants ALTER COLUMN id SET DEFAULT nextval('users_plants_id_seq'::regclass);


--
-- Data for Name: companions; Type: TABLE DATA; Schema: public; Owner: xanadu
--

COPY companions (id, name, planting_season, health_benefits, other_uses, img_url) FROM stdin;
\.


--
-- Name: companions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xanadu
--

SELECT pg_catalog.setval('companions_id_seq', 1, false);


--
-- Data for Name: nutrientneeds; Type: TABLE DATA; Schema: public; Owner: xanadu
--

COPY nutrientneeds (id, description) FROM stdin;
\.


--
-- Name: nutrientneeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xanadu
--

SELECT pg_catalog.setval('nutrientneeds_id_seq', 1, false);


--
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: xanadu
--

COPY plants (id, plant_name, planting_season, img_url, health_benefits) FROM stdin;
1	tomatoes	After last frost	http://www.agraz.com/blog/wp-content/uploads/2013/07/meT6hHG1.jpg	Source of vitamin C. Lycopene linked to cancer prevention.
2	liberty apples	Early Spring	http://caseytrees.org/wp-content/uploads/2012/02/apple-form.jpg	Twice the antioxidant value of golden delicous apples.
3	kale	Early Spring and Late Fall	http://thetrustygardener.com/blog/wp-content/uploads/2012/03/Kale-3-496.png	Vitamin A: 206% of the RDA (from beta-carotene). Vitamin K: 684% of the RDA
4	broccoli	Early Spring and Fall	http://www.foodswinesfromspain.com/spanishfoodwine/wcm/idc/groups/public/documents/imagen/odix/mdc2/~edisp/1821076141.jpg	Great source of vitamins K and C. Good source of folate.
5	beets	March/April	http://www.readthespirit.com/feed-the-spirit/wp-content/uploads/sites/19/2014/10/beets-red-ace-flickr.jpg	Great source of vitamins C and Iron. Good source of magnesium.
6	romaine lettuce	March/April	http://www.theinnovationdiaries.com/wp-content/uploads/2011/08/growing-lettuce.jpg	\N
7	cucumber	Spring: no less than two week after last frost 	http://i.parkseed.com/images/xxl/05578-pk-p1.jpg	Excellent source of vitamin K and molybdenum. They are also a very good source of the pantothenic acid and contain copper, potassium, manganese, vitamin C, phosphorus, magnesium, biotin, and vitamin B1
8	carrots	April	http://www.motherearthnews.com/~/media/Images/MEN/Editorial/Blogs/Organic%20Gardening/Measure%20Garden%20Soil%20Compaction%20With%20a%20Carrot%20Test/20150706carrotshapes.jpg?h=366&w=550&la=en	Rich in vitamin A, Vitamin C, Vitamin K, vitamin B8, pantothenic acid, folate, potassium, iron, copper, and manganese
9	cauliflower	Fall 6-8 weeks before fall frost	http://www.sloatgardens.com/wp-content/uploads/2014/02/shutterstock_109766633.jpg	\N
10	onions	Plant as soon as the ground can be worked in the spring	http://www.babyfit.com/babyfit/member_pics/onion_plants.jpg	High in vitamin C, onions are a good source of dietary fiber, and folic acid.
11	potatoes	Early Spring	http://blueplanetcustodians.com/wp-content/uploads/2014/07/potato-plant.jpg	Potatoes are a very good source of vitamin B6 and a good source ofpotassium, copper, vitamin C, manganese, phosphorus, niacin, dietary fiber, and pantothenic acid.
12	runner bean	Early Spring (perennial)	http://www.sherckseeds.com/pages/wp-content/uploads/2014/11/scarlet-runner-1000-by-750.jpg	Protein, Thiamin, Riboflavin, Niacin, Vitamin B6, Calcium, Iron, Magnesium, Phosphorus, Potassium and Copper, and a very good source of Dietary Fiber, Vitamin A, Vitamin C, Vitamin K, Folate and Manganese
13	arugula	Early Spring or Fall	http://p-fst1.pixstatic.com/5254387e697ab0615600d3b6._w.540_h.405_s.fit_.jpg	It is good source of Protein, Thiamin, Riboflavin, Vitamin B6, Pantothenic Acid, Zinc and Copper, and a very good source of Dietary Fiber, Vitamin A, Vitamin C, Vitamin K
14	strawberries	Early Spring	http://cf.ltkcdn.net/garden/images/std/147644-400x300-Closeup-of-strawberries.jpg	Have a unique combination of antioxidant and anti-inflammatory nutrients. They are also an excellent source of dietary fiber and Vitamins C and K. AND, a very good source of manganese, pantothenic acid, vitamin B1, and iodine. AND, a good source of folic acid, biotin, and vitamin B6!
15	squash	summer and winter varietals	https://utmarketgarden.files.wordpress.com/2011/07/healthy-squash.jpg	Potassium, Vitamin C, Fiber, Vitamin B-6, Vitamin A, Magnesium, Iron
\.


--
-- Data for Name: plants_companions; Type: TABLE DATA; Schema: public; Owner: xanadu
--

COPY plants_companions (id, plant_id, companion_id, cohab_benefits) FROM stdin;
\.


--
-- Name: plants_companions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xanadu
--

SELECT pg_catalog.setval('plants_companions_id_seq', 1, false);


--
-- Name: plants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xanadu
--

SELECT pg_catalog.setval('plants_id_seq', 1, false);


--
-- Data for Name: plants_nutrientneeds; Type: TABLE DATA; Schema: public; Owner: xanadu
--

COPY plants_nutrientneeds (id, plant_id, nutrientproperty_id) FROM stdin;
\.


--
-- Name: plants_nutrientneeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xanadu
--

SELECT pg_catalog.setval('plants_nutrientneeds_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: xanadu
--

COPY users (id, name, password) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xanadu
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: users_plants; Type: TABLE DATA; Schema: public; Owner: xanadu
--

COPY users_plants (id, user_id, plant_id) FROM stdin;
\.


--
-- Name: users_plants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xanadu
--

SELECT pg_catalog.setval('users_plants_id_seq', 1, false);


--
-- Name: companions_pkey; Type: CONSTRAINT; Schema: public; Owner: xanadu; Tablespace: 
--

ALTER TABLE ONLY companions
    ADD CONSTRAINT companions_pkey PRIMARY KEY (id);


--
-- Name: nutrientneeds_pkey; Type: CONSTRAINT; Schema: public; Owner: xanadu; Tablespace: 
--

ALTER TABLE ONLY nutrientneeds
    ADD CONSTRAINT nutrientneeds_pkey PRIMARY KEY (id);


--
-- Name: plants_companions_pkey; Type: CONSTRAINT; Schema: public; Owner: xanadu; Tablespace: 
--

ALTER TABLE ONLY plants_companions
    ADD CONSTRAINT plants_companions_pkey PRIMARY KEY (id);


--
-- Name: plants_nutrientneeds_pkey; Type: CONSTRAINT; Schema: public; Owner: xanadu; Tablespace: 
--

ALTER TABLE ONLY plants_nutrientneeds
    ADD CONSTRAINT plants_nutrientneeds_pkey PRIMARY KEY (id);


--
-- Name: plants_pkey; Type: CONSTRAINT; Schema: public; Owner: xanadu; Tablespace: 
--

ALTER TABLE ONLY plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: xanadu; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_plants_pkey; Type: CONSTRAINT; Schema: public; Owner: xanadu; Tablespace: 
--

ALTER TABLE ONLY users_plants
    ADD CONSTRAINT users_plants_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: xanadu
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM xanadu;
GRANT ALL ON SCHEMA public TO xanadu;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

