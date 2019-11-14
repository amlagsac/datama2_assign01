--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2019-11-14 08:14:38

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16548)
-- Name: _client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._client (
    id integer NOT NULL,
    client_fname character varying(45) DEFAULT NULL::character varying,
    client_lname character varying(45) DEFAULT NULL::character varying,
    client_initial character varying(3) DEFAULT NULL::character varying,
    client_address character varying(255) DEFAULT NULL::character varying,
    client_contact character varying(9) DEFAULT NULL::character varying
);


ALTER TABLE public._client OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16559)
-- Name: _client_has_commodities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._client_has_commodities (
    id integer NOT NULL,
    client_id character varying(1) DEFAULT NULL::character varying,
    commodities_id character varying(1) DEFAULT NULL::character varying,
    commodities_employee_id character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE public._client_has_commodities OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16557)
-- Name: _client_has_commodities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._client_has_commodities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public._client_has_commodities_id_seq OWNER TO postgres;

--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 198
-- Name: _client_has_commodities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._client_has_commodities_id_seq OWNED BY public._client_has_commodities.id;


--
-- TOC entry 196 (class 1259 OID 16546)
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
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 196
-- Name: _client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._client_id_seq OWNED BY public._client.id;


--
-- TOC entry 201 (class 1259 OID 16568)
-- Name: _commodities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._commodities (
    id integer NOT NULL,
    com_type character varying(45) DEFAULT NULL::character varying,
    com_validity character varying(45) DEFAULT NULL::character varying,
    com_worth character varying(45) DEFAULT NULL::character varying,
    com_quantity smallint,
    com_brand character varying(45) DEFAULT NULL::character varying,
    employee_id smallint
);


ALTER TABLE public._commodities OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16566)
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
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 200
-- Name: _commodities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._commodities_id_seq OWNED BY public._commodities.id;


--
-- TOC entry 203 (class 1259 OID 16578)
-- Name: _contract; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._contract (
    id integer NOT NULL,
    con_signed character varying(45) DEFAULT NULL::character varying,
    con_date character varying(45) DEFAULT NULL::character varying,
    con_expiration character varying(45) DEFAULT NULL::character varying,
    client_id character varying(45) DEFAULT NULL::character varying,
    employee_id character varying(45) DEFAULT NULL::character varying,
    employee_client_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public._contract OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16576)
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
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 202
-- Name: _contract_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._contract_id_seq OWNED BY public._contract.id;


--
-- TOC entry 205 (class 1259 OID 16590)
-- Name: _delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._delivery (
    id integer NOT NULL,
    del_cour character varying(45) DEFAULT NULL::character varying,
    del_data_receive character varying(45) DEFAULT NULL::character varying,
    client_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public._delivery OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16588)
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
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 204
-- Name: _delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._delivery_id_seq OWNED BY public._delivery.id;


--
-- TOC entry 207 (class 1259 OID 16599)
-- Name: _employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._employee (
    id integer NOT NULL,
    emp_fname character varying(45) DEFAULT NULL::character varying,
    emp_lname character varying(45) DEFAULT NULL::character varying,
    emp_initial character varying(3) DEFAULT NULL::character varying,
    emp_address character varying(255) DEFAULT NULL::character varying,
    emp_dob character varying(19) DEFAULT NULL::character varying,
    client_id smallint,
    financial_report_id smallint
);


ALTER TABLE public._employee OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16597)
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
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 206
-- Name: _employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._employee_id_seq OWNED BY public._employee.id;


--
-- TOC entry 209 (class 1259 OID 16610)
-- Name: _financial_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._financial_report (
    id integer NOT NULL,
    fr_amount character varying(45) DEFAULT NULL::character varying,
    fr_date character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public._financial_report OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16608)
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
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 208
-- Name: _financial_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._financial_report_id_seq OWNED BY public._financial_report.id;


--
-- TOC entry 211 (class 1259 OID 16618)
-- Name: _salary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._salary (
    id integer NOT NULL,
    sal_amount character varying(45) DEFAULT NULL::character varying,
    sal_received character varying(45) DEFAULT NULL::character varying,
    employee_id character varying(45) DEFAULT NULL::character varying,
    employee_client_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public._salary OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16616)
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
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 210
-- Name: _salary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._salary_id_seq OWNED BY public._salary.id;


--
-- TOC entry 213 (class 1259 OID 16628)
-- Name: _training; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._training (
    id integer NOT NULL,
    trai_location character varying(45) DEFAULT NULL::character varying,
    trai_num_employ character varying(45) DEFAULT NULL::character varying,
    employee_id character varying(45) DEFAULT NULL::character varying,
    employee_client_id character varying(45) DEFAULT NULL::character varying,
    employee_financial_report_id character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public._training OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16626)
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
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 212
-- Name: _training_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._training_id_seq OWNED BY public._training.id;


--
-- TOC entry 214 (class 1259 OID 24576)
-- Name: sales; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.sales AS
 SELECT _employee.emp_fname,
    _employee.emp_lname,
    _commodities.com_type,
    _commodities.com_worth,
    _commodities.com_quantity,
    _commodities.com_brand
   FROM (public._employee
     JOIN public._commodities ON ((_commodities.employee_id = _employee.id)));


ALTER TABLE public.sales OWNER TO postgres;

--
-- TOC entry 2727 (class 2604 OID 16551)
-- Name: _client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._client ALTER COLUMN id SET DEFAULT nextval('public._client_id_seq'::regclass);


