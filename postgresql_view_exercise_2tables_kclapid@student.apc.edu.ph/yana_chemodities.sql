--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2019-12-10 13:41:46

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

--
-- TOC entry 2951 (class 1262 OID 13318)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 2951
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 16591)
-- Name: _client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._client (
    id integer NOT NULL,
    client_fname character varying(9) DEFAULT NULL::character varying,
    client_lname character varying(6) DEFAULT NULL::character varying,
    client_initial character varying(1) DEFAULT NULL::character varying,
    client_address character varying(11) DEFAULT NULL::character varying,
    client_contact bigint
);


ALTER TABLE public._client OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16601)
-- Name: _client_has_commodities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._client_has_commodities (
    client_id integer NOT NULL,
    commodities_id character varying(1) DEFAULT NULL::character varying,
    commodities_employee_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._client_has_commodities OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16599)
-- Name: _client_has_commodities_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._client_has_commodities_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._client_has_commodities_client_id_seq OWNER TO postgres;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 205
-- Name: _client_has_commodities_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._client_has_commodities_client_id_seq OWNED BY public._client_has_commodities.client_id;


--
-- TOC entry 203 (class 1259 OID 16589)
-- Name: _client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._client_id_seq OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 203
-- Name: _client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._client_id_seq OWNED BY public._client.id;


--
-- TOC entry 208 (class 1259 OID 16609)
-- Name: _commodities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._commodities (
    id integer NOT NULL,
    com_type character varying(7) DEFAULT NULL::character varying,
    com_validity character varying(10) DEFAULT NULL::character varying,
    com_worth character varying(8) DEFAULT NULL::character varying,
    com_quantity smallint,
    com_brand character varying(11) DEFAULT NULL::character varying,
    employee_id smallint
);


ALTER TABLE public._commodities OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16607)
-- Name: _commodities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._commodities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._commodities_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 207
-- Name: _commodities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._commodities_id_seq OWNED BY public._commodities.id;


--
-- TOC entry 210 (class 1259 OID 16619)
-- Name: _contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._contract (
    id integer NOT NULL,
    con_signed character varying(1) DEFAULT NULL::character varying,
    con_date character varying(1) DEFAULT NULL::character varying,
    con_expiration character varying(1) DEFAULT NULL::character varying,
    client_id character varying(1) DEFAULT NULL::character varying,
    employee_id character varying(1) DEFAULT NULL::character varying,
    employee_client_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._contract OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16617)
-- Name: _contract_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._contract_id_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 209
-- Name: _contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._contract_id_seq OWNED BY public._contract.id;


--
-- TOC entry 212 (class 1259 OID 16631)
-- Name: _delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._delivery (
    id integer NOT NULL,
    del_cour character varying(5) DEFAULT NULL::character varying,
    del_data_receive character varying(10) DEFAULT NULL::character varying,
    client_id smallint
);


ALTER TABLE public._delivery OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16629)
-- Name: _delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._delivery_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 211
-- Name: _delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._delivery_id_seq OWNED BY public._delivery.id;


--
-- TOC entry 214 (class 1259 OID 16639)
-- Name: _employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._employee (
    id integer NOT NULL,
    emp_fname character varying(9) DEFAULT NULL::character varying,
    emp_lname character varying(7) DEFAULT NULL::character varying,
    emp_initial character varying(1) DEFAULT NULL::character varying,
    emp_address character varying(11) DEFAULT NULL::character varying,
    emp_dob character varying(10) DEFAULT NULL::character varying,
    client_id smallint,
    financial_report_id smallint
);


ALTER TABLE public._employee OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16637)
-- Name: _employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._employee_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 213
-- Name: _employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._employee_id_seq OWNED BY public._employee.id;


--
-- TOC entry 216 (class 1259 OID 16650)
-- Name: _financial_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._financial_report (
    id integer NOT NULL,
    fr_amount character varying(8) DEFAULT NULL::character varying,
    fr_date character varying(19) DEFAULT NULL::character varying
);


ALTER TABLE public._financial_report OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16648)
-- Name: _financial_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._financial_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._financial_report_id_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 215
-- Name: _financial_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._financial_report_id_seq OWNED BY public._financial_report.id;


--
-- TOC entry 218 (class 1259 OID 16658)
-- Name: _salary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._salary (
    id integer NOT NULL,
    sal_amount character varying(1) DEFAULT NULL::character varying,
    sal_received character varying(1) DEFAULT NULL::character varying,
    employee_id character varying(1) DEFAULT NULL::character varying,
    employee_client_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._salary OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16656)
-- Name: _salary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._salary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._salary_id_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 217
-- Name: _salary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._salary_id_seq OWNED BY public._salary.id;


--
-- TOC entry 220 (class 1259 OID 16668)
-- Name: _training; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._training (
    id integer NOT NULL,
    trai_location character varying(1) DEFAULT NULL::character varying,
    trai_num_employ character varying(1) DEFAULT NULL::character varying,
    employee_id character varying(1) DEFAULT NULL::character varying,
    employee_client_id character varying(1) DEFAULT NULL::character varying,
    employee_financial_report_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._training OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16666)
-- Name: _training_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._training_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._training_id_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 219
-- Name: _training_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._training_id_seq OWNED BY public._training.id;


