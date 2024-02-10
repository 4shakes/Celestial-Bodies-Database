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
    name character varying(255) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    dimensions_light_years integer NOT NULL,
    years integer NOT NULL,
    galaxy_cluster_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    name character varying(255) NOT NULL,
    description text NOT NULL,
    galaxy_cluster_id integer NOT NULL
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


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
    name character varying(255) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    description text NOT NULL,
    gravity numeric NOT NULL,
    has_life boolean NOT NULL,
    millions_years integer NOT NULL,
    star_id integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL
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
    name character varying(255) NOT NULL,
    description text NOT NULL,
    galaxy_id integer NOT NULL,
    thousands_millions_years integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL
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
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is a barred spiral galaxy where the solar system and the Earth are located.', true, 100000, 13600000, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The Andromeda Galaxy is a spiral galaxy located approximately 2.537 million light-years from Earth.', false, 220000, 10000000, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years from Earth.', false, 50000, 8000000, 1);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'The Cigar Galaxy is an irregular galaxy located approximately 12 million light-years from Earth.', false, 20000, 3000000, 1);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'The Sombrero Galaxy is a spiral galaxy located approximately 28 million light-years from Earth.', false, 50000, 13000000, 1);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'The Whirlpool Galaxy is a spiral galaxy located approximately 23 million light-years from Earth.', false, 70000, 12000000, 1);


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES ('Local Group', 'THIS IS OUR GALAXY CLUSTER', 1);
INSERT INTO public.galaxy_cluster VALUES ('Hercules Cluster', 'A globular cluster located in the Hercules constellation.', 2);
INSERT INTO public.galaxy_cluster VALUES ('Perseus Cluster', 'An open cluster located in the Perseus constellation.', 3);
INSERT INTO public.galaxy_cluster VALUES ('Ursa Major Cluster', 'An open cluster located in the Ursa Major constellation.', 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (36, 'Moon', 'Earth''s natural satellite.', false, true, 3);
INSERT INTO public.moon VALUES (37, 'Phobos', 'Moon of Mars.', false, true, 4);
INSERT INTO public.moon VALUES (38, 'Deimos', 'Moon of Mars.', false, true, 4);
INSERT INTO public.moon VALUES (39, 'Io', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (40, 'Europa', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (41, 'Ganymede', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (42, 'Callisto', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (43, 'Amalthea', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (44, 'Himalia', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (45, 'Elara', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (46, 'Pasiphae', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (47, 'Sinope', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (48, 'Lysithea', 'Moon of Jupiter.', false, true, 5);
INSERT INTO public.moon VALUES (49, 'Mimas', 'Moon of Saturn.', false, true, 6);
INSERT INTO public.moon VALUES (50, 'Enceladus', 'Moon of Saturn.', false, true, 6);
INSERT INTO public.moon VALUES (51, 'Tethys', 'Moon of Saturn.', false, true, 6);
INSERT INTO public.moon VALUES (52, 'Dione', 'Moon of Saturn.', false, true, 6);
INSERT INTO public.moon VALUES (53, 'Rhea', 'Moon of Saturn.', false, true, 6);
INSERT INTO public.moon VALUES (54, 'Miranda', 'Moon of Uranus.', false, true, 7);
INSERT INTO public.moon VALUES (55, 'Ariel', 'Moon of Uranus.', false, true, 7);
INSERT INTO public.moon VALUES (56, 'Umbriel', 'Moon of Uranus.', false, true, 7);
INSERT INTO public.moon VALUES (57, 'Titania', 'Moon of Uranus.', false, true, 7);
INSERT INTO public.moon VALUES (58, 'Oberon', 'Moon of Uranus.', false, true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Innermost planet of the Solar System.', 3.7, false, 4520, 1, true);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet from the Sun.', 8.87, false, 4500, 1, true);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third planet from the Sun, the only known planet to support life.', 9.81, true, 4500, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet from the Sun, known as the Red Planet.', 3.711, false, 4480, 1, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Fifth planet from the Sun, largest planet in the Solar System.', 24.79, false, 4600, 1, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Sixth planet from the Sun, known for its prominent ring system.', 10.44, false, 4600, 1, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Seventh planet from the Sun, known for its unique rotational axis.', 8.69, false, 4600, 1, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Eighth and farthest planet from the Sun in the Solar System.', 11.15, false, 4600, 1, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet located in the Kuiper Belt.', 0.62, false, 4600, 1, true);
INSERT INTO public.planet VALUES (10, 'Proxima b', 'Exoplanet orbiting Proxima Centauri, within the habitable zone.', 11.2, true, 4, 2, true);
INSERT INTO public.planet VALUES (11, 'Proxima c', 'Exoplanet orbiting Proxima Centauri, discovered in 2019.', 1.5, false, 4, 2, true);
INSERT INTO public.planet VALUES (12, 'Proxima d', 'Exoplanet orbiting Proxima Centauri, discovered in 2020.', 0.7, false, 4, 2, true);
INSERT INTO public.planet VALUES (13, 'Proxima e', 'Exoplanet orbiting Proxima Centauri, discovered in 2021.', 1.0, false, 4, 2, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'The Sun is a star, that is, a celestial body that shines with its own light. It is the closest star to the Earth and is the center of our Solar System.', 1, 4603, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'Primary star in the Alpha Centauri system', 1, 4850, true);
INSERT INTO public.star VALUES (3, 'Sirius', 'Binary star system consisting of Sirius A and Sirius B', 1, 200, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant star in the constellation of Orion', 1, 8, true);
INSERT INTO public.star VALUES (5, 'Vega', 'Principal star in the constellation of Lyra', 1, 455, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Closest known star to the solar system', 1, 4850, true);


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 58, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


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
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy galaxy_galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_cluster_id_fkey FOREIGN KEY (galaxy_cluster_id) REFERENCES public.galaxy_cluster(galaxy_cluster_id);


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

