--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(100) NOT NULL,
    size numeric NOT NULL,
    is_spiral boolean NOT NULL,
    description text
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric NOT NULL,
    has_atmosphere boolean NOT NULL,
    orbit_duration integer
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    radius numeric NOT NULL,
    has_rings boolean NOT NULL,
    distance_from_star integer
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
-- Name: space_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_object (
    space_object_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    age numeric NOT NULL,
    is_in_habitable_zone boolean NOT NULL
);


ALTER TABLE public.space_object OWNER TO freecodecamp;

--
-- Name: space_object_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_object_object_id_seq OWNER TO freecodecamp;

--
-- Name: space_object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_object_object_id_seq OWNED BY public.space_object.space_object_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric NOT NULL,
    is_visible boolean NOT NULL,
    temperature integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_object space_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object ALTER COLUMN space_object_id SET DEFAULT nextval('public.space_object_object_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, 'Home galaxy of Earth');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, true, 'Closest spiral galaxy to Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, true, 'Third-largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 76000, true, 'Spiral galaxy with unique features');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 50000, false, 'Notable for its bright nucleus');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 170000, true, 'One of the largest spiral galaxies');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, false, 27);
INSERT INTO public.moon VALUES (2, 'Europa', 3, 3122, true, 85);
INSERT INTO public.moon VALUES (3, 'Io', 3, 3643, true, 42);
INSERT INTO public.moon VALUES (4, 'Titan', 4, 5150, true, 16);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 5262, true, 172);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 4820, true, 150);
INSERT INTO public.moon VALUES (7, 'Phobos', 2, 22.4, false, 0);
INSERT INTO public.moon VALUES (8, 'Deimos', 2, 12.4, false, 1);
INSERT INTO public.moon VALUES (9, 'Triton', 5, 2706, true, 6);
INSERT INTO public.moon VALUES (10, 'Charon', 6, 1212, false, 6);
INSERT INTO public.moon VALUES (27, 'Oberon', 4, 1523.0, false, 13);
INSERT INTO public.moon VALUES (28, 'Titania', 4, 1577.8, false, 9);
INSERT INTO public.moon VALUES (29, 'Umbriel', 4, 1190.8, false, 4);
INSERT INTO public.moon VALUES (30, 'Ariel', 4, 1157.8, false, 3);
INSERT INTO public.moon VALUES (31, 'Miranda', 4, 471.6, false, 1);
INSERT INTO public.moon VALUES (32, 'Neptune', 5, 2706.8, true, 6);
INSERT INTO public.moon VALUES (33, 'Nereid', 5, 340.0, false, 360);
INSERT INTO public.moon VALUES (34, 'Proteus', 5, 418.0, false, 1);
INSERT INTO public.moon VALUES (35, 'Moonia', 6, 1212.0, false, 6);
INSERT INTO public.moon VALUES (36, 'Styx', 6, 16.0, false, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, false, 149600);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3390, false, 227940);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 69911, true, 778330);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 58232, true, 1429400);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, 24622, false, 4495100);
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 2, 12000, false, 600000);
INSERT INTO public.planet VALUES (7, 'GJ 1214 b', 2, 16500, true, 210000);
INSERT INTO public.planet VALUES (8, 'TrES-2b', 3, 16000, false, 150000);
INSERT INTO public.planet VALUES (9, 'WASP-12b', 3, 18000, true, 300000);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 4, 17500, false, 100000);
INSERT INTO public.planet VALUES (11, 'CoRoT-7b', 5, 10000, true, 50000);
INSERT INTO public.planet VALUES (12, 'Kepler-10b', 6, 10500, true, 70000);


--
-- Data for Name: space_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_object VALUES (1, 'Black Hole X-1', 'Black Hole', 5000000, false);
INSERT INTO public.space_object VALUES (2, 'Nebula Orion', 'Nebula', 3000000, false);
INSERT INTO public.space_object VALUES (3, 'Exoplanet Kepler-442b', 'Exoplanet', 4500000000, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.989, true, 5778);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 0.123, true, 3042);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 2.063, true, 9940);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 20.0, false, 3500);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 18.0, true, 12000);
INSERT INTO public.star VALUES (6, 'Polaris', 3, 6.0, true, 6000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 36, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_object_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_object_object_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_object space_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_name_key UNIQUE (name);


--
-- Name: space_object space_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_pkey PRIMARY KEY (space_object_id);


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

