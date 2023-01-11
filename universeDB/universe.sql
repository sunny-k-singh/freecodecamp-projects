--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text NOT NULL,
    mass numeric(4,2) NOT NULL,
    distance numeric(4,2),
    galaxycluster_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxycluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxycluster (
    galaxycluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxycluster OWNER TO freecodecamp;

--
-- Name: galaxycluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxycluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxycluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxycluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxycluster_cluster_id_seq OWNED BY public.galaxycluster.galaxycluster_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    mass numeric(4,2) NOT NULL,
    distance numeric(4,2),
    description text NOT NULL,
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    mass numeric(4,2) NOT NULL,
    distance numeric(4,2),
    description text NOT NULL,
    number_of_moons integer,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    mass numeric(4,2) NOT NULL,
    distance numeric(4,2),
    description text NOT NULL,
    number_of_planet integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxycluster galaxycluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxycluster ALTER COLUMN galaxycluster_id SET DEFAULT nextval('public.galaxycluster_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 10.00, 23.25, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Our nearest galalxy', 15.00, 20.25, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Also known as Messier33, a spiral galaxy', 12.00, 10.25, 1);
INSERT INTO public.galaxy VALUES (6, 'NGC 4911', 'A spiral galaxy', 22.00, 40.25, 3);
INSERT INTO public.galaxy VALUES (4, 'M87', 'Also known as virgo A', 22.00, 40.25, 2);
INSERT INTO public.galaxy VALUES (5, 'M49', 'An elliptical galaxy in Virgo cluster', 22.00, 40.25, 2);


--
-- Data for Name: galaxycluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxycluster VALUES (1, 'Local Group', 'Local Group is our local galaxy cluster with Milky way in it');
INSERT INTO public.galaxycluster VALUES (2, 'Virgo Cluster', 'Our closest and best studied galaxy cluster');
INSERT INTO public.galaxycluster VALUES (3, 'Coma Cluster', 'In our constellation Coma Berenices, one of the largest known structures in the universe');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 12.09, 13.05, 'belongs to jupiter', false, 5);
INSERT INTO public.moon VALUES (2, 'moon2', 12.09, 13.05, 'belongs to jupiter again', false, 5);
INSERT INTO public.moon VALUES (3, 'moon3', 12.09, 13.05, 'belongs to jupiter yet again', false, 5);
INSERT INTO public.moon VALUES (4, 'moon4', 12.09, 13.05, 'belongs to jupiter too', false, 5);
INSERT INTO public.moon VALUES (5, 'moon5', 12.09, 13.05, 'belongs to Saturn', false, 6);
INSERT INTO public.moon VALUES (6, 'moon6', 12.09, 13.05, 'belongs to Saturn again', false, 6);
INSERT INTO public.moon VALUES (7, 'moon7', 12.09, 13.05, 'belongs to Saturn yet again', false, 6);
INSERT INTO public.moon VALUES (8, 'moon', 12.09, 13.05, 'Our own moon', false, 3);
INSERT INTO public.moon VALUES (9, 'moon9', 12.09, 13.05, 'belongs to Neptune', false, 8);
INSERT INTO public.moon VALUES (10, 'moon10', 12.09, 13.05, 'belongs to Neptune again', false, 8);
INSERT INTO public.moon VALUES (11, 'moon11', 12.09, 13.05, 'belongs to Neptune yet again', false, 8);
INSERT INTO public.moon VALUES (12, 'moon12', 12.09, 13.05, 'belongs to Pluto', false, 9);
INSERT INTO public.moon VALUES (13, 'moon13', 12.09, 13.05, 'belongs to Pluto too', false, 9);
INSERT INTO public.moon VALUES (14, 'moon14', 12.09, 13.05, 'belongs to Pluto again', false, 9);
INSERT INTO public.moon VALUES (15, 'moon15', 12.09, 13.05, 'this too belongs to Pluto', false, 9);
INSERT INTO public.moon VALUES (16, 'moon16', 12.09, 13.05, 'belongs to Planet B', false, 10);
INSERT INTO public.moon VALUES (17, 'moon17', 12.09, 13.05, 'belongs to Planet B again', false, 10);
INSERT INTO public.moon VALUES (18, 'moon18', 12.09, 13.05, 'belongs to Planet Beta', false, 12);
INSERT INTO public.moon VALUES (19, 'moon19', 12.09, 13.05, 'belongs to Planet Beta again', false, 12);
INSERT INTO public.moon VALUES (20, 'moon20', 12.09, 13.05, 'belongs to Planet Beta yet again', false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 23.42, 12.33, 'first planet', 0, false, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 23.42, 12.33, 'Second planet', 0, false, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 23.42, 12.33, 'Third planet', 0, false, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 23.42, 12.33, 'Fourth planet', 2, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 23.42, 12.33, 'Fifth planet', 79, false, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 23.42, 12.33, 'Sixth planet', 82, false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 23.42, 12.33, 'Seven planet', 27, false, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 23.42, 12.33, 'Eighth planet', 14, false, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 23.42, 12.33, 'Ninth planet (not anymore)', 5, false, 2);
INSERT INTO public.planet VALUES (10, 'PlanetB', 23.42, 12.33, 'Belongs to Kepler444', 7, false, 4);
INSERT INTO public.planet VALUES (11, 'PlanetC', 23.42, 12.33, 'Belongs to Kepler444 again', 7, false, 4);
INSERT INTO public.planet VALUES (12, 'PlanetBeta', 23.42, 12.33, 'Belongs to Beta', 7, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuese', 22.00, 40.25, 'The mysterious star', NULL, 1);
INSERT INTO public.star VALUES (2, 'Sun', 22.00, 40.25, 'Our own star', 9, 1);
INSERT INTO public.star VALUES (3, 'Kepler 444', 22.00, 40.25, 'A triple star system', 3, 1);
INSERT INTO public.star VALUES (4, 'Beta4', 22.00, 40.25, 'A triple star system in andromeda', 3, 2);
INSERT INTO public.star VALUES (5, 'Beta44', 22.00, 40.25, 'A triple star system in andromeda again', 3, 2);
INSERT INTO public.star VALUES (6, 'BM84', 22.00, 40.25, 'A twelve star system in M87', 12, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxycluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxycluster_cluster_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxycluster galaxycluster_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxycluster
    ADD CONSTRAINT galaxycluster_description_key UNIQUE (description);


--
-- Name: galaxycluster galaxycluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxycluster
    ADD CONSTRAINT galaxycluster_pkey PRIMARY KEY (galaxycluster_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (galaxycluster_id) REFERENCES public.galaxycluster(galaxycluster_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