--
-- TOC entry 221 (class 1259 OID 16696)
-- Name: clientdelivery; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.clientdelivery AS
 SELECT _client.id,
    _delivery.del_cour,
    _delivery.del_data_receive,
    _client.client_fname,
    _client.client_lname
   FROM (public._client
     JOIN public._delivery ON ((_delivery.client_id = _client.id)));


ALTER TABLE public.clientdelivery OWNER TO postgres;

--
-- TOC entry 2740 (class 2604 OID 16594)
-- Name: _client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._client ALTER COLUMN id SET DEFAULT nextval('public._client_id_seq'::regclass);


--
-- TOC entry 2745 (class 2604 OID 16604)
-- Name: _client_has_commodities client_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._client_has_commodities ALTER COLUMN client_id SET DEFAULT nextval('public._client_has_commodities_client_id_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 16612)
-- Name: _commodities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._commodities ALTER COLUMN id SET DEFAULT nextval('public._commodities_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 16622)
-- Name: _contract id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._contract ALTER COLUMN id SET DEFAULT nextval('public._contract_id_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 16634)
-- Name: _delivery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._delivery ALTER COLUMN id SET DEFAULT nextval('public._delivery_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 16642)
-- Name: _employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._employee ALTER COLUMN id SET DEFAULT nextval('public._employee_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 16653)
-- Name: _financial_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._financial_report ALTER COLUMN id SET DEFAULT nextval('public._financial_report_id_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 16661)
-- Name: _salary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._salary ALTER COLUMN id SET DEFAULT nextval('public._salary_id_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 16671)
-- Name: _training id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._training ALTER COLUMN id SET DEFAULT nextval('public._training_id_seq'::regclass);


--
-- TOC entry 2929 (class 0 OID 16591)
-- Dependencies: 204
-- Data for Name: _client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._client (id, client_fname, client_lname, client_initial, client_address, client_contact) VALUES (1, 'Glen', 'Salaza', 'T', 'Makati', 9564465149);
INSERT INTO public._client (id, client_fname, client_lname, client_initial, client_address, client_contact) VALUES (2, 'John', 'Salaza', 'T', 'Makati', 9771246509);
INSERT INTO public._client (id, client_fname, client_lname, client_initial, client_address, client_contact) VALUES (3, 'Cath', 'Salaza', 'T', 'Makati', 97764465789);


--
-- TOC entry 2931 (class 0 OID 16601)
-- Dependencies: 206
-- Data for Name: _client_has_commodities; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2933 (class 0 OID 16609)
-- Dependencies: 208
-- Data for Name: _commodities; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2935 (class 0 OID 16619)
-- Dependencies: 210
-- Data for Name: _contract; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2937 (class 0 OID 16631)
-- Dependencies: 212
-- Data for Name: _delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._delivery (id, del_cour, del_data_receive, client_id) VALUES (1, 'LBC', '12-07-2019', 1);
INSERT INTO public._delivery (id, del_cour, del_data_receive, client_id) VALUES (2, 'Grab', '12-10-2019', 2);
INSERT INTO public._delivery (id, del_cour, del_data_receive, client_id) VALUES (3, '2GO', '12-16-2019', 3);


--
-- TOC entry 2939 (class 0 OID 16639)
-- Dependencies: 214
-- Data for Name: _employee; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2941 (class 0 OID 16650)
-- Dependencies: 216
-- Data for Name: _financial_report; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2943 (class 0 OID 16658)
-- Dependencies: 218
-- Data for Name: _salary; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2945 (class 0 OID 16668)
-- Dependencies: 220
-- Data for Name: _training; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 205
-- Name: _client_has_commodities_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._client_has_commodities_client_id_seq', 1, false);


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 203
-- Name: _client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._client_id_seq', 3, true);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 207
-- Name: _commodities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._commodities_id_seq', 1, false);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 209
-- Name: _contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._contract_id_seq', 1, false);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 211
-- Name: _delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._delivery_id_seq', 3, true);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 213
-- Name: _employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._employee_id_seq', 1, false);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 215
-- Name: _financial_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._financial_report_id_seq', 1, false);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 217
-- Name: _salary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._salary_id_seq', 1, false);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 219
-- Name: _training_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._training_id_seq', 1, false);


--
-- TOC entry 2786 (class 2606 OID 16681)
-- Name: _client_has_commodities _client_has_commodities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._client_has_commodities
    ADD CONSTRAINT _client_has_commodities_pkey PRIMARY KEY (client_id);


--
-- TOC entry 2784 (class 2606 OID 16678)
-- Name: _client _client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._client
    ADD CONSTRAINT _client_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 16683)
-- Name: _commodities _commodities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._commodities
    ADD CONSTRAINT _commodities_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 16685)
-- Name: _contract _contract_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._contract
    ADD CONSTRAINT _contract_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 16687)
-- Name: _delivery _delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._delivery
    ADD CONSTRAINT _delivery_pkey PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 16689)
-- Name: _employee _employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._employee
    ADD CONSTRAINT _employee_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 16691)
-- Name: _financial_report _financial_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._financial_report
    ADD CONSTRAINT _financial_report_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 16693)
-- Name: _salary _salary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._salary
    ADD CONSTRAINT _salary_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 16695)
-- Name: _training _training_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._training
    ADD CONSTRAINT _training_pkey PRIMARY KEY (id);


-- Completed on 2019-12-10 13:41:46

--
-- PostgreSQL database dump complete
--

