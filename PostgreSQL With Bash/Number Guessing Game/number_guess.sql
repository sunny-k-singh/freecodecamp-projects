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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    player_info integer NOT NULL,
    games_played integer,
    best_game integer,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_player_info_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_player_info_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_player_info_seq OWNER TO freecodecamp;

--
-- Name: games_player_info_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_player_info_seq OWNED BY public.games.player_info;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games player_info; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN player_info SET DEFAULT nextval('public.games_player_info_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (90, 2, 380, 99);
INSERT INTO public.games VALUES (89, 5, 294, 98);
INSERT INTO public.games VALUES (107, 4, 7, 116);
INSERT INTO public.games VALUES (92, 2, 368, 101);
INSERT INTO public.games VALUES (109, 2, 644, 118);
INSERT INTO public.games VALUES (91, 5, 40, 100);
INSERT INTO public.games VALUES (94, 2, 371, 103);
INSERT INTO public.games VALUES (108, 5, 159, 117);
INSERT INTO public.games VALUES (93, 5, 31, 102);
INSERT INTO public.games VALUES (96, 2, 468, 105);
INSERT INTO public.games VALUES (111, 2, 294, 120);
INSERT INTO public.games VALUES (95, 5, 703, 104);
INSERT INTO public.games VALUES (98, 2, 565, 107);
INSERT INTO public.games VALUES (110, 5, 149, 119);
INSERT INTO public.games VALUES (97, 5, 271, 106);
INSERT INTO public.games VALUES (100, 2, 71, 109);
INSERT INTO public.games VALUES (99, 5, 85, 108);
INSERT INTO public.games VALUES (102, 2, 191, 111);
INSERT INTO public.games VALUES (101, 5, 253, 110);
INSERT INTO public.games VALUES (104, 2, 173, 113);
INSERT INTO public.games VALUES (103, 5, 60, 112);
INSERT INTO public.games VALUES (106, 2, 756, 115);
INSERT INTO public.games VALUES (105, 5, 528, 114);
INSERT INTO public.games VALUES (88, 2, 44, 97);
INSERT INTO public.games VALUES (87, 5, 391, 96);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (98, 'user_1673940054097');
INSERT INTO public.users VALUES (99, 'user_1673940054096');
INSERT INTO public.users VALUES (100, 'user_1673940057060');
INSERT INTO public.users VALUES (101, 'user_1673940057059');
INSERT INTO public.users VALUES (102, 'user_1673940059819');
INSERT INTO public.users VALUES (103, 'user_1673940059818');
INSERT INTO public.users VALUES (104, 'user_1673940062684');
INSERT INTO public.users VALUES (105, 'user_1673940062683');
INSERT INTO public.users VALUES (106, 'user_1673940065698');
INSERT INTO public.users VALUES (107, 'user_1673940065697');
INSERT INTO public.users VALUES (108, 'user_1673940068648');
INSERT INTO public.users VALUES (109, 'user_1673940068647');
INSERT INTO public.users VALUES (110, 'user_1673940071601');
INSERT INTO public.users VALUES (111, 'user_1673940071600');
INSERT INTO public.users VALUES (112, 'user_1673940075070');
INSERT INTO public.users VALUES (113, 'user_1673940075069');
INSERT INTO public.users VALUES (114, 'user_1673940078194');
INSERT INTO public.users VALUES (115, 'user_1673940078193');
INSERT INTO public.users VALUES (116, 'sunny3155');
INSERT INTO public.users VALUES (117, 'user_1673940717489');
INSERT INTO public.users VALUES (118, 'user_1673940717488');
INSERT INTO public.users VALUES (119, 'user_1673940757098');
INSERT INTO public.users VALUES (120, 'user_1673940757097');
INSERT INTO public.users VALUES (96, 'user_1673939743221');
INSERT INTO public.users VALUES (97, 'user_1673939743220');


--
-- Name: games_player_info_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_player_info_seq', 111, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 120, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (player_info);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

