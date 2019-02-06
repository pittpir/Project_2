--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: abilities; Type: TABLE; Schema: public; Owner: Mega
--

CREATE TABLE public.abilities (
    ability_id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    tier_max integer NOT NULL,
    is_zeta boolean NOT NULL,
    is_omega boolean NOT NULL,
    combat_type integer NOT NULL,
    type integer,
    is_basic boolean NOT NULL,
    is_special boolean NOT NULL,
    is_reinforcement boolean NOT NULL,
    is_contract boolean NOT NULL,
    is_unique boolean NOT NULL,
    is_leader boolean NOT NULL,
    char_table_id integer,
    ship_table_id integer
);


ALTER TABLE public.abilities OWNER TO "Mega";

--
-- Name: abilities_ability_id_seq; Type: SEQUENCE; Schema: public; Owner: Mega
--

CREATE SEQUENCE public.abilities_ability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.abilities_ability_id_seq OWNER TO "Mega";

--
-- Name: abilities_ability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mega
--

ALTER SEQUENCE public.abilities_ability_id_seq OWNED BY public.abilities.ability_id;


--
-- Name: characters; Type: TABLE; Schema: public; Owner: Mega
--

CREATE TABLE public.characters (
    char_id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    power integer NOT NULL,
    alignment character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    ship character varying(255),
    ship_id integer,
    tags text[],
    abilities text[],
    base_id character varying(255) NOT NULL
);


ALTER TABLE public.characters OWNER TO "Mega";

--
-- Name: characters_char_id_seq; Type: SEQUENCE; Schema: public; Owner: Mega
--

CREATE SEQUENCE public.characters_char_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_char_id_seq OWNER TO "Mega";

--
-- Name: characters_char_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mega
--

ALTER SEQUENCE public.characters_char_id_seq OWNED BY public.characters.char_id;


--
-- Name: ships; Type: TABLE; Schema: public; Owner: Mega
--

CREATE TABLE public.ships (
    ship_id integer NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    power integer NOT NULL,
    alignment character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    capital_ship boolean NOT NULL,
    base_id character varying(255),
    tags text[],
    abilities text[]
);


ALTER TABLE public.ships OWNER TO "Mega";

--
-- Name: ships_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: Mega
--

CREATE SEQUENCE public.ships_ship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ships_ship_id_seq OWNER TO "Mega";

--
-- Name: ships_ship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mega
--

ALTER SEQUENCE public.ships_ship_id_seq OWNED BY public.ships.ship_id;


--
-- Name: abilities ability_id; Type: DEFAULT; Schema: public; Owner: Mega
--

ALTER TABLE ONLY public.abilities ALTER COLUMN ability_id SET DEFAULT nextval('public.abilities_ability_id_seq'::regclass);


--
-- Name: characters char_id; Type: DEFAULT; Schema: public; Owner: Mega
--

ALTER TABLE ONLY public.characters ALTER COLUMN char_id SET DEFAULT nextval('public.characters_char_id_seq'::regclass);


--
-- Name: ships ship_id; Type: DEFAULT; Schema: public; Owner: Mega
--

ALTER TABLE ONLY public.ships ALTER COLUMN ship_id SET DEFAULT nextval('public.ships_ship_id_seq'::regclass);


--
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: Mega
--

