--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sections (
    id integer NOT NULL,
    token character varying(100) NOT NULL,
    user_id integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- Name: short_visits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.short_visits (
    id integer NOT NULL,
    short_id integer,
    user_id integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: short_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.short_visits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: short_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.short_visits_id_seq OWNED BY public.short_visits.id;


--
-- Name: shorts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shorts (
    id integer NOT NULL,
    original_url text NOT NULL,
    short_url character varying(100) NOT NULL,
    user_id integer,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: shorts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shorts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shorts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shorts_id_seq OWNED BY public.shorts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- Name: short_visits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short_visits ALTER COLUMN id SET DEFAULT nextval('public.short_visits_id_seq'::regclass);


--
-- Name: shorts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorts ALTER COLUMN id SET DEFAULT nextval('public.shorts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sections VALUES (1, 'QBoXHB6OqOWxgTo0dKiDI', 9, '2022-10-16 21:08:05.873875');
INSERT INTO public.sections VALUES (2, 'ikk1hw0vC-FR5I1LtPbZD', 11, '2022-10-16 21:10:47.821891');
INSERT INTO public.sections VALUES (3, 'zQXtKL3e-mv9Smz4JfdTi', 10, '2022-10-16 21:11:47.964251');
INSERT INTO public.sections VALUES (4, '4AF_2FGREbFzNjZBZWZ7w', 8, '2022-10-16 21:13:42.5591');
INSERT INTO public.sections VALUES (5, 'TCiKPZUTQlltEZmPjnBfx', 12, '2022-10-16 21:14:37.989836');


--
-- Data for Name: short_visits; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.short_visits VALUES (1, 1, NULL, '2022-10-16 21:08:44.825708');
INSERT INTO public.short_visits VALUES (2, 1, NULL, '2022-10-16 21:08:56.513149');
INSERT INTO public.short_visits VALUES (3, 1, NULL, '2022-10-16 21:09:39.66571');
INSERT INTO public.short_visits VALUES (4, 1, NULL, '2022-10-16 21:09:41.078481');
INSERT INTO public.short_visits VALUES (5, 1, NULL, '2022-10-16 21:09:45.153531');
INSERT INTO public.short_visits VALUES (6, 1, NULL, '2022-10-16 21:09:45.993644');
INSERT INTO public.short_visits VALUES (7, 1, NULL, '2022-10-16 21:09:46.775138');
INSERT INTO public.short_visits VALUES (8, 1, NULL, '2022-10-16 21:09:47.44765');
INSERT INTO public.short_visits VALUES (9, 1, NULL, '2022-10-16 21:09:48.091261');
INSERT INTO public.short_visits VALUES (10, 1, NULL, '2022-10-16 21:09:49.021255');
INSERT INTO public.short_visits VALUES (11, 1, NULL, '2022-10-16 21:09:49.949999');
INSERT INTO public.short_visits VALUES (12, 1, NULL, '2022-10-16 21:09:50.780288');
INSERT INTO public.short_visits VALUES (13, 1, NULL, '2022-10-16 21:09:51.631158');
INSERT INTO public.short_visits VALUES (14, 2, NULL, '2022-10-16 21:10:15.486211');
INSERT INTO public.short_visits VALUES (15, 2, NULL, '2022-10-16 21:10:18.241005');
INSERT INTO public.short_visits VALUES (16, 2, NULL, '2022-10-16 21:10:21.41221');
INSERT INTO public.short_visits VALUES (17, 3, NULL, '2022-10-16 21:11:17.409222');
INSERT INTO public.short_visits VALUES (18, 3, NULL, '2022-10-16 21:11:21.445766');
INSERT INTO public.short_visits VALUES (19, 3, NULL, '2022-10-16 21:11:24.08558');
INSERT INTO public.short_visits VALUES (20, 3, NULL, '2022-10-16 21:11:28.068915');
INSERT INTO public.short_visits VALUES (21, 3, NULL, '2022-10-16 21:11:31.027691');
INSERT INTO public.short_visits VALUES (22, 4, NULL, '2022-10-16 21:13:19.433382');
INSERT INTO public.short_visits VALUES (23, 4, NULL, '2022-10-16 21:13:21.487864');
INSERT INTO public.short_visits VALUES (24, 4, NULL, '2022-10-16 21:13:23.77566');
INSERT INTO public.short_visits VALUES (25, 5, NULL, '2022-10-16 21:14:18.726411');
INSERT INTO public.short_visits VALUES (26, 5, NULL, '2022-10-16 21:14:20.234285');
INSERT INTO public.short_visits VALUES (27, 5, NULL, '2022-10-16 21:14:21.110179');
INSERT INTO public.short_visits VALUES (28, 5, NULL, '2022-10-16 21:14:23.235005');


--
-- Data for Name: shorts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shorts VALUES (1, 'https://chaves.com', 'ttMN5Y_5', 9, '2022-10-16 21:08:25.266553');
INSERT INTO public.shorts VALUES (2, 'https://www.chaves.com', 'CwwJKu71', 9, '2022-10-16 21:10:07.189794');
INSERT INTO public.shorts VALUES (3, 'https://www.kiko.com', 'bC85LlC0', 11, '2022-10-16 21:11:10.270411');
INSERT INTO public.shorts VALUES (4, 'https://www.chiquinha.com', 'zOHgpuSD', 10, '2022-10-16 21:13:11.412249');
INSERT INTO public.shorts VALUES (5, 'https://www.madruguinha.com', 'W5uxaPaA', 8, '2022-10-16 21:14:11.081713');
INSERT INTO public.shorts VALUES (6, 'https://www.madruguinha.com', 'RRbfGSR2', 12, '2022-10-16 21:14:52.27411');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Cibas1', 'ci1@mail.com', '$2b$10$7vLxw.zOwRhYVPlUkkRzU.b8ELzeqmPUMrOCQ0tGmpfU7M25wKzri', '2022-10-16 21:04:19.184574');
INSERT INTO public.users VALUES (2, 'Cibas2', 'ci2@mail.com', '$2b$10$pvUJ1DgrulhDFb57MQfU2OHfJLdSztmeCJuONqpHBWhxZnegTURAG', '2022-10-16 21:04:29.573357');
INSERT INTO public.users VALUES (3, 'Cibas3', 'ci3@mail.com', '$2b$10$0ed2rVD4FA.7fWTT.DtNk.SfBe0s443A8Qi1w8qcprqXW4RNSE/ju', '2022-10-16 21:04:40.718697');
INSERT INTO public.users VALUES (4, 'Narutin', 'narutin@mail.com', '$2b$10$sjKDvBvGLFBTPvXCboG08urUEpSHN8n5zqo2LZsVGQGeVpGDG26Oa', '2022-10-16 21:05:09.48098');
INSERT INTO public.users VALUES (5, 'Narutin1', 'narutin1@mail.com', '$2b$10$t/BKrBsLNB89PW4wGtVVS.3PyhC.acLObEafXHHdtz6E2ER2PXoki', '2022-10-16 21:05:18.024795');
INSERT INTO public.users VALUES (6, 'Narutin2', 'narutin2@mail.com', '$2b$10$y.oyqq7nac9XpZCbnGNGouFxYptJAAgVBEI5ZJT6.a.amSCC8HwDq', '2022-10-16 21:05:25.406733');
INSERT INTO public.users VALUES (7, 'Narutin3', 'narutin3@mail.com', '$2b$10$iO8zGyvFTacwbqihD9ahbOFTYfEUmjdu.oUrNim7ZA//hvRqaGNaK', '2022-10-16 21:05:33.976718');
INSERT INTO public.users VALUES (8, 'Seu Madruga', 'seumadruga@mail.com', '$2b$10$RLqC9O2ga/yQTXxzT/pNYe.xpe3FaCG6UhIsRrKXMc4HTYchSYqOm', '2022-10-16 21:06:00.403084');
INSERT INTO public.users VALUES (9, 'Chaves', 'chaves@mail.com', '$2b$10$MWdraL6W4/7PTGPkp4ypRe03lZXgOfh89XaVZycyhCnIg3K/pDg2m', '2022-10-16 21:06:19.56886');
INSERT INTO public.users VALUES (10, 'Xiquinha', 'chiquinha@mail.com', '$2b$10$9xO/katjcqHE128aK9NqFuJgq.cCJcOn5oNZ7LY3FxHrtyRMEanYu', '2022-10-16 21:06:34.566465');
INSERT INTO public.users VALUES (11, 'Kiko', 'kiko@mail.com', '$2b$10$XWYmy8E5E9UNXTY3kV5z2OShDRB3spR62NXxnppdRynr9PcuUVtmm', '2022-10-16 21:07:16.708395');
INSERT INTO public.users VALUES (12, 'Seu Barriga', 'barrigao@mail.com', '$2b$10$BNEsLopFnN6xOI/jvmJC2eM/NtFRgGNWHXNN6TAnwH7ywuu0xgwK.', '2022-10-16 21:07:48.413732');


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sections_id_seq', 5, true);


--
-- Name: short_visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.short_visits_id_seq', 28, true);


--
-- Name: shorts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shorts_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: short_visits short_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short_visits
    ADD CONSTRAINT short_visits_pkey PRIMARY KEY (id);


--
-- Name: shorts shorts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorts
    ADD CONSTRAINT shorts_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sections sections_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: short_visits short_visits_short_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short_visits
    ADD CONSTRAINT short_visits_short_id_fkey FOREIGN KEY (short_id) REFERENCES public.shorts(id);


--
-- Name: short_visits short_visits_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short_visits
    ADD CONSTRAINT short_visits_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: shorts shorts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorts
    ADD CONSTRAINT shorts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

