--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animation; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE animation (
    id bigint NOT NULL,
    type character varying(3) NOT NULL,
    date_creation date,
    libelle character varying(100),
    description character varying(250),
    prete integer,
    date_debut_validite date,
    date_fin_validite date,
    validite_permanente boolean,
    createur character varying(100),
    duree integer,
    fichier_animation character varying(250),
    fichier_vignette character varying(250),
    fichier_apercu character varying(250),
    hashage character varying(50),
    categorie_id bigint,
    langue_id bigint,
    generee boolean,
    validee boolean,
    descripteur_xml character varying(20000)
);


ALTER TABLE public.animation OWNER TO tc1_user;

--
-- Name: categorie; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE categorie (
    id bigint NOT NULL,
    date_creation date,
    libelle character varying(40),
    metier_id bigint,
    utilisateur_id bigint,
    theme_id bigint,
    parent_id bigint,
    type character varying(6)
);


ALTER TABLE public.categorie OWNER TO tc1_user;

--
-- Name: coordonnees; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE coordonnees (
    id bigint NOT NULL,
    date_creation date,
    voie character varying(40),
    lieu_dit character varying(40),
    code_postal character varying(10),
    localite character varying(40),
    telephone_fixe character varying(25),
    fax character varying(25),
    nom_boutique character varying(50),
    horaires_ouverture_boutique character varying(250),
    coordonnees_gps_boutique character varying(50),
    pays_id bigint NOT NULL
);


ALTER TABLE public.coordonnees OWNER TO tc1_user;

--
-- Name: langue; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE langue (
    id bigint NOT NULL,
    date_creation date,
    code character varying(5) NOT NULL,
    libelle character varying(50) NOT NULL
);


ALTER TABLE public.langue OWNER TO tc1_user;

--
-- Name: lien; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE lien (
    id bigint NOT NULL,
    date_creation date,
    description character varying(200),
    adresse character varying(200),
    utilisateur_id bigint NOT NULL
);


ALTER TABLE public.lien OWNER TO tc1_user;

--
-- Name: lightnpop; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE lightnpop (
    id bigint NOT NULL,
    date_creation date,
    numero_serie character varying(50),
    utilisateur_id bigint NOT NULL
);


ALTER TABLE public.lightnpop OWNER TO tc1_user;

--
-- Name: log_acces; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE log_acces (
    id bigint NOT NULL,
    date_creation date,
    ip_publique character varying(100),
    ip_privee character varying(100),
    id_utilisateur bigint
);


ALTER TABLE public.log_acces OWNER TO tc1_user;

--
-- Name: metier; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE metier (
    id bigint NOT NULL,
    date_creation date,
    libelle character varying(300) NOT NULL
);


ALTER TABLE public.metier OWNER TO tc1_user;

--
-- Name: pays; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE pays (
    id bigint NOT NULL,
    date_creation date,
    code character varying(5) NOT NULL,
    libelle character varying(50) NOT NULL
);


ALTER TABLE public.pays OWNER TO tc1_user;

--
-- Name: scenario; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE scenario (
    id bigint NOT NULL,
    date_creation date,
    libelle character varying(100),
    utilisateur_id bigint,
    type character varying(6)
);


ALTER TABLE public.scenario OWNER TO tc1_user;

--
-- Name: scenario_animation; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE scenario_animation (
    scenario_id bigint NOT NULL,
    numero_ordre integer NOT NULL,
    animation_id bigint NOT NULL
);


ALTER TABLE public.scenario_animation OWNER TO tc1_user;

--
-- Name: seq_animation; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_animation
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_animation OWNER TO tc1_user;

--
-- Name: seq_animation; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_animation', 2427, true);


--
-- Name: seq_categorie; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_categorie
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_categorie OWNER TO tc1_user;

--
-- Name: seq_categorie; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_categorie', 1317, true);


--
-- Name: seq_coordonnees; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_coordonnees
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_coordonnees OWNER TO tc1_user;

--
-- Name: seq_coordonnees; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_coordonnees', 1019, true);


--
-- Name: seq_langue; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_langue
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_langue OWNER TO tc1_user;

--
-- Name: seq_langue; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_langue', 1000, false);


--
-- Name: seq_lien; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_lien
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_lien OWNER TO tc1_user;

--
-- Name: seq_lien; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_lien', 1000, false);


--
-- Name: seq_lightnpop; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_lightnpop
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_lightnpop OWNER TO tc1_user;

--
-- Name: seq_lightnpop; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_lightnpop', 1000, false);


--
-- Name: seq_log_acces; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_log_acces
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_log_acces OWNER TO tc1_user;

--
-- Name: seq_log_acces; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_log_acces', 1299, true);


--
-- Name: seq_metier; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_metier
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_metier OWNER TO tc1_user;

--
-- Name: seq_metier; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_metier', 1010, true);


--
-- Name: seq_pays; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_pays
    START WITH 1000
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_pays OWNER TO tc1_user;

--
-- Name: seq_pays; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_pays', 1000, false);


--
-- Name: seq_scenario; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_scenario
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_scenario OWNER TO tc1_user;

--
-- Name: seq_scenario; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_scenario', 1146, true);


--
-- Name: seq_theme; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_theme
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_theme OWNER TO tc1_user;

--
-- Name: seq_theme; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_theme', 1000, true);


--
-- Name: seq_utilisateur; Type: SEQUENCE; Schema: public; Owner: tc1_user
--

CREATE SEQUENCE seq_utilisateur
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.seq_utilisateur OWNER TO tc1_user;

--
-- Name: seq_utilisateur; Type: SEQUENCE SET; Schema: public; Owner: tc1_user
--

SELECT pg_catalog.setval('seq_utilisateur', 1020, true);


--
-- Name: theme; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE theme (
    id bigint NOT NULL,
    date_creation date,
    libelle character varying(300) NOT NULL,
    date_debut_validite date,
    date_fin_validite date,
    validite_permanente boolean
);


ALTER TABLE public.theme OWNER TO tc1_user;

--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE utilisateur (
    id bigint NOT NULL,
    type character varying(3) NOT NULL,
    date_creation date,
    nom character varying(50),
    prenom character varying(50),
    civilite character varying(5),
    login character varying(50),
    password character varying(50),
    email character varying(40),
    telephone_portable character varying(25),
    compte_actif boolean,
    coordonnees_id bigint NOT NULL,
    langue_id bigint NOT NULL,
    proprietes character varying(500),
    createur_id bigint,
    description_commerce character varying(2000),
    controle_total boolean
);


ALTER TABLE public.utilisateur OWNER TO tc1_user;

--
-- Name: utilisateur_metier; Type: TABLE; Schema: public; Owner: tc1_user; Tablespace: 
--

CREATE TABLE utilisateur_metier (
    utilisateur_id bigint NOT NULL,
    metier_id bigint NOT NULL
);


ALTER TABLE public.utilisateur_metier OWNER TO tc1_user;

--
-- Data for Name: animation; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY animation (id, type, date_creation, libelle, description, prete, date_debut_validite, date_fin_validite, validite_permanente, createur, duree, fichier_animation, fichier_vignette, fichier_apercu, hashage, categorie_id, langue_id, generee, validee, descripteur_xml) FROM stdin;
1994	IMG	2009-10-13	elodie	\N	0	\N	\N	t	M Michel Tattoo	15	elodie_1994.jpg	elodie_1994_vignette.jpg	\N		1160	1	f	f	\N
1103	VID	2008-12-04	Coiff3	\N	1	\N	\N	f	M prenom nom	20	000007424857_HDFlashVideo_1103.mpg	000007424857_HDFlashVideo_1103_vignette.jpg	000007424857_HDFlashVideo_1103_apercu.flv	36d41dce955710cdaa9ff04c4810c7e1	1033	1	\N	t	\N
1744	IMG	2009-08-24	Biomécanic body suit 1	\N	0	\N	\N	t	M Michel abc	15	000_0008_1744.jpg	000_0008_1744_vignette.jpg	\N	489f579d796eec8b92aedba785b30ba5	1135	1	f	f	\N
1735	VID	2009-07-29	adoptez	\N	1	\N	\N	f	M Hervé Pichonneau	28	adoptez_1735.mpg	adoptez_1735_vignette.jpg	adoptez_1735_apercu.flv	cb38cdff72f9dd6e3dd56b41a9eae567	1130	1	\N	\N	\N
1102	VID	2008-12-04	Coiff2	\N	1	\N	\N	f	M prenom nom	19	000005432075_SDFlashVideo_1102.mpg	000005432075_SDFlashVideo_1102_vignette.jpg	000005432075_SDFlashVideo_1102_apercu.flv	a037c9f2e28810644e90517f2598609c	1033	1	\N	t	\N
2333	VID	2012-02-24	640x360	\N	1	\N	\N	f	M Michel Tattoo	9	640x360_2333.mpg	640x360_2333_vignette.jpg	640x360_2333_apercu.flv	060eb3f0d4d85508b19996b0eb4cc287	1154	1	\N	\N	\N
1203	IMG	2009-02-16	070823 0020	\N	0	\N	\N	t	M prenom nom	15	070823_0020_1203.jpg	070823_0020_1203_vignette.jpg	\N	bd5273f43656d5c0624bd5bfc7d5f807	1044	1	f	f	\N
1471	IMG	2009-05-11	fond	\N	0	\N	\N	t	M Philippe Pugnat	15	fond_1471.jpg	fond_1471_vignette.jpg	\N	814e8407cce8ad11d60ba526c237d6dc	1102	1	f	f	\N
1866	VID	2009-09-01	Tattoo	\N	1	\N	\N	f	M Michel abc	82	Tattoo_1866.mpg	Tattoo_1866_vignette.jpg	Tattoo_1866_apercu.flv	1342b03c9f019aa0081a662aa32eba6d	1146	1	\N	\N	\N
1204	IMG	2009-02-16	070823 0028	\N	0	\N	\N	t	M prenom nom	15	070823_0028_1204.jpg	070823_0028_1204_vignette.jpg	\N	3fdda63d65e6fc786464681bc9b82a04	1044	1	f	f	\N
1651	IMG	2009-05-22	zen4	\N	0	\N	\N	t	M José Awouma	15	zen4_1651.jpg	zen4_1651_vignette.jpg	\N	0ed60549dbbfdab3412dfb8bc502faca	1118	1	f	f	\N
1205	IMG	2009-02-16	070823 0033	\N	0	\N	\N	t	M prenom nom	15	070823_0033_1205.jpg	070823_0033_1205_vignette.jpg	\N	440779512361888b8d12a850d7560500	1044	1	f	f	\N
1523	IMG	2009-05-18	biophase	\N	0	\N	\N	t	M Hervé Pichonneau	15	biophase_1523.jpg	biophase_1523_vignette.jpg	\N	95a5fb8f93a42f6e5d1b76ccafe0b604	1112	1	f	f	\N
1297	VID	2009-04-07	after coiffure	\N	1	\N	\N	f	M Javier Gonzalez	19	after_coiffure_1297.mpg	after_coiffure_1297_vignette.jpg	after_coiffure_1297_apercu.flv	121ceebe929dda799c2c8e24d6ececad	1024	1	\N	\N	\N
1472	IMG	2009-05-11	pdts-TIGI3	\N	0	\N	\N	t	M Philippe Pugnat	15	pdts_TIGI3_1472.jpg	pdts_TIGI3_1472_vignette.jpg	\N	2139dea8d63e219c460342af275a197f	1102	1	f	f	\N
1547	VID	2009-05-19	biophase	\N	1	\N	\N	f	M Philippe Pugnat	57	biophase_1547.mpg	biophase_1547_vignette.jpg	biophase_1547_apercu.flv	705c7ede1dcf1865a880ba6ce789fb83	1105	1	\N	\N	\N
1109	IMG	2008-12-04	coiffure1	\N	0	\N	\N	t	M prenom nom	15	coiffure1_1109.jpg	coiffure1_1109_vignette.jpg	\N	0ece48fef4f0dd7f1b335e995adcb62b	1113	1	f	t	\N
1473	IMG	2009-05-11	pdts-TIGI4	\N	0	\N	\N	t	M Philippe Pugnat	15	pdts_TIGI4_1473.jpg	pdts_TIGI4_1473_vignette.jpg	\N	b18e8dc372ff61146845c655c05d47d5	1102	1	f	f	\N
1524	IMG	2009-05-18	logo	\N	0	\N	\N	t	M Hervé Pichonneau	15	logo_1524.jpg	logo_1524_vignette.jpg	\N	de2531d329f1260849b97ab6743677a7	1112	1	f	f	\N
1474	IMG	2009-05-11	pdts-TIGI	\N	0	\N	\N	t	M Philippe Pugnat	15	pdts_TIGI_1474.jpg	pdts_TIGI_1474_vignette.jpg	\N	170be382f01d67cbf82d29cd6e285053	1102	1	f	f	\N
1525	IMG	2009-05-18	photo1	\N	0	\N	\N	t	M Hervé Pichonneau	15	photo1_1525.jpg	photo1_1525_vignette.jpg	\N	f7e90d81e5cdeeaa26cf47b4d0abc833	1112	1	f	f	\N
1401	IMG	2009-05-07	Bio.rritz 059	\N	0	\N	\N	t	M Philippe Pugnat	15	Bio.rritz_059_1401.jpg	Bio.rritz_059_1401_vignette.jpg	\N	1eecfb68c39fd89a4ded44e0ebbf42d2	1296	1	f	f	\N
1808	IMG	2009-08-31	Carpe Japonaise Mollet	\N	0	\N	\N	t	M Michel abc	15	100_1470_1808.jpg	100_1470_1808_vignette.jpg	\N	c2f6c778fa58f411dec3808266cf64b7	1135	1	f	f	\N
1809	IMG	2009-08-31	Bouddha Tribal Dos	\N	0	\N	\N	t	M Michel abc	15	100_1614_1809.jpg	100_1614_1809_vignette.jpg	\N	20f29e34e11828e4d6b7d77c0aa70105	1135	1	f	f	\N
1652	VID	2009-05-22	atlanthal1	\N	1	\N	\N	f	M José Awouma	25	atlanthal1_1652.mpg	atlanthal1_1652_vignette.jpg	atlanthal1_1652_apercu.flv	87f36cccbf48a4542d2946c23d846213	1118	1	\N	\N	\N
1232	VID	2009-03-17	choix des verres	\N	1	\N	\N	f	M prenom nom	11	choix_des_verres_1232.mpg	choix_des_verres_1232_vignette.jpg	choix_des_verres_1232_apercu.flv	f43ca088038adeff2c5a08fa95a13a1e	1048	1	\N	t	\N
1242	IMG	2009-03-18	V04_Rennes_optique_laurence_taillandier_T_1184_4353_8406	\N	0	\N	\N	t	M prenom nom	15	V04_Rennes_optique_laurence_taillandier_T_1184_4353_8406_1242.jpg	V04_Rennes_optique_laurence_taillandier_T_1184_4353_8406_1242_vignette.jpg	\N	2d95f9692bc3fabff9b13602f831a3a7	1048	1	f	f	\N
1971	IMG	2009-10-12	DSCF2015	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF2015_1971.jpg	DSCF2015_1971_vignette.jpg	\N		1159	1	f	f	\N
1001	TPL	2009-02-07	TPL2	\N	1	\N	\N	t	mm	0	\N	\N	\N	\N	1	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="jingle" nomClasse="jingle1" nomContainer="main_cont" largeur="1024" hauteur="768">\n  <ZoneTexte label="Titre" nomAttribut="main_cont#t1_cont#bignom_cont#bignom"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="28" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">Jingle</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Image du produit" nomAttribut="main_cont#i1_cont#fond" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.publivision.fr/template/1001/data/neutre2.jpg" valeurVignette="http://fichierclient.publivision.fr/template/1001/vignette/neutre2.jpg" urlRepertoireImages="http://fichierclient.publivision.fr/template/1001/fond/" urlRepertoireVignettes="http://fichierclient.publivision.fr/template/1001/fond/vignette/" urlListeImages="http://fichierclient.publivision.fr/template/1001/fond/vignette/?C=M;O=D;F=0"/>\n</Template>
1225	VID	2009-02-25	millesima	\N	1	\N	\N	f	M prenom nom	18	millesima_1225.mpg	millesima_1225_vignette.jpg	millesima_1225_apercu.flv	9a42cd189f989ade0764ecb2a6a41828	1045	1	\N	\N	\N
1206	VID	2009-02-16	Thermoshutter	\N	1	\N	\N	f	M prenom nom	117	Thermoshutter_1206.mpg	Thermoshutter_1206_vignette.jpg	Thermoshutter_1206_apercu.flv	a9ea55ba2a773891526acbb4e44ff84b	1044	1	\N	\N	\N
1736	VID	2009-07-29	purina	\N	1	\N	\N	f	M Hervé Pichonneau	61	purina_1736.mpg	purina_1736_vignette.jpg	purina_1736_apercu.flv	e544259b5b147685c25594a86c47bd80	1130	1	\N	\N	\N
1526	IMG	2009-05-18	photo2	\N	0	\N	\N	t	M Hervé Pichonneau	15	photo2_1526.jpg	photo2_1526_vignette.jpg	\N	875bd90c0b40ee232d2c3aaea551bbeb	1112	1	f	f	\N
1146	VID	2009-01-09	000006477787_HDFlashVideo	\N	1	\N	\N	f	M Javier Gonzalez	11	000006477787_HDFlashVideo_1146.mpg	000006477787_HDFlashVideo_1146_vignette.jpg	000006477787_HDFlashVideo_1146_apercu.flv	5dc3e24ac873b60cd2fe619fa7ef302f	1003	1	\N	\N	\N
1243	IMG	2009-03-18	LUNETTES	\N	0	\N	\N	t	M prenom nom	15	LUNETTES_1243.jpg	LUNETTES_1243_vignette.jpg	\N	2eeba820e29f34df921700d7a66910ad	1048	1	f	f	\N
1986	IMG	2009-10-13	carpe7	\N	0	\N	\N	t	M Michel Tattoo	15	carpe7_1986.jpg	carpe7_1986_vignette.jpg	\N		1160	1	f	f	\N
1298	IMG	2009-04-07	demandez-nous	\N	0	\N	\N	t	M Javier Gonzalez	15	demandez_nous_1298.jpg	demandez_nous_1298_vignette.jpg	\N	dccb8a3e3a14574fbd8342b931b0e86f	1025	1	f	f	\N
1244	IMG	2009-03-18	lunettes-mystic-gris	\N	0	\N	\N	t	M prenom nom	15	lunettes_mystic_gris_1244.jpg	lunettes_mystic_gris_1244_vignette.jpg	\N	aa7a3bcea21982a2a05046d922d1bc9e	1048	1	f	f	\N
1548	IMG	2009-05-19	Numériser0077	\N	0	\N	\N	t	M Philippe Pugnat	15	Num_riser0077_1548.jpg	Num_riser0077_1548_vignette.jpg	\N	9d481fb97960eb21b67dd75d90a18786	1105	1	f	f	\N
2102	VID	2010-02-08	3	\N	1	\N	\N	f	M Marc Truche	28	3_2102.mpg	3_2102_vignette.jpg	3_2102_apercu.flv	f8430d11aef373119dea45e98ac2b75b	1103	1	\N	\N	\N
1527	IMG	2009-05-18	photo3	\N	0	\N	\N	t	M Hervé Pichonneau	15	photo3_1527.jpg	photo3_1527_vignette.jpg	\N	9cd1ed3eca088ba980bed242112d8637	1112	1	f	f	\N
1475	VID	2009-05-11	after coiffureintro	\N	1	\N	\N	f	M Philippe Pugnat	17	after_coiffure_1475.mpg	after_coiffure_1475_vignette.jpg	after_coiffure_1475_apercu.flv	121ceebe929dda799c2c8e24d6ececad	1102	1	\N	\N	\N
1549	IMG	2009-05-19	Numériser0078	\N	0	\N	\N	t	M Philippe Pugnat	15	Num_riser0078_1549.jpg	Num_riser0078_1549_vignette.jpg	\N	c3a0bb88e4ca91abfed7ca3ff53571ab	1105	1	f	f	\N
1528	VID	2009-05-18	zen	\N	1	\N	\N	f	M Hervé Pichonneau	29	zen_1528.mpg	zen_1528_vignette.jpg	zen_1528_apercu.flv	800b5467e26f312f7fe1e28924cfd317	1112	1	\N	\N	\N
2334	IMG	2012-02-24	Nénuphars	\N	0	\N	\N	t	M Michel Tattoo	15	N_nuphars_2334.jpg	N_nuphars_2334_vignette.jpg	\N		1154	1	f	f	\N
2164	VID	2010-03-05	16-9	\N	1	\N	\N	f	M prenom compte a/a	39	16_9_2164.mpg	16_9_2164_vignette.jpg	16_9_2164_apercu.flv	06f8e32ef8897464f68b4ca4ca89a995	1045	1	\N	\N	\N
1550	IMG	2009-05-19	Numériser0014	\N	0	\N	\N	t	M Philippe Pugnat	15	Num_riser0014_1550.jpg	Num_riser0014_1550_vignette.jpg	\N	6f5ceaf154d90fefb20e2a70bab4807d	1105	1	f	f	\N
1972	IMG	2009-10-12	DSCF2016	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF2016_1972.jpg	DSCF2016_1972_vignette.jpg	\N		1159	1	f	f	\N
1552	IMG	2009-05-19	Numériser0018	\N	0	\N	\N	t	M Philippe Pugnat	15	Num_riser0018_1552.jpg	Num_riser0018_1552_vignette.jpg	\N	c91d03557d7cee41d2e0a69221cd5c06	1105	1	f	f	\N
1129	IMG	2008-12-17	modele-coiffure	\N	0	\N	\N	t	M prenom nom	15	modele_coiffure_1129.jpg	modele_coiffure_1129_vignette.jpg	\N	2a3797ac1fef09f9a91ac81f031885d1	1113	1	f	f	\N
1529	VID	2009-05-18	biophase	\N	1	\N	\N	f	M Hervé Pichonneau	57	biophase_1529.mpg	biophase_1529_vignette.jpg	biophase_1529_apercu.flv	7cf65cf88539540a6443b61a823c5728	1112	1	\N	\N	\N
1196	VID	2009-02-16	onde1	\N	1	\N	\N	f	M prenom nom	16	onde1_1196.mpg	onde1_1196_vignette.jpg	onde1_1196_apercu.flv	c2922e2df4d5fbca01fefc3d2c4949f5	1044	1	\N	\N	\N
1113	IMG	2008-12-04	coiffuresherbrooke27a	\N	0	\N	\N	t	M prenom nom	15	coiffuresherbrooke27a_1113.jpg	coiffuresherbrooke27a_1113_vignette.jpg	\N	b6613db3a11a293abb4bb4577a218e70	1113	1	f	t	\N
1226	VID	2009-02-25	millesima complet	\N	1	\N	\N	f	M prenom nom	50	millesima_complet_1226.mpg	millesima_complet_1226_vignette.jpg	millesima_complet_1226_apercu.flv	6d1d9b9e0f7b8fdb19911fa92ca9c667	1045	1	\N	\N	\N
1114	IMG	2008-12-04	coiffure-0	\N	0	\N	\N	t	M prenom nom	15	coiffure_0_1114.jpg	coiffure_0_1114_vignette.jpg	\N	f01f723719186b1287d40dbf3649ed40	1113	1	f	t	\N
1112	VID	2008-12-04	coiff2	\N	1	\N	\N	f	M prenom nom	21	2_1112.mpg	2_1112_vignette.jpg	2_1112_apercu.flv	b552c2b3f2818e2c89a890d139644db4	1113	1	\N	\N	\N
1111	VID	2008-12-04	1	\N	1	\N	\N	f	M prenom nom	18	1_1111.mpg	1_1111_vignette.jpg	1_1111_apercu.flv	9fdda455f3be077723a9a287b689af2c	1113	1	\N	\N	\N
1303	IMG	2009-04-07	visage4	\N	0	\N	\N	t	M Javier Gonzalez	15	visage4_1303.jpg	visage4_1303_vignette.jpg	\N	b52731acf6ab0cc472a81c1f9218ea8c	1068	1	f	f	\N
1161	VID	2009-01-20	iStock_000005425456Small We	\N	1	\N	\N	f	M prenom nom	17	iStock_000005425456Small_We_1161.mpg	iStock_000005425456Small_We_1161_vignette.jpg	iStock_000005425456Small_We_1161_apercu.flv	63b2b2ae9c087336f5943a72ee7d273e	1113	1	\N	\N	\N
1278	VID	2009-04-05	after coiffure	\N	1	\N	\N	f	M Javier Gonzalez	19	after_coiffure_1278.mpg	after_coiffure_1278_vignette.jpg	after_coiffure_1278_apercu.flv	121ceebe929dda799c2c8e24d6ececad	1068	1	\N	\N	\N
1476	VID	2009-05-11	carte fidelite	\N	1	\N	\N	f	M Philippe Pugnat	22	carte_fidelit__1476.mpg	carte_fidelit__1476_vignette.jpg	carte_fidelit__1476_apercu.flv	c32df9930804a6132591c91856e6e223	1102	1	\N	\N	\N
1477	VID	2009-05-11	compania del color	\N	1	\N	\N	f	M Philippe Pugnat	28	compania_del_color_1477.mpg	compania_del_color_1477_vignette.jpg	compania_del_color_1477_apercu.flv	ed054fb94a1c85e5bfe53c0b77124f93	1102	1	\N	\N	\N
1810	IMG	2009-08-31	Crâne Mexicain Mollet	\N	0	\N	\N	t	M Michel abc	15	100_1667_1810.jpg	100_1667_1810_vignette.jpg	\N	9b5be16ef71ccf6ae3a833de9cd35c01	1135	1	f	f	\N
1189	VID	2009-02-09	4	\N	1	\N	\N	f	M prenom nom	6	4_1189.mpg	4_1189_vignette.jpg	4_1189_apercu.flv	95081fd72520f5856f7b3ba3c22b6706	1045	1	\N	\N	\N
1611	IMG	2009-05-20	fond	\N	0	\N	\N	t	M José Awouma	15	fond_1611.jpg	fond_1611_vignette.jpg	\N	814e8407cce8ad11d60ba526c237d6dc	1117	1	f	f	\N
1653	VID	2009-05-22	atlanthal entier	\N	1	\N	\N	f	M José Awouma	53	atlanthal_entier_1653.mpg	atlanthal_entier_1653_vignette.jpg	atlanthal_entier_1653_apercu.flv	942708ebfb5e1ee310d5006b5fa427e3	1118	1	\N	\N	\N
1590	IMG	2009-05-19	arveyres	\N	0	\N	\N	t	M prenom compte a/a	15	arveyres_1590.jpg	arveyres_1590_vignette.jpg	\N	cc2aef65febec9d56825f2019d1c381d	1014	1	f	f	\N
1811	IMG	2009-08-31	Corne Tribal Dos	\N	0	\N	\N	t	M Michel abc	15	102_1577_1811.jpg	102_1577_1811_vignette.jpg	\N	180f2744a8a8b3479dd39f7fe36a7498	1135	1	f	f	\N
1612	IMG	2009-05-20	pdts-TIGI	\N	0	\N	\N	t	M José Awouma	15	pdts_TIGI_1612.jpg	pdts_TIGI_1612_vignette.jpg	\N	170be382f01d67cbf82d29cd6e285053	1117	1	f	f	\N
1737	VID	2009-07-29	scanil	\N	1	\N	\N	f	M Hervé Pichonneau	42	scanil_1737.mpg	scanil_1737_vignette.jpg	scanil_1737_apercu.flv	829153105698ebe64abf793c4234a01b	1130	1	\N	\N	\N
1654	VID	2009-05-22	zen	\N	1	\N	\N	f	M José Awouma	28	zen_1654.mpg	zen_1654_vignette.jpg	zen_1654_apercu.flv	e48b717969d5080a01c32a3df7f500c4	1118	1	\N	\N	\N
1591	VID	2009-05-19	ambares T4i	\N	1	\N	\N	f	M prenom compte a/a	8	ambares_T4i_1591.mpg	ambares_T4i_1591_vignette.jpg	ambares_T4i_1591_apercu.flv	9b88fabdde879e84e4ba01bdb64d250e	1012	1	\N	\N	\N
1613	IMG	2009-05-20	pdts-TIGI2	\N	0	\N	\N	t	M José Awouma	15	pdts_TIGI2_1613.jpg	pdts_TIGI2_1613_vignette.jpg	\N	8feccdc1513a29f382d0643f633e340d	1117	1	f	f	\N
1812	IMG	2009-08-31	Bras Poulpe Cover Up 1	\N	0	\N	\N	t	M Michel abc	15	102_1597_1812.jpg	102_1597_1812_vignette.jpg	\N	b7fa78ef43c0f1df349d3e1df46eb381	1135	1	f	f	\N
1614	IMG	2009-05-20	pdts-TIGI3	\N	0	\N	\N	t	M José Awouma	15	pdts_TIGI3_1614.jpg	pdts_TIGI3_1614_vignette.jpg	\N	2139dea8d63e219c460342af275a197f	1117	1	f	f	\N
1813	IMG	2009-08-31	Bras Poulpe Cover Up 2	\N	0	\N	\N	t	M Michel abc	15	102_1598_1813.jpg	102_1598_1813_vignette.jpg	\N	cbb65f7e4482e012fd84d2c3ef4a3eee	1135	1	f	f	\N
2335	IMG	2012-03-05	pub	\N	0	\N	\N	t	M Daniel Bantegnies	15	pub_2335.jpg	pub_2335_vignette.jpg	\N		1288	1	f	f	\N
2004	IMG	2009-10-14	jesuce	\N	0	\N	\N	t	M Michel Tattoo	15	jesuce_2004.jpg	jesuce_2004_vignette.jpg	\N		1160	1	f	f	\N
1869	IMG	2009-09-02	zzzzz	\N	0	\N	\N	t	M Philippe Pugnat	15	zzzzz_1869.jpg	zzzzz_1869_vignette.jpg	\N		1071	1	f	f	\N
1987	IMG	2009-10-13	celtic1	\N	0	\N	\N	t	M Michel Tattoo	15	celtic1_1987.jpg	celtic1_1987_vignette.jpg	\N		1160	1	f	f	\N
1190	VID	2009-02-09	millesima	\N	1	\N	\N	f	M prenom nom	165	millesima_1190.mpg	millesima_1190_vignette.jpg	millesima_1190_apercu.flv	60f1c4952de9f48928746e0cfcd11a28	1045	1	\N	\N	\N
1621	VID	2009-05-20	after coiffure	\N	1	\N	\N	f	M José Awouma	17	after_coiffure_1621.mpg	after_coiffure_1621_vignette.jpg	after_coiffure_1621_apercu.flv	121ceebe929dda799c2c8e24d6ececad	1117	1	\N	\N	\N
1754	IMG	2009-08-31	Masque japonais	\N	0	\N	\N	t	M Michel abc	15	000_0037_1754.jpg	000_0037_1754_vignette.jpg	\N	00f5caeb7cc05962ba54d47f7ae4b8ac	1135	1	f	f	\N
1615	IMG	2009-05-20	pdts-TIGI4	\N	0	\N	\N	t	M José Awouma	15	pdts_TIGI4_1615.jpg	pdts_TIGI4_1615_vignette.jpg	\N	b18e8dc372ff61146845c655c05d47d5	1117	1	f	f	\N
1655	IMG	2009-05-22	biophase	\N	0	\N	\N	t	M José Awouma	15	biophase_1655.jpg	biophase_1655_vignette.jpg	\N	95a5fb8f93a42f6e5d1b76ccafe0b604	1119	1	f	f	\N
1478	VID	2009-05-11	tigi	\N	1	\N	\N	f	M Philippe Pugnat	29	tigi_1478.mpg	tigi_1478_vignette.jpg	tigi_1478_apercu.flv	46a8441cc4364c328bacead88f5acacf	1102	1	\N	\N	\N
1815	IMG	2009-08-31	Bras Poulpe Cover Up 4	\N	0	\N	\N	t	M Michel abc	15	102_1602_1815.jpg	102_1602_1815_vignette.jpg	\N	95188e585d28f02fdebcfaae272336a6	1135	1	f	f	\N
1217	VID	2009-02-21	promo du mois	\N	1	\N	\N	f	M prenom nom	11	promo_du_mois_1217.mpg	promo_du_mois_1217_vignette.jpg	promo_du_mois_1217_apercu.flv	76c9ffce926986a639d0368d71e3dd2a	1045	1	\N	\N	\N
1304	IMG	2009-04-07	visage2	\N	0	\N	\N	t	M Javier Gonzalez	15	visage2_1304.jpg	visage2_1304_vignette.jpg	\N	20114d3a1935a82d9e90cf5d6d2189d0	1068	1	f	f	\N
1531	IMG	2009-05-18	Bio.rritz 061	\N	0	\N	\N	t	M Philippe Pugnat	15	Bio.rritz_061_1531.jpg	Bio.rritz_061_1531_vignette.jpg	\N	e2d710d18993221a58632d7cf3e5f59d	1105	1	f	f	\N
1616	IMG	2009-05-20	tigi	\N	0	\N	\N	t	M José Awouma	15	tigi_1616.jpg	tigi_1616_vignette.jpg	\N	3ad4755f2adb5d69e12beac44301dc00	1117	1	f	f	\N
1235	VID	2009-03-17	exemple lunettes	\N	1	\N	\N	f	M prenom nom	8	exemple_lunettes_1235.mpg	exemple_lunettes_1235_vignette.jpg	exemple_lunettes_1235_apercu.flv	6e4a79760248b1667bc26649412a8ee6	1048	1	\N	\N	\N
1882	TPL	2009-09-10	rrrr	\N	1	\N	\N	\N	M prenom compte a/a	12	anim_1882.mpg	anim_1882_vignette.jpg	anim_1882_apercu.flv	36f294f14c25023c9967d01f03c1fa17	1044	1	\N	\N	<Template label="decompte2t1i" nomSwf="decompte2t1i.swf" nomClasse="decompte2t1i" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="280">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="26" COLOR="#52132C" LETTERSPACING="0" KERNING="0"><B>La rentrée des artistes</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="20" COLOR="#B85817" LETTERSPACING="0" KERNING="1"><B>Du 1 au 24 Septembre 2009</B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="22" COLOR="#000000" LETTERSPACING="0" KERNING="1"><B><I>Le vernissage de l&apos;exposition aura lieu le vendredi 4 septembre à 18h30 (à la médiathèque).</I></B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/305/fonds/FLEUR1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/FLEUR1.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/305/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/305/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/305/vignette/coiff1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
1656	IMG	2009-05-22	logo	\N	0	\N	\N	t	M José Awouma	15	logo_1656.jpg	logo_1656_vignette.jpg	\N	de2531d329f1260849b97ab6743677a7	1119	1	f	f	\N
1617	IMG	2009-05-20	visage1	\N	0	\N	\N	t	M José Awouma	15	visage1_1617.jpg	visage1_1617_vignette.jpg	\N	728cee0ac6ed2965277f7716a5077f6e	1117	1	f	f	\N
1705	VID	2009-07-08	RR	\N	1	\N	\N	f	M Philippe Pugnat	18	3_1705.mpg	3_1705_vignette.jpg	3_1705_apercu.flv	98c2df2baf6012e83198e631bcbe1adf	1127	1	\N	\N	\N
1816	IMG	2009-08-31	Bras Poulpe Cover Up 5	\N	0	\N	\N	t	M Michel abc	15	102_1604_1816.jpg	102_1604_1816_vignette.jpg	\N	1411b76bd602368aff1b433f205f144e	1135	1	f	f	\N
1618	IMG	2009-05-20	visage2	\N	0	\N	\N	t	M José Awouma	15	visage2_1618.jpg	visage2_1618_vignette.jpg	\N	20114d3a1935a82d9e90cf5d6d2189d0	1117	1	f	f	\N
1657	IMG	2009-05-22	photo1	\N	0	\N	\N	t	M José Awouma	15	photo1_1657.jpg	photo1_1657_vignette.jpg	\N	f7e90d81e5cdeeaa26cf47b4d0abc833	1119	1	f	f	\N
1619	IMG	2009-05-20	visage3	\N	0	\N	\N	t	M José Awouma	15	visage3_1619.jpg	visage3_1619_vignette.jpg	\N	3ce13a7aa00e76a8bc08e88a6c430874	1117	1	f	f	\N
1817	IMG	2009-08-31	Bras Poulpe Cover Up 6	\N	0	\N	\N	t	M Michel abc	15	102_1608_1817.jpg	102_1608_1817_vignette.jpg	\N	93232a67ae4be5677cc43a9ccf4ea033	1135	1	f	f	\N
1658	IMG	2009-05-22	photo2	\N	0	\N	\N	t	M José Awouma	15	photo2_1658.jpg	photo2_1658_vignette.jpg	\N	875bd90c0b40ee232d2c3aaea551bbeb	1119	1	f	f	\N
1597	VID	2009-05-19	LantonT5	\N	1	\N	\N	f	M prenom compte a/a	8	decompte2t1i_1597.mpg	decompte2t1i_1597_vignette.jpg	decompte2t1i_1597_apercu.flv	6e8f0783b445c60ad2d38304fcd6fc1c	1012	1	\N	\N	\N
1620	IMG	2009-05-20	visage4	\N	0	\N	\N	t	M José Awouma	15	visage4_1620.jpg	visage4_1620_vignette.jpg	\N	b52731acf6ab0cc472a81c1f9218ea8c	1117	1	f	f	\N
1955	IMG	2009-10-08	BBN or lézard	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_or_l_zard_1955.jpg	BBN_or_l_zard_1955_vignette.jpg	\N		1157	1	f	f	\N
1818	IMG	2009-08-31	Dragon Japonais Flanc	\N	0	\N	\N	t	M Michel abc	15	dragon02_1818.jpg	dragon02_1818_vignette.jpg	\N	9d1ce661086bfcd09c5b6f2ee2049dc8	1135	1	f	f	\N
1659	IMG	2009-05-22	photo3	\N	0	\N	\N	t	M José Awouma	15	photo3_1659.jpg	photo3_1659_vignette.jpg	\N	9cd1ed3eca088ba980bed242112d8637	1119	1	f	f	\N
1434	IMG	2009-05-08	Baptême Antoine 059	\N	0	\N	\N	f	M Fabien Georges	0	Bapt_me_Antoine_059_1434.jpg	\N	\N	\N	1081	1	f	f	\N
1954	IMG	2009-10-08	BBN or brillant blanc	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_or_brillant_blanc_1954.jpg	BBN_or_brillant_blanc_1954_vignette.jpg	\N		1157	1	f	f	\N
1704	VID	2009-07-08	11	\N	1	\N	\N	f	M Philippe Pugnat	18	3_1704.mpg	3_1704_vignette.jpg	3_1704_apercu.flv	98c2df2baf6012e83198e631bcbe1adf	1127	1	\N	t	\N
1703	VID	2009-07-07	3	\N	1	\N	\N	f	M Philippe Pugnat	28	3_1703.mpg	3_1703_vignette.jpg	3_1703_apercu.flv	24da351c8984699955047217240a4db8	1127	1	\N	t	\N
1702	VID	2009-07-07	2	\N	1	\N	\N	f	M Philippe Pugnat	21	2_1702.mpg	2_1702_vignette.jpg	2_1702_apercu.flv	d210087c705420bf39ac066132fc619a	1127	1	\N	t	\N
1819	IMG	2009-08-31	Pirate Caraïbe Mollet	\N	0	\N	\N	t	M Michel abc	15	DSCN0004_1819.jpg	DSCN0004_1819_vignette.jpg	\N	b29784ecf7dcf873ec1450e57de146de	1135	1	f	f	\N
1108	VID	2008-12-04	coiff	\N	1	\N	\N	f	M prenom nom	17	0_1108.mpg	0_1108_vignette.jpg	0_1108_apercu.flv	c33184ccae6b18fc1e7ada0a9ba8a1b2	1113	1	\N	\N	\N
1622	VID	2009-05-20	after coiffure complet	\N	1	\N	\N	f	M José Awouma	102	after_coiffure_complet_1622.mpg	after_coiffure_complet_1622_vignette.jpg	after_coiffure_complet_1622_apercu.flv	ead076318c9c98c4881603f8e9945ca9	1117	1	\N	\N	\N
1099	VID	2008-12-04	coifF1	\N	1	\N	\N	f	M prenom nom	23	000007342476_HDFlashVideo_1099.mpg	000007342476_HDFlashVideo_1099_vignette.jpg	000007342476_HDFlashVideo_1099_apercu.flv	6c95a25a5b22ee6d6b57059f77035642	1033	1	\N	\N	\N
1167	TPL	2009-01-21	tpl1	\N	1	\N	\N	f	M prenom nom	0	anim_1167.mpg	anim_1167_vignette.jpg	anim_1167_apercu.flv	c6427a925bec36a91f374b0b94556a7b	1	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="promo2" nomSwf="infoboutique1.swf" nomClasse="infoboutique1" nomContainer="infoboutique1_cont" largeur="1024" hauteur="768" idCateorie="1035" idClient="1001">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n  <ZoneTexte label="Accroche" nomAttribut="infoboutique1_cont#votrenom_cont#votrenom"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Verdana" SIZE="22" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Votre Nom</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="Titre" nomAttribut="infoboutique1_cont#texte1_cont#titre1"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Titre</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="Description" nomAttribut="infoboutique1_cont#texte1_cont#description1"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">Description ici</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="infoboutique1_cont#courbe_cont#icourbe" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.publivision.fr/template/1167/fond/fond2.jpg" valeurVignette="http://fichierclient.publivision.fr/template/1167/fond/vignette/fond2.jpg" urlRepertoireVignettes="http://fichierclient.publivision.fr/template/1167/fond/vignette/" urlRepertoireImages="http://fichierclient.publivision.fr/template/1167/fond/" urlListeImages="http://fichierclient.publivision.fr/template/1167/fond/vignette/?C=M;O=D;F=0"/>\n  <ZoneImage label="Image du produit" nomAttribut="infoboutique1_cont#photo1_cont#photo1" hauteur="718" largeur="658" valeurAttribut="http://fichierclient.publivision.fr/template/1167/data/coiff1.jpg" valeurVignette="http://fichierclient.publivision.fr/template/1167/vignette/coiff1.jpg" />\n</Template>
1198	VID	2009-02-16	onde1	\N	1	\N	\N	f	M prenom nom	18	onde1_1198.mpg	onde1_1198_vignette.jpg	onde1_1198_apercu.flv	44978260a7367dab2eaa4fb9f26b46b6	1044	1	\N	\N	\N
1218	VID	2009-02-21	promo chateaux	\N	1	\N	\N	f	M prenom nom	18	promo_chateaux_1218.mpg	promo_chateaux_1218_vignette.jpg	promo_chateaux_1218_apercu.flv	fa7232bfdebdc1a7967418ee65829e59	1045	1	\N	\N	\N
1236	VID	2009-03-17	jingle	\N	1	\N	\N	f	M prenom nom	6	jingle_1236.mpg	jingle_1236_vignette.jpg	jingle_1236_apercu.flv	3c7af753f6db9a14ccb9d267a2818513	1049	1	\N	\N	\N
1936	IMG	2009-10-07	BBN cercles	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_cercles_1936.jpg	BBN_cercles_1936_vignette.jpg	\N		1157	1	f	f	\N
2204	TPL	2010-03-26	ddddd	\N	1	\N	\N	f	M Marc Truche	14	anim_2204.mpg	anim_2204_vignette.jpg	anim_2204_apercu.flv	d0cc0c09ac6d645346f195caebc55e55	1102	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="decompte2t1i" nomSwf="decompte2t1i.swf" nomClasse="decompte2t1i" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400" idCateorie="1102" idClient="1005">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="36" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMOTION</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">10 euros la guitare</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#ED6585" LETTERSPACING="0" KERNING="1"><U>rrrer</U><FONT COLOR="#000000"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2204/data/visage01.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2204/vignette/visage01.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/305/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/2204/data/Lpliht2.JPG" valeurVignette="http://fichierclient.iconeo.fr/template/2204/vignette/Lpliht2.JPG" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
1660	VID	2009-05-22	bio-rritz,tc1	\N	1	\N	\N	f	M José Awouma	62	bio_rritz_tc1_1660.mpg	bio_rritz_tc1_1660_vignette.jpg	bio_rritz_tc1_1660_apercu.flv	0b9ae4bee21dcc320fbedc97d7909b12	1119	1	\N	\N	\N
1973	IMG	2009-10-12	DSCF4078	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF4078_1973.jpg	DSCF4078_1973_vignette.jpg	\N		1159	1	f	f	\N
1229	VID	2009-03-12	0	\N	1	\N	\N	f	M prenom nom	16	0_1229.mpg	0_1229_vignette.jpg	0_1229_apercu.flv	a642ef9c1e612e127d6342938df87124	1035	1	\N	\N	\N
2111	VID	2010-02-16	diams	\N	1	\N	\N	f	M Marc Truche	3	diams_2111.mpg	diams_2111_vignette.jpg	diams_2111_apercu.flv	e801d973646c742cf44a0228f3271416	1102	1	\N	\N	\N
1280	IMG	2009-04-05	DSC01234	\N	0	\N	\N	t	M Javier Gonzalez	15	DSC01234_1280.jpg	DSC01234_1280_vignette.jpg	\N	8519c94c29d0e7e5b4716abbc587a981	1068	1	f	f	\N
1739	VID	2009-08-07	output	\N	1	\N	\N	f	M prenom compte a/a	10	output_1739.mpg	output_1739_vignette.jpg	output_1739_apercu.flv	bd8143042bafdcc5a3ae369a7c899790	1044	1	\N	\N	\N
1953	IMG	2009-10-08	BBN papillon	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_papillon_1953.jpg	BBN_papillon_1953_vignette.jpg	\N		1157	1	f	f	\N
1599	IMG	2009-05-19	sur-mesure	\N	0	\N	\N	t	M prenom compte a/a	15	sur_mesure_1599.jpg	sur_mesure_1599_vignette.jpg	\N	6bd0bbe485a8f40a48a49899f3993c30	1115	1	f	f	\N
1755	IMG	2009-08-31	Masque Japonais Mollet	\N	0	\N	\N	t	M Michel abc	15	11_01_1755.jpg	11_01_1755_vignette.jpg	\N	a85eac10e21bad56bdef9dc3b9e1ade3	1135	1	f	f	\N
1820	IMG	2009-08-31	Mollet Celtique 1 	\N	0	\N	\N	t	M Michel abc	15	DSCN0028_1820.jpg	DSCN0028_1820_vignette.jpg	\N	f3b18e5cab2552e2b36f08b93ee7e2e4	1135	1	f	f	\N
2336	VID	2012-03-28	LMPromo2010_cours_accueil	\N	1	\N	\N	f	M bla bla	289	LMPromo2010_cours_accueil_2336.mpg	LMPromo2010_cours_accueil_2336_vignette.jpg	LMPromo2010_cours_accueil_2336_apercu.flv	3bac70826f835cccc11ed38b00e3eb14	1305	1	\N	\N	\N
1821	IMG	2009-08-31	Mollet Celtique 2	\N	0	\N	\N	t	M Michel abc	15	DSCN0029_1821.jpg	DSCN0029_1821_vignette.jpg	\N	0d618ce523b40cf5b0efbd6030a929d1	1135	1	f	f	\N
1937	IMG	2009-10-07	BBN chaine	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_chaine_1937.jpg	BBN_chaine_1937_vignette.jpg	\N		1157	1	f	f	\N
1822	IMG	2009-08-31	Dos Musicien	\N	0	\N	\N	t	M Michel abc	15	DSCN0373_1822.jpg	DSCN0373_1822_vignette.jpg	\N	2b46125796d84e36eebe39fdf6042b03	1135	1	f	f	\N
1823	IMG	2009-08-31	Bras Rose Fond Léopard 1	\N	0	\N	\N	t	M Michel abc	15	DSCN0385_1823.jpg	DSCN0385_1823_vignette.jpg	\N	eab5ed43ad6a86673167a6e97e45d017	1135	1	f	f	\N
1995	IMG	2009-10-13	fesse james1	\N	0	\N	\N	t	M Michel Tattoo	15	fesse_james1_1995.jpg	fesse_james1_1995_vignette.jpg	\N		1160	1	f	f	\N
1958	IMG	2009-10-08	BRC fantaisie	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BRC_fantaisie_1958.jpg	BRC_fantaisie_1958_vignette.jpg	\N		1157	1	f	f	\N
1974	IMG	2009-10-12	DSCF4079	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF4079_1974.jpg	DSCF4079_1974_vignette.jpg	\N		1159	1	f	f	\N
1825	IMG	2009-08-31	Mollet lierre	\N	0	\N	\N	t	M Michel abc	15	DSCN0412_1825.jpg	DSCN0412_1825_vignette.jpg	\N	1e21b17cd0f20804fe8cbe2a9e731323	1135	1	f	f	\N
1237	VID	2009-03-17	logos	\N	1	\N	\N	f	M prenom nom	16	logos_1237.mpg	logos_1237_vignette.jpg	logos_1237_apercu.flv	7921a2ba23903cf661cda070f696fff3	1049	1	\N	\N	\N
1601	IMG	2009-05-19	2500-m2-IZON	\N	0	\N	\N	t	M prenom compte a/a	15	2500_m2_IZON_1601.jpg	2500_m2_IZON_1601_vignette.jpg	\N	b74685ffa2d1619c3904f8d1ae506bd5	1013	1	f	f	\N
1200	IMG	2009-02-16	NewTon3000	\N	0	\N	\N	t	M prenom nom	15	NewTon3000_1200.jpg	NewTon3000_1200_vignette.jpg	\N	a8d6a63d672b3139793f3fc666ff1cdf	1044	1	f	f	\N
1199	VID	2009-02-16	HamSkinner	\N	1	\N	\N	f	M prenom nom	43	HamSkinner_1199.mpg	HamSkinner_1199_vignette.jpg	HamSkinner_1199_apercu.flv	5aa02ff5e483e7fd17c8e0ca3655b0a5	1044	1	\N	\N	\N
1916	IMG	2009-09-20	filet	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	ampalangue_1916.jpg	ampalangue_1916_vignette.jpg	\N		1204	1	f	f	\N
1002	TPL	2009-02-16	TPL3	\N	1	\N	\N	t	MM	0	\N	\N	\N	\N	1	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="onde1" nomSwf="onde1.swf" nomClasse="onde1" nomContainer="onde1_cont" largeur="1024" hauteur="768">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>TITLE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">Description ici</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.publivision.fr/template/1002/data/neutre2.jpg" valeurVignette="http://fichierclient.publivision.fr/template/1002/vignette/neutre2.jpg" urlRepertoireVignettes="http://fichierclient.publivision.fr/template/1002/fond/vignette/" urlRepertoireImages="http://fichierclient.publivision.fr/template/1002/fond/" urlListeImages="http://fichierclient.publivision.fr/template/1002/fond/vignette/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.publivision.fr/template/1002/data/coiff1.jpg" valeurVignette="http://fichierclient.publivision.fr/template/1002/vignette/coiff1.jpg" />\n</Template>
1623	VID	2009-05-20	carte fidelit%e9	\N	1	\N	\N	f	M José Awouma	22	carte_fidelit_e9_1623.mpg	carte_fidelit_e9_1623_vignette.jpg	carte_fidelit_e9_1623_apercu.flv	c32df9930804a6132591c91856e6e223	1117	1	\N	\N	\N
1661	VID	2009-05-22	biophase	\N	1	\N	\N	f	M José Awouma	57	biophase_1661.mpg	biophase_1661_vignette.jpg	biophase_1661_apercu.flv	705c7ede1dcf1865a880ba6ce789fb83	1119	1	\N	\N	\N
1352	IMG	2009-04-14	Top-900-400	\N	0	\N	\N	t	M prenom compte a/a	15	Top_900_400_1352.jpg	Top_900_400_1352_vignette.jpg	\N	e711c7f246929cd41f7a92adca32f1ee	1051	1	f	f	\N
1300	IMG	2009-04-07	1	\N	0	\N	\N	t	M Javier Gonzalez	15	1_1300.jpg	1_1300_vignette.jpg	\N	c44b513de70b3f3eec339a9c47ddaefd	1023	1	f	f	\N
1988	IMG	2009-10-13	celticbras	\N	0	\N	\N	t	M Michel Tattoo	15	celticbras_1988.jpg	celticbras_1988_vignette.jpg	\N		1160	1	f	f	\N
1480	VID	2009-05-11	jingle Coiff	\N	1	\N	\N	f	M Philippe Pugnat	9	decomptejingle_1480.mpg	decomptejingle_1480_vignette.jpg	decomptejingle_1480_apercu.flv	9705ee308bf6c28cc34a8e6e80ae2e1f	1102	1	\N	\N	\N
1284	IMG	2009-04-05	6	\N	0	\N	\N	t	M Javier Gonzalez	15	6_1284.jpg	6_1284_vignette.jpg	\N	d6455ceefffbb7eaee99bd94877b0a03	1023	1	f	f	\N
2337	VID	2012-03-28	CXWORX_Consumer-HQ	\N	1	\N	\N	f	M bla bla	0	CXWORX_Consumer_HQ_2337.mov	\N	CXWORX_Consumer-HQ_2337_apercu.flv	\N	1305	1	\N	\N	\N
1938	IMG	2009-10-07	BBN chat	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_chat_1938.jpg	BBN_chat_1938_vignette.jpg	\N		1157	1	f	f	\N
1975	IMG	2009-10-12	DSCF4124	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF4124_1975.jpg	DSCF4124_1975_vignette.jpg	\N		1159	1	f	f	\N
1201	VID	2009-02-16	HAMDAS-R (Test Unit)	\N	1	\N	\N	f	M prenom nom	285	HAMDAS_R__Test_Unit__1201.mpg	HAMDAS_R__Test_Unit__1201_vignette.jpg	HAMDAS_R__Test_Unit__1201_apercu.flv	61068dd77187b5405ca779dcf4fcc12d	1044	1	\N	\N	\N
1238	VID	2009-03-17	jingle	\N	1	\N	\N	f	M prenom nom	18	jingle_1238.mpg	jingle_1238_vignette.jpg	jingle_1238_apercu.flv	4daf17afc4d9475413868914f92dd6b8	1048	1	\N	\N	\N
1220	VID	2009-02-23	jingle complet	\N	1	\N	\N	f	M prenom nom	12	jingle_complet_1220.mpg	jingle_complet_1220_vignette.jpg	jingle_complet_1220_apercu.flv	9336403b0ab420bc1f4171087df2cde8	1045	1	\N	\N	\N
1295	VID	2009-04-07	carte fidelité	\N	1	\N	\N	f	M Javier Gonzalez	24	carte_fidelit__1295.mpg	carte_fidelit__1295_vignette.jpg	carte_fidelit__1295_apercu.flv	c32df9930804a6132591c91856e6e223	1025	1	\N	\N	\N
1286	IMG	2009-04-05	fond	\N	0	\N	\N	t	M Javier Gonzalez	15	fond_1286.jpg	fond_1286_vignette.jpg	\N	814e8407cce8ad11d60ba526c237d6dc	1024	1	f	f	\N
2091	IMG	2010-01-20	porpanot2	\N	0	\N	\N	t	M Marc Truche	15	porpanot2_2091.jpg	porpanot2_2091_vignette.jpg	\N		1166	1	f	f	\N
1624	VID	2009-05-20	compania del color	\N	1	\N	\N	f	M José Awouma	28	compania_del_color_1624.mpg	compania_del_color_1624_vignette.jpg	compania_del_color_1624_apercu.flv	ed054fb94a1c85e5bfe53c0b77124f93	1117	1	\N	\N	\N
1662	VID	2009-05-22	laurence_..	\N	1	\N	\N	f	M José Awouma	21	laurence_.._1662.mpg	laurence_.._1662_vignette.jpg	laurence_.._1662_apercu.flv	a8048a9bfdaec0683fb795a9025616fa	1119	1	\N	\N	\N
1287	IMG	2009-04-05	visage3	\N	0	\N	\N	t	M Javier Gonzalez	15	visage3_1287.jpg	visage3_1287_vignette.jpg	\N	3ce13a7aa00e76a8bc08e88a6c430874	1024	1	f	f	\N
1301	VID	2009-04-07	compania del color	\N	1	\N	\N	f	M Javier Gonzalez	28	compania_del_color_1301.mpg	compania_del_color_1301_vignette.jpg	compania_del_color_1301_apercu.flv	ed054fb94a1c85e5bfe53c0b77124f93	1068	1	\N	\N	\N
1288	IMG	2009-04-05	visage4	\N	0	\N	\N	t	M Javier Gonzalez	15	visage4_1288.jpg	visage4_1288_vignette.jpg	\N	b52731acf6ab0cc472a81c1f9218ea8c	1024	1	f	f	\N
1483	IMG	2009-05-11	5	\N	0	\N	\N	t	M Philippe Pugnat	15	5_1483.jpg	5_1483_vignette.jpg	\N	455b19ebdb95e0973ca531a7961f6b0c	1103	1	f	f	\N
1625	VID	2009-05-20	tigi	\N	1	\N	\N	f	M José Awouma	29	tigi_1625.mpg	tigi_1625_vignette.jpg	tigi_1625_apercu.flv	46a8441cc4364c328bacead88f5acacf	1117	1	\N	\N	\N
1484	VID	2009-05-11	0	\N	1	\N	\N	f	M Philippe Pugnat	17	0_1484.mpg	0_1484_vignette.jpg	0_1484_apercu.flv	aef06bd8fdf44443135d9ee8babd4b04	1103	1	\N	t	\N
2338	VID	2012-04-09	Bodypump mars 2012	\N	1	\N	\N	f	M bla bla	27	Bodypump_2338.mpg	Bodypump_2338_vignette.jpg	Bodypump_2338_apercu.flv	3d29c337c6792672003b77abe15dd81e	1305	1	\N	\N	\N
1557	IMG	2009-05-19	thiavorje	\N	0	\N	\N	t	M Sébastien Chateau	15	thiavorje_1557.jpg	thiavorje_1557_vignette.jpg	\N	2701598b2b49e89fec258bed19b53880	1056	1	f	f	\N
1663	IMG	2009-05-22	dynamic	\N	0	\N	\N	t	M José Awouma	15	dynamic_1663.jpg	dynamic_1663_vignette.jpg	\N	8815089518cc1aa43ad36cd2d1c94427	1120	1	f	f	\N
1759	IMG	2009-08-31	Lutin Musicien	\N	0	\N	\N	t	M Michel abc	15	100_0110_1759.jpg	100_0110_1759_vignette.jpg	\N	2a872343b75dcc33751c3266befca08f	1135	1	f	f	\N
1558	IMG	2009-05-19	valeur	\N	0	\N	\N	t	M Sébastien Chateau	15	valeur_1558.jpg	valeur_1558_vignette.jpg	\N	cc59f4594d1a04c6c878a4705975d5c0	1056	1	f	f	\N
2018	IMG	2009-10-14	masque pub	\N	0	\N	\N	t	M Michel Tattoo	15	masque_pub_2018.jpg	masque_pub_2018_vignette.jpg	\N		1160	1	f	f	\N
1664	IMG	2009-05-22	moto1	\N	0	\N	\N	t	M José Awouma	15	moto1_1664.jpg	moto1_1664_vignette.jpg	\N	9dce850b1b42965e3098e8f40dc1919c	1120	1	f	f	\N
1559	IMG	2009-05-19	voyage en barque	\N	0	\N	\N	t	M Sébastien Chateau	15	voyage_en_barque_1559.jpg	voyage_en_barque_1559_vignette.jpg	\N	d05dec13a6cd4575bf4978b9ada93d2f	1056	1	f	f	\N
1939	IMG	2009-10-07	BBN coeur	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_coeur_1939.jpg	BBN_coeur_1939_vignette.jpg	\N		1157	1	f	f	\N
1758	IMG	2009-08-31	Poisson squelette	\N	0	\N	\N	t	M Michel abc	15	100_0094_1758.jpg	100_0094_1758_vignette.jpg	\N	1c1e455fd69d5a32b5596fbc86158b21	1135	1	f	f	\N
1603	IMG	2009-05-19	projet-immobilier	\N	0	\N	\N	t	M prenom compte a/a	15	projet_immobilier_1603.jpg	projet_immobilier_1603_vignette.jpg	\N	ecb0b38be7b1dc54df3d51a8e59148e7	1014	1	f	f	\N
1665	IMG	2009-05-22	moto2	\N	0	\N	\N	t	M José Awouma	15	moto2_1665.jpg	moto2_1665_vignette.jpg	\N	000caa3409ff0ca9ce834d4f12c168ed	1120	1	f	f	\N
1918	IMG	2009-09-20	oreille	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	oreille_1918.jpg	oreille_1918_vignette.jpg	\N		1204	1	f	f	\N
1482	IMG	2009-05-11	4	\N	0	\N	\N	t	M Philippe Pugnat	15	4_1482.jpg	4_1482_vignette.jpg	\N	f67f48b7814a4bdf4fbdf0b520511115	1103	1	f	f	\N
1666	IMG	2009-05-22	moto3	\N	0	\N	\N	t	M José Awouma	15	moto3_1666.jpg	moto3_1666_vignette.jpg	\N	40ffc4e46aa8028f7d9199de404ec8d6	1120	1	f	f	\N
1481	IMG	2009-05-11	3	\N	0	\N	\N	t	M Philippe Pugnat	15	3_1481.jpg	3_1481_vignette.jpg	\N	8765e9a26042058b56f0307b35e1d0a2	1103	1	f	f	\N
1959	IMG	2009-10-08	BBN soleil	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_soleil_1959.jpg	BBN_soleil_1959_vignette.jpg	\N		1157	1	f	f	\N
1667	VID	2009-05-22	dynamic moto	\N	1	\N	\N	f	M José Awouma	30	dynamic_moto_1667.mpg	dynamic_moto_1667_vignette.jpg	dynamic_moto_1667_apercu.flv	a35c86199f25b54ce7b5c3da7bb8d6e3	1120	1	\N	\N	\N
1761	IMG	2009-08-31	Carpe Japonaise cuisse	\N	0	\N	\N	t	M Michel abc	15	100_0573_1761.jpg	100_0573_1761_vignette.jpg	\N	821decf6769611aba03be0d0c3dad2c6	1135	1	f	f	\N
1956	IMG	2009-10-08	BBN papillon noir	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_papillon_noir_1956.jpg	BBN_papillon_noir_1956_vignette.jpg	\N		1157	1	f	f	\N
1425	IMG	2009-05-08	Baptême Antoine 063	\N	0	\N	\N	t	M Fabien Georges	15	Bapt_me_Antoine_063_1425.jpg	Bapt_me_Antoine_063_1425_vignette.jpg	\N	a1512167bc26d0b2904035a2437303ee	1081	1	f	f	\N
1193	VID	2009-02-16	Takidas	\N	1	\N	\N	f	M prenom nom	93	Takidas_1193.mpg	Takidas_1193_vignette.jpg	Takidas_1193_apercu.flv	dbc4b354431a19fdd25c9a20913e8e2f	1044	1	\N	\N	\N
1239	VID	2009-03-17	absolu systeme	\N	1	\N	\N	f	M prenom nom	25	absolu_systeme_1239.mpg	absolu_systeme_1239_vignette.jpg	absolu_systeme_1239_apercu.flv	9350cc247afe5c6128c7d15193dd11f4	1049	1	\N	\N	\N
1223	VID	2009-02-23	leader	\N	1	\N	\N	f	M prenom nom	9	leader_1223.mpg	leader_1223_vignette.jpg	leader_1223_apercu.flv	28b40a2776a88e1de3664198ae2b8bec	1045	1	\N	\N	\N
1626	IMG	2009-05-20	pdts-TIGI	\N	0	\N	\N	t	M José Awouma	15	pdts_TIGI_1626.jpg	pdts_TIGI_1626_vignette.jpg	\N	170be382f01d67cbf82d29cd6e285053	1108	1	f	f	\N
1457	IMG	2009-05-11	Baptême Antoine 060	\N	0	\N	\N	t	M Fabien Georges	15	Bapt_me_Antoine_060_1457.jpg	Bapt_me_Antoine_060_1457_vignette.jpg	\N	4a576eaa509b1f1bc3ee6ab3a502c5bd	1081	1	f	f	\N
2240	IMG	2010-11-09	FERMETURES	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	FERMETURES_2240.jpg	FERMETURES_2240_vignette.jpg	\N		1300	1	f	f	\N
1668	VID	2009-05-22	0	\N	1	\N	\N	f	M José Awouma	17	0_1668.mpg	0_1668_vignette.jpg	0_1668_apercu.flv	8d2b12cc8d36214b106ceb3424ce0101	1121	1	\N	\N	\N
1426	IMG	2009-05-08	Baptême Antoine 051	\N	0	\N	\N	t	M Fabien Georges	15	Bapt_me_Antoine_051_1426.jpg	Bapt_me_Antoine_051_1426_vignette.jpg	\N	babbc76ddb3915b7e6e4780859b4e3f6	1081	1	f	f	\N
1292	IMG	2009-04-05	after-coiffure	\N	0	\N	\N	t	M Javier Gonzalez	15	after_coiffure_1292.jpg	after_coiffure_1292_vignette.jpg	\N	fddb63ded07f20f5507e4128b87d4633	1025	1	f	f	\N
2090	IMG	2010-01-16	presentoire	\N	0	\N	\N	t	M prenom compte a/a	15	presentoire_2090.jpg	presentoire_2090_vignette.jpg	\N		1044	1	f	f	\N
1458	IMG	2009-05-11	Baptême Antoine 061	\N	0	\N	\N	t	M Fabien Georges	15	Bapt_me_Antoine_061_1458.jpg	Bapt_me_Antoine_061_1458_vignette.jpg	\N	0744558ba95ea681b0545dc4bb6ac1da	1081	1	f	f	\N
1427	IMG	2009-05-08	Baptême Antoine 052	\N	0	\N	\N	t	M Fabien Georges	15	Bapt_me_Antoine_052_1427.jpg	Bapt_me_Antoine_052_1427_vignette.jpg	\N	be6f238a9f8a72ab16c98c85175545ac	1081	1	f	f	\N
1976	IMG	2009-10-12	DSCF4125	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF4125_1976.jpg	DSCF4125_1976_vignette.jpg	\N		1159	1	f	f	\N
1459	IMG	2009-05-11	Baptême Antoine 062	\N	0	\N	\N	f	M Fabien Georges	0	Bapt_me_Antoine_062_1459.jpg	\N	\N	\N	1081	1	f	f	\N
2005	IMG	2009-10-14	jp1	\N	0	\N	\N	t	M Michel Tattoo	15	jp1_2005.jpg	jp1_2005_vignette.jpg	\N		1160	1	f	f	\N
1460	IMG	2009-05-11	Baptême Antoine 063	\N	0	\N	\N	f	M Fabien Georges	0	Bapt_me_Antoine_063_1460.jpg	\N	\N	\N	1081	1	f	f	\N
1485	VID	2009-05-11	1	\N	1	\N	\N	f	M Philippe Pugnat	10	1_1485.mpg	1_1485_vignette.jpg	1_1485_apercu.flv	1f0b81c1fbb8367784a708ed6459aac0	1103	1	\N	t	\N
1461	IMG	2009-05-11	Baptême Antoine 062	\N	0	\N	\N	f	M Fabien Georges	0	Bapt_me_Antoine_062_1461.jpg	\N	\N	\N	1081	1	f	f	\N
1486	VID	2009-05-11	2	\N	1	\N	\N	f	M Philippe Pugnat	7	2_1486.mpg	2_1486_vignette.jpg	2_1486_apercu.flv	2777a507ab6e3da1b4ff6e0daf02e460	1103	1	\N	t	\N
1941	IMG	2009-10-07	BBN crystal dauphin	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_crystal_dauphin_1941.jpg	BBN_crystal_dauphin_1941_vignette.jpg	\N		1157	1	f	f	\N
1562	IMG	2009-05-19	homme sage	\N	0	\N	\N	t	M Sébastien Chateau	15	homme_sage_1562.jpg	homme_sage_1562_vignette.jpg	\N	27ca8fb65d25b5b07475b52f0ef2a0bb	1056	1	f	f	\N
2339	VID	2012-04-09	shbam mars 2012	\N	1	\N	\N	f	M bla bla	29	shbam_2339.mpg	shbam_2339_vignette.jpg	shbam_2339_apercu.flv	e98825ba8bd9d8405bd2e6bc18ef3369	1305	1	\N	\N	\N
1563	IMG	2009-05-19	chef	\N	0	\N	\N	t	M Sébastien Chateau	15	chef_1563.jpg	chef_1563_vignette.jpg	\N	4f4fe5e4b9747e2f7de617102db991d7	1056	1	f	f	\N
2208	IMG	2010-04-21	michel 04/2010 dragon dos 1	\N	0	\N	\N	t	M Michel Tattoo	15	dragon_dos_1_2208.jpg	dragon_dos_1_2208_vignette.jpg	\N		1137	1	f	f	\N
2209	IMG	2010-04-21	michel 04/2010 dragon dos 2	\N	0	\N	\N	t	M Michel Tattoo	15	dragon_dos_2_2209.jpg	dragon_dos_2_2209_vignette.jpg	\N		1137	1	f	f	\N
2340	VID	2012-04-09	rpm mars 2012	\N	1	\N	\N	f	M bla bla	27	rpm_2340.mpg	rpm_2340_vignette.jpg	rpm_2340_apercu.flv	34e4f2a062050fe27fd67acd3433d3fb	1305	1	\N	\N	\N
1989	IMG	2009-10-13	chienserpent	\N	0	\N	\N	t	M Michel Tattoo	15	chienserpent_1989.jpg	chienserpent_1989_vignette.jpg	\N		1160	1	f	f	\N
1462	IMG	2009-05-11	Baptême Antoine 062	\N	0	\N	\N	f	M Fabien Georges	0	Bapt_me_Antoine_062_1462.jpg	\N	\N	\N	1081	1	f	f	\N
1356	IMG	2009-04-14	IMG_0009	\N	0	\N	\N	t	M prenom compte a/a	15	IMG_0009_1356.jpg	IMG_0009_1356_vignette.jpg	\N	bb818a690293a794ae36b24bd6fc4fb0	1051	1	f	f	\N
1392	IMG	2009-05-05	Toussaint 2008 001	\N	0	\N	\N	t	M Fabien Georges	15	Toussaint_2008_001_1392.jpg	Toussaint_2008_001_1392_vignette.jpg	\N	441098d40d725989200df99a669df5f3	1081	1	f	f	\N
1428	IMG	2009-05-08	Baptême Antoine 068	\N	0	\N	\N	t	M Fabien Georges	15	Bapt_me_Antoine_068_1428.jpg	Bapt_me_Antoine_068_1428_vignette.jpg	\N	dff932e2f0d57af7de2265737994372c	1081	1	f	f	\N
1829	IMG	2009-08-31	Bras Japonais Rose et fleur 2	\N	0	\N	\N	t	M Michel abc	15	F1010020_1829.jpg	F1010020_1829_vignette.jpg	\N	c3d4cdbffcdaa9d8f7a09a6fe2a1c5a8	1135	1	f	f	\N
1564	IMG	2009-05-19	la terre	\N	0	\N	\N	t	M Sébastien Chateau	15	la_terre_1564.jpg	la_terre_1564_vignette.jpg	\N	de8b18be4ac13acc56070c67b3d18426	1057	1	f	f	\N
1429	IMG	2009-05-08	Baptême Antoine 053	\N	0	\N	\N	t	M Fabien Georges	15	Bapt_me_Antoine_053_1429.jpg	Bapt_me_Antoine_053_1429_vignette.jpg	\N	61fcb0cdb630284912f6ca420884be1a	1081	1	f	f	\N
1627	VID	2009-05-20	tigi	\N	1	\N	\N	f	M José Awouma	29	tigi_1627.mpg	tigi_1627_vignette.jpg	tigi_1627_apercu.flv	46a8441cc4364c328bacead88f5acacf	1108	1	\N	\N	\N
1669	VID	2009-05-22	1	\N	1	\N	\N	f	M José Awouma	163	1_1669.mpg	1_1669_vignette.jpg	1_1669_apercu.flv	997e1724a9d4dcc5f9a3602e5a1c3b3f	1121	1	\N	\N	\N
1430	IMG	2009-05-08	Baptême Antoine 057	\N	0	\N	\N	t	M Fabien Georges	15	Bapt_me_Antoine_057_1430.jpg	Bapt_me_Antoine_057_1430_vignette.jpg	\N	20f252721188eca64bf67970bbcc83db	1081	1	f	f	\N
1565	IMG	2009-05-19	masque	\N	0	\N	\N	t	M Sébastien Chateau	15	masque_1565.jpg	masque_1565_vignette.jpg	\N	bd2a7fb238f83f04ac10c4cac5e81408	1057	1	f	f	\N
1431	IMG	2009-05-08	Baptême Antoine 058	\N	0	\N	\N	f	M Fabien Georges	0	Bapt_me_Antoine_058_1431.jpg	\N	\N	\N	1081	1	f	f	\N
1488	VID	2009-05-11	ondejingle	\N	1	\N	\N	f	M Philippe Pugnat	7	ondejingle_1488.mpg	ondejingle_1488_vignette.jpg	ondejingle_1488_apercu.flv	e5962b009dcc5ed63b6e2485f3b600f3	1102	1	\N	\N	\N
1432	IMG	2009-05-08	Baptême Antoine 059	\N	0	\N	\N	f	M Fabien Georges	0	Bapt_me_Antoine_059_1432.jpg	\N	\N	\N	1081	1	f	f	\N
1710	TPL	2009-07-20	azd	\N	1	\N	\N	f	M Philippe Pugnat	7	anim_1710.mpg	anim_1710_vignette.jpg	anim_1710_apercu.flv	df2e4c210bbddb233801d1e392788662	1102	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="192" idCateorie="1102" idClient="1005">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>JINGLE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/1710/data/neutre6.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1710/vignette/neutre6.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
1433	IMG	2009-05-08	Baptême Antoine 058	\N	0	\N	\N	f	M Fabien Georges	0	Bapt_me_Antoine_058_1433.jpg	\N	\N	\N	1081	1	f	f	\N
1628	VID	2009-05-20	compania del color	\N	1	\N	\N	f	M José Awouma	28	compania_del_color_1628.mpg	compania_del_color_1628_vignette.jpg	compania_del_color_1628_apercu.flv	ed054fb94a1c85e5bfe53c0b77124f93	1108	1	\N	\N	\N
1566	IMG	2009-05-19	masques	\N	0	\N	\N	t	M Sébastien Chateau	15	masques_1566.jpg	masques_1566_vignette.jpg	\N	54ff20f419354d7d0c5c5e231ff0b184	1057	1	f	f	\N
1831	IMG	2009-08-31	Bras Japonais Rose et fleur 3	\N	0	\N	\N	t	M Michel abc	15	F1010022_1831.jpg	F1010022_1831_vignette.jpg	\N	50f5861af2b2dc7bc2d1be1cec27c9ae	1135	1	f	f	\N
1977	IMG	2009-10-12	DSCF4128	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF4128_1977.jpg	DSCF4128_1977_vignette.jpg	\N		1159	1	f	f	\N
1567	IMG	2009-05-19	seul	\N	0	\N	\N	t	M Sébastien Chateau	15	seul_1567.jpg	seul_1567_vignette.jpg	\N	88c80464000edff1595a8a2dd525e154	1057	1	f	f	\N
1942	IMG	2009-10-07	BBN crystal noir et blanc	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_crystal_noir_et_blanc_1942.jpg	BBN_crystal_noir_et_blanc_1942_vignette.jpg	\N		1157	1	f	f	\N
1960	IMG	2009-10-08	IMPLANT	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	IMPLANT_1960.jpg	IMPLANT_1960_vignette.jpg	\N		1157	1	f	f	\N
1568	IMG	2009-05-19	vue sous les arbres	\N	0	\N	\N	t	M Sébastien Chateau	15	vue_sous_les_arbres_1568.jpg	vue_sous_les_arbres_1568_vignette.jpg	\N	7f2fa5059f7626f5cf69aab3ea47ee6a	1057	1	f	f	\N
1996	IMG	2009-10-13	fesse james 2	\N	0	\N	\N	t	M Michel Tattoo	15	fesse_james_2_1996.jpg	fesse_james_2_1996_vignette.jpg	\N		1160	1	f	f	\N
1940	IMG	2009-10-07	BBN coeur rouge	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_coeur_rouge_1940.jpg	BBN_coeur_rouge_1940_vignette.jpg	\N		1157	1	f	f	\N
1978	IMG	2009-10-12	DSCF4129	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF4129_1978.jpg	DSCF4129_1978_vignette.jpg	\N		1159	1	f	f	\N
1997	IMG	2009-10-13	greg1	\N	0	\N	\N	t	M Michel Tattoo	15	greg1_1997.jpg	greg1_1997_vignette.jpg	\N		1160	1	f	f	\N
2001	IMG	2009-10-13	hardcore3	\N	0	\N	\N	t	M Michel Tattoo	15	hardcore3_2001.jpg	hardcore3_2001_vignette.jpg	\N		1160	1	f	f	\N
2006	IMG	2009-10-14	Juliebras	\N	0	\N	\N	t	M Michel Tattoo	15	Juliebras_2006.jpg	Juliebras_2006_vignette.jpg	\N		1160	1	f	f	\N
2341	VID	2012-04-09	Bodyjam mars 2012	\N	1	\N	\N	f	M bla bla	29	Bodyjam_2341.mpg	Bodyjam_2341_vignette.jpg	Bodyjam_2341_apercu.flv	34a6cbc856dff370bf2692d66a735c98	1305	1	\N	\N	\N
1766	IMG	2009-08-31	Sirène Dos	\N	0	\N	\N	t	M Michel abc	15	100_0760_1766.jpg	100_0760_1766_vignette.jpg	\N	d36d1c60c32a5b23e15ddf45a630d722	1135	1	f	f	\N
1357	VID	2009-04-14	0	\N	1	\N	\N	f	M prenom compte a/a	17	0_1357.mpg	0_1357_vignette.jpg	0_1357_apercu.flv	d6708359b6380d795e18e2d397bcc9cb	1051	1	\N	\N	\N
1463	TPL	2009-05-11	PAGE 1	\N	-70	\N	\N	\N	M Fabien Georges	\N	\N	\N	\N	\N	1081	1	\N	\N	<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="192">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0">GOUTTEBROZE FLEURS</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/100/fonds/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/neutre4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0"/>\n</Template>
1832	IMG	2009-08-31	Bras Japonais Rose et fleur 4	\N	0	\N	\N	t	M Michel abc	15	F1010024_1832.jpg	F1010024_1832_vignette.jpg	\N	246b0c57f20081db35574604bb232801	1135	1	f	f	\N
1693	IMG	2009-06-16	compagnia-del-color	\N	0	\N	\N	t	M Hervé Pichonneau	15	compagnia_del_color_1693.jpg	compagnia_del_color_1693_vignette.jpg	\N	cef4a4dae353ba742db46177e8313478	1023	1	f	f	\N
1358	TPL	2009-04-14	jingle bienvnue	\N	1	\N	\N	f	M prenom compte a/a	7	anim_1358.mpg	anim_1358_vignette.jpg	anim_1358_apercu.flv	5aa8aedfae8685f26864bfcd8b4fc40d	1051	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="192" idCateorie="1051" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>bienvenue</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/1358/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1358/vignette/neutre4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
1833	IMG	2009-08-31	Maori Fesse 2	\N	0	\N	\N	t	M Michel abc	15	fesse_james_2_00_1833.jpg	fesse_james_2_00_1833_vignette.jpg	\N	e34a0efd5da6863dff5b201251ebfe22	1135	1	f	f	\N
1571	IMG	2009-05-19	la mère	\N	0	\N	\N	t	M Sébastien Chateau	15	la_m_re_1571.jpg	la_m_re_1571_vignette.jpg	\N	5b23e72108fb3e2adb0e6076ff88101a	1058	1	f	f	\N
1670	VID	2009-05-22	2	\N	1	\N	\N	f	M José Awouma	10	2_1670.mpg	2_1670_vignette.jpg	2_1670_apercu.flv	c4a6b02613abd0493fc3724dd6d25160	1121	1	\N	\N	\N
1572	IMG	2009-05-19	la tribue	\N	0	\N	\N	t	M Sébastien Chateau	15	la_tribue_1572.jpg	la_tribue_1572_vignette.jpg	\N	04dea5eef0813b43f20f673f1a5fefb7	1058	1	f	f	\N
1694	IMG	2009-06-16	pdts-TIGI	\N	0	\N	\N	t	M Hervé Pichonneau	15	pdts_TIGI_1694.jpg	pdts_TIGI_1694_vignette.jpg	\N	170be382f01d67cbf82d29cd6e285053	1023	1	f	f	\N
1671	VID	2009-05-22	3	\N	1	\N	\N	f	M José Awouma	9	3_1671.mpg	3_1671_vignette.jpg	3_1671_apercu.flv	a761b8140e622d1d03e26aa9e6502e48	1121	1	\N	\N	\N
1573	IMG	2009-05-19	le soldat	\N	0	\N	\N	t	M Sébastien Chateau	15	le_soldat_1573.jpg	le_soldat_1573_vignette.jpg	\N	f6965748f59d6964f53222c9094b5d15	1058	1	f	f	\N
2007	IMG	2009-10-14	Juliebras2	\N	0	\N	\N	t	M Michel Tattoo	15	Juliebras2_2007.jpg	Juliebras2_2007_vignette.jpg	\N		1160	1	f	f	\N
1574	IMG	2009-05-19	masque bleu	\N	0	\N	\N	t	M Sébastien Chateau	15	masque_bleu_1574.jpg	masque_bleu_1574_vignette.jpg	\N	8c36429a151b7aaa1b76f67538c85eeb	1058	1	f	f	\N
1695	VID	2009-06-16	tigi	\N	1	\N	\N	f	M Hervé Pichonneau	29	tigi_1695.mpg	tigi_1695_vignette.jpg	tigi_1695_apercu.flv	46a8441cc4364c328bacead88f5acacf	1023	1	\N	\N	\N
1943	IMG	2009-10-07	BBN crystal tortue	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_crystal_tortue_1943.jpg	BBN_crystal_tortue_1943_vignette.jpg	\N		1157	1	f	f	\N
1961	IMG	2009-10-08	LABRET or	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	LABRET_or_1961.jpg	LABRET_or_1961_vignette.jpg	\N		1157	1	f	f	\N
1990	IMG	2009-10-13	coccinel	\N	0	\N	\N	t	M Michel Tattoo	15	coccinel_1990.jpg	coccinel_1990_vignette.jpg	\N		1160	1	f	f	\N
1576	IMG	2009-05-19	masque	\N	0	\N	\N	t	M Sébastien Chateau	15	masque_1576.jpg	masque_1576_vignette.jpg	\N	3e6fec66108b32c75524dfe0f0ec15ef	1058	1	f	f	\N
1944	IMG	2009-10-07	BBN etoile	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_etoile_1944.jpg	BBN_etoile_1944_vignette.jpg	\N		1157	1	f	f	\N
1998	IMG	2009-10-13	greg2	\N	0	\N	\N	t	M Michel Tattoo	15	greg2_1998.jpg	greg2_1998_vignette.jpg	\N		1160	1	f	f	\N
1577	IMG	2009-05-19	mawazo	\N	0	\N	\N	t	M Sébastien Chateau	15	mawazo_1577.jpg	mawazo_1577_vignette.jpg	\N	514d0504f822bfa070e5d4b2964b4fd8	1058	1	f	f	\N
1578	IMG	2009-05-19	statue d'ebenne	\N	0	\N	\N	\N	M Sébastien Chateau	\N	\N	\N	\N	\N	1058	1	f	\N	\N
2009	IMG	2009-10-14	julien1	\N	0	\N	\N	t	M Michel Tattoo	15	julien1_2009.jpg	julien1_2009_vignette.jpg	\N		1160	1	f	f	\N
2113	IMG	2010-02-16	michel 02/2010	\N	0	\N	\N	t	M Michel Tattoo	15	2_2113.jpg	2_2113_vignette.jpg	\N		1137	1	f	f	\N
2093	IMG	2010-01-20	vignes2_2ban	\N	0	\N	\N	t	M Marc Truche	15	vignes2_2ban_2093.jpg	vignes2_2ban_2093_vignette.jpg	\N		1166	1	f	f	\N
2092	IMG	2010-01-20	vignes2_2ban	\N	0	\N	\N	t	M Marc Truche	15	vignes2_2ban_2092.jpg	vignes2_2ban_2092_vignette.jpg	\N		1166	1	f	f	\N
1714	TPL	2009-07-22	xavtest	\N	1	\N	\N	f	M prenom compte a/a	12	anim_1714.mpg	anim_1714_vignette.jpg	anim_1714_apercu.flv	17adf46cd509851f97ccab0a4e65f7fa	1044	1	\N	\N	<Template label="decompte1egal2" nomSwf="decompte1egal2.swf" nomClasse="decompte1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="280" idCateorie="1044" idClient="1001">\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Pour 1 couleur , les mèches dégradées</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="accroche" nomAttribut="onde1_cont#accroche_cont#accroche#accroche"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="15" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Exclusivité</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/201/fonds/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/neutre4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/201/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://farm3.static.flickr.com/2627/3746470286_5377031247_o.jpg" valeurVignette="http://farm3.static.flickr.com/2627/3746470286_9cd038eb57_s.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#texte_cont#photo2" hauteur="450" largeur="450" valeurAttribut="http://fichierclient.iconeo.fr/template/1714/data/3747009748_1b8aca6d6f_m.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1714/vignette/3747009748_1b8aca6d6f_s.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
1673	VID	2009-05-22	5	\N	1	\N	\N	f	M José Awouma	18	5_1673.mpg	5_1673_vignette.jpg	5_1673_apercu.flv	e54e05c1bce42bb3e973335053539ff5	1121	1	\N	\N	\N
1393	TPL	2009-05-05	fab	\N	1	\N	\N	f	M Fabien Georges	18	anim_1393.mpg	anim_1393_vignette.jpg	anim_1393_apercu.flv	ba6101b6e8125581350488acf343f551	1081	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondepresentation" nomSwf="ondepresentation.swf" nomClasse="ondepresentation" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400" idCateorie="1081" idClient="1007">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMOTION</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">10 euros la coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/1393/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1393/vignette/neutre4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/300/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/1393/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1393/vignette/coiff1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
1769	IMG	2009-08-31	Carpe Japonaise	\N	0	\N	\N	t	M Michel abc	15	100_0775_1769.jpg	100_0775_1769_vignette.jpg	\N	3dc9c5c00798e727af7ca5806f23916a	1135	1	f	f	\N
1359	TPL	2009-04-14	abe	\N	1	\N	\N	f	M prenom compte a/a	12	anim_1359.mpg	anim_1359_vignette.jpg	anim_1359_apercu.flv	806a3da911f67395b62c087b834e77c4	1051	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="decompte1egal2" nomSwf="decompte1egal2.swf" nomClasse="decompte1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="280" idCateorie="1051" idClient="1001">\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>exclusivit&amp;offertes</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="accroche" nomAttribut="onde1_cont#accroche_cont#accroche#accroche"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="15" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>au rabais</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/1359/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1359/vignette/neutre4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/201/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/1359/data/xpsgen27ge.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1359/vignette/xpsgen27ge.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#texte_cont#photo2" hauteur="450" largeur="450" valeurAttribut="http://fichierclient.iconeo.fr/template/1359/data/Tentation-rose-rouge.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1359/vignette/Tentation-rose-rouge.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
1490	IMG	2009-05-11	pdts-TIGI	\N	0	\N	\N	t	M Philippe Pugnat	15	pdts_TIGI_1490.jpg	pdts_TIGI_1490_vignette.jpg	\N	170be382f01d67cbf82d29cd6e285053	1071	1	f	f	\N
1672	VID	2009-05-22	4	\N	1	\N	\N	f	M José Awouma	49	4_1672.mpg	4_1672_vignette.jpg	4_1672_apercu.flv	a2d9ebaa8eccccb22c19bec585dc1af7	1121	1	\N	\N	\N
1760	IMG	2009-08-31	Portrait femme	\N	0	\N	\N	t	M Michel abc	15	100_0363_1760.jpg	100_0363_1760_vignette.jpg	\N	25e4ed82e5c1ca6d426d6741846b68f6	1135	1	f	f	\N
2342	VID	2012-04-09	Bodycombat mars 2012	\N	1	\N	\N	f	M bla bla	29	Bodycombat_2342.mpg	Bodycombat_2342_vignette.jpg	Bodycombat_2342_apercu.flv	6d761b614aa12782303b072fbf6d10c2	1305	1	\N	\N	\N
1768	IMG	2009-08-31	Carpe Japonaise Mollet 1	\N	0	\N	\N	t	M Michel abc	15	100_0773_1768.jpg	100_0773_1768_vignette.jpg	\N	dd10a962a2eeab4e0a48a93e5db4f8d9	1135	1	f	f	\N
1957	IMG	2009-10-08	BBN tortue	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_tortue_1957.jpg	BBN_tortue_1957_vignette.jpg	\N		1157	1	f	f	\N
1834	IMG	2009-08-31	Maori Fesse et cuisse 2	\N	0	\N	\N	t	M Michel abc	15	fesse_james_00_1834.jpg	fesse_james_00_1834_vignette.jpg	\N	12c50b8a475d68ab07c9eb806ecd955b	1135	1	f	f	\N
1415	IMG	2009-05-07	Bio.rritz 067	\N	0	\N	\N	t	M Philippe Pugnat	15	Bio.rritz_067_1415.jpg	Bio.rritz_067_1415_vignette.jpg	\N	358143d53a1d0644acade4bb5aa146c8	1071	1	f	f	\N
1492	VID	2009-05-11	after coiffure	\N	1	\N	\N	f	M Philippe Pugnat	17	after_coiffure_1492.mpg	after_coiffure_1492_vignette.jpg	after_coiffure_1492_apercu.flv	121ceebe929dda799c2c8e24d6ececad	1072	1	\N	\N	\N
1835	IMG	2009-08-31	Dos Dragon rock & roll	\N	0	\N	\N	t	M Michel abc	15	img018_1835.jpg	img018_1835_vignette.jpg	\N	f2003e1ccb2d06f7439a8edb58c36643	1135	1	f	f	\N
2019	IMG	2009-10-14	noire1	\N	0	\N	\N	t	M Michel Tattoo	15	noire1_2019.jpg	noire1_2019_vignette.jpg	\N		1160	1	f	f	\N
1493	VID	2009-05-11	carte fidelité	\N	1	\N	\N	f	M Philippe Pugnat	22	carte_fidelit__1493.mpg	carte_fidelit__1493_vignette.jpg	carte_fidelit__1493_apercu.flv	c32df9930804a6132591c91856e6e223	1072	1	\N	\N	\N
2106	VID	2010-02-08	bague	\N	1	\N	\N	f	M Marc Truche	14	bague_2106.mpg	bague_2106_vignette.jpg	bague_2106_apercu.flv	20790b77ae438037a0ed77b345314d25	1276	1	\N	\N	\N
1980	IMG	2009-10-13	100_124feur	\N	0	\N	\N	t	M Michel Tattoo	15	100_124feur_1980.jpg	100_124feur_1980_vignette.jpg	\N		1160	1	f	f	\N
2343	VID	2012-04-09	Bodybalance mars 2012	\N	1	\N	\N	f	M bla bla	29	Bodybalance_2343.mpg	Bodybalance_2343_vignette.jpg	Bodybalance_2343_apercu.flv	c04cc4f461536f751dc9c6b1e03354dc	1305	1	\N	\N	\N
1631	TPL	2009-05-20	onde test halo	\N	1	\N	\N	f	M prenom compte a/a	7	anim_1631.mpg	anim_1631_vignette.jpg	anim_1631_apercu.flv	5d1c1f33364f4d37982023679fd3db70	1044	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="192" idCateorie="1044" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>JINGLE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/1631/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1631/vignette/neutre4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
1771	IMG	2009-08-31	Carpe Japonaise Mollet 3	\N	0	\N	\N	t	M Michel abc	15	100_0776_1771.jpg	100_0776_1771_vignette.jpg	\N	3825f60831c590040e89dd185923dd65	1135	1	f	f	\N
1494	IMG	2009-05-11	pdts-TIGI2	\N	0	\N	\N	t	M Philippe Pugnat	15	pdts_TIGI2_1494.jpg	pdts_TIGI2_1494_vignette.jpg	\N	8feccdc1513a29f382d0643f633e340d	1072	1	f	f	\N
1772	IMG	2009-08-31	Biomecanic Body suit 2	\N	0	\N	\N	t	M Michel abc	15	100_0824_1772.jpg	100_0824_1772_vignette.jpg	\N	c0e662a4b72dbadbcb19932507680abd	1135	1	f	f	\N
1962	IMG	2009-10-08	pour tout bijou achete	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	pour_tout_bijou_achete_1962.jpg	pour_tout_bijou_achete_1962_vignette.jpg	\N		1157	1	f	f	\N
1495	IMG	2009-05-11	pdts-TIGI3	\N	0	\N	\N	t	M Philippe Pugnat	15	pdts_TIGI3_1495.jpg	pdts_TIGI3_1495_vignette.jpg	\N	2139dea8d63e219c460342af275a197f	1072	1	f	f	\N
1674	VID	2009-05-22	6	\N	1	\N	\N	f	M José Awouma	10	6_1674.mpg	6_1674_vignette.jpg	6_1674_apercu.flv	cf069fccd0b718edaad54e7423d5d344	1121	1	\N	\N	\N
1773	IMG	2009-08-31	Biomécanic Body Suit 3	\N	0	\N	\N	t	M Michel abc	15	100_0825_1773.jpg	100_0825_1773_vignette.jpg	\N	7cb0e2cb4533ea14fdb4b327b553a92f	1135	1	f	f	\N
1496	IMG	2009-05-11	visage1	\N	0	\N	\N	t	M Philippe Pugnat	15	visage1_1496.jpg	visage1_1496_vignette.jpg	\N	728cee0ac6ed2965277f7716a5077f6e	1073	1	f	f	\N
1774	IMG	2009-08-31	Vierge Chapelet Cuisse	\N	0	\N	\N	t	M Michel abc	15	100_0836_1774.jpg	100_0836_1774_vignette.jpg	\N	14051094625d0d35fbe11a7310161796	1135	1	f	f	\N
1675	VID	2009-05-22	7	\N	1	\N	\N	f	M José Awouma	49	7_1675.mpg	7_1675_vignette.jpg	7_1675_apercu.flv	a2d9ebaa8eccccb22c19bec585dc1af7	1121	1	\N	\N	\N
1497	IMG	2009-05-11	visage2	\N	0	\N	\N	t	M Philippe Pugnat	15	visage2_1497.jpg	visage2_1497_vignette.jpg	\N	20114d3a1935a82d9e90cf5d6d2189d0	1073	1	f	f	\N
1947	IMG	2009-10-07	BBN fleur	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_fleur_1947.jpg	BBN_fleur_1947_vignette.jpg	\N		1157	1	f	f	\N
1775	IMG	2009-08-31	Biomécanic Body Suit 4	\N	0	\N	\N	t	M Michel abc	15	100_0826_1775.jpg	100_0826_1775_vignette.jpg	\N	e4e94a273b00d75e73af47ecbf72ceae	1135	1	f	f	\N
1498	IMG	2009-05-11	visage3	\N	0	\N	\N	t	M Philippe Pugnat	15	visage3_1498.jpg	visage3_1498_vignette.jpg	\N	3ce13a7aa00e76a8bc08e88a6c430874	1073	1	f	f	\N
1776	IMG	2009-08-31	Masque Japonais	\N	0	\N	\N	t	M Michel abc	15	100_0860_1776.jpg	100_0860_1776_vignette.jpg	\N	57b3964b8c87cf89836841f0fe2442a2	1135	1	f	f	\N
1927	IMG	2009-10-07	BBA cerise	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBA_cerise_1927.jpg	BBA_cerise_1927_vignette.jpg	\N		1157	1	f	f	\N
1499	IMG	2009-05-11	visage4	\N	0	\N	\N	t	M Philippe Pugnat	15	visage4_1499.jpg	visage4_1499_vignette.jpg	\N	b52731acf6ab0cc472a81c1f9218ea8c	1073	1	f	f	\N
1777	IMG	2009-08-31	Moine Fond Japonais	\N	0	\N	\N	t	M Michel abc	15	100_0899_1777.jpg	100_0899_1777_vignette.jpg	\N	caba334bf2b74571934079bfee155fe9	1135	1	f	f	\N
1788	IMG	2009-08-31	Oeil réaliste Dos	\N	0	\N	\N	t	M Michel abc	15	100_1124_1788.jpg	100_1124_1788_vignette.jpg	\N	4838bf8912d3a453f802584e0b70cfd8	1135	1	f	f	\N
1999	IMG	2009-10-13	hardcore1	\N	0	\N	\N	t	M Michel Tattoo	15	hardcore1_1999.jpg	hardcore1_1999_vignette.jpg	\N		1160	1	f	f	\N
1500	VID	2009-05-11	onde 1egal2	\N	1	\N	\N	f	M Philippe Pugnat	22	onde1egal2_1500.mpg	onde1egal2_1500_vignette.jpg	onde1egal2_1500_apercu.flv	4dac15019e38218494dbc66b0a5890b0	1073	1	\N	\N	\N
1906	IMG	2009-09-16	michel: masque sept 09	\N	0	\N	\N	t	M Michel Tattoo	15	michel_tattoo_masque_sept_09_1906.jpg	michel_tattoo_masque_sept_09_1906_vignette.jpg	\N		1137	1	f	f	\N
2063	IMG	2009-12-16	01	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	01_2063.jpg	01_2063_vignette.jpg	\N		1204	1	f	f	\N
1963	IMG	2009-10-08	promotions	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	promotions_1963.jpg	promotions_1963_vignette.jpg	\N		1157	1	f	f	\N
1981	IMG	2009-10-13	arbre1	\N	0	\N	\N	t	M Michel Tattoo	15	arbre1_1981.jpg	arbre1_1981_vignette.jpg	\N		1160	1	f	f	\N
1607	IMG	2009-05-19	residence-calme	\N	0	\N	\N	t	M prenom compte a/a	15	residence_calme_1607.jpg	residence_calme_1607_vignette.jpg	\N	af8d37fd5bfe7894c1f2145a18056bf0	1014	1	f	t	\N
1786	IMG	2009-08-31	Bouddha Bras 4	\N	0	\N	\N	t	M Michel abc	15	100_1114_1786.jpg	100_1114_1786_vignette.jpg	\N	7374f07f38418f4df290d805ae62dc0e	1135	1	f	f	\N
1715	IMG	2009-07-22	036-hijo-del-sol	\N	0	\N	\N	\N	M Jean-Luc Perlmutter	\N	\N	\N	\N	\N	10950	1	f	\N	\N
1778	IMG	2009-08-31	Ceinture de fleur Cerisier	\N	0	\N	\N	t	M Michel abc	15	100_0942_1778.jpg	100_0942_1778_vignette.jpg	\N	b0d41deb64b0840aab897d1c95b05a89	1135	1	f	f	\N
1779	IMG	2009-08-31	Bras Japonais Carpe 1	\N	0	\N	\N	t	M Michel abc	15	100_0956_1779.jpg	100_0956_1779_vignette.jpg	\N	feb5fb7271a5e2236c22cd4ef2b20d27	1135	1	f	f	\N
1632	TPL	2009-05-22	bonjour	\N	1	\N	\N	f	M José Awouma	8	anim_1632.mpg	anim_1632_vignette.jpg	anim_1632_apercu.flv	6e497c90d1485fc33ec3242191fb81c5	1110	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="192" idCateorie="1110" idClient="1009">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B><I>bonjour!!!</I></B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/1632/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/1632/vignette/neutre4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
1501	VID	2009-05-11	ondejingle	\N	1	\N	\N	f	M Philippe Pugnat	7	ondejingle_1501.mpg	ondejingle_1501_vignette.jpg	ondejingle_1501_apercu.flv	e5962b009dcc5ed63b6e2485f3b600f3	1073	1	\N	\N	\N
1633	IMG	2009-05-22	visage3	\N	0	\N	\N	t	M José Awouma	15	visage3_1633.jpg	visage3_1633_vignette.jpg	\N	3ce13a7aa00e76a8bc08e88a6c430874	1109	1	f	f	\N
1781	IMG	2009-08-31	Papillon Bas du Dos	\N	0	\N	\N	t	M Michel abc	15	100_1032_1781.jpg	100_1032_1781_vignette.jpg	\N	8cceb418d254caaed751f4dd029f43cd	1135	1	f	f	\N
1945	IMG	2009-10-07	BBN fée	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_f_e_1945.jpg	BBN_f_e_1945_vignette.jpg	\N		1157	1	f	f	\N
1782	IMG	2009-08-31	Fleur Arabesque Branche	\N	0	\N	\N	t	M Michel abc	15	100_1072_1782.jpg	100_1072_1782_vignette.jpg	\N	529d66b51aabb1fbd359d16740b7c3c1	1135	1	f	f	\N
2002	IMG	2009-10-14	hypo1	\N	0	\N	\N	t	M Michel Tattoo	15	hypo1_2002.jpg	hypo1_2002_vignette.jpg	\N		1160	1	f	f	\N
1928	IMG	2009-10-07	BBA feuille	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBA_feuille_1928.jpg	BBA_feuille_1928_vignette.jpg	\N		1157	1	f	f	\N
1783	IMG	2009-08-31	Bouddha Bras 1	\N	0	\N	\N	t	M Michel abc	15	100_1111_1783.jpg	100_1111_1783_vignette.jpg	\N	5da3f1c34df85d9bc7378987c47f4c7c	1135	1	f	f	\N
1784	IMG	2009-08-31	Bouddha Bras 2	\N	0	\N	\N	t	M Michel abc	15	100_1112_1784.jpg	100_1112_1784_vignette.jpg	\N	b7e72cef3770139e3c847fe9eb7de3aa	1135	1	f	f	\N
2008	IMG	2009-10-14	juliebras3	\N	0	\N	\N	t	M Michel Tattoo	15	juliebras3_2008.jpg	juliebras3_2008_vignette.jpg	\N		1160	1	f	f	\N
1785	IMG	2009-08-31	Bouddha Bras 3	\N	0	\N	\N	t	M Michel abc	15	100_1113_1785.jpg	100_1113_1785_vignette.jpg	\N	a11cd51de0904a743bbf828d6b65d5d7	1135	1	f	f	\N
1964	IMG	2009-10-08	sans rendez-vous	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	sans_rendez_vous_1964.jpg	sans_rendez_vous_1964_vignette.jpg	\N		1157	1	f	f	\N
1982	IMG	2009-10-13	budha	\N	0	\N	\N	t	M Michel Tattoo	15	budha_1982.jpg	budha_1982_vignette.jpg	\N		1160	1	f	f	\N
1787	IMG	2009-08-31	Bouddha Bras 5	\N	0	\N	\N	t	M Michel abc	15	100_1115_1787.jpg	100_1115_1787_vignette.jpg	\N	1f5c6cda047af8c942b3a8aeca03b3c9	1135	1	f	f	\N
1991	IMG	2009-10-13	cranepirate	\N	0	\N	\N	t	M Michel Tattoo	15	cranepirate_1991.jpg	cranepirate_1991_vignette.jpg	\N		1160	1	f	f	\N
1965	IMG	2009-10-08	stud or	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	stud_or_1965.jpg	stud_or_1965_vignette.jpg	\N		1157	1	f	f	\N
1930	IMG	2009-10-07	BBA lezard	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBA_lezard_1930.jpg	BBA_lezard_1930_vignette.jpg	\N		1157	1	f	f	\N
2211	IMG	2010-04-21	michel 04/2010 letrage elfique	\N	0	\N	\N	t	M Michel Tattoo	15	michel_04_2211.jpg	michel_04_2211_vignette.jpg	\N		1137	1	f	f	\N
2212	IMG	2010-04-21	michel 04/2010 etoiles dos	\N	0	\N	\N	t	M Michel Tattoo	15	michel_2212.jpg	michel_2212_vignette.jpg	\N		1137	1	f	f	\N
1836	IMG	2009-08-31	Bras Chien Serpent	\N	0	\N	\N	t	M Michel abc	15	img019_1836.jpg	img019_1836_vignette.jpg	\N	4067d85dc66a824a782432e56953dab6	1135	1	f	f	\N
1789	IMG	2009-08-31	Cerise Pied	\N	0	\N	\N	t	M Michel abc	15	100_1176_1789.jpg	100_1176_1789_vignette.jpg	\N	eee3b3eb69cc34235e97aadda6fae5f4	1135	1	f	f	\N
1582	VID	2009-05-19	AAFRICAIN	\N	1	\N	\N	f	M Sébastien Chateau	14	AAFRICAIN_1582.mpg	AAFRICAIN_1582_vignette.jpg	AAFRICAIN_1582_apercu.flv	8568d21686ed660c62f54ae1c834fb9d	1114	1	\N	\N	\N
1790	IMG	2009-08-31	Fleur Poitrine	\N	0	\N	\N	t	M Michel abc	15	100_1240_1790.jpg	100_1240_1790_vignette.jpg	\N	ebc5bcf82c8bd909eaebfa8c6ebe77e7	1135	1	f	f	\N
1699	IMG	2009-06-30	prodxcwxc	\N	0	\N	\N	t	M Hervé Pichonneau	15	prod_1699.jpg	prod_1699_vignette.jpg	\N	ab51398d0f3b6f0232ac7961de4f2046	1068	1	f	f	\N
1886	TPL	2009-09-10	ffff	\N	1	\N	\N	\N	M prenom compte a/a	0	anim_1886.mpg	anim_1886_vignette.jpg	anim_1886_apercu.flv	cea6a06722a6eaab7ec25b4242c799b4	1155	1	\N	\N	<Template label="ondegamme" nomSwf="ondegamme.swf" nomClasse="ondegamme" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="360">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#F6880E" LETTERSPACING="0" KERNING="0"><B><I>Les travaux d&apos;été à Mérignac.</I></B><FONT COLOR="#000000"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="22" COLOR="#52132C" LETTERSPACING="0" KERNING="1"><B><I>La ville a profité de la période estivale pour avancer sur plusieurs chantiers en cours et procéder à des travaux de rénovation.</I></B><FONT SIZE="18" COLOR="#0000CC"></FONT></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/302/fonds/NEUTRE7.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/NEUTRE7.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/302/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo1" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo1" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/302/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/302/vignette/coiff1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/302/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/302/vignette/coiff1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo3" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo3" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/302/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/302/vignette/coiff1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2020	IMG	2009-10-14	oeil1	\N	0	\N	\N	t	M Michel Tattoo	15	oeil1_2020.jpg	oeil1_2020_vignette.jpg	\N		1160	1	f	f	\N
1636	IMG	2009-05-22	pdts-TIGI4	\N	0	\N	\N	t	M José Awouma	15	pdts_TIGI4_1636.jpg	pdts_TIGI4_1636_vignette.jpg	\N	b18e8dc372ff61146845c655c05d47d5	1110	1	f	f	\N
1364	IMG	2009-04-20	lagon2	\N	0	\N	\N	t	M Hervé Pichonneau	15	lagon2_1364.jpg	lagon2_1364_vignette.jpg	\N	f30cc492cde1d73c54945b2545e142fa	1095	1	f	f	\N
1791	IMG	2009-08-31	Bras Celtique 1	\N	0	\N	\N	t	M Michel abc	15	100_1255_1791.jpg	100_1255_1791_vignette.jpg	\N	b90de4adef9c4828226b669b58d0e2ae	1135	1	f	f	\N
1365	IMG	2009-04-20	lagon	\N	0	\N	\N	t	M Hervé Pichonneau	15	lagon_1365.jpg	lagon_1365_vignette.jpg	\N	880cdfb6f7562b727aae36782c8ab07a	1095	1	f	f	\N
1637	IMG	2009-05-22	visage1	\N	0	\N	\N	t	M José Awouma	15	visage1_1637.jpg	visage1_1637_vignette.jpg	\N	728cee0ac6ed2965277f7716a5077f6e	1110	1	f	f	\N
1931	IMG	2009-10-07	BBA tribal	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBA_tribal_1931.jpg	BBA_tribal_1931_vignette.jpg	\N		1157	1	f	f	\N
1366	IMG	2009-04-20	massage2	\N	0	\N	\N	t	M Hervé Pichonneau	15	massage2_1366.jpg	massage2_1366_vignette.jpg	\N	7fe7fd84837e590236ff2c8521ea2dcb	1095	1	f	f	\N
1363	VID	2009-04-20	zen	\N	1	\N	\N	f	M Hervé Pichonneau	28	zen_1363.mpg	zen_1363_vignette.jpg	zen_1363_apercu.flv	e48b717969d5080a01c32a3df7f500c4	1095	1	\N	\N	\N
2028	IMG	2009-10-14	rai	\N	0	\N	\N	t	M Michel Tattoo	15	rai_2028.jpg	rai_2028_vignette.jpg	\N		1160	1	f	f	\N
1367	IMG	2009-04-20	massage3	\N	0	\N	\N	t	M Hervé Pichonneau	15	massage3_1367.jpg	massage3_1367_vignette.jpg	\N	ed95a03a603ff345dd9fb2aaa5d21287	1095	1	f	f	\N
1948	IMG	2009-10-08	BBN fleur noire	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_fleur_noire_1948.jpg	BBN_fleur_noire_1948_vignette.jpg	\N		1157	1	f	f	\N
1792	IMG	2009-08-31	Bras Celtique 2	\N	0	\N	\N	t	M Michel abc	15	100_1259_1792.jpg	100_1259_1792_vignette.jpg	\N	7d1fa9c3f920744b3086fc5ea0d445e1	1135	1	f	f	\N
1368	IMG	2009-04-20	massage	\N	0	\N	\N	t	M Hervé Pichonneau	15	massage_1368.jpg	massage_1368_vignette.jpg	\N	b86b63568f6098d8152be2e854df2f83	1095	1	f	f	\N
1814	IMG	2009-08-31	Bras Poulpe Cover Up 3	\N	0	\N	\N	t	M Michel abc	15	102_1601_1814.jpg	102_1601_1814_vignette.jpg	\N	9603c6a20b8fe6f2bce6067430010219	1135	1	f	f	\N
1983	IMG	2009-10-13	carpe1	\N	0	\N	\N	t	M Michel Tattoo	15	carpe1_1983.jpg	carpe1_1983_vignette.jpg	\N		1160	1	f	f	\N
1369	IMG	2009-04-20	zen2	\N	0	\N	\N	t	M Hervé Pichonneau	15	zen2_1369.jpg	zen2_1369_vignette.jpg	\N	c5afb0c8d546496c419b87d0ca7eeab3	1095	1	f	f	\N
1824	IMG	2009-08-31	Bras Rose Fond Léopard 2	\N	0	\N	\N	t	M Michel abc	15	DSCN0386_1824.jpg	DSCN0386_1824_vignette.jpg	\N	7fe04ea347d5804c593bcf0be0de431a	1135	1	f	f	\N
1826	IMG	2009-08-31	Coccinelle Ventre	\N	0	\N	\N	t	M Michel abc	15	DSCN0434_1826.jpg	DSCN0434_1826_vignette.jpg	\N	c98200440de19166d309b54db89d4e8c	1135	1	f	f	\N
1370	IMG	2009-04-20	plage	\N	0	\N	\N	t	M Hervé Pichonneau	15	plage_1370.jpg	plage_1370_vignette.jpg	\N	744e4d2f957731a001374fe444106bd7	1095	1	f	f	\N
1827	IMG	2009-08-31	Carpe Japonaise Mollet	\N	0	\N	\N	t	M Michel abc	15	DSCN0495_1827.jpg	DSCN0495_1827_vignette.jpg	\N	83f5175a82e368702d76ae7a4be392a0	1135	1	f	f	\N
1828	IMG	2009-08-31	Bras Japonais Rose et fleur 1	\N	0	\N	\N	t	M Michel abc	15	F1010019_1828.jpg	F1010019_1828_vignette.jpg	\N	3a40778d0e32d05b89dfd44ecdb3d46f	1135	1	f	f	\N
1992	IMG	2009-10-13	didier	\N	0	\N	\N	t	M Michel Tattoo	15	didier_1992.jpg	didier_1992_vignette.jpg	\N		1160	1	f	f	\N
1838	IMG	2009-08-31	Pape avec Diable Dos	\N	0	\N	\N	t	M Michel abc	15	img020_1838.jpg	img020_1838_vignette.jpg	\N	aff9919d560903e042ed4e19a975ee1f	1135	1	f	f	\N
1839	IMG	2009-08-31	Scarabé Mollet	\N	0	\N	\N	t	M Michel abc	15	img021_1839.jpg	img021_1839_vignette.jpg	\N	565cd564fa8b0189c0c9ff9a55997dc5	1135	1	f	f	\N
1840	IMG	2009-08-31	Poëme Dos	\N	0	\N	\N	t	M Michel abc	15	img023_1840.jpg	img023_1840_vignette.jpg	\N	45039deaf1af0cb06b4cbf2caa5b3f9d	1135	1	f	f	\N
1192	VID	2009-02-16	Présentation Mayekawa	\N	1	\N	\N	f	M prenom nom	286	aaa_1192.mpg	aaa_1192_vignette.jpg	aaa_1192_apercu.flv	daa93c010e69b9ad65fedc9702e3f0e6	1044	1	\N	t	\N
1638	IMG	2009-05-22	visage2	\N	0	\N	\N	t	M José Awouma	15	visage2_1638.jpg	visage2_1638_vignette.jpg	\N	20114d3a1935a82d9e90cf5d6d2189d0	1110	1	f	f	\N
1793	IMG	2009-08-31	Colibri fleur ventre	\N	0	\N	\N	t	M Michel abc	15	100_1271_1793.jpg	100_1271_1793_vignette.jpg	\N	3488fb5d60550cdb1f4b191391a20ba9	1135	1	f	f	\N
1371	IMG	2009-04-20	zen3	\N	0	\N	\N	t	M Hervé Pichonneau	15	zen3_1371.jpg	zen3_1371_vignette.jpg	\N	c37c319465aa355a1b93ee0d912ac216	1095	1	f	f	\N
1794	IMG	2009-08-31	Bras Jack 1	\N	0	\N	\N	t	M Michel abc	15	100_1285_1794.jpg	100_1285_1794_vignette.jpg	\N	f23d65f2c4b9e67d10af33ad4ade0de0	1135	1	f	f	\N
1372	IMG	2009-04-20	zen4	\N	0	\N	\N	t	M Hervé Pichonneau	15	zen4_1372.jpg	zen4_1372_vignette.jpg	\N	0ed60549dbbfdab3412dfb8bc502faca	1095	1	f	f	\N
1929	IMG	2009-10-07	BBA hirondelle	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBA_hirondelle_1929.jpg	BBA_hirondelle_1929_vignette.jpg	\N		1157	1	f	f	\N
1373	IMG	2009-04-20	zen	\N	0	\N	\N	t	M Hervé Pichonneau	15	zen_1373.jpg	zen_1373_vignette.jpg	\N	804c3356705844f7f07dedea27c9ed57	1095	1	f	f	\N
1795	IMG	2009-08-31	Bras Jack 2	\N	0	\N	\N	t	M Michel abc	15	100_1288_1795.jpg	100_1288_1795_vignette.jpg	\N	4bfa5ecdcbf14ef1a11cfd19cdfa6ea5	1135	1	f	f	\N
2003	IMG	2009-10-14	insect	\N	0	\N	\N	t	M Michel Tattoo	15	insect_2003.jpg	insect_2003_vignette.jpg	\N		1160	1	f	f	\N
1796	IMG	2009-08-31	Bras Jack 3	\N	0	\N	\N	t	M Michel abc	15	100_1291_1796.jpg	100_1291_1796_vignette.jpg	\N	907491e83508835256d40f9b66810af7	1135	1	f	f	\N
1797	IMG	2009-08-31	Bras Jack 4	\N	0	\N	\N	t	M Michel abc	15	100_1297_1797.jpg	100_1297_1797_vignette.jpg	\N	db4c02b9657adfbaa53196c1d57bc74e	1135	1	f	f	\N
1993	IMG	2009-10-13	dos1	\N	0	\N	\N	t	M Michel Tattoo	15	dos1_1993.jpg	dos1_1993_vignette.jpg	\N		1160	1	f	f	\N
1798	IMG	2009-08-31	Tribal Avec Implant Bras	\N	0	\N	\N	t	M Michel abc	15	100_1306_1798.jpg	100_1306_1798_vignette.jpg	\N	3845bdd4f566123838b596ae13b332fb	1135	1	f	f	\N
1799	IMG	2009-08-31	gorgone ventre	\N	0	\N	\N	t	M Michel abc	15	100_1331_1799.jpg	100_1331_1799_vignette.jpg	\N	9c29a46cc80cd151afda9c36a8b27c8e	1135	1	f	f	\N
1949	IMG	2009-10-08	BBN inversé	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_invers__1949.jpg	BBN_invers__1949_vignette.jpg	\N		1157	1	f	f	\N
1800	IMG	2009-08-31	Bras Fleur Papillon Japonnais 1	\N	0	\N	\N	t	M Michel abc	15	100_1411_1800.jpg	100_1411_1800_vignette.jpg	\N	37f64e45e2143060014215d80e92d52f	1135	1	f	f	\N
1801	IMG	2009-08-31	Bras Fleur Papillon Japonnais 2	\N	0	\N	\N	t	M Michel abc	15	100_1413_1801.jpg	100_1413_1801_vignette.jpg	\N	5e9e67e50bc1ea418087e526c9b04a7b	1135	1	f	f	\N
1966	IMG	2009-10-12	DSCF0057	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF0057_1966.jpg	DSCF0057_1966_vignette.jpg	\N		1159	1	f	f	\N
1802	IMG	2009-08-31	Bras Fleur Papillon Japonnais 3	\N	0	\N	\N	t	M Michel abc	15	100_1415_1802.jpg	100_1415_1802_vignette.jpg	\N	a4042ee820e6c9303894f4acf4602e58	1135	1	f	f	\N
1984	IMG	2009-10-13	carpe4	\N	0	\N	\N	t	M Michel Tattoo	15	carpe4_1984.jpg	carpe4_1984_vignette.jpg	\N		1160	1	f	f	\N
2000	IMG	2009-10-13	hardcore2	\N	0	\N	\N	t	M Michel Tattoo	15	hardcore2_2000.jpg	hardcore2_2000_vignette.jpg	\N		1160	1	f	f	\N
1846	IMG	2009-08-31	Couture Réaliste Crâne	\N	0	\N	\N	t	M Michel abc	15	Scan10005_1846.jpg	Scan10005_1846_vignette.jpg	\N	f510c5889ab384823330c49e00ded728	1135	1	f	f	\N
1967	IMG	2009-10-12	DSCF0065	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF0065_1967.jpg	DSCF0065_1967_vignette.jpg	\N		1159	1	f	f	\N
1909	IMG	2009-09-16	michel :travail en cours.sept 09	\N	0	\N	\N	t	M Michel Tattoo	15	P1010022_1909.jpg	P1010022_1909_vignette.jpg	\N		1137	1	f	f	\N
1910	IMG	2009-09-16	michel : travail en cours.sept 09	\N	0	\N	\N	t	M Michel Tattoo	15	P1010023_1910.jpg	P1010023_1910_vignette.jpg	\N		1137	1	f	f	\N
2112	IMG	2010-02-16	michel cover up 02/2010	\N	0	\N	\N	t	M Michel Tattoo	15	1_2112.jpg	1_2112_vignette.jpg	\N		1137	1	f	f	\N
1968	IMG	2009-10-12	DSCF0274	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF0274_1968.jpg	DSCF0274_1968_vignette.jpg	\N		1159	1	f	f	\N
1585	IMG	2009-05-19	centre-ville	\N	0	\N	\N	t	M prenom compte a/a	15	centre_ville_1585.jpg	centre_ville_1585_vignette.jpg	\N	a36bd1742fe09e1eb03fa2014f2767f7	1012	1	f	f	\N
1905	IMG	2009-09-16	michel : hirondelles sept 09	\N	0	\N	\N	t	M Michel Tattoo	15	michel_tattoo_hirondelles_sept_09_1905.jpg	michel_tattoo_hirondelles_sept_09_1905_vignette.jpg	\N		1137	1	f	f	\N
1374	VID	2009-04-20	atlanthal1	\N	1	\N	\N	f	M Hervé Pichonneau	25	atlanthal1_1374.mpg	atlanthal1_1374_vignette.jpg	atlanthal1_1374_apercu.flv	87f36cccbf48a4542d2946c23d846213	1095	1	\N	\N	\N
1546	VID	2009-05-19	bio-rritz	\N	1	\N	\N	f	M Philippe Pugnat	62	bio_rritz_1546.mpg	bio_rritz_1546_vignette.jpg	bio_rritz_1546_apercu.flv	0b9ae4bee21dcc320fbedc97d7909b12	1105	1	\N	\N	\N
1803	IMG	2009-08-31	Bras Fleur Papillon Japonnais 4	\N	0	\N	\N	t	M Michel abc	15	100_1418_1803.jpg	100_1418_1803_vignette.jpg	\N	e2766a262c7d1d734ab3c91b041bdcfe	1135	1	f	f	\N
1375	VID	2009-04-20	atlanthal entier	\N	1	\N	\N	f	M Hervé Pichonneau	53	atlanthal_entier_1375.mpg	atlanthal_entier_1375_vignette.jpg	atlanthal_entier_1375_apercu.flv	942708ebfb5e1ee310d5006b5fa427e3	1095	1	\N	\N	\N
1398	IMG	2009-05-06	visage1	\N	0	\N	\N	t	M Jean-Luc Perlmutter	15	visage1_1398.jpg	visage1_1398_vignette.jpg	\N	728cee0ac6ed2965277f7716a5077f6e	1064	1	f	f	\N
1584	IMG	2009-05-19	Bordeaux	\N	0	\N	\N	t	M prenom compte a/a	15	Bordeaux_1584.jpg	Bordeaux_1584_vignette.jpg	\N	fc3d48b96f415c6a074094a0ab518c85	1012	1	f	f	\N
1639	IMG	2009-05-22	lagon	\N	0	\N	\N	t	M José Awouma	15	lagon_1639.jpg	lagon_1639_vignette.jpg	\N	880cdfb6f7562b727aae36782c8ab07a	1118	1	f	f	\N
1701	IMG	2009-07-03	1	\N	0	\N	\N	t	M Hervé Pichonneau	15	1_1701.jpg	1_1701_vignette.jpg	\N	9177993e450573985ad5ce977fcd18e6	1068	1	f	f	\N
1804	IMG	2009-08-31	Bras Fleur Papillon Japonnais 5	\N	0	\N	\N	t	M Michel abc	15	100_1419_1804.jpg	100_1419_1804_vignette.jpg	\N	923447b1a63f88a5e14bb78ad48e479f	1135	1	f	f	\N
1640	IMG	2009-05-22	lagon2	\N	0	\N	\N	t	M José Awouma	15	lagon2_1640.jpg	lagon2_1640_vignette.jpg	\N	f30cc492cde1d73c54945b2545e142fa	1118	1	f	f	\N
2021	IMG	2009-10-14	papillon2	\N	0	\N	\N	t	M Michel Tattoo	15	papillon2_2021.jpg	papillon2_2021_vignette.jpg	\N		1160	1	f	f	\N
1586	IMG	2009-05-19	charme	\N	0	\N	\N	t	M prenom compte a/a	15	charme_1586.jpg	charme_1586_vignette.jpg	\N	cd3003ad627f509c663082c01f874d55	1012	1	f	f	\N
1805	IMG	2009-08-31	Bras Fleur Papillon Japonnais 6	\N	0	\N	\N	t	M Michel abc	15	100_1421_1805.jpg	100_1421_1805_vignette.jpg	\N	d3ee9199d7bd4283bec40cb587f129c1	1135	1	f	f	\N
1641	IMG	2009-05-22	logo	\N	0	\N	\N	t	M José Awouma	15	logo_1641.jpg	logo_1641_vignette.jpg	\N	f0c6f58af18845f67d34ca409654e3ae	1118	1	f	f	\N
1969	IMG	2009-10-12	DSCF0072	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF0072_1969.jpg	DSCF0072_1969_vignette.jpg	\N		1159	1	f	f	\N
1642	IMG	2009-05-22	logo2	\N	0	\N	\N	t	M José Awouma	15	logo2_1642.jpg	logo2_1642_vignette.jpg	\N	9bf105e8fcb1893785e93d3e9ccdd6b4	1118	1	f	f	\N
1842	IMG	2009-08-31	Carpe Japonaise Dos	\N	0	\N	\N	t	M Michel abc	15	Scan10001_1842.jpg	Scan10001_1842_vignette.jpg	\N	6aa44503182d8cc37ca1877bfb8b7a3d	1135	1	f	f	\N
1844	IMG	2009-08-31	Dos Japonais Serpent	\N	0	\N	\N	t	M Michel abc	15	Scan10003_1844.jpg	Scan10003_1844_vignette.jpg	\N	7ca74717cf291a8aa4c7c95660916573	1135	1	f	f	\N
1643	IMG	2009-05-22	massage	\N	0	\N	\N	t	M José Awouma	15	massage_1643.jpg	massage_1643_vignette.jpg	\N	b86b63568f6098d8152be2e854df2f83	1118	1	f	f	\N
1845	IMG	2009-08-31	Dos Japonais Serpent	\N	0	\N	\N	t	M Michel abc	15	Scan10004_1845.jpg	Scan10004_1845_vignette.jpg	\N	f20df3b6abc29039eef13db2240ed544	1135	1	f	f	\N
1843	IMG	2009-08-31	Péa Marquisien	\N	0	\N	\N	t	M Michel abc	15	Scan10002_1843.jpg	Scan10002_1843_vignette.jpg	\N	02cef310e36fbe6d845634eb8d212c9c	1135	1	f	f	\N
1644	IMG	2009-05-22	massage2	\N	0	\N	\N	t	M José Awouma	15	massage2_1644.jpg	massage2_1644_vignette.jpg	\N	7fe7fd84837e590236ff2c8521ea2dcb	1118	1	f	f	\N
1780	IMG	2009-08-31	Bras Japonais Carpe 2	\N	0	\N	\N	t	M Michel abc	15	100_0958_1780.jpg	100_0958_1780_vignette.jpg	\N	1a0e457de2c90ea95a22f4a3d0c04f16	1135	1	f	f	\N
1932	IMG	2009-10-07	BBL arc en ciel	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBL_arc_en_ciel_1932.jpg	BBL_arc_en_ciel_1932_vignette.jpg	\N		1157	1	f	f	\N
1645	IMG	2009-05-22	massage3	\N	0	\N	\N	t	M José Awouma	15	massage3_1645.jpg	massage3_1645_vignette.jpg	\N	ed95a03a603ff345dd9fb2aaa5d21287	1118	1	f	f	\N
1951	IMG	2009-10-08	BBN noir et rouge	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_noir_et_rouge_1951.jpg	BBN_noir_et_rouge_1951_vignette.jpg	\N		1157	1	f	f	\N
1646	IMG	2009-05-22	plage	\N	0	\N	\N	t	M José Awouma	15	plage_1646.jpg	plage_1646_vignette.jpg	\N	744e4d2f957731a001374fe444106bd7	1118	1	f	f	\N
1985	IMG	2009-10-13	carpe5	\N	0	\N	\N	t	M Michel Tattoo	15	carpe5_1985.jpg	carpe5_1985_vignette.jpg	\N		1160	1	f	f	\N
1647	IMG	2009-05-22	zen	\N	0	\N	\N	t	M José Awouma	15	zen_1647.jpg	zen_1647_vignette.jpg	\N	804c3356705844f7f07dedea27c9ed57	1118	1	f	f	\N
1952	IMG	2009-10-08	BBN ohm	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	BBN_ohm_1952.jpg	BBN_ohm_1952_vignette.jpg	\N		1157	1	f	f	\N
1970	IMG	2009-10-12	DSCF0277	\N	0	\N	\N	t	M Philippe Pugnat	15	DSCF0277_1970.jpg	DSCF0277_1970_vignette.jpg	\N		1159	1	f	f	\N
1648	IMG	2009-05-22	zen2	\N	0	\N	\N	t	M José Awouma	15	zen2_1648.jpg	zen2_1648_vignette.jpg	\N	c5afb0c8d546496c419b87d0ca7eeab3	1118	1	f	f	\N
1649	IMG	2009-05-22	zen3	\N	0	\N	\N	t	M José Awouma	15	zen3_1649.jpg	zen3_1649_vignette.jpg	\N	c37c319465aa355a1b93ee0d912ac216	1118	1	f	f	\N
2010	IMG	2009-10-14	julien2	\N	0	\N	\N	t	M Michel Tattoo	15	julien2_2010.jpg	julien2_2010_vignette.jpg	\N		1160	1	f	f	\N
2157	TPL	2010-03-04	Promo Coffret	\N	1	\N	\N	f	M Daniel Bantegnies	14	anim_2157.mpg	anim_2157_vignette.jpg	anim_2157_apercu.flv	f3c237d5928a46cec7fe91dd53908b19	1288	1	\N	\N	<Template label="decompte1egal2" nomSwf="decompte1egal2.swf" nomClasse="decompte1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400" idCateorie="1288" idClient="1016">\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="16" COLOR="#FBF5F5" LETTERSPACING="0" KERNING="0"><B>A SAISIR</B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="11" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Château HAUT BERTINERIE Rouge 2005 </B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="12" COLOR="#F8F3F3" LETTERSPACING="0" KERNING="0"><B>CAISSE BOIS 6 BTLLES</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="accroche" nomAttribut="onde1_cont#accroche_cont#accroche#accroche"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="9" COLOR="#F6F1F1" LETTERSPACING="0" KERNING="0"><B>Les 6 btlles en  caisse bois au même prix que les 6 btlles au carton, soit</B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="12" COLOR="#0A0A0A" LETTERSPACING="0" KERNING="0"><B>Caisse Bois 6 btlles :</B><FONT SIZE="15" COLOR="#EA1B1B"><B> 71,40 euros</B><FONT SIZE="12" COLOR="#0A0A0A"></FONT></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/201/fonds/video4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/video4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/201/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/2157/data/153-219-thickbox.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2157/vignette/153-219-thickbox.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#texte_cont#photo2" hauteur="450" largeur="450" valeurAttribut="http://fichierclient.iconeo.fr/template/2157/data/Logo.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2157/vignette/Logo.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2017	IMG	2009-10-14	manu	\N	0	\N	\N	t	M Michel Tattoo	15	manu_2017.jpg	manu_2017_vignette.jpg	\N		1160	1	f	f	\N
2011	IMG	2009-10-14	marcel1	\N	0	\N	\N	t	M Michel Tattoo	15	marcel1_2011.jpg	marcel1_2011_vignette.jpg	\N		1160	1	f	f	\N
2036	IMG	2009-10-27	michel 10/2009	\N	0	\N	\N	t	M Michel Tattoo	15	P1010062_2036.jpg	P1010062_2036_vignette.jpg	\N		1137	1	f	f	\N
2038	IMG	2009-11-10	michel 11/2009	\N	0	\N	\N	t	M Michel Tattoo	15	P1010098_2038.jpg	P1010098_2038_vignette.jpg	\N		1137	1	f	f	\N
2022	IMG	2009-10-14	Phenix	\N	0	\N	\N	t	M Michel Tattoo	15	Phenix_2022.jpg	Phenix_2022_vignette.jpg	\N		1160	1	f	f	\N
2037	IMG	2009-11-10	michel 11/2009	\N	0	\N	\N	t	M Michel Tattoo	15	P1010069_2037.jpg	P1010069_2037_vignette.jpg	\N		1137	1	f	f	\N
2064	IMG	2009-12-16	02	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	02_2064.jpg	02_2064_vignette.jpg	\N		1204	1	f	f	\N
2023	IMG	2009-10-14	philipe	\N	0	\N	\N	t	M Michel Tattoo	15	philipe_2023.jpg	philipe_2023_vignette.jpg	\N		1160	1	f	f	\N
2107	VID	2010-02-08	diams	\N	1	\N	\N	f	M Marc Truche	3	diams_2107.mpg	diams_2107_vignette.jpg	diams_2107_apercu.flv	e801d973646c742cf44a0228f3271416	1276	1	\N	\N	\N
2014	IMG	2009-10-14	marceldos	\N	0	\N	\N	t	M Michel Tattoo	15	marceldos_2014.jpg	marceldos_2014_vignette.jpg	\N		1160	1	f	f	\N
2065	IMG	2009-12-16	03	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	03_2065.jpg	03_2065_vignette.jpg	\N		1204	1	f	f	\N
2024	IMG	2009-10-14	poisson	\N	0	\N	\N	t	M Michel Tattoo	15	poisson_2024.jpg	poisson_2024_vignette.jpg	\N		1160	1	f	f	\N
2246	VID	2010-11-16	11_1	\N	1	\N	\N	f	M Daniel Bantegnies	12	11_1_2246.mpg	11_1_2246_vignette.jpg	11_1_2246_apercu.flv	ace663df4b96e2f173b42fb46450be6f	1288	1	\N	\N	\N
2025	IMG	2009-10-14	poisson2	\N	0	\N	\N	t	M Michel Tattoo	15	poisson2_2025.jpg	poisson2_2025_vignette.jpg	\N		1160	1	f	f	\N
2085	IMG	2010-01-04	michel 12/2009	\N	0	\N	\N	t	M Michel Tattoo	15	web_site_368_2085.jpg	web_site_368_2085_vignette.jpg	\N		1137	1	f	f	\N
2066	IMG	2009-12-16	04	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	04_2066.jpg	04_2066_vignette.jpg	\N		1204	1	f	f	\N
2026	IMG	2009-10-14	poulpe1	\N	0	\N	\N	t	M Michel Tattoo	15	poulpe1_2026.jpg	poulpe1_2026_vignette.jpg	\N		1160	1	f	f	\N
2016	IMG	2009-10-14	mlask jap 2	\N	0	\N	\N	t	M Michel Tattoo	15	mlask_jap_2_2016.jpg	mlask_jap_2_2016_vignette.jpg	\N		1160	1	f	f	\N
2027	IMG	2009-10-14	poulpe2	\N	0	\N	\N	t	M Michel Tattoo	15	poulpe2_2027.jpg	poulpe2_2027_vignette.jpg	\N		1160	1	f	f	\N
2067	IMG	2009-12-16	05	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	05_2067.jpg	05_2067_vignette.jpg	\N		1204	1	f	f	\N
2029	IMG	2009-10-14	vincent1	\N	0	\N	\N	t	M Michel Tattoo	15	vincent1_2029.jpg	vincent1_2029_vignette.jpg	\N		1160	1	f	f	\N
2030	IMG	2009-10-14	vincent2	\N	0	\N	\N	t	M Michel Tattoo	15	vincent2_2030.jpg	vincent2_2030_vignette.jpg	\N		1160	1	f	f	\N
2068	IMG	2009-12-16	06	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	06_2068.jpg	06_2068_vignette.jpg	\N		1204	1	f	f	\N
2069	IMG	2009-12-16	07	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	07_2069.jpg	07_2069_vignette.jpg	\N		1204	1	f	f	\N
2143	TPL	2010-03-03	tatoo	\N	1	\N	\N	f	M Michel Tattoo	14	anim_2143.mpg	anim_2143_vignette.jpg	anim_2143_apercu.flv	3fa4d08a564ee95392cf0fba757afe82	1154	1	\N	\N	<Template label="ondepresentation" nomSwf="ondepresentation.swf" nomClasse="ondepresentation" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400" idCateorie="1154" idClient="1010">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="22" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Michel Tattoo</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="22" COLOR="#52132C" LETTERSPACING="0" KERNING="1"><B>Votre tatoueur</B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="22" COLOR="#52132C" LETTERSPACING="0" KERNING="1"><B>à </B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="22" COLOR="#52132C" LETTERSPACING="0" KERNING="1"><B>Bordeaux</B><FONT SIZE="18" COLOR="#5BA5C2"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2143/data/FLEUR9.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2143/vignette/FLEUR9.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/300/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2143/data/4402836917_fdf2d3bfb0_o.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2143/vignette/4402836917_bb8aa640a6_s.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2189	TPL	2010-03-19	jjj	\N	1	\N	\N	f	M Marc Truche	14	anim_2189.mpg	anim_2189_vignette.jpg	anim_2189_apercu.flv	57d1dd6bebcf88a1736999a972833242	1102	1	\N	\N	<Template label="decompte2t1i" nomSwf="decompte2t1i.swf" nomClasse="decompte2t1i" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="36" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>hyguygu</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#0000FF" LETTERSPACING="0" KERNING="1"><B>jhihjihih</B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">kihjuojiolji</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/305/fonds/FLEUR4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/FLEUR4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/305/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/utilisateur/1005/images/Lpliht2.JPG" valeurVignette="http://fichierclient.iconeo.fr/utilisateur/1005/images/apercus/Lpliht2.JPG" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2061	VID	2009-12-14	immovac	\N	1	\N	\N	f	M prenom compte a/a	79	immovac_2061.mpg	immovac_2061_vignette.jpg	immovac_2061_apercu.flv	c69ee68decb91608bf5a2e00988c3fce	1163	1	\N	\N	\N
2070	IMG	2009-12-16	08	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	08_2070.jpg	08_2070_vignette.jpg	\N		1204	1	f	f	\N
2086	IMG	2010-01-13	ChateauPascot-2	\N	0	\N	\N	t	M prenom compte a/a	15	ChateauPascot_2_2086.jpg	ChateauPascot_2_2086_vignette.jpg	\N		1164	1	f	f	\N
2165	IMG	2010-03-09	Scrat_and_Scratte_by_Sandtorm_Firestar	\N	0	\N	\N	t	M José Awouma	15	Scrat_and_Scratte_by_Sandtorm_Firestar_2165.jpg	Scrat_and_Scratte_by_Sandtorm_Firestar_2165_vignette.jpg	\N		1117	1	f	f	\N
2072	IMG	2009-12-16	09	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	09_2072.jpg	09_2072_vignette.jpg	\N		1204	1	f	f	\N
2108	VID	2010-02-08	St Valentin	\N	1	\N	\N	f	M Marc Truche	8	St_Valentin_2108.mpg	St_Valentin_2108_vignette.jpg	St_Valentin_2108_apercu.flv	0f96a36ab0b6b8a847f38fc46d3ab38b	1276	1	\N	\N	\N
2073	IMG	2009-12-16	10	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	10_2073.jpg	10_2073_vignette.jpg	\N		1204	1	f	f	\N
2109	IMG	2010-02-11	amazonia logo	\N	0	\N	\N	t	M Marc Truche	15	amazonia_logo_2109.jpg	amazonia_logo_2109_vignette.jpg	\N		1102	1	f	f	\N
2080	IMG	2009-12-16	15	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	15_2080.jpg	15_2080_vignette.jpg	\N		1204	1	f	f	\N
2081	IMG	2009-12-16	16	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	16_2081.jpg	16_2081_vignette.jpg	\N		1204	1	f	f	\N
114	IMG	2010-02-17	Vendanges : A vos marques	\N	0	\N	\N	t	MME Nicole Doermann	15	Sans_titre_1_2114.jpg	Sans_titre_1_2114_vignette.jpg	\N		1175	1	f	f	\N
2082	IMG	2009-12-16	17	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	17_2082.jpg	17_2082_vignette.jpg	\N		1204	1	f	f	\N
118	IMG	2010-02-17	Fin de la mise en bouteille	\N	0	\N	\N	t	MME Nicole Doermann	15	Sans_titre_2_2115.jpg	Sans_titre_2_2115_vignette.jpg	\N		1175	1	f	f	\N
109	IMG	2010-01-22	Des rencontres amicales et familiales	\N	0	\N	\N	t	MME Nicole Doermann	15	073___Portes_Ouvertes_22_mai_2097.jpg	073___Portes_Ouvertes_22_mai_2097_vignette.jpg	\N		1175	1	f	f	\N
2083	IMG	2009-12-16	18	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	18_2083.jpg	18_2083_vignette.jpg	\N		1204	1	f	f	\N
110	IMG	2010-01-22	L'occasion d'une dégustation	\N	0	\N	\N	t	MME Nicole Doermann	15	076___Portes_Ouvertes_22_mai_2098.jpg	076___Portes_Ouvertes_22_mai_2098_vignette.jpg	\N		1175	1	f	f	\N
2084	IMG	2009-12-16	19	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	19_2084.jpg	19_2084_vignette.jpg	\N		1204	1	f	f	\N
111	IMG	2010-01-22	La joie des enfants	\N	0	\N	\N	t	MME Nicole Doermann	15	080___Portes_Ouvertes_22_mai_2099.jpg	080___Portes_Ouvertes_22_mai_2099_vignette.jpg	\N		1175	1	f	f	\N
112	IMG	2010-01-22	Balade en calèche	\N	0	\N	\N	t	MME Nicole Doermann	15	091___Portes_Ouvertes_22_mai_2100.jpg	091___Portes_Ouvertes_22_mai_2100_vignette.jpg	\N		1175	1	f	f	\N
2055	IMG	2009-12-10	4	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	4_2055.jpg	4_2055_vignette.jpg	\N		1162	1	f	f	\N
2056	IMG	2009-12-10	3	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	3_2056.jpg	3_2056_vignette.jpg	\N		1162	1	f	f	\N
2057	IMG	2009-12-10	2	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	2_2057.jpg	2_2057_vignette.jpg	\N		1162	1	f	f	\N
2058	IMG	2009-12-10	6	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	6_2058.jpg	6_2058_vignette.jpg	\N		1162	1	f	f	\N
2059	IMG	2009-12-10	1	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	1_2059.jpg	1_2059_vignette.jpg	\N		1162	1	f	f	\N
2060	IMG	2009-12-10	5	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	5_2060.jpg	5_2060_vignette.jpg	\N		1162	1	f	f	\N
2042	VID	2009-11-25	mp_boutique	\N	1	\N	\N	f	MME Marie Laure Chapeland	31	mp_boutique_2042.mpg	mp_boutique_2042_vignette.jpg	mp_boutique_2042_apercu.flv	66e1d6748723f1a994b226de78d72740	1161	1	\N	\N	\N
2206	TPL	2010-04-03	03/04	\N	1	\N	\N	f	M prenom compte a/a	10	anim_2206.mpg	anim_2206_vignette.jpg	anim_2206_apercu.flv	1cb0c6614ad0ba1b1cd88a1504f4fa0a	1278	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312" idCateorie="1278" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>03/04</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2206/data/neutre6.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2206/vignette/neutre6.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
2238	TPL	2010-11-08	aaa	\N	1	\N	\N	\N	M prenom compte a/a	14	anim_2238.mpg	anim_2238_vignette.jpg	anim_2238_apercu.flv	d9b5204cd2ef8b42a21d8e947f1f5007	1045	1	\N	\N	<Template label="decompte2t1i" nomSwf="decompte2t1i.swf" nomClasse="decompte2t1i" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="36" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMOTION</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">10 euros la coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/305/fonds/visage04.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/visage04.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/305/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/utilisateur/1001/images/maquillage.jpg" valeurVignette="http://fichierclient.iconeo.fr/utilisateur/1001/images/apercus/maquillage.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2237	TPL	2010-10-19	hgj	\N	1	\N	\N	\N	M prenom compte a/a	14	anim_2237.mpg	anim_2237_vignette.jpg	anim_2237_apercu.flv	a446bd08f740970e745ff1432db97d32	1035	1	\N	\N	<Template label="decompte2t1i" nomSwf="decompte2t1i.swf" nomClasse="decompte2t1i" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="36" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMOTION</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">10 euros la coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/305/fonds/plage04.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/plage04.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/305/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://farm5.static.flickr.com/4087/5096321541_824b1a123c_o.jpg" valeurVignette="http://farm5.static.flickr.com/4087/5096321541_bbc07519c2_s.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2062	VID	2009-12-15	immovac	\N	1	\N	\N	f	M prenom compte a/a	91	immovac_2062.mpg	immovac_2062_vignette.jpg	immovac_2062_apercu.flv	b9e2a55cd1b9fd6b3c27228bca0cbc2b	1163	1	\N	\N	\N
2075	IMG	2009-12-16	11	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	11_2075.jpg	11_2075_vignette.jpg	\N		1204	1	f	f	\N
2110	IMG	2010-02-12	diams	\N	0	\N	\N	t	M Marc Truche	15	diams_2110.jpg	diams_2110_vignette.jpg	\N		1277	1	f	f	\N
2076	IMG	2009-12-16	12	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	12_2076.jpg	12_2076_vignette.jpg	\N		1204	1	f	f	\N
2077	IMG	2009-12-16	13	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	13_2077.jpg	13_2077_vignette.jpg	\N		1204	1	f	f	\N
2078	IMG	2009-12-16	14	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	14_2078.jpg	14_2078_vignette.jpg	\N		1204	1	f	f	\N
115	IMG	2010-02-17	La récolte est prometteuse	\N	0	\N	\N	t	MME Nicole Doermann	15	Sans_titre_7_2120.jpg	Sans_titre_7_2120_vignette.jpg	\N		1175	1	f	f	\N
116	IMG	2010-02-17	Allons annoncer le ban des vendanges	\N	0	\N	\N	t	MME Nicole Doermann	15	Sans_titre_8_2121.jpg	Sans_titre_8_2121_vignette.jpg	\N		1175	1	f	f	\N
119	IMG	2010-02-17	Après l'effort, le réconfort	\N	0	\N	\N	t	MME Nicole Doermann	15	Sans_titre_4_2117.jpg	Sans_titre_4_2117_vignette.jpg	\N		1175	1	f	f	\N
117	IMG	2010-02-17	Les enfants des écoles pendant les vendange	\N	0	\N	\N	t	MME Nicole Doermann	15	Sans_titre_3_2116.jpg	Sans_titre_3_2116_vignette.jpg	\N		1175	1	f	f	\N
113	IMG	2010-02-17	Tournez manège	\N	0	\N	\N	t	MME Nicole Doermann	15	Sans_titre_5_2118.jpg	Sans_titre_5_2118_vignette.jpg	\N		1175	1	f	f	\N
2258	IMG	2011-04-22	21	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	21_2258.jpg	21_2258_vignette.jpg	\N		1204	1	f	f	\N
2172	TPL	2010-03-16	sss	\N	1	\N	\N	\N	M Marc Truche	17	anim_2172.mpg	anim_2172_vignette.jpg	anim_2172_apercu.flv	c86e83f0966ba0ef7daf227a78b7beb9	1105	1	\N	\N	<Template label="ondegamme" nomSwf="ondegamme.swf" nomClasse="ondegamme" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="460">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Notre Gamme pro</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">1 - Matériel de coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/302/fonds/NEUTRE7.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/NEUTRE7.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/302/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo1" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo1" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/utilisateur/1005/images/Lpliht2.JPG" valeurVignette="http://fichierclient.iconeo.fr/utilisateur/1005/images/apercus/Lpliht2.JPG" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/utilisateur/1005/images/berti.jpg" valeurVignette="http://fichierclient.iconeo.fr/utilisateur/1005/images/apercus/berti.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo3" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo3" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/utilisateur/1005/images/image_tc1.jpg" valeurVignette="http://fichierclient.iconeo.fr/utilisateur/1005/images/apercus/image_tc1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2228	TPL	2010-07-30	animm	\N	1	\N	\N	\N	M prenom compte a/a	14	anim_2228.mpg	anim_2228_vignette.jpg	anim_2228_apercu.flv	a3773c9de48756e6d7364a0f0424a1b6	1278	1	\N	\N	<Template label="decompte2t1i" nomSwf="decompte2t1i.swf" nomClasse="decompte2t1i" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="36" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMOTION</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">10 euros la coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/305/fonds/plage05.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/plage05.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/305/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://farm5.static.flickr.com/4110/4842352622_90c2acbc76_o.jpg" valeurVignette="http://farm5.static.flickr.com/4110/4842352622_9be3ac542a_s.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2215	TPL	2010-04-23	titi	\N	1	\N	\N	f	M prenom compte a/a	10	anim_2215.mpg	anim_2215_vignette.jpg	anim_2215_apercu.flv	1d575f34614ba55bb0da4afa131d8265	1044	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312" idCateorie="1044" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>titi</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2215/data/video5.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2215/vignette/video5.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
2248	IMG	2011-01-18	michel 01/2011	\N	0	\N	\N	t	M Michel Tattoo	15	P1030626_2248.jpg	P1030626_2248_vignette.jpg	\N		1137	1	f	f	\N
2190	VID	2010-03-20	artafricain	\N	1	\N	\N	f	M prenom compte a/a	28	artafricain_2190.mpg	artafricain_2190_vignette.jpg	artafricain_2190_apercu.flv	b44f0e292ce8b415d6ac8073f2f80138	1044	1	\N	\N	\N
2147	TPL	2010-03-03	gamme onde	\N	1	\N	\N	f	M prenom compte a/a	13	anim_2147.mpg	anim_2147_vignette.jpg	anim_2147_apercu.flv	b67ee7c4147a1f1aa6be934cd16089a3	1278	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondegamme" nomSwf="ondegamme.swf" nomClasse="ondegamme" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="360" idCateorie="1278" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Gamme onde</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">Un produit, un autre produit, en veux-tu en voila</FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2147/data/FLORE5.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2147/vignette/FLORE5.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/302/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo1" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo1" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2147/data/coiffuresherbrooke27a.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2147/vignette/coiffuresherbrooke27a.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n  <ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2147/data/coiffure1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2147/vignette/coiffure1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n  <ZoneImage label="Photo3" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo3" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2147/data/maquillage.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2147/vignette/maquillage.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
2173	TPL	2010-03-16	ddd	\N	1	\N	\N	\N	M Marc Truche	19	anim_2173.mpg	anim_2173_vignette.jpg	anim_2173_apercu.flv	3523ec8acfc02e9bc77ee6a25222e37e	1127	1	\N	\N	<Template label="onde1" nomSwf="onde1egal2.swf" nomClasse="onde1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="520">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#FFFFFF" LETTERSPACING="0" KERNING="0"><B>Un Produit acheté</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#FFFFFF" LETTERSPACING="0" KERNING="0"><B>Le 2ème offert !!</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/200/fonds/video5.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/200/fonds/vignettes/video5.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/200/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/200/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/200/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/utilisateur/1005/images/Lpliht2.JPG" valeurVignette="http://fichierclient.iconeo.fr/utilisateur/1005/images/apercus/Lpliht2.JPG" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle2_cont#bulle2#photo2_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/200/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/200/vignette/coiff1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2168	TPL	2010-03-10	art1	\N	1	\N	\N	f	M prenom compte a/a	9	anim_2168.mpg	anim_2168_vignette.jpg	anim_2168_apercu.flv	4193d8220ecd3e984f5fead37ef1e88e	1164	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="decompte1egal2" nomSwf="decompte1egal2.swf" nomClasse="decompte1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="280" idCateorie="1164" idClient="1001">\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#FDFDFD" LETTERSPACING="0" KERNING="0"><B>La chemise : </B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#FDFDFD" LETTERSPACING="0" KERNING="0"><B>36 Euros</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="accroche" nomAttribut="onde1_cont#accroche_cont#accroche#accroche"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="16" COLOR="#FFFEFE" LETTERSPACING="0" KERNING="0"><B>Le sac : </B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="16" COLOR="#FFFEFE" LETTERSPACING="0" KERNING="0"><B>48 Euros</B><FONT SIZE="15" COLOR="#000000"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2168/data/video1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2168/vignette/video1.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/201/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/2168/data/art1.png" valeurVignette="http://fichierclient.iconeo.fr/template/2168/vignette/art1.png" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#texte_cont#photo2" hauteur="450" largeur="450" valeurAttribut="http://fichierclient.iconeo.fr/template/2168/data/logo1.png" valeurVignette="http://fichierclient.iconeo.fr/template/2168/vignette/logo1.png" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
2198	IMG	2010-03-24	cp_etiquette	\N	0	\N	\N	t	M Marc Truche	15	cp_etiquette_2198.jpg	cp_etiquette_2198_vignette.jpg	\N		1296	1	f	f	\N
2259	IMG	2011-04-22	22	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	22_2259.jpg	22_2259_vignette.jpg	\N		1204	1	f	f	\N
2216	TPL	2010-04-23	toto	\N	1	\N	\N	f	M prenom compte a/a	11	anim_2216.mpg	anim_2216_vignette.jpg	anim_2216_apercu.flv	f81409326dd105258d1fde0743a70525	1044	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312" idCateorie="1044" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>toto</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2216/data/video4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2216/vignette/video4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
2169	TPL	2010-03-10	soldes	\N	1	\N	\N	f	M prenom compte a/a	9	anim_2169.mpg	anim_2169_vignette.jpg	anim_2169_apercu.flv	a1a8f9a7a49692acbe06a0c53a9260dd	1164	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="decompte1egal2" nomSwf="decompte1egal2.swf" nomClasse="decompte1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="280" idCateorie="1164" idClient="1001">\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#FDFAFA" LETTERSPACING="0" KERNING="0"><B><U>Chemise</U></B><B> </B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#FDFAFA" LETTERSPACING="0" KERNING="0"><B>43 euros</B><FONT COLOR="#000000"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="accroche" nomAttribut="onde1_cont#accroche_cont#accroche#accroche"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="16" COLOR="#FCF9F9" LETTERSPACING="0" KERNING="0"><B><U>Sac</U></B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="16" COLOR="#FCF9F9" LETTERSPACING="0" KERNING="0"><B>58 euros</B><FONT SIZE="15" COLOR="#000000"></FONT></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="15" COLOR="#000000" LETTERSPACING="0" KERNING="0"></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2169/data/video1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2169/vignette/video1.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/201/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/2169/data/soldes.png" valeurVignette="http://fichierclient.iconeo.fr/template/2169/vignette/soldes.png" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#texte_cont#photo2" hauteur="450" largeur="450" valeurAttribut="http://fichierclient.iconeo.fr/template/2169/data/art1.png" valeurVignette="http://fichierclient.iconeo.fr/template/2169/vignette/art1.png" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
2149	TPL	2010-03-03	portes ouvertes	\N	1	\N	\N	f	M Daniel Bantegnies	14	anim_2149.mpg	anim_2149_vignette.jpg	anim_2149_apercu.flv	be94b4ee19fdfe7c6675a4f49cff2791	1290	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondepresentation" nomSwf="ondepresentation.swf" nomClasse="ondepresentation" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400" idCateorie="1288" idClient="1016">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PORTES OUVERTES</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">A partir du 7 mai, venez découvrir le domaine du Château Bertinerie.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">Visite gratuite, ballade dans le parc.</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">Pas d&apos;obligation d&apos;achat!</FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2149/data/Ref_anim_soleil.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2149/vignette/Ref_anim_soleil.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/300/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2149/data/vigne-galets-chateauneuf.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2149/vignette/vigne-galets-chateauneuf.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
2193	TPL	2010-03-22	okok	\N	1	\N	\N	\N	M Marc Truche	11	anim_2193.mpg	anim_2193_vignette.jpg	anim_2193_apercu.flv	06792f73d3b24348a640fd8d447363b5	1102	1	\N	\N	<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>JINsebGLE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/100/fonds/visage02.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/visage02.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0"/>\n</Template>
2252	IMG	2011-03-08	20	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	20_2252.jpg	20_2252_vignette.jpg	\N		1204	1	f	f	\N
2150	VID	2010-03-04	Promotions du Mois	\N	1	\N	\N	f	M Daniel Bantegnies	10	jinglePromo_2150.mpg	jinglePromo_2150_vignette.jpg	jinglePromo_2150_apercu.flv	ca3834fd7d2bd9d05a2819db61e0a9c3	1291	1	\N	\N	\N
2194	TPL	2010-03-22	rebelote	\N	1	\N	\N	f	M Marc Truche	11	anim_2194.mpg	anim_2194_vignette.jpg	anim_2194_apercu.flv	fd1aa5dc781ce340365a05292ff70ed6	1102	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312" idCateorie="1102" idClient="1005">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>JuhuhuINGLE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2194/data/video1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2194/vignette/video1.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
2276	IMG	2011-05-09	michel 04/2011	\N	0	\N	\N	t	M Michel Tattoo	15	P1030686_2276.jpg	P1030686_2276_vignette.jpg	\N		1137	1	f	f	\N
2260	IMG	2011-04-22	23	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	23_2260.jpg	23_2260_vignette.jpg	\N		1204	1	f	f	\N
2261	IMG	2011-04-22	24	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	24_2261.jpg	24_2261_vignette.jpg	\N		1204	1	f	f	\N
2262	IMG	2011-04-22	25	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	25_2262.jpg	25_2262_vignette.jpg	\N		1204	1	f	f	\N
2263	IMG	2011-04-22	26	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	26_2263.jpg	26_2263_vignette.jpg	\N		1204	1	f	f	\N
2170	TPL	2010-03-10	combis	\N	1	\N	\N	f	M prenom compte a/a	14	anim_2170.mpg	anim_2170_vignette.jpg	anim_2170_apercu.flv	15250f8a956bffb71862f180c66897af	1044	1	\N	\N	<Template label="ondegamme" nomSwf="ondegamme.swf" nomClasse="ondegamme" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="360" idCateorie="1044" idClient="1001">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMO COMBI</B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PLONGEE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="24" COLOR="#96092C" LETTERSPACING="0" KERNING="1"><B>299 </B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#612030" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#612030" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#612030" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="19" COLOR="#020001" LETTERSPACING="0" KERNING="1"><B>Homme 7mm - BEUCHAT</B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#612030" LETTERSPACING="0" KERNING="1"><B></B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#612030" LETTERSPACING="0" KERNING="1"><B>FOCEA COMFORT 2 Femme 7mm - BEUCHAT</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2170/data/FONDNOVAX.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2170/vignette/FONDNOVAX.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/302/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo1" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo1" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2170/data/combi012.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2170/vignette/combi012.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2170/data/combi013.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2170/vignette/combi013.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo3" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo3" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2170/data/combi014.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2170/vignette/combi014.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2217	VID	2010-05-18	Film Long	\N	1	\N	\N	\N	BG	200	film_long.mpg	film_long_vignette.jpg	film_long.flv	ddd	1289	1	\N	\N	\N
2195	TPL	2010-03-24	top moumoute	\N	1	\N	\N	f	M Marc Truche	11	anim_2195.mpg	anim_2195_vignette.jpg	anim_2195_apercu.flv	ddb399a0552ef43d2f59feabb1b8b319	1159	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312" idCateorie="1159" idClient="1005">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>TOP MOUMOUTE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2195/data/visage03.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2195/vignette/visage03.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
2218	VID	2010-05-18	Film court	\N	1	\N	\N	f	M Daniel Bantegnies	53	visite_rapide_2218.mpg	film_court_vignette.jpg	visite_rapide.flv	9722908c306fc61f75f230ac412743b4	1289	1	\N	\N	\N
2153	TPL	2010-03-04	Test	\N	1	\N	\N	f	M Daniel Bantegnies	14	anim_2153.mpg	anim_2153_vignette.jpg	anim_2153_apercu.flv	5e2031369e9c2102fd103cd07dd416b6	1288	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondepresentation" nomSwf="ondepresentation.swf" nomClasse="ondepresentation" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400" idCateorie="1288" idClient="1016">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMOTION</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">10 euros la coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2153/data/video1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2153/vignette/video1.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/300/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2153/data/95-121-thickbox.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2153/vignette/95-121-thickbox.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
2196	IMG	2010-03-24	cp_etiquette	\N	0	\N	\N	f	M Marc Truche	0	cp_etiquette_2196.jpg	\N	\N	\N	1102	1	f	f	\N
2197	IMG	2010-03-24	cp_etiquette	\N	0	\N	\N	f	M Marc Truche	0	cp_etiquette_2197.jpg	\N	\N	\N	1102	1	f	f	\N
2264	IMG	2011-04-22	27	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	27_2264.jpg	27_2264_vignette.jpg	\N		1204	1	f	f	\N
2265	IMG	2011-04-22	28	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	28_2265.jpg	28_2265_vignette.jpg	\N		1204	1	f	f	\N
2266	IMG	2011-04-22	29	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	29_2266.jpg	29_2266_vignette.jpg	\N		1204	1	f	f	\N
2267	IMG	2011-04-22	30	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	30_2267.jpg	30_2267_vignette.jpg	\N		1204	1	f	f	\N
2219	VID	2010-05-19	Scenario Sandrine	\N	1	\N	\N	\N	DB	200	scenario2.mpg	scenario2.jpg	scenario2.flv	399393	1289	1	\N	\N	\N
2199	TPL	2010-03-24	yoyo	\N	1	\N	\N	f	M Marc Truche	11	anim_2199.mpg	anim_2199_vignette.jpg	anim_2199_apercu.flv	3cf3e84d0fc9dce86fc00136f9cc6c18	1296	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312" idCateorie="1296" idClient="1005">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>SUPER BIGUPS</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2199/data/video5.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2199/vignette/video5.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
2140	TPL	2010-03-03	1=2 decompte	\N	1	\N	\N	f	M prenom compte a/a	9	anim_2140.mpg	anim_2140_vignette.jpg	anim_2140_apercu.flv	fb425737fd2ef0f0d600db3765eee22e	1278	1	\N	\N	<Template label="decompte1egal2" nomSwf="decompte1egal2.swf" nomClasse="decompte1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="280" idCateorie="1278" idClient="1001">\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>test 1=2 décompte</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="accroche" nomAttribut="onde1_cont#accroche_cont#accroche#accroche"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="15" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>super test</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2140/data/plage04.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2140/vignette/plage04.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/201/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/utilisateur/1001/images/09012008049.jpg" valeurVignette="http://fichierclient.iconeo.fr/utilisateur/1001/images/apercus/09012008049.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#texte_cont#photo2" hauteur="450" largeur="450" valeurAttribut="http://fichierclient.iconeo.fr/template/2140/data/Tentation-rose-rouge.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2140/vignette/Tentation-rose-rouge.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages=""/>\n</Template>
2268	IMG	2011-04-22	31	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	31_2268.jpg	31_2268_vignette.jpg	\N		1204	1	f	f	\N
2277	IMG	2011-05-09	michel 04/2011	\N	0	\N	\N	t	M Michel Tattoo	15	P1030688_2277.jpg	P1030688_2277_vignette.jpg	\N		1137	1	f	f	\N
2269	IMG	2011-04-22	32	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	32_2269.jpg	32_2269_vignette.jpg	\N		1204	1	f	f	\N
2270	IMG	2011-04-22	33	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	33_2270.jpg	33_2270_vignette.jpg	\N		1204	1	f	f	\N
2271	IMG	2011-04-22	34	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	34_2271.jpg	34_2271_vignette.jpg	\N		1204	1	f	f	\N
2272	IMG	2011-04-22	35	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	35_2272.jpg	35_2272_vignette.jpg	\N		1204	1	f	f	\N
2273	IMG	2011-04-22	36	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	36_2273.jpg	36_2273_vignette.jpg	\N		1204	1	f	f	\N
2274	IMG	2011-04-22	37	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	37_2274.jpg	37_2274_vignette.jpg	\N		1204	1	f	f	\N
2275	IMG	2011-04-22	38	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	38_2275.jpg	38_2275_vignette.jpg	\N		1204	1	f	f	\N
2158	VID	2010-03-04	Evènement	\N	1	\N	\N	f	M Daniel Bantegnies	9	jingleEvenmt_2158.mpg	jingleEvenmt_2158_vignette.jpg	jingleEvenmt_2158_apercu.flv	6a37d3b590a9c242a229378c33489255	1291	1	\N	\N	\N
2145	TPL	2010-03-03	décompte sans images	\N	1	\N	\N	f	M prenom compte a/a	13	anim_2145.mpg	anim_2145_vignette.jpg	anim_2145_apercu.flv	62c2e701046b7d8a9bc6e23295c6dfcc	1278	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="decomptepresentation" nomSwf="decomptepresentation.swf" nomClasse="decomptepresentation" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400" idCateorie="1278" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="36" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>DECOMPTE SANS IMAGE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">isn&apos;t it beautiful?</FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2145/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2145/vignette/neutre4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/301/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/301/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/301/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
2278	VID	2011-05-22	video2.m4v.288	\N	1	\N	\N	f	M bla bla	69	video2.m4v.288_2278.mpg	video2.m4v.288_2278_vignette.jpg	video2.m4v.288_2278_apercu.flv	2e016bce2b48ce3908cc681346f67763	1305	1	\N	\N	\N
2139	TPL	2010-03-03	1=2 onde	\N	1	\N	\N	f	M prenom compte a/a	14	anim_2139.mpg	anim_2139_vignette.jpg	anim_2139_apercu.flv	7d40e6352e0069d1d4c39b117b328b37	1278	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="onde1" nomSwf="onde1egal2.swf" nomClasse="onde1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400" idCateorie="1278" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#0000FF" LETTERSPACING="0" KERNING="0"><B>test 1=2 onde</B><FONT COLOR="#FFFFFF"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#761C4B" LETTERSPACING="0" KERNING="0"><B>bien sympa comme test</B><FONT COLOR="#FFFFFF"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2139/data/video1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2139/vignette/video1.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/200/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/200/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/200/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2139/data/fleur-des-champs-jaune.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2139/vignette/fleur-des-champs-jaune.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n  <ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle2_cont#bulle2#photo2_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2139/data/1019860374.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2139/vignette/1019860374.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
2235	VID	2010-10-01	colis echantillons	\N	1	\N	\N	f	M Daniel Bantegnies	7	colis_echantillons_2235.mpg	colis_echantillons_2235_vignette.jpg	colis_echantillons_2235_apercu.flv	8581a06a4643dfca18515f587dff73f8	1288	1	\N	\N	\N
2293	VID	2011-05-24	velo	\N	1	\N	\N	f	M bla bla	18	velo_2293.mpg	velo_2293_vignette.jpg	velo_2293_apercu.flv	c00fdc7c7662d85559a8314e372b1965	1309	1	\N	\N	\N
2200	TPL	2010-03-24	delire	\N	1	\N	\N	f	M Marc Truche	11	anim_2200.mpg	anim_2200_vignette.jpg	anim_2200_apercu.flv	5c13823d77bf3c81af1e81e59e0fdcf4	1296	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312" idCateorie="1296" idClient="1005">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Délire!!</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2200/data/plage04.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2200/vignette/plage04.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
2221	IMG	2010-06-10	michel 05/2010	\N	0	\N	\N	t	M Michel Tattoo	15	noeuds_jambes_2221.jpg	noeuds_jambes_2221_vignette.jpg	\N		1137	1	f	f	\N
2222	IMG	2010-06-10	michel 05/2010	\N	0	\N	\N	t	M Michel Tattoo	15	noeuds_jambes_2_2222.jpg	noeuds_jambes_2_2222_vignette.jpg	\N		1137	1	f	f	\N
2201	VID	2010-03-24	4321_Starter_Minceur_20s	\N	1	\N	\N	f	M prenom compte a/a	18	4321_Starter_Minceur_20s_2201.mpg	4321_Starter_Minceur_20s_2201_vignette.jpg	4321_Starter_Minceur_20s_2201_apercu.flv	c6308a4a996337a7e7d4d53435011fa7	1035	1	\N	\N	\N
2159	VID	2010-03-04	Promo	\N	1	\N	\N	f	M Daniel Bantegnies	9	jinglePromo2_2159.mpg	jinglePromo2_2159_vignette.jpg	jinglePromo2_2159_apercu.flv	e8e6959e8824772fe37bfaf667012e5f	1291	1	\N	\N	\N
2279	VID	2011-05-22	accueil	\N	1	\N	\N	f	M bla bla	67	accueil_2279.mpg	accueil_2279_vignette.jpg	accueil_2279_apercu.flv	082c6c4b10327d759553b3bea2e6fbaf	1305	1	\N	\N	\N
2184	TPL	2010-03-16	daz	\N	1	\N	\N	f	M prenom compte a/a	10	anim_2184.mpg	anim_2184_vignette.jpg	anim_2184_apercu.flv	02ff633d50e7f48a673a420cdc7ab2f9	1044	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312" idCateorie="1044" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>JINGLE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2184/data/neutre6.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2184/vignette/neutre6.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0" />\r\n</Template>\r\n\r\n
2224	VID	2010-07-07	messagerie pro	\N	1	\N	\N	f	M prenom compte a/a	67	messagerie_pro_2224.mpg	messagerie_pro_2224_vignette.jpg	messagerie_pro_2224_apercu.flv	441f3df692b5f7b2f8f14ba754e4a56d	1044	1	\N	\N	\N
100	TPL	2009-04-07	Jingle Onde	\N	1	\N	\N	t	M Javier Gonzalez	15	\N	\N	\N	\N	1	1	t	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="312">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>JINGLE</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/100/data/neutre6.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/100/vignette/neutre6.jpg" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0"/>\n </Template>
200	TPL	2009-04-07	1=2 Onde	\N	1	\N	\N	t	M Javier Gonzalez	15	\N	\N	\N	\N	1	1	t	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="onde1" nomSwf="onde1egal2.swf" nomClasse="onde1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="520">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n\t<ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#FFFFFF" LETTERSPACING="0" KERNING="0"><B>Un Produit acheté</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n\t<ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#FFFFFF" LETTERSPACING="0" KERNING="0"><B>Le 2ème offert !!</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n\t<ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/200/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/200/vignette/neutre4.jpg" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/200/fonds/vignettes/" urlRepertoireImages="http://fichierclient.iconeo.fr/template/200/fonds/" urlListeImages="http://fichierclient.iconeo.fr/template/200/fonds/vignettes/?C=M;O=D;F=0"/>\n\t<ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/200/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/200/vignette/coiff1.jpg"/>\n\t<ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle2_cont#bulle2#photo2_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/200/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/200/vignette/coiff1.jpg"/>\n</Template>
2160	VID	2010-03-04	infoFlash	\N	1	\N	\N	f	M Daniel Bantegnies	9	infoFlash_2160.mpg	infoFlash_2160_vignette.jpg	infoFlash_2160_apercu.flv	d866ca8b6a459611f95f1bdac7a148d7	1291	1	\N	\N	\N
201	TPL	2009-04-07	1=2 Décompte	\N	1	\N	\N	t	M Javier Gonzalez	15	\N	\N	\N	\N	1	1	t	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="decompte1egal2" nomSwf="decompte1egal2.swf" nomClasse="decompte1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Pour 1 couleur , les mèches dégradées offertes</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="accroche" nomAttribut="onde1_cont#accroche_cont#accroche#accroche"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="15" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Exclusivité du salon !</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/201/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/201/vignette/neutre4.jpg" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/" urlRepertoireImages="http://fichierclient.iconeo.fr/template/201/fonds/" urlListeImages="http://fichierclient.iconeo.fr/template/201/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/201/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/201/vignette/coiff1.jpg" />\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#texte_cont#photo2" hauteur="450" largeur="450" valeurAttribut="http://fichierclient.iconeo.fr/template/201/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/201/vignette/coiff1.jpg" />\n  </Template>
300	TPL	2009-04-07	Présentation Onde	\N	1	\N	\N	t	M Javier Gonzalez	15	\N	\N	\N	\N	1	1	t	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="ondepresentation" nomSwf="ondepresentation.swf" nomClasse="ondepresentation" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="500">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMOTION</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">10 euros la coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/300/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/300/vignette/neutre4.jpg" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/" urlRepertoireImages="http://fichierclient.iconeo.fr/template/300/fonds/" urlListeImages="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/300/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/300/vignette/coiff1.jpg" />\n</Template>
301	TPL	2009-04-07	Présentation Décompte	\N	1	\N	\N	t	M Javier Gonzalez	15	\N	\N	\N	\N	1	1	t	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="decomptepresentation" nomSwf="decomptepresentation.swf" nomClasse="decomptepresentation" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="500">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="36" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMOTION</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">10 euros la coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/301/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/301/vignette/neutre4.jpg" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/301/fonds/vignettes/" urlRepertoireImages="http://fichierclient.iconeo.fr/template/301/fonds/" urlListeImages="http://fichierclient.iconeo.fr/template/301/fonds/vignettes/?C=M;O=D;F=0"/>\n</Template>
302	TPL	2009-04-07	Gamme Onde	\N	1	\N	\N	t	M Javier Gonzalez	15	\N	\N	\N	\N	1	1	t	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="ondegamme" nomSwf="ondegamme.swf" nomClasse="ondegamme" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="460">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Notre Gamme pro</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">1 - Matériel de coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/302/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/302/vignette/neutre4.jpg" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/" urlRepertoireImages="http://fichierclient.iconeo.fr/template/302/fonds/" urlListeImages="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo1" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo1" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/302/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/302/vignette/coiff1.jpg" />\n  <ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/302/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/302/vignette/coiff1.jpg" />\n  <ZoneImage label="Photo3" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo3" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/302/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/302/vignette/coiff1.jpg" />\n  </Template>
303	TPL	2009-04-07	Info boutique	\N	1	\N	\N	t	M Javier Gozalez	15	\N	\N	\N	\N	1	1	t	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="promo2" nomSwf="infoboutique1_V2.swf" nomClasse="infoboutique1" nomContainer="infoboutique1_cont" largeur="1024" hauteur="768" nbFrames="300">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n  <ZoneTexte label="Accroche" nomAttribut="infoboutique1_cont#votrenom_cont#votrenom"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Verdana" SIZE="22" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Votre Nom</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="Titre" nomAttribut="infoboutique1_cont#texte1_cont#titre1"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Titre</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="Description" nomAttribut="infoboutique1_cont#texte1_cont#description1"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">Description ici</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="infoboutique1_cont#courbe_cont#icourbe" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/303/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/303/vignette/neutre4.jpg" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/303/fonds/vignettes/" urlRepertoireImages="http://fichierclient.iconeo.fr/template/303/fonds/" urlListeImages="http://fichierclient.iconeo.fr/template/303/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Image du produit" nomAttribut="infoboutique1_cont#photo1_cont#photo1" hauteur="718" largeur="658" valeurAttribut="http://fichierclient.iconeo.fr/template/303/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/303/vignette/coiff1.jpg" />\n</Template>
305	TPL	2009-04-07	Présentation Décompte avec image	\N	1	\N	\N	t	M Javier Gonzalez	15	\N	\N	\N	\N	1	1	t	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="decompte2t1i" nomSwf="decompte2t1i.swf" nomClasse="decompte2t1i" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400">\n  <Couleur code="0x52132C"/>\n  <Couleur code="0x761C4B"/>\n  <Couleur code="0xED6585"/>\n  <Couleur code="0xF6880E"/>\n  <Couleur code="0x0000FF"/>\n  <Couleur code="0xEED258"/>\n  <Couleur code="0xADB849"/>\n  <Couleur code="0x5BA5C2"/>\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="36" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>PROMOTION</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">10 euros la coupe</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/305/data/neutre4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/305/vignette/neutre4.jpg" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/" urlRepertoireImages="http://fichierclient.iconeo.fr/template/305/fonds/" urlListeImages="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/?C=M;O=D;F=0"/>\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/305/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/305/vignette/coiff1.jpg" />\n</Template>
2294	VID	2011-05-24	piscine	\N	1	\N	\N	f	M bla bla	40	piscine_2294.mpg	piscine_2294_vignette.jpg	piscine_2294_apercu.flv	1de59eadb0fcb2d12feab61915aa54a3	1309	1	\N	\N	\N
2295	VID	2011-05-24	fitness	\N	1	\N	\N	f	M bla bla	26	fitness_2295.mpg	fitness_2295_vignette.jpg	fitness_2295_apercu.flv	c04d27df7b36b98f7b4fda24abe43c8c	1309	1	\N	\N	\N
2296	VID	2011-05-24	cardio	\N	1	\N	\N	f	M bla bla	29	cardio_2296.mpg	cardio_2296_vignette.jpg	cardio_2296_apercu.flv	b9dab23ebca63ad5c3ee807cca5888a9	1309	1	\N	\N	\N
2161	TPL	2010-03-04	test	\N	1	\N	\N	f	M Daniel Bantegnies	9	anim_2161.mpg	anim_2161_vignette.jpg	anim_2161_apercu.flv	a185531f6767a58cda82a4ddc362251b	1290	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="decompte2t1i" nomSwf="decompte2t1i.swf" nomClasse="decompte2t1i" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="280" idCateorie="1290" idClient="1016">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="26" COLOR="#343284" LETTERSPACING="0" KERNING="0"><B>Journée portes ouvertes</B><FONT SIZE="36" COLOR="#000000"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="28" COLOR="#000000" LETTERSPACING="0" KERNING="1"><B>Venez nombreux</B><FONT SIZE="30"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2161/data/FONDNOVAX.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2161/vignette/FONDNOVAX.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/305/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/2161/data/Logo.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2161/vignette/Logo.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
2225	IMG	2010-07-12	michel 07/2010 panda	\N	0	\N	\N	t	M Michel Tattoo	15	p_2225.jpg	p_2225_vignette.jpg	\N		1137	1	f	f	\N
2226	IMG	2010-07-12	michel 07/2010 AILES	\N	0	\N	\N	t	M Michel Tattoo	15	a_2226.jpg	a_2226_vignette.jpg	\N		1137	1	f	f	\N
2138	TPL	2010-03-03	jingle onde	\N	1	\N	\N	f	M prenom compte a/a	6	anim_2138.mpg	anim_2138_vignette.jpg	anim_2138_apercu.flv	f904cc12f8f30945cbbf936f30d74118	1278	1	\N	\N	<Template label="ondejingle" nomSwf="ondejingle.swf" nomClasse="ondejingle" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="192" idCateorie="1278" idClient="1001">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#bulle_cont#bulle#jingle_cont#jingle"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="24" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>salut modif</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2138/data/visage01.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2138/vignette/visage01.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/100/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/100/fonds/vignettes/?C=M;O=D;F=0"/>\n</Template>
2144	TPL	2010-03-03	presentation onde	\N	1	\N	\N	f	M prenom compte a/a	14	anim_2144.mpg	anim_2144_vignette.jpg	anim_2144_apercu.flv	7a5dd3ce78ca768c6bbdcd962b3bc4f4	1278	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondepresentation" nomSwf="ondepresentation.swf" nomClasse="ondepresentation" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="400" idCateorie="1278" idClient="1001">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>test presentation onde</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">de plus en plus fort</FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2144/data/SANTE4.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2144/vignette/SANTE4.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/300/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/300/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2144/data/produit.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2144/vignette/produit.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
2155	TPL	2010-03-04	Promo LAGUNE	\N	1	\N	\N	f	M Daniel Bantegnies	16	anim_2155.mpg	anim_2155_vignette.jpg	anim_2155_apercu.flv	26380ee410838ae09aea4e1d768a3431	1288	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="onde1" nomSwf="onde1egal2.swf" nomClasse="onde1egal2" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="450" idCateorie="1288" idClient="1016">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="22" COLOR="#5BA5C2" LETTERSPACING="0" KERNING="0"><B>Maison </B></FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="22" COLOR="#5BA5C2" LETTERSPACING="0" KERNING="0"><B>la lagune</B><FONT SIZE="18" COLOR="#FFFFFF"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="22" COLOR="#4966AB" LETTERSPACING="0" KERNING="0"><B>Grande braderie</B><FONT SIZE="18" COLOR="#FFFFFF"></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2155/data/DIV1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2155/vignette/DIV1.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/200/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/200/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/200/fonds/vignettes/?C=M;O=D;F=0" />\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2155/data/Logo.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2155/vignette/Logo.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\n  <ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle2_cont#bulle2#photo2_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2155/data/86-184-thickbox.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2155/vignette/86-184-thickbox.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\n</Template>\n\n
2162	VID	2010-03-05	degustation	\N	1	\N	\N	f	M Daniel Bantegnies	95	degustation_2162.mpg	degustation_2162_vignette.jpg	degustation_2162_apercu.flv	20f633d90e9c1ec13c55b898afd48b3d	1292	1	\N	\N	\N
2281	VID	2011-05-22	Muscu	\N	1	\N	\N	f	M bla bla	39	Muscu_2281.mpg	Muscu_2281_vignette.jpg	Muscu_2281_apercu.flv	cbd273c849bccd1dcc3d0e0e83a45d50	1309	1	\N	\N	\N
2186	IMG	2010-03-16	COTES2BX logo 3cotes Blaye	\N	0	\N	\N	t	M Daniel Bantegnies	15	COTES2BX_logo_3cotes_Blaye_2186.jpg	COTES2BX_logo_3cotes_Blaye_2186_vignette.jpg	\N		1290	1	f	f	\N
2236	VID	2010-10-06	Mise en bouteille Bertinerie blanc 2009	\N	1	\N	\N	f	M Daniel Bantegnies	68	Mise_en_bouteille_Bertinerie_blanc_2009_2236.mpg	Mise_en_bouteille_Bertinerie_blanc_2009_2236_vignette.jpg	Mise_en_bouteille_Bertinerie_blanc_2009_2236_apercu.flv	7786a058a87c51ed5c043ebedf5aee3f	1289	1	\N	\N	\N
2297	VID	2011-05-24	Mktg_Les_Mills	\N	1	\N	\N	f	M bla bla	355	Mktg_Les_Mills_2297.mpg	Mktg_Les_Mills_2297_vignette.jpg	Mktg_Les_Mills_2297_apercu.flv	8d1dda7347c297f1ed581b0edb84037a	1305	1	\N	\N	\N
2146	TPL	2010-03-03	decompte avec image	\N	1	\N	\N	f	M prenom compte a/a	15	anim_2146.mp4	anim_2146_vignette.jpg	anim_2146_apercu.flv	a12d9bc8b5fede87ceb196d175b40c48	1278	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\n<Template label="decompte2t1i" nomSwf="decompte2t1i.swf" nomClasse="decompte2t1i" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="280" idCateorie="1278" idClient="1001">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="27" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Décompte </B><FONT KERNING="1"><B>avec image</B></FONT></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">c&apos;est comme un décompte mais avec une image</FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2146/data/DIV1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2146/vignette/DIV1.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/305/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/305/fonds/vignettes/?C=M;O=D;F=0" />\n  <ZoneImage label="Photo" nomAttribut="onde1_cont#photo_cont#photo" hauteur="490" largeur="490" valeurAttribut="http://fichierclient.iconeo.fr/template/2146/data/09012008049.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2146/vignette/09012008049.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\n</Template>\n\n
2163	VID	2010-03-05	degustationPlusClair	\N	1	\N	\N	f	M Daniel Bantegnies	95	degustationPlusClair_2163.mpg	degustationPlusClair_2163_vignette.jpg	degustationPlusClair_2163_apercu.flv	45a01a769947bcbaefc1bcaa4ca3b3fb	1292	1	\N	\N	\N
2187	VID	2010-03-16	fff	\N	1	\N	\N	f	M Daniel Bantegnies	24	fff_2187.mpg	fff_2187_vignette.jpg	fff_2187_apercu.flv	0189712e58bfcf5bb81f1b3c9b0fc84c	1292	1	\N	\N	\N
2188	TPL	2010-03-17	evenement	\N	1	\N	\N	\N	M José Awouma	17	anim_2188.mpg	anim_2188_vignette.jpg	anim_2188_apercu.flv	7feeebd103dd10035fbfa5066dfde49d	1294	1	\N	\N	<Template label="decomptepresentation" nomSwf="decomptepresentation.swf" nomClasse="decomptepresentation" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="500">\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="36" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>kjkghhjfgf</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1">1theme</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="30" COLOR="#000000" LETTERSPACING="0" KERNING="1"></FONT></P></TEXTFORMAT>]]></ZoneTexte>\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/301/fonds/visage02.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/301/fonds/vignettes/visage02.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/301/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/301/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/301/fonds/vignettes/?C=M;O=D;F=0"/>\n</Template>
2283	VID	2011-05-22	ShBam	\N	1	\N	\N	t	M bla bla	55	ShBam.mpg	ShBam_vignette.jpg	ShBam_apercu.flv	c5c44245e53cad4adeda5e223f49f487	1305	1	f	f	\N
2284	VID	2011-05-22	RPM	\N	1	\N	\N	t	M bla bla	60	RPM.mpg	RPM_vignette.jpg	RPM_apercu.flv	1ae89de495ccaf34d5d3843da574934f	1305	1	f	f	\N
2285	VID	2011-05-22	New Accueil	\N	1	\N	\N	t	M bla bla	171	NewAccueil.mpg	NewAccueil_vignette.jpg	NewAccueil_apercu.flv	056ecb9659a4d0edf1762391a19fab43	1305	1	f	f	\N
2286	VID	2011-05-22	Aquadynamic	\N	1	\N	\N	t	M bla bla	60	Aquadynamic.mpg	Aquadynamic_vignette.jpg	Aquadynamic_apercu.flv	8ff94232b9e4eaae01e0329f9aa351af	1305	1	f	f	\N
2287	VID	2011-05-22	B.Balance	\N	1	\N	\N	t	M bla bla	62	B.Balance.mpg	B.Balance_vignette.jpg	B.Balance_apercu.flv	addf52b779ff0d3f735c3899d42eef2b	1305	1	f	f	\N
2289	VID	2011-05-22	B.Jam	\N	1	\N	\N	t	M bla bla	58	B.Jam.mpg	B.Jam_vignette.jpg	B.Jam_apercu.flv	b072d7fc998f59bbb7a53b227c2a3b52	1305	1	\N	\N	\N
2232	VID	2010-09-07	Foire aux vins 366	\N	1	\N	\N	f	M Daniel Bantegnies	17	Foire_aux_vins_366_2232.mpg	Foire_aux_vins_366_2232_vignette.jpg	Foire_aux_vins_366_2232_apercu.flv	1f76fde51393f420614b82db25166dce	1288	1	\N	\N	\N
2233	VID	2010-09-08	sandrine	\N	1	\N	\N	f	M Daniel Bantegnies	78	sandrine_2233.mpg	sandrine_2233_vignette.jpg	sandrine_2233_apercu.flv	c12b8f82e49b5c1cb92d5a4a21a6d742	1299	1	\N	\N	\N
2288	VID	2011-05-22	B.Combat	\N	1	\N	\N	t	M bla bla	62	B.Combat.mpg	B.Combat_vignette.jpg	B.Combat_apercu.flv	497a2a62baff792745a772f8d32f9e27	1305	1	f	f	\N
2291	VID	2011-05-22	B.Pump	\N	1	\N	\N	t	M bla bla	66	B.Pump.mpg	B.Pump_vignette.jpg	B.Pump_apercu.flv	228137929b14f18a6ebb3b4afe9b9c71	1305	1	f	f	\N
2292	VID	2011-05-24	vestiaire	\N	1	\N	\N	f	M bla bla	22	vestiaire_2292.mpg	vestiaire_2292_vignette.jpg	vestiaire_2292_apercu.flv	e197c65aab36e7d51da2f795d1f4a6b3	1309	1	\N	\N	\N
2298	IMG	2011-05-30	michel 05/2011	\N	0	\N	\N	t	M Michel Tattoo	15	P1030728_2298.jpg	P1030728_2298_vignette.jpg	\N		1137	1	f	f	\N
2410	IMG	2012-08-27	michel 08/2012	\N	0	\N	\N	t	M Michel Tattoo	15	P1040234_2410.jpg	P1040234_2410_vignette.jpg	\N		1137	1	f	f	\N
2411	IMG	2012-08-27	michel O8/2012	\N	0	\N	\N	t	M Michel Tattoo	15	P1040223_2411.jpg	P1040223_2411_vignette.jpg	\N		1137	1	f	f	\N
2299	IMG	2011-05-30	michel 05/2O11	\N	0	\N	\N	t	M Michel Tattoo	15	P1030737_2299.jpg	P1030737_2299_vignette.jpg	\N		1137	1	f	f	\N
2300	VID	2011-06-11	Aquadynamic_presentation	\N	1	\N	\N	f	M bla bla	109	Aquadynamic_presentation_2300.mpg	Aquadynamic_presentation_2300_vignette.jpg	Aquadynamic_presentation_2300_apercu.flv	0fe35b8232271fbb1148f07d4f54eaae	1306	1	\N	\N	\N
2301	IMG	2011-08-31	ferme	\N	0	\N	\N	t	MME Marie Laure Chapeland	15	ferme_2301.jpg	ferme_2301_vignette.jpg	\N		1300	1	f	f	\N
2302	VID	2011-09-05	SansTitre	\N	1	\N	\N	f	M Daniel Bantegnies	16	SansTitre_2302.mpg	SansTitre_2302_vignette.jpg	SansTitre_2302_apercu.flv	3139850e95355be6e35a4c5d32a76be6	1288	1	\N	\N	\N
2303	VID	2011-09-12	21_3_livre	\N	1	\N	\N	f	M Daniel Bantegnies	12	21_3_livre_2303.mpg	21_3_livre_2303_vignette.jpg	21_3_livre_2303_apercu.flv	8a0c2fd54ecbf93d088520f0080a6da5	1288	1	\N	\N	\N
2304	IMG	2011-11-21	michel 11/2001 biomeca	\N	0	\N	\N	t	M Michel Tattoo	15	P1030847_2304.jpg	P1030847_2304_vignette.jpg	\N		1137	1	f	f	\N
2305	IMG	2011-11-21	michel 11/2011 biomeca	\N	0	\N	\N	t	M Michel Tattoo	15	P1030848_2305.jpg	P1030848_2305_vignette.jpg	\N		1137	1	f	f	\N
2306	IMG	2011-11-21	michel 11/2011 biomeca	\N	0	\N	\N	t	M Michel Tattoo	15	P1030849_2306.jpg	P1030849_2306_vignette.jpg	\N		1137	1	f	f	\N
2307	IMG	2011-11-21	michel 11/2011 biomeca	\N	0	\N	\N	t	M Michel Tattoo	15	P1030850_2307.jpg	P1030850_2307_vignette.jpg	\N		1137	1	f	f	\N
2308	IMG	2011-11-21	michel 11/2011 biomeca	\N	0	\N	\N	t	M Michel Tattoo	15	P1030856_2308.jpg	P1030856_2308_vignette.jpg	\N		1137	1	f	f	\N
2309	VID	2012-01-20	REPAS GROUPON	\N	1	\N	\N	f	M Daniel Bantegnies	16	REPAS_GROUPON_2309.mpg	REPAS_GROUPON_2309_vignette.jpg	REPAS_GROUPON_2309_apercu.flv	03470edf8027a34cb802bb896db7a44b	1288	1	\N	\N	\N
2310	VID	2012-01-20	repas groupon 1	\N	1	\N	\N	f	M Daniel Bantegnies	17	repas_groupon_1_2310.mpg	repas_groupon_1_2310_vignette.jpg	repas_groupon_1_2310_apercu.flv	f63da7e5d9b0af14e2de31c234ed8987	1288	1	\N	\N	\N
2330	IMG	2012-02-22	michel 02/2012	\N	0	\N	\N	t	M Michel Tattoo	15	P1030947_2330.jpg	P1030947_2330_vignette.jpg	\N		1137	1	f	f	\N
2331	IMG	2012-02-22	michel 02/2012	\N	0	\N	\N	t	M Michel Tattoo	15	P1030960_2331.jpg	P1030960_2331_vignette.jpg	\N		1137	1	f	f	\N
2332	IMG	2012-02-22	michel 02/2012	\N	0	\N	\N	t	M Michel Tattoo	15	P1030975_2332.jpg	P1030975_2332_vignette.jpg	\N		1137	1	f	f	\N
1194	VID	2009-02-16	Toridas	\N	1	\N	\N	f	M prenom nom	36	Toridas_1194.mpg	Toridas_1194_vignette.jpg	Toridas_1194_apercu.flv	ba6f457c4ecc350bcff9041d3939764b	1044	1	\N	t	\N
1602	IMG	2009-05-19	plan-emeraude	\N	0	\N	\N	t	M prenom compte a/a	15	plan_emeraude_1602.jpg	plan_emeraude_1602_vignette.jpg	\N	4fc70cad26d4899b926348d42b8399cd	1013	1	f	t	\N
1598	IMG	2009-05-19	de-robien	\N	0	\N	\N	t	M prenom compte a/a	15	de_robien_1598.jpg	de_robien_1598_vignette.jpg	\N	3aa5741a73c413e7dc672a2c39110c15	1115	1	f	t	\N
1600	IMG	2009-05-19	actions	\N	0	\N	\N	t	M prenom compte a/a	15	actions_1600.jpg	actions_1600_vignette.jpg	\N	b6d033ec95bf845b877dc27970293bd1	1013	1	f	t	\N
1583	VID	2009-05-19	construction	\N	1	\N	\N	f	M prenom compte a/a	9	construction_1583.mpg	construction_1583_vignette.jpg	construction_1583_apercu.flv	b7a74ecfb338e802f0d1adbc6a9488fb	1013	1	\N	t	\N
1589	IMG	2009-05-19	chalet-en-bois	\N	0	\N	\N	t	M prenom compte a/a	15	chalet_en_bois_1589.jpg	chalet_en_bois_1589_vignette.jpg	\N	2ce5431ff3e3acf109ab51a19e6a5dbb	1014	1	f	t	\N
1609	IMG	2009-05-19	agence-braillard	\N	0	\N	\N	t	M prenom compte a/a	15	agence_braillard_1609.jpg	agence_braillard_1609_vignette.jpg	\N	e1f1241b2f3af4ce87c1e464d022c39c	1115	1	f	t	\N
1592	IMG	2009-05-19	corps-de-ferme	\N	0	\N	\N	t	M prenom compte a/a	15	corps_de_ferme_1592.jpg	corps_de_ferme_1592_vignette.jpg	\N	b6da81e7faa43ca442d8eb8385127f96	1014	1	f	t	\N
1606	IMG	2009-05-19	a-decouvrir	\N	0	\N	\N	t	M prenom compte a/a	15	a_decouvrir_1606.jpg	a_decouvrir_1606_vignette.jpg	\N	88e23cf09515172569a083998204fba6	1115	1	f	t	\N
1608	VID	2009-05-19	T3 arcachon	\N	1	\N	\N	f	M prenom compte a/a	8	T3_arcachon_1608.mpg	T3_arcachon_1608_vignette.jpg	T3_arcachon_1608_apercu.flv	b46cfd8d63f81489bdc4da365dc980a0	1012	1	\N	t	\N
1604	VID	2009-05-19	Audenge T5	\N	1	\N	\N	f	M prenom compte a/a	8	Audenge_T5_1604.mpg	Audenge_T5_1604_vignette.jpg	Audenge_T5_1604_apercu.flv	8e630909d1f28e8bce1804728d987e53	1012	1	\N	t	\N
1104	VID	2008-12-04	000005986284_HDFlashVideo	\N	1	\N	\N	f	M prenom nom	10	000005986284_HDFlashVideo_1104.mpg	000005986284_HDFlashVideo_1104_vignette.jpg	000005986284_HDFlashVideo_1104_apercu.flv	b931e5d0eccbaa7f135a244b6870335a	1031	1	\N	t	\N
2418	IMG	2013-05-11	Lighthouse	\N	0	\N	\N	f	M prenom compte a/a	0	Lighthouse_2418.jpg	\N	\N	\N	1044	1	f	f	\N
2419	IMG	2013-05-11	Tulips	\N	0	\N	\N	f	M prenom compte a/a	0	Tulips_2419.jpg	\N	\N	\N	1044	1	f	f	\N
2417	IMG	2013-05-11	Hydrangeas	\N	0	\N	\N	f	M prenom compte a/a	0	Hydrangeas_2417.jpg	\N	\N	\N	1044	1	f	f	\N
2426	VID	2014-04-01	intro	\N	-1	\N	\N	f	M bla bla	0	intro_2426.flv	\N	\N	\N	1306	1	\N	\N	\N
2425	VID	2013-12-06	254	\N	-1	\N	\N	f	M bla bla	0	254_2425.flv	\N	\N	\N	1306	1	\N	\N	\N
2427	TPL	2014-06-10	moo	\N	50	\N	\N	f	M bla bla	0	\N	\N	\N	\N	1309	1	\N	\N	<?xml version="1.0" encoding="UTF-8"?>\r\n<Template label="ondegamme" nomSwf="ondegamme.swf" nomClasse="ondegamme" nomContainer="onde1_cont" largeur="1024" hauteur="768" nbFrames="460" idCateorie="1309" idClient="1018">\r\n  <ZoneTexte label="Titre" nomAttribut="onde1_cont#titre_cont#ititre#titre"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="CENTER"><FONT FACE="Verdana" SIZE="18" COLOR="#000000" LETTERSPACING="0" KERNING="0"><B>Notre Gamme pro</B></FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneTexte label="texte" nomAttribut="onde1_cont#texte_cont#itexte#texte"><![CDATA[<TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">1 - Matériel de coupe</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">kjfksdlfjsdf</FONT></P></TEXTFORMAT><TEXTFORMAT LEADING="2"><P ALIGN="LEFT"><FONT FACE="Arial" SIZE="18" COLOR="#0000CC" LETTERSPACING="0" KERNING="1">sjdfhskfdhjs</FONT></P></TEXTFORMAT>]]></ZoneTexte>\r\n  <ZoneImage label="Fond" nomAttribut="onde1_cont#fond_cont" hauteur="768" largeur="1024" valeurAttribut="http://fichierclient.iconeo.fr/template/2427/data/neutre6.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2427/vignette/neutre6.jpg" urlRepertoireImages="http://fichierclient.iconeo.fr/template/302/fonds/" urlRepertoireVignettes="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/" urlListeImages="http://fichierclient.iconeo.fr/template/302/fonds/vignettes/?C=M;O=D;F=0" />\r\n  <ZoneImage label="Photo1" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo1" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2427/data/14202864137_1e63a72c77_b.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2427/vignette/14202864137_1e63a72c77_s.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n  <ZoneImage label="Photo2" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo2" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2427/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2427/vignette/coiff1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n  <ZoneImage label="Photo3" nomAttribut="onde1_cont#bulle_cont#bulle#photo_cont#photo3" hauteur="284" largeur="307" valeurAttribut="http://fichierclient.iconeo.fr/template/2427/data/coiff1.jpg" valeurVignette="http://fichierclient.iconeo.fr/template/2427/vignette/coiff1.jpg" urlRepertoireImages="" urlRepertoireVignettes="" urlListeImages="" />\r\n</Template>\r\n\r\n
\.


--
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY categorie (id, date_creation, libelle, metier_id, utilisateur_id, theme_id, parent_id, type) FROM stdin;
139	2008-07-11	root template	\N	\N	\N	\N	\N
497	2008-07-11	root annonces	\N	\N	\N	\N	\N
1000	2008-07-11	root	\N	\N	1000	\N	THEM
1001	2008-07-11		\N	\N	1000	1000	THEM
1002	2008-07-11	root	1000	\N	\N	\N	METI
1003	2008-07-11		1000	\N	\N	1002	METI
1102	2009-05-11	coiffure	\N	1005	\N	1070	UTIM
1044	2009-02-16	Mayekawa	\N	1001	\N	1011	UTIM
1045	2009-02-18	Millesima	\N	1001	\N	1011	UTIM
1030	2008-12-04	root	1001	\N	\N	\N	METI
1031	2008-12-04		1001	\N	\N	1030	METI
1021	2008-10-03	root	\N	1002	\N	\N	UTIF
1010	2008-07-11	root	\N	1001	\N	\N	UTIF
1011	2008-07-11	Ma boutique	\N	1001	\N	1010	UTIF
1023	2008-10-03	Produits	\N	1002	\N	1022	UTIF
1024	2008-10-03	Prestations	\N	1002	\N	1022	UTIF
1025	2008-10-03	Specialités	\N	1002	\N	1022	UTIF
1300	2010-10-15	FERMETURE	\N	1013	\N	1201	UTIM
1022	2008-10-03	Ma boutique	\N	1002	\N	1021	UTIF
1	2009-01-23	templates	\N	\N	\N	\N	\N
1071	2009-04-07	Produits	\N	1005	\N	1070	UTIF
1035	2008-12-17	Iconeo	\N	1001	\N	1011	UTIM
1026	2008-10-03	Petites annonces	\N	1002	\N	1021	UTIA
1013	2008-07-11	Prestations	\N	1001	\N	1011	UTIF
1032	2008-12-04	root	1002	\N	\N	\N	METI
1033	2008-12-04		1002	\N	\N	1032	METI
1117	2009-05-20	coiffure	\N	1009	\N	1107	UTIM
1048	2009-03-17	optique rive droite	\N	1001	\N	1011	UTIM
1049	2009-03-17	seigneurie gauthier	\N	1001	\N	1011	UTIM
1012	2008-07-11	Produits	\N	1001	\N	1011	UTIF
1051	2009-03-19	José	\N	1001	\N	1011	UTIM
1069	2009-04-07	root	\N	1005	\N	\N	UTIF
1072	2009-04-07	Prestations	\N	1005	\N	1070	UTIF
1054	2009-03-25	root	\N	1003	\N	\N	UTIF
1316	2011-09-28	g	\N	1020	\N	1315	UTIA
1309	2011-05-24	Modules	\N	1018	\N	1304	UTIM
1317	2012-06-25	test	\N	1010	\N	1134	UTIM
1055	2009-03-25	Ma boutique	\N	1003	\N	1054	UTIF
1118	2009-05-22	thalasso	\N	1009	\N	1107	UTIM
1119	2009-05-22	produits de beauté	\N	1009	\N	1107	UTIM
1120	2009-05-22	motos	\N	1009	\N	1107	UTIM
1059	2009-03-25	Petites annonces	\N	1003	\N	1054	UTIA
1062	2009-03-31	root	\N	1004	\N	\N	UTIF
1063	2009-03-31	Ma boutique	\N	1004	\N	1062	UTIF
1064	2009-03-31	Nos produits	\N	1004	\N	1063	UTIF
1065	2009-03-31	Nos prestations	\N	1004	\N	1063	UTIF
1066	2009-03-31	Nos specialités	\N	1004	\N	1063	UTIF
1067	2009-03-31	Petites annonces	\N	1004	\N	1062	UTIA
1068	2009-04-05	after coiffure	\N	1002	\N	1022	UTIM
1070	2009-04-07	Ma boutique	\N	1005	\N	1069	UTIF
1106	2009-05-12	root	\N	1009	\N	\N	UTIF
1107	2009-05-12	Ma boutique	\N	1009	\N	1106	UTIF
1108	2009-05-12	Produits	\N	1009	\N	1107	UTIF
1074	2009-04-07	Petites annonces	\N	1005	\N	1069	UTIA
1099	2009-05-06	moto	\N	1004	\N	1063	UTIM
1077	2009-04-18	root	1003	\N	\N	\N	METI
1078	2009-04-18		1003	\N	\N	1077	METI
1079	2009-04-18	root	\N	1007	\N	\N	UTIF
1080	2009-04-18	Ma boutique	\N	1007	\N	1079	UTIF
1081	2009-04-18	Produits	\N	1007	\N	1080	UTIF
1082	2009-04-18	Prestations	\N	1007	\N	1080	UTIF
1083	2009-04-18	Specialités	\N	1007	\N	1080	UTIF
1073	2009-04-07	Specialités	\N	1005	\N	1070	UTIF
1103	2009-05-11	opticien	\N	1005	\N	1070	UTIM
1087	2009-04-20	root	\N	1008	\N	\N	UTIF
1088	2009-04-20	Ma boutique	\N	1008	\N	1087	UTIF
1089	2009-04-20	Produits	\N	1008	\N	1088	UTIF
1090	2009-04-20	Prestations	\N	1008	\N	1088	UTIF
1091	2009-04-20	Specialités	\N	1008	\N	1088	UTIF
1109	2009-05-12	Prestations	\N	1009	\N	1107	UTIF
1093	2009-04-20	root	1005	\N	\N	\N	METI
1094	2009-04-20		1005	\N	\N	1093	METI
1095	2009-04-20	atlanthal	\N	1002	\N	1022	UTIM
10950	2009-04-23	soins	\N	\N	\N	1031	UTIA
1105	2009-05-11	bio.rritz	\N	1005	\N	1070	UTIM
1110	2009-05-12	Specialités	\N	1009	\N	1107	UTIF
1111	2009-05-12	Petites annonces	\N	1009	\N	1106	UTIA
1112	2009-05-18	biophase	\N	1002	\N	1022	UTIM
1113	2009-05-19	backup coiffure	\N	1001	\N	1011	UTIM
1121	2009-05-22	Vins	\N	1009	\N	1107	UTIM
1127	2009-07-07	Tattoo	\N	1005	\N	1070	UTIM
1166	2010-01-20	marc	\N	1005	\N	1070	UTIM
1056	2009-03-25	Sénégal	\N	1003	\N	1055	UTIF
1057	2009-03-25	Côte d'ivoire	\N	1003	\N	1055	UTIF
1058	2009-03-25	Congo	\N	1003	\N	1055	UTIF
1114	2009-05-19	vrac	\N	1003	\N	1055	UTIM
1014	2008-07-11	Exclusivités	\N	1001	\N	1011	UTIF
1115	2009-05-19	vrac	\N	1001	\N	1011	UTIM
1278	2010-03-01	Séb	\N	1001	\N	1011	UTIM
1130	2009-07-29	veterinaire	\N	1002	\N	1022	UTIM
1131	2009-08-24	root	1006	\N	\N	\N	METI
1132	2009-08-24		1006	\N	\N	1131	METI
1133	2009-08-24	root	\N	1010	\N	\N	UTIF
1134	2009-08-24	Ma boutique	\N	1010	\N	1133	UTIF
1139	2009-08-31	root	\N	1011	\N	\N	UTIF
1140	2009-08-31	Ma boutique	\N	1011	\N	1139	UTIF
1141	2009-08-31	Produits	\N	1011	\N	1140	UTIF
1155	2009-09-10	xxxx	\N	1001	\N	1011	UTIM
1135	2009-08-24	Michel	\N	1010	\N	1134	UTIF
1136	2009-08-24	Thomas	\N	1010	\N	1134	UTIF
1142	2009-08-31	Prestations	\N	1011	\N	1140	UTIF
1137	2009-08-24	News	\N	1010	\N	1134	UTIF
1143	2009-08-31	Specialités	\N	1011	\N	1140	UTIF
1146	2009-09-01	Videos accueil	\N	1010	\N	1134	UTIM
1154	2009-09-08	Madison	\N	1010	\N	1134	UTIM
1157	2009-10-07	bijoux	\N	1013	\N	1201	UTIM
1200	2009-09-18	root	\N	1013	\N	\N	UTIF
1201	2009-09-18	Ma boutique	\N	1013	\N	1200	UTIF
1202	2009-09-18	root	1007	\N	\N	\N	METI
1203	2009-09-18		1007	\N	\N	1202	METI
1204	2009-09-18	Galerie	\N	1013	\N	1201	UTIF
1159	2009-10-12	seb	\N	1005	\N	1070	UTIM
1160	2009-10-13	tv	\N	1010	\N	1134	UTIM
1161	2009-11-25	Visite	\N	1013	\N	1201	UTIM
1162	2009-12-10	visitepremierepage	\N	1013	\N	1201	UTIM
1163	2009-12-14	IMMO	\N	1001	\N	1011	UTIM
1164	2010-01-13	marc	\N	1001	\N	1011	UTIM
1165	2010-01-13	visiteflaçons	\N	1013	\N	1201	UTIM
1167	2010-01-22	root	1009	\N	\N	\N	METI
1168	2010-01-22		1009	\N	\N	1167	METI
1169	2010-01-22	root	\N	1015	\N	\N	UTIF
1170	2010-01-22	Ma boutique	\N	1015	\N	1169	UTIF
1171	2010-01-22	Produits	\N	1015	\N	1170	UTIF
1172	2010-01-22	Prestations	\N	1015	\N	1170	UTIF
1173	2010-01-22	Specialités	\N	1015	\N	1170	UTIF
1174	2010-01-22	Petites annonces	\N	1015	\N	1169	UTIA
1175	2010-01-22	Portes Ouvertes	\N	1015	\N	1170	UTIM
1275	2010-01-22	Vigne	\N	1015	\N	1170	UTIM
1276	2010-02-08	Bijoux	\N	1005	\N	1070	UTIM
1277	2010-02-12	mm	\N	1005	\N	1074	UTIA
1279	2010-03-03	root	\N	1016	\N	\N	UTIF
1285	2010-03-03	ecran 1	\N	1016	\N	1280	UTIM
1291	2010-03-04	Jingles	\N	1016	\N	1282	UTIM
1294	2010-03-17	evenement	\N	1009	\N	1107	UTIM
1292	2010-03-04	présentation	\N	1016	\N	1281	UTIM
1297	2010-05-17	Pascal	\N	1001	\N	1011	UTIM
1296	2010-03-24	aaa	\N	1005	\N	1070	UTIM
1299	2010-09-08	sandrine	\N	1016	\N	1281	UTIM
1280	2010-03-03	PORTES OUVERTES	\N	1016	\N	1279	UTIF
1281	2010-03-03	DEGUSTATION	\N	1016	\N	1279	UTIF
1282	2010-03-03	SITE INTERNET	\N	1016	\N	1279	UTIF
1301	2011-05-22	root	1010	\N	\N	\N	METI
1286	2010-03-03	ecran 2	\N	1016	\N	1280	UTIM
1287	2010-03-03	ecran 3	\N	1016	\N	1280	UTIM
1288	2010-03-03	Promotions	\N	1016	\N	1282	UTIM
1302	2011-05-22		1010	\N	\N	1301	METI
1290	2010-03-03	Actualités	\N	1016	\N	1282	UTIM
1289	2010-03-03	Informations	\N	1016	\N	1282	UTIM
1303	2011-05-22	root	\N	1018	\N	\N	UTIF
1304	2011-05-22	Ma boutique	\N	1018	\N	1303	UTIF
1305	2011-05-22	Produits	\N	1018	\N	1304	UTIF
1306	2011-05-22	Prestations	\N	1018	\N	1304	UTIF
1307	2011-05-22	Specialités	\N	1018	\N	1304	UTIF
1308	2011-05-22	Petites annonces	\N	1018	\N	1303	UTIA
1310	2011-09-26	root	\N	1020	\N	\N	UTIF
1311	2011-09-26	Ma boutique	\N	1020	\N	1310	UTIF
1312	2011-09-26	Produits	\N	1020	\N	1311	UTIF
1313	2011-09-26	Prestations	\N	1020	\N	1311	UTIF
1314	2011-09-26	Specialités	\N	1020	\N	1311	UTIF
1315	2011-09-26	Petites annonces	\N	1020	\N	1310	UTIA
\.


--
-- Data for Name: coordonnees; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY coordonnees (id, date_creation, voie, lieu_dit, code_postal, localite, telephone_fixe, fax, nom_boutique, horaires_ouverture_boutique, coordonnees_gps_boutique, pays_id) FROM stdin;
1	2008-07-11	14 boulevard alsace lorraine	\N	64000	Pau	\N	\N	publivision	\N	\N	1
1009	2009-08-24	11 rue de Guienne		33000	Bordeaux	05 56 44 27 25		Michel Tattoo		\N	1
1006	2009-04-18	7, place de l'hôtel de ville		42130	Boën	04 77 24 01 48	04 77 24 27 15	Gouttebroze Fleurs		\N	1
1013	2010-01-22	16, chemin du moulin de Rambal		33360	Latresne	05 56 20 78 19		Château Pascot		\N	1
1004	2009-03-31	blabla		12345	bla	0987654321		J-L Perlmutter		\N	1
1008	2009-05-12	2 rue theodore gardere 		33000	Bordeaux	0556333333		ja-iconeo	9h - 12h30\r\n14h - 18h30	\N	1
1007	2009-04-20	36 Route de bordeaux		33360	Latresne	050123		DEMO METIERS		\N	1
1010	2009-08-31	98, crs du Général de Gaulle		33170	Gradignan	05.56.86.20.08		Essenciel		\N	1
1011	2009-09-02	voie	lieuDit	codePostal	localite	telephoneFixe	fax	test	horairesOuvertureBoutique	\N	1
1012	2009-09-18	18 rue de Guienne		33000	Bordeaux	05 56 52 92 01		madison-piercing		\N	1
1014	2010-01-22	16, chemin du moulin de Rambal		33360	Latresne	05 56 20 78 19		Château Pascot		\N	1
1015	2010-03-03	Chateau Bertinerie		33620	CUBNEZAIS	05.57.68.70.74		Chateau Bertinerie		\N	1
1003	2009-03-25	14 boulevard Alsace Lorraine		64000	Pau	09 51 30 96 79			8h-12h\n14h-20h	\N	1
1016	2011-05-22	bla		33000	bordeaux	0987654321		bsport		\N	1
1005	2009-04-07	12 rue des alisées		33440	Lesparre	0556333333		Médoc-Iconeo	9h-19h\n\nNon stop\n	\N	1
1017	2011-05-22	bla		33000	bordeaux	0987654321		bsport		\N	1
1018	2011-09-26	bla		75012	Paris	0123456789		MasterCRM		\N	1
1019	2011-09-26	bla		75012	Paris	0123456789		MasterCRM		\N	1
1002	2008-10-03	\N		33700	Mérignac	06 23 07 67 80		Laurence Coiffure	9h-19h\n\nNon stop	\N	1
1001	2008-07-11	55 rue Anatole France		33150	Cenon	05 56 77 75 05\n	05 56 77 75 05	Braillard-Immo	8h - 19h\r\nnon stop	\N	1
\.


--
-- Data for Name: langue; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY langue (id, date_creation, code, libelle) FROM stdin;
1	2008-07-11	fr	Français
\.


--
-- Data for Name: lien; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY lien (id, date_creation, description, adresse, utilisateur_id) FROM stdin;
\.


--
-- Data for Name: lightnpop; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY lightnpop (id, date_creation, numero_serie, utilisateur_id) FROM stdin;
\.


--
-- Data for Name: log_acces; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY log_acces (id, date_creation, ip_publique, ip_privee, id_utilisateur) FROM stdin;
6	2009-04-01	88.182.21.46	ns27055.ovh.net	1001
1	2009-03-31	82.243.188.188	ns27055.ovh.net	1001
2	2009-03-31	82.243.188.188	ns27055.ovh.net	1001
3	2009-03-31	82.243.188.188	ns27055.ovh.net	1001
4	2009-03-31	88.182.21.46	ns27055.ovh.net	1001
5	2009-03-31	82.243.188.188	ns27055.ovh.net	1001
7	2009-04-01	82.243.188.188	iconeo.fr	1001
8	2009-04-01	82.243.188.188	iconeo.fr	1001
9	2009-04-01	82.243.188.188	ns27055.ovh.net	1001
10	2009-04-01	88.182.21.46	ns27055.ovh.net	1001
11	2009-04-01	82.243.188.188	iconeo.fr	1001
12	2009-04-01	82.243.188.188	iconeo.fr	1001
13	2009-04-01	82.243.188.188	iconeo.fr	1001
14	2009-04-01	82.243.188.188	iconeo.fr	1001
15	2009-04-01	82.243.188.188	iconeo.fr	1001
16	2009-04-01	82.243.188.188	iconeo.fr	1001
17	2009-04-01	82.243.188.188	iconeo.fr	1001
18	2009-04-01	82.243.188.188	iconeo.fr	1001
19	2009-04-02	82.243.188.188	iconeo.fr	1001
20	2009-04-02	82.243.188.188	iconeo.fr	1001
21	2009-04-02	88.182.21.46	iconeo.fr	1001
22	2009-04-02	88.182.21.46	iconeo.fr	1001
23	2009-04-03	88.182.21.46	iconeo.fr	1001
24	2009-04-03	88.182.21.46	iconeo.fr	1001
25	2009-04-03	88.182.21.46	iconeo.fr	1001
26	2009-04-03	82.243.188.188	iconeo.fr	1001
27	2009-04-03	82.243.188.188	iconeo.fr	1001
28	2009-04-03	82.243.188.188	iconeo.fr	1001
29	2009-04-03	82.243.188.188	iconeo.fr	1001
30	2009-04-03	82.243.188.188	iconeo.fr	1001
31	2009-04-04	82.243.188.188	iconeo.fr	1001
32	2009-04-04	82.243.188.188	iconeo.fr	1001
33	2009-04-04	82.243.188.188	iconeo.fr	1001
34	2009-04-05	88.165.57.47	iconeo.fr	1002
35	2009-04-05	88.165.57.47	iconeo.fr	1002
36	2009-04-05	88.182.21.46	iconeo.fr	1002
37	2009-04-05	88.165.57.47	iconeo.fr	1002
38	2009-04-05	88.182.21.46	iconeo.fr	1002
39	2009-04-05	88.182.21.46	iconeo.fr	1001
40	2009-04-05	88.182.21.46	iconeo.fr	1001
41	2009-04-05	88.165.57.47	iconeo.fr	1002
42	2009-04-05	88.165.57.47	iconeo.fr	1002
43	2009-04-06	212.99.26.66	iconeo.fr	1004
44	2009-04-06	88.182.21.46	iconeo.fr	1001
45	2009-04-06	88.165.57.47	iconeo.fr	1002
46	2009-04-06	88.182.21.46	iconeo.fr	1002
47	2009-04-06	88.182.21.46	iconeo.fr	1002
48	2009-04-06	88.182.21.46	iconeo.fr	1002
49	2009-04-06	88.182.21.46	iconeo.fr	1002
50	2009-04-06	88.182.21.46	iconeo.fr	1002
51	2009-04-06	88.165.57.47	iconeo.fr	1002
52	2009-04-06	88.165.57.47	iconeo.fr	1002
53	2009-04-06	88.165.57.47	iconeo.fr	1002
54	2009-04-06	88.165.57.47	iconeo.fr	1002
55	2009-04-07	82.243.188.188	iconeo.fr	1002
56	2009-04-07	82.243.188.188	iconeo.fr	1001
57	2009-04-07	88.182.21.46	iconeo.fr	1002
58	2009-04-07	82.243.188.188	iconeo.fr	1001
59	2009-04-07	88.165.57.47	iconeo.fr	1002
60	2009-04-07	88.182.21.46	iconeo.fr	1001
61	2009-04-07	88.165.57.47	iconeo.fr	1002
62	2009-04-07	82.243.188.188	iconeo.fr	1002
63	2009-04-07	88.165.57.47	iconeo.fr	1001
64	2009-04-07	88.165.57.47	iconeo.fr	1001
65	2009-04-07	82.243.188.188	iconeo.fr	1001
66	2009-04-07	88.182.21.46	iconeo.fr	1001
67	2009-04-07	88.182.21.46	iconeo.fr	1005
68	2009-04-07	88.182.21.46	iconeo.fr	1004
69	2009-04-07	88.182.21.46	iconeo.fr	1002
70	2009-04-07	82.243.188.188	iconeo.fr	1001
71	2009-04-08	90.50.17.215	iconeo.fr	1005
72	2009-04-08	90.50.17.215	iconeo.fr	1005
73	2009-04-08	88.182.21.3	iconeo.fr	1005
74	2009-04-08	88.182.21.3	iconeo.fr	1005
75	2009-04-08	82.243.188.188	iconeo.fr	1001
76	2009-04-08	82.243.188.188	iconeo.fr	1001
77	2009-04-08	82.243.188.188	iconeo.fr	1001
78	2009-04-08	88.182.21.46	iconeo.fr	1001
79	2009-04-08	82.243.188.188	iconeo.fr	1001
80	2009-04-08	82.243.188.188	iconeo.fr	1001
81	2009-04-09	88.182.21.46	iconeo.fr	1001
82	2009-04-09	88.182.21.46	iconeo.fr	1001
83	2009-04-09	82.243.188.188	iconeo.fr	1001
84	2009-04-09	88.182.21.46	iconeo.fr	1001
85	2009-04-09	88.182.21.46	iconeo.fr	1002
86	2009-04-10	88.182.21.3	iconeo.fr	1001
87	2009-04-10	88.182.21.3	iconeo.fr	1001
88	2009-04-10	88.182.21.3	iconeo.fr	1001
89	2009-04-10	90.60.71.222	iconeo.fr	1005
90	2009-04-10	90.60.71.222	iconeo.fr	1005
91	2009-04-10	88.165.57.47	iconeo.fr	1001
92	2009-04-10	88.182.21.46	iconeo.fr	1005
93	2009-04-10	82.243.188.188	iconeo.fr	1005
94	2009-04-10	82.243.188.188	iconeo.fr	1005
95	2009-04-10	88.182.21.46	iconeo.fr	1005
96	2009-04-10	82.243.188.188	iconeo.fr	1001
97	2009-04-10	82.243.188.188	iconeo.fr	1001
98	2009-04-10	82.243.188.188	iconeo.fr	1001
99	2009-04-10	82.243.188.188	iconeo.fr	1001
100	2009-04-10	82.243.188.188	iconeo.fr	1005
101	2009-04-10	82.243.188.188	iconeo.fr	1005
102	2009-04-10	82.243.188.188	iconeo.fr	1001
103	2009-04-10	82.243.188.188	iconeo.fr	1005
104	2009-04-10	82.243.188.188	iconeo.fr	1005
105	2009-04-10	82.243.188.188	iconeo.fr	1005
106	2009-04-10	82.243.188.188	iconeo.fr	1001
107	2009-04-10	88.165.57.47	iconeo.fr	1001
108	2009-04-11	80.125.173.55	iconeo.fr	1005
109	2009-04-11	88.182.21.46	iconeo.fr	1001
110	2009-04-11	88.182.21.46	iconeo.fr	1002
111	2009-04-14	88.182.21.46	iconeo.fr	1001
112	2009-04-14	88.182.21.46	iconeo.fr	1002
113	2009-04-14	82.227.200.49	iconeo.fr	1001
114	2009-04-14	80.125.172.58	iconeo.fr	1002
115	2009-04-14	80.125.172.58	iconeo.fr	1001
116	2009-04-14	82.227.200.49	iconeo.fr	1001
117	2009-04-14	80.125.173.56	iconeo.fr	1001
118	2009-04-14	86.196.150.87	iconeo.fr	1001
119	2009-04-14	86.196.150.87	iconeo.fr	1001
120	2009-04-14	86.196.150.87	iconeo.fr	1001
121	2009-04-14	80.125.173.55	iconeo.fr	1001
122	2009-04-15	80.125.172.55	iconeo.fr	1002
123	2009-04-15	90.45.161.120	iconeo.fr	1005
124	2009-04-15	90.45.161.120	iconeo.fr	1002
125	2009-04-15	90.45.161.120	iconeo.fr	1001
126	2009-04-15	88.182.21.46	iconeo.fr	1002
127	2009-04-15	90.45.161.120	iconeo.fr	1002
128	2009-04-16	80.125.173.56	iconeo.fr	1001
129	2009-04-16	80.125.173.56	iconeo.fr	1002
130	2009-04-16	88.182.21.46	iconeo.fr	1005
131	2009-04-16	88.182.21.46	iconeo.fr	1002
132	2009-04-16	88.182.21.46	iconeo.fr	1002
134	2009-04-16	88.182.21.46	iconeo.fr	1002
133	2009-04-16	88.182.21.46	iconeo.fr	1002
136	2009-04-16	88.182.21.46	iconeo.fr	1002
135	2009-04-16	88.182.21.46	iconeo.fr	1002
137	2009-04-16	88.182.21.46	iconeo.fr	1001
138	2009-04-16	88.182.21.46	iconeo.fr	1001
139	2009-04-17	88.182.21.46	iconeo.fr	1002
140	2009-04-17	88.182.21.3	iconeo.fr	1001
141	2009-04-18	82.243.188.188	iconeo.fr	1001
142	2009-04-18	82.243.188.188	iconeo.fr	1002
143	2009-04-18	82.243.188.188	iconeo.fr	1005
144	2009-04-18	82.243.188.188	iconeo.fr	1007
145	2009-04-18	82.243.188.188	iconeo.fr	1007
146	2009-04-19	88.182.21.46	iconeo.fr	1001
147	2009-04-20	82.243.188.188	iconeo.fr	1008
148	2009-04-20	88.165.57.47	iconeo.fr	1008
149	2009-04-20	88.165.57.47	iconeo.fr	1002
150	2009-04-20	82.243.188.188	iconeo.fr	1002
151	2009-04-20	88.165.57.47	iconeo.fr	1002
152	2009-04-20	80.125.173.55	iconeo.fr	1002
153	2009-04-20	88.182.21.46	iconeo.fr	1002
154	2009-04-20	88.182.21.46	iconeo.fr	1002
155	2009-04-20	88.182.21.46	iconeo.fr	1001
156	2009-04-20	88.165.57.47	iconeo.fr	1002
157	2009-04-21	80.125.173.55	iconeo.fr	1002
158	2009-04-21	88.165.57.47	iconeo.fr	1001
159	2009-04-21	88.182.21.46	iconeo.fr	1002
160	2009-04-21	88.182.21.46	iconeo.fr	1002
161	2009-04-21	88.182.21.46	iconeo.fr	1001
162	2009-04-22	88.182.21.46	iconeo.fr	1002
163	2009-04-22	88.182.21.46	iconeo.fr	1002
164	2009-04-22	88.182.21.46	iconeo.fr	1002
165	2009-04-22	81.252.254.233	iconeo.fr	1002
166	2009-04-23	88.182.21.46	iconeo.fr	1005
167	2009-04-23	88.182.21.46	iconeo.fr	1001
168	2009-04-23	88.182.21.46	ns27055.ovh.net	1001
169	2009-04-23	88.182.21.46	iconeo.fr	1001
170	2009-04-23	88.182.21.46	ns27055.ovh.net	1001
171	2009-04-23	88.182.21.46	iconeo.fr	1001
172	2009-04-23	88.182.21.46	ns27055.ovh.net	1001
173	2009-04-23	88.182.21.46	ns27055.ovh.net	1001
174	2009-04-24	88.182.21.46	iconeo.fr	1002
175	2009-04-25	88.165.57.47	iconeo.fr	1002
176	2009-04-25	88.165.57.47	iconeo.fr	1002
177	2009-04-25	88.182.21.46	iconeo.fr	1001
178	2009-04-25	90.45.182.87	iconeo.fr	1005
179	2009-04-25	88.182.21.46	iconeo.fr	1001
180	2009-04-25	88.165.57.47	iconeo.fr	1001
181	2009-04-25	88.165.57.47	iconeo.fr	1001
182	2009-04-25	88.182.21.46	iconeo.fr	1001
183	2009-04-25	88.165.57.47	iconeo.fr	1001
184	2009-04-26	88.165.57.47	iconeo.fr	1001
185	2009-04-27	147.210.179.68	iconeo.fr	1002
186	2009-04-28	88.182.21.46	iconeo.fr	1005
187	2009-04-28	88.182.21.46	iconeo.fr	1004
188	2009-04-29	80.125.173.55	iconeo.fr	1002
189	2009-04-29	80.125.173.55	iconeo.fr	1002
190	2009-04-29	88.182.21.46	iconeo.fr	1002
191	2009-04-30	86.210.231.212	iconeo.fr	1002
192	2009-05-01	80.125.172.55	iconeo.fr	1001
193	2009-05-04	88.182.21.46	iconeo.fr	1001
194	2009-05-04	88.182.21.46	iconeo.fr	1001
195	2009-05-04	88.182.21.46	iconeo.fr	1001
196	2009-05-05	80.125.172.55	iconeo.fr	1005
197	2009-05-05	80.9.144.81	iconeo.fr	1007
198	2009-05-05	82.243.188.188	iconeo.fr	1007
199	2009-05-05	80.125.173.55	iconeo.fr	1002
200	2009-05-05	88.182.21.46	ns27055.ovh.net	1001
201	2009-05-05	88.182.21.46	ns27055.ovh.net	1001
202	2009-05-05	88.182.21.46	ns27055.ovh.net	1001
203	2009-05-05	88.182.21.46	ns27055.ovh.net	1001
204	2009-05-05	88.182.21.46	ns27055.ovh.net	1001
205	2009-05-05	88.182.21.46	ns27055.ovh.net	1001
206	2009-05-06	88.182.21.46	iconeo.fr	1001
207	2009-05-06	88.182.21.46	iconeo.fr	1005
208	2009-05-06	88.182.21.46	iconeo.fr	1002
209	2009-05-06	88.182.21.46	iconeo.fr	1005
210	2009-05-06	88.182.21.46	iconeo.fr	1002
211	2009-05-06	88.182.21.46	iconeo.fr	1005
212	2009-05-06	88.182.21.46	iconeo.fr	1002
213	2009-05-06	80.125.173.56	iconeo.fr	1004
214	2009-05-06	80.125.172.58	iconeo.fr	1005
215	2009-05-06	80.125.172.58	iconeo.fr	1005
216	2009-05-07	80.125.173.55	iconeo.fr	1005
217	2009-05-07	80.125.173.55	iconeo.fr	1005
218	2009-05-07	80.125.173.55	iconeo.fr	1005
219	2009-05-07	88.182.21.46	iconeo.fr	1005
220	2009-05-07	88.182.21.46	iconeo.fr	1005
221	2009-05-07	88.182.21.46	iconeo.fr	1001
222	2009-05-07	88.182.21.46	iconeo.fr	1005
223	2009-05-07	80.125.173.55	iconeo.fr	1005
224	2009-05-07	88.182.21.46	iconeo.fr	1005
225	2009-05-07	88.182.21.3	iconeo.fr	1005
226	2009-05-07	80.125.172.58	iconeo.fr	1005
227	2009-05-07	88.182.21.46	iconeo.fr	1005
228	2009-05-07	88.182.21.46	iconeo.fr	1005
229	2009-05-07	88.182.21.46	iconeo.fr	1005
230	2009-05-07	88.182.21.46	iconeo.fr	1001
231	2009-05-07	88.182.21.46	iconeo.fr	1001
232	2009-05-07	80.125.172.55	iconeo.fr	1005
233	2009-05-08	195.83.155.55	iconeo.fr	1001
234	2009-05-08	195.83.155.55	iconeo.fr	1001
235	2009-05-08	80.9.144.81	iconeo.fr	1007
236	2009-05-09	88.182.21.46	iconeo.fr	1005
237	2009-05-09	88.182.21.46	iconeo.fr	1001
238	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
239	2009-05-09	88.182.21.46	iconeo.fr	1001
240	2009-05-09	88.182.21.46	iconeo.fr	1001
241	2009-05-09	88.182.21.46	iconeo.fr	1001
242	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
243	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
244	2009-05-09	88.182.21.46	iconeo.fr	1001
245	2009-05-09	88.182.21.46	iconeo.fr	1001
246	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
247	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
248	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
249	2009-05-09	88.182.21.46	ns27055.ovh.net	1002
250	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
251	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
252	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
253	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
254	2009-05-09	88.182.21.46	ns27055.ovh.net	1002
255	2009-05-09	88.182.21.46	ns27055.ovh.net	1002
256	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
257	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
258	2009-05-09	88.182.21.46	ns27055.ovh.net	1002
259	2009-05-09	88.182.21.46	iconeo.fr	1002
260	2009-05-09	88.182.21.46	iconeo.fr	1002
261	2009-05-09	88.182.21.46	iconeo.fr	1001
262	2009-05-09	88.182.21.46	iconeo.fr	1001
263	2009-05-09	88.182.21.46	iconeo.fr	1001
264	2009-05-09	88.182.21.46	iconeo.fr	1001
265	2009-05-09	88.182.21.46	iconeo.fr	1001
266	2009-05-09	88.182.21.46	iconeo.fr	1001
267	2009-05-09	88.182.21.46	iconeo.fr	1001
268	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
269	2009-05-09	88.182.21.46	ns27055.ovh.net	1001
270	2009-05-10	88.182.21.46	iconeo.fr	1001
271	2009-05-10	88.182.21.46	ns27055.ovh.net	1001
272	2009-05-10	88.182.21.46	ns27055.ovh.net	1001
273	2009-05-10	88.182.21.46	ns27055.ovh.net	1001
274	2009-05-10	88.182.21.46	ns27055.ovh.net	1001
275	2009-05-10	88.182.21.46	iconeo.fr	1001
276	2009-05-11	80.9.24.183	iconeo.fr	1007
277	2009-05-11	80.9.24.183	iconeo.fr	1007
278	2009-05-11	88.165.57.47	iconeo.fr	1002
279	2009-05-11	80.125.172.55	iconeo.fr	1005
280	2009-05-11	80.125.173.56	iconeo.fr	1004
281	2009-05-11	80.125.172.58	iconeo.fr	1005
282	2009-05-11	88.182.21.46	iconeo.fr	1001
283	2009-05-11	88.182.21.46	iconeo.fr	1001
284	2009-05-11	80.125.172.58	iconeo.fr	1005
285	2009-05-11	88.165.57.47	iconeo.fr	1002
286	2009-05-11	88.182.21.46	iconeo.fr	1001
287	2009-05-11	88.182.21.46	iconeo.fr	1001
288	2009-05-11	88.182.21.46	iconeo.fr	1001
289	2009-05-11	88.182.21.46	iconeo.fr	1001
290	2009-05-11	88.182.21.46	iconeo.fr	1001
291	2009-05-11	88.182.21.46	iconeo.fr	1005
292	2009-05-11	88.182.21.46	iconeo.fr	1002
293	2009-05-11	88.165.57.47	iconeo.fr	1001
294	2009-05-11	88.165.57.47	iconeo.fr	1002
295	2009-05-11	88.182.21.46	iconeo.fr	1002
296	2009-05-11	88.165.57.47	iconeo.fr	1005
297	2009-05-11	88.165.57.47	iconeo.fr	1005
298	2009-05-11	88.182.21.46	iconeo.fr	1005
299	2009-05-11	88.182.21.46	iconeo.fr	1005
300	2009-05-11	88.182.21.46	iconeo.fr	1005
301	2009-05-11	88.165.57.47	iconeo.fr	1002
302	2009-05-11	80.125.172.55	iconeo.fr	1001
303	2009-05-11	80.125.172.55	iconeo.fr	1005
304	2009-05-11	88.165.57.47	iconeo.fr	1002
305	2009-05-12	88.182.21.46	iconeo.fr	1002
306	2009-05-12	88.182.21.46	iconeo.fr	1002
307	2009-05-12	88.182.21.46	iconeo.fr	1001
308	2009-05-12	88.182.21.46	iconeo.fr	1001
309	2009-05-12	88.182.21.46	iconeo.fr	1001
310	2009-05-12	88.182.21.46	iconeo.fr	1001
311	2009-05-12	80.125.173.55	iconeo.fr	1002
312	2009-05-12	88.182.21.46	iconeo.fr	1009
313	2009-05-12	88.182.21.46	iconeo.fr	1009
314	2009-05-12	88.182.21.46	iconeo.fr	1009
315	2009-05-12	82.243.188.188	iconeo.fr	1007
316	2009-05-12	82.243.188.188	iconeo.fr	1007
317	2009-05-12	82.243.188.188	iconeo.fr	1007
318	2009-05-12	88.182.21.46	iconeo.fr	1009
319	2009-05-12	88.182.21.46	iconeo.fr	1009
320	2009-05-12	88.182.21.46	iconeo.fr	1001
321	2009-05-12	82.243.188.188	iconeo.fr	1001
322	2009-05-12	80.9.24.183	iconeo.fr	1007
323	2009-05-12	88.182.21.46	iconeo.fr	1002
324	2009-05-12	80.125.172.55	iconeo.fr	1005
325	2009-05-12	82.227.200.49	iconeo.fr	1009
326	2009-05-12	82.227.200.49	iconeo.fr	1001
327	2009-05-12	80.125.172.55	iconeo.fr	1005
328	2009-05-12	195.83.155.55	iconeo.fr	1001
329	2009-05-12	80.125.172.58	iconeo.fr	1001
330	2009-05-12	88.182.21.46	iconeo.fr	1001
331	2009-05-12	88.182.21.46	iconeo.fr	1001
332	2009-05-13	80.125.173.56	iconeo.fr	1002
333	2009-05-13	86.205.254.224	iconeo.fr	1005
334	2009-05-14	80.125.172.55	iconeo.fr	1005
335	2009-05-14	80.125.173.59	iconeo.fr	1005
336	2009-05-15	80.125.173.55	iconeo.fr	1002
337	2009-05-15	88.182.21.46	iconeo.fr	1001
338	2009-05-16	80.125.172.59	iconeo.fr	1005
339	2009-05-17	88.182.21.46	iconeo.fr	1001
340	2009-05-18	80.125.172.55	iconeo.fr	1005
341	2009-05-18	80.125.173.56	iconeo.fr	1002
342	2009-05-18	88.182.21.46	iconeo.fr	1001
343	2009-05-18	88.182.21.46	iconeo.fr	1001
344	2009-05-18	88.165.57.47	iconeo.fr	1002
345	2009-05-18	88.165.57.47	iconeo.fr	1002
346	2009-05-18	80.125.172.58	iconeo.fr	1005
347	2009-05-18	80.125.172.55	iconeo.fr	1005
348	2009-05-19	88.182.21.46	iconeo.fr	1001
349	2009-05-19	88.182.21.46	iconeo.fr	1001
350	2009-05-19	80.125.173.56	iconeo.fr	1002
351	2009-05-19	80.125.173.56	iconeo.fr	1002
352	2009-05-19	80.125.173.56	iconeo.fr	1002
353	2009-05-19	80.125.173.56	iconeo.fr	1002
354	2009-05-19	80.125.173.56	iconeo.fr	1002
355	2009-05-19	80.125.173.56	iconeo.fr	1002
356	2009-05-19	86.210.160.234	iconeo.fr	1002
357	2009-05-19	88.182.21.46	iconeo.fr	1001
358	2009-05-19	88.182.21.46	iconeo.fr	1001
359	2009-05-19	88.182.21.46	iconeo.fr	1005
360	2009-05-19	88.182.21.46	iconeo.fr	1001
361	2009-05-19	80.125.173.59	iconeo.fr	1005
362	2009-05-19	82.243.188.188	iconeo.fr	1001
363	2009-05-19	88.182.21.46	iconeo.fr	1003
364	2009-05-19	80.125.172.55	iconeo.fr	1005
365	2009-05-19	88.182.21.46	iconeo.fr	1003
366	2009-05-19	88.182.21.46	iconeo.fr	1003
367	2009-05-19	88.182.21.46	iconeo.fr	1003
368	2009-05-19	88.182.21.46	iconeo.fr	1001
369	2009-05-19	88.182.21.46	iconeo.fr	1001
370	2009-05-19	88.182.21.46	iconeo.fr	1003
371	2009-05-19	88.182.21.46	iconeo.fr	1003
372	2009-05-19	88.182.21.46	iconeo.fr	1001
373	2009-05-19	88.182.21.46	iconeo.fr	1001
374	2009-05-19	88.182.21.46	iconeo.fr	1001
375	2009-05-19	77.84.26.136	iconeo.fr	1005
376	2009-05-19	80.125.173.59	iconeo.fr	1005
377	2009-05-19	82.243.188.188	iconeo.fr	1001
378	2009-05-20	88.173.223.183	iconeo.fr	1009
379	2009-05-20	88.173.223.183	iconeo.fr	1009
380	2009-05-20	82.243.188.188	iconeo.fr	1001
381	2009-05-20	90.50.40.120	iconeo.fr	1002
382	2009-05-21	88.173.223.183	iconeo.fr	1009
383	2009-05-22	88.173.223.183	iconeo.fr	1009
384	2009-05-23	88.173.250.42	iconeo.fr	1009
385	2009-05-25	88.182.21.46	iconeo.fr	1001
386	2009-05-25	88.182.21.46	iconeo.fr	1001
387	2009-05-25	88.182.21.46	iconeo.fr	1001
388	2009-05-25	88.182.21.46	iconeo.fr	1001
389	2009-05-26	80.125.172.58	iconeo.fr	1002
390	2009-05-26	80.125.172.58	iconeo.fr	1005
391	2009-05-26	88.165.57.47	iconeo.fr	1002
392	2009-05-26	88.165.57.47	iconeo.fr	1009
393	2009-05-26	86.196.184.88	iconeo.fr	1009
394	2009-05-27	80.125.173.55	iconeo.fr	1002
395	2009-05-27	88.182.21.46	iconeo.fr	1001
396	2009-05-27	80.125.172.59	iconeo.fr	1002
397	2009-05-28	88.182.21.46	iconeo.fr	1001
398	2009-05-28	217.112.68.254	iconeo.fr	1002
399	2009-05-28	80.125.173.59	iconeo.fr	1002
400	2009-05-28	80.125.173.59	iconeo.fr	1002
401	2009-06-01	88.182.21.3	iconeo.fr	1001
402	2009-06-01	81.56.193.18	iconeo.fr	1001
403	2009-06-02	80.125.173.59	iconeo.fr	1002
404	2009-06-02	80.125.173.59	iconeo.fr	1002
405	2009-06-02	80.125.172.58	iconeo.fr	1002
406	2009-06-02	80.125.172.58	iconeo.fr	1002
407	2009-06-02	88.168.253.234	iconeo.fr	1002
408	2009-06-02	80.125.172.55	iconeo.fr	1002
409	2009-06-03	89.87.221.3	iconeo.fr	1002
410	2009-06-03	80.125.172.58	iconeo.fr	1002
411	2009-06-04	80.125.173.59	iconeo.fr	1002
412	2009-06-04	80.125.172.58	iconeo.fr	1002
413	2009-06-04	80.125.172.58	iconeo.fr	1002
414	2009-06-04	80.125.172.58	iconeo.fr	1002
415	2009-06-04	80.125.172.58	iconeo.fr	1002
416	2009-06-04	80.125.172.58	iconeo.fr	1002
417	2009-06-07	89.170.105.63	iconeo.fr	1001
418	2009-06-07	89.170.105.63	iconeo.fr	1001
419	2009-06-08	88.165.57.47	iconeo.fr	1002
420	2009-06-08	88.182.21.46	iconeo.fr	1002
421	2009-06-08	88.182.21.46	iconeo.fr	1002
422	2009-06-09	80.125.172.58	iconeo.fr	1002
423	2009-06-09	80.125.172.55	iconeo.fr	1002
424	2009-06-10	88.182.21.46	iconeo.fr	1001
425	2009-06-13	82.243.188.188	iconeo.fr	1009
426	2009-06-13	82.243.188.188	iconeo.fr	1009
427	2009-06-13	82.243.188.188	iconeo.fr	1009
428	2009-06-15	82.243.188.188	iconeo.fr	1009
429	2009-06-16	80.125.173.55	iconeo.fr	1002
430	2009-06-16	88.165.57.47	iconeo.fr	1002
431	2009-06-16	82.243.188.188	iconeo.fr	1009
432	2009-06-17	86.205.230.4	iconeo.fr	1002
433	2009-06-18	82.243.188.188	iconeo.fr	1009
434	2009-06-18	88.165.57.47	iconeo.fr	1002
435	2009-06-18	88.165.57.47	iconeo.fr	1002
436	2009-06-18	82.243.188.188	iconeo.fr	1009
437	2009-06-20	88.182.21.3	iconeo.fr	1001
438	2009-06-20	88.182.21.3	iconeo.fr	1002
439	2009-06-22	88.165.57.47	iconeo.fr	1002
440	2009-06-23	80.125.172.55	iconeo.fr	1002
441	2009-06-25	80.125.172.63	iconeo.fr	1002
442	2009-06-25	86.217.128.26	iconeo.fr	1002
443	2009-06-26	88.182.21.46	iconeo.fr	1002
444	2009-06-30	88.182.21.46	iconeo.fr	1002
445	2009-06-30	88.182.21.46	iconeo.fr	1002
446	2009-07-02	88.182.21.46	iconeo.fr	1002
447	2009-07-02	88.182.21.46	iconeo.fr	1002
448	2009-07-02	88.182.21.46	iconeo.fr	1005
449	2009-07-03	88.182.21.46	iconeo.fr	1002
450	2009-07-03	88.182.21.46	iconeo.fr	1002
451	2009-07-03	88.182.21.46	iconeo.fr	1002
452	2009-07-06	89.87.221.3	iconeo.fr	1002
453	2009-07-07	88.182.21.46	iconeo.fr	1005
454	2009-07-07	82.243.188.188	iconeo.fr	1005
455	2009-07-08	88.182.21.46	iconeo.fr	1005
456	2009-07-08	90.38.118.187	iconeo.fr	1002
457	2009-07-08	90.38.118.187	iconeo.fr	1002
458	2009-07-08	88.182.21.46	iconeo.fr	1005
459	2009-07-08	88.182.21.46	iconeo.fr	1002
460	2009-07-11	88.182.21.46	iconeo.fr	1005
461	2009-07-13	88.182.21.46	iconeo.fr	1005
462	2009-07-13	88.182.21.46	iconeo.fr	1005
463	2009-07-17	88.182.21.46	iconeo.fr	1005
464	2009-07-17	88.182.21.46	iconeo.fr	1002
465	2009-07-20	82.243.188.188	iconeo.fr	1005
466	2009-07-20	88.182.21.46	iconeo.fr	1002
467	2009-07-20	82.243.188.188	iconeo.fr	1005
468	2009-07-20	88.182.21.3	iconeo.fr	1005
469	2009-07-22	88.165.57.47	iconeo.fr	1002
470	2009-07-22	88.182.21.46	iconeo.fr	1002
471	2009-07-22	88.182.21.46	iconeo.fr	1001
472	2009-07-22	88.182.21.46	iconeo.fr	1001
473	2009-07-22	88.182.21.46	iconeo.fr	1001
474	2009-07-22	88.182.21.46	iconeo.fr	1004
475	2009-07-22	88.182.21.46	iconeo.fr	1001
476	2009-07-23	88.165.57.47	iconeo.fr	1002
477	2009-07-23	82.243.188.188	iconeo.fr	1005
478	2009-07-23	82.243.188.188	iconeo.fr	1005
479	2009-07-23	82.243.188.188	iconeo.fr	1005
480	2009-07-23	82.243.188.188	iconeo.fr	1005
481	2009-07-23	82.243.188.188	iconeo.fr	1005
482	2009-07-23	82.243.188.188	iconeo.fr	1005
483	2009-07-23	82.243.188.188	iconeo.fr	1005
484	2009-07-23	82.243.188.188	iconeo.fr	1005
485	2009-07-23	82.243.188.188	iconeo.fr	1005
486	2009-07-24	82.243.188.188	iconeo.fr	1005
487	2009-07-24	82.243.188.188	iconeo.fr	1005
488	2009-07-24	82.243.188.188	iconeo.fr	1005
489	2009-07-24	82.243.188.188	iconeo.fr	1008
490	2009-07-24	82.243.188.188	iconeo.fr	1008
491	2009-07-24	82.243.188.188	iconeo.fr	1008
492	2009-07-24	82.243.188.188	iconeo.fr	1002
493	2009-07-24	82.243.188.188	iconeo.fr	1002
494	2009-07-24	82.243.188.188	iconeo.fr	1005
495	2009-07-24	82.243.188.188	iconeo.fr	1005
496	2009-07-24	82.243.188.188	iconeo.fr	1002
497	2009-07-24	82.243.188.188	iconeo.fr	1002
498	2009-07-24	82.243.188.188	iconeo.fr	1002
499	2009-07-24	88.182.21.3	iconeo.fr	1001
500	2009-07-24	88.182.21.3	iconeo.fr	1001
501	2009-07-24	88.182.21.3	iconeo.fr	1001
502	2009-07-24	88.182.21.3	iconeo.fr	1001
503	2009-07-24	82.243.188.188	iconeo.fr	1008
504	2009-07-24	82.243.188.188	iconeo.fr	1008
505	2009-07-24	82.243.188.188	iconeo.fr	1008
506	2009-07-24	82.243.188.188	iconeo.fr	1008
507	2009-07-24	82.243.188.188	iconeo.fr	1008
508	2009-07-24	82.243.188.188	iconeo.fr	1002
509	2009-07-24	82.243.188.188	iconeo.fr	1008
510	2009-07-24	82.243.188.188	iconeo.fr	1008
511	2009-07-24	82.243.188.188	iconeo.fr	1002
512	2009-07-24	82.243.188.188	iconeo.fr	1002
513	2009-07-24	82.243.188.188	iconeo.fr	1002
514	2009-07-24	82.243.188.188	iconeo.fr	1002
515	2009-07-25	82.243.188.188	iconeo.fr	1002
516	2009-07-25	82.243.188.188	iconeo.fr	1008
517	2009-07-25	82.243.188.188	iconeo.fr	1008
518	2009-07-25	82.243.188.188	iconeo.fr	1002
519	2009-07-25	82.243.188.188	iconeo.fr	1002
520	2009-07-25	82.243.188.188	iconeo.fr	1002
521	2009-07-25	82.243.188.188	iconeo.fr	1005
522	2009-07-25	82.243.188.188	iconeo.fr	1005
523	2009-07-25	82.243.188.188	iconeo.fr	1005
524	2009-07-25	82.243.188.188	iconeo.fr	1005
525	2009-07-25	82.243.188.188	iconeo.fr	1005
526	2009-07-25	82.243.188.188	iconeo.fr	1005
527	2009-07-25	82.243.188.188	iconeo.fr	1005
528	2009-07-25	82.243.188.188	iconeo.fr	1005
529	2009-07-25	82.243.188.188	iconeo.fr	1005
530	2009-07-25	82.243.188.188	iconeo.fr	1005
531	2009-07-25	82.243.188.188	iconeo.fr	1005
532	2009-07-25	82.243.188.188	iconeo.fr	1005
533	2009-07-25	82.243.188.188	iconeo.fr	1005
534	2009-07-25	82.243.188.188	iconeo.fr	1005
535	2009-07-25	82.243.188.188	iconeo.fr	1005
536	2009-07-25	82.243.188.188	iconeo.fr	1005
537	2009-07-25	82.243.188.188	iconeo.fr	1005
538	2009-07-25	82.243.188.188	iconeo.fr	1005
539	2009-07-25	82.243.188.188	iconeo.fr	1005
540	2009-07-25	82.243.188.188	iconeo.fr	1005
541	2009-07-25	82.243.188.188	iconeo.fr	1005
542	2009-07-25	82.243.188.188	iconeo.fr	1005
543	2009-07-25	82.243.188.188	iconeo.fr	1005
544	2009-07-25	82.243.188.188	iconeo.fr	1005
545	2009-07-25	82.243.188.188	iconeo.fr	1005
546	2009-07-25	82.243.188.188	iconeo.fr	1005
547	2009-07-25	82.243.188.188	iconeo.fr	1005
548	2009-07-25	82.243.188.188	iconeo.fr	1005
549	2009-07-25	82.243.188.188	iconeo.fr	1005
550	2009-07-25	82.243.188.188	iconeo.fr	1005
551	2009-07-25	82.243.188.188	iconeo.fr	1005
552	2009-07-25	82.243.188.188	iconeo.fr	1005
553	2009-07-25	82.243.188.188	iconeo.fr	1005
554	2009-07-25	82.243.188.188	iconeo.fr	1005
555	2009-07-25	82.243.188.188	iconeo.fr	1005
556	2009-07-25	82.243.188.188	iconeo.fr	1005
557	2009-07-25	82.243.188.188	iconeo.fr	1005
558	2009-07-25	82.243.188.188	iconeo.fr	1005
559	2009-07-25	82.243.188.188	iconeo.fr	1005
560	2009-07-25	82.243.188.188	iconeo.fr	1005
561	2009-07-25	82.243.188.188	iconeo.fr	1005
562	2009-07-25	82.243.188.188	iconeo.fr	1005
563	2009-07-25	82.243.188.188	iconeo.fr	1005
564	2009-07-25	82.243.188.188	iconeo.fr	1005
565	2009-07-25	82.243.188.188	iconeo.fr	1005
566	2009-07-25	82.243.188.188	iconeo.fr	1005
567	2009-07-25	82.243.188.188	iconeo.fr	1005
568	2009-07-25	82.243.188.188	iconeo.fr	1005
569	2009-07-25	82.243.188.188	iconeo.fr	1005
570	2009-07-25	82.243.188.188	iconeo.fr	1005
571	2009-07-25	82.243.188.188	iconeo.fr	1005
572	2009-07-25	82.243.188.188	iconeo.fr	1005
573	2009-07-25	82.243.188.188	iconeo.fr	1005
574	2009-07-27	88.182.21.46	iconeo.fr	1005
575	2009-07-27	88.182.21.46	iconeo.fr	1005
576	2009-07-27	88.182.21.46	iconeo.fr	1005
577	2009-07-27	88.182.21.46	iconeo.fr	1005
578	2009-07-27	88.182.21.46	iconeo.fr	1001
579	2009-07-29	88.165.57.47	iconeo.fr	1002
580	2009-07-29	88.182.21.46	iconeo.fr	1001
581	2009-07-29	88.182.21.46	iconeo.fr	1002
582	2009-07-29	82.243.188.188	iconeo.fr	1002
583	2009-07-29	88.165.57.47	iconeo.fr	1002
584	2009-07-29	88.165.57.47	iconeo.fr	1002
585	2009-07-29	88.182.21.46	iconeo.fr	1002
586	2009-07-29	88.182.21.46	iconeo.fr	1001
587	2009-07-29	88.182.21.46	iconeo.fr	1002
588	2009-07-29	88.182.21.46	iconeo.fr	1005
589	2009-07-29	82.243.188.188	iconeo.fr	1005
590	2009-07-29	82.243.188.188	iconeo.fr	1005
591	2009-07-29	82.243.188.188	iconeo.fr	1005
592	2009-07-29	82.243.188.188	iconeo.fr	1005
593	2009-07-29	82.243.188.188	iconeo.fr	1005
594	2009-07-29	82.243.188.188	iconeo.fr	1005
595	2009-07-29	82.243.188.188	iconeo.fr	1005
596	2009-07-29	82.243.188.188	iconeo.fr	1005
597	2009-07-29	82.243.188.188	iconeo.fr	1005
598	2009-07-29	82.243.188.188	iconeo.fr	1005
599	2009-07-29	82.243.188.188	iconeo.fr	1005
600	2009-07-29	88.182.21.46	iconeo.fr	1001
601	2009-08-03	82.243.188.188	iconeo.fr	1005
602	2009-08-03	82.243.188.188	iconeo.fr	1005
603	2009-08-03	82.243.188.188	iconeo.fr	1005
604	2009-08-03	82.243.188.188	iconeo.fr	1005
605	2009-08-03	82.243.188.188	iconeo.fr	1005
606	2009-08-03	82.243.188.188	iconeo.fr	1005
607	2009-08-03	82.243.188.188	iconeo.fr	1005
608	2009-08-03	82.243.188.188	iconeo.fr	1005
609	2009-08-03	82.243.188.188	iconeo.fr	1005
610	2009-08-03	82.243.188.188	iconeo.fr	1005
611	2009-08-03	82.243.188.188	iconeo.fr	1005
612	2009-08-03	82.243.188.188	iconeo.fr	1005
613	2009-08-03	82.243.188.188	iconeo.fr	1005
614	2009-08-03	82.243.188.188	iconeo.fr	1005
615	2009-08-03	82.243.188.188	iconeo.fr	1005
616	2009-08-03	82.243.188.188	iconeo.fr	1005
617	2009-08-03	82.243.188.188	iconeo.fr	1005
618	2009-08-03	82.243.188.188	iconeo.fr	1005
619	2009-08-03	82.243.188.188	iconeo.fr	1005
620	2009-08-03	82.243.188.188	iconeo.fr	1005
621	2009-08-03	82.243.188.188	iconeo.fr	1005
622	2009-08-03	82.243.188.188	iconeo.fr	1005
623	2009-08-03	82.243.188.188	iconeo.fr	1005
624	2009-08-03	82.243.188.188	iconeo.fr	1005
625	2009-08-03	82.243.188.188	iconeo.fr	1005
626	2009-08-03	82.243.188.188	iconeo.fr	1002
627	2009-08-03	82.243.188.188	iconeo.fr	1005
628	2009-08-03	82.243.188.188	iconeo.fr	1005
629	2009-08-03	82.243.188.188	iconeo.fr	1005
630	2009-08-03	82.243.188.188	iconeo.fr	1005
631	2009-08-05	88.182.21.46	iconeo.fr	1001
632	2009-08-07	88.182.21.46	iconeo.fr	1001
633	2009-08-13	88.182.21.46	iconeo.fr	1005
634	2009-08-13	82.125.205.1	iconeo.fr	1002
635	2009-08-13	82.125.205.1	iconeo.fr	1005
636	2009-08-14	88.165.57.47	iconeo.fr	1001
637	2009-08-14	88.182.21.46	iconeo.fr	1005
638	2009-08-14	88.182.21.46	iconeo.fr	1005
639	2009-08-14	88.182.21.46	iconeo.fr	1001
640	2009-08-14	88.182.21.46	iconeo.fr	1005
641	2009-08-14	88.182.21.46	iconeo.fr	1005
642	2009-08-24	83.193.183.23	iconeo.fr	1010
643	2009-08-24	83.193.183.23	iconeo.fr	1010
644	2009-08-24	83.193.183.23	iconeo.fr	1010
645	2009-08-25	83.193.183.23	iconeo.fr	1010
646	2009-08-31	88.182.21.46	iconeo.fr	1001
647	2009-08-31	82.243.188.188	iconeo.fr	1010
648	2009-08-31	88.182.21.46	iconeo.fr	1001
649	2009-08-31	82.243.188.188	iconeo.fr	1010
650	2009-08-31	82.243.188.188	iconeo.fr	1010
651	2009-08-31	82.243.188.188	iconeo.fr	1010
652	2009-08-31	82.243.188.188	iconeo.fr	1010
653	2009-08-31	88.182.21.46	iconeo.fr	1010
654	2009-08-31	82.243.188.188	iconeo.fr	1010
655	2009-08-31	82.243.188.188	iconeo.fr	1010
656	2009-08-31	82.243.188.188	iconeo.fr	1010
657	2009-08-31	88.182.21.46	iconeo.fr	1010
658	2009-08-31	82.243.188.188	iconeo.fr	1010
659	2009-08-31	82.243.188.188	iconeo.fr	1005
660	2009-08-31	82.243.188.188	iconeo.fr	1005
661	2009-08-31	82.243.188.188	iconeo.fr	1005
662	2009-08-31	82.243.188.188	iconeo.fr	1005
663	2009-09-01	88.182.21.46	iconeo.fr	1010
664	2009-09-01	82.243.188.188	iconeo.fr	1011
665	2009-09-01	88.182.21.46	iconeo.fr	1011
666	2009-09-01	88.182.21.46	iconeo.fr	1010
667	2009-09-01	88.182.21.46	iconeo.fr	1001
668	2009-09-01	88.182.21.46	iconeo.fr	1005
669	2009-09-01	88.182.21.46	iconeo.fr	1010
670	2009-09-01	88.182.21.46	iconeo.fr	1010
671	2009-09-01	88.182.21.46	iconeo.fr	1001
672	2009-09-01	88.182.21.46	iconeo.fr	1005
673	2009-09-01	88.182.21.46	iconeo.fr	1010
674	2009-09-02	88.182.21.46	iconeo.fr	1010
675	2009-09-02	82.243.188.188	iconeo.fr	1011
676	2009-09-02	88.182.21.46	iconeo.fr	1010
677	2009-09-02	82.243.188.188	iconeo.fr	1005
678	2009-09-02	82.243.188.188	iconeo.fr	1005
679	2009-09-02	82.243.188.188	iconeo.fr	1005
680	2009-09-02	88.182.21.46	iconeo.fr	1010
681	2009-09-02	88.182.21.46	iconeo.fr	1011
682	2009-09-02	82.243.188.188	iconeo.fr	1010
683	2009-09-02	82.243.188.188	iconeo.fr	1011
684	2009-09-02	82.243.188.188	iconeo.fr	1010
685	2009-09-02	82.243.188.188	iconeo.fr	1012
686	2009-09-02	82.248.81.106	iconeo.fr	1011
687	2009-09-03	88.182.21.46	iconeo.fr	1011
688	2009-09-07	88.182.21.46	iconeo.fr	1010
689	2009-09-07	88.182.21.46	iconeo.fr	1010
690	2009-09-08	82.243.188.188	iconeo.fr	1010
691	2009-09-08	88.182.21.46	iconeo.fr	1010
692	2009-09-09	89.87.221.3	iconeo.fr	1010
693	2009-09-10	88.182.21.46	iconeo.fr	1010
694	2009-09-10	88.182.21.46	iconeo.fr	1001
695	2009-09-10	88.182.21.46	iconeo.fr	1010
696	2009-09-10	88.182.21.46	iconeo.fr	1010
697	2009-09-10	88.182.21.46	iconeo.fr	1001
698	2009-09-10	88.182.21.46	iconeo.fr	1001
699	2009-09-10	88.182.21.46	iconeo.fr	1001
700	2009-09-10	88.182.21.46	iconeo.fr	1001
701	2009-09-11	88.182.21.46	iconeo.fr	1001
702	2009-09-11	82.243.188.188	iconeo.fr	1010
703	2009-09-13	89.2.218.212	iconeo.fr	1010
704	2009-09-13	89.2.218.212	iconeo.fr	1010
705	2009-09-13	88.182.21.46	iconeo.fr	1010
706	2009-09-13	88.182.21.46	iconeo.fr	1010
707	2009-09-14	82.243.188.188	iconeo.fr	1010
708	2009-09-14	88.165.57.47	iconeo.fr	1005
709	2009-09-15	89.87.221.3	iconeo.fr	1010
710	2009-09-15	82.243.188.188	iconeo.fr	1010
711	2009-09-15	89.87.221.3	iconeo.fr	1010
712	2009-09-15	89.87.221.3	iconeo.fr	1010
713	2009-09-15	89.87.221.3	iconeo.fr	1010
714	2009-09-15	89.87.221.3	iconeo.fr	1010
715	2009-09-15	89.87.221.3	iconeo.fr	1010
716	2009-09-16	85.68.141.206	iconeo.fr	1010
717	2009-09-16	85.68.141.206	iconeo.fr	1010
718	2009-09-16	85.68.141.206	iconeo.fr	1010
719	2009-09-16	85.68.141.206	iconeo.fr	1010
720	2009-09-16	85.68.141.206	iconeo.fr	1010
721	2009-09-16	88.182.21.46	iconeo.fr	1010
722	2009-09-16	85.68.141.206	iconeo.fr	1010
723	2009-09-16	88.182.21.46	iconeo.fr	1010
724	2009-09-16	88.182.21.46	iconeo.fr	1010
725	2009-09-18	88.182.21.46	iconeo.fr	1010
726	2009-09-18	88.182.21.46	iconeo.fr	1013
727	2009-09-18	88.182.21.46	iconeo.fr	1013
728	2009-09-18	88.182.21.46	iconeo.fr	1013
729	2009-09-18	88.182.21.46	iconeo.fr	1013
730	2009-09-18	88.182.21.46	iconeo.fr	1013
731	2009-09-18	88.182.21.46	iconeo.fr	1013
732	2009-09-18	88.182.21.46	iconeo.fr	1013
733	2009-09-20	85.68.141.206	iconeo.fr	1013
734	2009-09-20	85.68.141.206	iconeo.fr	1013
735	2009-09-22	85.68.141.206	iconeo.fr	1013
736	2009-09-22	85.68.141.206	iconeo.fr	1013
737	2009-09-22	88.165.57.47	iconeo.fr	1002
738	2009-09-26	88.182.21.46	iconeo.fr	1002
739	2009-09-26	202.90.92.215	iconeo.fr	1002
740	2009-09-29	80.125.173.56	iconeo.fr	1001
741	2009-09-29	89.87.221.3	iconeo.fr	1013
742	2009-09-30	88.182.21.46	iconeo.fr	1001
743	2009-10-02	89.87.221.3	iconeo.fr	1010
744	2009-10-02	88.182.21.46	iconeo.fr	1001
745	2009-10-02	88.182.21.3	iconeo.fr	1001
746	2009-10-03	88.182.21.46	iconeo.fr	1013
747	2009-10-03	89.87.221.3	iconeo.fr	1013
748	2009-10-06	80.125.173.55	iconeo.fr	1001
749	2009-10-06	80.125.173.55	iconeo.fr	1001
750	2009-10-07	88.182.21.46	iconeo.fr	1013
751	2009-10-07	89.87.221.3	iconeo.fr	1013
752	2009-10-07	82.243.188.188	iconeo.fr	1010
753	2009-10-07	89.2.218.212	iconeo.fr	1013
754	2009-10-07	89.2.218.212	iconeo.fr	1013
755	2009-10-08	88.182.21.46	iconeo.fr	1013
756	2009-10-08	88.182.21.46	iconeo.fr	1013
757	2009-10-10	88.182.21.46	ns27055.ovh.net	1013
758	2009-10-10	88.182.21.46	ns27055.ovh.net	1013
759	2009-10-10	88.182.21.46	iconeo.fr	1013
760	2009-10-10	88.182.21.46	iconeo.fr	1001
761	2009-10-10	88.182.21.46	iconeo.fr	1013
762	2009-10-12	82.243.188.188	iconeo.fr	1005
763	2009-10-12	88.182.21.46	iconeo.fr	1013
764	2009-10-12	89.87.221.3	iconeo.fr	1010
765	2009-10-12	82.243.188.188	iconeo.fr	1013
766	2009-10-12	89.2.218.212	iconeo.fr	1010
767	2009-10-12	88.182.21.46	iconeo.fr	1013
768	2009-10-13	89.87.221.3	iconeo.fr	1010
769	2009-10-13	89.87.221.3	iconeo.fr	1010
770	2009-10-13	89.87.221.3	iconeo.fr	1010
771	2009-10-13	89.87.221.3	iconeo.fr	1010
772	2009-10-14	88.182.21.46	iconeo.fr	1013
773	2009-10-14	88.182.21.46	iconeo.fr	1013
774	2009-10-14	89.87.221.3	iconeo.fr	1010
775	2009-10-14	89.87.221.3	iconeo.fr	1010
776	2009-10-14	89.87.221.3	iconeo.fr	1010
777	2009-10-17	88.182.21.46	iconeo.fr	1013
778	2009-10-19	88.182.21.46	iconeo.fr	1013
779	2009-10-20	88.182.21.46	iconeo.fr	1013
780	2009-10-21	88.182.21.46	iconeo.fr	1001
781	2009-10-21	88.182.21.46	iconeo.fr	1001
782	2009-10-23	82.66.25.60	iconeo.fr	1001
783	2009-10-25	88.182.21.46	iconeo.fr	1001
784	2009-10-26	88.182.21.46	iconeo.fr	1001
785	2009-10-27	85.68.140.184	iconeo.fr	1010
786	2009-10-27	85.68.140.184	iconeo.fr	1010
787	2009-10-27	85.68.140.184	iconeo.fr	1010
788	2009-10-27	85.68.140.184	iconeo.fr	1010
789	2009-10-27	85.68.140.184	iconeo.fr	1010
790	2009-10-27	88.182.21.46	iconeo.fr	1001
791	2009-10-28	88.182.21.46	iconeo.fr	1013
792	2009-10-30	88.182.21.46	iconeo.fr	1013
793	2009-10-31	88.182.21.46	iconeo.fr	1013
794	2009-11-04	88.182.21.46	iconeo.fr	1013
795	2009-11-04	88.182.21.46	iconeo.fr	1002
796	2009-11-05	88.182.21.46	iconeo.fr	1002
797	2009-11-07	88.182.21.46	iconeo.fr	1001
798	2009-11-10	82.243.188.188	iconeo.fr	1010
799	2009-11-10	82.243.188.188	iconeo.fr	1010
800	2009-11-10	82.243.188.188	iconeo.fr	1010
801	2009-11-10	85.68.140.184	iconeo.fr	1010
802	2009-11-10	85.68.140.184	iconeo.fr	1010
803	2009-11-11	89.87.221.3	iconeo.fr	1010
804	2009-11-11	89.87.221.3	iconeo.fr	1013
805	2009-11-12	88.182.21.46	iconeo.fr	1010
806	2009-11-12	88.182.21.46	iconeo.fr	1002
807	2009-11-13	88.182.21.46	iconeo.fr	1001
808	2009-11-15	88.165.57.47	iconeo.fr	1004
809	2009-11-16	88.165.57.47	iconeo.fr	1004
810	2009-11-16	88.165.57.47	iconeo.fr	1002
811	2009-11-18	88.182.21.46	iconeo.fr	1002
812	2009-11-18	88.182.21.46	iconeo.fr	1002
813	2009-11-22	88.182.21.46	iconeo.fr	1010
814	2009-11-23	79.83.149.235	iconeo.fr	1002
815	2009-11-23	88.165.57.47	iconeo.fr	1005
816	2009-11-23	88.165.57.47	iconeo.fr	1005
817	2009-11-25	82.243.188.188	iconeo.fr	1013
818	2009-11-25	82.243.188.188	iconeo.fr	1013
819	2009-11-28	88.182.21.46	iconeo.fr	1001
820	2009-11-28	203.185.179.89	iconeo.fr	1001
821	2009-11-28	123.50.76.30	iconeo.fr	1001
822	2009-12-01	88.182.21.46	iconeo.fr	1001
823	2009-12-04	86.201.136.61	iconeo.fr	1001
824	2009-12-04	86.201.136.61	iconeo.fr	1010
825	2009-12-04	88.182.21.46	iconeo.fr	1001
826	2009-12-05	88.182.21.46	iconeo.fr	1001
827	2009-12-08	88.182.21.46	iconeo.fr	1001
828	2009-12-08	88.182.21.46	iconeo.fr	1013
829	2009-12-08	88.182.21.46	iconeo.fr	1013
830	2009-12-09	212.194.89.214	iconeo.fr	1002
831	2009-12-10	89.87.221.3	iconeo.fr	1013
832	2009-12-10	89.87.221.3	iconeo.fr	1013
833	2009-12-10	89.87.221.3	iconeo.fr	1013
834	2009-12-10	89.87.221.3	iconeo.fr	1013
835	2009-12-11	89.87.221.3	iconeo.fr	1013
836	2009-12-11	88.182.21.46	iconeo.fr	1013
837	2009-12-11	88.182.21.46	iconeo.fr	1013
838	2009-12-11	89.87.221.3	iconeo.fr	1013
839	2009-12-11	88.182.21.46	iconeo.fr	1013
840	2009-12-11	82.243.188.188	iconeo.fr	1013
841	2009-12-14	88.182.21.46	iconeo.fr	1013
842	2009-12-14	88.182.21.46	iconeo.fr	1001
843	2009-12-14	88.182.21.46	iconeo.fr	1002
844	2009-12-14	88.182.21.46	iconeo.fr	1001
845	2009-12-14	82.243.188.188	iconeo.fr	1001
846	2009-12-15	88.182.21.46	iconeo.fr	1001
847	2009-12-16	89.87.221.3	iconeo.fr	1013
848	2009-12-21	88.182.21.46	iconeo.fr	1001
849	2009-12-21	88.182.21.46	iconeo.fr	1002
850	2009-12-21	88.182.21.46	iconeo.fr	1005
851	2010-01-04	85.68.140.184	iconeo.fr	1010
852	2010-01-13	88.182.21.46	iconeo.fr	1001
853	2010-01-13	88.182.21.46	iconeo.fr	1001
854	2010-01-13	88.182.21.46	iconeo.fr	1010
855	2010-01-13	88.182.21.46	iconeo.fr	1001
856	2010-01-13	88.182.21.46	iconeo.fr	1001
857	2010-01-13	89.87.221.3	iconeo.fr	1013
858	2010-01-13	89.87.221.3	iconeo.fr	1013
859	2010-01-15	80.125.173.56	iconeo.fr	1001
860	2010-01-16	88.182.21.3	iconeo.fr	1001
861	2010-01-16	88.182.21.3	iconeo.fr	1005
862	2010-01-16	88.182.21.3	iconeo.fr	1005
863	2010-01-16	88.182.21.3	iconeo.fr	1005
864	2010-01-16	88.182.21.3	iconeo.fr	1013
865	2010-01-18	88.182.21.46	iconeo.fr	1005
866	2010-01-20	82.248.103.115	iconeo.fr	1005
867	2010-01-20	82.248.103.115	iconeo.fr	1005
868	2010-01-20	82.248.103.115	iconeo.fr	1005
869	2010-01-22	82.243.188.188	iconeo.fr	1015
870	2010-01-22	92.136.8.138	iconeo.fr	1015
871	2010-01-26	79.90.44.179	iconeo.fr	1001
872	2010-01-28	80.13.74.194	iconeo.fr	1001
873	2010-01-28	86.201.13.240	iconeo.fr	1001
874	2010-02-01	80.125.173.56	iconeo.fr	1001
875	2010-02-01	80.125.173.56	iconeo.fr	1005
876	2010-02-01	80.125.173.56	iconeo.fr	1005
877	2010-02-01	80.125.173.56	iconeo.fr	1005
878	2010-02-01	80.125.173.56	iconeo.fr	1005
879	2010-02-01	80.125.173.56	iconeo.fr	1005
880	2010-02-01	80.125.173.56	iconeo.fr	1005
881	2010-02-01	80.125.173.56	iconeo.fr	1005
882	2010-02-01	82.243.188.188	iconeo.fr	1015
883	2010-02-02	81.50.125.97	iconeo.fr	1005
884	2010-02-04	80.125.173.56	iconeo.fr	1001
885	2010-02-04	88.182.21.48	iconeo.fr	1005
886	2010-02-06	88.182.21.46	iconeo.fr	1005
887	2010-02-08	88.182.21.46	iconeo.fr	1005
888	2010-02-08	88.182.21.46	iconeo.fr	1005
889	2010-02-08	88.182.21.46	iconeo.fr	1005
890	2010-02-08	88.182.21.46	iconeo.fr	1005
891	2010-02-11	90.50.47.177	iconeo.fr	1005
892	2010-02-11	80.125.172.58	iconeo.fr	1005
893	2010-02-11	80.125.173.59	iconeo.fr	1005
894	2010-02-11	80.125.173.59	iconeo.fr	1005
895	2010-02-12	88.182.21.46	iconeo.fr	1005
896	2010-02-12	88.182.21.46	iconeo.fr	1005
897	2010-02-12	88.182.21.46	iconeo.fr	1005
898	2010-02-16	82.230.74.174	iconeo.fr	1005
899	2010-02-16	85.68.140.184	iconeo.fr	1010
900	2010-02-16	85.68.140.184	iconeo.fr	1010
901	2010-02-17	82.243.188.188	iconeo.fr	1015
902	2010-02-19	92.129.208.158	iconeo.fr	1005
903	2010-02-19	88.182.21.3	iconeo.fr	1005
904	2010-02-23	90.50.56.169	iconeo.fr	1005
905	2010-02-24	217.128.232.153	iconeo.fr	1005
906	2010-02-24	82.243.188.188	iconeo.fr	1015
907	2010-02-24	217.128.232.153	iconeo.fr	1005
908	2010-02-25	88.182.21.46	iconeo.fr	1005
909	2010-02-25	88.182.21.46	iconeo.fr	1005
910	2010-02-25	88.182.21.46	iconeo.fr	1005
911	2010-03-01	82.243.188.188	iconeo.fr	1015
912	2010-03-01	82.243.188.188	iconeo.fr	1001
913	2010-03-01	82.243.188.188	iconeo.fr	1001
914	2010-03-01	82.243.188.188	iconeo.fr	1001
915	2010-03-01	82.243.188.188	iconeo.fr	1001
916	2010-03-01	88.182.21.46	iconeo.fr	1005
917	2010-03-01	88.182.21.46	iconeo.fr	1001
918	2010-03-02	88.182.21.46	iconeo.fr	1001
919	2010-03-02	82.243.188.188	iconeo.fr	1001
920	2010-03-02	82.243.188.188	iconeo.fr	1001
921	2010-03-03	82.243.188.188	iconeo.fr	1001
922	2010-03-03	82.243.188.188	iconeo.fr	1001
923	2010-03-03	88.182.21.46	iconeo.fr	1001
924	2010-03-03	88.182.21.46	iconeo.fr	1001
925	2010-03-03	88.182.21.46	iconeo.fr	1010
926	2010-03-03	88.182.21.46	iconeo.fr	1001
927	2010-03-03	82.243.188.188	iconeo.fr	1001
928	2010-03-03	82.243.188.188	iconeo.fr	1001
929	2010-03-03	88.182.21.46	iconeo.fr	1005
930	2010-03-03	88.182.21.46	iconeo.fr	1005
931	2010-03-03	82.243.188.188	iconeo.fr	1016
932	2010-03-04	88.182.21.46	iconeo.fr	1016
933	2010-03-04	82.243.188.188	iconeo.fr	1016
934	2010-03-04	88.182.21.46	iconeo.fr	1016
935	2010-03-04	82.243.188.188	iconeo.fr	1016
936	2010-03-04	82.243.188.188	iconeo.fr	1016
937	2010-03-04	82.243.188.188	iconeo.fr	1001
938	2010-03-04	194.51.20.123	iconeo.fr	1001
939	2010-03-04	194.51.20.123	iconeo.fr	1001
940	2010-03-04	194.51.20.123	iconeo.fr	1001
941	2010-03-04	92.134.139.14	iconeo.fr	1016
942	2010-03-04	88.182.21.3	iconeo.fr	1016
943	2010-03-05	88.182.21.46	iconeo.fr	1016
944	2010-03-05	88.182.21.46	iconeo.fr	1016
945	2010-03-05	88.182.21.46	iconeo.fr	1001
946	2010-03-09	82.227.200.49	iconeo.fr	1009
947	2010-03-09	82.227.200.49	iconeo.fr	1001
948	2010-03-10	88.182.21.46	iconeo.fr	1001
949	2010-03-10	80.125.172.73	iconeo.fr	1005
950	2010-03-11	92.129.139.224	iconeo.fr	1016
951	2010-03-11	88.182.21.46	iconeo.fr	1016
952	2010-03-12	92.136.23.123	iconeo.fr	1016
953	2010-03-12	92.136.23.123	iconeo.fr	1016
954	2010-03-12	88.182.21.46	iconeo.fr	1016
955	2010-03-12	88.182.21.46	iconeo.fr	1001
956	2010-03-12	82.243.188.188	iconeo.fr	1016
957	2010-03-12	82.243.188.188	iconeo.fr	1016
958	2010-03-12	82.243.188.188	iconeo.fr	1016
959	2010-03-12	82.243.188.188	iconeo.fr	1016
960	2010-03-12	82.243.188.188	iconeo.fr	1016
961	2010-03-12	82.243.188.188	iconeo.fr	1016
962	2010-03-12	92.129.192.45	iconeo.fr	1016
963	2010-03-12	82.243.188.188	iconeo.fr	1016
964	2010-03-12	88.182.21.3	iconeo.fr	1016
965	2010-03-12	82.243.188.188	iconeo.fr	1016
966	2010-03-12	82.243.188.188	iconeo.fr	1001
967	2010-03-13	88.182.21.3	iconeo.fr	1016
968	2010-03-15	82.243.188.188	iconeo.fr	1016
969	2010-03-15	80.125.173.56	iconeo.fr	1016
970	2010-03-15	80.125.173.56	iconeo.fr	1016
971	2010-03-15	82.243.188.188	iconeo.fr	1016
972	2010-03-15	90.30.132.127	iconeo.fr	1005
973	2010-03-15	90.30.132.127	iconeo.fr	1016
974	2010-03-15	82.243.188.188	iconeo.fr	1001
975	2010-03-16	88.182.21.46	iconeo.fr	1005
976	2010-03-16	88.182.21.46	iconeo.fr	1001
977	2010-03-16	82.243.188.188	iconeo.fr	1001
978	2010-03-16	82.243.188.188	iconeo.fr	1001
979	2010-03-16	82.243.188.188	iconeo.fr	1001
980	2010-03-16	82.243.188.188	iconeo.fr	1001
981	2010-03-16	82.243.188.188	iconeo.fr	1001
982	2010-03-16	82.243.188.188	iconeo.fr	1001
983	2010-03-16	92.129.200.250	iconeo.fr	1016
984	2010-03-16	92.129.200.250	iconeo.fr	1016
985	2010-03-16	92.129.200.250	iconeo.fr	1016
986	2010-03-17	83.203.19.83	iconeo.fr	1009
987	2010-03-19	86.213.96.82	iconeo.fr	1005
988	2010-03-19	88.182.21.46	iconeo.fr	1005
989	2010-03-19	88.182.21.46	iconeo.fr	1005
990	2010-03-19	80.125.173.72	iconeo.fr	1016
991	2010-03-20	88.182.21.3	iconeo.fr	1016
992	2010-03-20	88.182.21.3	iconeo.fr	1001
993	2010-03-22	88.182.21.46	iconeo.fr	1016
994	2010-03-22	88.182.21.46	iconeo.fr	1001
995	2010-03-22	88.182.21.46	iconeo.fr	1001
996	2010-03-22	88.182.21.46	iconeo.fr	1001
997	2010-03-22	88.182.21.46	iconeo.fr	1001
998	2010-03-22	82.243.188.188	iconeo.fr	1005
999	2010-03-22	82.243.188.188	iconeo.fr	1005
1000	2010-03-22	82.243.188.188	iconeo.fr	1005
1001	2010-03-22	82.243.188.188	iconeo.fr	1016
1002	2010-03-22	88.182.21.46	iconeo.fr	1001
1003	2010-03-24	88.182.21.46	iconeo.fr	1001
1004	2010-03-24	82.243.188.188	iconeo.fr	1016
1005	2010-03-24	82.243.188.188	iconeo.fr	1005
1006	2010-03-24	82.243.188.188	iconeo.fr	1005
1007	2010-03-24	82.243.188.188	iconeo.fr	1005
1008	2010-03-24	82.243.188.188	iconeo.fr	1005
1009	2010-03-24	88.182.21.46	iconeo.fr	1001
1010	2010-03-25	88.182.21.46	iconeo.fr	1001
1011	2010-03-26	88.182.21.46	iconeo.fr	1005
1012	2010-03-26	88.182.21.46	iconeo.fr	1016
1013	2010-03-27	90.11.150.83	iconeo.fr	1009
1014	2010-04-01	86.217.197.79	iconeo.fr	1005
1015	2010-04-02	88.182.21.46	iconeo.fr	1005
1016	2010-04-03	88.182.21.46	iconeo.fr	1001
1017	2010-04-03	88.182.21.46	iconeo.fr	1005
1018	2010-04-15	82.243.188.188	iconeo.fr	1001
1019	2010-04-15	82.243.188.188	iconeo.fr	1001
1020	2010-04-15	82.243.188.188	iconeo.fr	1001
1021	2010-04-16	82.243.188.188	iconeo.fr	1001
1022	2010-04-16	82.243.188.188	iconeo.fr	1001
1023	2010-04-19	82.243.188.188	iconeo.fr	1001
1024	2010-04-19	82.243.188.188	iconeo.fr	1001
1025	2010-04-19	82.243.188.188	iconeo.fr	1001
1026	2010-04-19	82.243.188.188	iconeo.fr	1001
1027	2010-04-19	82.243.188.188	iconeo.fr	1001
1028	2010-04-20	82.243.188.188	iconeo.fr	1001
1029	2010-04-20	82.243.188.188	iconeo.fr	1001
1030	2010-04-20	82.243.188.188	iconeo.fr	1001
1031	2010-04-20	82.243.188.188	iconeo.fr	1001
1032	2010-04-21	82.243.188.188	iconeo.fr	1001
1033	2010-04-21	85.68.140.184	iconeo.fr	1010
1034	2010-04-21	85.68.140.184	iconeo.fr	1010
1035	2010-04-21	85.68.140.184	iconeo.fr	1010
1036	2010-04-21	85.68.140.184	iconeo.fr	1010
1037	2010-04-21	85.68.140.184	iconeo.fr	1010
1038	2010-04-21	82.243.188.188	iconeo.fr	1001
1039	2010-04-21	82.243.188.188	iconeo.fr	1001
1040	2010-04-21	82.243.188.188	iconeo.fr	1001
1041	2010-04-21	82.243.188.188	iconeo.fr	1001
1042	2010-04-21	82.243.188.188	iconeo.fr	1001
1043	2010-04-23	88.182.21.46	iconeo.fr	1001
1044	2010-04-23	82.243.188.188	iconeo.fr	1001
1045	2010-04-23	82.243.188.188	iconeo.fr	1001
1046	2010-04-23	82.243.188.188	iconeo.fr	1016
1047	2010-04-23	88.182.21.46	iconeo.fr	1016
1048	2010-04-23	88.182.21.46	iconeo.fr	1016
1049	2010-04-23	88.182.21.46	iconeo.fr	1016
1050	2010-04-26	80.125.172.73	iconeo.fr	1016
1051	2010-04-28	86.201.235.186	iconeo.fr	1016
1052	2010-05-04	82.243.188.188	iconeo.fr	1001
1053	2010-05-05	88.182.21.46	iconeo.fr	1016
1054	2010-05-05	88.182.21.46	iconeo.fr	1016
1055	2010-05-12	82.243.188.188	iconeo.fr	1001
1056	2010-05-13	88.182.21.46	iconeo.fr	1016
1057	2010-05-17	82.243.188.188	iconeo.fr	1001
1058	2010-05-17	87.100.54.50	iconeo.fr	1001
1059	2010-05-17	82.243.188.188	iconeo.fr	1001
1060	2010-05-18	88.182.21.46	iconeo.fr	1016
1061	2010-05-18	88.182.21.46	iconeo.fr	1016
1062	2010-05-18	88.182.21.46	iconeo.fr	1016
1063	2010-05-18	88.182.21.46	iconeo.fr	1016
1064	2010-05-18	88.182.21.46	iconeo.fr	1016
1065	2010-05-18	88.182.21.46	iconeo.fr	1016
1066	2010-05-19	82.243.188.188	iconeo.fr	1016
1067	2010-05-19	88.182.21.46	iconeo.fr	1016
1068	2010-05-19	86.201.161.241	iconeo.fr	1001
1069	2010-05-19	82.243.188.188	iconeo.fr	1016
1070	2010-05-19	82.243.188.188	iconeo.fr	1016
1071	2010-05-20	82.243.188.188	iconeo.fr	1016
1072	2010-05-20	82.243.188.188	iconeo.fr	1016
1073	2010-05-20	82.243.188.188	iconeo.fr	1016
1074	2010-05-20	82.243.188.188	iconeo.fr	1016
1075	2010-05-26	88.182.21.46	iconeo.fr	1016
1076	2010-05-29	88.182.21.46	iconeo.fr	1016
1077	2010-06-10	89.2.143.217	iconeo.fr	1010
1078	2010-06-13	88.182.21.46	iconeo.fr	1016
1079	2010-06-23	82.243.188.188	iconeo.fr	1016
1080	2010-07-07	82.245.81.137	iconeo.fr	1001
1081	2010-07-12	89.2.143.217	iconeo.fr	1010
1082	2010-07-13	84.97.12.230	iconeo.fr	1010
1083	2010-07-30	80.13.22.90	iconeo.fr	1001
1084	2010-07-31	79.86.59.61	iconeo.fr	1013
1085	2010-07-31	79.86.16.22	iconeo.fr	1013
1086	2010-07-31	79.86.16.22	iconeo.fr	1013
1087	2010-07-31	79.86.16.22	iconeo.fr	1013
1088	2010-07-31	79.86.16.22	iconeo.fr	1013
1089	2010-07-31	79.86.16.22	iconeo.fr	1013
1090	2010-07-31	79.86.16.22	iconeo.fr	1013
1091	2010-07-31	79.86.16.22	iconeo.fr	1013
1092	2010-07-31	79.86.16.22	iconeo.fr	1013
1093	2010-07-31	79.86.16.22	iconeo.fr	1013
1094	2010-07-31	79.86.16.22	iconeo.fr	1013
1095	2010-07-31	79.86.16.22	iconeo.fr	1013
1096	2010-07-31	79.86.16.22	iconeo.fr	1013
1097	2010-07-31	79.86.16.22	iconeo.fr	1013
1098	2010-07-31	79.86.16.22	iconeo.fr	1013
1099	2010-07-31	79.86.16.22	iconeo.fr	1013
1100	2010-07-31	79.86.16.22	iconeo.fr	1013
1101	2010-07-31	79.86.16.22	iconeo.fr	1013
1102	2010-07-31	79.86.16.22	iconeo.fr	1013
1103	2010-07-31	79.86.16.22	iconeo.fr	1013
1104	2010-07-31	79.86.16.22	iconeo.fr	1013
1105	2010-08-05	82.243.188.188	iconeo.fr	1016
1106	2010-08-05	92.134.15.217	iconeo.fr	1016
1107	2010-08-08	88.182.21.208	iconeo.fr	1016
1108	2010-08-25	82.138.94.33	iconeo.fr	1001
1109	2010-09-07	82.243.39.223	iconeo.fr	1016
1110	2010-09-07	82.243.39.223	iconeo.fr	1016
1111	2010-09-08	88.182.21.208	iconeo.fr	1016
1112	2010-10-01	92.146.145.121	iconeo.fr	1016
1113	2010-10-01	92.136.7.139	iconeo.fr	1016
1114	2010-10-01	82.138.94.34	iconeo.fr	1001
1115	2010-10-01	92.134.15.70	iconeo.fr	1016
1116	2010-10-06	92.129.213.179	iconeo.fr	1016
1117	2010-10-15	84.97.10.109	iconeo.fr	1013
1118	2010-10-15	84.97.10.109	iconeo.fr	1013
1119	2010-10-15	84.97.10.109	iconeo.fr	1013
1120	2010-10-15	84.97.10.109	iconeo.fr	1013
1121	2010-10-19	82.138.94.34	iconeo.fr	1001
1122	2010-10-19	82.138.94.34	iconeo.fr	1001
1123	2010-11-08	82.138.94.34	iconeo.fr	1001
1124	2010-11-08	82.138.94.34	iconeo.fr	1001
1125	2010-11-08	82.138.94.34	iconeo.fr	1001
1126	2010-11-08	82.138.94.34	iconeo.fr	1001
1128	2010-11-09	78.123.186.113	iconeo.fr	1013
1127	2010-11-09	78.123.186.113	iconeo.fr	1013
1129	2010-11-09	78.123.186.113	iconeo.fr	1013
1130	2010-11-09	78.123.186.113	iconeo.fr	1013
1131	2010-11-09	78.123.186.113	iconeo.fr	1013
1132	2010-11-09	78.123.186.113	iconeo.fr	1013
1133	2010-11-09	78.123.186.113	iconeo.fr	1013
1134	2010-11-15	92.136.3.183	iconeo.fr	1016
1135	2010-11-16	92.129.192.247	iconeo.fr	1016
1136	2010-11-16	82.138.94.34	iconeo.fr	1016
1137	2010-11-16	82.138.94.34	iconeo.fr	1016
1138	2010-11-16	92.129.192.247	iconeo.fr	1016
1139	2010-11-16	92.129.199.149	iconeo.fr	1016
1140	2010-11-17	82.138.94.34	iconeo.fr	1001
1141	2010-11-17	82.138.94.34	iconeo.fr	1001
1142	2010-11-17	82.138.94.34	iconeo.fr	1001
1143	2010-11-17	82.138.94.34	iconeo.fr	1001
1144	2010-11-18	92.134.21.33	iconeo.fr	1016
1145	2010-11-18	82.138.94.34	iconeo.fr	1001
1146	2010-11-29	82.138.94.34	iconeo.fr	1001
1147	2010-12-02	193.110.109.30	iconeo.fr	1001
1148	2011-01-03	92.162.169.217	iconeo.fr	1016
1149	2011-01-03	92.162.169.217	iconeo.fr	1016
1150	2011-01-18	85.69.120.2	iconeo.fr	1010
1151	2011-02-01	92.162.94.52	iconeo.fr	1016
1152	2011-02-10	82.138.94.33	iconeo.fr	1001
1153	2011-02-14	92.162.201.65	iconeo.fr	1016
1154	2011-02-16	77.205.181.154	iconeo.fr	1013
1155	2011-02-16	77.205.181.154	iconeo.fr	1013
1156	2011-02-16	77.205.181.154	iconeo.fr	1013
1157	2011-02-21	193.110.109.30	iconeo.fr	1001
1158	2011-02-21	193.110.109.30	iconeo.fr	1016
1159	2011-02-28	193.110.109.30	iconeo.fr	1001
1160	2011-02-28	193.110.109.30	iconeo.fr	1001
1161	2011-02-28	193.110.109.30	iconeo.fr	1001
1162	2011-03-03	193.110.109.30	iconeo.fr	1001
1163	2011-03-08	78.112.202.229	iconeo.fr	1013
1164	2011-03-08	78.112.202.229	iconeo.fr	1013
1165	2011-03-20	88.182.21.208	iconeo.fr	1016
1166	2011-03-21	193.110.109.30	iconeo.fr	1001
1167	2011-04-07	193.110.109.30	iconeo.fr	1001
1168	2011-04-21	92.162.52.100	iconeo.fr	1016
1169	2011-04-22	78.127.202.24	iconeo.fr	1013
1170	2011-05-09	85.69.120.2	iconeo.fr	1010
1171	2011-05-09	85.69.120.2	iconeo.fr	1010
1172	2011-05-22	82.243.188.188	iconeo.fr	1018
1173	2011-05-22	82.243.188.188	iconeo.fr	1018
1174	2011-05-22	82.243.188.188	iconeo.fr	1018
1175	2011-05-24	82.243.188.188	iconeo.fr	1018
1176	2011-05-30	85.69.236.67	iconeo.fr	1010
1177	2011-06-11	88.182.21.3	iconeo.fr	1018
1178	2011-06-13	88.182.21.208	iconeo.fr	1018
1179	2011-06-14	78.127.23.172	iconeo.fr	1016
1180	2011-06-14	82.138.94.33	iconeo.fr	1018
1181	2011-07-01	82.138.94.33	iconeo.fr	1001
1182	2011-07-01	82.138.94.33	iconeo.fr	1018
1183	2011-08-31	109.12.84.53	iconeo.fr	1013
1184	2011-08-31	109.12.84.53	iconeo.fr	1013
1185	2011-09-05	109.12.233.61	iconeo.fr	1016
1186	2011-09-12	78.112.205.87	iconeo.fr	1016
1187	2011-09-12	78.112.205.87	iconeo.fr	1016
1188	2011-09-12	88.182.21.208	iconeo.fr	1016
1189	2011-09-12	88.182.21.208	iconeo.fr	1016
1190	2011-09-13	82.138.94.33	iconeo.fr	1018
1191	2011-09-26	88.162.168.164	iconeo.fr	1020
1192	2011-09-26	88.162.168.164	iconeo.fr	1020
1193	2011-09-28	80.214.1.29	iconeo.fr	1020
1194	2011-10-12	109.10.36.33	iconeo.fr	1016
1195	2011-11-04	82.138.94.33	iconeo.fr	1016
1196	2011-11-07	109.10.44.245	iconeo.fr	1013
1197	2011-11-21	85.69.247.25	iconeo.fr	1010
1198	2011-12-28	82.138.94.33	iconeo.fr	1016
1199	2012-01-20	109.2.117.76	iconeo.fr	1016
1200	2012-01-20	109.2.117.76	iconeo.fr	1016
1201	2012-01-25	85.171.32.80	iconeo.fr	1010
1202	2012-01-25	85.171.32.80	iconeo.fr	1010
1203	2012-01-25	85.171.32.80	iconeo.fr	1010
1204	2012-01-25	85.171.32.80	iconeo.fr	1010
1205	2012-01-25	85.171.32.80	iconeo.fr	1010
1206	2012-02-22	85.69.247.25	iconeo.fr	1010
1207	2012-02-22	85.69.247.25	iconeo.fr	1010
1208	2012-02-24	88.182.21.208	iconeo.fr	1010
1209	2012-03-05	109.2.117.76	iconeo.fr	1016
1210	2012-03-05	109.2.117.76	iconeo.fr	1016
1211	2012-03-28	88.162.168.164	iconeo.fr	1018
1212	2012-04-09	88.162.168.164	iconeo.fr	1018
1213	2012-05-09	82.138.94.33	iconeo.fr	1001
1214	2012-06-23	78.127.19.250	iconeo.fr	1013
1215	2012-06-23	78.127.19.250	iconeo.fr	1010
1216	2012-06-24	85.170.216.149	iconeo.fr	1010
1217	2012-06-24	85.170.216.149	iconeo.fr	1010
1218	2012-06-24	85.170.216.149	iconeo.fr	1010
1219	2012-06-24	85.170.216.149	iconeo.fr	1013
1220	2012-06-25	82.138.94.33	iconeo.fr	1010
1221	2012-06-25	82.138.94.33	iconeo.fr	1013
1222	2012-07-03	85.171.30.131	iconeo.fr	1010
1223	2012-07-03	85.171.30.131	iconeo.fr	1010
1224	2012-07-03	85.171.30.131	iconeo.fr	1010
1225	2012-07-03	85.171.30.131	iconeo.fr	1010
1226	2012-07-03	85.171.30.131	iconeo.fr	1010
1227	2012-07-03	85.171.30.131	iconeo.fr	1010
1228	2012-07-03	85.171.30.131	iconeo.fr	1010
1230	2012-07-03	85.171.30.131	iconeo.fr	1010
1229	2012-07-03	85.171.30.131	iconeo.fr	1010
1231	2012-07-03	85.171.30.131	iconeo.fr	1010
1246	2012-07-05	85.171.33.253	iconeo.fr	1010
1247	2012-07-05	85.171.33.253	iconeo.fr	1010
1255	2012-07-05	193.110.109.30	iconeo.fr	1010
1259	2012-08-09	193.110.109.30	iconeo.fr	1001
1263	2012-10-27	88.182.21.3	iconeo.fr	1010
1232	2012-07-03	85.171.30.131	iconeo.fr	1010
1234	2012-07-03	85.171.30.131	iconeo.fr	1010
1239	2012-07-05	85.171.33.253	iconeo.fr	1010
1248	2012-07-05	85.171.33.253	iconeo.fr	1010
1256	2012-07-07	1.21.18.162	iconeo.fr	1010
1260	2012-08-27	85.69.247.25	iconeo.fr	1010
1264	2012-10-27	88.182.21.3	iconeo.fr	1013
1233	2012-07-03	85.171.30.131	iconeo.fr	1010
1235	2012-07-03	85.171.30.131	iconeo.fr	1010
1240	2012-07-05	85.171.33.253	iconeo.fr	1010
1241	2012-07-05	85.171.33.253	iconeo.fr	1010
1249	2012-07-05	85.171.33.253	iconeo.fr	1010
1250	2012-07-05	85.171.33.253	iconeo.fr	1010
1252	2012-07-05	85.171.33.253	iconeo.fr	1010
1253	2012-07-05	85.171.33.253	iconeo.fr	1010
1254	2012-07-05	85.171.33.253	iconeo.fr	1010
1257	2012-07-07	1.21.18.162	iconeo.fr	1010
1261	2012-09-12	193.110.109.30	iconeo.fr	1001
1236	2012-07-03	85.171.30.131	iconeo.fr	1010
1237	2012-07-03	85.171.30.131	iconeo.fr	1010
1238	2012-07-03	85.171.30.131	iconeo.fr	1010
1242	2012-07-05	85.171.33.253	iconeo.fr	1010
1243	2012-07-05	85.171.33.253	iconeo.fr	1010
1244	2012-07-05	85.171.33.253	iconeo.fr	1010
1245	2012-07-05	85.171.33.253	iconeo.fr	1010
1251	2012-07-05	85.171.33.253	iconeo.fr	1010
1258	2012-07-10	1.21.18.162	iconeo.fr	1010
1262	2012-09-12	193.110.109.30	iconeo.fr	1001
1265	2012-12-12	82.138.94.33	iconeo.fr	1001
1266	2012-12-26	82.138.94.33	iconeo.fr	1013
1267	2013-05-11	88.182.21.208	iconeo.fr	1001
1268	2013-05-11	88.182.21.208	iconeo.fr	1001
1269	2013-05-11	88.182.21.208	iconeo.fr	1001
1270	2013-05-11	88.182.21.208	iconeo.fr	1001
1271	2013-05-11	88.182.21.208	iconeo.fr	1001
1272	2013-05-11	88.182.21.208	iconeo.fr	1001
1273	2013-05-11	88.182.21.208	iconeo.fr	1001
1274	2013-08-07	81.65.158.9	iconeo.fr	1010
1275	2013-08-07	81.65.158.9	iconeo.fr	1010
1276	2013-08-07	81.65.158.9	iconeo.fr	1010
1277	2013-08-07	81.65.158.9	iconeo.fr	1010
1278	2013-08-07	81.65.158.9	iconeo.fr	1010
1279	2013-08-07	81.65.158.9	iconeo.fr	1010
1280	2013-08-07	81.65.158.9	iconeo.fr	1010
1281	2013-08-07	81.65.158.9	iconeo.fr	1010
1282	2013-11-01	88.182.21.208	iconeo.fr	1001
1283	2013-11-10	88.182.21.208	iconeo.fr	1010
1284	2013-12-06	88.182.21.208	iconeo.fr	1018
1285	2013-12-08	80.236.92.58	iconeo.fr	1010
1286	2013-12-08	80.236.92.58	iconeo.fr	1010
1287	2013-12-08	80.236.92.58	iconeo.fr	1010
1288	2014-02-05	109.26.232.114	iconeo.fr	1001
1289	2014-02-14	109.26.232.114	iconeo.fr	1001
1290	2014-04-01	109.26.232.114	iconeo.fr	1018
1291	2014-04-01	109.26.232.114	iconeo.fr	1018
1292	2014-04-01	109.26.232.114	iconeo.fr	1018
1293	2014-04-02	109.26.232.114	iconeo.fr	1018
1294	2014-05-02	109.26.232.114	iconeo.fr	1018
1295	2014-06-10	78.240.44.45	iconeo.fr	1018
1296	2014-07-16	88.182.22.18	iconeo.fr	1001
1297	2014-07-22	88.182.22.18	iconeo.fr	1001
1298	2014-10-21	88.182.22.18	iconeo.fr	1001
1299	2014-11-11	88.182.22.18	iconeo.fr	1001
\.


--
-- Data for Name: metier; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY metier (id, date_creation, libelle) FROM stdin;
1002	2008-12-04	fr=Coiffure\nes=Capillador\nen=Hairdresser
1001	2008-12-04	fr=Esthétique\nes=florador\nen=flower shop
1003	2009-04-18	fr=Fleurs\r\nes=Floras\r\nen=Flowers
1000	2008-07-11	fr=immobilier\nes=panadería\nen=bakery
1006	2009-08-24	fr=Tatouage\r\nes=Tattoo\r\nen=Tattoo
1005	2009-04-20	fr=thalasso\r\nes=thalassa\r\nen=thalassu
1008	2010-01-22	fr=Viticulture\r\nes=Viticulture\r\nen=Viticulture\r\n
1007	2009-09-18	fr=Piercing\r\nes=Piercing\r\nen=Piercing
1009	2010-01-22	fr=Viticulture\r\nes=Viticulture\r\nen=Viticulture\r\n
1010	2011-05-22	fr=salle de sport\r\nes=salle de sport\r\nen=salle de sport
\.


--
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY pays (id, date_creation, code, libelle) FROM stdin;
1	2008-07-11	fr	France
\.


--
-- Data for Name: scenario; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY scenario (id, date_creation, libelle, utilisateur_id, type) FROM stdin;
1000	2009-05-12	Scenario Site	1009	SITE
1117	2010-03-03	Ecran 3	1016	STAN
1118	2010-03-03	Page Accueil Site	1016	SITE
1057	2009-04-18	Scenario site	1007	SITE
1053	2009-04-05	after coiffure	1002	STAN
1015	2009-01-26	Scenario Site	1002	SITE
1116	2010-03-03	ecran droite	1016	STAN
1068	2009-05-05	comptoir	1007	STAN
1115	2010-03-03	ecran gche : chateau	1016	STAN
1082	2009-05-18	biophase	1002	STAN
1136	2011-05-24	Velo	1018	STAN
1044	2009-03-18	optique2	1001	STAN
1077	2009-05-11	optique rive droite	1005	STAN
1076	2009-05-11	after coiffure	1005	STAN
1099	2009-10-07	TC1	1013	STAN
1051	2009-03-25	Comptoir	1003	STAN
1075	2009-05-08	Gouttebroze Fleurs	1007	STAN
1144	2012-03-28	CXWORX	1018	STAN
1001	2009-05-11	Scenario Site	1005	SITE
1034	2009-02-25	accueil negoce	1001	STAN
1096	2009-09-10	boutique	1001	STAN
1081	2009-05-12	test	1001	STAN
1102	2009-11-25	madison site	1013	SITE
1058	2009-04-20	atlanthal	1002	STAN
1032	2009-02-18	Scenario promo	1001	STAN
1138	2011-05-24	Fitness	1018	STAN
1014	2008-12-15	Scénario vitrine	1001	STAN
1090	2009-07-17	Bijoux	1005	STAN
1033	2009-02-19	millesima	1001	STAN
1047	2009-03-23	José	1001	STAN
1111	2010-02-11	st valentin	1005	STAN
1109	2010-01-20	marc	1005	STAN
1120	2010-03-04		1001	STAN
1122	2010-03-16	vitrine	1016	STAN
1041	2009-03-17	seigneurie gauthier	1001	STAN
1135	2011-05-24	Vestiaire	1018	STAN
1073	2009-05-06	test	1004	STAN
1031	2009-02-16	MAYEKAWA 2	1001	STAN
1080	2009-05-12	xav	1009	STAN
1139	2011-05-24	Cardio	1018	STAN
1040	2009-03-17	optique rive droite	1001	STAN
1126	2011-05-22	New Accueil	1018	STAN
1030	2009-02-16	MAYEKAWA 1	1001	STAN
1003	2009-05-19	Scenario Site	1003	SITE
1037	2009-03-09	Hamdas Test Unit	1001	STAN
1095	2009-09-01	Mon premier scénario	1011	STAN
1121	2010-03-10	hhh	1005	STAN
1110	2010-01-28	st valezntin	1001	STAN
1130	2011-05-22	AquaDynamic	1018	STAN
1124	2010-06-23	ecran gche : meb	1016	STAN
1128	2011-05-22	ShBam	1018	STAN
1108	2010-01-15	hhh	1001	STAN
1104	2009-10-12	tattoo cadre 1	1010	STAN
1140	2011-05-24	LesMills	1018	STAN
1106	2009-12-10	promo	1013	STAN
1143	2011-09-28	khn	1020	STAN
1103	2009-11-10	tattoo site	1010	SITE
1129	2011-05-22	RPM	1018	STAN
1123	2010-03-17	theme	1009	STAN
1127	2011-05-22	Muscu	1018	STAN
1145	2012-10-27	Thomas	1010	STAN
1133	2011-05-22	B.Jam	1018	STAN
1093	2009-07-29	veterinaire	1002	STAN
1132	2011-05-22	B.Combat	1018	STAN
1131	2011-05-22	B.Balance	1018	STAN
1100	2009-10-07	ecran	1013	STAN
1002	2007-12-16	Scenario Site	1001	SITE
1125	2010-09-08	scenar Degustation	1016	STAN
1134	2011-05-22	B.Pump	1018	STAN
1146	2012-10-27	News	1010	STAN
1107	2010-01-13	marc	1001	STAN
1137	2011-05-24	Piscine	1018	STAN
1141	2011-05-24	Accueil	1018	STAN
\.


--
-- Data for Name: scenario_animation; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY scenario_animation (scenario_id, numero_ordre, animation_id) FROM stdin;
1068	0	1392
1068	1	1393
1053	0	1295
1053	1	1278
1053	2	1695
1077	0	1485
1140	0	2336
1001	0	1486
1001	1	1485
1096	0	1217
1096	1	1217
1102	0	2042
1077	1	1484
1077	2	1486
1015	0	1295
1129	0	2340
1015	1	1297
1015	2	1284
1015	3	1297
1015	4	1695
1015	5	1301
1015	6	1292
1032	1	1161
1047	0	1358
1047	1	1359
1138	0	2295
1133	0	2341
1132	0	2342
1032	2	1109
1032	3	1112
1032	4	1129
1032	5	1111
1058	0	1375
1130	0	2286
1135	0	2292
1139	0	2296
1130	1	2300
1073	0	1398
1031	0	1206
1031	1	1196
1030	0	1200
1030	1	1198
1030	2	1204
1030	3	1203
1030	4	1205
1030	5	1199
1109	0	1476
1109	1	1475
1109	2	1477
1123	0	1662
1123	1	1661
1123	2	1660
1037	0	1201
1093	0	1735
1093	1	1736
1093	2	1737
1000	0	2165
1000	1	1623
1118	0	2157
1110	0	1220
1108	0	1189
1000	2	1616
1000	3	1633
1136	0	2293
1082	0	1529
1082	1	1523
1082	2	1526
1000	4	1616
1000	5	1622
1081	0	2164
1111	0	1476
1081	1	1226
1116	0	2335
1143	0	1146
1144	0	2337
1111	1	1475
1111	2	1477
1090	0	2106
1090	1	2108
1090	2	2107
1131	0	2343
1100	8	2262
1100	9	2273
1100	0	2063
1034	0	1192
1034	1	1194
1100	1	2065
1100	2	2067
1100	3	2069
1100	4	2072
1100	5	2076
1100	6	2080
1100	7	2082
1099	1	1918
1099	2	1916
1075	0	1428
1075	1	1425
1075	2	1426
1075	3	1427
1041	0	1236
1041	1	1239
1041	2	1237
1075	4	1429
1075	5	1430
1075	6	1458
1075	7	1457
1033	0	1220
1033	1	1225
1033	2	1217
1033	3	1218
1014	0	1109
1014	2	1108
1014	3	1236
1040	0	1238
1040	1	1235
1040	2	1244
1040	3	1232
1040	4	1242
1040	5	1243
1003	0	1558
1003	1	1582
1003	2	1566
1003	3	1573
1125	0	2233
1104	0	1982
1104	1	1980
1104	2	1981
1044	0	2169
1044	1	1597
1103	0	1866
1044	2	1238
1044	3	1244
1044	4	1242
1044	5	1243
1134	0	2338
1115	0	2218
1126	0	2285
1117	0	2150
1002	8	1602
1127	0	2281
1122	0	2161
1122	1	2155
1122	2	2153
1115	1	2236
1002	9	1598
1076	0	1485
1076	1	1478
1076	2	1476
1076	3	1477
1002	10	1600
1002	0	1232
1002	1	1583
1002	2	1103
1002	3	1192
1002	4	1583
1002	5	1589
1002	6	1609
1002	7	1592
1128	0	2339
1146	0	2331
1146	1	1790
1146	2	1809
1146	3	1839
1146	4	1834
1107	0	2170
1107	1	1189
1107	2	1189
1107	3	2168
1107	4	2201
1107	5	1714
1137	0	2294
1141	0	2279
\.


--
-- Data for Name: theme; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY theme (id, date_creation, libelle, date_debut_validite, date_fin_validite, validite_permanente) FROM stdin;
1000	2008-07-11	fr=Noël\r\nes=Navidad\r\nen=Christmas	2008-07-01	2008-07-31	\N
\.


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY utilisateur (id, type, date_creation, nom, prenom, civilite, login, password, email, telephone_portable, compte_actif, coordonnees_id, langue_id, proprietes, createur_id, description_commerce, controle_total) FROM stdin;
1	ACL	2008-07-11	Chateau	Sébastien	M	schateau@publivision.fr	admin339	schateau@publivision.fr	\N	t	1	1	\N	\N	\N	t
1001	CLI	2008-07-11	compte a/a	prenom	M	aaa	aaa	fjavi.gonzalez@gmail.com	telephonePortable	t	1001	1	idCategorieRoot=1010\nidCategoriesMenu=1012,1013,1014\n\n	1	L'immobilier de qualité.\n\nDécouvrer nos biens.\n\nNos offres de locaton.	\N
1008	CLI	2009-04-20	ICONEO	Iconeo	M	azdazd	azdazd	blabla@blabla.com		t	1007	1	idCategorieRoot=1087\r\nidCategoriesMenu=1089,1090,1091	1006		\N
1007	CLI	2009-04-18	Georges	Fabien	M	Gouttebroze	boen	aaseb.chateau@gmail.com		t	1006	1	idCategorieRoot=1079\nidCategoriesMenu=1081,1082,1083	1		\N
1016	CLI	2010-03-03	Bantegnies	Daniel	M	bertinerie	bertinerie33	admin@iconeo.fr		t	1015	1	idCategorieRoot=1279\nidCategoriesMenu=1281,1282,1283\nidCategorieAnnonces=1284\n	1		\N
1013	CLI	2009-09-18	Chapeland	Marie Laure	MME	contact@madisonpiercing.fr	madison	contact@madisonpiercing.fr		t	1012	1		1		\N
1011	CLI	2009-08-31	Lejard	Jean-Christophe	M	salonlessentiel@gmail.com	culé!	salonlessentiel@gmail.com		t	1010	1	idCategorieRoot=1139\nidCategoriesMenu=1141,1142,1143\nidCategorieAnnonces=1144\n	1		\N
1015	CLI	2010-01-22	Doermann	Nicole	MME	nicole.doermann@chateaupascot.com	HRwqgdkV	nicole.doermann@chateaupascot.com		t	1014	1	idCategorieRoot=1169\nidCategoriesMenu=1171,1172,1173\nidCategorieAnnonces=1174\n	1		\N
1005	CLI	2009-04-07	Truche	Marc	M	mt	mt33	mtruche@iconeo.fr		t	1005	1	idCategorieRoot=1069\nidCategoriesMenu=1071,1072,1073\nidCategorieAnnonces=1074\n	1	Couleurs à base de pdts naturels.\n\nSpécialiste mèches & couleurs.\n\nExtension Balmain chx naturels.\n\n\nEspace vente pdt capillaire & accessoires\n	\N
1002	CLI	2008-10-03	Ariaga	Laurence	M	sc	sc33	contact@aftercoiffure.fr	06214525456	t	1002	1	idCategorieRoot=1021\nidCategoriesMenu=1023,1024,1025\nidCategorieAnnonces=1026\n	1	Laurence vous coiffe à domicile\n\nCoupe homme, femme, enfant\n\nCouleur, Mèches, Chignons	\N
1004	CLI	2009-03-31	Perlmutter	Jean-Luc	M	jl	jlp	jlucperlmutter@iconeo.fr		t	1004	1	idCategorieRoot=1062\nidCategoriesMenu=1064,1065,1066\nidCategorieAnnonces=1067\n	1		\N
1010	CLI	2009-08-24	Tattoo	Michel	M	micheltat@numericable.fr	0812	contact@micheltattoo.com		t	1009	1	idCategorieRoot=1133\nidCategoriesMenu=1135,1136,1137\nidCategorieAnnonces=1138\n	1		\N
1009	CLI	2009-05-12	Awouma	José	M	jawouma@iconeo.fr	ja33	jawouma@iconeo.fr		t	1008	1	idCategorieRoot=1106\nidCategoriesMenu=1108,1109,1110\nidCategorieAnnonces=1111\n	1	Couleurs à base de pdts naturels.\n\nSpécialiste mèches & couleurs.\n\nExtension Balmain chx naturels.\n\n\nEspace vente pdt capillaire & accessoires\n\n	\N
1003	CLI	2009-03-25	Chateau	Sébastien	M	aa	aa33	contact@artsafricains.fr	0698875432	t	1003	1	idCategorieRoot=1054\nidCategoriesMenu=1056,1057,1058\nidCategorieAnnonces=1059\n	1	\n\nL'art africain authentique\n\n\nNous importons directement depuis la Cote d'Ivoire, le Sénegal et le Congo.\n\n\nToutes les pièces sont réalisé par des artisans locaux.\n\n\nToutes les pièces sont uniques.\n\nVenez les découvrir dans notre boutique.	\N
1006	ACL	2009-04-09	Pichonneau	Hervé	M	bbb	bbb	hpichonneau@iconeo.fr		t	1	1	\N	1	\N	t
1020	CLI	2011-09-26	Weber	Thomas	M	thomasj.weber@hotmail.com	mastercrm	thomasj.weber@hotmail.com		t	1019	1	idCategorieRoot=1310\nidCategoriesMenu=1312,1313,1314\nidCategorieAnnonces=1315\n	1		\N
1018	CLI	2011-05-22	bla	bla	M	bsport	bsport33	seb.chateau@gmail.com		t	1017	1	idCategorieRoot=1303\nidCategoriesMenu=1305,1306,1307\nidCategorieAnnonces=1308\n	1		\N
\.


--
-- Data for Name: utilisateur_metier; Type: TABLE DATA; Schema: public; Owner: tc1_user
--

COPY utilisateur_metier (utilisateur_id, metier_id) FROM stdin;
1001	1001
1005	1002
1003	1002
1004	1002
1007	1003
1001	1002
1009	1002
1004	1000
1004	1001
1002	1002
1008	1005
1010	1006
1011	1002
1013	1007
1016	1008
1015	1009
1018	1010
1020	1000
\.


--
-- Name: animation_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY animation
    ADD CONSTRAINT animation_pkey PRIMARY KEY (id);


--
-- Name: categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id);


--
-- Name: coordonnees_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY coordonnees
    ADD CONSTRAINT coordonnees_pkey PRIMARY KEY (id);


--
-- Name: langue_code_key; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY langue
    ADD CONSTRAINT langue_code_key UNIQUE (code);


--
-- Name: langue_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY langue
    ADD CONSTRAINT langue_pkey PRIMARY KEY (id);


--
-- Name: lien_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY lien
    ADD CONSTRAINT lien_pkey PRIMARY KEY (id);


--
-- Name: lightnpop_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY lightnpop
    ADD CONSTRAINT lightnpop_pkey PRIMARY KEY (id);


--
-- Name: log_acces_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY log_acces
    ADD CONSTRAINT log_acces_pkey PRIMARY KEY (id);


--
-- Name: metier_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY metier
    ADD CONSTRAINT metier_pkey PRIMARY KEY (id);


--
-- Name: pays_code_key; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY pays
    ADD CONSTRAINT pays_code_key UNIQUE (code);


--
-- Name: pays_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (id);


--
-- Name: scenario_animation_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY scenario_animation
    ADD CONSTRAINT scenario_animation_pkey PRIMARY KEY (scenario_id, numero_ordre, animation_id);


--
-- Name: scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY scenario
    ADD CONSTRAINT scenario_pkey PRIMARY KEY (id);


--
-- Name: theme_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY theme
    ADD CONSTRAINT theme_pkey PRIMARY KEY (id);


--
-- Name: utilisateur_metier_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY utilisateur_metier
    ADD CONSTRAINT utilisateur_metier_pkey PRIMARY KEY (utilisateur_id, metier_id);


--
-- Name: utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: tc1_user; Tablespace: 
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


--
-- Name: fk_animation; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY scenario_animation
    ADD CONSTRAINT fk_animation FOREIGN KEY (animation_id) REFERENCES animation(id);


--
-- Name: fk_categorie; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY animation
    ADD CONSTRAINT fk_categorie FOREIGN KEY (categorie_id) REFERENCES categorie(id);


--
-- Name: fk_coordonnees; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT fk_coordonnees FOREIGN KEY (coordonnees_id) REFERENCES coordonnees(id);


--
-- Name: fk_createur; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT fk_createur FOREIGN KEY (createur_id) REFERENCES utilisateur(id);


--
-- Name: fk_langue; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY animation
    ADD CONSTRAINT fk_langue FOREIGN KEY (langue_id) REFERENCES langue(id);


--
-- Name: fk_langue; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT fk_langue FOREIGN KEY (langue_id) REFERENCES langue(id);


--
-- Name: fk_metier; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY categorie
    ADD CONSTRAINT fk_metier FOREIGN KEY (metier_id) REFERENCES metier(id);


--
-- Name: fk_metier; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY utilisateur_metier
    ADD CONSTRAINT fk_metier FOREIGN KEY (metier_id) REFERENCES metier(id);


--
-- Name: fk_parent; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY categorie
    ADD CONSTRAINT fk_parent FOREIGN KEY (parent_id) REFERENCES categorie(id);


--
-- Name: fk_pays; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY coordonnees
    ADD CONSTRAINT fk_pays FOREIGN KEY (pays_id) REFERENCES pays(id);


--
-- Name: fk_scenario; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY scenario_animation
    ADD CONSTRAINT fk_scenario FOREIGN KEY (scenario_id) REFERENCES scenario(id);


--
-- Name: fk_theme; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY categorie
    ADD CONSTRAINT fk_theme FOREIGN KEY (theme_id) REFERENCES theme(id);


--
-- Name: fk_utilisateur; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY categorie
    ADD CONSTRAINT fk_utilisateur FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id);


--
-- Name: fk_utilisateur; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY lien
    ADD CONSTRAINT fk_utilisateur FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id);


--
-- Name: fk_utilisateur; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY lightnpop
    ADD CONSTRAINT fk_utilisateur FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id);


--
-- Name: fk_utilisateur; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY scenario
    ADD CONSTRAINT fk_utilisateur FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id);


--
-- Name: fk_utilisateur; Type: FK CONSTRAINT; Schema: public; Owner: tc1_user
--

ALTER TABLE ONLY utilisateur_metier
    ADD CONSTRAINT fk_utilisateur FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

