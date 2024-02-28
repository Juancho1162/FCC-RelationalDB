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
    name character varying(20) NOT NULL,
    description text,
    galaxy_type integer,
    galaxy_age_in_millions numeric(10,2),
    id integer
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
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    life_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20),
    id integer
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_id_seq OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_id_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    is_spherical boolean,
    id integer
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean,
    id integer
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
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    star_type integer,
    id integer
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
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'A spiral galaxy', 1, 1000.00, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The galaxy containing our Solar System', 1, 1360.00, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group', 1, 3000.00, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A classic spiral galaxy', 1, 500.00, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Known for its bright nucleus', 2, 890.00, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy', 1, 2100.00, NULL);


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (1, 1, 'Human', NULL);
INSERT INTO public.life VALUES (2, 3, 'Microbial life', NULL);
INSERT INTO public.life VALUES (3, 7, 'Sentient Trees', NULL);
INSERT INTO public.life VALUES (4, 8, 'Water Beings', NULL);
INSERT INTO public.life VALUES (5, 9, 'Silicon-based life', NULL);
INSERT INTO public.life VALUES (6, 11, 'Amphibious species', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 'The Moon of Earth, affecting its tides.', true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'One of Mars two moons, with a fear-inducing name.', false, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'The smaller Martian moon, named after dread.', false, NULL);
INSERT INTO public.moon VALUES (4, 'Nix', 3, 'A small moon of Pluto, named after the goddess of night.', false, NULL);
INSERT INTO public.moon VALUES (5, 'Hydra', 3, 'Another moon of Pluto, named after the water serpent.', false, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 4, 'The most volcanic body in the solar system, orbiting Jupiter.', true, NULL);
INSERT INTO public.moon VALUES (7, 'Europa', 4, 'An icy moon of Jupiter, with a subsurface ocean.', true, NULL);
INSERT INTO public.moon VALUES (8, 'Ganymede', 4, 'The largest moon in the solar system, orbiting Jupiter.', true, NULL);
INSERT INTO public.moon VALUES (9, 'Callisto', 4, 'A heavily cratered moon of Jupiter.', true, NULL);
INSERT INTO public.moon VALUES (10, 'Titan', 5, 'The largest moon of Saturn, with thick atmosphere.', true, NULL);
INSERT INTO public.moon VALUES (11, 'Enceladus', 5, 'A moon of Saturn with geysers of water.', true, NULL);
INSERT INTO public.moon VALUES (12, 'Mimas', 5, 'A moon of Saturn known for its large crater.', false, NULL);
INSERT INTO public.moon VALUES (13, 'Tethys', 5, 'A moon of Saturn with a high reflectivity.', true, NULL);
INSERT INTO public.moon VALUES (14, 'Dione', 6, 'A moon of Saturn, discovered by Cassini.', true, NULL);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 'The second largest moon of Saturn.', true, NULL);
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, 'A moon of Saturn with a unique color dichotomy.', false, NULL);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 'The second largest moon of Uranus.', true, NULL);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 'The largest moon of Uranus.', true, NULL);
INSERT INTO public.moon VALUES (19, 'Ariel', 8, 'A moon of Uranus, named after a Shakespearean spirit.', true, NULL);
INSERT INTO public.moon VALUES (20, 'Umbriel', 8, 'A dark moon of Uranus.', true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 2, 'The only planet known to support life.', true, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 2, 'The red planet, explored by rovers.', false, NULL);
INSERT INTO public.planet VALUES (3, 'Vulcan', 3, 'A fictional planet in the habitable zone.', false, NULL);
INSERT INTO public.planet VALUES (4, 'Pandora', 4, 'A lush habitable moon of a gas giant.', true, NULL);
INSERT INTO public.planet VALUES (5, 'Tatooine', 5, 'A desert planet with two suns.', false, NULL);
INSERT INTO public.planet VALUES (6, 'Hoth', 6, 'An icy planet with a strong Rebel Alliance presence.', false, NULL);
INSERT INTO public.planet VALUES (7, 'Coruscant', 7, 'The capital planet, covered in a cityscape.', true, NULL);
INSERT INTO public.planet VALUES (8, 'Naboo', 8, 'Home to Gungans and humans, with vast landscapes.', true, NULL);
INSERT INTO public.planet VALUES (9, 'Mustafar', 9, 'A volcanic planet, known for its lava rivers.', false, NULL);
INSERT INTO public.planet VALUES (10, 'Kamino', 10, 'An ocean planet where cloning technology is developed.', false, NULL);
INSERT INTO public.planet VALUES (11, 'Dagobah', 11, 'A swampy planet, strong with the Force.', false, NULL);
INSERT INTO public.planet VALUES (12, 'Alderaan', 12, 'A peaceful planet destroyed by the Death Star.', false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 2, 'Our own sun', 1, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'The closest star to the Sun', 1, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 2, 'The brightest star in the Earth night sky', 1, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 'A red supergiant star in the Milky Way', 2, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 'A blue supergiant star in the Milky Way', 2, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'The fifth-brightest star in the night sky', 1, NULL);
INSERT INTO public.star VALUES (7, 'Arcturus', 1, 'The fourth-brightest star in the night sky', 2, NULL);
INSERT INTO public.star VALUES (8, 'Capella', 3, 'The third-brightest star in the northern hemisphere', 1, NULL);
INSERT INTO public.star VALUES (9, 'Aldebaran', 3, 'An orange giant star', 2, NULL);
INSERT INTO public.star VALUES (10, 'Spica', 4, 'The brightest star in the constellation of Virgo', 1, NULL);
INSERT INTO public.star VALUES (11, 'Polaris', 4, 'The North Star', 1, NULL);
INSERT INTO public.star VALUES (12, 'Antares', 5, 'A red supergiant star', 2, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: life_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: life life_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_id_key UNIQUE (id);


--
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: life life_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

