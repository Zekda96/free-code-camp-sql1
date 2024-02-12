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
    name character varying(20) NOT NULL,
    mass integer NOT NULL,
    diameter integer,
    distance_from_earth integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass integer NOT NULL,
    diameter integer,
    has_oxygen boolean,
    has_helium boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass integer NOT NULL,
    diameter integer,
    discovered_by text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_habitants; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_habitants (
    planet_habitants_id integer NOT NULL,
    name character varying(40) NOT NULL,
    height integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet_habitants OWNER TO freecodecamp;

--
-- Name: planet_habitants_planet_habitants_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_habitants_planet_habitants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_habitants_planet_habitants_id_seq OWNER TO freecodecamp;

--
-- Name: planet_habitants_planet_habitants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_habitants_planet_habitants_id_seq OWNED BY public.planet_habitants.planet_habitants_id;


--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass integer NOT NULL,
    diameter integer,
    brightness numeric(4,1),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_habitants planet_habitants_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitants ALTER COLUMN planet_habitants_id SET DEFAULT nextval('public.planet_habitants_planet_habitants_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Eye of God', 450, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 7400, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Condor', 8600, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cosmos', 3100, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Needle', 2700, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Spider', 5500, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 982, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Moon2', 859, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'Moon3', 859, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Moon4', 840, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (5, 'Moon5', 830, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (6, 'Moon6', 820, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (7, 'Moon7', 810, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (8, 'Moon8', 790, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Moon9', 770, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Moon10', 750, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Moon11', 710, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Moon12', 620, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (13, 'Moon13', 590, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (14, 'Moon14', 570, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (15, 'Moon15', 530, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (16, 'Moon16', 450, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (17, 'Moon17', 420, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (18, 'Moon18', 350, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (19, 'Moon19', 210, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (20, 'Moon20', 110, NULL, NULL, NULL, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet1', 20, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Planet2', 22, NULL, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Planet3', 24, NULL, NULL, 2);
INSERT INTO public.planet VALUES (4, 'Planet4', 26, NULL, NULL, 2);
INSERT INTO public.planet VALUES (5, 'Planet5', 28, NULL, NULL, 3);
INSERT INTO public.planet VALUES (6, 'Planet6', 30, NULL, NULL, 3);
INSERT INTO public.planet VALUES (7, 'Planet7', 32, NULL, NULL, 4);
INSERT INTO public.planet VALUES (8, 'Planet8', 38, NULL, NULL, 4);
INSERT INTO public.planet VALUES (9, 'Planet9', 42, NULL, NULL, 5);
INSERT INTO public.planet VALUES (10, 'Planet10', 58, NULL, NULL, 5);
INSERT INTO public.planet VALUES (11, 'Planet11', 70, NULL, NULL, 6);
INSERT INTO public.planet VALUES (12, 'Planet12', 15, NULL, NULL, 6);


--
-- Data for Name: planet_habitants; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_habitants VALUES (1, 'John', 170, 4);
INSERT INTO public.planet_habitants VALUES (2, 'Peter', 160, 8);
INSERT INTO public.planet_habitants VALUES (3, 'Mark', 195, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Acrab', 350, NULL, NULL, 6);
INSERT INTO public.star VALUES (2, 'Acrux', 450, NULL, NULL, 5);
INSERT INTO public.star VALUES (3, 'Rana', 700, NULL, NULL, 4);
INSERT INTO public.star VALUES (4, 'Tangra', 200, NULL, NULL, 3);
INSERT INTO public.star VALUES (5, 'Wurren', 420, NULL, NULL, 2);
INSERT INTO public.star VALUES (6, 'Zembra', 300, NULL, NULL, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_habitants_planet_habitants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_habitants_planet_habitants_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_habitants planet_habitants_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitants
    ADD CONSTRAINT planet_habitants_name_key UNIQUE (name);


--
-- Name: planet_habitants planet_habitants_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitants
    ADD CONSTRAINT planet_habitants_pkey PRIMARY KEY (planet_habitants_id);


--
-- Name: planet_habitants planet_habitants_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitants
    ADD CONSTRAINT planet_habitants_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_habitants fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_habitants
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