COPY public.abilities (ability_id, name, url, image, tier_max, is_zeta, is_omega, combat_type, type, is_basic, is_special, is_reinforcement, is_contract, is_unique, is_leader, char_table_id, ship_table_id) FROM stdin;
1	Furious Assault	//swgoh.gg/characters/general-grievous/#furious-assault	//swgoh.gg/static/img/assets/tex.ability_grievous_basic.png	8	f	t	1	1	t	f	f	f	f	f	43	\N
2	Grievous Wounds	//swgoh.gg/characters/general-grievous/#grievous-wounds	//swgoh.gg/static/img/assets/tex.ability_grievous_special02.png	8	f	t	1	2	f	t	f	f	f	f	43	\N
3	Sinister Laugh	//swgoh.gg/characters/general-grievous/#sinister-laugh	//swgoh.gg/static/img/assets/tex.ability_grievous_special01.png	8	f	t	1	2	f	t	f	f	f	f	43	\N
4	Tactical Retreat	//swgoh.gg/characters/general-grievous/#tactical-retreat	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	7	f	f	1	4	f	f	f	f	t	f	43	\N
5	Daunting Presence	//swgoh.gg/characters/general-grievous/#daunting-presence	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	7	f	f	1	3	f	f	f	f	f	t	43	\N
6	Dirty Fighting	//swgoh.gg/characters/mob-enforcer/#dirty-fighting	//swgoh.gg/static/img/assets/tex.ability_mobenforcer_basic.png	8	f	t	1	1	t	f	f	f	f	f	72	\N
7	Thermal Detonator	//swgoh.gg/characters/mob-enforcer/#thermal-detonator	//swgoh.gg/static/img/assets/tex.ability_mobenforcer_special01.png	8	f	t	1	2	f	t	f	f	f	f	72	\N
8	Underworld Moxie	//swgoh.gg/characters/mob-enforcer/#underworld-moxie	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	8	f	t	1	4	f	f	f	f	t	f	72	\N
9	Gambler's Shot	//swgoh.gg/characters/lando-calrissian/#gamblers-shot	//swgoh.gg/static/img/assets/tex.ability_landobespin_basic.png	8	f	t	1	1	t	f	f	f	f	f	65	\N
10	Double Down	//swgoh.gg/characters/lando-calrissian/#double-down	//swgoh.gg/static/img/assets/tex.ability_landobespin_special01.png	8	f	t	1	2	f	t	f	f	f	f	65	\N
11	High Roller	//swgoh.gg/characters/lando-calrissian/#high-roller	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	7	f	f	1	4	f	f	f	f	t	f	65	\N
12	Fast and Loose	//swgoh.gg/characters/lando-calrissian/#fast-and-loose	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	7	f	f	1	3	f	f	f	f	f	t	65	\N
13	Quelling Blow	//swgoh.gg/characters/plo-koon/#quelling-blow	//swgoh.gg/static/img/assets/tex.ability_plokoon_basic.png	8	f	t	1	1	t	f	f	f	f	f	156	\N
14	Force Judgment	//swgoh.gg/characters/plo-koon/#force-judgment	//swgoh.gg/static/img/assets/tex.ability_plokoon_special01.png	8	f	t	1	2	f	t	f	f	f	f	156	\N
15	Take Charge	//swgoh.gg/characters/plo-koon/#take-charge	//swgoh.gg/static/img/assets/tex.ability_plokoon_special02.png	8	f	t	1	2	f	t	f	f	f	f	156	\N
16	Overwatch	//swgoh.gg/characters/plo-koon/#overwatch	//swgoh.gg/static/img/assets/tex.abilityui_passive_stealth.png	7	f	f	1	3	f	f	f	f	f	t	156	\N
17	Impeding Shot	//swgoh.gg/characters/ct-7567-rex/#impeding-shot	//swgoh.gg/static/img/assets/tex.ability_rex_basic.png	8	f	t	1	1	t	f	f	f	f	f	128	\N
18	Electrostaff Assault	//swgoh.gg/characters/ig-100-magnaguard/#electrostaff-assault	//swgoh.gg/static/img/assets/tex.ability_magnaguard_basic.png	8	f	t	1	1	t	f	f	f	f	f	52	\N
19	Disruption	//swgoh.gg/characters/ig-100-magnaguard/#disruption	//swgoh.gg/static/img/assets/tex.ability_magnaguard_special01.png	8	f	t	1	2	f	t	f	f	f	f	52	\N
20	Relentless Assault	//swgoh.gg/characters/ig-100-magnaguard/#relentless-assault	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	52	\N
21	Force Pike	//swgoh.gg/characters/royal-guard/#force-pike	//swgoh.gg/static/img/assets/tex.ability_royalguard_basic.png	8	f	t	1	1	t	f	f	f	f	f	93	\N
22	Imperial Phalanx	//swgoh.gg/characters/royal-guard/#imperial-phalanx	//swgoh.gg/static/img/assets/tex.ability_royalguard_special01.png	8	f	t	1	2	f	t	f	f	f	f	93	\N
23	Unyielding Defender	//swgoh.gg/characters/royal-guard/#unyielding-defender	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	8	f	t	1	4	f	f	f	f	t	f	93	\N
24	Guiding Strike	//swgoh.gg/characters/ewok-elder/#guiding-strike	//swgoh.gg/static/img/assets/tex.ability_ewok_elder_basic.png	8	f	t	1	1	t	f	f	f	f	f	38	\N
25	Tribal Healer	//swgoh.gg/characters/ewok-elder/#tribal-healer	//swgoh.gg/static/img/assets/tex.ability_ewok_elder_special01.png	8	f	t	1	2	f	t	f	f	f	f	38	\N
26	Power of the Forest	//swgoh.gg/characters/ewok-elder/#power-of-the-forest	//swgoh.gg/static/img/assets/tex.ability_ewok_elder_special02.png	8	f	t	1	2	f	t	f	f	f	f	38	\N
27	Cruel Strike	//swgoh.gg/characters/asajj-ventress/#cruel-strike	//swgoh.gg/static/img/assets/tex.ability_ventress_basic.png	8	f	t	1	1	t	f	f	f	f	f	4	\N
28	Strike Fear	//swgoh.gg/characters/asajj-ventress/#strike-fear	//swgoh.gg/static/img/assets/tex.ability_ventress_special01.png	8	f	t	1	2	f	t	f	f	f	f	4	\N
29	Endless Wrath	//swgoh.gg/characters/asajj-ventress/#endless-wrath	//swgoh.gg/static/img/assets/tex.ability_ventress_special02.png	8	f	t	1	2	f	t	f	f	f	f	4	\N
30	Rampage	//swgoh.gg/characters/asajj-ventress/#rampage	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	4	f	f	f	f	t	f	4	\N
31	Nightsister Swiftness	//swgoh.gg/characters/asajj-ventress/#nightsister-swiftness	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	t	f	1	3	f	f	f	f	f	t	4	\N
32	Frontier Marksmanship	//swgoh.gg/characters/luke-skywalker-farmboy/#frontier-marksmanship	//swgoh.gg/static/img/assets/tex.ability_lukeep4_basic.png	8	f	t	1	1	t	f	f	f	f	f	68	\N
33	Bullseye	//swgoh.gg/characters/luke-skywalker-farmboy/#bullseye	//swgoh.gg/static/img/assets/tex.ability_lukeep4_special01.png	8	f	t	1	2	f	t	f	f	f	f	68	\N
34	Draw a Bead	//swgoh.gg/characters/luke-skywalker-farmboy/#draw-a-bead	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	4	f	f	f	f	t	f	68	\N
35	A New Hope	//swgoh.gg/characters/luke-skywalker-farmboy/#a-new-hope	//swgoh.gg/static/img/assets/tex.abilityui_passive_removeharmful.png	8	t	f	1	3	f	f	f	f	f	t	68	\N
36	Insightful Blow	//swgoh.gg/characters/old-daka/#insightful-blow	//swgoh.gg/static/img/assets/tex.ability_daka_basic.png	8	f	t	1	1	t	f	f	f	f	f	80	\N
37	Chant of Resurrection	//swgoh.gg/characters/old-daka/#chant-of-resurrection	//swgoh.gg/static/img/assets/tex.ability_daka_special01.png	8	f	t	1	2	f	t	f	f	f	f	80	\N
38	Serve Again	//swgoh.gg/characters/old-daka/#serve-again	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	8	t	f	1	4	f	f	f	f	t	f	80	\N
39	Nightsister Elder	//swgoh.gg/characters/old-daka/#nightsister-elder	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	3	f	f	f	f	f	t	80	\N
40	Alpha Strike	//swgoh.gg/characters/cc-2224-cody/#alpha-strike	//swgoh.gg/static/img/assets/tex.ability_commandercody_basic.png	8	f	t	1	1	t	f	f	f	f	f	17	\N
41	AT-TE Mass-Driver Cannon	//swgoh.gg/characters/cc-2224-cody/#at-te-mass-driver-cannon	//swgoh.gg/static/img/assets/tex.ability_commandercody_special01.png	8	f	t	1	2	f	t	f	f	f	f	17	\N
42	The 212th Attack	//swgoh.gg/characters/cc-2224-cody/#the-212th-attack	//swgoh.gg/static/img/assets/tex.ability_commandercody_special02.png	8	f	t	1	2	f	t	f	f	f	f	17	\N
43	Ghost Company Commander	//swgoh.gg/characters/cc-2224-cody/#ghost-company-commander	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	3	f	f	f	f	f	t	17	\N
44	Hip Fire	//swgoh.gg/characters/resistance-pilot/#hip-fire	//swgoh.gg/static/img/assets/tex.ability_resistancepilot_basic.png	8	f	t	1	1	t	f	f	f	f	f	158	\N
45	Outmaneuver	//swgoh.gg/characters/resistance-pilot/#outmaneuver	//swgoh.gg/static/img/assets/tex.ability_resistancepilot_special01.png	8	f	t	1	2	f	t	f	f	f	f	158	\N
46	Guerilla Tactics	//swgoh.gg/characters/resistance-pilot/#guerilla-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	7	f	f	1	4	f	f	f	f	t	f	158	\N
47	Desert Toxins	//swgoh.gg/characters/tusken-shaman/#desert-toxins	//swgoh.gg/static/img/assets/tex.ability_tuskenshaman_basic.png	8	f	t	1	1	t	f	f	f	f	f	103	\N
48	Rite of Savagery	//swgoh.gg/characters/tusken-shaman/#rite-of-savagery	//swgoh.gg/static/img/assets/tex.ability_tuskenshaman_special01.png	8	f	t	1	2	f	t	f	f	f	f	103	\N
49	Master Storyteller	//swgoh.gg/characters/tusken-shaman/#master-storyteller	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	t	1	4	f	f	f	f	t	f	103	\N
50	Quick Draw	//swgoh.gg/characters/han-solo/#quick-draw	//swgoh.gg/static/img/assets/tex.ability_han_basic.png	8	f	t	1	1	t	f	f	f	f	f	143	\N
51	Deadeye	//swgoh.gg/characters/han-solo/#deadeye	//swgoh.gg/static/img/assets/tex.ability_han_special02.png	8	f	t	1	2	f	t	f	f	f	f	143	\N
52	Never Tell Me The Odds	//swgoh.gg/characters/han-solo/#never-tell-me-the-odds	//swgoh.gg/static/img/assets/tex.ability_han_special01.png	8	f	t	1	2	f	t	f	f	f	f	143	\N
53	Shoots First	//swgoh.gg/characters/han-solo/#shoots-first	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	t	f	1	4	f	f	f	f	t	f	143	\N
54	Rifle Shot	//swgoh.gg/characters/tusken-raider/#rifle-shot	//swgoh.gg/static/img/assets/tex.ability_tuskenraider_basic.png	8	f	t	1	1	t	f	f	f	f	f	102	\N
55	Tusken Ambush	//swgoh.gg/characters/tusken-raider/#tusken-ambush	//swgoh.gg/static/img/assets/tex.ability_tuskenraider_special01.png	8	f	t	1	2	f	t	f	f	f	f	102	\N
56	Strength in Numbers	//swgoh.gg/characters/tusken-raider/#strength-in-numbers	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	102	\N
57	Harmonious Assault	//swgoh.gg/characters/qui-gon-jinn/#harmonious-assault	//swgoh.gg/static/img/assets/tex.ability_quigonjinn_special01.png	8	f	t	1	2	f	t	f	f	f	f	86	\N
58	Humbling Blow	//swgoh.gg/characters/qui-gon-jinn/#humbling-blow	//swgoh.gg/static/img/assets/tex.ability_quigonjinn_special02.png	8	f	t	1	2	f	t	f	f	f	f	86	\N
59	Quick Strike	//swgoh.gg/characters/qui-gon-jinn/#quick-strike	//swgoh.gg/static/img/assets/tex.ability_quigonjinn_basic.png	8	f	t	1	1	t	f	f	f	f	f	86	\N
60	Agility Training	//swgoh.gg/characters/qui-gon-jinn/#agility-training	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	t	f	1	3	f	f	f	f	f	t	86	\N
61	Line of Fire	//swgoh.gg/characters/magmatrooper/#line-of-fire	//swgoh.gg/static/img/assets/tex.ability_magmatrooper_basic.png	8	f	t	1	1	t	f	f	f	f	f	70	\N
62	Thermal Imploder	//swgoh.gg/characters/magmatrooper/#thermal-imploder	//swgoh.gg/static/img/assets/tex.ability_magmatrooper_special01.png	8	f	t	1	2	f	t	f	f	f	f	70	\N
63	Hazard Training	//swgoh.gg/characters/magmatrooper/#hazard-training	//swgoh.gg/static/img/assets/tex.abilityui_passive_stun_immute.png	8	f	t	1	4	f	f	f	f	t	f	70	\N
64	Cover Fire	//swgoh.gg/characters/hoth-rebel-soldier/#cover-fire	//swgoh.gg/static/img/assets/tex.ability_hothrebel_basic.png	8	f	t	1	1	t	f	f	f	f	f	51	\N
65	Hold the Line	//swgoh.gg/characters/hoth-rebel-soldier/#hold-the-line	//swgoh.gg/static/img/assets/tex.ability_hothrebel_special01.png	8	f	t	1	2	f	t	f	f	f	f	51	\N
66	Rebel Momentum	//swgoh.gg/characters/hoth-rebel-soldier/#rebel-momentum	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	4	f	f	f	f	t	f	51	\N
67	Imperial Marksmanship	//swgoh.gg/characters/stormtrooper/#imperial-marksmanship	//swgoh.gg/static/img/assets/tex.ability_stormtrooper_basic.png	8	f	t	1	1	t	f	f	f	f	f	97	\N
68	Stormtrooper Bravado	//swgoh.gg/characters/stormtrooper/#stormtrooper-bravado	//swgoh.gg/static/img/assets/tex.ability_stormtrooper_special01.png	8	f	t	1	2	f	t	f	f	f	f	97	\N
69	Wall of Stormtroopers	//swgoh.gg/characters/stormtrooper/#wall-of-stormtroopers	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	t	f	1	4	f	f	f	f	t	f	97	\N
70	Aggressive Advance	//swgoh.gg/characters/geonosian-soldier/#aggressive-advance	//swgoh.gg/static/img/assets/tex.ability_geonosiansoldier_basic.png	8	f	t	1	1	t	f	f	f	f	f	139	\N
71	Swarm	//swgoh.gg/characters/geonosian-soldier/#swarm	//swgoh.gg/static/img/assets/tex.ability_geonosiansoldier_special01.png	8	f	t	1	2	f	t	f	f	f	f	139	\N
72	Hive Tactics	//swgoh.gg/characters/geonosian-soldier/#hive-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	139	\N
73	Break Open	//swgoh.gg/characters/ugnaught/#break-open	//swgoh.gg/static/img/assets/tex.ability_ugnaught_basic.png	8	f	t	1	1	t	f	f	f	f	f	104	\N
74	Droid Experts	//swgoh.gg/characters/ugnaught/#droid-experts	//swgoh.gg/static/img/assets/tex.ability_ugnaught_special01.png	8	f	t	1	2	f	t	f	f	f	f	104	\N
75	One Step Ahead	//swgoh.gg/characters/ugnaught/#one-step-ahead	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	7	f	f	1	4	f	f	f	f	t	f	104	\N
76	Invigorating Strike	//swgoh.gg/characters/barriss-offee/#invigorating-strike	//swgoh.gg/static/img/assets/tex.ability_bariss_basic.png	8	f	t	1	1	t	f	f	f	f	f	7	\N
77	Force Healer	//swgoh.gg/characters/barriss-offee/#force-healer	//swgoh.gg/static/img/assets/tex.ability_bariss_special01.png	8	f	t	1	2	f	t	f	f	f	f	7	\N
78	Swift Recovery	//swgoh.gg/characters/barriss-offee/#swift-recovery	//swgoh.gg/static/img/assets/tex.abilityui_passive_removeharmful.png	8	t	f	1	4	f	f	f	f	t	f	7	\N
79	No One Left Behind	//swgoh.gg/characters/barriss-offee/#no-one-left-behind	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	8	f	t	1	3	f	f	f	f	f	t	7	\N
80	Bowcaster	//swgoh.gg/characters/clone-wars-chewbacca/#bowcaster	//swgoh.gg/static/img/assets/tex.ability_chewbacca_basic.png	8	f	t	1	1	t	f	f	f	f	f	21	\N
81	Wookiee Rage	//swgoh.gg/characters/clone-wars-chewbacca/#wookiee-rage	//swgoh.gg/static/img/assets/tex.ability_chewbacca_special01.png	8	f	t	1	2	f	t	f	f	f	f	21	\N
82	Defiant Roar	//swgoh.gg/characters/clone-wars-chewbacca/#defiant-roar	//swgoh.gg/static/img/assets/tex.ability_chewbacca_special02.png	8	t	f	1	2	f	t	f	f	f	f	21	\N
83	Wookiee Resolve	//swgoh.gg/characters/clone-wars-chewbacca/#wookiee-resolve	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	3	f	f	f	f	f	t	21	\N
84	Energetic Slash	//swgoh.gg/characters/ahsoka-tano/#energetic-slash	//swgoh.gg/static/img/assets/tex.ability_ahsokatanopadawan_basic.png	8	f	t	1	1	t	f	f	f	f	f	116	\N
85	Daring Padawan	//swgoh.gg/characters/ahsoka-tano/#daring-padawan	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	7	f	f	1	4	f	f	f	f	t	f	116	\N
86	Quick Steps	//swgoh.gg/characters/ahsoka-tano/#quick-steps	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	f	t	1	3	f	f	f	f	f	t	116	\N
87	Crack Shot	//swgoh.gg/characters/finn/#crack-shot	//swgoh.gg/static/img/assets/tex.ability_finnjakku_basic.png	8	f	t	1	1	t	f	f	f	f	f	133	\N
88	Hold the Line	//swgoh.gg/characters/finn/#hold-the-line	//swgoh.gg/static/img/assets/tex.ability_finnjakku_special02.png	8	f	t	1	2	f	t	f	f	f	f	133	\N
89	Takedown	//swgoh.gg/characters/finn/#takedown	//swgoh.gg/static/img/assets/tex.ability_finnjakku_special01.png	8	f	t	1	2	f	t	f	f	f	f	133	\N
90	Balanced Tactics	//swgoh.gg/characters/finn/#balanced-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	3	f	f	f	f	f	t	133	\N
91	Onslaught	//swgoh.gg/characters/captain-phasma/#onslaught	//swgoh.gg/static/img/assets/tex.ability_phasma_basic.png	8	f	t	1	1	t	f	f	f	f	f	122	\N
92	Victory March	//swgoh.gg/characters/captain-phasma/#victory-march	//swgoh.gg/static/img/assets/tex.ability_phasma_special02.png	8	f	t	1	2	f	t	f	f	f	f	122	\N
93	Fusillade	//swgoh.gg/characters/captain-phasma/#fusillade	//swgoh.gg/static/img/assets/tex.ability_phasma_special01.png	8	f	t	1	2	f	t	f	f	f	f	122	\N
94	Fire at Will	//swgoh.gg/characters/captain-phasma/#fire-at-will	//swgoh.gg/static/img/assets/tex.abilityui_leader_default.png	8	t	f	1	3	f	f	f	f	f	t	122	\N
95	Invincible Assault	//swgoh.gg/characters/mace-windu/#invincible-assault	//swgoh.gg/static/img/assets/tex.ability_macewindu_basic.png	8	f	t	1	1	t	f	f	f	f	f	155	\N
96	Smite	//swgoh.gg/characters/mace-windu/#smite	//swgoh.gg/static/img/assets/tex.ability_macewindu_special01.png	8	f	t	1	2	f	t	f	f	f	f	155	\N
97	Shatterpoint	//swgoh.gg/characters/mace-windu/#shatterpoint	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	7	f	f	1	4	f	f	f	f	t	f	155	\N
98	Vaapad	//swgoh.gg/characters/mace-windu/#vaapad	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	3	f	f	f	f	f	t	155	\N
99	Ewok Ambush	//swgoh.gg/characters/ewok-scout/#ewok-ambush	//swgoh.gg/static/img/assets/tex.ability_ewok_scout_basic.png	8	f	t	1	1	t	f	f	f	f	f	39	\N
100	Rushing Attack	//swgoh.gg/characters/ewok-scout/#rushing-attack	//swgoh.gg/static/img/assets/tex.ability_ewok_scout_special01.png	8	f	t	1	2	f	t	f	f	f	f	39	\N
101	Tribal Tactics	//swgoh.gg/characters/ewok-scout/#tribal-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	f	t	1	4	f	f	f	f	t	f	39	\N
102	Bounding Strike	//swgoh.gg/characters/chief-chirpa/#bounding-strike	//swgoh.gg/static/img/assets/tex.ability_ewok_chirpa_basic.png	8	f	t	1	1	t	f	f	f	f	f	18	\N
103	Ancestral Secrets	//swgoh.gg/characters/chief-chirpa/#ancestral-secrets	//swgoh.gg/static/img/assets/tex.ability_ewok_chirpa_special01.png	8	f	t	1	2	f	t	f	f	f	f	18	\N
104	Tribal Unity	//swgoh.gg/characters/chief-chirpa/#tribal-unity	//swgoh.gg/static/img/assets/tex.ability_ewok_chirpa_special02.png	8	f	t	1	2	f	t	f	f	f	f	18	\N
105	Simple Tactics	//swgoh.gg/characters/chief-chirpa/#simple-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	t	f	1	3	f	f	f	f	f	t	18	\N
106	Deathstroke	//swgoh.gg/characters/darth-sidious/#deathstroke	//swgoh.gg/static/img/assets/tex.ability_darthsidious_basic.png	8	f	t	1	1	t	f	f	f	f	f	28	\N
107	Demoralizing Blows	//swgoh.gg/characters/darth-sidious/#demoralizing-blows	//swgoh.gg/static/img/assets/tex.ability_darthsidious_special01.png	8	f	t	1	2	f	t	f	f	f	f	28	\N
108	Sadistic Glee	//swgoh.gg/characters/darth-sidious/#sadistic-glee	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal.png	8	t	f	1	4	f	f	f	f	t	f	28	\N
109	Unlimited Power	//swgoh.gg/characters/darth-sidious/#unlimited-power	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	3	f	f	f	f	f	t	28	\N
110	Non-Lethal Takedown	//swgoh.gg/characters/coruscant-underworld-police/#non-lethal-takedown	//swgoh.gg/static/img/assets/tex.ability_coruscantpolice_basic.png	8	f	t	1	1	t	f	f	f	f	f	24	\N
111	Non-Lethal Crowd Control	//swgoh.gg/characters/coruscant-underworld-police/#non-lethal-crowd-control	//swgoh.gg/static/img/assets/tex.ability_coruscantpolice_special01.png	8	f	t	1	2	f	t	f	f	f	f	24	\N
112	Non-Lethal Specialist	//swgoh.gg/characters/coruscant-underworld-police/#non-lethal-specialist	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	t	1	4	f	f	f	f	t	f	24	\N
113	Inspiring Strike	//swgoh.gg/characters/aayla-secura/#inspiring-strike	//swgoh.gg/static/img/assets/tex.ability_aayla_basic.png	8	f	t	1	1	t	f	f	f	f	f	1	\N
114	Survivor	//swgoh.gg/characters/aayla-secura/#survivor	//swgoh.gg/static/img/assets/tex.ability_aayla_special01.png	8	f	t	1	2	f	t	f	f	f	f	1	\N
115	Superior Riposte	//swgoh.gg/characters/aayla-secura/#superior-riposte	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	7	f	f	1	4	f	f	f	f	t	f	1	\N
116	Jedi Valor	//swgoh.gg/characters/aayla-secura/#jedi-valor	//swgoh.gg/static/img/assets/tex.abilityui_passive_def_resistance.png	8	f	t	1	3	f	f	f	f	f	t	1	\N
117	Quash	//swgoh.gg/characters/poggle-the-lesser/#quash	//swgoh.gg/static/img/assets/tex.ability_pogglethelesser_basic.png	8	f	t	1	1	t	f	f	f	f	f	83	\N
118	Droid Assault	//swgoh.gg/characters/poggle-the-lesser/#droid-assault	//swgoh.gg/static/img/assets/tex.ability_pogglethelesser_special01.png	8	f	t	1	2	f	t	f	f	f	f	83	\N
119	Metal Hive	//swgoh.gg/characters/poggle-the-lesser/#metal-hive	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	7	f	f	1	4	f	f	f	f	t	f	83	\N
120	Machine Overlord	//swgoh.gg/characters/poggle-the-lesser/#machine-overlord	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	3	f	f	f	f	f	t	83	\N
121	Raging Storm	//swgoh.gg/characters/darth-maul/#raging-storm	//swgoh.gg/static/img/assets/tex.ability_maul_special01.png	8	f	t	1	1	t	f	f	f	f	f	129	\N
122	Whirling Blades	//swgoh.gg/characters/darth-maul/#whirling-blades	//swgoh.gg/static/img/assets/tex.ability_maul_basic.png	8	f	t	1	2	f	t	f	f	f	f	129	\N
123	Power of Hatred	//swgoh.gg/characters/darth-maul/#power-of-hatred	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	f	t	1	4	f	f	f	f	t	f	129	\N
124	Dancing Shadows	//swgoh.gg/characters/darth-maul/#dancing-shadows	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	t	f	1	3	f	f	f	f	f	t	129	\N
125	Calculated Aggression	//swgoh.gg/characters/lobot/#calculated-aggression	//swgoh.gg/static/img/assets/tex.ability_lobot_basic.png	8	f	t	1	1	t	f	f	f	f	f	66	\N
126	Optimize	//swgoh.gg/characters/lobot/#optimize	//swgoh.gg/static/img/assets/tex.ability_lobot_special01.png	8	f	t	1	2	f	t	f	f	f	f	66	\N
127	Parallel Processing	//swgoh.gg/characters/lobot/#parallel-processing	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	t	1	4	f	f	f	f	t	f	66	\N
128	Cloud Computing	//swgoh.gg/characters/lobot/#cloud-computing	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	7	f	f	1	3	f	f	f	f	f	t	66	\N
129	Miniaturized Detonator	//swgoh.gg/characters/jawa-engineer/#miniaturized-detonator	//swgoh.gg/static/img/assets/tex.ability_jawaengineer_basic.png	8	f	t	1	1	t	f	f	f	f	f	58	\N
130	Patch Up	//swgoh.gg/characters/jawa-engineer/#patch-up	//swgoh.gg/static/img/assets/tex.ability_jawaengineer_special01.png	8	f	t	1	2	f	t	f	f	f	f	58	\N
131	Recalibrate	//swgoh.gg/characters/jawa-engineer/#recalibrate	//swgoh.gg/static/img/assets/tex.ability_jawaengineer_special02.png	8	f	t	1	2	f	t	f	f	f	f	58	\N
132	Crunch Time	//swgoh.gg/characters/jawa-engineer/#crunch-time	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	7	f	f	1	4	f	f	f	f	t	f	58	\N
133	Feint	//swgoh.gg/characters/geonosian-spy/#feint	//swgoh.gg/static/img/assets/tex.ability_geonosianspy_basic.png	8	f	t	1	1	t	f	f	f	f	f	140	\N
134	Silent Strike	//swgoh.gg/characters/geonosian-spy/#silent-strike	//swgoh.gg/static/img/assets/tex.ability_geonosianspy_special01.png	8	f	t	1	2	f	t	f	f	f	f	140	\N
135	Illicit Insect	//swgoh.gg/characters/geonosian-spy/#illicit-insect	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	t	1	4	f	f	f	f	t	f	140	\N
136	Hindering Press	//swgoh.gg/characters/count-dooku/#hindering-press	//swgoh.gg/static/img/assets/tex.ability_countdooku_basic.png	8	f	t	1	1	t	f	f	f	f	f	25	\N
137	Force Lightning	//swgoh.gg/characters/count-dooku/#force-lightning	//swgoh.gg/static/img/assets/tex.ability_countdooku_special01.png	8	f	t	1	2	f	t	f	f	f	f	25	\N
138	Flawless Riposte	//swgoh.gg/characters/count-dooku/#flawless-riposte	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	25	\N
139	Master Tactician	//swgoh.gg/characters/count-dooku/#master-tactician	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	f	t	1	3	f	f	f	f	f	t	25	\N
140	Sheltering Shot	//swgoh.gg/characters/chief-nebit/#sheltering-shot	//swgoh.gg/static/img/assets/tex.ability_nebit_basic.png	8	f	t	1	1	t	f	f	f	f	f	19	\N
141	Distracting Negotiations	//swgoh.gg/characters/chief-nebit/#distracting-negotiations	//swgoh.gg/static/img/assets/tex.ability_nebit_special01.png	8	f	t	1	2	f	t	f	f	f	f	19	\N
142	Desert Ambush	//swgoh.gg/characters/chief-nebit/#desert-ambush	//swgoh.gg/static/img/assets/tex.ability_nebit_special02.png	8	f	t	1	2	f	t	f	f	f	f	19	\N
143	Raiding Parties	//swgoh.gg/characters/chief-nebit/#raiding-parties	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	7	f	f	1	3	f	f	f	f	f	t	19	\N
144	Saber Strike	//swgoh.gg/characters/jedi-consular/#saber-strike	//swgoh.gg/static/img/assets/tex.ability_jediconsular_basic.png	8	f	t	1	1	t	f	f	f	f	f	147	\N
145	Jedi Healing	//swgoh.gg/characters/jedi-consular/#jedi-healing	//swgoh.gg/static/img/assets/tex.ability_jediconsular_special01.png	8	f	t	1	2	f	t	f	f	f	f	147	\N
146	Attack as Defense	//swgoh.gg/characters/jedi-consular/#attack-as-defense	//swgoh.gg/static/img/assets/tex.ability_jediconsular_special02.png	8	f	t	1	2	f	t	f	f	f	f	147	\N
147	Saber Sweep	//swgoh.gg/characters/jedi-knight-guardian/#saber-sweep	//swgoh.gg/static/img/assets/tex.ability_jediguardian_basic.png	8	f	t	1	1	t	f	f	f	f	f	60	\N
148	Saber Throw	//swgoh.gg/characters/jedi-knight-guardian/#saber-throw	//swgoh.gg/static/img/assets/tex.ability_jediguardian_special01.png	8	f	t	1	2	f	t	f	f	f	f	60	\N
149	Defend the Order	//swgoh.gg/characters/jedi-knight-guardian/#defend-the-order	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	4	f	f	f	f	t	f	60	\N
150	Strike from the Shadows	//swgoh.gg/characters/nightsister-acolyte/#strike-from-the-shadows	//swgoh.gg/static/img/assets/tex.ability_nightsisteracolyte_basic.png	8	f	t	1	1	t	f	f	f	f	f	74	\N
151	Sacrificial Magicks	//swgoh.gg/characters/nightsister-acolyte/#sacrificial-magicks	//swgoh.gg/static/img/assets/tex.ability_nightsisteracolyte_special01.png	8	f	t	1	2	f	t	f	f	f	f	74	\N
152	Thrill of Victory	//swgoh.gg/characters/nightsister-acolyte/#thrill-of-victory	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal.png	8	f	t	1	4	f	f	f	f	t	f	74	\N
153	Deft Bladework	//swgoh.gg/characters/jedi-knight-anakin/#deft-bladework	//swgoh.gg/static/img/assets/tex.ability_anakinknight_basic.png	8	f	t	1	1	t	f	f	f	f	f	148	\N
154	Reckless Assault	//swgoh.gg/characters/jedi-knight-anakin/#reckless-assault	//swgoh.gg/static/img/assets/tex.ability_anakinknight_special01.png	8	f	t	1	2	f	t	f	f	f	f	148	\N
155	Righteous Fury	//swgoh.gg/characters/jedi-knight-anakin/#righteous-fury	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	7	f	f	1	4	f	f	f	f	t	f	148	\N
156	Always on the Offensive	//swgoh.gg/characters/jedi-knight-anakin/#always-on-the-offensive	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	3	f	f	f	f	f	t	148	\N
157	Target Spotted	//swgoh.gg/characters/dengar/#target-spotted	//swgoh.gg/static/img/assets/tex.ability_dengar_basic.png	8	f	t	1	1	t	f	f	f	f	f	32	\N
158	Blast & Smash	//swgoh.gg/characters/dengar/#blast-smash	//swgoh.gg/static/img/assets/tex.ability_dengar_special02.png	8	f	t	1	2	f	t	f	f	f	f	32	\N
159	Mini-Mine Mayhem	//swgoh.gg/characters/dengar/#mini-mine-mayhem	//swgoh.gg/static/img/assets/tex.ability_dengar_special01.png	8	f	t	1	2	f	t	f	f	f	f	32	\N
160	Grizzled Veteran	//swgoh.gg/characters/dengar/#grizzled-veteran	//swgoh.gg/static/img/assets/tex.abilityui_passive_stealth.png	8	t	f	1	4	f	f	f	f	t	f	32	\N
161	Shifting Strike	//swgoh.gg/characters/rey-scavenger/#shifting-strike	//swgoh.gg/static/img/assets/tex.ability_rey_basic.png	8	f	t	1	1	t	f	f	f	f	f	159	\N
162	Leverage	//swgoh.gg/characters/rey-scavenger/#leverage	//swgoh.gg/static/img/assets/tex.ability_rey_special01.png	8	f	t	1	2	f	t	f	f	f	f	159	\N
163	Flurry of Blows	//swgoh.gg/characters/rey-scavenger/#flurry-of-blows	//swgoh.gg/static/img/assets/tex.ability_rey_special02.png	8	f	t	1	2	f	t	f	f	f	f	159	\N
164	Focused Strikes	//swgoh.gg/characters/rey-scavenger/#focused-strikes	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	4	f	f	f	f	t	f	159	\N
165	Gun Slinger	//swgoh.gg/characters/cad-bane/#gun-slinger	//swgoh.gg/static/img/assets/tex.ability_cadbane_basic.png	8	f	t	1	1	t	f	f	f	f	f	121	\N
166	Stun Glove	//swgoh.gg/characters/cad-bane/#stun-glove	//swgoh.gg/static/img/assets/tex.ability_cadbane_special01.png	8	f	t	1	2	f	t	f	f	f	f	121	\N
167	Hair Trigger	//swgoh.gg/characters/princess-leia/#hair-trigger	//swgoh.gg/static/img/assets/tex.ability_leiaorganaprincess_basic.png	8	f	t	1	1	t	f	f	f	f	f	84	\N
168	Rebel Tactics	//swgoh.gg/characters/princess-leia/#rebel-tactics	//swgoh.gg/static/img/assets/tex.ability_leiaorganaprincess_special01.png	8	f	t	1	2	f	t	f	f	f	f	84	\N
169	Against All Odds	//swgoh.gg/characters/princess-leia/#against-all-odds	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	8	t	f	1	4	f	f	f	f	t	f	84	\N
170	Heart of the Rebellion	//swgoh.gg/characters/princess-leia/#heart-of-the-rebellion	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	3	f	f	f	f	f	t	84	\N
171	Exploit Weakness	//swgoh.gg/characters/jawa/#exploit-weakness	//swgoh.gg/static/img/assets/tex.ability_jawa_basic.png	8	f	t	1	1	t	f	f	f	f	f	57	\N
172	Stun Surprise	//swgoh.gg/characters/jawa/#stun-surprise	//swgoh.gg/static/img/assets/tex.ability_jawa_special01.png	8	f	t	1	2	f	t	f	f	f	f	57	\N
173	Ambush Tactics	//swgoh.gg/characters/jawa/#ambush-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	f	t	1	4	f	f	f	f	t	f	57	\N
174	Gaffi Stick Slam	//swgoh.gg/characters/urorrurrr/#gaffi-stick-slam	//swgoh.gg/static/img/assets/tex.ability_urorrurrr_basic.png	8	f	t	1	1	t	f	f	f	f	f	105	\N
175	Single File to Hide Their Numbers	//swgoh.gg/characters/urorrurrr/#single-file-to-hide-their-numbers	//swgoh.gg/static/img/assets/tex.ability_urorrurrr_special01.png	8	f	t	1	2	f	t	f	f	f	f	105	\N
176	Ambush Instincts	//swgoh.gg/characters/urorrurrr/#ambush-instincts	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	105	\N
177	Tusken Chief	//swgoh.gg/characters/urorrurrr/#tusken-chief	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	7	f	f	1	3	f	f	f	f	f	t	105	\N
178	Slice Open	//swgoh.gg/characters/nightsister-initiate/#slice-open	//swgoh.gg/static/img/assets/tex.ability_nightsisterinitiate_basic.png	8	f	t	1	1	t	f	f	f	f	f	75	\N
179	Cut Down	//swgoh.gg/characters/nightsister-initiate/#cut-down	//swgoh.gg/static/img/assets/tex.ability_nightsisterinitiate_special01.png	8	f	t	1	2	f	t	f	f	f	f	75	\N
180	Severing Strike	//swgoh.gg/characters/nightsister-initiate/#severing-strike	//swgoh.gg/static/img/assets/tex.ability_nightsisterinitiate_special02.png	8	f	t	1	2	f	t	f	f	f	f	75	\N
181	Daring Attack	//swgoh.gg/characters/general-veers/#daring-attack	//swgoh.gg/static/img/assets/tex.ability_veers_basic.png	8	f	t	1	1	t	f	f	f	f	f	45	\N
182	Ruthless Assault	//swgoh.gg/characters/general-veers/#ruthless-assault	//swgoh.gg/static/img/assets/tex.ability_veers_special01.png	8	f	t	1	2	f	t	f	f	f	f	45	\N
183	Aggressive Tactician	//swgoh.gg/characters/general-veers/#aggressive-tactician	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	4	f	f	f	f	t	f	45	\N
184	Imperial Assault Commander	//swgoh.gg/characters/general-veers/#imperial-assault-commander	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	3	f	f	f	f	f	t	45	\N
185	Flush Out	//swgoh.gg/characters/resistance-trooper/#flush-out	//swgoh.gg/static/img/assets/tex.ability_resistancetrooper_basic.png	8	f	t	1	1	t	f	f	f	f	f	90	\N
186	Opportune Strike	//swgoh.gg/characters/resistance-trooper/#opportune-strike	//swgoh.gg/static/img/assets/tex.ability_resistancetrooper_special01.png	8	f	t	1	2	f	t	f	f	f	f	90	\N
187	Guerilla Tactics	//swgoh.gg/characters/resistance-trooper/#guerilla-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	7	f	f	1	4	f	f	f	f	t	f	90	\N
188	Staggering Blow	//swgoh.gg/characters/savage-opress/#staggering-blow	//swgoh.gg/static/img/assets/tex.ability_savageopress_basic.png	8	f	t	1	1	t	f	f	f	f	f	94	\N
189	Overpower	//swgoh.gg/characters/savage-opress/#overpower	//swgoh.gg/static/img/assets/tex.ability_savageopress_special01.png	8	f	t	1	2	f	t	f	f	f	f	94	\N
190	Brute	//swgoh.gg/characters/savage-opress/#brute	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	t	f	1	4	f	f	f	f	t	f	94	\N
191	Pain Is Weakness	//swgoh.gg/characters/savage-opress/#pain-is-weakness	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	3	f	f	f	f	f	t	94	\N
192	Grand Moff's Attack	//swgoh.gg/characters/grand-moff-tarkin/#grand-moffs-attack	//swgoh.gg/static/img/assets/tex.ability_grandmofftarkin_basic.png	8	f	t	1	1	t	f	f	f	f	f	142	\N
193	Ultimate Firepower	//swgoh.gg/characters/grand-moff-tarkin/#ultimate-firepower	//swgoh.gg/static/img/assets/tex.ability_grandmofftarkin_special01.png	8	f	t	1	2	f	t	f	f	f	f	142	\N
194	Intimidation Tactics	//swgoh.gg/characters/grand-moff-tarkin/#intimidation-tactics	//swgoh.gg/static/img/assets/tex.ability_grandmofftarkin_special02.png	8	f	t	1	2	f	t	f	f	f	f	142	\N
195	Tighten the Grip	//swgoh.gg/characters/grand-moff-tarkin/#tighten-the-grip	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	t	f	1	3	f	f	f	f	f	t	142	\N
196	Ragged Cut	//swgoh.gg/characters/kylo-ren/#ragged-cut	//swgoh.gg/static/img/assets/tex.ability_kyloren_basic.png	8	f	t	1	1	t	f	f	f	f	f	152	\N
197	Lash Out	//swgoh.gg/characters/kylo-ren/#lash-out	//swgoh.gg/static/img/assets/tex.ability_kyloren_special02.png	8	f	t	1	2	f	t	f	f	f	f	152	\N
198	Unstoppable	//swgoh.gg/characters/kylo-ren/#unstoppable	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	f	t	1	4	f	f	f	f	t	f	152	\N
199	Outrage	//swgoh.gg/characters/kylo-ren/#outrage	//swgoh.gg/static/img/assets/tex.ability_kyloren_special01.png	8	t	f	1	2	f	t	f	f	f	f	152	\N
200	Hit and Run	//swgoh.gg/characters/dathcha/#hit-and-run	//swgoh.gg/static/img/assets/tex.ability_dathcha_basic.png	8	f	t	1	1	t	f	f	f	f	f	31	\N
201	Scout Instincts	//swgoh.gg/characters/dathcha/#scout-instincts	//swgoh.gg/static/img/assets/tex.ability_dathcha_special01.png	8	f	t	1	2	f	t	f	f	f	f	31	\N
202	Droid Hunter	//swgoh.gg/characters/dathcha/#droid-hunter	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	7	f	f	1	4	f	f	f	f	t	f	31	\N
203	Decommission	//swgoh.gg/characters/dathcha/#decommission	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	3	f	f	f	f	f	t	31	\N
204	Mortal Wound	//swgoh.gg/characters/ig-88/#mortal-wound	//swgoh.gg/static/img/assets/tex.ability_ig88_basic.png	8	f	t	1	1	t	f	f	f	f	f	145	\N
205	Rapid Fire	//swgoh.gg/characters/ig-88/#rapid-fire	//swgoh.gg/static/img/assets/tex.ability_ig88_special01.png	8	f	t	1	2	f	t	f	f	f	f	145	\N
206	Adaptive Aim Algorithm	//swgoh.gg/characters/ig-88/#adaptive-aim-algorithm	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	4	f	f	f	f	t	f	145	\N
207	Resourceful Pursuer	//swgoh.gg/characters/ig-88/#resourceful-pursuer	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	3	f	f	f	f	f	t	145	\N
208	Ataru	//swgoh.gg/characters/grand-master-yoda/#ataru	//swgoh.gg/static/img/assets/tex.ability_yodagrandmaster_basic.png	8	f	t	1	1	t	f	f	f	f	f	46	\N
209	Masterstroke	//swgoh.gg/characters/grand-master-yoda/#masterstroke	//swgoh.gg/static/img/assets/tex.ability_yodagrandmaster_special03.png	8	f	t	1	2	f	t	f	f	f	f	46	\N
210	Unstoppable Force	//swgoh.gg/characters/grand-master-yoda/#unstoppable-force	//swgoh.gg/static/img/assets/tex.ability_yodagrandmaster_special01.png	8	f	t	1	2	f	t	f	f	f	f	46	\N
211	Grand Master's Guidance	//swgoh.gg/characters/grand-master-yoda/#grand-masters-guidance	//swgoh.gg/static/img/assets/tex.abilityui_passive_removeharmful.png	8	t	f	1	3	f	f	f	f	f	t	46	\N
212	Battle Meditation	//swgoh.gg/characters/grand-master-yoda/#battle-meditation	//swgoh.gg/static/img/assets/tex.ability_yodagrandmaster_special02.png	8	t	f	1	2	f	t	f	f	f	f	46	\N
213	Sunder	//swgoh.gg/characters/ima-gun-di/#sunder	//swgoh.gg/static/img/assets/tex.ability_imagundi_basic.png	8	f	t	1	1	t	f	f	f	f	f	54	\N
214	Rebuke	//swgoh.gg/characters/ima-gun-di/#rebuke	//swgoh.gg/static/img/assets/tex.ability_imagundi_special01.png	8	f	t	1	2	f	t	f	f	f	f	54	\N
215	Last Stand	//swgoh.gg/characters/ima-gun-di/#last-stand	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	7	f	f	1	4	f	f	f	f	t	f	54	\N
216	Jedi Strategist	//swgoh.gg/characters/ima-gun-di/#jedi-strategist	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	3	f	f	f	f	f	t	54	\N
217	Supporting Fire	//swgoh.gg/characters/ct-21-0408-echo/#supporting-fire	//swgoh.gg/static/img/assets/tex.ability_echo_basic.png	8	f	t	1	1	t	f	f	f	f	f	26	\N
218	EMP Grenade	//swgoh.gg/characters/ct-21-0408-echo/#emp-grenade	//swgoh.gg/static/img/assets/tex.ability_echo_special01.png	8	f	t	1	2	f	t	f	f	f	f	26	\N
219	By the Book	//swgoh.gg/characters/ct-21-0408-echo/#by-the-book	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal.png	8	f	t	1	4	f	f	f	f	t	f	26	\N
220	Follow-Up	//swgoh.gg/characters/ct-21-0408-echo/#follow-up	//swgoh.gg/static/img/assets/tex.abilityui_leader_default.png	7	f	f	1	4	f	f	f	f	t	f	26	\N
221	Hindering Shot	//swgoh.gg/characters/first-order-stormtrooper/#hindering-shot	//swgoh.gg/static/img/assets/tex.ability_firstorderstormtrooper_basic.png	8	f	t	1	1	t	f	f	f	f	f	135	\N
222	The Order Relentless	//swgoh.gg/characters/first-order-stormtrooper/#the-order-relentless	//swgoh.gg/static/img/assets/tex.ability_firstorderstormtrooper_special01.png	8	f	t	1	2	f	t	f	f	f	f	135	\N
223	Return Fire	//swgoh.gg/characters/first-order-stormtrooper/#return-fire	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	135	\N
224	Cadet's Aim	//swgoh.gg/characters/biggs-darklighter/#cadets-aim	//swgoh.gg/static/img/assets/tex.ability_biggs_basic.png	8	f	t	1	1	t	f	f	f	f	f	117	\N
225	Comrade-in-Arms	//swgoh.gg/characters/biggs-darklighter/#comrade-in-arms	//swgoh.gg/static/img/assets/tex.ability_biggs_special01.png	8	f	t	1	2	f	t	f	f	f	f	117	\N
226	Adrenaline Rush	//swgoh.gg/characters/biggs-darklighter/#adrenaline-rush	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	f	t	1	4	f	f	f	f	t	f	117	\N
227	Elegant Form	//swgoh.gg/characters/obi-wan-kenobi-old-ben/#elegant-form	//swgoh.gg/static/img/assets/tex.ability_obiwankenobioldhermit_basic.png	8	f	t	1	1	t	f	f	f	f	f	79	\N
228	Mind Tricks	//swgoh.gg/characters/obi-wan-kenobi-old-ben/#mind-tricks	//swgoh.gg/static/img/assets/tex.ability_obiwankenobioldhermit_special01.png	8	f	t	1	2	f	t	f	f	f	f	79	\N
229	If You Strike Me Down	//swgoh.gg/characters/obi-wan-kenobi-old-ben/#if-you-strike-me-down	//swgoh.gg/static/img/assets/tex.abilityui_passive_removeharmful.png	8	t	f	1	4	f	f	f	f	t	f	79	\N
230	Old Jedi Knight	//swgoh.gg/characters/obi-wan-kenobi-old-ben/#old-jedi-knight	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	f	t	1	3	f	f	f	f	f	t	79	\N
231	Bold Maneuvers	//swgoh.gg/characters/hoth-rebel-scout/#bold-maneuvers	//swgoh.gg/static/img/assets/tex.ability_hothrebelscout_basic.png	8	f	t	1	1	t	f	f	f	f	f	50	\N
232	Rebel Assault	//swgoh.gg/characters/hoth-rebel-scout/#rebel-assault	//swgoh.gg/static/img/assets/tex.ability_hothrebelscout_special01.png	8	f	t	1	2	f	t	f	f	f	f	50	\N
233	Hope of the Alliance	//swgoh.gg/characters/hoth-rebel-scout/#hope-of-the-alliance	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	t	1	4	f	f	f	f	t	f	50	\N
234	Flow of the Force	//swgoh.gg/characters/luminara-unduli/#flow-of-the-force	//swgoh.gg/static/img/assets/tex.ability_luminara_basic.png	8	f	t	1	1	t	f	f	f	f	f	69	\N
235	Force Blast	//swgoh.gg/characters/luminara-unduli/#force-blast	//swgoh.gg/static/img/assets/tex.ability_luminara_special01.png	8	f	t	1	2	f	t	f	f	f	f	69	\N
236	Master Healer's Blessing	//swgoh.gg/characters/luminara-unduli/#master-healers-blessing	//swgoh.gg/static/img/assets/tex.ability_luminara_special02.png	8	f	t	1	2	f	t	f	f	f	f	69	\N
237	Elegant Steps	//swgoh.gg/characters/luminara-unduli/#elegant-steps	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	t	f	1	3	f	f	f	f	f	t	69	\N
238	Assault Shock Troops	//swgoh.gg/characters/snowtrooper/#assault-shock-troops	//swgoh.gg/static/img/assets/tex.ability_snowtrooper_basic.png	8	f	t	1	1	t	f	f	f	f	f	96	\N
239	Overwhelming Assault	//swgoh.gg/characters/snowtrooper/#overwhelming-assault	//swgoh.gg/static/img/assets/tex.ability_snowtrooper_special01.png	8	f	t	1	2	f	t	f	f	f	f	96	\N
240	Assault Training	//swgoh.gg/characters/snowtrooper/#assault-training	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	t	1	4	f	f	f	f	t	f	96	\N
241	Execute	//swgoh.gg/characters/boba-fett/#execute	//swgoh.gg/static/img/assets/tex.ability_bobafett_special01.png	8	f	t	1	2	f	t	f	f	f	f	119	\N
242	Death From Above	//swgoh.gg/characters/boba-fett/#death-from-above	//swgoh.gg/static/img/assets/tex.ability_bobafett_special02.png	8	f	t	1	2	f	t	f	f	f	f	119	\N
243	Dead or Alive	//swgoh.gg/characters/boba-fett/#dead-or-alive	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	3	f	f	f	f	f	t	119	\N
244	Capitalize	//swgoh.gg/characters/first-order-officer/#capitalize	//swgoh.gg/static/img/assets/tex.ability_firstorderofficer_basic.png	8	f	t	1	1	t	f	f	f	f	f	41	\N
245	Marching Orders	//swgoh.gg/characters/first-order-officer/#marching-orders	//swgoh.gg/static/img/assets/tex.ability_firstorderofficer_special01.png	8	f	t	1	2	f	t	f	f	f	f	41	\N
246	Pinning Shot	//swgoh.gg/characters/first-order-officer/#pinning-shot	//swgoh.gg/static/img/assets/tex.ability_firstorderofficer_special02.png	8	f	t	1	2	f	t	f	f	f	f	41	\N
247	Precision Strike	//swgoh.gg/characters/ig-86-sentinel-droid/#precision-strike	//swgoh.gg/static/img/assets/tex.ability_ig86sentineldroid_basic.png	8	f	t	1	1	t	f	f	f	f	f	53	\N
248	Assassin Droid Tactics	//swgoh.gg/characters/ig-86-sentinel-droid/#assassin-droid-tactics	//swgoh.gg/static/img/assets/tex.ability_ig86sentineldroid_special01.png	8	f	t	1	2	f	t	f	f	f	f	53	\N
249	Droid Squad Tactics	//swgoh.gg/characters/ig-86-sentinel-droid/#droid-squad-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	53	\N
250	Stealth Takedown	//swgoh.gg/characters/teebo/#stealth-takedown	//swgoh.gg/static/img/assets/tex.ability_ewok_teebo_basic.png	8	f	t	1	1	t	f	f	f	f	f	101	\N
251	Ewok Scramble Tactics	//swgoh.gg/characters/teebo/#ewok-scramble-tactics	//swgoh.gg/static/img/assets/tex.ability_ewok_teebo_special01.png	8	f	t	1	2	f	t	f	f	f	f	101	\N
252	Bring Low	//swgoh.gg/characters/teebo/#bring-low	//swgoh.gg/static/img/assets/tex.ability_ewok_teebo_special02.png	8	f	t	1	2	f	t	f	f	f	f	101	\N
253	Guerrilla Warfare	//swgoh.gg/characters/teebo/#guerrilla-warfare	//swgoh.gg/static/img/assets/tex.abilityui_passive_stealth.png	8	f	t	1	3	f	f	f	f	f	t	101	\N
254	Quick Shot	//swgoh.gg/characters/admiral-ackbar/#quick-shot	//swgoh.gg/static/img/assets/tex.ability_ackbar_basic.png	8	f	t	1	1	t	f	f	f	f	f	115	\N
255	It's a Trap!	//swgoh.gg/characters/admiral-ackbar/#its-a-trap	//swgoh.gg/static/img/assets/tex.ability_ackbar_special01.png	8	f	t	1	2	f	t	f	f	f	f	115	\N
256	Tactical Genius	//swgoh.gg/characters/admiral-ackbar/#tactical-genius	//swgoh.gg/static/img/assets/tex.ability_ackbar_special02.png	8	f	t	1	2	f	t	f	f	f	f	115	\N
257	Rebel Coordination	//swgoh.gg/characters/admiral-ackbar/#rebel-coordination	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	7	f	f	1	3	f	f	f	f	f	t	115	\N
258	Superior Firepower	//swgoh.gg/characters/hk-47/#superior-firepower	//swgoh.gg/static/img/assets/tex.ability_hk47_basic.png	8	f	t	1	1	t	f	f	f	f	f	49	\N
259	Meatbag Mayhem	//swgoh.gg/characters/hk-47/#meatbag-mayhem	//swgoh.gg/static/img/assets/tex.ability_hk47_special01.png	8	f	t	1	2	f	t	f	f	f	f	49	\N
260	Reconstruction	//swgoh.gg/characters/hk-47/#reconstruction	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	7	f	f	1	4	f	f	f	f	t	f	49	\N
261	Assassin Protocol	//swgoh.gg/characters/hk-47/#assassin-protocol	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	3	f	f	f	f	f	t	49	\N
262	Cowardly Shot	//swgoh.gg/characters/nute-gunray/#cowardly-shot	//swgoh.gg/static/img/assets/tex.ability_nutegunray_basic.png	8	f	t	1	1	t	f	f	f	f	f	78	\N
263	Grenade Toss	//swgoh.gg/characters/nute-gunray/#grenade-toss	//swgoh.gg/static/img/assets/tex.ability_nutegunray_special01.png	8	f	t	1	2	f	t	f	f	f	f	78	\N
264	Shrewd Tactics	//swgoh.gg/characters/nute-gunray/#shrewd-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	7	f	f	1	4	f	f	f	f	t	f	78	\N
265	Backroom Subterfuge	//swgoh.gg/characters/nute-gunray/#backroom-subterfuge	//swgoh.gg/static/img/assets/tex.abilityui_passive_stealth.png	8	f	t	1	3	f	f	f	f	f	t	78	\N
266	Challenging Shot	//swgoh.gg/characters/poe-dameron/#challenging-shot	//swgoh.gg/static/img/assets/tex.ability_poe_basic.png	8	f	t	1	1	t	f	f	f	f	f	157	\N
267	Resistance Bravado	//swgoh.gg/characters/poe-dameron/#resistance-bravado	//swgoh.gg/static/img/assets/tex.ability_poe_special01.png	8	f	t	1	2	f	t	f	f	f	f	157	\N
268	Ace of the Resistance	//swgoh.gg/characters/poe-dameron/#ace-of-the-resistance	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	3	f	f	f	f	f	t	157	\N
269	Stand Firm	//swgoh.gg/characters/poe-dameron/#stand-firm	//swgoh.gg/static/img/assets/tex.abilityui_passive_stun_immute.png	7	f	f	1	4	f	f	f	f	t	f	157	\N
270	Lightning Strike	//swgoh.gg/characters/emperor-palpatine/#lightning-strike	//swgoh.gg/static/img/assets/tex.ability_palpatineemperor_basic.png	8	f	t	1	1	t	f	f	f	f	f	36	\N
271	Power of the Dark Side	//swgoh.gg/characters/emperor-palpatine/#power-of-the-dark-side	//swgoh.gg/static/img/assets/tex.ability_palpatineemperor_special01.png	8	f	t	1	2	f	t	f	f	f	f	36	\N
272	Let the Hate Flow	//swgoh.gg/characters/emperor-palpatine/#let-the-hate-flow	//swgoh.gg/static/img/assets/tex.ability_palpatineemperor_special02.png	8	f	t	1	2	f	t	f	f	f	f	36	\N
273	Crackling Doom	//swgoh.gg/characters/emperor-palpatine/#crackling-doom	//swgoh.gg/static/img/assets/tex.abilityui_passive_shock.png	8	t	f	1	4	f	f	f	f	t	f	36	\N
274	Emperor of the Galactic Empire	//swgoh.gg/characters/emperor-palpatine/#emperor-of-the-galactic-empire	//swgoh.gg/static/img/assets/tex.abilityui_passive_empire.png	8	t	f	1	3	f	f	f	f	f	t	36	\N
275	Z-6 Rotary Blaster	//swgoh.gg/characters/clone-sergeant-phase-i/#z-6-rotary-blaster	//swgoh.gg/static/img/assets/tex.ability_clonesergeant_basic.png	8	f	t	1	1	t	f	f	f	f	f	126	\N
276	Suppressive Fire	//swgoh.gg/characters/clone-sergeant-phase-i/#suppressive-fire	//swgoh.gg/static/img/assets/tex.ability_clonesergeant_special01.png	8	f	t	1	2	f	t	f	f	f	f	126	\N
277	Concentrated Fire	//swgoh.gg/characters/clone-sergeant-phase-i/#concentrated-fire	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	126	\N
278	Lightsaber Mastery	//swgoh.gg/characters/kit-fisto/#lightsaber-mastery	//swgoh.gg/static/img/assets/tex.ability_kitfisto_basic.png	8	f	t	1	1	t	f	f	f	f	f	64	\N
279	Turn the Tide	//swgoh.gg/characters/kit-fisto/#turn-the-tide	//swgoh.gg/static/img/assets/tex.ability_kitfisto_special01.png	8	f	t	1	2	f	t	f	f	f	f	64	\N
280	Superior Bladework	//swgoh.gg/characters/kit-fisto/#superior-bladework	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	7	f	f	1	4	f	f	f	f	t	f	64	\N
281	Jedi Protector	//swgoh.gg/characters/kit-fisto/#jedi-protector	//swgoh.gg/static/img/assets/tex.abilityui_passive_def_resistance.png	8	f	t	1	3	f	f	f	f	f	t	64	\N
282	Dual DC-17 Blasters	//swgoh.gg/characters/ct-5555-fives/#dual-dc-17-blasters	//swgoh.gg/static/img/assets/tex.ability_ct5555_basic.png	8	f	t	1	1	t	f	f	f	f	f	127	\N
283	Combined Fire	//swgoh.gg/characters/ct-5555-fives/#combined-fire	//swgoh.gg/static/img/assets/tex.ability_ct5555_special01.png	8	f	t	1	2	f	t	f	f	f	f	127	\N
284	Tactical Awareness	//swgoh.gg/characters/ct-5555-fives/#tactical-awareness	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	127	\N
285	Veteran Clone Trooper	//swgoh.gg/characters/ct-5555-fives/#veteran-clone-trooper	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	3	f	f	f	f	f	t	127	\N
286	Who Shot First?	//swgoh.gg/characters/greedo/#who-shot-first	//swgoh.gg/static/img/assets/tex.ability_greedo_basic.png	8	f	t	1	1	t	f	f	f	f	f	47	\N
287	If at First You Don't Succeed	//swgoh.gg/characters/greedo/#if-at-first-you-dont-succeed	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	47	\N
288	Ambuscade	//swgoh.gg/characters/greedo/#ambuscade	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	7	f	f	1	3	f	f	f	f	f	t	47	\N
289	Focused Fire	//swgoh.gg/characters/wedge-antilles/#focused-fire	//swgoh.gg/static/img/assets/tex.ability_wedge_basic.png	8	f	t	1	1	t	f	f	f	f	f	167	\N
290	Red Squadron Strike	//swgoh.gg/characters/wedge-antilles/#red-squadron-strike	//swgoh.gg/static/img/assets/tex.ability_wedge_special01.png	8	f	t	1	2	f	t	f	f	f	f	167	\N
291	Red Leader	//swgoh.gg/characters/wedge-antilles/#red-leader	//swgoh.gg/static/img/assets/tex.abilityui_leader_default.png	8	f	t	1	4	f	f	f	f	t	f	167	\N
292	Rebel Heroism	//swgoh.gg/characters/wedge-antilles/#rebel-heroism	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	7	f	f	1	3	f	f	f	f	f	t	167	\N
293	Browbeat	//swgoh.gg/characters/sun-fac/#browbeat	//swgoh.gg/static/img/assets/tex.ability_sunfac_basic.png	8	f	t	1	1	t	f	f	f	f	f	165	\N
294	Subjugate	//swgoh.gg/characters/sun-fac/#subjugate	//swgoh.gg/static/img/assets/tex.ability_sunfac_special01.png	8	f	t	1	2	f	t	f	f	f	f	165	\N
295	Spiteful Strike	//swgoh.gg/characters/sun-fac/#spiteful-strike	//swgoh.gg/static/img/assets/tex.ability_sunfac_special02.png	8	f	t	1	2	f	t	f	f	f	f	165	\N
296	Superiority	//swgoh.gg/characters/sun-fac/#superiority	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	7	f	f	1	4	f	f	f	f	t	f	165	\N
297	Heavy Arms	//swgoh.gg/characters/b2-super-battle-droid/#heavy-arms	//swgoh.gg/static/img/assets/tex.ability_b2_basic.png	8	f	t	1	1	t	f	f	f	f	f	6	\N
298	Mow Down	//swgoh.gg/characters/b2-super-battle-droid/#mow-down	//swgoh.gg/static/img/assets/tex.ability_b2_special01.png	8	f	t	1	2	f	t	f	f	f	f	6	\N
299	Relentless Barrage	//swgoh.gg/characters/b2-super-battle-droid/#relentless-barrage	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	f	t	1	4	f	f	f	f	t	f	6	\N
300	Draining Strike	//swgoh.gg/characters/talia/#draining-strike	//swgoh.gg/static/img/assets/tex.ability_talia_basic.png	8	f	t	1	1	t	f	f	f	f	f	100	\N
301	Water of Life	//swgoh.gg/characters/talia/#water-of-life	//swgoh.gg/static/img/assets/tex.ability_talia_special01.png	8	f	t	1	2	f	t	f	f	f	f	100	\N
302	Harrowing Assault	//swgoh.gg/characters/talia/#harrowing-assault	//swgoh.gg/static/img/assets/tex.ability_talia_special02.png	8	f	t	1	2	f	t	f	f	f	f	100	\N
303	Nightsister Nimbleness	//swgoh.gg/characters/talia/#nightsister-nimbleness	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	7	f	f	1	3	f	f	f	f	f	t	100	\N
304	Double Tap	//swgoh.gg/characters/first-order-tie-pilot/#double-tap	//swgoh.gg/static/img/assets/tex.ability_firstordertiepilot_basic.png	8	f	t	1	1	t	f	f	f	f	f	136	\N
305	Gun Down	//swgoh.gg/characters/first-order-tie-pilot/#gun-down	//swgoh.gg/static/img/assets/tex.ability_firstordertiepilot_special01.png	8	f	t	1	2	f	t	f	f	f	f	136	\N
306	Keen Eye	//swgoh.gg/characters/first-order-tie-pilot/#keen-eye	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	4	f	f	f	f	t	f	136	\N
307	Terrifying Swing	//swgoh.gg/characters/darth-vader/#terrifying-swing	//swgoh.gg/static/img/assets/tex.ability_darthvader_basic.png	8	f	t	1	1	t	f	f	f	f	f	130	\N
308	Force Crush	//swgoh.gg/characters/darth-vader/#force-crush	//swgoh.gg/static/img/assets/tex.ability_darthvader_special02.png	8	f	t	1	2	f	t	f	f	f	f	130	\N
309	Culling Blade	//swgoh.gg/characters/darth-vader/#culling-blade	//swgoh.gg/static/img/assets/tex.ability_darthvader_special01.png	8	f	t	1	2	f	t	f	f	f	f	130	\N
310	Inspiring Through Fear	//swgoh.gg/characters/darth-vader/#inspiring-through-fear	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	3	f	f	f	f	f	t	130	\N
311	Wary Shot	//swgoh.gg/characters/stormtrooper-han/#wary-shot	//swgoh.gg/static/img/assets/tex.ability_stormtrooperhan_basic.png	8	f	t	1	1	t	f	f	f	f	f	98	\N
312	Draw Fire	//swgoh.gg/characters/stormtrooper-han/#draw-fire	//swgoh.gg/static/img/assets/tex.ability_stormtrooperhan_special01.png	8	f	t	1	2	f	t	f	f	f	f	98	\N
313	Bluff	//swgoh.gg/characters/stormtrooper-han/#bluff	//swgoh.gg/static/img/assets/tex.abilityui_passive_stun_immute.png	8	t	f	1	4	f	f	f	f	t	f	98	\N
314	Plan B	//swgoh.gg/characters/stormtrooper-han/#plan-b	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	7	f	f	1	3	f	f	f	f	f	t	98	\N
315	Breaching Strike	//swgoh.gg/characters/eeth-koth/#breaching-strike	//swgoh.gg/static/img/assets/tex.ability_eethkoth_basic.png	8	f	t	1	1	t	f	f	f	f	f	34	\N
316	Force Push	//swgoh.gg/characters/eeth-koth/#force-push	//swgoh.gg/static/img/assets/tex.ability_eethkoth_special01.png	8	f	t	1	2	f	t	f	f	f	f	34	\N
317	Anti-Droid Specialist	//swgoh.gg/characters/eeth-koth/#anti-droid-specialist	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	34	\N
318	Stalwart Jedi Defender	//swgoh.gg/characters/eeth-koth/#stalwart-jedi-defender	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	7	f	f	1	3	f	f	f	f	f	t	34	\N
319	Hack and Slash	//swgoh.gg/characters/gamorrean-guard/#hack-and-slash	//swgoh.gg/static/img/assets/tex.ability_gamorrguard_basic.png	8	f	t	1	1	t	f	f	f	f	f	42	\N
320	Muscle In	//swgoh.gg/characters/gamorrean-guard/#muscle-in	//swgoh.gg/static/img/assets/tex.ability_gamorrguard_special01.png	8	f	t	1	2	f	t	f	f	f	f	42	\N
321	Punch Through	//swgoh.gg/characters/gamorrean-guard/#punch-through	//swgoh.gg/static/img/assets/tex.ability_gamorrguard_special02.png	8	f	t	1	2	f	t	f	f	f	f	42	\N
322	Detonating Shot	//swgoh.gg/characters/zam-wesell/#detonating-shot	//swgoh.gg/static/img/assets/tex.ability_zamwesell_basic.png	8	f	t	1	1	t	f	f	f	f	f	114	\N
323	See What Sticks	//swgoh.gg/characters/zam-wesell/#see-what-sticks	//swgoh.gg/static/img/assets/tex.ability_zamwesell_special01.png	8	f	t	1	2	f	t	f	f	f	f	114	\N
324	Electro-goggles	//swgoh.gg/characters/zam-wesell/#electro-goggles	//swgoh.gg/static/img/assets/tex.ability_zamwesell_special02.png	8	f	t	1	2	f	t	f	f	f	f	114	\N
325	Shapeshifter	//swgoh.gg/characters/zam-wesell/#shapeshifter	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	t	f	1	4	f	f	f	f	t	f	114	\N
326	Dismantle	//swgoh.gg/characters/jawa-scavenger/#dismantle	//swgoh.gg/static/img/assets/tex.ability_jawascavenger_basic.png	8	f	t	1	1	t	f	f	f	f	f	59	\N
327	Scrap Bomb	//swgoh.gg/characters/jawa-scavenger/#scrap-bomb	//swgoh.gg/static/img/assets/tex.ability_jawascavenger_special01.png	8	f	t	1	2	f	t	f	f	f	f	59	\N
328	Line in the Sand	//swgoh.gg/characters/jawa-scavenger/#line-in-the-sand	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	f	t	1	4	f	f	f	f	t	f	59	\N
329	Salvaged Equipment	//swgoh.gg/characters/jawa-scavenger/#salvaged-equipment	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	7	f	f	1	4	f	f	f	f	t	f	59	\N
330	Dig In	//swgoh.gg/characters/scarif-rebel-pathfinder/#dig-in	//swgoh.gg/static/img/assets/tex.ability_rebelscarif_basic.png	8	f	t	1	1	t	f	f	f	f	f	161	\N
331	Explosive Entry	//swgoh.gg/characters/scarif-rebel-pathfinder/#explosive-entry	//swgoh.gg/static/img/assets/tex.ability_rebelscarif_special01.png	8	f	t	1	2	f	t	f	f	f	f	161	\N
332	Do or Die	//swgoh.gg/characters/scarif-rebel-pathfinder/#do-or-die	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	8	f	t	1	4	f	f	f	f	t	f	161	\N
333	Squad Discipline	//swgoh.gg/characters/ct-7567-rex/#squad-discipline	//swgoh.gg/static/img/assets/tex.ability_rex_special01.png	8	f	t	1	2	f	t	f	f	f	f	128	\N
334	Subdue	//swgoh.gg/characters/ct-7567-rex/#subdue	//swgoh.gg/static/img/assets/tex.ability_rex_special02.png	8	f	t	1	2	f	t	f	f	f	f	128	\N
335	Brothers in Arms	//swgoh.gg/characters/ct-7567-rex/#brothers-in-arms	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	7	f	f	1	3	f	f	f	f	f	t	128	\N
336	Target Weapons	//swgoh.gg/characters/shoretrooper/#target-weapons	//swgoh.gg/static/img/assets/tex.ability_troopershore_basic.png	8	f	t	1	1	t	f	f	f	f	f	162	\N
337	Regroup	//swgoh.gg/characters/shoretrooper/#regroup	//swgoh.gg/static/img/assets/tex.ability_troopershore_special01.png	8	f	t	1	2	f	t	f	f	f	f	162	\N
338	Stand Guard	//swgoh.gg/characters/shoretrooper/#stand-guard	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	8	f	t	1	4	f	f	f	f	t	f	162	\N
339	Targeting Computer	//swgoh.gg/characters/tie-fighter-pilot/#targeting-computer	//swgoh.gg/static/img/assets/tex.ability_tiepilot_basic.png	8	f	t	1	1	t	f	f	f	f	f	166	\N
340	TIE Strike	//swgoh.gg/characters/tie-fighter-pilot/#tie-strike	//swgoh.gg/static/img/assets/tex.ability_tiepilot_special01.png	8	f	t	1	2	f	t	f	f	f	f	166	\N
341	Evasive Maneuvers	//swgoh.gg/characters/tie-fighter-pilot/#evasive-maneuvers	//swgoh.gg/static/img/assets/tex.abilityui_passive_foresight.png	8	f	t	1	4	f	f	f	f	t	f	166	\N
342	Intuitive Strike	//swgoh.gg/characters/general-kenobi/#intuitive-strike	//swgoh.gg/static/img/assets/tex.ability_generalkenobi_basic.png	8	f	t	1	1	t	f	f	f	f	f	44	\N
343	The Negotiator	//swgoh.gg/characters/general-kenobi/#the-negotiator	//swgoh.gg/static/img/assets/tex.ability_generalkenobi_special01.png	8	f	t	1	2	f	t	f	f	f	f	44	\N
344	Lead the Charge	//swgoh.gg/characters/general-kenobi/#lead-the-charge	//swgoh.gg/static/img/assets/tex.ability_generalkenobi_special02.png	8	f	t	1	2	f	t	f	f	f	f	44	\N
345	212th Attack Battalion Commander	//swgoh.gg/characters/general-kenobi/#212th-attack-battalion-commander	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	7	f	f	1	3	f	f	f	f	f	t	44	\N
346	Soresu	//swgoh.gg/characters/general-kenobi/#soresu	//swgoh.gg/static/img/assets/tex.abilityui_passive_foresight.png	7	f	f	1	4	f	f	f	f	t	f	44	\N
347	Blast 'Em	//swgoh.gg/characters/bistan/#blast-em	//swgoh.gg/static/img/assets/tex.ability_bistan_basic.png	8	f	t	1	1	t	f	f	f	f	f	118	\N
348	Frenzy	//swgoh.gg/characters/bistan/#frenzy	//swgoh.gg/static/img/assets/tex.ability_bistan_special01.png	8	f	t	1	2	f	t	f	f	f	f	118	\N
349	Gunner Tactics	//swgoh.gg/characters/bistan/#gunner-tactics	//swgoh.gg/static/img/assets/tex.ability_bistan_special02.png	8	f	t	1	2	f	t	f	f	f	f	118	\N
350	Amped Up	//swgoh.gg/characters/bistan/#amped-up	//swgoh.gg/static/img/assets/tex.abilityui_passive_potency.png	7	f	f	1	4	f	f	f	f	t	f	118	\N
351	Staff Strike	//swgoh.gg/characters/chirrut-imwe/#staff-strike	//swgoh.gg/static/img/assets/tex.ability_chirrut_basic.png	8	f	t	1	1	t	f	f	f	f	f	20	\N
352	As the Force Wills	//swgoh.gg/characters/chirrut-imwe/#as-the-force-wills	//swgoh.gg/static/img/assets/tex.ability_chirrut_special01.png	8	f	t	1	2	f	t	f	f	f	f	20	\N
353	Strength of Purpose	//swgoh.gg/characters/chirrut-imwe/#strength-of-purpose	//swgoh.gg/static/img/assets/tex.ability_chirrut_special02.png	8	f	t	1	2	f	t	f	f	f	f	20	\N
354	Indomitable Will	//swgoh.gg/characters/chirrut-imwe/#indomitable-will	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	7	f	f	1	4	f	f	f	f	t	f	20	\N
355	Resolute Endurance	//swgoh.gg/characters/chirrut-imwe/#resolute-endurance	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	7	f	f	1	4	f	f	f	f	t	f	20	\N
356	Heavy Repeater Cannon	//swgoh.gg/characters/baze-malbus/#heavy-repeater-cannon	//swgoh.gg/static/img/assets/tex.ability_baze_basic.png	8	f	t	1	1	t	f	f	f	f	f	10	\N
357	Unload	//swgoh.gg/characters/baze-malbus/#unload	//swgoh.gg/static/img/assets/tex.ability_baze_special01.png	8	f	t	1	2	f	t	f	f	f	f	10	\N
358	Fierce Reprisal	//swgoh.gg/characters/baze-malbus/#fierce-reprisal	//swgoh.gg/static/img/assets/tex.ability_baze_special02.png	8	f	t	1	2	f	t	f	f	f	f	10	\N
359	For Jedha	//swgoh.gg/characters/baze-malbus/#for-jedha	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	7	f	f	1	4	f	f	f	f	t	f	10	\N
360	Dauntless Courage	//swgoh.gg/characters/baze-malbus/#dauntless-courage	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	7	f	f	1	4	f	f	f	f	t	f	10	\N
361	EE-3 Carbine	//swgoh.gg/characters/boba-fett/#ee-3-carbine	//swgoh.gg/static/img/assets/tex.ability_bobafett_basic.png	8	f	t	1	1	t	f	f	f	f	f	119	\N
362	Bounty Hunter's Resolve	//swgoh.gg/characters/boba-fett/#bounty-hunters-resolve	//swgoh.gg/static/img/assets/tex.abilityui_passive_mandalorian.png	8	t	f	1	4	f	f	f	f	t	f	119	\N
363	Press the Attack	//swgoh.gg/characters/jyn-erso/#press-the-attack	//swgoh.gg/static/img/assets/tex.ability_jynerso_basic.png	8	f	t	1	1	t	f	f	f	f	f	149	\N
364	Rebel Counterattack	//swgoh.gg/characters/jyn-erso/#rebel-counterattack	//swgoh.gg/static/img/assets/tex.ability_jynerso_special02.png	8	f	t	1	2	f	t	f	f	f	f	149	\N
365	Truncheon Strike	//swgoh.gg/characters/jyn-erso/#truncheon-strike	//swgoh.gg/static/img/assets/tex.ability_jynerso_special01.png	8	f	t	1	2	f	t	f	f	f	f	149	\N
366	Into the Fray	//swgoh.gg/characters/jyn-erso/#into-the-fray	//swgoh.gg/static/img/assets/tex.abilityui_passive_rebel.png	8	t	f	1	3	f	f	f	f	f	t	149	\N
367	Fierce Determination	//swgoh.gg/characters/jyn-erso/#fierce-determination	//swgoh.gg/static/img/assets/tex.abilityui_passive_potency.png	8	t	f	1	4	f	f	f	f	t	f	149	\N
368	Carboplast Composite Fist	//swgoh.gg/characters/k-2so/#carboplast-composite-fist	//swgoh.gg/static/img/assets/tex.ability_k2so_basic.png	8	f	t	1	1	t	f	f	f	f	f	150	\N
369	Conductive Charge	//swgoh.gg/characters/k-2so/#conductive-charge	//swgoh.gg/static/img/assets/tex.ability_k2so_special01.png	8	f	t	1	2	f	t	f	f	f	f	150	\N
370	Enforcer	//swgoh.gg/characters/k-2so/#enforcer	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	8	f	t	1	4	f	f	f	f	t	f	150	\N
371	Reprogrammed Imperial Droid	//swgoh.gg/characters/k-2so/#reprogrammed-imperial-droid	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	150	\N
372	Two Steps Ahead	//swgoh.gg/characters/cassian-andor/#two-steps-ahead	//swgoh.gg/static/img/assets/tex.ability_cassian_basic.png	8	f	t	1	1	t	f	f	f	f	f	123	\N
373	Shock Grenade	//swgoh.gg/characters/cassian-andor/#shock-grenade	//swgoh.gg/static/img/assets/tex.ability_cassian_special01.png	8	f	t	1	2	f	t	f	f	f	f	123	\N
374	Crippling Shot	//swgoh.gg/characters/cassian-andor/#crippling-shot	//swgoh.gg/static/img/assets/tex.ability_cassian_special02.png	8	f	t	1	2	f	t	f	f	f	f	123	\N
375	Groundwork	//swgoh.gg/characters/cassian-andor/#groundwork	//swgoh.gg/static/img/assets/tex.abilityui_passive_rebel.png	8	t	f	1	4	f	f	f	f	t	f	123	\N
376	Test Their Defenses	//swgoh.gg/characters/director-krennic/#test-their-defenses	//swgoh.gg/static/img/assets/tex.ability_krennic_basic.png	8	f	t	1	1	t	f	f	f	f	f	33	\N
377	Death Trooper Assault	//swgoh.gg/characters/director-krennic/#death-trooper-assault	//swgoh.gg/static/img/assets/tex.ability_krennic_special02.png	8	f	t	1	2	f	t	f	f	f	f	33	\N
378	Experimental Weaponry	//swgoh.gg/characters/director-krennic/#experimental-weaponry	//swgoh.gg/static/img/assets/tex.ability_krennic_special01.png	8	f	t	1	2	f	t	f	f	f	f	33	\N
379	Director of Advanced Weapons Research	//swgoh.gg/characters/director-krennic/#director-of-advanced-weapons-research	//swgoh.gg/static/img/assets/tex.abilityui_passive_empire.png	8	t	f	1	3	f	f	f	f	f	t	33	\N
380	Immeasurable Power	//swgoh.gg/characters/director-krennic/#immeasurable-power	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	7	f	f	1	4	f	f	f	f	t	f	33	\N
381	Track Down	//swgoh.gg/characters/death-trooper/#track-down	//swgoh.gg/static/img/assets/tex.ability_trooperdeath_basic.png	8	f	t	1	1	t	f	f	f	f	f	131	\N
382	Death Trooper Grenade	//swgoh.gg/characters/death-trooper/#death-trooper-grenade	//swgoh.gg/static/img/assets/tex.ability_trooperdeath_special01.png	8	f	t	1	2	f	t	f	f	f	f	131	\N
383	Terminate	//swgoh.gg/characters/death-trooper/#terminate	//swgoh.gg/static/img/assets/tex.ability_trooperdeath_special02.png	8	f	t	1	2	f	t	f	f	f	f	131	\N
384	Krennic's Guard	//swgoh.gg/characters/death-trooper/#krennics-guard	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	8	t	f	1	4	f	f	f	f	t	f	131	\N
385	Ceaseless Craving	//swgoh.gg/characters/darth-nihilus/#ceaseless-craving	//swgoh.gg/static/img/assets/tex.ability_nihilus_basic.png	8	f	t	1	1	t	f	f	f	f	f	27	\N
386	Drain Force	//swgoh.gg/characters/darth-nihilus/#drain-force	//swgoh.gg/static/img/assets/tex.ability_nihilus_special01.png	8	f	t	1	2	f	t	f	f	f	f	27	\N
387	Annihilate	//swgoh.gg/characters/darth-nihilus/#annihilate	//swgoh.gg/static/img/assets/tex.ability_nihilus_special02.png	8	f	t	1	2	f	t	f	f	f	f	27	\N
388	Lord of Hunger	//swgoh.gg/characters/darth-nihilus/#lord-of-hunger	//swgoh.gg/static/img/assets/tex.abilityui_passive_kill.png	8	t	f	1	4	f	f	f	f	t	f	27	\N
389	Disruptor Blast	//swgoh.gg/characters/sith-trooper/#disruptor-blast	//swgoh.gg/static/img/assets/tex.ability_sithtrooper_basic.png	8	f	t	1	1	t	f	f	f	f	f	95	\N
390	Crimson Barrage	//swgoh.gg/characters/sith-trooper/#crimson-barrage	//swgoh.gg/static/img/assets/tex.ability_sithtrooper_special01.png	8	f	t	1	2	f	t	f	f	f	f	95	\N
391	Vaiken's Legacy	//swgoh.gg/characters/sith-trooper/#vaikens-legacy	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	8	f	t	1	4	f	f	f	f	t	f	95	\N
392	Exploit Weakness	//swgoh.gg/characters/sith-assassin/#exploit-weakness	//swgoh.gg/static/img/assets/tex.ability_sithassassin_basic.png	8	f	t	1	1	t	f	f	f	f	f	163	\N
393	Dark Shroud	//swgoh.gg/characters/sith-assassin/#dark-shroud	//swgoh.gg/static/img/assets/tex.ability_sithassassin_special01.png	8	f	t	1	2	f	t	f	f	f	f	163	\N
394	Electrocute	//swgoh.gg/characters/sith-assassin/#electrocute	//swgoh.gg/static/img/assets/tex.ability_sithassassin_special02.png	8	f	t	1	2	f	t	f	f	f	f	163	\N
395	Reckless Fling	//swgoh.gg/characters/chopper/#reckless-fling	//swgoh.gg/static/img/assets/tex.ability_chopper_basic.png	8	f	t	1	1	t	f	f	f	f	f	125	\N
396	Cantankerous Clanker	//swgoh.gg/characters/chopper/#cantankerous-clanker	//swgoh.gg/static/img/assets/tex.ability_chopper_special01.png	8	f	t	1	2	f	t	f	f	f	f	125	\N
397	Metal Menace	//swgoh.gg/characters/chopper/#metal-menace	//swgoh.gg/static/img/assets/tex.ability_chopper_special02.png	8	f	t	1	2	f	t	f	f	f	f	125	\N
398	Maintenance Protocols	//swgoh.gg/characters/chopper/#maintenance-protocols	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	8	f	t	1	4	f	f	f	f	t	f	125	\N
399	Disarming Strike	//swgoh.gg/characters/kanan-jarrus/#disarming-strike	//swgoh.gg/static/img/assets/tex.ability_kanan_s3_basic.png	8	f	t	1	1	t	f	f	f	f	f	151	\N
400	Intervene	//swgoh.gg/characters/kanan-jarrus/#intervene	//swgoh.gg/static/img/assets/tex.ability_kanan_s3_special01.png	8	f	t	1	2	f	t	f	f	f	f	151	\N
401	Total Defense	//swgoh.gg/characters/kanan-jarrus/#total-defense	//swgoh.gg/static/img/assets/tex.ability_kanan_s3_special02.png	8	t	f	1	2	f	t	f	f	f	f	151	\N
402	Clear Mind	//swgoh.gg/characters/kanan-jarrus/#clear-mind	//swgoh.gg/static/img/assets/tex.abilityui_passive_phoenix.png	8	f	t	1	4	f	f	f	f	t	f	151	\N
403	Outwit	//swgoh.gg/characters/hera-syndulla/#outwit	//swgoh.gg/static/img/assets/tex.ability_hera_s3_basic.png	8	f	t	1	1	t	f	f	f	f	f	144	\N
404	Play to Strengths	//swgoh.gg/characters/hera-syndulla/#play-to-strengths	//swgoh.gg/static/img/assets/tex.ability_hera_s3_special01.png	8	t	f	1	2	f	t	f	f	f	f	144	\N
405	Backup Plan	//swgoh.gg/characters/hera-syndulla/#backup-plan	//swgoh.gg/static/img/assets/tex.ability_hera_s3_special02.png	8	f	t	1	2	f	t	f	f	f	f	144	\N
406	Rise Together	//swgoh.gg/characters/hera-syndulla/#rise-together	//swgoh.gg/static/img/assets/tex.abilityui_passive_phoenix.png	8	f	t	1	3	f	f	f	f	f	t	144	\N
407	Strident Strike	//swgoh.gg/characters/pao/#strident-strike	//swgoh.gg/static/img/assets/tex.ability_pao_basic.png	8	f	t	1	1	t	f	f	f	f	f	81	\N
408	Sa'kalla!	//swgoh.gg/characters/pao/#sakalla	//swgoh.gg/static/img/assets/tex.ability_pao_special01.png	8	f	t	1	2	f	t	f	f	f	f	81	\N
409	Sonic Grenade	//swgoh.gg/characters/pao/#sonic-grenade	//swgoh.gg/static/img/assets/tex.ability_pao_special02.png	8	f	t	1	2	f	t	f	f	f	f	81	\N
410	For Pipada	//swgoh.gg/characters/pao/#for-pipada	//swgoh.gg/static/img/assets/tex.abilityui_passive_rebel.png	8	t	f	1	4	f	f	f	f	t	f	81	\N
411	Bash	//swgoh.gg/characters/garazeb-zeb-orrelios/#bash	//swgoh.gg/static/img/assets/tex.ability_zeb_s3_basic.png	8	f	t	1	1	t	f	f	f	f	f	138	\N
412	Staggering Sweep	//swgoh.gg/characters/garazeb-zeb-orrelios/#staggering-sweep	//swgoh.gg/static/img/assets/tex.ability_zeb_s3_special01.png	8	t	f	1	2	f	t	f	f	f	f	138	\N
413	Honor Guard	//swgoh.gg/characters/garazeb-zeb-orrelios/#honor-guard	//swgoh.gg/static/img/assets/tex.ability_zeb_s3_special02.png	8	f	t	1	2	f	t	f	f	f	f	138	\N
414	Shrug Off	//swgoh.gg/characters/garazeb-zeb-orrelios/#shrug-off	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	8	f	t	1	4	f	f	f	f	t	f	138	\N
415	Rushing Strike	//swgoh.gg/characters/ezra-bridger/#rushing-strike	//swgoh.gg/static/img/assets/tex.ability_ezra_s3_basic.png	8	f	t	1	1	t	f	f	f	f	f	132	\N
416	Flourish	//swgoh.gg/characters/ezra-bridger/#flourish	//swgoh.gg/static/img/assets/tex.ability_ezra_s3_special01.png	8	t	f	1	2	f	t	f	f	f	f	132	\N
417	Watch and Learn	//swgoh.gg/characters/ezra-bridger/#watch-and-learn	//swgoh.gg/static/img/assets/tex.ability_ezra_s3_special02.png	8	f	t	1	2	f	t	f	f	f	f	132	\N
418	Push Through	//swgoh.gg/characters/ezra-bridger/#push-through	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	132	\N
419	Blasters Akimbo	//swgoh.gg/characters/sabine-wren/#blasters-akimbo	//swgoh.gg/static/img/assets/tex.ability_sabine_s3_basic.png	8	f	t	1	1	t	f	f	f	f	f	160	\N
420	Darksaber Strike	//swgoh.gg/characters/sabine-wren/#darksaber-strike	//swgoh.gg/static/img/assets/tex.ability_sabine_s3_special01.png	8	f	t	1	2	f	t	f	f	f	f	160	\N
421	Demolish	//swgoh.gg/characters/sabine-wren/#demolish	//swgoh.gg/static/img/assets/tex.ability_sabine_s3_special02.png	8	t	f	1	2	f	t	f	f	f	f	160	\N
422	Take It Back	//swgoh.gg/characters/sabine-wren/#take-it-back	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	f	t	1	4	f	f	f	f	t	f	160	\N
423	Protective Maneuver	//swgoh.gg/characters/ahsoka-tano/#protective-maneuver	//swgoh.gg/static/img/assets/tex.ability_ahsokatanopadawan_special01.png	8	f	t	1	2	f	t	f	f	f	f	116	\N
424	Call Targets	//swgoh.gg/characters/bodhi-rook/#call-targets	//swgoh.gg/static/img/assets/tex.ability_bodhi_basic.png	8	f	t	1	1	t	f	f	f	f	f	12	\N
425	Spotter	//swgoh.gg/characters/bodhi-rook/#spotter	//swgoh.gg/static/img/assets/tex.ability_bodhi_special01.png	8	f	t	1	2	f	t	f	f	f	f	12	\N
426	Intercept Communications	//swgoh.gg/characters/bodhi-rook/#intercept-communications	//swgoh.gg/static/img/assets/tex.ability_bodhi_special02.png	8	f	t	1	2	f	t	f	f	f	f	12	\N
427	Double Duty	//swgoh.gg/characters/bodhi-rook/#double-duty	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	t	f	1	4	f	f	f	f	t	f	12	\N
428	Seize the Advantage	//swgoh.gg/characters/imperial-super-commando/#seize-the-advantage	//swgoh.gg/static/img/assets/tex.ability_imperial_super_commando_basic.png	8	f	t	1	1	t	f	f	f	f	f	146	\N
429	Superior Tactics	//swgoh.gg/characters/imperial-super-commando/#superior-tactics	//swgoh.gg/static/img/assets/tex.ability_imperial_super_commando_special01.png	8	f	t	1	2	f	t	f	f	f	f	146	\N
430	Upper Hand	//swgoh.gg/characters/imperial-super-commando/#upper-hand	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	f	t	1	4	f	f	f	f	t	f	146	\N
431	On the Hunt	//swgoh.gg/characters/gar-saxon/#on-the-hunt	//swgoh.gg/static/img/assets/tex.ability_gar_saxon_basic.png	8	f	t	1	1	t	f	f	f	f	f	137	\N
432	Calculated Ambush	//swgoh.gg/characters/gar-saxon/#calculated-ambush	//swgoh.gg/static/img/assets/tex.ability_gar_saxon_special01.png	8	f	t	1	2	f	t	f	f	f	f	137	\N
433	Viceroy's Vengeance	//swgoh.gg/characters/gar-saxon/#viceroys-vengeance	//swgoh.gg/static/img/assets/tex.abilityui_passive_assist.png	8	f	t	1	4	f	f	f	f	t	f	137	\N
434	Mandalorian Retaliation	//swgoh.gg/characters/gar-saxon/#mandalorian-retaliation	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	3	f	f	f	f	f	t	137	\N
435	Electroshock Prod	//swgoh.gg/characters/r2-d2/#electroshock-prod	//swgoh.gg/static/img/assets/tex.ability_r2d2_basic.png	8	f	t	1	1	t	f	f	f	f	f	87	\N
436	Smoke Screen	//swgoh.gg/characters/r2-d2/#smoke-screen	//swgoh.gg/static/img/assets/tex.ability_r2d2_special01.png	8	f	t	1	2	f	t	f	f	f	f	87	\N
437	Improvise	//swgoh.gg/characters/r2-d2/#improvise	//swgoh.gg/static/img/assets/tex.ability_r2d2_special02.png	8	f	t	1	2	f	t	f	f	f	f	87	\N
438	Combat Analysis	//swgoh.gg/characters/r2-d2/#combat-analysis	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	4	f	f	f	f	t	f	87	\N
439	Number Crunch	//swgoh.gg/characters/r2-d2/#number-crunch	//swgoh.gg/static/img/assets/tex.abilityui_passive_extraturn.png	8	t	f	1	4	f	f	f	f	t	f	87	\N
440	Callous Conviction	//swgoh.gg/characters/grand-moff-tarkin/#callous-conviction	//swgoh.gg/static/img/assets/tex.abilityui_passive_empire.png	8	t	f	1	4	f	f	f	f	t	f	142	\N
441	Balanced Strike	//swgoh.gg/characters/ahsoka-tano-fulcrum/#balanced-strike	//swgoh.gg/static/img/assets/tex.ability_ahsoka_adult_basic.png	8	f	t	1	1	t	f	f	f	f	f	2	\N
442	Meditate	//swgoh.gg/characters/ahsoka-tano-fulcrum/#meditate	//swgoh.gg/static/img/assets/tex.ability_ahsoka_adult_special01.png	8	f	t	1	2	f	t	f	f	f	f	2	\N
443	Whirlwind	//swgoh.gg/characters/ahsoka-tano-fulcrum/#whirlwind	//swgoh.gg/static/img/assets/tex.ability_ahsoka_adult_special02.png	8	t	f	1	2	f	t	f	f	f	f	2	\N
444	Perseverance	//swgoh.gg/characters/ahsoka-tano-fulcrum/#perseverance	//swgoh.gg/static/img/assets/tex.abilityui_passive_rebel.png	8	f	t	1	4	f	f	f	f	t	f	2	\N
445	Manipulate	//swgoh.gg/characters/grand-admiral-thrawn/#manipulate	//swgoh.gg/static/img/assets/tex.ability_thrawn_basic.png	8	f	t	1	1	t	f	f	f	f	f	141	\N
446	Fracture	//swgoh.gg/characters/grand-admiral-thrawn/#fracture	//swgoh.gg/static/img/assets/tex.ability_thrawn_special01.png	8	f	t	1	2	f	t	f	f	f	f	141	\N
447	Grand Admiral's Command	//swgoh.gg/characters/grand-admiral-thrawn/#grand-admirals-command	//swgoh.gg/static/img/assets/tex.ability_thrawn_special02.png	8	f	t	1	2	f	t	f	f	f	f	141	\N
448	Legendary Strategist	//swgoh.gg/characters/grand-admiral-thrawn/#legendary-strategist	//swgoh.gg/static/img/assets/tex.abilityui_passive_empire.png	8	t	f	1	3	f	f	f	f	f	t	141	\N
449	Ebb and Flow	//swgoh.gg/characters/grand-admiral-thrawn/#ebb-and-flow	//swgoh.gg/static/img/assets/tex.abilityui_passive_extraturn.png	8	t	f	1	4	f	f	f	f	t	f	141	\N
450	Mystical Strike	//swgoh.gg/characters/logray/#mystical-strike	//swgoh.gg/static/img/assets/tex.ability_ewok_logray_basic.png	8	f	t	1	1	t	f	f	f	f	f	67	\N
451	Hypnotize	//swgoh.gg/characters/logray/#hypnotize	//swgoh.gg/static/img/assets/tex.ability_ewok_logray_special01.png	8	f	t	1	2	f	t	f	f	f	f	67	\N
452	Prophetic Visions	//swgoh.gg/characters/logray/#prophetic-visions	//swgoh.gg/static/img/assets/tex.ability_ewok_logray_special02.png	8	f	t	1	2	f	t	f	f	f	f	67	\N
453	Shaman's Insight	//swgoh.gg/characters/logray/#shamans-insight	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	4	f	f	f	f	t	f	67	\N
454	Vigilant Strike	//swgoh.gg/characters/paploo/#vigilant-strike	//swgoh.gg/static/img/assets/tex.ability_ewok_paploo_basic.png	8	f	t	1	1	t	f	f	f	f	f	82	\N
455	Diversion	//swgoh.gg/characters/paploo/#diversion	//swgoh.gg/static/img/assets/tex.ability_ewok_paploo_special01.png	8	f	t	1	2	f	t	f	f	f	f	82	\N
456	Galvanize	//swgoh.gg/characters/paploo/#galvanize	//swgoh.gg/static/img/assets/tex.ability_ewok_paploo_special02.png	8	f	t	1	2	f	t	f	f	f	f	82	\N
457	Don't Hold Back	//swgoh.gg/characters/paploo/#dont-hold-back	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	t	f	1	4	f	f	f	f	t	f	82	\N
458	Inquisitive Jab	//swgoh.gg/characters/wicket/#inquisitive-jab	//swgoh.gg/static/img/assets/tex.ability_ewok_wicket_basic.png	8	f	t	1	1	t	f	f	f	f	f	111	\N
459	Forest Ambush	//swgoh.gg/characters/wicket/#forest-ambush	//swgoh.gg/static/img/assets/tex.ability_ewok_wicket_special01.png	8	f	t	1	2	f	t	f	f	f	f	111	\N
460	Guerrilla Strike	//swgoh.gg/characters/wicket/#guerrilla-strike	//swgoh.gg/static/img/assets/tex.ability_ewok_wicket_special02.png	8	f	t	1	2	f	t	f	f	f	f	111	\N
461	Furtive Tactics	//swgoh.gg/characters/wicket/#furtive-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_extraturn.png	8	t	f	1	4	f	f	f	f	t	f	111	\N
462	Devoted Protector	//swgoh.gg/characters/obi-wan-kenobi-old-ben/#devoted-protector	//swgoh.gg/static/img/assets/tex.ability_obiwankenobioldhermit_event01.png	8	t	f	1	2	f	t	f	f	f	f	79	\N
463	Destined Strike	//swgoh.gg/characters/commander-luke-skywalker/#destined-strike	//swgoh.gg/static/img/assets/tex.ability_commanderluke_basic.png	8	f	t	1	1	t	f	f	f	f	f	23	\N
464	Use the Force	//swgoh.gg/characters/commander-luke-skywalker/#use-the-force	//swgoh.gg/static/img/assets/tex.ability_commanderluke_special01.png	8	f	t	1	2	f	t	f	f	f	f	23	\N
465	Call to Action	//swgoh.gg/characters/commander-luke-skywalker/#call-to-action	//swgoh.gg/static/img/assets/tex.ability_commanderluke_special02.png	8	f	t	1	2	f	t	f	f	f	f	23	\N
466	Rebel Maneuvers	//swgoh.gg/characters/commander-luke-skywalker/#rebel-maneuvers	//swgoh.gg/static/img/assets/tex.abilityui_passive_rebel.png	8	t	f	1	3	f	f	f	f	f	t	23	\N
467	Learn Control	//swgoh.gg/characters/commander-luke-skywalker/#learn-control	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	23	\N
468	It Binds All Things	//swgoh.gg/characters/commander-luke-skywalker/#it-binds-all-things	//swgoh.gg/static/img/assets/tex.abilityui_passive_extraturn.png	8	t	f	1	4	f	f	f	f	t	f	23	\N
469	Master's Protection	//swgoh.gg/characters/hermit-yoda/#masters-protection	//swgoh.gg/static/img/assets/tex.ability_hermityoda_basic.png	8	f	t	1	1	t	f	f	f	f	f	48	\N
470	Master's Training	//swgoh.gg/characters/hermit-yoda/#masters-training	//swgoh.gg/static/img/assets/tex.ability_hermityoda_special01.png	8	f	t	1	2	f	t	f	f	f	f	48	\N
471	Strength Flows From the Force	//swgoh.gg/characters/hermit-yoda/#strength-flows-from-the-force	//swgoh.gg/static/img/assets/tex.ability_hermityoda_special02.png	8	t	f	1	2	f	t	f	f	f	f	48	\N
472	In Exile	//swgoh.gg/characters/hermit-yoda/#in-exile	//swgoh.gg/static/img/assets/tex.abilityui_passive_stealth.png	8	f	t	1	4	f	f	f	f	t	f	48	\N
473	Do or Do Not	//swgoh.gg/characters/hermit-yoda/#do-or-do-not	//swgoh.gg/static/img/assets/tex.abilityui_passive_extraturn.png	8	t	f	1	4	f	f	f	f	t	f	48	\N
474	Hold Off	//swgoh.gg/characters/rebel-officer-leia-organa/#hold-off	//swgoh.gg/static/img/assets/tex.ability_leia_hoth_basic.png	8	f	t	1	1	t	f	f	f	f	f	89	\N
475	Rebel Barrage	//swgoh.gg/characters/rebel-officer-leia-organa/#rebel-barrage	//swgoh.gg/static/img/assets/tex.ability_leia_hoth_special01.png	8	f	t	1	2	f	t	f	f	f	f	89	\N
476	Battlefront Command	//swgoh.gg/characters/rebel-officer-leia-organa/#battlefront-command	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	f	t	1	3	f	f	f	f	f	t	89	\N
477	Dauntless	//swgoh.gg/characters/rebel-officer-leia-organa/#dauntless	//swgoh.gg/static/img/assets/tex.abilityui_passive_def_resistance.png	8	t	f	1	4	f	f	f	f	t	f	89	\N
478	Disabling Shot	//swgoh.gg/characters/captain-han-solo/#disabling-shot	//swgoh.gg/static/img/assets/tex.ability_han_hoth_basic.png	8	f	t	1	1	t	f	f	f	f	f	15	\N
479	Hunker Down	//swgoh.gg/characters/captain-han-solo/#hunker-down	//swgoh.gg/static/img/assets/tex.ability_han_hoth_special01.png	8	f	t	1	2	f	t	f	f	f	f	15	\N
480	Search and Rescue	//swgoh.gg/characters/captain-han-solo/#search-and-rescue	//swgoh.gg/static/img/assets/tex.ability_han_hoth_special02.png	8	f	t	1	2	f	t	f	f	f	f	15	\N
481	Nick of Time	//swgoh.gg/characters/captain-han-solo/#nick-of-time	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	4	f	f	f	f	t	f	15	\N
482	Explosive Bolts	//swgoh.gg/characters/veteran-smuggler-chewbacca/#explosive-bolts	//swgoh.gg/static/img/assets/tex.ability_chewbacca_tfa_basic.png	8	f	t	1	1	t	f	f	f	f	f	107	\N
483	Furious Blow	//swgoh.gg/characters/veteran-smuggler-chewbacca/#furious-blow	//swgoh.gg/static/img/assets/tex.ability_chewbacca_tfa_special01.png	8	f	t	1	2	f	t	f	f	f	f	107	\N
484	Partner In Crime	//swgoh.gg/characters/veteran-smuggler-chewbacca/#partner-in-crime	//swgoh.gg/static/img/assets/tex.abilityui_passive_assist.png	8	f	t	1	4	f	f	f	f	t	f	107	\N
485	Let the Wookiee Win	//swgoh.gg/characters/veteran-smuggler-chewbacca/#let-the-wookiee-win	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	4	f	f	f	f	t	f	107	\N
486	Trueshot	//swgoh.gg/characters/veteran-smuggler-han-solo/#trueshot	//swgoh.gg/static/img/assets/tex.ability_han_tfa_basic.png	8	f	t	1	1	t	f	f	f	f	f	108	\N
487	Can I Try That?	//swgoh.gg/characters/veteran-smuggler-han-solo/#can-i-try-that	//swgoh.gg/static/img/assets/tex.ability_han_tfa_special01.png	8	f	t	1	2	f	t	f	f	f	f	108	\N
488	Partner In Crime	//swgoh.gg/characters/veteran-smuggler-han-solo/#partner-in-crime	//swgoh.gg/static/img/assets/tex.abilityui_passive_assist.png	8	f	t	1	4	f	f	f	f	t	f	108	\N
489	Swindle	//swgoh.gg/characters/veteran-smuggler-han-solo/#swindle	//swgoh.gg/static/img/assets/tex.abilityui_passive_supply.png	8	t	f	1	4	f	f	f	f	t	f	108	\N
490	Defensive Fire	//swgoh.gg/ships/kylo-rens-command-shuttle/#defensive-fire	//swgoh.gg/static/img/assets/tex.ability_upsilon_shuttle_kylo_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	23
491	Advanced Jamming Array	//swgoh.gg/ships/kylo-rens-command-shuttle/#advanced-jamming-array	//swgoh.gg/static/img/assets/tex.ability_upsilon_shuttle_kylo_special03.png	8	f	f	2	\N	f	t	f	f	f	f	\N	23
492	Turbolaser Batteries	//swgoh.gg/ships/executrix/#turbolaser-batteries	//swgoh.gg/static/img/assets/tex.ability_stardestroyer_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	10
493	Executive Order	//swgoh.gg/ships/executrix/#executive-order	//swgoh.gg/static/img/assets/tex.ability_stardestroyer_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	10
494	Heavy Ion Cannon	//swgoh.gg/ships/executrix/#heavy-ion-cannon	//swgoh.gg/static/img/assets/tex.ability_stardestroyer_special02.png	8	f	f	2	\N	f	t	f	f	f	f	\N	10
495	Imperial Assault	//swgoh.gg/ships/executrix/#imperial-assault	//swgoh.gg/static/img/assets/tex.ability_stardestroyer_special03.png	8	f	f	2	\N	f	t	f	f	f	f	\N	10
496	L-s1 Laser Cannon	//swgoh.gg/ships/imperial-tie-fighter/#l-s1-laser-cannon	//swgoh.gg/static/img/assets/tex.ability_tiefighter_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	21
497	T-s8 Targeting Computer	//swgoh.gg/ships/imperial-tie-fighter/#t-s8-targeting-computer	//swgoh.gg/static/img/assets/tex.ability_tiefighter_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	21
498	Republic Defender	//swgoh.gg/ships/jedi-consulars-starfighter/#republic-defender	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	22
499	Guarded Assault	//swgoh.gg/ships/jedi-consulars-starfighter/#guarded-assault	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	22
500	Coordinated Assault	//swgoh.gg/ships/plo-koons-jedi-starfighter/#coordinated-assault	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_bladeofdorin_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	26
501	Wings of the Republic	//swgoh.gg/ships/plo-koons-jedi-starfighter/#wings-of-the-republic	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_bladeofdorin_special02.png	8	f	f	2	\N	f	t	f	f	f	f	\N	26
502	Gauntlet Assault	//swgoh.gg/ships/gauntlet-starfighter/#gauntlet-assault	//swgoh.gg/static/img/assets/tex.ability_gauntlet_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	13
503	Superior Maneuverability	//swgoh.gg/ships/gauntlet-starfighter/#superior-maneuverability	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	f	2	\N	f	f	f	f	t	f	\N	13
504	Deadly Accuracy	//swgoh.gg/ships/tie-advanced-x1/#deadly-accuracy	//swgoh.gg/static/img/assets/tex.ability_tieadvanced_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	35
505	Advanced Targeting System	//swgoh.gg/ships/tie-advanced-x1/#advanced-targeting-system	//swgoh.gg/static/img/assets/tex.abilityui_passive_targetlock.png	8	f	f	2	\N	f	f	f	f	t	f	\N	35
506	Rotating Twin Blaster Cannons	//swgoh.gg/ships/slave-i/#rotating-twin-blaster-cannons	//swgoh.gg/static/img/assets/tex.ability_slave1_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	33
507	Seismic Charge	//swgoh.gg/ships/slave-i/#seismic-charge	//swgoh.gg/static/img/assets/tex.ability_slave1_special02.png	8	f	f	2	\N	f	t	f	f	f	f	\N	33
508	Hot Pursuit	//swgoh.gg/ships/resistance-x-wing/#hot-pursuit	//swgoh.gg/static/img/assets/tex.ability_xwing_resistance_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	28
509	Disarray	//swgoh.gg/ships/resistance-x-wing/#disarray	//swgoh.gg/static/img/assets/tex.ability_xwing_resistance_special02.png	8	f	f	2	\N	f	t	f	f	f	f	\N	28
510	Trailblazer	//swgoh.gg/ships/cassians-u-wing/#trailblazer	//swgoh.gg/static/img/assets/tex.ability_uwing_hero_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	6
511	Avoid Contact	//swgoh.gg/ships/cassians-u-wing/#avoid-contact	//swgoh.gg/static/img/assets/tex.abilityui_passive_critimmunity.png	8	f	f	2	\N	f	f	f	f	t	f	\N	6
512	Hair Trigger	//swgoh.gg/ships/rexs-arc-170/#hair-trigger	//swgoh.gg/static/img/assets/tex.ability_arc170_rex_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	29
513	Ready and Able	//swgoh.gg/ships/rexs-arc-170/#ready-and-able	//swgoh.gg/static/img/assets/tex.shipability_passive_shield.png	8	f	f	2	\N	f	f	f	f	t	f	\N	29
514	Wing Cannons	//swgoh.gg/ships/clone-sergeants-arc-170/#wing-cannons	//swgoh.gg/static/img/assets/tex.ability_arc170_clonesergeant_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	8
515	Overcharge	//swgoh.gg/ships/clone-sergeants-arc-170/#overcharge	//swgoh.gg/static/img/assets/tex.ability_arc170_clonesergeant_special02.png	8	f	f	2	\N	f	t	f	f	f	f	\N	8
516	Undermine	//swgoh.gg/ships/geonosian-spys-starfighter/#undermine	//swgoh.gg/static/img/assets/tex.ability_geonosis_fighter_spy_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	15
517	Clandestine Operations	//swgoh.gg/ships/geonosian-spys-starfighter/#clandestine-operations	//swgoh.gg/static/img/assets/tex.abilityui_passive_cloak.png	8	f	f	2	\N	f	f	f	f	t	f	\N	15
518	Front Line	//swgoh.gg/ships/geonosian-soldiers-starfighter/#front-line	//swgoh.gg/static/img/assets/tex.ability_geonosis_fighter_soldier_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	14
519	Swarm Aggression	//swgoh.gg/ships/geonosian-soldiers-starfighter/#swarm-aggression	//swgoh.gg/static/img/assets/tex.abilityui_passive_assist.png	8	f	f	2	\N	f	f	f	f	t	f	\N	14
520	Air Superiority	//swgoh.gg/ships/sun-facs-geonosian-starfighter/#air-superiority	//swgoh.gg/static/img/assets/tex.ability_geonosis_fighter_sunfac_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	34
521	Grudge	//swgoh.gg/ships/sun-facs-geonosian-starfighter/#grudge	//swgoh.gg/static/img/assets/tex.abilityui_passive_def_resistance.png	8	f	f	2	\N	f	f	f	f	t	f	\N	34
522	Slip Away	//swgoh.gg/ships/phantom-ii/#slip-away	//swgoh.gg/static/img/assets/tex.ability_phantom2_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	25
523	Distraction Tactics	//swgoh.gg/ships/phantom-ii/#distraction-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	8	f	f	2	\N	f	f	f	f	t	f	\N	25
524	Strike True	//swgoh.gg/ships/endurance/#strike-true	//swgoh.gg/static/img/assets/tex.ability_venator_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	9
525	Hold Fast	//swgoh.gg/ships/endurance/#hold-fast	//swgoh.gg/static/img/assets/tex.ability_venator_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	9
526	Fortune Favors the Bold	//swgoh.gg/ships/endurance/#fortune-favors-the-bold	//swgoh.gg/static/img/assets/tex.ability_venator_special02.png	8	f	f	2	\N	f	t	f	f	f	f	\N	9
527	Honor and Might	//swgoh.gg/ships/endurance/#honor-and-might	//swgoh.gg/static/img/assets/tex.abilityui_passive_jedi.png	8	f	f	2	\N	f	f	f	f	t	f	\N	9
528	MS-2B Twin Laser Cannon	//swgoh.gg/ships/ghost/#ms-2b-twin-laser-cannon	//swgoh.gg/static/img/assets/tex.ability_ghost_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	16
529	Sensor Scrambler	//swgoh.gg/ships/ghost/#sensor-scrambler	//swgoh.gg/static/img/assets/tex.abilityui_passive_potency.png	8	f	f	2	\N	f	f	f	f	t	f	\N	16
530	Opening Move	//swgoh.gg/ships/bistans-u-wing/#opening-move	//swgoh.gg/static/img/assets/tex.ability_uwing_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	5
531	Tactical Comms	//swgoh.gg/ships/bistans-u-wing/#tactical-comms	//swgoh.gg/static/img/assets/tex.abilityui_passive_scanner.png	8	f	f	2	\N	f	f	f	f	t	f	\N	5
532	Target Acquired	//swgoh.gg/ships/first-order-tie-fighter/#target-acquired	//swgoh.gg/static/img/assets/tex.ability_firstorder_tiefighter_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	12
533	Relentless Pursuit	//swgoh.gg/ships/first-order-tie-fighter/#relentless-pursuit	//swgoh.gg/static/img/assets/tex.abilityui_passive_targetlock.png	8	f	f	2	\N	f	f	f	f	t	f	\N	12
534	Hit the Mark	//swgoh.gg/ships/biggs-darklighters-x-wing/#hit-the-mark	//swgoh.gg/static/img/assets/tex.ability_xwing_red3_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	4
535	Daring Assault	//swgoh.gg/ships/biggs-darklighters-x-wing/#daring-assault	//swgoh.gg/static/img/assets/tex.abilityui_passive_targetlock.png	8	f	f	2	\N	f	f	f	f	t	f	\N	4
536	KX9 Laser Cannons	//swgoh.gg/ships/wedge-antilless-x-wing/#kx9-laser-cannons	//swgoh.gg/static/img/assets/tex.ability_xwing_red2_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	39
537	Lead the Way	//swgoh.gg/ships/wedge-antilless-x-wing/#lead-the-way	//swgoh.gg/static/img/assets/tex.abilityui_passive_assist.png	8	f	f	2	\N	f	f	f	f	t	f	\N	39
538	Dread Cannons	//swgoh.gg/ships/scimitar/#dread-cannons	//swgoh.gg/static/img/assets/tex.ability_sithinfiltrator_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	31
539	Lurking Threat	//swgoh.gg/ships/scimitar/#lurking-threat	//swgoh.gg/static/img/assets/tex.ability_sithinfiltrator_special02.png	8	f	f	2	\N	f	f	f	f	t	f	\N	31
540	Defensive Battery	//swgoh.gg/ships/tie-reaper/#defensive-battery	//swgoh.gg/static/img/assets/tex.ability_tiereaper_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	36
541	Grim Voyage	//swgoh.gg/ships/tie-reaper/#grim-voyage	//swgoh.gg/static/img/assets/tex.abilityui_passive_kill.png	8	f	f	2	\N	f	f	f	f	t	f	\N	36
542	Plasma Weapons	//swgoh.gg/ships/umbaran-starfighter/#plasma-weapons	//swgoh.gg/static/img/assets/tex.ability_umbaran_star_fighter_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	38
543	Reckless Piloting	//swgoh.gg/ships/umbaran-starfighter/#reckless-piloting	//swgoh.gg/static/img/assets/tex.ability_passive_thruster.png	8	f	f	2	\N	f	f	f	f	t	f	\N	38
544	Quad Laser	//swgoh.gg/ships/reys-millennium-falcon/#quad-laser	//swgoh.gg/static/img/assets/tex.ability_mfalcon_VII_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	30
545	Against the Odds	//swgoh.gg/ships/reys-millennium-falcon/#against-the-odds	//swgoh.gg/static/img/assets/tex.abilityui_passive_targetlock.png	8	f	f	2	\N	f	f	f	f	t	f	\N	30
546	Reflexive Shot	//swgoh.gg/ships/ahsoka-tanos-jedi-starfighter/#reflexive-shot	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_ahsoka_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	1
547	Shut Down	//swgoh.gg/ships/ahsoka-tanos-jedi-starfighter/#shut-down	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_ahsoka_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	1
548	Cover All Angles	//swgoh.gg/ships/poe-damerons-x-wing/#cover-all-angles	//swgoh.gg/static/img/assets/tex.ability_xwing_blackone_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	27
549	Bolt from the Blue	//swgoh.gg/ships/poe-damerons-x-wing/#bolt-from-the-blue	//swgoh.gg/static/img/assets/tex.ability_xwing_blackone_special02.png	8	f	f	2	\N	f	t	f	f	f	f	\N	27
550	Mon Cal Cannons	//swgoh.gg/ships/home-one/#mon-cal-cannons	//swgoh.gg/static/img/assets/tex.ability_moncalamarilibertycruiser_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	18
551	Seize the Advantage	//swgoh.gg/ships/home-one/#seize-the-advantage	//swgoh.gg/static/img/assets/tex.ability_moncalamarilibertycruiser_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	18
552	Defiant Volley	//swgoh.gg/ships/home-one/#defiant-volley	//swgoh.gg/static/img/assets/tex.ability_moncalamarilibertycruiser_special02.png	8	f	f	2	\N	f	t	f	f	f	f	\N	18
553	Master Plan	//swgoh.gg/ships/home-one/#master-plan	//swgoh.gg/static/img/assets/tex.ability_moncalamarilibertycruiser_special03.png	8	f	f	2	\N	f	t	f	f	f	f	\N	18
554	Surprise Raid	//swgoh.gg/characters/kylo-ren/#surprise-raid	//swgoh.gg/static/img/assets/tex.ability_upsilon_shuttle_kylo_special01.png	8	f	f	1	5	f	t	f	f	f	f	152	\N
555	Strike Team	//swgoh.gg/characters/captain-phasma/#strike-team	//swgoh.gg/static/img/assets/tex.ability_upsilon_shuttle_kylo_special02.png	8	f	f	1	5	f	t	f	f	f	f	122	\N
556	Zeal of the First Order	//swgoh.gg/characters/first-order-stormtrooper/#zeal-of-the-first-order	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	f	1	5	f	f	f	f	t	f	135	\N
557	Victory at All Costs	//swgoh.gg/characters/grand-moff-tarkin/#victory-at-all-costs	//swgoh.gg/static/img/assets/tex.abilityui_passive_empire.png	8	f	f	1	5	f	f	f	f	t	f	142	\N
558	Control Thrusters	//swgoh.gg/characters/tie-fighter-pilot/#control-thrusters	//swgoh.gg/static/img/assets/tex.ability_tiefighter_special02.png	8	f	f	1	5	f	f	f	f	t	f	166	\N
559	Stabilize	//swgoh.gg/characters/jedi-consular/#stabilize	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_special02.png	8	f	f	1	5	f	t	f	f	f	f	147	\N
560	Inspiring Charge	//swgoh.gg/characters/plo-koon/#inspiring-charge	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_bladeofdorin_special01.png	8	f	f	1	5	f	t	f	f	f	f	156	\N
561	Reinvigorate	//swgoh.gg/characters/gar-saxon/#reinvigorate	//swgoh.gg/static/img/assets/tex.ability_gauntlet_special01.png	8	f	f	1	5	f	t	f	f	f	f	137	\N
562	Proton Missile Launcher	//swgoh.gg/characters/imperial-super-commando/#proton-missile-launcher	//swgoh.gg/static/img/assets/tex.ability_gauntlet_special02.png	8	f	f	1	5	f	t	f	f	f	f	146	\N
563	I Have You Now	//swgoh.gg/characters/darth-vader/#i-have-you-now	//swgoh.gg/static/img/assets/tex.ability_tieadvanced_special01.png	8	f	f	1	5	f	t	f	f	f	f	130	\N
564	Proton Torpedoes	//swgoh.gg/characters/boba-fett/#proton-torpedoes	//swgoh.gg/static/img/assets/tex.ability_slave1_special01.png	8	f	f	1	5	f	t	f	f	f	f	119	\N
565	I'm On It!	//swgoh.gg/characters/resistance-pilot/#im-on-it	//swgoh.gg/static/img/assets/tex.ability_xwing_resistance_special01.png	8	f	f	1	5	f	t	f	f	f	f	158	\N
566	Guerilla Strike	//swgoh.gg/characters/cassian-andor/#guerilla-strike	//swgoh.gg/static/img/assets/tex.ability_uwing_hero_special02.png	8	f	f	1	5	f	t	f	f	f	f	123	\N
567	Infiltration Tactics	//swgoh.gg/characters/jyn-erso/#infiltration-tactics	//swgoh.gg/static/img/assets/tex.ability_uwing_hero_special03.png	8	f	f	1	5	f	t	f	f	f	f	149	\N
568	Threat Assessment	//swgoh.gg/characters/k-2so/#threat-assessment	//swgoh.gg/static/img/assets/tex.ability_uwing_hero_special01.png	8	f	f	1	5	f	t	f	f	f	f	150	\N
569	Republic Coordination	//swgoh.gg/characters/ct-7567-rex/#republic-coordination	//swgoh.gg/static/img/assets/tex.ability_arc170_rex_special01.png	8	f	f	1	5	f	t	f	f	f	f	128	\N
570	Torpedo Strike	//swgoh.gg/characters/clone-sergeant-phase-i/#torpedo-strike	//swgoh.gg/static/img/assets/tex.ability_arc170_clonesergeant_special01.png	8	f	f	1	5	f	t	f	f	f	f	126	\N
571	Surprise Shot	//swgoh.gg/characters/geonosian-spy/#surprise-shot	//swgoh.gg/static/img/assets/tex.ability_geonosis_fighter_spy_special01.png	8	f	f	1	5	f	t	f	f	f	f	140	\N
572	Separatist Assault	//swgoh.gg/characters/geonosian-soldier/#separatist-assault	//swgoh.gg/static/img/assets/tex.ability_geonosis_fighter_soldier_special01.png	8	f	f	1	5	f	t	f	f	f	f	139	\N
573	Prime Target	//swgoh.gg/characters/sun-fac/#prime-target	//swgoh.gg/static/img/assets/tex.ability_geonosis_fighter_sunfac_special01.png	8	f	f	1	5	f	t	f	f	f	f	165	\N
574	Sights Locked	//swgoh.gg/characters/sabine-wren/#sights-locked	//swgoh.gg/static/img/assets/tex.ability_phantom2_special01.png	8	f	f	1	5	f	t	f	f	f	f	160	\N
575	Maximum Impact	//swgoh.gg/characters/ezra-bridger/#maximum-impact	//swgoh.gg/static/img/assets/tex.ability_phantom2_special02.png	8	f	f	1	5	f	t	f	f	f	f	132	\N
576	Convergence	//swgoh.gg/characters/mace-windu/#convergence	//swgoh.gg/static/img/assets/tex.ability_venator_special03.png	8	f	f	1	5	f	t	f	f	f	f	155	\N
577	Static Jammer	//swgoh.gg/characters/hera-syndulla/#static-jammer	//swgoh.gg/static/img/assets/tex.ability_ghost_special01.png	8	f	f	1	5	f	t	f	f	f	f	144	\N
578	Attack All Angles	//swgoh.gg/characters/kanan-jarrus/#attack-all-angles	//swgoh.gg/static/img/assets/tex.ability_ghost_special02.png	8	f	f	1	5	f	t	f	f	f	f	151	\N
579	Take 'em Down	//swgoh.gg/characters/garazeb-zeb-orrelios/#take-em-down	//swgoh.gg/static/img/assets/tex.ability_ghost_special03.png	8	f	f	1	5	f	t	f	f	f	f	138	\N
580	Scouting Mission	//swgoh.gg/characters/bistan/#scouting-mission	//swgoh.gg/static/img/assets/tex.ability_uwing_special01.png	8	f	f	1	5	f	t	f	f	f	f	118	\N
581	Assault Plan	//swgoh.gg/characters/scarif-rebel-pathfinder/#assault-plan	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	f	1	5	f	f	f	f	t	f	161	\N
582	Strafe	//swgoh.gg/characters/first-order-tie-pilot/#strafe	//swgoh.gg/static/img/assets/tex.ability_firstorder_tiefighter_special01.png	8	f	f	1	5	f	t	f	f	f	f	136	\N
583	Academy Maneuver	//swgoh.gg/characters/biggs-darklighter/#academy-maneuver	//swgoh.gg/static/img/assets/tex.ability_xwing_red3_special01.png	8	f	f	1	5	f	t	f	f	f	f	117	\N
584	Eyes on the Breach	//swgoh.gg/characters/wedge-antilles/#eyes-on-the-breach	//swgoh.gg/static/img/assets/tex.ability_xwing_red2_special01.png	8	f	f	1	5	f	t	f	f	f	f	167	\N
585	Slip Through	//swgoh.gg/characters/darth-maul/#slip-through	//swgoh.gg/static/img/assets/tex.ability_sithinfiltrator_special01.png	8	f	f	1	5	f	t	f	f	f	f	129	\N
586	Heavy Interference	//swgoh.gg/characters/death-trooper/#heavy-interference	//swgoh.gg/static/img/assets/tex.ability_tiereaper_special01.png	8	f	f	1	5	f	t	f	f	f	f	131	\N
587	Imperial Support	//swgoh.gg/characters/shoretrooper/#imperial-support	//swgoh.gg/static/img/assets/tex.ability_tiereaper_special02.png	8	f	f	1	5	f	t	f	f	f	f	162	\N
588	Umbaran Missile Pods	//swgoh.gg/characters/ct-5555-fives/#umbaran-missile-pods	//swgoh.gg/static/img/assets/tex.ability_umbaran_star_fighter_special01.png	8	f	f	1	5	f	t	f	f	f	f	127	\N
589	Thrust Reversal	//swgoh.gg/characters/rey-scavenger/#thrust-reversal	//swgoh.gg/static/img/assets/tex.ability_mfalcon_VII_special02.png	8	f	f	1	5	f	t	f	f	f	f	159	\N
590	Gambit	//swgoh.gg/characters/finn/#gambit	//swgoh.gg/static/img/assets/tex.ability_mfalcon_VII_special01.png	8	f	f	1	5	f	t	f	f	f	f	133	\N
591	Turnabout	//swgoh.gg/characters/ahsoka-tano/#turnabout	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_ahsoka_special02.png	8	f	f	1	5	f	t	f	f	f	f	116	\N
592	Perfect Shot	//swgoh.gg/characters/poe-dameron/#perfect-shot	//swgoh.gg/static/img/assets/tex.ability_xwing_blackone_special01.png	8	f	f	1	5	f	t	f	f	f	f	157	\N
593	Band Together	//swgoh.gg/characters/admiral-ackbar/#band-together	//swgoh.gg/static/img/assets/tex.abilityui_passive_rebel.png	8	f	f	1	5	f	f	f	f	t	f	115	\N
594	Arc Welder	//swgoh.gg/characters/bb-8/#arc-welder	//swgoh.gg/static/img/assets/tex.ability_bb8_tfa_basic.png	8	f	t	1	1	t	f	f	f	f	f	11	\N
595	Covert Data Transfer	//swgoh.gg/characters/bb-8/#covert-data-transfer	//swgoh.gg/static/img/assets/tex.ability_bb8_tfa_special01.png	8	f	t	1	2	f	t	f	f	f	f	11	\N
596	Illuminated Destiny	//swgoh.gg/characters/bb-8/#illuminated-destiny	//swgoh.gg/static/img/assets/tex.ability_bb8_tfa_special02.png	8	f	t	1	2	f	t	f	f	f	f	11	\N
597	Roll with the Punches	//swgoh.gg/characters/bb-8/#roll-with-the-punches	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	11	\N
598	Self-Preservation Protocol	//swgoh.gg/characters/bb-8/#self-preservation-protocol	//swgoh.gg/static/img/assets/tex.abilityui_passive_foresight.png	8	t	f	1	4	f	f	f	f	t	f	11	\N
599	Calculated Strike	//swgoh.gg/ships/chimaera/#calculated-strike	//swgoh.gg/static/img/assets/tex.ability_chimaera_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	7
600	Art of War	//swgoh.gg/ships/chimaera/#art-of-war	//swgoh.gg/static/img/assets/tex.ability_chimaera_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	7
601	Fierce Loyalty	//swgoh.gg/ships/chimaera/#fierce-loyalty	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	f	f	2	\N	f	f	f	f	t	f	\N	7
602	Strategic Dominance	//swgoh.gg/characters/grand-admiral-thrawn/#strategic-dominance	//swgoh.gg/static/img/assets/tex.ability_chimaera_special03.png	8	f	f	1	5	f	t	f	f	f	f	141	\N
603	Ichor Lightning	//swgoh.gg/characters/mother-talzin/#ichor-lightning	//swgoh.gg/static/img/assets/tex.ability_nightsisters_talzin_basic.png	8	f	t	1	1	t	f	f	f	f	f	73	\N
604	Dark Magick	//swgoh.gg/characters/mother-talzin/#dark-magick	//swgoh.gg/static/img/assets/tex.ability_nightsisters_talzin_special01.png	8	f	t	1	2	f	t	f	f	f	f	73	\N
605	Spirit Blade Assault	//swgoh.gg/characters/mother-talzin/#spirit-blade-assault	//swgoh.gg/static/img/assets/tex.ability_nightsisters_talzin_special02.png	8	f	t	1	2	f	t	f	f	f	f	73	\N
606	Plaguebearer	//swgoh.gg/characters/mother-talzin/#plaguebearer	//swgoh.gg/static/img/assets/tex.abilityui_passive_plague.png	8	t	f	1	4	f	f	f	f	t	f	73	\N
607	The Great Mother	//swgoh.gg/characters/mother-talzin/#the-great-mother	//swgoh.gg/static/img/assets/tex.abilityui_passive_potency.png	8	t	f	1	3	f	f	f	f	f	t	73	\N
608	Nightsister Retaliation	//swgoh.gg/characters/nightsister-initiate/#nightsister-retaliation	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	75	\N
609	Blight Touch	//swgoh.gg/characters/nightsister-zombie/#blight-touch	//swgoh.gg/static/img/assets/tex.ability_nightsisters_zombie_basic.png	8	f	t	1	1	t	f	f	f	f	f	77	\N
610	Feed	//swgoh.gg/characters/nightsister-zombie/#feed	//swgoh.gg/static/img/assets/tex.ability_nightsisters_zombie_special01.png	8	f	t	1	2	f	t	f	f	f	f	77	\N
611	Endless Horde	//swgoh.gg/characters/nightsister-zombie/#endless-horde	//swgoh.gg/static/img/assets/tex.abilityui_passive_zombie.png	8	f	t	1	4	f	f	f	f	t	f	77	\N
612	Spectral Embrace	//swgoh.gg/characters/nightsister-spirit/#spectral-embrace	//swgoh.gg/static/img/assets/tex.ability_nightsisters_wraith_basic.png	8	f	t	1	1	t	f	f	f	f	f	76	\N
613	Possess	//swgoh.gg/characters/nightsister-spirit/#possess	//swgoh.gg/static/img/assets/tex.ability_nightsisters_wraith_special01.png	8	f	t	1	2	f	t	f	f	f	f	76	\N
614	Malevolent Spirit	//swgoh.gg/characters/nightsister-spirit/#malevolent-spirit	//swgoh.gg/static/img/assets/tex.abilityui_passive_foresight.png	8	f	t	1	4	f	f	f	f	t	f	76	\N
615	Aggressive Strike	//swgoh.gg/characters/kylo-ren-unmasked/#aggressive-strike	//swgoh.gg/static/img/assets/tex.ability_kylo_unmasked_basic.png	8	f	t	1	1	t	f	f	f	f	f	153	\N
616	Halt	//swgoh.gg/characters/kylo-ren-unmasked/#halt	//swgoh.gg/static/img/assets/tex.ability_kylo_unmasked_special01.png	8	f	t	1	2	f	t	f	f	f	f	153	\N
617	Focused Rage	//swgoh.gg/characters/kylo-ren-unmasked/#focused-rage	//swgoh.gg/static/img/assets/tex.ability_kylo_unmasked_special02.png	8	f	t	1	2	f	t	f	f	f	f	153	\N
618	Merciless Pursuit	//swgoh.gg/characters/kylo-ren-unmasked/#merciless-pursuit	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	3	f	f	f	f	f	t	153	\N
619	Scarred	//swgoh.gg/characters/kylo-ren-unmasked/#scarred	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	153	\N
620	Reciprocation	//swgoh.gg/characters/first-order-sf-tie-pilot/#reciprocation	//swgoh.gg/static/img/assets/tex.ability_firstorder_pilot_basic.png	8	f	t	1	1	t	f	f	f	f	f	134	\N
621	Drumfire	//swgoh.gg/characters/first-order-sf-tie-pilot/#drumfire	//swgoh.gg/static/img/assets/tex.ability_firstorder_pilot_special01.png	8	f	t	1	2	f	t	f	f	f	f	134	\N
622	Oppressive Burst	//swgoh.gg/characters/first-order-sf-tie-pilot/#oppressive-burst	//swgoh.gg/static/img/assets/tex.ability_firstorder_pilot_special02.png	8	f	t	1	2	f	t	f	f	f	f	134	\N
623	L-s9.6 Laser Cannons	//swgoh.gg/ships/first-order-sf-tie-fighter/#l-s96-laser-cannons	//swgoh.gg/static/img/assets/tex.ability_fosf_tiefighter_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	11
624	Double Offensive	//swgoh.gg/ships/first-order-sf-tie-fighter/#double-offensive	//swgoh.gg/static/img/assets/tex.ability_fosf_tiefighter_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	11
625	Disruptive Advance	//swgoh.gg/ships/tie-silencer/#disruptive-advance	//swgoh.gg/static/img/assets/tex.ability_tiesilencer_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	37
626	Overwhelming Advantage	//swgoh.gg/ships/tie-silencer/#overwhelming-advantage	//swgoh.gg/static/img/assets/tex.ability_tiesilencer_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	37
627	Concussion Missile	//swgoh.gg/characters/first-order-sf-tie-pilot/#concussion-missile	//swgoh.gg/static/img/assets/tex.ability_fosf_tiefighter_special02.png	8	f	f	1	5	f	t	f	f	f	f	134	\N
628	Frenzied Rage	//swgoh.gg/characters/kylo-ren-unmasked/#frenzied-rage	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	f	f	1	5	f	f	f	f	t	f	153	\N
629	Debilitating Shot	//swgoh.gg/characters/colonel-starck/#debilitating-shot	//swgoh.gg/static/img/assets/tex.ability_colonel_starck_basic.png	8	f	t	1	1	t	f	f	f	f	f	22	\N
630	Scan All Wavelengths	//swgoh.gg/characters/colonel-starck/#scan-all-wavelengths	//swgoh.gg/static/img/assets/tex.ability_colonel_starck_special01.png	8	f	t	1	2	f	t	f	f	f	f	22	\N
631	Blizzard Four Barrage	//swgoh.gg/characters/colonel-starck/#blizzard-four-barrage	//swgoh.gg/static/img/assets/tex.ability_colonel_starck_special02.png	8	f	t	1	2	f	t	f	f	f	f	22	\N
632	Imperial Intelligence	//swgoh.gg/characters/colonel-starck/#imperial-intelligence	//swgoh.gg/static/img/assets/tex.abilityui_passive_empire.png	8	t	f	1	4	f	f	f	f	t	f	22	\N
633	Precision Blasters	//swgoh.gg/characters/imperial-probe-droid/#precision-blasters	//swgoh.gg/static/img/assets/tex.ability_probedroid_basic.png	8	f	t	1	1	t	f	f	f	f	f	55	\N
634	Detect	//swgoh.gg/characters/imperial-probe-droid/#detect	//swgoh.gg/static/img/assets/tex.ability_probedroid_special01.png	8	f	t	1	2	f	t	f	f	f	f	55	\N
635	Self-Destruct	//swgoh.gg/characters/imperial-probe-droid/#self-destruct	//swgoh.gg/static/img/assets/tex.ability_probedroid_special02.png	8	f	t	1	2	f	t	f	f	f	f	55	\N
636	Imperial Logistics	//swgoh.gg/characters/imperial-probe-droid/#imperial-logistics	//swgoh.gg/static/img/assets/tex.abilityui_passive_empire.png	8	t	f	1	4	f	f	f	f	t	f	55	\N
637	Womp!	//swgoh.gg/characters/wampa/#womp	//swgoh.gg/static/img/assets/tex.ability_wampa_basic.png	8	f	t	1	1	t	f	f	f	f	f	110	\N
638	Icebreaker	//swgoh.gg/characters/wampa/#icebreaker	//swgoh.gg/static/img/assets/tex.ability_wampa_special01.png	8	f	t	1	2	f	t	f	f	f	f	110	\N
639	Furious Foe	//swgoh.gg/characters/wampa/#furious-foe	//swgoh.gg/static/img/assets/tex.ability_wampa_special02.png	8	t	f	1	2	f	t	f	f	f	f	110	\N
640	Howling Rage	//swgoh.gg/characters/wampa/#howling-rage	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	110	\N
641	Cornered Beast	//swgoh.gg/characters/wampa/#cornered-beast	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	110	\N
642	Connected Strikes	//swgoh.gg/characters/rey-jedi-training/#connected-strikes	//swgoh.gg/static/img/assets/tex.ability_rey_tlj_basic.png	8	f	t	1	1	t	f	f	f	f	f	91	\N
643	Defiant Slash	//swgoh.gg/characters/rey-jedi-training/#defiant-slash	//swgoh.gg/static/img/assets/tex.ability_rey_tlj_special01.png	8	f	t	1	2	f	t	f	f	f	f	91	\N
644	Mind Trick	//swgoh.gg/characters/rey-jedi-training/#mind-trick	//swgoh.gg/static/img/assets/tex.ability_rey_tlj_special02.png	8	f	t	1	2	f	t	f	f	f	f	91	\N
645	Inspirational Presence	//swgoh.gg/characters/rey-jedi-training/#inspirational-presence	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	3	f	f	f	f	f	t	91	\N
646	Virtuous Protector	//swgoh.gg/characters/rey-jedi-training/#virtuous-protector	//swgoh.gg/static/img/assets/tex.abilityui_passive_extraturn.png	8	t	f	1	4	f	f	f	f	t	f	91	\N
647	Insight	//swgoh.gg/characters/rey-jedi-training/#insight	//swgoh.gg/static/img/assets/tex.abilityui_passive_foresight.png	8	t	f	1	4	f	f	f	f	t	f	91	\N
648	Judgment	//swgoh.gg/characters/first-order-executioner/#judgment	//swgoh.gg/static/img/assets/tex.ability_firstorder_executioner_basic.png	8	f	t	1	1	t	f	f	f	f	f	40	\N
649	Death Sentence	//swgoh.gg/characters/first-order-executioner/#death-sentence	//swgoh.gg/static/img/assets/tex.ability_firstorder_executioner_special01.png	8	f	t	1	2	f	t	f	f	f	f	40	\N
650	Total Order	//swgoh.gg/characters/first-order-executioner/#total-order	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	8	f	t	1	4	f	f	f	f	t	f	40	\N
651	Measured Shot	//swgoh.gg/characters/amilyn-holdo/#measured-shot	//swgoh.gg/static/img/assets/tex.ability_holdo_basic.png	8	f	t	1	1	t	f	f	f	f	f	3	\N
652	Bunker Buster	//swgoh.gg/characters/amilyn-holdo/#bunker-buster	//swgoh.gg/static/img/assets/tex.ability_holdo_special01.png	8	f	t	1	2	f	t	f	f	f	f	3	\N
653	Reprieve	//swgoh.gg/characters/amilyn-holdo/#reprieve	//swgoh.gg/static/img/assets/tex.ability_holdo_special02.png	8	f	t	1	2	f	t	f	f	f	f	3	\N
654	Quiet Confidence	//swgoh.gg/characters/amilyn-holdo/#quiet-confidence	//swgoh.gg/static/img/assets/tex.abilityui_passive_uniqueability.png	8	t	f	1	4	f	f	f	f	t	f	3	\N
655	Courageous Shot	//swgoh.gg/characters/rose-tico/#courageous-shot	//swgoh.gg/static/img/assets/tex.ability_rose_basic.png	8	f	t	1	1	t	f	f	f	f	f	92	\N
656	Dauntless Bravery	//swgoh.gg/characters/rose-tico/#dauntless-bravery	//swgoh.gg/static/img/assets/tex.ability_rose_special01.png	8	f	t	1	2	f	t	f	f	f	f	92	\N
657	Shock Prod Strike	//swgoh.gg/characters/rose-tico/#shock-prod-strike	//swgoh.gg/static/img/assets/tex.ability_rose_special02.png	8	f	t	1	2	f	t	f	f	f	f	92	\N
658	Valiant Spirit	//swgoh.gg/characters/rose-tico/#valiant-spirit	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	4	f	f	f	f	t	f	92	\N
659	No Escape	//swgoh.gg/characters/darth-vader/#no-escape	//swgoh.gg/static/img/assets/tex.abilityui_passive_darthvader.png	8	t	f	1	4	f	f	f	f	t	f	130	\N
660	Strength Through Passion	//swgoh.gg/characters/sith-marauder/#strength-through-passion	//swgoh.gg/static/img/assets/tex.ability_sithmarauder_basic.png	8	f	t	1	1	t	f	f	f	f	f	164	\N
661	Victory Through Power	//swgoh.gg/characters/sith-marauder/#victory-through-power	//swgoh.gg/static/img/assets/tex.ability_sithmarauder_special01.png	8	f	t	1	2	f	t	f	f	f	f	164	\N
662	The Force Shall Free Me	//swgoh.gg/characters/sith-marauder/#the-force-shall-free-me	//swgoh.gg/static/img/assets/tex.abilityui_passive_uniqueability.png	8	f	t	1	4	f	f	f	f	t	f	164	\N
663	Dark Rage	//swgoh.gg/characters/darth-sion/#dark-rage	//swgoh.gg/static/img/assets/tex.ability_sion_basic.png	8	f	t	1	1	t	f	f	f	f	f	29	\N
664	Torment	//swgoh.gg/characters/darth-sion/#torment	//swgoh.gg/static/img/assets/tex.ability_sion_special01.png	8	f	t	1	2	f	t	f	f	f	f	29	\N
665	Break Will	//swgoh.gg/characters/darth-sion/#break-will	//swgoh.gg/static/img/assets/tex.ability_sion_special02.png	8	f	t	1	2	f	t	f	f	f	f	29	\N
666	Held By Hatred	//swgoh.gg/characters/darth-sion/#held-by-hatred	//swgoh.gg/static/img/assets/tex.ability_sion_special03.png	8	f	t	1	2	f	t	f	f	f	f	29	\N
667	Lord of Pain	//swgoh.gg/characters/darth-sion/#lord-of-pain	//swgoh.gg/static/img/assets/tex.abilityui_passive_lordofpain.png	8	t	f	1	4	f	f	f	f	t	f	29	\N
668	Deceptive Strike	//swgoh.gg/characters/darth-traya/#deceptive-strike	//swgoh.gg/static/img/assets/tex.ability_traya_basic.png	8	f	t	1	1	t	f	f	f	f	f	30	\N
669	Saber Storm	//swgoh.gg/characters/darth-traya/#saber-storm	//swgoh.gg/static/img/assets/tex.ability_traya_special01.png	8	f	t	1	2	f	t	f	f	f	f	30	\N
670	Isolate	//swgoh.gg/characters/darth-traya/#isolate	//swgoh.gg/static/img/assets/tex.ability_traya_special02.png	8	f	t	1	2	f	t	f	f	f	f	30	\N
671	Lord of Betrayal	//swgoh.gg/characters/darth-traya/#lord-of-betrayal	//swgoh.gg/static/img/assets/tex.abilityui_passive_bondsofweakness.png	8	t	f	1	4	f	f	f	f	t	f	30	\N
672	Compassion is Weakness	//swgoh.gg/characters/darth-traya/#compassion-is-weakness	//swgoh.gg/static/img/assets/tex.abilityui_passive_lordofbetrayal.png	8	t	f	1	3	f	f	f	f	f	t	30	\N
673	Telekinetic Blast	//swgoh.gg/characters/visas-marr/#telekinetic-blast	//swgoh.gg/static/img/assets/tex.ability_visas_basic.png	8	f	t	1	1	t	f	f	f	f	f	109	\N
674	Dark Healing	//swgoh.gg/characters/visas-marr/#dark-healing	//swgoh.gg/static/img/assets/tex.ability_visas_special01.png	8	f	t	1	2	f	t	f	f	f	f	109	\N
675	Piercing Strike	//swgoh.gg/characters/visas-marr/#piercing-strike	//swgoh.gg/static/img/assets/tex.ability_visas_special02.png	8	f	t	1	2	f	t	f	f	f	f	109	\N
676	Returned to the Light	//swgoh.gg/characters/visas-marr/#returned-to-the-light	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	8	t	f	1	4	f	f	f	f	t	f	109	\N
677	Prey On The Weak	//swgoh.gg/characters/bossk/#prey-on-the-weak	//swgoh.gg/static/img/assets/tex.ability_bossk_basic.png	8	f	t	1	1	t	f	f	f	f	f	120	\N
678	Hunting Party	//swgoh.gg/characters/bossk/#hunting-party	//swgoh.gg/static/img/assets/tex.ability_bossk_special01.png	8	f	t	1	2	f	t	f	f	f	f	120	\N
679	On The Hunt	//swgoh.gg/characters/bossk/#on-the-hunt	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	t	f	1	3	f	f	f	f	f	t	120	\N
680	Trandoshan Rage	//swgoh.gg/characters/bossk/#trandoshan-rage	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	8	t	f	1	4	f	f	f	f	t	f	120	\N
681	Bossk's Payout	//swgoh.gg/characters/bossk/#bossks-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	120	\N
682	Boba Fett's Payout	//swgoh.gg/characters/boba-fett/#boba-fetts-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	119	\N
683	Predator Instincts	//swgoh.gg/characters/bossk/#predator-instincts	//swgoh.gg/static/img/assets/tex.ability_bossk_special02.png	8	f	t	1	2	f	t	f	f	f	f	120	\N
684	Strength of the Void	//swgoh.gg/characters/darth-nihilus/#strength-of-the-void	//swgoh.gg/static/img/assets/tex.abilityui_passive_sith.png	8	t	f	1	3	f	f	f	f	f	t	27	\N
685	Job Satisfaction	//swgoh.gg/characters/dengar/#job-satisfaction	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal.png	8	f	t	1	3	f	f	f	f	f	t	32	\N
686	Dengar's Payout	//swgoh.gg/characters/dengar/#dengars-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	32	\N
687	Explosive Sabotage	//swgoh.gg/characters/greedo/#explosive-sabotage	//swgoh.gg/static/img/assets/tex.ability_greedo_special01.png	8	f	t	1	2	f	t	f	f	f	f	47	\N
688	Threaten	//swgoh.gg/characters/greedo/#threaten	//swgoh.gg/static/img/assets/tex.ability_greedo_special02.png	8	t	f	1	2	f	t	f	f	f	f	47	\N
689	Greedo's Payout	//swgoh.gg/characters/greedo/#greedos-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	47	\N
690	IG-88's Payout	//swgoh.gg/characters/ig-88/#ig-88s-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	145	\N
691	Unchained	//swgoh.gg/characters/vandor-chewbacca/#unchained	//swgoh.gg/static/img/assets/tex.ability_chewbacca_vandor_basic.png	8	f	t	1	1	t	f	f	f	f	f	106	\N
692	Freedom Fighter	//swgoh.gg/characters/vandor-chewbacca/#freedom-fighter	//swgoh.gg/static/img/assets/tex.ability_chewbacca_vandor_special01.png	8	f	t	1	2	f	t	f	f	f	f	106	\N
693	The Beast	//swgoh.gg/characters/vandor-chewbacca/#the-beast	//swgoh.gg/static/img/assets/tex.abilityui_passive_firstaid.png	8	f	t	1	4	f	f	f	f	t	f	106	\N
694	Ferocious Protector	//swgoh.gg/characters/vandor-chewbacca/#ferocious-protector	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	t	f	1	4	f	f	f	f	t	f	106	\N
695	Trick Shot	//swgoh.gg/characters/young-han-solo/#trick-shot	//swgoh.gg/static/img/assets/tex.ability_han_young_basic.png	8	f	t	1	1	t	f	f	f	f	f	112	\N
696	Upper Hand	//swgoh.gg/characters/young-han-solo/#upper-hand	//swgoh.gg/static/img/assets/tex.ability_han_young_special01.png	8	f	t	1	2	f	t	f	f	f	f	112	\N
697	Just In Time	//swgoh.gg/characters/young-han-solo/#just-in-time	//swgoh.gg/static/img/assets/tex.ability_han_young_special02.png	8	f	t	1	2	f	t	f	f	f	f	112	\N
698	Ready For Anything	//swgoh.gg/characters/young-han-solo/#ready-for-anything	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	4	f	f	f	f	t	f	112	\N
699	Enforcer of the First Order	//swgoh.gg/ships/kylo-rens-command-shuttle/#enforcer-of-the-first-order	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	3	f	f	2	\N	f	f	t	f	f	f	\N	23
700	Twin Ion Engine	//swgoh.gg/ships/imperial-tie-fighter/#twin-ion-engine	//swgoh.gg/static/img/assets/tex.abilityui_passive_scanner.png	3	f	f	2	\N	f	f	t	f	f	f	\N	21
701	Guardian of the Republic	//swgoh.gg/ships/jedi-consulars-starfighter/#guardian-of-the-republic	//swgoh.gg/static/img/assets/tex.abilityui_passive_hp.png	3	f	f	2	\N	f	f	t	f	f	f	\N	22
702	Commander of the 104th Battalion	//swgoh.gg/ships/plo-koons-jedi-starfighter/#commander-of-the-104th-battalion	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	3	f	f	2	\N	f	f	t	f	f	f	\N	26
703	Viceroy of Mandalore	//swgoh.gg/ships/gauntlet-starfighter/#viceroy-of-mandalore	//swgoh.gg/static/img/assets/tex.abilityui_passive_protection.png	3	f	f	2	\N	f	f	t	f	f	f	\N	13
704	Unnerving Presence	//swgoh.gg/ships/tie-advanced-x1/#unnerving-presence	//swgoh.gg/static/img/assets/tex.abilityui_passive_darkarts.png	3	f	f	2	\N	f	f	t	f	f	f	\N	35
705	All Out Offensive	//swgoh.gg/ships/slave-i/#all-out-offensive	//swgoh.gg/static/img/assets/tex.abilityui_passive_systems.png	3	f	f	2	\N	f	f	t	f	f	f	\N	33
706	Squad Formation	//swgoh.gg/ships/resistance-x-wing/#squad-formation	//swgoh.gg/static/img/assets/tex.abilityui_passive_assist.png	3	f	f	2	\N	f	f	t	f	f	f	\N	28
707	Rebel Recon	//swgoh.gg/ships/cassians-u-wing/#rebel-recon	//swgoh.gg/static/img/assets/tex.abilityui_passive_systems.png	3	f	f	2	\N	f	f	t	f	f	f	\N	6
708	No Man Left Behind	//swgoh.gg/ships/rexs-arc-170/#no-man-left-behind	//swgoh.gg/static/img/assets/tex.abilityui_passive_systems.png	3	f	f	2	\N	f	f	t	f	f	f	\N	29
709	Structural Enhancement	//swgoh.gg/ships/clone-sergeants-arc-170/#structural-enhancement	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	3	f	f	2	\N	f	f	t	f	f	f	\N	8
710	Repulsor Array - Ruse	//swgoh.gg/ships/geonosian-spys-starfighter/#repulsor-array-ruse	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	3	f	f	2	\N	f	f	t	f	f	f	\N	15
711	Repulsor Array - Guidance	//swgoh.gg/ships/geonosian-soldiers-starfighter/#repulsor-array-guidance	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	3	f	f	2	\N	f	f	t	f	f	f	\N	14
712	Repulsor Array - Control	//swgoh.gg/ships/sun-facs-geonosian-starfighter/#repulsor-array-control	//swgoh.gg/static/img/assets/tex.abilityui_passive_stun.png	3	f	f	2	\N	f	f	t	f	f	f	\N	34
713	Covert Strike	//swgoh.gg/ships/phantom-ii/#covert-strike	//swgoh.gg/static/img/assets/tex.abilityui_passive_systems.png	3	f	f	2	\N	f	f	t	f	f	f	\N	25
714	Reconnaissance	//swgoh.gg/ships/ghost/#reconnaissance	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	3	f	f	2	\N	f	f	t	f	f	f	\N	16
715	Quad Thrusters	//swgoh.gg/ships/bistans-u-wing/#quad-thrusters	//swgoh.gg/static/img/assets/tex.abilityui_passive_cloak.png	3	f	f	2	\N	f	f	t	f	f	f	\N	5
716	Raid Communication Protocol	//swgoh.gg/ships/first-order-tie-fighter/#raid-communication-protocol	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	3	f	f	2	\N	f	f	t	f	f	f	\N	12
717	Engine Tuning	//swgoh.gg/ships/biggs-darklighters-x-wing/#engine-tuning	//swgoh.gg/static/img/assets/tex.abilityui_passive_protection.png	3	f	f	2	\N	f	f	t	f	f	f	\N	4
718	Exploiting Vulnerability	//swgoh.gg/ships/wedge-antilless-x-wing/#exploiting-vulnerability	//swgoh.gg/static/img/assets/tex.abilityui_passive_removeharmful.png	3	f	f	2	\N	f	f	t	f	f	f	\N	39
719	Drifting Shade	//swgoh.gg/ships/scimitar/#drifting-shade	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	3	f	f	2	\N	f	f	t	f	f	f	\N	31
720	Advanced Defense Systems	//swgoh.gg/ships/umbaran-starfighter/#advanced-defense-systems	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	3	f	f	2	\N	f	f	t	f	f	f	\N	38
721	Thrust Accelerator	//swgoh.gg/ships/reys-millennium-falcon/#thrust-accelerator	//swgoh.gg/static/img/assets/tex.abilityui_passive_counterattack.png	3	f	f	2	\N	f	f	t	f	f	f	\N	30
722	Cunning Maneuver	//swgoh.gg/ships/ahsoka-tanos-jedi-starfighter/#cunning-maneuver	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	3	f	f	2	\N	f	f	t	f	f	f	\N	1
723	Dramatic Entrance	//swgoh.gg/ships/poe-damerons-x-wing/#dramatic-entrance	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	3	f	f	2	\N	f	f	t	f	f	f	\N	27
724	Phylon 07 Tractor Beam	//swgoh.gg/ships/chimaera/#phylon-07-tractor-beam	//swgoh.gg/static/img/assets/tex.ability_chimaera_special02.png	8	f	f	2	\N	f	t	f	f	f	f	\N	7
725	Superior Precision	//swgoh.gg/ships/first-order-sf-tie-fighter/#superior-precision	//swgoh.gg/static/img/assets/tex.abilityui_passive_potency.png	3	f	f	2	\N	f	f	t	f	f	f	\N	11
726	Afterburner	//swgoh.gg/ships/tie-silencer/#afterburner	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	3	f	f	2	\N	f	f	t	f	f	f	\N	37
727	Chopper Does It All	//swgoh.gg/characters/chopper/#chopper-does-it-all	//swgoh.gg/static/img/assets/tex.abilityui_passive_flatmech.png	8	f	f	1	5	f	f	f	f	t	f	125	\N
728	Deadly Double	//swgoh.gg/characters/qira/#deadly-double	//swgoh.gg/static/img/assets/tex.ability_qira_basic.png	8	f	t	1	1	t	f	f	f	f	f	85	\N
729	Scattering Blast	//swgoh.gg/characters/qira/#scattering-blast	//swgoh.gg/static/img/assets/tex.ability_qira_special01.png	8	f	t	1	2	f	t	f	f	f	f	85	\N
730	Joint Operation	//swgoh.gg/characters/qira/#joint-operation	//swgoh.gg/static/img/assets/tex.ability_qira_special02.png	8	f	t	1	2	f	t	f	f	f	f	85	\N
731	Insult to Injury	//swgoh.gg/characters/qira/#insult-to-injury	//swgoh.gg/static/img/assets/tex.ability_passive_healthsteal.png	8	t	f	1	4	f	f	f	f	t	f	85	\N
732	Tools of the Trade	//swgoh.gg/characters/qira/#tools-of-the-trade	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	f	t	1	3	f	f	f	f	f	t	85	\N
733	Cut Through	//swgoh.gg/characters/enfys-nest/#cut-through	//swgoh.gg/static/img/assets/tex.ability_enfys_basic.png	8	f	t	1	1	t	f	f	f	f	f	37	\N
734	Sudden Impact	//swgoh.gg/characters/enfys-nest/#sudden-impact	//swgoh.gg/static/img/assets/tex.ability_enfys_special01.png	8	f	t	1	2	f	t	f	f	f	f	37	\N
735	Kinetite Charge	//swgoh.gg/characters/enfys-nest/#kinetite-charge	//swgoh.gg/static/img/assets/tex.ability_enfys_special02.png	8	f	t	1	2	f	t	f	f	f	f	37	\N
736	Fighting Instinct	//swgoh.gg/characters/enfys-nest/#fighting-instinct	//swgoh.gg/static/img/assets/tex.abilityui_passive_enfys.png	8	t	f	1	4	f	f	f	f	t	f	37	\N
737	Daring Advance	//swgoh.gg/characters/l3-37/#daring-advance	//swgoh.gg/static/img/assets/tex.ability_l337_basic.png	8	f	t	1	1	t	f	f	f	f	f	154	\N
738	Spark of Hope	//swgoh.gg/characters/l3-37/#spark-of-hope	//swgoh.gg/static/img/assets/tex.ability_l337_special01.png	8	f	t	1	2	f	t	f	f	f	f	154	\N
739	For the Droids	//swgoh.gg/characters/l3-37/#for-the-droids	//swgoh.gg/static/img/assets/tex.abilityui_passive_removeharmful.png	8	t	f	1	4	f	f	f	f	t	f	154	\N
740	Self Modification	//swgoh.gg/characters/l3-37/#self-modification	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal.png	8	f	t	1	4	f	f	f	f	t	f	154	\N
741	Silent Shot	//swgoh.gg/characters/young-lando-calrissian/#silent-shot	//swgoh.gg/static/img/assets/tex.ability_younglando_basic.png	8	f	t	1	1	t	f	f	f	f	f	168	\N
742	Hot Hand	//swgoh.gg/characters/young-lando-calrissian/#hot-hand	//swgoh.gg/static/img/assets/tex.ability_younglando_special01.png	8	f	t	1	2	f	t	f	f	f	f	168	\N
743	Dealer's Choice	//swgoh.gg/characters/young-lando-calrissian/#dealers-choice	//swgoh.gg/static/img/assets/tex.ability_younglando_special02.png	8	f	t	1	2	f	t	f	f	f	f	168	\N
744	Perfect Timing	//swgoh.gg/characters/young-lando-calrissian/#perfect-timing	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	4	f	f	f	f	t	f	168	\N
745	Double Down	//swgoh.gg/ships/landos-millennium-falcon/#double-down	//swgoh.gg/static/img/assets/tex.ability_mil_fal_pristine_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	24
746	Coin Toss	//swgoh.gg/ships/landos-millennium-falcon/#coin-toss	//swgoh.gg/static/img/assets/tex.abilityui_passive_removeharmful.png	8	f	f	2	\N	f	f	f	f	t	f	\N	24
747	All In	//swgoh.gg/ships/landos-millennium-falcon/#all-in	//swgoh.gg/static/img/assets/tex.abilityui_passive_seizetheday.png	3	f	f	2	\N	f	f	t	f	f	f	\N	24
748	Buckle Up	//swgoh.gg/characters/young-lando-calrissian/#buckle-up	//swgoh.gg/static/img/assets/tex.ability_mil_fal_pristine_special01.png	8	f	f	1	5	f	t	f	f	f	f	168	\N
749	Calculated Enhancement	//swgoh.gg/characters/l3-37/#calculated-enhancement	//swgoh.gg/static/img/assets/tex.ability_mil_fal_pristine_special02.png	8	f	f	1	5	f	t	f	f	f	f	154	\N
750	Take Aim	//swgoh.gg/characters/range-trooper/#take-aim	//swgoh.gg/static/img/assets/tex.ability_trooperrange_basic.png	8	f	t	1	1	t	f	f	f	f	f	88	\N
751	Steady	//swgoh.gg/characters/range-trooper/#steady	//swgoh.gg/static/img/assets/tex.ability_trooperrange_special01.png	8	f	t	1	2	f	t	f	f	f	f	88	\N
752	Power In Numbers	//swgoh.gg/characters/range-trooper/#power-in-numbers	//swgoh.gg/static/img/assets/tex.abilityui_passive_empire.png	8	f	t	1	4	f	f	f	f	t	f	88	\N
753	No Other Options	//swgoh.gg/characters/jolee-bindo/#no-other-options	//swgoh.gg/static/img/assets/tex.ability_joleebindo_basic.png	8	f	t	1	1	t	f	f	f	f	f	62	\N
754	Eh, You Do It	//swgoh.gg/characters/jolee-bindo/#eh-you-do-it	//swgoh.gg/static/img/assets/tex.ability_joleebindo_special01.png	8	f	t	1	2	f	t	f	f	f	f	62	\N
755	That Looks Pretty Bad	//swgoh.gg/characters/jolee-bindo/#that-looks-pretty-bad	//swgoh.gg/static/img/assets/tex.ability_joleebindo_special02.png	8	t	f	1	2	f	t	f	f	f	f	62	\N
756	Don't Interrupt Me!	//swgoh.gg/characters/jolee-bindo/#dont-interrupt-me	//swgoh.gg/static/img/assets/tex.abilityui_passive_removeharmful.png	8	f	t	1	4	f	f	f	f	t	f	62	\N
757	Experience and Wisdom	//swgoh.gg/characters/jolee-bindo/#experience-and-wisdom	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal_buff.png	8	f	t	1	4	f	f	f	f	t	f	62	\N
758	Jedi Assault	//swgoh.gg/characters/bastila-shan/#jedi-assault	//swgoh.gg/static/img/assets/tex.ability_bastilashan_basic.png	8	f	t	1	1	t	f	f	f	f	f	8	\N
759	Rally	//swgoh.gg/characters/bastila-shan/#rally	//swgoh.gg/static/img/assets/tex.ability_bastilashan_special01.png	8	f	t	1	2	f	t	f	f	f	f	8	\N
760	Subvert Defenses	//swgoh.gg/characters/bastila-shan/#subvert-defenses	//swgoh.gg/static/img/assets/tex.ability_bastilashan_special02.png	8	f	t	1	2	f	t	f	f	f	f	8	\N
761	Initiative	//swgoh.gg/characters/bastila-shan/#initiative	//swgoh.gg/static/img/assets/tex.abilityui_leader_default.png	8	t	f	1	3	f	f	f	f	f	t	8	\N
762	Legendary Battle Meditation	//swgoh.gg/characters/bastila-shan/#legendary-battle-meditation	//swgoh.gg/static/img/assets/tex.abilityui_passive_uniqueability.png	8	f	t	1	4	f	f	f	f	t	f	8	\N
763	Defensive Formation	//swgoh.gg/ships/tie-reaper/#defensive-formation	//swgoh.gg/static/img/assets/tex.abilityui_passive_systems.png	3	f	f	2	\N	f	f	t	f	f	f	\N	36
764	Disable	//swgoh.gg/characters/t3-m4/#disable	//swgoh.gg/static/img/assets/tex.ability_t3m4_basic.png	8	f	t	1	1	t	f	f	f	f	f	99	\N
765	Repair Kit	//swgoh.gg/characters/t3-m4/#repair-kit	//swgoh.gg/static/img/assets/tex.ability_t3m4_special01.png	8	f	t	1	2	f	t	f	f	f	f	99	\N
766	Carbonite Projector	//swgoh.gg/characters/t3-m4/#carbonite-projector	//swgoh.gg/static/img/assets/tex.ability_t3m4_special02.png	8	f	t	1	2	f	t	f	f	f	f	99	\N
767	Combat Logic Upgrade	//swgoh.gg/characters/t3-m4/#combat-logic-upgrade	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	4	f	f	f	f	t	f	99	\N
768	Master Gearhead	//swgoh.gg/characters/t3-m4/#master-gearhead	//swgoh.gg/static/img/assets/tex.abilityui_passive_penetration.png	8	t	f	1	4	f	f	f	f	t	f	99	\N
769	Don't Blink	//swgoh.gg/characters/mission-vao/#dont-blink	//swgoh.gg/static/img/assets/tex.ability_mission_basic.png	8	f	t	1	1	t	f	f	f	f	f	71	\N
770	Street Smarts	//swgoh.gg/characters/mission-vao/#street-smarts	//swgoh.gg/static/img/assets/tex.ability_mission_special01.png	8	f	t	1	2	f	t	f	f	f	f	71	\N
771	Now You See Me	//swgoh.gg/characters/mission-vao/#now-you-see-me	//swgoh.gg/static/img/assets/tex.abilityui_passive_potency.png	8	f	t	1	4	f	f	f	f	t	f	71	\N
772	Me and Big Z Forever	//swgoh.gg/characters/mission-vao/#me-and-big-z-forever	//swgoh.gg/static/img/assets/tex.abilityui_passive_mission_zaalbar.png	8	t	f	1	4	f	f	f	f	t	f	71	\N
773	Stalwart Ally	//swgoh.gg/characters/zaalbar/#stalwart-ally	//swgoh.gg/static/img/assets/tex.ability_zaalbar_basic.png	8	f	t	1	1	t	f	f	f	f	f	113	\N
774	Power Blast	//swgoh.gg/characters/zaalbar/#power-blast	//swgoh.gg/static/img/assets/tex.ability_zaalbar_special01.png	8	f	t	1	2	f	t	f	f	f	f	113	\N
775	Wookiee Toughness	//swgoh.gg/characters/zaalbar/#wookiee-toughness	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	f	t	1	4	f	f	f	f	t	f	113	\N
776	Mission's Guardian	//swgoh.gg/characters/zaalbar/#missions-guardian	//swgoh.gg/static/img/assets/tex.abilityui_passive_mission_zaalbar.png	8	t	f	1	4	f	f	f	f	t	f	113	\N
777	Stifle	//swgoh.gg/ships/sith-fighter/#stifle	//swgoh.gg/static/img/assets/tex.ability_sithfighter_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	32
778	Swarm Tactics	//swgoh.gg/ships/sith-fighter/#swarm-tactics	//swgoh.gg/static/img/assets/tex.abilityui_passive_penetration.png	8	f	f	2	\N	f	f	f	f	t	f	\N	32
779	Extreme Maneuverability	//swgoh.gg/ships/sith-fighter/#extreme-maneuverability	//swgoh.gg/static/img/assets/tex.abilityui_passive_foresight.png	3	f	f	2	\N	f	f	t	f	f	f	\N	32
780	First Strike	//swgoh.gg/characters/sith-assassin/#first-strike	//swgoh.gg/static/img/assets/tex.ability_sithfighter_special01.png	8	f	f	1	5	f	t	f	f	f	f	163	\N
781	Dismantling Shot	//swgoh.gg/characters/embo/#dismantling-shot	//swgoh.gg/static/img/assets/tex.ability_embo_basic.png	8	f	t	1	1	t	f	f	f	f	f	35	\N
782	Kyuzo War Helmet	//swgoh.gg/characters/embo/#kyuzo-war-helmet	//swgoh.gg/static/img/assets/tex.ability_embo_special01.png	8	f	t	1	2	f	t	f	f	f	f	35	\N
783	The Quiet Assassin	//swgoh.gg/characters/embo/#the-quiet-assassin	//swgoh.gg/static/img/assets/tex.abilityui_passive_seizetheday.png	8	t	f	1	3	f	f	f	f	f	t	35	\N
784	Way of the Kyuzo	//swgoh.gg/characters/embo/#way-of-the-kyuzo	//swgoh.gg/static/img/assets/tex.abilityui_passive_embo.png	8	t	f	1	4	f	f	f	f	t	f	35	\N
785	Embo's Payout	//swgoh.gg/characters/embo/#embos-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	35	\N
786	Weakening Shot	//swgoh.gg/characters/aurra-sing/#weakening-shot	//swgoh.gg/static/img/assets/tex.ability_aurrasing_basic.png	8	f	t	1	1	t	f	f	f	f	f	5	\N
787	Hustle	//swgoh.gg/characters/aurra-sing/#hustle	//swgoh.gg/static/img/assets/tex.ability_aurrasing_special01.png	8	f	t	1	2	f	t	f	f	f	f	5	\N
788	Snipers Expertise	//swgoh.gg/characters/aurra-sing/#snipers-expertise	//swgoh.gg/static/img/assets/tex.ability_aurrasing_special02.png	8	t	f	1	2	f	t	f	f	f	f	5	\N
789	Game Plan	//swgoh.gg/characters/aurra-sing/#game-plan	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	t	f	1	3	f	f	f	f	f	t	5	\N
790	Relentless Killer	//swgoh.gg/characters/aurra-sing/#relentless-killer	//swgoh.gg/static/img/assets/tex.abilityui_passive_stealth.png	8	f	t	1	4	f	f	f	f	t	f	5	\N
791	Aurra Sing's Payout	//swgoh.gg/characters/aurra-sing/#aurra-sings-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	5	\N
792	For The Right Price	//swgoh.gg/characters/cad-bane/#for-the-right-price	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	121	\N
793	At Your Service	//swgoh.gg/characters/cad-bane/#at-your-service	//swgoh.gg/static/img/assets/tex.abilityui_passive_dodge.png	8	f	t	1	3	f	f	f	f	f	t	121	\N
794	Cad Bane's Payout	//swgoh.gg/characters/cad-bane/#cad-banes-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	121	\N
795	Tooth and Nail	//swgoh.gg/ships/hounds-tooth/#tooth-and-nail	//swgoh.gg/static/img/assets/tex.ability_houndstooth_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	19
796	Devourer of Prey	//swgoh.gg/ships/hounds-tooth/#devourer-of-prey	//swgoh.gg/static/img/assets/tex.ability_houndstooth_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	19
797	Secure the Hunt	//swgoh.gg/ships/hounds-tooth/#secure-the-hunt	//swgoh.gg/static/img/assets/tex.ability_passive_elite.png	3	f	f	2	\N	f	f	t	f	f	f	\N	19
798	Trandoshan Barricade	//swgoh.gg/characters/bossk/#trandoshan-barricade	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	8	f	f	1	5	f	f	f	f	t	f	120	\N
799	Unscrupulous Gunfire	//swgoh.gg/characters/jango-fett/#unscrupulous-gunfire	//swgoh.gg/static/img/assets/tex.ability_jangofett_basic.png	8	f	t	1	1	t	f	f	f	f	f	56	\N
800	Shrapnel Blast	//swgoh.gg/characters/jango-fett/#shrapnel-blast	//swgoh.gg/static/img/assets/tex.ability_jangofett_special01.png	8	f	t	1	2	f	t	f	f	f	f	56	\N
801	Conflagration	//swgoh.gg/characters/jango-fett/#conflagration	//swgoh.gg/static/img/assets/tex.ability_jangofett_special02.png	8	f	t	1	2	f	t	f	f	f	f	56	\N
802	Anything to Get Ahead	//swgoh.gg/characters/jango-fett/#anything-to-get-ahead	//swgoh.gg/static/img/assets/tex.abilityui_passive_speed.png	8	t	f	1	3	f	f	f	f	f	t	56	\N
803	Notorious Reputation	//swgoh.gg/characters/jango-fett/#notorious-reputation	//swgoh.gg/static/img/assets/tex.abilityui_passive_mandalorian.png	8	t	f	1	4	f	f	f	f	t	f	56	\N
804	Jango Fett's Payout	//swgoh.gg/characters/jango-fett/#jango-fetts-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	56	\N
805	Having a Blast	//swgoh.gg/characters/zam-wesell/#having-a-blast	//swgoh.gg/static/img/assets/tex.abilityui_passive_potency.png	8	f	t	1	3	f	f	f	f	f	t	114	\N
806	Zam's Payout	//swgoh.gg/characters/zam-wesell/#zams-payout	//swgoh.gg/static/img/assets/tex.abilityui_passive_contract.png	3	f	t	1	4	f	f	f	t	f	f	114	\N
807	Hull Breach	//swgoh.gg/ships/xanadu-blood/#hull-breach	//swgoh.gg/static/img/assets/tex.ability_xanadublood_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	40
808	Rogue Maneuver	//swgoh.gg/ships/xanadu-blood/#rogue-maneuver	//swgoh.gg/static/img/assets/tex.ability_xanadublood_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	40
809	Into the Breach	//swgoh.gg/ships/xanadu-blood/#into-the-breach	//swgoh.gg/static/img/assets/tex.abilityui_passive_breach.png	3	f	f	2	\N	f	f	t	f	f	f	\N	40
810	Cloak and Dagger	//swgoh.gg/characters/cad-bane/#cloak-and-dagger	//swgoh.gg/static/img/assets/tex.abilityui_passive_cloak.png	8	f	f	1	5	f	f	f	f	t	f	121	\N
811	Overcharged Shot	//swgoh.gg/characters/chewbacca/#overcharged-shot	//swgoh.gg/static/img/assets/tex.ability_chewbacca_ot_basic.png	8	f	t	1	1	t	f	f	f	f	f	124	\N
812	Pulverize	//swgoh.gg/characters/chewbacca/#pulverize	//swgoh.gg/static/img/assets/tex.ability_chewbacca_ot_special01.png	8	f	t	1	2	f	t	f	f	f	f	124	\N
813	Furious Bowcaster	//swgoh.gg/characters/chewbacca/#furious-bowcaster	//swgoh.gg/static/img/assets/tex.ability_chewbacca_ot_special02.png	8	f	t	1	2	f	t	f	f	f	f	124	\N
814	Raging Wookiee	//swgoh.gg/characters/chewbacca/#raging-wookiee	//swgoh.gg/static/img/assets/tex.abilityui_passive_crit_buff.png	8	t	f	1	4	f	f	f	f	t	f	124	\N
815	Loyal Friend	//swgoh.gg/characters/chewbacca/#loyal-friend	//swgoh.gg/static/img/assets/tex.abilityui_passive_fortifications.png	8	t	f	1	4	f	f	f	f	t	f	124	\N
816	Undying Sacrifice	//swgoh.gg/characters/nightsister-zombie/#undying-sacrifice	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	8	f	t	1	4	f	f	f	f	t	f	77	\N
817	Exploit Identified	//swgoh.gg/ships/ig-2000/#exploit-identified	//swgoh.gg/static/img/assets/tex.ability_ig2000_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	20
818	Inertial Dampeners Disabled	//swgoh.gg/ships/ig-2000/#inertial-dampeners-disabled	//swgoh.gg/static/img/assets/tex.ability_ig2000_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	20
819	Initiate Slice Sequence	//swgoh.gg/ships/ig-2000/#initiate-slice-sequence	//swgoh.gg/static/img/assets/tex.abilityui_passive_targetlock.png	3	f	f	2	\N	f	f	t	f	f	f	\N	20
820	Reconstruct Protocol	//swgoh.gg/characters/ig-88/#reconstruct-protocol	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal.png	8	f	f	1	5	f	f	f	f	t	f	145	\N
821	Ferocious Charge	//swgoh.gg/characters/jedi-knight-revan/#ferocious-charge	//swgoh.gg/static/img/assets/tex.ability_jedirevan_basic.png	8	f	t	1	1	t	f	f	f	f	f	61	\N
822	Master Strategist	//swgoh.gg/characters/jedi-knight-revan/#master-strategist	//swgoh.gg/static/img/assets/tex.ability_jedirevan_special01.png	8	f	t	1	2	f	t	f	f	f	f	61	\N
823	Direct Focus	//swgoh.gg/characters/jedi-knight-revan/#direct-focus	//swgoh.gg/static/img/assets/tex.ability_jedirevan_special02.png	8	t	f	1	2	f	t	f	f	f	f	61	\N
824	General of the Old Republic	//swgoh.gg/characters/jedi-knight-revan/#general-of-the-old-republic	//swgoh.gg/static/img/assets/tex.abilityui_passive_jedirevan.png	8	t	f	1	3	f	f	f	f	f	t	61	\N
825	Savior	//swgoh.gg/characters/jedi-knight-revan/#savior	//swgoh.gg/static/img/assets/tex.abilityui_passive_uniqueability.png	8	f	t	1	4	f	f	f	f	t	f	61	\N
826	Hero	//swgoh.gg/characters/jedi-knight-revan/#hero	//swgoh.gg/static/img/assets/tex.abilityui_leader_default.png	8	t	f	1	4	f	f	f	f	t	f	61	\N
827	Laser Barrage	//swgoh.gg/ships/b-28-extinction-class-bomber/#laser-barrage	//swgoh.gg/static/img/assets/tex.ability_b28extinctionclassbomber_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	3
828	High-Value Target	//swgoh.gg/ships/b-28-extinction-class-bomber/#high-value-target	//swgoh.gg/static/img/assets/tex.abilityui_passive_taunt.png	8	f	f	2	\N	f	f	f	f	t	f	\N	3
829	Bomber Backup	//swgoh.gg/ships/b-28-extinction-class-bomber/#bomber-backup	//swgoh.gg/static/img/assets/tex.abilityui_passive_sith.png	3	f	f	2	\N	f	f	t	f	f	f	\N	3
830	Bombing Run	//swgoh.gg/characters/sith-marauder/#bombing-run	//swgoh.gg/static/img/assets/tex.ability_b28extinctionclassbomber_special01.png	8	f	f	1	5	f	t	f	f	f	f	164	\N
831	Locked On	//swgoh.gg/ships/anakins-eta-2-starfighter/#locked-on	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_anakin_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	2
832	Impeding Assault	//swgoh.gg/ships/anakins-eta-2-starfighter/#impeding-assault	//swgoh.gg/static/img/assets/tex.ability_jedi_fighter_anakin_special01.png	8	f	f	2	\N	f	t	f	f	f	f	\N	2
833	Aggressive Approach	//swgoh.gg/ships/anakins-eta-2-starfighter/#aggressive-approach	//swgoh.gg/static/img/assets/tex.abilityui_passive_accuracy.png	3	f	f	2	\N	f	f	t	f	f	f	\N	2
834	Surge All Power	//swgoh.gg/characters/jedi-knight-anakin/#surge-all-power	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	f	1	5	f	f	f	f	t	f	148	\N
835	Sith Assault	//swgoh.gg/characters/bastila-shan-fallen/#sith-assault	//swgoh.gg/static/img/assets/tex.ability_bastilashandark_basic.png	8	f	t	1	1	t	f	f	f	f	f	9	\N
836	Wild Lightning	//swgoh.gg/characters/bastila-shan-fallen/#wild-lightning	//swgoh.gg/static/img/assets/tex.ability_bastilashandark_special01.png	8	f	t	1	2	f	t	f	f	f	f	9	\N
837	Fear	//swgoh.gg/characters/bastila-shan-fallen/#fear	//swgoh.gg/static/img/assets/tex.ability_bastilashandark_special02.png	8	f	t	1	2	f	t	f	f	f	f	9	\N
838	Corrupted Battle Meditation	//swgoh.gg/characters/bastila-shan-fallen/#corrupted-battle-meditation	//swgoh.gg/static/img/assets/tex.abilityui_passive_uniqueability.png	8	f	t	1	4	f	f	f	f	t	f	9	\N
839	Sith Apprentice	//swgoh.gg/characters/bastila-shan-fallen/#sith-apprentice	//swgoh.gg/static/img/assets/tex.abilityui_passive_sith.png	8	t	f	1	4	f	f	f	f	t	f	9	\N
840	Interminable Assault	//swgoh.gg/characters/canderous-ordo/#interminable-assault	//swgoh.gg/static/img/assets/tex.ability_canderous_basic.png	8	f	t	1	1	t	f	f	f	f	f	14	\N
841	Overwhelming Firepower	//swgoh.gg/characters/canderous-ordo/#overwhelming-firepower	//swgoh.gg/static/img/assets/tex.ability_canderous_special01.png	8	f	t	1	2	f	t	f	f	f	f	14	\N
842	Mandalorian Veteran	//swgoh.gg/characters/canderous-ordo/#mandalorian-veteran	//swgoh.gg/static/img/assets/tex.abilityui_passive_mandalorian.png	8	f	t	1	4	f	f	f	f	t	f	14	\N
843	I Like a Challenge	//swgoh.gg/characters/canderous-ordo/#i-like-a-challenge	//swgoh.gg/static/img/assets/tex.abilityui_passive_penetration.png	8	t	f	1	4	f	f	f	f	t	f	14	\N
844	Rapid Shot	//swgoh.gg/characters/carth-onasi/#rapid-shot	//swgoh.gg/static/img/assets/tex.ability_carth_basic.png	8	f	t	1	1	t	f	f	f	f	f	16	\N
845	Just Keep Shooting	//swgoh.gg/characters/carth-onasi/#just-keep-shooting	//swgoh.gg/static/img/assets/tex.ability_carth_special01.png	8	f	t	1	2	f	t	f	f	f	f	16	\N
846	Soldier of the Old Republic	//swgoh.gg/characters/carth-onasi/#soldier-of-the-old-republic	//swgoh.gg/static/img/assets/tex.abilityui_passive_def.png	8	t	f	1	3	f	f	f	f	f	t	16	\N
847	Soldier's Training	//swgoh.gg/characters/carth-onasi/#soldiers-training	//swgoh.gg/static/img/assets/tex.abilityui_passive_attack_buff.png	8	f	t	1	4	f	f	f	f	t	f	16	\N
848	Raging Strike	//swgoh.gg/characters/juhani/#raging-strike	//swgoh.gg/static/img/assets/tex.ability_juhani_basic.png	8	f	t	1	1	t	f	f	f	f	f	63	\N
849	Boastful Provocation	//swgoh.gg/characters/juhani/#boastful-provocation	//swgoh.gg/static/img/assets/tex.ability_juhani_special01.png	8	f	t	1	2	f	t	f	f	f	f	63	\N
850	Remorseful Thrash	//swgoh.gg/characters/juhani/#remorseful-thrash	//swgoh.gg/static/img/assets/tex.ability_juhani_special02.png	8	f	t	1	2	f	t	f	f	f	f	63	\N
851	Cathar Resilience	//swgoh.gg/characters/juhani/#cathar-resilience	//swgoh.gg/static/img/assets/tex.abilityui_passive_heal.png	8	t	f	1	4	f	f	f	f	t	f	63	\N
852	Baffling Trick	//swgoh.gg/characters/c-3po/#baffling-trick	//swgoh.gg/static/img/assets/tex.ability_c3p0_basic.png	8	f	t	1	1	t	f	f	f	f	f	13	\N
853	Oh My Goodness!	//swgoh.gg/characters/c-3po/#oh-my-goodness	//swgoh.gg/static/img/assets/tex.ability_c3p0_special01.png	8	t	f	1	2	f	t	f	f	f	f	13	\N
854	Protocol Droid	//swgoh.gg/characters/c-3po/#protocol-droid	//swgoh.gg/static/img/assets/tex.abilityui_passive_translation.png	8	f	t	1	4	f	f	f	f	t	f	13	\N
855	Wait for Me!	//swgoh.gg/characters/c-3po/#wait-for-me	//swgoh.gg/static/img/assets/tex.abilityui_passive_stealth.png	8	t	f	1	4	f	f	f	f	t	f	13	\N
856	Intermediary	//swgoh.gg/characters/c-3po/#intermediary	//swgoh.gg/static/img/assets/tex.abilityui_passive_sootheall.png	8	f	t	1	4	f	f	f	f	t	f	13	\N
857	Cyborg Relations	//swgoh.gg/characters/c-3po/#cyborg-relations	//swgoh.gg/static/img/assets/tex.abilityui_passive_uniqueability.png	8	f	t	1	4	f	f	f	f	t	f	13	\N
858	Fretful Mediator	//swgoh.gg/characters/c-3po/#fretful-mediator	//swgoh.gg/static/img/assets/tex.abilityui_passive_soothe.png	8	f	t	1	4	f	f	f	f	t	f	13	\N
859	Special Modifications	//swgoh.gg/ships/hans-millennium-falcon/#special-modifications	//swgoh.gg/static/img/assets/tex.ability_mfalcon_basic.png	8	f	f	2	\N	t	f	f	f	f	f	\N	17
860	She May Not Look Like Much	//swgoh.gg/ships/hans-millennium-falcon/#she-may-not-look-like-much	//swgoh.gg/static/img/assets/tex.abilityui_passive_rebel.png	8	f	f	2	\N	f	f	f	f	t	f	\N	17
861	Yahooo!	//swgoh.gg/ships/hans-millennium-falcon/#yahooo	//swgoh.gg/static/img/assets/tex.abilityui_passive_assist.png	3	f	f	2	\N	f	f	t	f	f	f	\N	17
862	Watch This	//swgoh.gg/characters/han-solo/#watch-this	//swgoh.gg/static/img/assets/tex.ability_mfalcon_special01.png	8	f	f	1	5	f	t	f	f	f	f	143	\N
863	Punch It!	//swgoh.gg/characters/chewbacca/#punch-it	//swgoh.gg/static/img/assets/tex.ability_mfalcon_special02.png	8	f	f	1	5	f	t	f	f	f	f	124	\N
\.


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: Mega
--