--
-- TOC entry 2729 (class 2604 OID 16562)
-- Name: _client_has_commodities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._client_has_commodities ALTER COLUMN id SET DEFAULT nextval('public._client_has_commodities_id_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 16571)
-- Name: _commodities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._commodities ALTER COLUMN id SET DEFAULT nextval('public._commodities_id_seq'::regclass);


--
-- TOC entry 2743 (class 2604 OID 16581)
-- Name: _contract id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._contract ALTER COLUMN id SET DEFAULT nextval('public._contract_id_seq'::regclass);


--
-- TOC entry 2747 (class 2604 OID 16593)
-- Name: _delivery id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._delivery ALTER COLUMN id SET DEFAULT nextval('public._delivery_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 16602)
-- Name: _employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._employee ALTER COLUMN id SET DEFAULT nextval('public._employee_id_seq'::regclass);


--
-- TOC entry 2756 (class 2604 OID 16613)
-- Name: _financial_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._financial_report ALTER COLUMN id SET DEFAULT nextval('public._financial_report_id_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 16621)
-- Name: _salary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._salary ALTER COLUMN id SET DEFAULT nextval('public._salary_id_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 16631)
-- Name: _training id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._training ALTER COLUMN id SET DEFAULT nextval('public._training_id_seq'::regclass);


--
-- TOC entry 2909 (class 0 OID 16548)
-- Dependencies: 197
-- Data for Name: _client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._client (id, client_fname, client_lname, client_initial, client_address, client_contact) VALUES (1, 'Andre', 'Lagsac', 'M.', 'Makati City', '895-65-65');
INSERT INTO public._client (id, client_fname, client_lname, client_initial, client_address, client_contact) VALUES (2, 'Christian', 'Maning', 'P.', 'Makati City', '821-76-36');


--
-- TOC entry 2911 (class 0 OID 16559)
-- Dependencies: 199
-- Data for Name: _client_has_commodities; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2913 (class 0 OID 16568)
-- Dependencies: 201
-- Data for Name: _commodities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._commodities (id, com_type, com_validity, com_worth, com_quantity, com_brand, employee_id) VALUES (1, 'Service', '2019-10-30', 'P500,000', 200, 'Pall', 1);
INSERT INTO public._commodities (id, com_type, com_validity, com_worth, com_quantity, com_brand, employee_id) VALUES (2, 'Equipment', '2019-10-28', 'P1,000,000', 500, 'B2B', 1);
INSERT INTO public._commodities (id, com_type, com_validity, com_worth, com_quantity, com_brand, employee_id) VALUES (3, 'Service', '2019-10-27', 'P250,000', 100, 'Everpure', 1);
INSERT INTO public._commodities (id, com_type, com_validity, com_worth, com_quantity, com_brand, employee_id) VALUES (4, 'Equipment', '2019-10-23', 'P50,000', 10, '3M', 1);


--
-- TOC entry 2915 (class 0 OID 16578)
-- Dependencies: 203
-- Data for Name: _contract; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2917 (class 0 OID 16590)
-- Dependencies: 205
-- Data for Name: _delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2919 (class 0 OID 16599)
-- Dependencies: 207
-- Data for Name: _employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._employee (id, emp_fname, emp_lname, emp_initial, emp_address, emp_dob, client_id, financial_report_id) VALUES (1, 'Kyla', 'Lapid', 'C.', 'Taguig City', '523-12-99', NULL, NULL);


--
-- TOC entry 2921 (class 0 OID 16610)
-- Dependencies: 209
-- Data for Name: _financial_report; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2923 (class 0 OID 16618)
-- Dependencies: 211
-- Data for Name: _salary; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2925 (class 0 OID 16628)
-- Dependencies: 213
-- Data for Name: _training; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 198
-- Name: _client_has_commodities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._client_has_commodities_id_seq', 1, false);


--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 196
-- Name: _client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._client_id_seq', 2, true);


--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 200
-- Name: _commodities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._commodities_id_seq', 4, true);


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 202
-- Name: _contract_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._contract_id_seq', 1, false);


--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 204
-- Name: _delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._delivery_id_seq', 1, false);


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 206
-- Name: _employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._employee_id_seq', 1, true);


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 208
-- Name: _financial_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._financial_report_id_seq', 1, false);


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 210
-- Name: _salary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._salary_id_seq', 1, false);


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 212
-- Name: _training_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._training_id_seq', 1, false);


--
-- TOC entry 2771 (class 2606 OID 16647)
-- Name: _client_has_commodities _client_has_commodities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._client_has_commodities
    ADD CONSTRAINT _client_has_commodities_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 16644)
-- Name: _client _client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._client
    ADD CONSTRAINT _client_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 16653)
-- Name: _commodities _commodities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._commodities
    ADD CONSTRAINT _commodities_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 16661)
-- Name: _contract _contract_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._contract
    ADD CONSTRAINT _contract_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 16666)
-- Name: _delivery _delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._delivery
    ADD CONSTRAINT _delivery_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 16673)
-- Name: _employee _employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._employee
    ADD CONSTRAINT _employee_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 16677)
-- Name: _financial_report _financial_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._financial_report
    ADD CONSTRAINT _financial_report_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 16683)
-- Name: _salary _salary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._salary
    ADD CONSTRAINT _salary_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 16690)
-- Name: _training _training_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._training
    ADD CONSTRAINT _training_pkey PRIMARY KEY (id);


-- Completed on 2019-11-14 08:14:38

--
-- PostgreSQL database dump complete
--

