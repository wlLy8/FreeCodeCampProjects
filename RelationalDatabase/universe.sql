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
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_types integer,
    distance_from_earth numeric
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
    planet_id integer,
    name character varying(20) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_types integer,
    distance_from_earth numeric
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
-- Name: place; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.place (
    place_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_id integer,
    description text
);


ALTER TABLE public.place OWNER TO freecodecamp;

--
-- Name: place_place_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.place_place_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.place_place_id_seq OWNER TO freecodecamp;

--
-- Name: place_place_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.place_place_id_seq OWNED BY public.place.place_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_types integer,
    distance_from_earth numeric
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_types integer,
    distance_from_earth numeric
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
-- Name: place place_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.place ALTER COLUMN place_id SET DEFAULT nextval('public.place_place_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', false, true, 13600, 1, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, true, 10000, 1, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, true, 10000, 1, 3200000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', false, true, 1101, 1, 163000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', false, true, 6500, 1, 200000);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', false, true, 12000, 1, 13700000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 1, 'Moon', true, true, 5, 1, 384400);
INSERT INTO public.moon VALUES (42, 2, 'Europa', false, true, 5, 1, 628300000);
INSERT INTO public.moon VALUES (43, 3, 'Titan', false, true, 5, 1, 1275000);
INSERT INTO public.moon VALUES (44, 3, 'Ganymede', false, true, 5, 1, 1070400);
INSERT INTO public.moon VALUES (45, 3, 'Callisto', false, true, 5, 1, 1882700);
INSERT INTO public.moon VALUES (46, 3, 'Io', false, true, 5, 1, 421700);
INSERT INTO public.moon VALUES (47, 4, 'Enceladus', false, true, 5, 1, 2379480);
INSERT INTO public.moon VALUES (48, 4, 'Triton', false, true, 5, 1, 3548000);
INSERT INTO public.moon VALUES (49, 4, 'Rhea', false, true, 5, 1, 527400);
INSERT INTO public.moon VALUES (50, 5, 'Dione', false, true, 5, 1, 561700);
INSERT INTO public.moon VALUES (51, 5, 'Iapetus', false, true, 5, 1, 3563000);
INSERT INTO public.moon VALUES (52, 6, 'Miranda', false, true, 5, 1, 1290000);
INSERT INTO public.moon VALUES (53, 7, 'Ariel', false, true, 5, 1, 1158000);
INSERT INTO public.moon VALUES (54, 8, 'Umbriel', false, true, 5, 1, 2660000);
INSERT INTO public.moon VALUES (55, 9, 'Titania', false, true, 5, 1, 4360000);
INSERT INTO public.moon VALUES (56, 10, 'Oberon', false, true, 5, 1, 5835000);
INSERT INTO public.moon VALUES (57, 11, 'Phoebe', false, true, 5, 1, 1290000);
INSERT INTO public.moon VALUES (58, 12, 'Hyperion', false, true, 5, 1, 1360000);
INSERT INTO public.moon VALUES (59, 1, 'Mimas', false, true, 5, 1, 1856000);
INSERT INTO public.moon VALUES (60, 2, 'Enceladus', false, true, 5, 1, 2379480);


--
-- Data for Name: place; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.place VALUES (10, 'Apollo 11 Landing Site', 1, 41, NULL);
INSERT INTO public.place VALUES (11, 'Olympus Mons', 2, NULL, NULL);
INSERT INTO public.place VALUES (12, 'Great Red Spot', 3, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', true, true, 4500, 1, 0);
INSERT INTO public.planet VALUES (2, 1, 'Mars', false, true, 4500, 1, 225);
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', false, true, 4500, 1, 778.5);
INSERT INTO public.planet VALUES (4, 1, 'Saturn', false, true, 4500, 1, 1434);
INSERT INTO public.planet VALUES (5, 1, 'Venus', false, true, 4500, 1, 108.2);
INSERT INTO public.planet VALUES (6, 1, 'Mercury', false, true, 4500, 1, 77.3);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', false, true, 4500, 1, 2871);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', false, true, 4500, 1, 4495);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', false, true, 4500, 1, 5906);
INSERT INTO public.planet VALUES (10, 2, 'Proxima b', false, true, 4850, 1, 4.2);
INSERT INTO public.planet VALUES (11, 3, 'Alpha Centauri Bb', false, true, 4600, 1, 4.37);
INSERT INTO public.planet VALUES (12, 4, 'Barnard''s Star b', false, true, 10000, 1, 5.958);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', false, true, 4600, 1, 0);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', false, true, 4850, 1, 4.246);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri', false, true, 4600, 1, 4.37);
INSERT INTO public.star VALUES (4, 1, 'Barnard''s Star', false, true, 10000, 1, 5.958);
INSERT INTO public.star VALUES (5, 1, 'Sirius', false, true, 242, 1, 8.611);
INSERT INTO public.star VALUES (6, 1, 'Betelgeuse', false, true, 10000, 1, 642.5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: place_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.place_place_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: place place_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_pkey PRIMARY KEY (place_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: moon unique_moon_per_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_per_planet UNIQUE (name, planet_id);


--
-- Name: place unique_place; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT unique_place UNIQUE (name);


--
-- Name: planet unique_planet_per_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_per_star UNIQUE (name, star_id);


--
-- Name: star unique_star_per_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_per_galaxy UNIQUE (name, galaxy_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: place fk_moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT fk_moon_id FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: place fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