COPY public.characters (char_id, name, url, image, description, power, alignment, role, ship, ship_id, tags, abilities, base_id) FROM stdin;
1	Aayla Secura	http://swgoh.gg/characters/aayla-secura/	//swgoh.gg/static/img/assets/tex.charui_aaylasecura.png	Versatile attacker with high survivability through Dodge, Hitpoints, and self healing.	18762	Light Side	Support		\N	{"Galactic Republic",Jedi}	{Assist,Counter,"Leader: +Max Health","Leader: +Tenacity",Stun}	AAYLASECURA
2	Ahsoka Tano (Fulcrum)	http://swgoh.gg/characters/ahsoka-tano-fulcrum/	//swgoh.gg/static/img/assets/tex.charui_ahsokaadult.png	Enduring Rebel Attacker who shrugs off debuffs and consumes buffs to deal extra damage	21168	Light Side	Attacker		\N	{Rebel}	{Counter,Dispel,DoT,Foresight,"Gain Turn Meter",Taunt}	FULCRUMAHSOKA
3	Amilyn Holdo	http://swgoh.gg/characters/amilyn-holdo/	//swgoh.gg/static/img/assets/tex.charui_holdo.png	Seasoned Resistance Tank with powerful ally support and enemy debuffs	21168	Light Side	Tank		\N	{Resistance}	{AoE,Daze,"Defense Down",Dispel,"Evasion Down",Foresight,Taunt}	AMILYNHOLDO
4	Asajj Ventress	http://swgoh.gg/characters/asajj-ventress/	//swgoh.gg/static/img/assets/tex.charui_ventress.png	Nightsister controller with healing who generates attack power as characters are defeated	24148	Dark Side	Support		\N	{Nightsister,Separatist}	{AoE,Counter,"Defense Down",Dispel,"Gain Turn Meter","Leader: +Speed","Remove Turn Meter",Stun}	ASAJVENTRESS
5	Aurra Sing	http://swgoh.gg/characters/aurra-sing/	//swgoh.gg/static/img/assets/tex.charui_aurrasing.png	Deadly Bounty Hunter that has increased damage while Stealthed	24933	Dark Side	Attacker		\N	{"Bounty Hunters",Scoundrel}	{Counter,"Gain Turn Meter","Offense Up","Reset Cooldown",Stealth,Stun}	AURRA_SING
6	B2 Super Battle Droid	http://swgoh.gg/characters/b2-super-battle-droid/	//swgoh.gg/static/img/assets/tex.charui_b2.png	Droid Tank that relentlessly punishes enemies that evade attacks or damage allies	18187	Dark Side	Tank		\N	{Droid,Separatist}	{AoE,"Buff Immunity",Dispel,"Dispel - All Enemies","Evasion Down","Gain Turn Meter"}	B2SUPERBATTLEDROID
7	Barriss Offee	http://swgoh.gg/characters/barriss-offee/	//swgoh.gg/static/img/assets/tex.charui_barriss_light.png	Jedi Healer that can balance party Health and Dispel allied Jedi frequently	21168	Light Side	Healer		\N	{"Galactic Republic",Jedi}	{"Defense Up",Dispel,"Gain Turn Meter",Heal,"Healing Immunity","Leader: +Max Health","Leader: Healing","Remove Turn Meter"}	BARRISSOFFEE
8	Bastila Shan	http://swgoh.gg/characters/bastila-shan/	//swgoh.gg/static/img/assets/tex.charui_bastilashan.png	Strong Jedi Support that grants allies an overwhelming first turn with her Leader ability	21952	Light Side	Support		\N	{Jedi,"Old Republic"}	{"Ability Block",Assist,Counter,Dispel,"Gain Turn Meter","Leader: +Tenacity",Stun,Taunt}	BASTILASHAN
9	Bastila Shan (Fallen)	http://swgoh.gg/characters/bastila-shan-fallen/	//swgoh.gg/static/img/assets/tex.charui_bastilashan_dark.png	Strong Sith Support who inflicts a large number of debuffs including Shock, Stun and Corrupted Battle Meditation	21952	Dark Side	Support		\N	{"Old Republic",Sith}	{"Ability Block",AoE,Counter,"Defense Down","Evasion Down",Expose,Foresight,"Gain Turn Meter","Offense Down","Speed Down",Stun}	BASTILASHANDARK
10	Baze Malbus	http://swgoh.gg/characters/baze-malbus/	//swgoh.gg/static/img/assets/tex.charui_bazemalbus.png	Fearsome Rebel Tank who Taunts, dispels buffs, and inflicts debuffs	19336	Light Side	Tank		\N	{Rebel,"Rogue One"}	{AoE,Assist,Counter,Dispel,"Gain Turn Meter","Speed Down",Taunt}	BAZEMALBUS
11	BB-8	http://swgoh.gg/characters/bb-8/	//swgoh.gg/static/img/assets/tex.charui_bb8.png	Persistent Resistance Droid who empowers allies by circulating Secret Intel	24148	Light Side	Support		\N	{Droid,Resistance}	{Advantage,AoE,Assist,Counter,Daze,Dispel,Expose,Foresight,"Gain Turn Meter","Offense Up",Taunt,"Tenacity Down"}	BB8
12	Bodhi Rook	http://swgoh.gg/characters/bodhi-rook/	//swgoh.gg/static/img/assets/tex.charui_bodhi.png	Clever Rebel Support who spots enemy units for his allies	21168	Light Side	Support		\N	{Rebel,"Rogue One"}	{AoE,Assist,"Evasion Down","Gain Turn Meter","Offense Up","Remove Turn Meter"}	BODHIROOK
13	C-3PO	http://swgoh.gg/characters/c-3po/	//swgoh.gg/static/img/assets/tex.charui_c3p0.png	Evasive support character that Confuses foes and strengthens mixed-faction interplay with Translation.	25717	Light Side	Support		\N	{Droid,"Galactic Republic",Rebel,Resistance}	{Assist,Counter,"Defense Down",Expose,"Gain Turn Meter","Offense Down","Reduce Cooldowns","Reset Cooldown",Stealth}	C3POLEGENDARY
14	Canderous Ordo	http://swgoh.gg/characters/canderous-ordo/	//swgoh.gg/static/img/assets/tex.charui_canderous.png	Powerful attacker who can make short work of enemy Tanks	21168	Dark Side	Attacker		\N	{"Old Republic",Scoundrel}	{AoE,"Bonus Attack",DoT,"Gain Turn Meter","Offense Down",Taunt,"Tenacity Down"}	CANDEROUSORDO
15	Captain Han Solo	http://swgoh.gg/characters/captain-han-solo/	//swgoh.gg/static/img/assets/tex.charui_hoth_han.png	Daring Rebel Support that risks himself to Revive allies and Daze enemies	21168	Light Side	Support		\N	{Rebel,Scoundrel}	{Daze,Dispel,"Gain Turn Meter",Revive}	HOTHHAN
16	Carth Onasi	http://swgoh.gg/characters/carth-onasi/	//swgoh.gg/static/img/assets/tex.charui_carth.png	Old Republic soldier that excels at clearing waves of enemies	21168	Light Side	Attacker		\N	{"Old Republic"}	{AoE,Assist,DoT,"Gain Turn Meter","Leader: +Tenacity","Leader: Assist","Offense Up","Reset Cooldown"}	CARTHONASI
17	CC-2224 "Cody"	http://swgoh.gg/characters/cc-2224-cody/	//swgoh.gg/static/img/assets/tex.charui_trooperclone_cody.png	Clone Attacker that Stuns and calls tons of Assists	21168	Light Side	Attacker		\N	{"Clone Trooper","Galactic Republic"}	{Assist,"Gain Turn Meter","Leader: +Critical","Leader: +Defense",Stun}	CC2224
18	Chief Chirpa	http://swgoh.gg/characters/chief-chirpa/	//swgoh.gg/static/img/assets/tex.charui_ewok_chirpa.png	Ewok Leader that greatly improves ally Basic abilities	21168	Light Side	Support		\N	{Ewok}	{Assist,Counter,"Gain Turn Meter",Heal,"Leader: Assist"}	CHIEFCHIRPA
19	Chief Nebit	http://swgoh.gg/characters/chief-nebit/	//swgoh.gg/static/img/assets/tex.charui_jawa_nebit.png	Cunning Jawa Tank with Stealth synergies who can reduce cooldowns	18762	Light Side	Tank		\N	{Jawa}	{Assist,"Leader: +Critical",Stealth,Taunt}	CHIEFNEBIT
20	Chirrut Îmwe	http://swgoh.gg/characters/chirrut-imwe/	//swgoh.gg/static/img/assets/tex.charui_chirrut.png	Balanced Rebel Attacker who dispels debuffs, heals allies, and grants Tenacity Up	19336	Light Side	Attacker		\N	{Rebel,"Rogue One"}	{Assist,Counter,Dispel,"Tenacity Up"}	CHIRRUTIMWE
21	Clone Wars Chewbacca	http://swgoh.gg/characters/clone-wars-chewbacca/	//swgoh.gg/static/img/assets/tex.charui_chewbacca.png	Durable Tank with both Taunt and self-Healing	21168	Light Side	Tank		\N	{"Galactic Republic",Scoundrel}	{"Defense Up",Dispel,"Gain Turn Meter","Leader: +Defense","Remove Turn Meter",Taunt}	CLONEWARSCHEWBACCA
22	Colonel Starck	http://swgoh.gg/characters/colonel-starck/	//swgoh.gg/static/img/assets/tex.charui_colonel_stark.png	Offensive Support who provides critical buffs and removes enemy Turn Meter	21168	Dark Side	Support		\N	{Empire,"Imperial Trooper"}	{AoE,"Defense Down",Dispel,"Gain Turn Meter","Remove Turn Meter"}	COLONELSTARCK
23	Commander Luke Skywalker	http://swgoh.gg/characters/commander-luke-skywalker/	//swgoh.gg/static/img/assets/tex.charui_lukebespin.png	Determined Rebel hero who can ignore debuffs or ignore Taunts	27129	Light Side	Attacker		\N	{Rebel}	{"Buff Immunity",Counter,"Defense Down",Dispel,"Gain Turn Meter","Leader: +Defense","Remove Turn Meter","Speed Down",Stun,Taunt,"Tenacity Down"}	COMMANDERLUKESKYWALKER
24	Coruscant Underworld Police	http://swgoh.gg/characters/coruscant-underworld-police/	//swgoh.gg/static/img/assets/tex.charui_coruscantpolice.png	Support that shuts down enemies with Stuns and Offense Down	18187	Light Side	Support		\N	{"Galactic Republic"}	{AoE,"Gain Turn Meter","Offense Down",Stun}	CORUSCANTUNDERWORLDPOLICE
25	Count Dooku	http://swgoh.gg/characters/count-dooku/	//swgoh.gg/static/img/assets/tex.charui_dooku.png	High-damage attacker with stun, bonus attacks, and incredible counter-attacking.	21168	Dark Side	Support		\N	{Separatist,Sith}	{"Ability Block","Bonus Attack",Counter,"Gain Turn Meter","Leader: +Evasion","Offense Up",Stun}	COUNTDOOKU
26	CT-21-0408 "Echo"	http://swgoh.gg/characters/ct-21-0408-echo/	//swgoh.gg/static/img/assets/tex.charui_trooperclone_echo.png	Clone Support that automatically Assists allies and can Dispel all enemies	18762	Light Side	Support		\N	{"Clone Trooper","Galactic Republic"}	{AoE,Assist,Dispel,"Dispel - All Enemies"}	CT210408
27	Darth Nihilus	http://swgoh.gg/characters/darth-nihilus/	//swgoh.gg/static/img/assets/tex.charui_nihilus.png	Sith Support that can instantly defeat enemies by draining cooldowns	24148	Dark Side	Support		\N	{Sith}	{AoE,Counter,Dispel,DoT,"Gain Turn Meter","Leader: +Max Health","Reduce Cooldowns",Revive}	DARTHNIHILUS
28	Darth Sidious	http://swgoh.gg/characters/darth-sidious/	//swgoh.gg/static/img/assets/tex.charui_sidious.png	Brutal Attacker effective against Healers and Jedi while boosting allied Criticals as a Leader	21168	Dark Side	Attacker		\N	{Sith}	{AoE,DoT,Expose,"Gain Turn Meter","Healing Immunity","Leader: +Critical"}	DARTHSIDIOUS
29	Darth Sion	http://swgoh.gg/characters/darth-sion/	//swgoh.gg/static/img/assets/tex.charui_sion.png	Aggressive Sith tank that becomes stronger with Hatred	21952	Dark Side	Tank		\N	{Sith}	{AoE,Dispel,"Gain Turn Meter",Revive,Taunt}	DARTHSION
30	Darth Traya	http://swgoh.gg/characters/darth-traya/	//swgoh.gg/static/img/assets/tex.charui_traya.png	Sith support who punishes enemies for relying on others	24148	Dark Side	Support		\N	{Sith}	{"Ability Block",Counter,Daze,Dispel,"Healing Immunity","Leader: +Max Health","Reduce Cooldowns","Tenacity Down"}	DARTHTRAYA
31	Dathcha	http://swgoh.gg/characters/dathcha/	//swgoh.gg/static/img/assets/tex.charui_jawa_dathcha.png	Versatile Support able to Ability Block and Stealth, effective against Droids or with Jawas	18762	Light Side	Support		\N	{Jawa}	{"Ability Block",AoE,"Defense Down","Leader: +Defense","Remove Turn Meter",Stealth,Stun}	DATHCHA
32	Dengar	http://swgoh.gg/characters/dengar/	//swgoh.gg/static/img/assets/tex.charui_dengar.png	Adaptable Scoundrel attacker that Stuns and inflicts Tenacity Down.	22737	Dark Side	Attacker		\N	{"Bounty Hunters",Scoundrel}	{AoE,Assist,Counter,DoT,"Gain Turn Meter","Speed Down",Stealth,Stun,"Tenacity Down","Tenacity Up","Thermal Detonator"}	DENGAR
33	Director Krennic	http://swgoh.gg/characters/director-krennic/	//swgoh.gg/static/img/assets/tex.charui_krennic.png	Intimidating Empire Support who inflicts devastating debuffs and slows enemies	21742	Dark Side	Support		\N	{Empire}	{"Ability Block",AoE,Assist,"Buff Immunity","Leader: +Critical",Revive,"Speed Down",Stun,"Tenacity Down"}	DIRECTORKRENNIC
34	Eeth Koth	http://swgoh.gg/characters/eeth-koth/	//swgoh.gg/static/img/assets/tex.charui_eethkoth.png	Stunning Jedi Support extremely effective against Droids	18762	Light Side	Support		\N	{"Galactic Republic",Jedi}	{"Ability Block",Anti-Droid,"Defense Down","Leader: +Defense",Stun}	EETHKOTH
35	Embo	http://swgoh.gg/characters/embo/	//swgoh.gg/static/img/assets/tex.charui_embo.png	Deadly Bounty Hunter Attacker that consumes his Protection to boost his damage	24148	Dark Side	Attacker		\N	{"Bounty Hunters",Scoundrel}	{Counter,Dispel,Foresight,"Offense Up"}	EMBO
36	Emperor Palpatine	http://swgoh.gg/characters/emperor-palpatine/	//swgoh.gg/static/img/assets/tex.charui_palpatineemperor.png	Overwhelming Sith Support who inflicts Shock and can Stun targets for multiple turns	24148	Dark Side	Support		\N	{Empire,Sith}	{AoE,Counter,Dispel,"Gain Turn Meter","Leader: +Evasion","Leader: +Max Health","Offense Up",Stun}	EMPERORPALPATINE
55	Imperial Probe Droid	http://swgoh.gg/characters/imperial-probe-droid/	//swgoh.gg/static/img/assets/tex.charui_probedroid.png	Imperial Droid who reveals and tracks enemies with Target Lock	21168	Dark Side	Support		\N	{Droid,Empire}	{AoE,Dispel,Expose,"Gain Turn Meter","Remove Turn Meter",Revive}	IMPERIALPROBEDROID
37	Enfys Nest	http://swgoh.gg/characters/enfys-nest/	//swgoh.gg/static/img/assets/tex.charui_enfys.png	Powerhouse attacker that stacks Protection when attacked, then dismantles enemy defenses with Dispels and Turn Meter manipulation	21168	Light Side	Attacker		\N	{Scoundrel,Smuggler}	{AoE,"Buff Immunity",Counter,Daze,Dispel,Expose,Foresight,"Gain Turn Meter","Remove Turn Meter","Reset Cooldown",Stealth,Stun,Taunt,"Tenacity Up"}	ENFYSNEST
38	Ewok Elder	http://swgoh.gg/characters/ewok-elder/	//swgoh.gg/static/img/assets/tex.charui_ewok_chief.png	Ewok Healer that specializes in Revives	18187	Light Side	Healer		\N	{Ewok}	{Assist,Dispel,"Gain Turn Meter",Heal,Revive}	EWOKELDER
39	Ewok Scout	http://swgoh.gg/characters/ewok-scout/	//swgoh.gg/static/img/assets/tex.charui_ewok_scout.png	Powerful single-target Attacker that becomes evasive with Ewok allies	18187	Light Side	Attacker		\N	{Ewok}	{Assist,"Gain Turn Meter","Remove Turn Meter"}	EWOKSCOUT
40	First Order Executioner	http://swgoh.gg/characters/first-order-executioner/	//swgoh.gg/static/img/assets/tex.charui_firstorder_executioner.png	Merciless First Order Attacker who executes powerful attacks	18187	Dark Side	Attacker		\N	{"First Order"}	{Advantage,Counter,Dispel,"Gain Turn Meter","Remove Turn Meter","Reset Cooldown"}	FIRSTORDEREXECUTIONER
41	First Order Officer	http://swgoh.gg/characters/first-order-officer/	//swgoh.gg/static/img/assets/tex.charui_firstorderofficer.png	First Order support that grants Advantage and can manipulate both ally and enemy Turn Meters	18187	Dark Side	Support		\N	{"First Order"}	{Advantage,Dispel,"Gain Turn Meter","Offense Up","Remove Turn Meter","Tenacity Up"}	FIRSTORDEROFFICERMALE
42	Gamorrean Guard	http://swgoh.gg/characters/gamorrean-guard/	//swgoh.gg/static/img/assets/tex.charui_gamorreanguard.png	Aggressive tank that Taunts and Counters with multiple Damage Over Time effects	18187	Dark Side	Tank		\N	{Scoundrel}	{Counter,DoT,Expose,Taunt}	GAMORREANGUARD
43	General Grievous	http://swgoh.gg/characters/general-grievous/	//swgoh.gg/static/img/assets/tex.charui_grievous.png	Brutal Attacker that cuts down defensive enemies while protecting himself with forced ally taunts; although he hates being called a droid, he counts as one in combat.	19336	Dark Side	Attacker		\N	{Droid,Separatist}	{AoE,Counter,Dispel,"Gain Turn Meter","Healing Immunity","Leader: +Critical","Remove Turn Meter",Taunt}	GRIEVOUS
44	General Kenobi	http://swgoh.gg/characters/general-kenobi/	//swgoh.gg/static/img/assets/tex.charui_obiwangeneral.png	Vigorous Jedi Tank who gains Foresight, dispels debuffs to grant buffs, and calls buffed allies to Assist	19336	Light Side	Tank		\N	{"Galactic Republic",Jedi}	{Advantage,Assist,Counter,Dispel,Foresight,"Gain Turn Meter","Leader: +Defense","Leader: +Max Health","Leader: Assist","Offense Up",Stealth,Taunt}	GENERALKENOBI
45	General Veers	http://swgoh.gg/characters/general-veers/	//swgoh.gg/static/img/assets/tex.charui_veers.png	Aggressive Empire Support that becomes stronger as enemies are defeated	21168	Dark Side	Support		\N	{Empire,"Imperial Trooper"}	{"Ability Block",AoE,Assist,"Gain Turn Meter","Leader: +Speed","Offense Up"}	VEERS
46	Grand Master Yoda	http://swgoh.gg/characters/grand-master-yoda/	//swgoh.gg/static/img/assets/tex.charui_yodagrandmaster.png	Masterful Jedi support that can replicate enemy buffs and share them with allies	24148	Light Side	Support		\N	{"Galactic Republic",Jedi}	{AoE,Foresight,"Gain Turn Meter","Leader: +Critical","Leader: +Tenacity","Offense Up","Remove Turn Meter",Stealth,Stun,Taunt,"Tenacity Up"}	GRANDMASTERYODA
47	Greedo	http://swgoh.gg/characters/greedo/	//swgoh.gg/static/img/assets/tex.charui_greedo.png	Deadly Attacker that gains extra attacks from Critical Hits	22527	Dark Side	Attacker		\N	{"Bounty Hunters",Scoundrel}	{AoE,"Bonus Attack",Counter,Dispel,"Gain Turn Meter","Remove Turn Meter",Stun,"Thermal Detonator"}	GREEDO
48	Hermit Yoda	http://swgoh.gg/characters/hermit-yoda/	//swgoh.gg/static/img/assets/tex.charui_yodahermit.png	Jedi recluse who imparts sage wisdom in the ways of the Force	24148	Light Side	Support		\N	{Jedi}	{Assist,Counter,Dispel,Foresight,"Gain Turn Meter",Heal,"Healing Immunity","Reset Cooldown",Stealth}	HERMITYODA
49	HK-47	http://swgoh.gg/characters/hk-47/	//swgoh.gg/static/img/assets/tex.charui_hk47.png	Offensive Support with a variety of debuffs and a high chance to self-Revive once	18762	Dark Side	Support		\N	{Droid}	{"Ability Block",AoE,"Defense Down",DoT,"Gain Turn Meter","Leader: +Critical","Offense Down","Offense Up",Revive,"Speed Down"}	HK47
50	Hoth Rebel Scout	http://swgoh.gg/characters/hoth-rebel-scout/	//swgoh.gg/static/img/assets/tex.charui_rebelhothscout.png	Single target attacker with crit synergies and speed building abilities.	18187	Light Side	Attacker		\N	{Rebel}	{"Gain Turn Meter",Stun}	HOTHREBELSCOUT
51	Hoth Rebel Soldier	http://swgoh.gg/characters/hoth-rebel-soldier/	//swgoh.gg/static/img/assets/tex.charui_rebelhoth.png	Support character that debuffs, taunts, and defensively buffs, with Rebel and anti-Empire synergies.	18187	Light Side	Support		\N	{Rebel}	{Counter,"Defense Up","Offense Down",Taunt}	HOTHREBELSOLDIER
52	IG-100 MagnaGuard	http://swgoh.gg/characters/ig-100-magnaguard/	//swgoh.gg/static/img/assets/tex.charui_magnaguard.png	Disruptive Droid Tank that becomes deadly if ignored	18187	Dark Side	Tank		\N	{Droid,Separatist}	{AoE,Counter,"Gain Turn Meter","Offense Down","Offense Up","Remove Turn Meter"}	MAGNAGUARD
53	IG-86 Sentinel Droid	http://swgoh.gg/characters/ig-86-sentinel-droid/	//swgoh.gg/static/img/assets/tex.charui_ig86.png	Droid Attacker with a powerful Droid Assist and devastating Criticals	18187	Dark Side	Attacker		\N	{Droid}	{Assist}	IG86SENTINELDROID
54	Ima-Gun Di	http://swgoh.gg/characters/ima-gun-di/	//swgoh.gg/static/img/assets/tex.charui_imagundi.png	Supportive Tank that boost ally defense and grants Jedi allies Counter Chance	18762	Light Side	Support		\N	{"Galactic Republic",Jedi}	{Anti-Droid,Counter,"Defense Down","Leader: +Defense"}	IMAGUNDI
56	Jango Fett	http://swgoh.gg/characters/jango-fett/	//swgoh.gg/static/img/assets/tex.charui_jangofett.png	Notorious Bounty Hunter that exploits debuffed foes and inflicts Burning	24933	Dark Side	Attacker		\N	{"Bounty Hunters",Scoundrel}	{AoE,Dispel,"Gain Turn Meter","Healing Immunity","Leader: +Critical","Leader: +Speed","Leader: +Tenacity",Revive,Taunt}	JANGOFETT
57	Jawa	http://swgoh.gg/characters/jawa/	//swgoh.gg/static/img/assets/tex.charui_jawa_jawa.png	Attacker effective against debuffed enemies as well as Droids	18187	Light Side	Attacker		\N	{Jawa}	{AoE,"Gain Turn Meter","Speed Down",Stun}	JAWA
58	Jawa Engineer	http://swgoh.gg/characters/jawa-engineer/	//swgoh.gg/static/img/assets/tex.charui_jawa_engineer.png	High-speed Jawa Healer with a Critical Chance buff and both Jawa and Droid synergy	18762	Light Side	Healer		\N	{Jawa}	{"Gain Turn Meter",Heal,Revive,"Thermal Detonator"}	JAWAENGINEER
59	Jawa Scavenger	http://swgoh.gg/characters/jawa-scavenger/	//swgoh.gg/static/img/assets/tex.charui_jawa_scavenger.png	Versatile Jawa Support who can detonate Thermal Detonators to inflict a large variety of status effects	18762	Light Side	Support		\N	{Jawa}	{AoE,"Defense Down","Healing Immunity","Offense Down","Offense Up",Stealth,"Tenacity Down","Thermal Detonator"}	JAWASCAVENGER
60	Jedi Knight Guardian	http://swgoh.gg/characters/jedi-knight-guardian/	//swgoh.gg/static/img/assets/tex.charui_jedi_guardian_01.png	Tenacious Jedi tank with crippling debuffs and natural recovery at low Health	18187	Light Side	Tank		\N	{"Galactic Republic",Jedi}	{"Ability Block",AoE,"Defense Up","Offense Down"}	JEDIKNIGHTGUARDIAN
61	Jedi Knight Revan	http://swgoh.gg/characters/jedi-knight-revan/	//swgoh.gg/static/img/assets/tex.charui_jedirevan.png	Fabled Jedi leader who controls the battle with a wide mix of powerful abilities	27129	Light Side	Attacker		\N	{Jedi,"Old Republic"}	{"Ability Block",Advantage,AoE,Assist,"Buff Immunity",Counter,Dispel,Foresight,"Gain Turn Meter","Leader: +Max Health","Leader: +Speed","Leader: +Tenacity","Leader: Assist","Reduce Cooldowns",Stun,Taunt,"Tenacity Up"}	JEDIKNIGHTREVAN
62	Jolee Bindo	http://swgoh.gg/characters/jolee-bindo/	//swgoh.gg/static/img/assets/tex.charui_joleebindo.png	Potent Jedi Healer with high durability and resistance to disruption	21952	Light Side	Healer		\N	{Jedi,"Old Republic"}	{Assist,Dispel,"Gain Turn Meter",Revive}	JOLEEBINDO
63	Juhani	http://swgoh.gg/characters/juhani/	//swgoh.gg/static/img/assets/tex.charui_juhani.png	Unique Jedi Tank who dispels debuffs from Old Republic allies and becomes more dangerous below full Health	21168	Light Side	Tank		\N	{Jedi,"Old Republic"}	{AoE,Counter,Dispel,"Offense Up",Stealth,Stun,Taunt}	JUHANI
64	Kit Fisto	http://swgoh.gg/characters/kit-fisto/	//swgoh.gg/static/img/assets/tex.charui_kitfisto.png	Versatile Jedi Attacker with multi-attack, Counter Chance, and a variety of ally buffs	18762	Light Side	Attacker		\N	{"Galactic Republic",Jedi}	{AoE,"Bonus Attack",Counter,"Gain Turn Meter","Leader: +Defense","Leader: +Tenacity"}	KITFISTO
65	Lando Calrissian	http://swgoh.gg/characters/lando-calrissian/	//swgoh.gg/static/img/assets/tex.charui_landobespin.png	Scoundrel leader with high offense and excellent Critical Hit synergy	18552	Light Side	Attacker		\N	{Rebel,Scoundrel}	{AoE,"Leader: +Speed","Reset Cooldown"}	ADMINISTRATORLANDO
66	Lobot	http://swgoh.gg/characters/lobot/	//swgoh.gg/static/img/assets/tex.charui_lobot.png	Rebel Support that can reliably inflict Defense Down, clear allied debuffs, and speed up allied Droids	18762	Light Side	Support		\N	{Rebel}	{"Defense Down",Dispel,"Gain Turn Meter",Heal,"Leader: +Speed"}	LOBOT
67	Logray	http://swgoh.gg/characters/logray/	//swgoh.gg/static/img/assets/tex.charui_ewok_logray.png	Sage Ewok Support who can Daze enemies and grant Ewok allies many buffs	21168	Light Side	Support		\N	{Ewok}	{Advantage,AoE,Assist,Daze,Dispel,Foresight,"Gain Turn Meter","Offense Up","Remove Turn Meter","Tenacity Up"}	LOGRAY
68	Luke Skywalker (Farmboy)	http://swgoh.gg/characters/luke-skywalker-farmboy/	//swgoh.gg/static/img/assets/tex.charui_luke_ep4.png	Attacker that can boost his own Critical Rate, then disable enemies with Critical Hits	23364	Light Side	Attacker		\N	{Rebel}	{Advantage,Counter,"Defense Down",Dispel,DoT,"Gain Turn Meter","Leader: +Tenacity","Speed Down",Stun}	LUKESKYWALKER
69	Luminara Unduli	http://swgoh.gg/characters/luminara-unduli/	//swgoh.gg/static/img/assets/tex.charui_luminara.png	Versatile attacker with ability block and powerful party heal.	21168	Light Side	Healer		\N	{"Galactic Republic",Jedi}	{"Ability Block","Evasion Up",Heal,"Leader: +Evasion","Leader: +Max Health","Leader: Healing"}	LUMINARAUNDULI
70	Magmatrooper	http://swgoh.gg/characters/magmatrooper/	//swgoh.gg/static/img/assets/tex.charui_trooperstorm_magma.png	Resilient Attacker that recovers quickly from debuffs and deals potent AoE damage	18187	Dark Side	Attacker		\N	{Empire,"Imperial Trooper"}	{AoE,"Gain Turn Meter","Remove Turn Meter"}	MAGMATROOPER
71	Mission Vao	http://swgoh.gg/characters/mission-vao/	//swgoh.gg/static/img/assets/tex.charui_mission.png	Slippery Scoundrel Attacker who blinds her enemies	21168	Light Side	Attacker		\N	{"Old Republic",Scoundrel}	{Assist,Daze,Dispel,DoT,"Gain Turn Meter",Stealth}	MISSIONVAO
72	Mob Enforcer	http://swgoh.gg/characters/mob-enforcer/	//swgoh.gg/static/img/assets/tex.charui_thug_female_01.png	Scoundrel Tank with enemy debuff ability and a thermal detonator.	18187	Dark Side	Tank		\N	{Scoundrel}	{"Defense Down","Gain Turn Meter","Offense Up","Thermal Detonator"}	HUMANTHUG
73	Mother Talzin	http://swgoh.gg/characters/mother-talzin/	//swgoh.gg/static/img/assets/tex.charui_nightsisters_talzin.png	Vicious Nightsister Leader who inflicts Plague, preventing enemies from Dispelling debuffs	24148	Dark Side	Support		\N	{Nightsister}	{AoE,Assist,Counter,Dispel,"Gain Turn Meter","Leader: +Speed","Leader: Assist",Revive}	MOTHERTALZIN
74	Nightsister Acolyte	http://swgoh.gg/characters/nightsister-acolyte/	//swgoh.gg/static/img/assets/tex.charui_nightsister_acolyte.png	Stealth attacker with some enemy debuffing and self healing ability.	18187	Dark Side	Attacker		\N	{Nightsister}	{Dispel,"Gain Turn Meter",Stealth}	NIGHTSISTERACOLYTE
75	Nightsister Initiate	http://swgoh.gg/characters/nightsister-initiate/	//swgoh.gg/static/img/assets/tex.charui_nightsister_initiate.png	Critical-focused Attacker that can render enemies immune to buffs	21168	Dark Side	Attacker		\N	{Nightsister}	{"Buff Immunity",Counter,DoT}	NIGHTSISTERINITIATE
76	Nightsister Spirit	http://swgoh.gg/characters/nightsister-spirit/	//swgoh.gg/static/img/assets/tex.charui_nightsisters_wraith.png	Veiled Nightsister Attacker who Dispels, Stuns, and gains Foresight	18187	Dark Side	Attacker		\N	{Nightsister}	{Counter,Dispel,Foresight,"Gain Turn Meter","Remove Turn Meter","Speed Down",Stun}	NIGHTSISTERSPIRIT
77	Nightsister Zombie	http://swgoh.gg/characters/nightsister-zombie/	//swgoh.gg/static/img/assets/tex.charui_nightsisters_zombie.png	Vile Nightsister Tank who inflicts Tenacity Down and can't be stopped from reviving endlessly	18972	Dark Side	Tank		\N	{Nightsister}	{Counter,Dispel,Revive,Taunt,"Tenacity Down"}	NIGHTSISTERZOMBIE
78	Nute Gunray	http://swgoh.gg/characters/nute-gunray/	//swgoh.gg/static/img/assets/tex.charui_nutegunray.png	Attacker with powerful Stealth bonuses and a potent Thermal Detonator	18762	Dark Side	Attacker		\N	{Scoundrel,Separatist}	{"Gain Turn Meter","Leader: +Critical",Stealth,"Thermal Detonator"}	NUTEGUNRAY
79	Obi-Wan Kenobi (Old Ben)	http://swgoh.gg/characters/obi-wan-kenobi-old-ben/	//swgoh.gg/static/img/assets/tex.charui_obiwanep4.png	Durable Jedi Tank able to shut down enemy offense with multiple debuffs	24148	Light Side	Tank		\N	{Jedi,Rebel}	{"Ability Block",AoE,"Defense Up","Evasion Down","Gain Turn Meter","Leader: +Evasion","Offense Down","Offense Up","Remove Turn Meter",Taunt}	OLDBENKENOBI
80	Old Daka	http://swgoh.gg/characters/old-daka/	//swgoh.gg/static/img/assets/tex.charui_daka.png	Defensive Nightsister Healer who Stuns and Revives	21168	Dark Side	Healer		\N	{Nightsister}	{Counter,"Defense Up","Gain Turn Meter",Heal,"Leader: +Defense","Offense Up",Revive,Stun}	DAKA
81	Pao	http://swgoh.gg/characters/pao/	//swgoh.gg/static/img/assets/tex.charui_pao.png	Unrelenting Rebel Attacker with a mighty battle cry	21168	Light Side	Attacker		\N	{Rebel,"Rogue One"}	{AoE,"Defense Down","Gain Turn Meter","Offense Up","Reduce Cooldowns"}	PAO
82	Paploo	http://swgoh.gg/characters/paploo/	//swgoh.gg/static/img/assets/tex.charui_ewok_paploo.png	Resourceful Ewok Tank with assist and buff synergies	21168	Light Side	Tank		\N	{Ewok}	{Assist,"Defense Up",Dispel,"Gain Turn Meter","Speed Down",Stealth,Taunt}	PAPLOO
83	Poggle the Lesser	http://swgoh.gg/characters/poggle-the-lesser/	//swgoh.gg/static/img/assets/tex.charui_geonosian_poggle.png	Support character with strong droid synergies.	18762	Dark Side	Support		\N	{Geonosian,Separatist}	{"Ability Block","Gain Turn Meter","Offense Up"}	POGGLETHELESSER
84	Princess Leia	http://swgoh.gg/characters/princess-leia/	//swgoh.gg/static/img/assets/tex.charui_leia_princess.png	Well-rounded Rebel Attacker with extra attacks, Stealth, and team Critical bonuses.	21168	Light Side	Attacker		\N	{Rebel}	{"Bonus Attack",Foresight,"Gain Turn Meter","Leader: +Critical","Offense Up",Stealth}	PRINCESSLEIA
85	Qi'ra	http://swgoh.gg/characters/qira/	//swgoh.gg/static/img/assets/tex.charui_qira.png	High-utility Support that uses Prepared, debuffs, and an adaptable Leader ability to overwhelm enemies	21952	Light Side	Support		\N	{Scoundrel,Smuggler}	{AoE,Assist,Counter,Daze,Dispel,Expose,"Gain Turn Meter","Leader: +Critical","Leader: +Speed","Offense Down"}	QIRA
86	Qui-Gon Jinn	http://swgoh.gg/characters/qui-gon-jinn/	//swgoh.gg/static/img/assets/tex.charui_quigon.png	Versatile attacker focused on generating extra attacks.	21168	Light Side	Support		\N	{"Galactic Republic",Jedi}	{Assist,Counter,Dispel,Foresight,"Gain Turn Meter","Leader: +Speed","Leader: Foresight","Offense Up","Remove Turn Meter"}	QUIGONJINN
87	R2-D2	http://swgoh.gg/characters/r2-d2/	//swgoh.gg/static/img/assets/tex.charui_astromech_r2d2.png	Versatile Support Droid that inflicts Burning and grants allies Stealth	24148	Light Side	Support		\N	{Droid,"Galactic Republic",Rebel,Resistance}	{Advantage,AoE,Dispel,Foresight,"Gain Turn Meter",Revive,Stealth,Stun}	R2D2_LEGENDARY
88	Range Trooper	http://swgoh.gg/characters/range-trooper/	//swgoh.gg/static/img/assets/tex.charui_trooperranger.png	Aggressive Empire Support that provides other Imperial Trooper allies with Assist chance	18187	Dark Side	Support		\N	{Empire,"Imperial Trooper"}	{Assist,Counter}	RANGETROOPER
89	Rebel Officer Leia Organa	http://swgoh.gg/characters/rebel-officer-leia-organa/	//swgoh.gg/static/img/assets/tex.charui_leiahoth.png	Tenacious Rebel Attacker that counters debuffs and is more effective against healthy targets	21168	Light Side	Attacker		\N	{Rebel}	{"Ability Block","Buff Immunity",Counter,Foresight,"Gain Turn Meter","Leader: +Critical","Leader: +Tenacity","Leader: Foresight"}	HOTHLEIA
90	Resistance Trooper	http://swgoh.gg/characters/resistance-trooper/	//swgoh.gg/static/img/assets/tex.charui_resistancetrooper.png	Opportunistic Resistance attacker that can deal heavy damage to debuffed enemies	17977	Light Side	Attacker		\N	{Resistance}	{Dispel,Expose,"Gain Turn Meter","Speed Down"}	RESISTANCETROOPER
91	Rey (Jedi Training)	http://swgoh.gg/characters/rey-jedi-training/	//swgoh.gg/static/img/assets/tex.charui_rey_tlj.png	Resilient Resistance Tank who avenges debuffed allies and controls the battlefield	27129	Light Side	Tank		\N	{Resistance}	{"Ability Block",Assist,Counter,Daze,Dispel,Expose,Foresight,"Gain Turn Meter","Healing Immunity","Leader: +Critical","Offense Down","Offense Up","Reduce Cooldowns","Remove Turn Meter","Speed Down"}	REYJEDITRAINING
92	Rose Tico	http://swgoh.gg/characters/rose-tico/	//swgoh.gg/static/img/assets/tex.charui_rose.png	A brave Resistance Attacker who can Stun and grant allies buffs.	21168	Light Side	Attacker		\N	{Resistance}	{"Bonus Attack",Daze,"Defense Up",Expose,"Gain Turn Meter","Remove Turn Meter",Stun,"Tenacity Up"}	ROSETICO
93	Royal Guard	http://swgoh.gg/characters/royal-guard/	//swgoh.gg/static/img/assets/tex.charui_royalguard.png	Versatile Empire Tank that punishes enemies for attacking other allies	18187	Dark Side	Tank		\N	{Empire}	{"Defense Up","Gain Turn Meter","Speed Down",Stun,Taunt}	ROYALGUARD
94	Savage Opress	http://swgoh.gg/characters/savage-opress/	//swgoh.gg/static/img/assets/tex.charui_savageopress.png	Durable Attacker that crushes low-health units and becomes stronger when attacked	21168	Dark Side	Attacker		\N	{Sith}	{"Defense Up",Dispel,"Gain Turn Meter","Leader: +Defense","Leader: +Tenacity","Offense Down","Offense Up"}	SAVAGEOPRESS
95	Sith Trooper	http://swgoh.gg/characters/sith-trooper/	//swgoh.gg/static/img/assets/tex.charui_sithtrooper.png	Sith Tank who Taunts and ignores enemy Protection	18187	Dark Side	Tank		\N	{Sith}	{AoE,Counter,"Defense Down","Defense Up","Offense Down",Taunt}	SITHTROOPER
96	Snowtrooper	http://swgoh.gg/characters/snowtrooper/	//swgoh.gg/static/img/assets/tex.charui_troopersnow.png	Empire Attacker that becomes faster and stronger as enemies are defeated	18187	Dark Side	Attacker		\N	{Empire,"Imperial Trooper"}	{"Ability Block",AoE,"Gain Turn Meter"}	SNOWTROOPER
97	Stormtrooper	http://swgoh.gg/characters/stormtrooper/	//swgoh.gg/static/img/assets/tex.charui_trooperstorm.png	Empire Tank that can Taunt and surprise enemies with unpredictable damage	20383	Dark Side	Tank		\N	{Empire,"Imperial Trooper"}	{Expose,"Remove Turn Meter",Taunt}	STORMTROOPER
98	Stormtrooper Han	http://swgoh.gg/characters/stormtrooper-han/	//swgoh.gg/static/img/assets/tex.charui_trooperstorm_han.png	Versatile tank able to surprise enemies with sudden Turn Meter changes and Offense boosts	20958	Light Side	Tank		\N	{Rebel,Scoundrel}	{"Gain Turn Meter","Leader: +Defense","Remove Turn Meter",Taunt}	STORMTROOPERHAN
99	T3-M4	http://swgoh.gg/characters/t3-m4/	//swgoh.gg/static/img/assets/tex.charui_t3m4.png	Offensive Droid who supports a Droid team with extra stats and debuffs the enemy team	24148	Light Side	Support		\N	{Droid,"Old Republic"}	{"Ability Block",AoE,Dispel,Foresight,"Offense Down","Offense Up","Remove Turn Meter",Stealth,Taunt,"Tenacity Up"}	T3_M4
100	Talia	http://swgoh.gg/characters/talia/	//swgoh.gg/static/img/assets/tex.charui_nightsister_talia.png	Aggressive Healer that sacrifices Health so allies can recover Health and Turn Meter	18762	Dark Side	Healer		\N	{Nightsister}	{Dispel,DoT,"Gain Turn Meter","Leader: +Evasion","Leader: +Max Health"}	TALIA
101	Teebo	http://swgoh.gg/characters/teebo/	//swgoh.gg/static/img/assets/tex.charui_ewok_teebo.png	Ewok stealth character with stealth synergies and some control ability.	18972	Light Side	Tank		\N	{Ewok}	{Dispel,"Gain Turn Meter","Remove Turn Meter",Stealth}	TEEBO
102	Tusken Raider	http://swgoh.gg/characters/tusken-raider/	//swgoh.gg/static/img/assets/tex.charui_tuskenraider.png	Durable Attacker with Tusken Synergy and a strong Assist attack	18187	Dark Side	Attacker		\N	{Tusken}	{Assist,"Remove Turn Meter"}	TUSKENRAIDER
103	Tusken Shaman	http://swgoh.gg/characters/tusken-shaman/	//swgoh.gg/static/img/assets/tex.charui_tuskenshaman.png	Offensive Healer that can also boost Offense and rapidly stack Damage Over Time effects	18187	Dark Side	Healer		\N	{Tusken}	{DoT,"Gain Turn Meter","Offense Up"}	TUSKENSHAMAN
104	Ugnaught	http://swgoh.gg/characters/ugnaught/	//swgoh.gg/static/img/assets/tex.charui_ugnaught.png	Anti-Droid Support with AoE damage and high Evasion against Droids	17977	Light Side	Support		\N	{}	{AoE,"Defense Down","Gain Turn Meter",Stun}	UGNAUGHT
105	URoRRuR'R'R	http://swgoh.gg/characters/urorrurrr/	//swgoh.gg/static/img/assets/tex.charui_urorrurrr.png	Tusken Support that can Stun frequently and speed up Tuskens for surprise attacks	18762	Dark Side	Support		\N	{Tusken}	{"Gain Turn Meter","Leader: +Defense","Offense Up",Stun}	URORRURRR
106	Vandor Chewbacca	http://swgoh.gg/characters/vandor-chewbacca/	//swgoh.gg/static/img/assets/tex.charui_chewbacca_vandor.png	Aggressive Scoundrel Tank that provides Protection Recovery for his allies when they are attacked	21168	Light Side	Tank		\N	{Scoundrel,Smuggler}	{Advantage,AoE,Counter,Revive}	YOUNGCHEWBACCA
107	Veteran Smuggler Chewbacca	http://swgoh.gg/characters/veteran-smuggler-chewbacca/	//swgoh.gg/static/img/assets/tex.charui_tfa_chewbacca.png	Lumbering attacker who accumulates Offensive capabilities as enemies take actions	21168	Light Side	Attacker		\N	{Scoundrel,Smuggler}	{AoE,Daze,Dispel,"Gain Turn Meter","Reset Cooldown","Speed Down",Stun}	SMUGGLERCHEWBACCA
108	Veteran Smuggler Han Solo	http://swgoh.gg/characters/veteran-smuggler-han-solo/	//swgoh.gg/static/img/assets/tex.charui_tfa_han.png	Scoundrel Attacker with multi-attack and multiple devastating debuffs	21168	Light Side	Attacker		\N	{Scoundrel,Smuggler}	{"Ability Block",AoE,"Bonus Attack",Counter,"Gain Turn Meter","Reset Cooldown",Stun}	SMUGGLERHAN
109	Visas Marr	http://swgoh.gg/characters/visas-marr/	//swgoh.gg/static/img/assets/tex.charui_visas.png	Offensive Healer with strong anti-Sith synergy	21168	Light Side	Healer		\N	{}	{AoE,Assist,Counter,Dispel,Revive}	VISASMARR
110	Wampa	http://swgoh.gg/characters/wampa/	//swgoh.gg/static/img/assets/tex.charui_wampa.png	Fearsome predator from Hoth that attacks constantly with increasing strength	24148	Dark Side	Attacker		\N	{}	{AoE,Counter,Daze,Dispel,DoT,Expose,"Gain Turn Meter","Healing Immunity",Stun}	WAMPA
111	Wicket	http://swgoh.gg/characters/wicket/	//swgoh.gg/static/img/assets/tex.charui_ewok_wicket.png	Jittery Ewok Attacker with Critical Hit and Stealth synergies	21168	Light Side	Attacker		\N	{Ewok}	{AoE,Assist,"Gain Turn Meter",Stealth}	WICKET
112	Young Han Solo	http://swgoh.gg/characters/young-han-solo/	//swgoh.gg/static/img/assets/tex.charui_han_young.png	Scoundrel Attacker who becomes more deadly over time	21168	Light Side	Attacker		\N	{Scoundrel,Smuggler}	{Assist,Counter,"Speed Down"}	YOUNGHAN
113	Zaalbar	http://swgoh.gg/characters/zaalbar/	//swgoh.gg/static/img/assets/tex.charui_zaalbar.png	Versatile Scoundrel Tank with a powerful AoE attack and reactive Taunt	21168	Light Side	Tank		\N	{"Old Republic",Scoundrel}	{AoE,Counter,DoT,Taunt}	ZAALBAR
114	Zam Wesell	http://swgoh.gg/characters/zam-wesell/	//swgoh.gg/static/img/assets/tex.charui_zamwesell.png	Lightning fast Scoundrel attacker that inflicts Evasion Down and detonates bombs.	22737	Dark Side	Attacker		\N	{"Bounty Hunters",Scoundrel}	{AoE,Counter,Dispel,"Evasion Down","Gain Turn Meter",Stealth,"Thermal Detonator"}	ZAMWESELL
115	Admiral Ackbar	http://swgoh.gg/characters/admiral-ackbar/	//swgoh.gg/static/img/assets/tex.charui_ackbaradmiral.png	Rebel Support that can Dispel debuffs and grant allies extra turns	18762	Light Side	Support	CAPITALMONCALAMARICRUISER	18	{"Fleet Commander",Rebel}	{Assist,Dispel,"Gain Turn Meter",Heal,"Leader: +Speed","Leader: +Tenacity","Leader: Assist"}	ADMIRALACKBAR
116	Ahsoka Tano	http://swgoh.gg/characters/ahsoka-tano/	//swgoh.gg/static/img/assets/tex.charui_ahsoka.png	Versatile Attacker with healing and superior stats as long as she can avoid suffering Critical Hits	18762	Light Side	Attacker	JEDISTARFIGHTERAHSOKATANO	1	{"Galactic Republic",Jedi}	{Counter,"Gain Turn Meter",Heal,"Leader: +Evasion"}	AHSOKATANO
117	Biggs Darklighter	http://swgoh.gg/characters/biggs-darklighter/	//swgoh.gg/static/img/assets/tex.charui_rebelpilot_biggs.png	Rebel Support with Critical Hit synergies who calls Assists	18187	Light Side	Support	XWINGRED3	4	{Rebel}	{Assist,"Evasion Up","Gain Turn Meter"}	BIGGSDARKLIGHTER
118	Bistan	http://swgoh.gg/characters/bistan/	//swgoh.gg/static/img/assets/tex.charui_bistan.png	Wild Rebel Attacker who gains Frenzy, debuffs enemies, and removes Turn Meter	18762	Light Side	Attacker	UWINGSCARIF	5	{Rebel,"Rogue One"}	{DoT,"Gain Turn Meter","Remove Turn Meter"}	BISTAN
119	Boba Fett	http://swgoh.gg/characters/boba-fett/	//swgoh.gg/static/img/assets/tex.charui_bobafett.png	Ruthless Bounty Hunter Attacker who ignores Taunts, Ability Blocks and self-revives	22737	Dark Side	Attacker	SLAVE1	33	{"Bounty Hunters",Scoundrel}	{"Ability Block",AoE,"Bonus Attack",Counter,Dispel,DoT,"Gain Turn Meter","Healing Immunity","Leader: +Critical","Leader: +Max Health","Leader: +Speed","Leader: +Tenacity","Reduce Cooldowns",Revive,Taunt,"Thermal Detonator"}	BOBAFETT
120	Bossk	http://swgoh.gg/characters/bossk/	//swgoh.gg/static/img/assets/tex.charui_bossk.png	Bounty Hunter Tank that constantly regenerates Health and Protection	24933	Dark Side	Tank	HOUNDSTOOTH	19	{"Bounty Hunters",Scoundrel}	{Assist,Dispel,"Leader: +Defense","Leader: +Speed","Leader: +Tenacity","Offense Up","Reduce Cooldowns",Stun,Taunt}	BOSSK
121	Cad Bane	http://swgoh.gg/characters/cad-bane/	//swgoh.gg/static/img/assets/tex.charui_cadbane.png	Bounty Hunter Support with a powerful Stun and bonuses against Jedi characters	19756	Dark Side	Support	XANADUBLOOD	40	{"Bounty Hunters",Scoundrel}	{Advantage,AoE,"Bonus Attack",Dispel,"Gain Turn Meter","Leader: +Tenacity","Reduce Cooldowns","Remove Turn Meter",Stun,"Thermal Detonator"}	CADBANE
122	Captain Phasma	http://swgoh.gg/characters/captain-phasma/	//swgoh.gg/static/img/assets/tex.charui_phasma.png	High-damage First Order support that can grant allies many extra attacks	21168	Dark Side	Support	COMMANDSHUTTLE	23	{"First Order"}	{Advantage,AoE,Assist,Counter,"Defense Down","Gain Turn Meter","Leader: Assist","Speed Down"}	PHASMA
123	Cassian Andor	http://swgoh.gg/characters/cassian-andor/	//swgoh.gg/static/img/assets/tex.charui_cassian.png	Rebel Support who buffs allies at the start of battle and debuffs enemies during battle	21168	Light Side	Support	UWINGROGUEONE	6	{Rebel,"Rogue One"}	{"Ability Block",Assist,"Buff Immunity",Counter,"Defense Down","Defense Up",Expose,"Gain Turn Meter","Healing Immunity","Offense Down","Speed Down","Tenacity Up"}	CASSIANANDOR
124	Chewbacca	http://swgoh.gg/characters/chewbacca/	//swgoh.gg/static/img/assets/tex.charui_chewbacca_ot.png	Mighty Rebel Attacker who Guards the weakest ally	24148	Light Side	Attacker	MILLENNIUMFALCON	17	{Rebel,Scoundrel,Smuggler}	{"Ability Block",AoE,Assist,Daze,Dispel,"Offense Up","Reset Cooldown",Stun,"Tenacity Down"}	CHEWBACCALEGENDARY
125	Chopper	http://swgoh.gg/characters/chopper/	//swgoh.gg/static/img/assets/tex.charui_chopper.png	Surly Phoenix Support who Taunts and Dispels, and can recover Phoenix cooldowns	18972	Light Side	Support	PHANTOM2	25	{Droid,Phoenix,Rebel}	{AoE,Assist,Dispel,"Gain Turn Meter","Offense Up","Reduce Cooldowns",Stun,Taunt}	CHOPPERS3
126	Clone Sergeant - Phase I	http://swgoh.gg/characters/clone-sergeant-phase-i/	//swgoh.gg/static/img/assets/tex.charui_trooperclonegreen.png	Clone Attacker with AoE damage and Turn Meter Reduction	18187	Light Side	Attacker	ARC170CLONESERGEANT	8	{"Clone Trooper","Galactic Republic"}	{AoE,"Gain Turn Meter","Offense Up","Remove Turn Meter"}	CLONESERGEANTPHASEI
127	CT-5555 "Fives"	http://swgoh.gg/characters/ct-5555-fives/	//swgoh.gg/static/img/assets/tex.charui_trooperclone_fives.png	Tank character with high Defense, enemy speed reduction, and joint attack ability.	21168	Light Side	Tank	UMBARANSTARFIGHTER	38	{"Clone Trooper","Galactic Republic"}	{Assist,"Bonus Attack",Counter,"Gain Turn Meter","Leader: +Defense","Speed Down"}	CT5555
128	CT-7567 "Rex"	http://swgoh.gg/characters/ct-7567-rex/	//swgoh.gg/static/img/assets/tex.charui_trooperclone_rex.png	Clone leader with a variety of abilities to support and protect Clone allies.	18762	Light Side	Support	ARC170REX	29	{"Clone Trooper","Galactic Republic"}	{Dispel,"Gain Turn Meter","Leader: +Max Health","Remove Turn Meter","Tenacity Up"}	CT7567
129	Darth Maul	http://swgoh.gg/characters/darth-maul/	//swgoh.gg/static/img/assets/tex.charui_maul.png	Deadly Attacker that gains power and extra turns as enemies are defeated	21168	Dark Side	Attacker	SITHINFILTRATOR	31	{Sith}	{Advantage,AoE,Counter,Daze,"Gain Turn Meter","Leader: +Evasion","Offense Up",Stealth,Taunt}	MAUL
130	Darth Vader	http://swgoh.gg/characters/darth-vader/	//swgoh.gg/static/img/assets/tex.charui_vader.png	Fearsome Attacker that applies AoE Damage Over Time, and crushes debuffed targets for extra turns	24148	Dark Side	Attacker	TIEADVANCED	35	{Empire,Sith}	{"Ability Block",AoE,Counter,Dispel,DoT,"Gain Turn Meter","Remove Turn Meter","Speed Down"}	VADER
131	Death Trooper	http://swgoh.gg/characters/death-trooper/	//swgoh.gg/static/img/assets/tex.charui_trooperdeath.png	Terrifying Empire Attacker who inflicts debilitating debuffs and prevents revives	21168	Dark Side	Attacker	TIEREAPER	36	{Empire,"Imperial Trooper"}	{AoE,"Bonus Attack",Daze,Dispel,"Gain Turn Meter","Healing Immunity",Revive,Stun}	DEATHTROOPER
132	Ezra Bridger	http://swgoh.gg/characters/ezra-bridger/	//swgoh.gg/static/img/assets/tex.charui_ezra_s3.png	Versatile Phoenix Attacker that can perform a variety of effects based on the Roles of allies	21168	Light Side	Attacker	PHANTOM2	25	{Jedi,Phoenix,Rebel}	{Assist,"Bonus Attack","Defense Up",Dispel,"Gain Turn Meter","Reset Cooldown"}	EZRABRIDGERS3
133	Finn	http://swgoh.gg/characters/finn/	//swgoh.gg/static/img/assets/tex.charui_finnjakku.png	Resistance tank that keeps the pressure up with a balance between offense and defense	21168	Light Side	Tank	MILLENNIUMFALCONEP7	30	{Resistance}	{Advantage,"Defense Up",Dispel,Expose,Foresight,"Gain Turn Meter","Leader: +Defense","Leader: Foresight",Stun}	FINN
134	First Order SF TIE Pilot	http://swgoh.gg/characters/first-order-sf-tie-pilot/	//swgoh.gg/static/img/assets/tex.charui_firstorder_pilot.png	Subversive First Order Attacker who buffs allies and disrupts enemies	18187	Dark Side	Attacker	TIEFIGHTERFOSF	11	{"First Order"}	{Advantage,AoE,Assist,"Defense Down",Stun}	FIRSTORDERSPECIALFORCESPILOT
135	First Order Stormtrooper	http://swgoh.gg/characters/first-order-stormtrooper/	//swgoh.gg/static/img/assets/tex.charui_firstordertrooper.png	First Order tank that uses Advantage to disrupt enemies	20383	Dark Side	Tank	COMMANDSHUTTLE	23	{"First Order"}	{Advantage,Assist,Counter,"Defense Up",Dispel,"Gain Turn Meter","Speed Down",Taunt}	FIRSTORDERTROOPER
136	First Order TIE Pilot	http://swgoh.gg/characters/first-order-tie-pilot/	//swgoh.gg/static/img/assets/tex.charui_firstordertiepilot.png	First Order attacker that can deal extreme damage in a single turn with Advantage	20383	Dark Side	Attacker	TIEFIGHTERFIRSTORDER	12	{"First Order"}	{Advantage,"Bonus Attack","Buff Immunity",Foresight,"Offense Down"}	FIRSTORDERTIEPILOT
137	Gar Saxon	http://swgoh.gg/characters/gar-saxon/	//swgoh.gg/static/img/assets/tex.charui_gar_saxon.png	Leader who grants Empire allies Counter Chance and Assists them when they Counter Attack	21168	Dark Side	Tank	GAUNTLETSTARFIGHTER	13	{Empire}	{AoE,Assist,Counter,"Leader: +Defense","Reduce Cooldowns","Speed Down"}	GARSAXON
138	Garazeb "Zeb" Orrelios	http://swgoh.gg/characters/garazeb-zeb-orrelios/	//swgoh.gg/static/img/assets/tex.charui_zeb_s3.png	Versatile Phoenix Tank with wide variety of effects for allies or enemies with or without debuffs	21168	Light Side	Tank	GHOST	16	{Phoenix,Rebel}	{Counter,Daze,Expose,"Gain Turn Meter",Stun,"Tenacity Up"}	ZEBS3
139	Geonosian Soldier	http://swgoh.gg/characters/geonosian-soldier/	//swgoh.gg/static/img/assets/tex.charui_geonosian_soldier.png	Aggressive Attacker that calls Assists and works extremely well with Geonosians	18187	Dark Side	Attacker	GEONOSIANSTARFIGHTER2	14	{Geonosian,Separatist}	{Assist,"Gain Turn Meter","Offense Up"}	GEONOSIANSOLDIER
140	Geonosian Spy	http://swgoh.gg/characters/geonosian-spy/	//swgoh.gg/static/img/assets/tex.charui_geonosian_spy.png	Stealthy Geonosian attacker that can dispel status effects to deal massive damage.	18187	Dark Side	Attacker	GEONOSIANSTARFIGHTER3	15	{Geonosian,Separatist}	{Counter,Dispel,"Evasion Down","Gain Turn Meter",Stealth}	GEONOSIANSPY
141	Grand Admiral Thrawn	http://swgoh.gg/characters/grand-admiral-thrawn/	//swgoh.gg/static/img/assets/tex.charui_thrawn.png	Calculating Empire Leader who can halt enemies in their tracks, and grants Empire allies a new Special ability	24148	Dark Side	Support	CAPITALCHIMAERA	7	{Empire,"Fleet Commander"}	{"Ability Block",Counter,"Defense Down",Dispel,"Gain Turn Meter","Remove Turn Meter","Speed Down",Stun}	GRANDADMIRALTHRAWN
142	Grand Moff Tarkin	http://swgoh.gg/characters/grand-moff-tarkin/	//swgoh.gg/static/img/assets/tex.charui_tarkinadmiral.png	Offensive Empire Support with crushing AoE debuffs	24148	Dark Side	Support	CAPITALSTARDESTROYER	10	{Empire,"Fleet Commander"}	{AoE,"Defense Down",Expose,"Gain Turn Meter","Leader: +Defense","Leader: +Speed","Offense Down","Remove Turn Meter"}	GRANDMOFFTARKIN
143	Han Solo	http://swgoh.gg/characters/han-solo/	//swgoh.gg/static/img/assets/tex.charui_han.png	Daring Attacker that stacks Criticals in his favor and always shoots first	21168	Light Side	Attacker	MILLENNIUMFALCON	17	{Rebel,Scoundrel,Smuggler}	{Counter,"Evasion Up","Gain Turn Meter","Remove Turn Meter",Stun,Taunt}	HANSOLO
144	Hera Syndulla	http://swgoh.gg/characters/hera-syndulla/	//swgoh.gg/static/img/assets/tex.charui_hera_s3.png	Cunning Phoenix Support that allows Phoenix allies to share their Unique abilities with each other	21168	Light Side	Support	GHOST	16	{Phoenix,Rebel}	{Assist,Dispel,Expose,"Gain Turn Meter","Reduce Cooldowns",Revive}	HERASYNDULLAS3
145	IG-88	http://swgoh.gg/characters/ig-88/	//swgoh.gg/static/img/assets/tex.charui_ig88.png	Droid Attacker with debuffs and a damage bonus against debuffed enemies	21952	Dark Side	Attacker	IG2000	20	{"Bounty Hunters",Droid,Scoundrel}	{"Ability Block",AoE,"Defense Down",DoT,"Healing Immunity","Leader: +Critical"}	IG88
146	Imperial Super Commando	http://swgoh.gg/characters/imperial-super-commando/	//swgoh.gg/static/img/assets/tex.charui_imperial_super_commando.png	An Empire Attacker with counter mechanics who dispels buffs and applies buff immunity	18187	Dark Side	Attacker	GAUNTLETSTARFIGHTER	13	{Empire}	{"Bonus Attack","Buff Immunity",Counter,Dispel,"Gain Turn Meter","Offense Down"}	IMPERIALSUPERCOMMANDO
147	Jedi Consular	http://swgoh.gg/characters/jedi-consular/	//swgoh.gg/static/img/assets/tex.charui_jedi_consular_03.png	Well-rounded Jedi Healer with a mix of offense and defense	18187	Light Side	Healer	JEDISTARFIGHTERCONSULAR	22	{"Galactic Republic",Jedi}	{Heal,"Reduce Cooldowns"}	JEDIKNIGHTCONSULAR
148	Jedi Knight Anakin	http://swgoh.gg/characters/jedi-knight-anakin/	//swgoh.gg/static/img/assets/tex.charui_anakinknight.png	High-pressure Jedi attacker that punishes enemies for wounding his allies	18762	Light Side	Attacker	JEDISTARFIGHTERANAKIN	2	{"Galactic Republic",Jedi}	{Advantage,AoE,"Buff Immunity",Expose,"Gain Turn Meter","Offense Up"}	ANAKINKNIGHT
149	Jyn Erso	http://swgoh.gg/characters/jyn-erso/	//swgoh.gg/static/img/assets/tex.charui_jyn.png	Offensive Rebel Leader who gains Advantage, Stuns enemies, revives Rebel allies and grants them Potency Up	24148	Light Side	Attacker	UWINGROGUEONE	6	{Rebel,"Rogue One"}	{Advantage,AoE,Expose,"Gain Turn Meter","Remove Turn Meter",Revive,Stun}	JYNERSO
150	K-2SO	http://swgoh.gg/characters/k-2so/	//swgoh.gg/static/img/assets/tex.charui_k2so.png	Rebel Tank who Taunts and Counter Attacks	21168	Light Side	Tank	UWINGROGUEONE	6	{Droid,Rebel,"Rogue One"}	{Assist,Counter,Daze,Dispel,"Offense Down",Taunt}	K2SO
151	Kanan Jarrus	http://swgoh.gg/characters/kanan-jarrus/	//swgoh.gg/static/img/assets/tex.charui_kanan_s3.png	Durable Phoenix Tank that keeps enemy Offense crippled and allies healthy	21168	Light Side	Tank	GHOST	16	{Jedi,Phoenix,Rebel}	{Counter,"Defense Up",Dispel,Foresight,"Gain Turn Meter","Offense Down",Taunt}	KANANJARRUSS3
152	Kylo Ren	http://swgoh.gg/characters/kylo-ren/	//swgoh.gg/static/img/assets/tex.charui_kyloren.png	Versatile First Order attacker that can reuse special attacks when damaged	21168	Dark Side	Attacker	COMMANDSHUTTLE	23	{"First Order"}	{Advantage,AoE,Counter,DoT,"Gain Turn Meter","Healing Immunity","Reset Cooldown",Stun}	KYLOREN
153	Kylo Ren (Unmasked)	http://swgoh.gg/characters/kylo-ren-unmasked/	//swgoh.gg/static/img/assets/tex.charui_kylo_unmasked.png	Tough First Order Tank with a powerful Stun	24148	Dark Side	Tank	TIESILENCER	37	{"First Order"}	{Advantage,Counter,Dispel,"Gain Turn Meter","Leader: +Speed",Stun,Taunt,"Tenacity Down"}	KYLORENUNMASKED
154	L3-37	http://swgoh.gg/characters/l3-37/	//swgoh.gg/static/img/assets/tex.charui_l337.png	Droid Tank that can dispel allies and has multiple ways to increase her stats permanently	21168	Light Side	Tank	MILLENNIUMFALCONPRISTINE	24	{Droid,Scoundrel,Smuggler}	{Counter,"Defense Down",Dispel,"Gain Turn Meter",Taunt,"Tenacity Up"}	L3_37
155	Mace Windu	http://swgoh.gg/characters/mace-windu/	//swgoh.gg/static/img/assets/tex.charui_macewindu.png	Aggressive Jedi tank with devastating damage if left unchecked	18762	Light Side	Tank	CAPITALJEDICRUISER	9	{"Fleet Commander","Galactic Republic",Jedi}	{Dispel,Expose,"Gain Turn Meter","Leader: +Critical","Leader: +Max Health"}	MACEWINDU
156	Plo Koon	http://swgoh.gg/characters/plo-koon/	//swgoh.gg/static/img/assets/tex.charui_plokoon.png	Jedi Tank with Clone synergy, reliable enemy Dispel and anti-Stealth	18762	Light Side	Tank	BLADEOFDORIN	26	{"Galactic Republic",Jedi}	{AoE,"Defense Up",Dispel,"Gain Turn Meter","Offense Down","Offense Up",Stealth}	PLOKOON
157	Poe Dameron	http://swgoh.gg/characters/poe-dameron/	//swgoh.gg/static/img/assets/tex.charui_poe.png	Resistance Tank with a Taunt that inflicts Expose for big reversals	18762	Light Side	Tank	XWINGBLACKONE	27	{Resistance}	{"Buff Immunity",Expose,"Offense Down","Remove Turn Meter",Taunt}	POE
158	Resistance Pilot	http://swgoh.gg/characters/resistance-pilot/	//swgoh.gg/static/img/assets/tex.charui_resistancepilot.png	Resistance attacker that can use Expose, Foresight, and Turn Meter gains to surprise enemies	17977	Light Side	Attacker	XWINGRESISTANCE	28	{Resistance}	{Expose,Foresight,"Gain Turn Meter"}	RESISTANCEPILOT
159	Rey (Scavenger)	http://swgoh.gg/characters/rey-scavenger/	//swgoh.gg/static/img/assets/tex.charui_reyjakku.png	Risky Attacker that has high damage and evasion, but is vulnerable to debuffs	21168	Light Side	Attacker	MILLENNIUMFALCONEP7	30	{Resistance}	{Daze,Foresight,"Offense Up"}	REY
160	Sabine Wren	http://swgoh.gg/characters/sabine-wren/	//swgoh.gg/static/img/assets/tex.charui_sabine_s3.png	Aggressive Phoenix Attacker that permanently strips Defense and punishes slower enemies	21168	Light Side	Attacker	PHANTOM2	25	{Phoenix,Rebel}	{AoE,Counter,Expose,"Offense Up","Reduce Cooldowns"}	SABINEWRENS3
161	Scarif Rebel Pathfinder	http://swgoh.gg/characters/scarif-rebel-pathfinder/	//swgoh.gg/static/img/assets/tex.charui_rebel_scarif.png	Steadfast Rebel Tank who debuffs, Taunts, and self-revives	18187	Light Side	Tank	UWINGSCARIF	5	{Rebel,"Rogue One"}	{AoE,"Gain Turn Meter","Offense Down","Offense Up",Revive,Taunt}	SCARIFREBEL
162	Shoretrooper	http://swgoh.gg/characters/shoretrooper/	//swgoh.gg/static/img/assets/tex.charui_troopershore.png	Empire Tank who enters battle with Taunt, heals allies, and grants them Critical Hit Immunity	18187	Dark Side	Tank	TIEREAPER	36	{Empire,"Imperial Trooper"}	{Counter,"Gain Turn Meter",Heal,Taunt}	SHORETROOPER
163	Sith Assassin	http://swgoh.gg/characters/sith-assassin/	//swgoh.gg/static/img/assets/tex.charui_sithassassin.png	Elusive Sith Attacker with Stealth synergy	18187	Dark Side	Attacker	SITHFIGHTER	32	{Sith}	{Dispel,"Evasion Down",Foresight,"Gain Turn Meter","Offense Up",Stealth,Stun,"Tenacity Up"}	SITHASSASSIN
164	Sith Marauder	http://swgoh.gg/characters/sith-marauder/	//swgoh.gg/static/img/assets/tex.charui_sithmarauder.png	Destructive Sith Attacker that takes advantage of all buffs and debuffs in battle	18187	Dark Side	Attacker	SITHBOMBER	3	{Sith}	{Counter,"Gain Turn Meter","Offense Down"}	SITHMARAUDER
165	Sun Fac	http://swgoh.gg/characters/sun-fac/	//swgoh.gg/static/img/assets/tex.charui_geonosian_sunfac.png	Geonosian Tank that punishes attackers with a variety of negative status effects	18762	Dark Side	Tank	GEONOSIANSTARFIGHTER1	34	{Geonosian,Separatist}	{Counter,Dispel,"Offense Down","Remove Turn Meter",Taunt}	SUNFAC
166	TIE Fighter Pilot	http://swgoh.gg/characters/tie-fighter-pilot/	//swgoh.gg/static/img/assets/tex.charui_tiepilot.png	Empire Attacker who inflicts Buff Immunity and gains Foresight	18187	Dark Side	Attacker	TIEFIGHTERIMPERIAL	21	{Empire}	{"Ability Block",AoE,"Buff Immunity",Foresight,"Gain Turn Meter","Tenacity Down"}	TIEFIGHTERPILOT
167	Wedge Antilles	http://swgoh.gg/characters/wedge-antilles/	//swgoh.gg/static/img/assets/tex.charui_rebelpilot_wedge.png	Rebel Attacker with a strong offensive opening	18762	Light Side	Attacker	XWINGRED2	39	{Rebel}	{AoE,"Defense Down","Leader: +Max Health"}	WEDGEANTILLES
168	Young Lando Calrissian	http://swgoh.gg/characters/young-lando-calrissian/	//swgoh.gg/static/img/assets/tex.charui_younglando.png	Scoundrel Attacker that takes advantage of debuffed enemies and deals ever-increasing damage	21168	Light Side	Attacker	MILLENNIUMFALCONPRISTINE	24	{Scoundrel,Smuggler}	{"Ability Block",Counter,Dispel,"Gain Turn Meter",Stealth}	YOUNGLANDO
\.


