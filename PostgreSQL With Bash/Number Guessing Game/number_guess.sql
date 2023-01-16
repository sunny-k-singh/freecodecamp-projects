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

INSERT INTO public.games VALUES (3, 2, 876, 12);
INSERT INTO public.games VALUES (17, 2, 413, 26);
INSERT INTO public.games VALUES (2, 5, 263, 11);
INSERT INTO public.games VALUES (4, 1, 2, 13);
INSERT INTO public.games VALUES (36, 2, 836, 45);
INSERT INTO public.games VALUES (16, 5, 128, 25);
INSERT INTO public.games VALUES (18, 1, 9, 27);
INSERT INTO public.games VALUES (20, 2, 54, 29);
INSERT INTO public.games VALUES (35, 5, 273, 44);
INSERT INTO public.games VALUES (6, 2, 39, 15);
INSERT INTO public.games VALUES (19, 5, 149, 28);
INSERT INTO public.games VALUES (5, 5, 244, 14);
INSERT INTO public.games VALUES (22, 2, 81, 31);
INSERT INTO public.games VALUES (8, 2, 783, 17);
INSERT INTO public.games VALUES (38, 2, 49, 47);
INSERT INTO public.games VALUES (7, 5, 1, 16);
INSERT INTO public.games VALUES (11, 2, 201, 20);
INSERT INTO public.games VALUES (21, 5, 25, 30);
INSERT INTO public.games VALUES (10, 5, 404, 19);
INSERT INTO public.games VALUES (13, 2, 127, 22);
INSERT INTO public.games VALUES (24, 2, 558, 33);
INSERT INTO public.games VALUES (37, 5, 19, 46);
INSERT INTO public.games VALUES (23, 5, 121, 32);
INSERT INTO public.games VALUES (12, 5, 97, 21);
INSERT INTO public.games VALUES (1, 14, 5, 10);
INSERT INTO public.games VALUES (15, 2, 272, 24);
INSERT INTO public.games VALUES (14, 5, 448, 23);
INSERT INTO public.games VALUES (26, 2, 168, 35);
INSERT INTO public.games VALUES (40, 2, 303, 49);
INSERT INTO public.games VALUES (25, 5, 6, 34);
INSERT INTO public.games VALUES (9, 2, 7, 18);
INSERT INTO public.games VALUES (28, 2, 183, 37);
INSERT INTO public.games VALUES (27, 5, 244, 36);
INSERT INTO public.games VALUES (39, 5, 414, 48);
INSERT INTO public.games VALUES (30, 2, 305, 39);
INSERT INTO public.games VALUES (29, 5, 33, 38);
INSERT INTO public.games VALUES (42, 2, 266, 51);
INSERT INTO public.games VALUES (32, 2, 322, 41);
INSERT INTO public.games VALUES (31, 5, 246, 40);
INSERT INTO public.games VALUES (41, 5, 236, 50);
INSERT INTO public.games VALUES (34, 2, 177, 43);
INSERT INTO public.games VALUES (33, 5, 113, 42);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'sunny123');
INSERT INTO public.users VALUES (2, 'user_1673890447028');
INSERT INTO public.users VALUES (3, 'user_1673890447027');
INSERT INTO public.users VALUES (4, 'user_1673897663149');
INSERT INTO public.users VALUES (5, 'user_1673897663148');
INSERT INTO public.users VALUES (6, 'user_1673897830009');
INSERT INTO public.users VALUES (7, 'user_1673897830008');
INSERT INTO public.users VALUES (8, 'user_1673897946126');
INSERT INTO public.users VALUES (9, 'user_1673897946125');
INSERT INTO public.users VALUES (10, 'sunny315');
INSERT INTO public.users VALUES (11, 'user_1673898940167');
INSERT INTO public.users VALUES (12, 'user_1673898940166');
INSERT INTO public.users VALUES (13, '600');
INSERT INTO public.users VALUES (14, 'user_1673900653893');
INSERT INTO public.users VALUES (15, 'user_1673900653892');
INSERT INTO public.users VALUES (16, 'user_1673900802292');
INSERT INTO public.users VALUES (17, 'user_1673900802291');
INSERT INTO public.users VALUES (18, 'sunny2');
INSERT INTO public.users VALUES (19, 'user_1673901293227');
INSERT INTO public.users VALUES (20, 'user_1673901293226');
INSERT INTO public.users VALUES (21, 'user_1673901379341');
INSERT INTO public.users VALUES (22, 'user_1673901379340');
INSERT INTO public.users VALUES (23, 'user_1673901416532');
INSERT INTO public.users VALUES (24, 'user_1673901416531');
INSERT INTO public.users VALUES (25, 'user_1673901549953');
INSERT INTO public.users VALUES (26, 'user_1673901549952');
INSERT INTO public.users VALUES (27, 'user_1673900883427');
INSERT INTO public.users VALUES (28, 'user_1673902101745');
INSERT INTO public.users VALUES (29, 'user_1673902101744');
INSERT INTO public.users VALUES (30, 'user_1673902185829');
INSERT INTO public.users VALUES (31, 'user_1673902185828');
INSERT INTO public.users VALUES (32, 'user_1673902197750');
INSERT INTO public.users VALUES (33, 'user_1673902197749');
INSERT INTO public.users VALUES (34, 'user_1673902571452');
INSERT INTO public.users VALUES (35, 'user_1673902571451');
INSERT INTO public.users VALUES (36, 'user_1673902797765');
INSERT INTO public.users VALUES (37, 'user_1673902797764');
INSERT INTO public.users VALUES (38, 'user_1673902939144');
INSERT INTO public.users VALUES (39, 'user_1673902939143');
INSERT INTO public.users VALUES (40, 'user_1673902974066');
INSERT INTO public.users VALUES (41, 'user_1673902974065');
INSERT INTO public.users VALUES (42, 'user_1673903000577');
INSERT INTO public.users VALUES (43, 'user_1673903000576');
INSERT INTO public.users VALUES (44, 'user_1673903134109');
INSERT INTO public.users VALUES (45, 'user_1673903134108');
INSERT INTO public.users VALUES (46, 'user_1673903263971');
INSERT INTO public.users VALUES (47, 'user_1673903263970');
INSERT INTO public.users VALUES (48, 'user_1673903419771');
INSERT INTO public.users VALUES (49, 'user_1673903419770');
INSERT INTO public.users VALUES (50, 'user_1673904120075');
INSERT INTO public.users VALUES (51, 'user_1673904120074');


--
-- Name: games_player_info_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_player_info_seq', 42, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 51, true);


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