--
-- Data for Name: ships; Type: TABLE DATA; Schema: public; Owner: Mega
--

COPY public.ships (ship_id, name, url, image, description, power, alignment, role, capital_ship, base_id, tags, abilities) FROM stdin;
1	Ahsoka Tano's Jedi Starfighter	http://swgoh.gg/ships/ahsoka-tanos-jedi-starfighter/	//swgoh.gg/static/img/assets/tex.charui_jedi_fighter_ahsoka.png	Versatile Jedi Attacker that uses dispels and buffs to adapt to the battle	49524	Light Side	Attacker	f	JEDISTARFIGHTERAHSOKATANO	{"Galactic Republic",Jedi}	{Dispel,"Gain Turn Meter","Offense Up","Reset Cooldown"}
2	Anakin's Eta-2 Starfighter	http://swgoh.gg/ships/anakins-eta-2-starfighter/	//swgoh.gg/static/img/assets/tex.charui_jedi_fighter_anakin.png	Aggressive Jedi Attacker that bolsters Offense and retaliates when allies are in trouble	49524	Light Side	Attacker	f	JEDISTARFIGHTERANAKIN	{"Galactic Republic",Jedi}	{AoE,"Buff Immunity",Expose,"Healing Immunity","Offense Up"}
3	B-28 Extinction-class Bomber	http://swgoh.gg/ships/b-28-extinction-class-bomber/	//swgoh.gg/static/img/assets/tex.charui_b28extinctionclassbomber.png	Aggressive Sith Tank with a passive Taunt and self-preservation tactics	48230	Dark Side	Tank	f	SITHBOMBER	{Sith}	{AoE,Daze,"Defense Up",Dispel,Taunt}
4	Biggs Darklighter's X-wing	http://swgoh.gg/ships/biggs-darklighters-x-wing/	//swgoh.gg/static/img/assets/tex.charui_xwing_red3.png	Heroic Rebel Tank that can exploit Target Lock for Taunts and Assists	48230	Light Side	Tank	f	XWINGRED3	{Rebel}	{Taunt}
5	Bistan's U-wing	http://swgoh.gg/ships/bistans-u-wing/	//swgoh.gg/static/img/assets/tex.charui_uwing.png	Elusive Rebel Support that boosts ally Turn Meter while using Stealth and Target Lock	57975	Light Side	Support	f	UWINGSCARIF	{Rebel,"Rogue One"}	{Assist,"Gain Turn Meter",Stealth,"Tenacity Down"}
6	Cassian's U-wing	http://swgoh.gg/ships/cassians-u-wing/	//swgoh.gg/static/img/assets/tex.charui_uwing_hero.png	Evasive Rebel Support ship that turns the tide of battle with Stealth and Turn Meter manipulation	68714	Light Side	Support	f	UWINGROGUEONE	{Rebel,"Rogue One"}	{AoE,Counter,"Defense Down",Dispel,"Gain Turn Meter","Offense Down"}
7	Chimaera	http://swgoh.gg/ships/chimaera/	//swgoh.gg/static/img/assets/tex.charui_chimaera.png	Tactical Empire Capital Ship that shuts down enemy Capital Ships and manipulates the flow of battle	60231	Dark Side	Capital Ship	t	CAPITALCHIMAERA	{Empire}	{"Ability Block",AoE,Assist,"Defense Down","Defense Up",Foresight,Heal,"Offense Down","Offense Up","Remove Turn Meter","Speed Down"}
8	Clone Sergeant's ARC-170	http://swgoh.gg/ships/clone-sergeants-arc-170/	//swgoh.gg/static/img/assets/tex.charui_arc170.png	Reliable Clone Tank that both inflicts and exploits Target Lock	48230	Light Side	Tank	f	ARC170CLONESERGEANT	{"Clone Trooper","Galactic Republic"}	{"Defense Up",Taunt}
9	Endurance	http://swgoh.gg/ships/endurance/	//swgoh.gg/static/img/assets/tex.charui_venator.png	Defensive Jedi Capital Ship that uses Valor to gain a huge Speed advantage	48112	Light Side	Capital Ship	t	CAPITALJEDICRUISER	{"Galactic Republic",Jedi}	{AoE,"Gain Turn Meter",Taunt}
10	Executrix	http://swgoh.gg/ships/executrix/	//swgoh.gg/static/img/assets/tex.charui_stardestroyer.png	Aggressive Empire Capital Ship that crushes debuffed enemies	60231	Dark Side	Capital Ship	t	CAPITALSTARDESTROYER	{Empire}	{"Ability Block",AoE,Expose,"Gain Turn Meter","Offense Up",Stun,"Tenacity Down"}
11	First Order SF TIE Fighter	http://swgoh.gg/ships/first-order-sf-tie-fighter/	//swgoh.gg/static/img/assets/tex.charui_fosf_tie_fighter.png	Superior First Order Attacker that has multiple offensive capabilities and inflicts multiple debuffs	48230	Dark Side	Attacker	f	TIEFIGHTERFOSF	{"First Order"}	{AoE,DoT}
12	First Order TIE Fighter	http://swgoh.gg/ships/first-order-tie-fighter/	//swgoh.gg/static/img/assets/tex.charui_firstorder_tiefighter.png	Aggressive First Order Attacker with reliable Target Lock and rapid-fire Special ability	53171	Dark Side	Attacker	f	TIEFIGHTERFIRSTORDER	{"First Order"}	{"Bonus Attack","Gain Turn Meter"}
13	Gauntlet Starfighter	http://swgoh.gg/ships/gauntlet-starfighter/	//swgoh.gg/static/img/assets/tex.charui_gauntlet.png	Reliable Empire Support that dispels ally debuffs and prevents enemy buffs	61223	Dark Side	Support	f	GAUNTLETSTARFIGHTER	{Empire}	{Heal}
14	Geonosian Soldier's Starfighter	http://swgoh.gg/ships/geonosian-soldiers-starfighter/	//swgoh.gg/static/img/assets/tex.charui_geonosis_fighter_soldier.png	Aggressive Separatist Attacker that can Assist allies automatically	48230	Dark Side	Attacker	f	GEONOSIANSTARFIGHTER2	{Geonosian,Separatist}	{Assist,"Gain Turn Meter","Offense Up","Remove Turn Meter"}
15	Geonosian Spy's Starfighter	http://swgoh.gg/ships/geonosian-spys-starfighter/	//swgoh.gg/static/img/assets/tex.charui_geonosis_fighter_spy.png	Elusive Separatist Attacker that uses Stealth for both offense and defense	48230	Dark Side	Attacker	f	GEONOSIANSTARFIGHTER3	{Geonosian,Separatist}	{Stealth,Taunt}
16	Ghost	http://swgoh.gg/ships/ghost/	//swgoh.gg/static/img/assets/tex.charui_ghost.png	Elusive Rebel attacker that reduces enemy Potency and wreaks havok with Rebel allies	66032	Light Side	Attacker	f	GHOST	{"Cargo Ship",Phoenix,Rebel}	{AoE,"Speed Down",Stealth}
17	Han's Millennium Falcon	http://swgoh.gg/ships/hans-millennium-falcon/	//swgoh.gg/static/img/assets/tex.charui_mfalcon.png	Highly-modified Rebel Attacker that specializes in assists and shows up at just the right time	69270	Light Side	Attacker	f	MILLENNIUMFALCON	{"Cargo Ship",Rebel,Scoundrel}	{Assist,Dispel,Foresight}
18	Home One	http://swgoh.gg/ships/home-one/	//swgoh.gg/static/img/assets/tex.charui_moncalamarilibertycruiser.png	Versatile Rebel Capital Ship that uses Advantage and bonus attacks to turn the tide	48112	Light Side	Capital Ship	t	CAPITALMONCALAMARICRUISER	{Rebel}	{Advantage,AoE,Assist,Dispel,"Gain Turn Meter","Reset Cooldown"}
19	Hound's Tooth	http://swgoh.gg/ships/hounds-tooth/	//swgoh.gg/static/img/assets/tex.charui_houndstooth.png	Sustainable Bounty Hunter Tank that debilitates enemies	63408	Dark Side	Tank	f	HOUNDSTOOTH	{"Bounty Hunters","Cargo Ship",Scoundrel}	{Counter,Dispel,Taunt}
20	IG-2000	http://swgoh.gg/ships/ig-2000/	//swgoh.gg/static/img/assets/tex.charui_ig2000.png	Aggressive Bounty Hunter Attacker that deals massive damage to Breached enemies	56701	Dark Side	Attacker	f	IG2000	{"Bounty Hunters",Droid,Scoundrel}	{AoE,"Bonus Attack","Offense Up",Stun}
21	Imperial TIE Fighter	http://swgoh.gg/ships/imperial-tie-fighter/	//swgoh.gg/static/img/assets/tex.charui_tiefighter.png	Evasive Empire Attacker that both inflicts and exploits Target Lock	48230	Dark Side	Attacker	f	TIEFIGHTERIMPERIAL	{Empire}	{"Buff Immunity",Foresight,"Remove Turn Meter"}
22	Jedi Consular's Starfighter	http://swgoh.gg/ships/jedi-consulars-starfighter/	//swgoh.gg/static/img/assets/tex.charui_jedi_fighter.png	Defensive Jedi Support that can rapidly restore ally Protection	48230	Light Side	Support	f	JEDISTARFIGHTERCONSULAR	{"Galactic Republic",Jedi}	{Assist,"Defense Up",Heal}
23	Kylo Ren's Command Shuttle	http://swgoh.gg/ships/kylo-rens-command-shuttle/	//swgoh.gg/static/img/assets/tex.charui_upsilon_shuttle_kylo.png	Durable First Order Support with unparalleled ability to manipulate allied Turn Meter	65325	Dark Side	Support	f	COMMANDSHUTTLE	{"First Order"}	{"Ability Block",Dispel,"Gain Turn Meter","Healing Immunity","Remove Turn Meter"}
24	Lando's Millennium Falcon	http://swgoh.gg/ships/landos-millennium-falcon/	//swgoh.gg/static/img/assets/tex.charui_mil_fal_pristine.png	Devastating Scoundrel attacker that becomes more threatening after each ally reinforcement	62364	Light Side	Attacker	f	MILLENNIUMFALCONPRISTINE	{"Cargo Ship",Scoundrel}	{Counter,Dispel}
25	Phantom II	http://swgoh.gg/ships/phantom-ii/	//swgoh.gg/static/img/assets/tex.charui_phantom2.png	Evasive Rebel attacker that provides as a decoy for the Ghost while applying buffs to allies	64055	Light Side	Attacker	f	PHANTOM2	{"Cargo Ship",Phoenix,Rebel}	{Advantage,Dispel,Foresight,"Offense Up",Stealth,Taunt}
26	Plo Koon's Jedi Starfighter	http://swgoh.gg/ships/plo-koons-jedi-starfighter/	//swgoh.gg/static/img/assets/tex.charui_jedi_fighter_bladeofdorin.png	Versatile Jedi Support with powerful Republic buffs and a targeted ally Taunt	49524	Light Side	Support	f	BLADEOFDORIN	{"Galactic Republic",Jedi}	{Dispel,Taunt}
27	Poe Dameron's X-wing	http://swgoh.gg/ships/poe-damerons-x-wing/	//swgoh.gg/static/img/assets/tex.charui_xwing_blackone.png	Heroic Resistance Attacker that can exploit Turn Meter and punish enemies without Protection	49524	Light Side	Attacker	f	XWINGBLACKONE	{Resistance}	{Daze,Dispel,Foresight,"Gain Turn Meter","Offense Up"}
28	Resistance X-wing	http://swgoh.gg/ships/resistance-x-wing/	//swgoh.gg/static/img/assets/tex.charui_xwing_resistance.png	Aggressive Resistance Support that shuts down enemies with Expose, Target Lock, and Daze	47757	Light Side	Support	f	XWINGRESISTANCE	{Resistance}	{Assist,Daze,Dispel,Expose,"Remove Turn Meter"}
29	Rex's ARC-170	http://swgoh.gg/ships/rexs-arc-170/	//swgoh.gg/static/img/assets/tex.charui_arc170_02.png	Defensive Clone Tank that can inflict Target Lock and boost ally Protection and Tenacity	49524	Light Side	Tank	f	ARC170REX	{"Clone Trooper","Galactic Republic"}	{"Remove Turn Meter"}
30	Rey's Millennium Falcon	http://swgoh.gg/ships/reys-millennium-falcon/	//swgoh.gg/static/img/assets/tex.charui_mfalcon_ep7.png	Daring Resistance freighter that can turn the tide by sacrificing buffs	65247	Light Side	Attacker	f	MILLENNIUMFALCONEP7	{"Cargo Ship",Resistance}	{Counter,"Gain Turn Meter"}
31	Scimitar	http://swgoh.gg/ships/scimitar/	//swgoh.gg/static/img/assets/tex.charui_sithinfiltrator.png	Deadly Sith Support that can Stealth allies to set up devastating attacks	54937	Dark Side	Support	f	SITHINFILTRATOR	{Sith}	{"Remove Turn Meter",Stealth}
32	Sith Fighter	http://swgoh.gg/ships/sith-fighter/	//swgoh.gg/static/img/assets/tex.charui_sithfighter.png	Agile Sith Attacker that bypasses enemy defenses	45347	Dark Side	Attacker	f	SITHFIGHTER	{Sith}	{Foresight,"Gain Turn Meter","Healing Immunity"}
33	Slave I	http://swgoh.gg/ships/slave-i/	//swgoh.gg/static/img/assets/tex.charui_slave1.png	Deadly Bounty Hunter Attacker that inflicts and exploits Target Lock for high area-of-effect damage	58467	Dark Side	Attacker	f	SLAVE1	{"Bounty Hunters","Cargo Ship",Scoundrel}	{"Ability Block",AoE,Counter,"Gain Turn Meter",Taunt}
34	Sun Fac's Geonosian Starfighter	http://swgoh.gg/ships/sun-facs-geonosian-starfighter/	//swgoh.gg/static/img/assets/tex.charui_geonosis_fighter_sunfac.png	Punishing Separatist Tank that automatically Taunts against buffed enemies	49524	Dark Side	Tank	f	GEONOSIANSTARFIGHTER1	{Geonosian,Separatist}	{"Gain Turn Meter","Remove Turn Meter",Stun,Taunt}
35	TIE Advanced x1	http://swgoh.gg/ships/tie-advanced-x1/	//swgoh.gg/static/img/assets/tex.charui_tieadvanced.png	Fearsome Empire Attacker that shuts enemies down with stacking debuffs and permanent Target Locks	61642	Dark Side	Attacker	f	TIEADVANCED	{Empire,Sith}	{AoE,DoT,"Gain Turn Meter","Offense Down"}
36	TIE Reaper	http://swgoh.gg/ships/tie-reaper/	//swgoh.gg/static/img/assets/tex.charui_tiereaper.png	Defensive Empire Support that Dispels, delays cooldowns, and removes Turn Meter from the enemy Capital Ship	61223	Dark Side	Support	f	TIEREAPER	{Empire}	{AoE,"Defense Down","Gain Turn Meter","Offense Down","Remove Turn Meter"}
37	TIE Silencer	http://swgoh.gg/ships/tie-silencer/	//swgoh.gg/static/img/assets/tex.charui_tie_silencer.png	Superior First Order Attacker that gains unlimited speed and deals massive damage	61642	Dark Side	Attacker	f	TIESILENCER	{"First Order"}	{Advantage,Dispel,Foresight,"Gain Turn Meter","Reduce Cooldowns",Stun}
38	Umbaran Starfighter	http://swgoh.gg/ships/umbaran-starfighter/	//swgoh.gg/static/img/assets/tex.charui_umbaran_star_fighter.png	Risky Clone Tank that inflicts great damage and debuffs, but grants Turn Meter to enemies	54937	Light Side	Tank	f	UMBARANSTARFIGHTER	{"Clone Trooper","Galactic Republic"}	{AoE,Counter,"Defense Down",Dispel,"Gain Turn Meter","Offense Down","Remove Turn Meter"}
39	Wedge Antilles's X-wing	http://swgoh.gg/ships/wedge-antilless-x-wing/	//swgoh.gg/static/img/assets/tex.charui_xwing_red2.png	Aggressive Rebel Attacker that overwhelms enemies with debuffs	49524	Light Side	Attacker	f	XWINGRED2	{Rebel}	{"Buff Immunity",DoT,"Gain Turn Meter","Healing Immunity"}
40	Xanadu Blood	http://swgoh.gg/ships/xanadu-blood/	//swgoh.gg/static/img/assets/tex.charui_xanadublood.png	Debilitating Bounty Hunter Support that shuts down enemy offenses	51760	Dark Side	Support	f	XANADUBLOOD	{"Bounty Hunters",Scoundrel}	{AoE,Assist,"Bonus Attack",Counter,"Defense Down"}
\.


--
-- Name: abilities_ability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mega
--

SELECT pg_catalog.setval('public.abilities_ability_id_seq', 863, true);


--
-- Name: characters_char_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mega
--

SELECT pg_catalog.setval('public.characters_char_id_seq', 168, true);


--
-- Name: ships_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mega
--

SELECT pg_catalog.setval('public.ships_ship_id_seq', 41, true);


--
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: Mega
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (ability_id);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: Mega
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (char_id);


--
-- Name: ships ships_pkey; Type: CONSTRAINT; Schema: public; Owner: Mega
--

ALTER TABLE ONLY public.ships
    ADD CONSTRAINT ships_pkey PRIMARY KEY (ship_id);


--
-- Name: abilities abilities_char_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mega
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_char_table_id_fkey FOREIGN KEY (char_table_id) REFERENCES public.characters(char_id);


--
-- Name: abilities abilities_ship_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mega
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_ship_table_id_fkey FOREIGN KEY (ship_table_id) REFERENCES public.ships(ship_id);


--
-- Name: characters characters_ship_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mega
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_ship_id_fkey FOREIGN KEY (ship_id) REFERENCES public.ships(ship_id);


--
-- PostgreSQL database dump complete
--

