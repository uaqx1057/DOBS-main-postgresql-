--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

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
-- Name: driver; Type: TABLE; Schema: public; Owner: dobsykjq_admin
--

CREATE TABLE public.driver (
    id integer NOT NULL,
    full_name character varying(100),
    iqama_number character varying(20),
    iqama_expiry_date date,
    saudi_driving_license boolean,
    nationality character varying(100),
    mobile_number character varying(15),
    previous_sponsor_number character varying(50),
    iqama_card_upload character varying(200),
    platform character varying(100),
    city character varying(100),
    car_details character varying(200),
    assignment_date date,
    onboarding_stage character varying(50) DEFAULT 'Ops Manager'::character varying,
    qiwa_contract_created boolean DEFAULT false,
    company_contract_created boolean DEFAULT false,
    qiwa_transfer_approved boolean DEFAULT false,
    sponsorship_transfer_done boolean DEFAULT false,
    qiwa_contract_status character varying(20) DEFAULT 'Pending'::character varying,
    sponsorship_transfer_status character varying(20) DEFAULT 'Pending'::character varying,
    ops_manager_approved_at timestamp without time zone,
    hr_approved_at timestamp without time zone,
    ops_supervisor_approved_at timestamp without time zone,
    fleet_manager_approved_at timestamp without time zone,
    finance_approved_at timestamp without time zone,
    ops_manager_approved boolean DEFAULT false,
    hr_approved_by integer,
    platform_id character varying(50),
    mobile_issued boolean DEFAULT false,
    tamm_authorized boolean DEFAULT false,
    transfer_fee_paid boolean DEFAULT false,
    transfer_fee_amount double precision,
    transfer_fee_paid_at timestamp without time zone,
    transfer_fee_receipt character varying(200),
    issued_mobile_number character varying(20),
    issued_device_id character varying(100),
    tamm_authorization_ss character varying(200),
    sponsorship_transfer_proof character varying(200),
    company_contract_file character varying(200),
    promissory_note_file character varying(200),
    qiwa_contract_file character varying(200),
    sponsorship_transfer_completed_at timestamp without time zone,
    offboarding_stage character varying(50),
    offboarding_reason text,
    offboarding_requested_at timestamp without time zone,
    offboard_request boolean DEFAULT false,
    offboard_requested_by character varying(120),
    offboard_reason text,
    offboard_requested_at timestamp without time zone
);


ALTER TABLE public.driver OWNER TO dobsykjq_admin;

--
-- Name: driver_id_seq; Type: SEQUENCE; Schema: public; Owner: dobsykjq_admin
--

CREATE SEQUENCE public.driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_id_seq OWNER TO dobsykjq_admin;

--
-- Name: driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dobsykjq_admin
--

ALTER SEQUENCE public.driver_id_seq OWNED BY public.driver.id;


--
-- Name: driver_platform; Type: TABLE; Schema: public; Owner: dobsykjq_admin
--

CREATE TABLE public.driver_platform (
    id integer NOT NULL,
    driver_id integer NOT NULL,
    platform_name character varying(100) NOT NULL,
    platform_user_id character varying(100) NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.driver_platform OWNER TO dobsykjq_admin;

--
-- Name: driver_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: dobsykjq_admin
--

CREATE SEQUENCE public.driver_platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_platform_id_seq OWNER TO dobsykjq_admin;

--
-- Name: driver_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dobsykjq_admin
--

ALTER SEQUENCE public.driver_platform_id_seq OWNED BY public.driver_platform.id;


--
-- Name: offboarding; Type: TABLE; Schema: public; Owner: dobsykjq_admin
--

CREATE TABLE public.offboarding (
    id integer NOT NULL,
    driver_id integer NOT NULL,
    requested_by_id integer NOT NULL,
    requested_at timestamp without time zone,
    status character varying(30),
    ops_supervisor_cleared boolean,
    ops_supervisor_cleared_at timestamp without time zone,
    ops_supervisor_note text,
    fleet_cleared boolean,
    fleet_cleared_at timestamp without time zone,
    fleet_damage_report text,
    fleet_damage_cost double precision,
    finance_cleared boolean,
    finance_cleared_at timestamp without time zone,
    finance_invoice_file character varying(200),
    finance_adjustments double precision,
    finance_note text,
    hr_cleared boolean,
    hr_cleared_at timestamp without time zone,
    hr_note text,
    tamm_revoked boolean,
    tamm_revoked_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    company_contract_cancelled boolean DEFAULT false,
    qiwa_contract_cancelled boolean DEFAULT false,
    salary_paid boolean DEFAULT false
);


ALTER TABLE public.offboarding OWNER TO dobsykjq_admin;

--
-- Name: offboarding_id_seq; Type: SEQUENCE; Schema: public; Owner: dobsykjq_admin
--

CREATE SEQUENCE public.offboarding_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offboarding_id_seq OWNER TO dobsykjq_admin;

--
-- Name: offboarding_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dobsykjq_admin
--

ALTER SEQUENCE public.offboarding_id_seq OWNED BY public.offboarding.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: dobsykjq_admin
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password text NOT NULL,
    role character varying(50) NOT NULL,
    name character varying(100),
    designation character varying(100),
    branch_city character varying(100),
    email character varying(150)
);


ALTER TABLE public."user" OWNER TO dobsykjq_admin;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: dobsykjq_admin
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO dobsykjq_admin;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dobsykjq_admin
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: driver id; Type: DEFAULT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.driver ALTER COLUMN id SET DEFAULT nextval('public.driver_id_seq'::regclass);


--
-- Name: driver_platform id; Type: DEFAULT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.driver_platform ALTER COLUMN id SET DEFAULT nextval('public.driver_platform_id_seq'::regclass);


--
-- Name: offboarding id; Type: DEFAULT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.offboarding ALTER COLUMN id SET DEFAULT nextval('public.offboarding_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: dobsykjq_admin
--

COPY public.driver (id, full_name, iqama_number, iqama_expiry_date, saudi_driving_license, nationality, mobile_number, previous_sponsor_number, iqama_card_upload, platform, city, car_details, assignment_date, onboarding_stage, qiwa_contract_created, company_contract_created, qiwa_transfer_approved, sponsorship_transfer_done, qiwa_contract_status, sponsorship_transfer_status, ops_manager_approved_at, hr_approved_at, ops_supervisor_approved_at, fleet_manager_approved_at, finance_approved_at, ops_manager_approved, hr_approved_by, platform_id, mobile_issued, tamm_authorized, transfer_fee_paid, transfer_fee_amount, transfer_fee_paid_at, transfer_fee_receipt, issued_mobile_number, issued_device_id, tamm_authorization_ss, sponsorship_transfer_proof, company_contract_file, promissory_note_file, qiwa_contract_file, sponsorship_transfer_completed_at, offboarding_stage, offboarding_reason, offboarding_requested_at, offboard_request, offboard_requested_by, offboard_reason, offboard_requested_at) FROM stdin;
21	Basit Ali Basharat Ali	2522251202	2026-02-04	t	Pakistan	0577843251	1	basit_ali_basharat_ali_2522251202.jpeg	\N	Abha	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	moayad	الذهاب الي شركه اخري	2025-11-08 10:26:52.852454
15	Musa Khan Habib Hassan	2610419778	2025-07-04	t	Pakistan	0570746982	1	musa_khan_habib_hassan_2610419778.jpeg	\N	Abha	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
16	Bachu Miah	2609606526	2026-09-25	t	Bangladesh	0535414028	2	bachu_miah_2609606526.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
17	Usman Javed Muhammad Javed	2596457545	2025-05-05	t	Pakistan	0574057846	2	usman_javed_muhammad_javed_2596457545.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
10	Anik Islam Khan	2507197966	2026-02-12	t	Bangladesh	0570051450	3	anik_islam_khan_2507197966.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
11	MD Jowel Rana	2607600836	2025-12-06	t	Bangladesh	0558192843	1	md_jowel_rana_2607600836.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
12	Delowar Hossain	2609537614	2026-05-11	t	Bangladesh	0509327739	2	delowar_hossain_2609537614.jpeg	\N	Abha	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
13	Aneeb Akmal Muhammad Akmal	2606270300	2025-08-24	t	Pakistan	0547715980	1	aneeb_akmal_muhammad_akmal_2606270300.jpg	\N	Makkah	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
18	Faisal Ibraheem Hafiz Ibraheem	2554215828	2025-09-16	t	Pakistan	0597465497	2	faisal_ibraheem_hafiz_ibraheem_2554215828.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
14	MD Munna Molla	2597972179	2025-05-13	t	Bangladesh	0554745430	1	md_munna_molla_2597972179.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	moayad	تاخير في الرواتب	2025-11-05 14:37:48.741108
19	Muhammad Shahbaz Muhammad Ilyas	2598029581	2025-09-16	t	Pakistan	0557849371	1	muhammad_shahbaz_muhammad_ilyas_2598029581.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
20	Mageb Naji Mohammed Ahmed	2587566841	2026-01-18	t	Yemen	0569253071	1	mageb_naji_mohammed_ahmed_2587566841.jpeg	\N	Abha	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
22	Adil Arif Muhammad Arif	2588649315	2026-04-20	t	Pakistan	0503531850	1	adil_arif_muhammad_arif_2588649315.jpeg	\N	Al Hasa	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
23	Saleh Abdo Mohammed Muthanna	2604906350	2025-09-10	t	Yemen	0575194145	1	saleh_abdo_mohammed_muthanna_2604906350.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
24	MD Omor Faruk	2528154509	2023-03-26	t	Bangladesh	0574521574	1	md_omor_faruk_2528154509.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
25	Tamer Mahmoud Mohamed Ali	2597984372	2025-09-14	t	Egypt	0542189876	1	tamer_mahmoud_mohamed_ali_2597984372.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
26	Altayeb Abdelftah Abdelbagi Osman	2604521431	2025-07-15	t	Sudan	0574707415	1	altayeb_abdelftah_abdelbagi_osman_2604521431.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
27	MD Bayzid Hossen	2597971528	2025-09-09	t	Bangladesh	0537569713	1	md_bayzid_hossen_2597971528.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
28	Md Rihan Khan	2610550358	2025-09-27	t	Bangladesh	0572396876	1	md_rihan_khan_2610550358.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
2	Adnan Mazhar Mazhar Javed	2582280968	2025-09-15	t	Pakistan	0540920826	0	adnan_mazhar_mazhar_javed_2582280968.jpg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
29	Usman Sabir	2602107266	2025-09-16	t	Pakistan	0559329625	1	usman_sabir_2602107266.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
30	Amjad Gurashi Abdelzain Alawal	2514006341	2022-08-29	t	Sudan	0545634038	1	amjad_gurashi_abdelzain_alawal_2514006341.jpeg	\N	Jeddah	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
31	MD Akash Mia	2619012194	2026-03-31	f	Bangladesh	0570051450	1	md_akash_mia_2619012194.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
32	Muhammad Usama Muhammad Yaqoob	2606371629	2026-06-16	t	Pakistan	0502852678	1	muhammad_usama_muhammad_yaqoob_2606371629.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	t	Pending	Approved	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
34	Tariq Mahmood Muhammad Saleh	2562327797	2024-12-03	t	Pakistan	0595763927	1	tariq_mahmood_muhammad_saleh_2562327797.jpg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
71	ALIYU KEBEDE MOHAMMED	٢٦١٥٥٤١٧٥٨	2026-12-01	t	Ethiopia	0531621377	0	aliyu_kebede_mohammed_.jpg	\N	Dammam	\N	\N	Ops Manager	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
35	Muhammad Harun Khalifa	2612530424	2025-10-30	t	Bangladesh	0576614124	1	muhammad_harun_khalifa_2612530424.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
36	Al Amin	2561486776	2025-10-16	t	Bangladesh	0557642399	2	al_amin_2561486776.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
38	Haider Ali Muhammad Riaz	2581813918	2025-12-26	t	Pakistan	0537893694	2	haider_ali_muhammad_riaz_2581813918.jpeg	\N	Jeddah	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
39	MD Jalal Hossain Munna 	2561482858	2025-09-02	t	Bangladesh	0538830566	2	md_jalal_hossain_munna__2561482858.jpg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
40	Raja Wahab Ijaz Ahmed	2583149261	2025-11-27	t	Pakistan	0551736743	2	raja_wahab_ijaz_ahmed_2583149261.jpg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
41	S M Atikur Rahaman Babu	2561408523	2025-12-14	t	Pakistan	0570185383	2	s_m_atikur_rahaman_babu_2561408523.jpg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
42	Sajjad Ahmed Muhammad Ishaq	2603902632	2025-07-25	t	Pakistan	0538936701	2	sajjad_ahmed_muhammad_ishaq_2603902632.jpeg	\N	Al Hasa	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
43	Muhammad Daniyal Raza	2589563630	2025-02-21	t	Pakistan	0552604780	1	muhammad_daniyal_raza_2589563630.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
44	Mehadi Hasan	2589413562	2025-08-19	t	Bangladesh	0572594403	1	mehadi_hasan_2589413562.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
45	Abdullah Ahmed Abdullah Haidarah	2594766939	2025-03-24	t	Yemen	0532541776	1	abdullah_ahmed_abdullah_haidarah_2594766939.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
46	Mueen Nazir Ahmad Khan	2487699080	2025-08-19	t	India	0558379148	2	mueen_nazir_ahmad_khan_2487699080.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
47	Najm Aldaine Abdullah Ahmed	2591011404	2026-01-10	t	Yemen	0525910114	1	najm_aldaine_abdullah_ahmed_2591011404.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
48	Tahir Ali Sabz Ali Khan	2615236615	2025-09-06	t	Pakistan	0526152366	1	tahir_ali_sabz_ali_khan_2615236615.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
49	Abdullah Hames Hamood Gumaan	2601490101	2025-10-04	t	Yemen	0507540711	1	abdullah_hames_hamood_gumaan_2601490101.jpg	\N	Al Hasa	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
50	Naveed Khursheed Khursheed Ahmed	2603971819	2025-07-25	t	Pakistan	0590796385	1	naveed_khursheed_khursheed_ahmed_2603971819.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
51	Asad Ali Khan Shakeel	2592284463	2025-08-21	t	Pakistan	0576752427	1	asad_ali_khan_shakeel_2592284463.jpeg	\N	Al Hasa	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
52	MD Arif Hosen	2607802994	2025-09-21	t	Bangladesh	0571952368	1	md_arif_hosen_2607802994.jpeg	\N	Al Hasa	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
53	Ammad Afzal Muhammad Afzal	2569270651	2025-08-26	t	Pakistan	0539581963	1	ammad_afzal_muhammad_afzal_2569270651.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
54	Aziz ul Rehman	2561484607	2024-10-27	t	Bangladesh	0538042594	1	aziz_ul_rehman_2561484607.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
55	Aiyub Ali	2610087856	2026-07-04	t	Bangladesh	0578281418	1	aiyub_ali_2610087856.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
57	Fares Ahmed Ahmed Alwali	2590592396	2025-12-20	t	Yemen	0547377326	1	fares_ahmed_ahmed_alwali_2590592396.jpeg	\N	Makkah	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
58	Muhammad Saleem Akram	2577011113	2025-09-10	t	Pakistan	0549965768	1	muhammad_saleem_akram_2577011113.jpeg	\N	Al Hasa	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
59	Samim MD Shahjalal	2599839566	2026-05-25	t	Bangladesh	0581172698	1	samim_md_shahjalal_2599839566.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
60	Muntaser Ahmed Msaad Ahmed	2339142172	2022-09-30	t	Sudan	0531459798	1	muntaser_ahmed_msaad_ahmed_2339142172.jpg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
61	Zameer Abbas Malik Ilyas Khan	2577182922	2025-07-26	t	Pakistan	0541231443	1	zameer_abbas_malik_ilyas_khan_2577182922.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
62	Ebrahim Hubaysh Mahdi Nasser J	2466307432	2025-01-15	t	Yemen	0500000000	1	ebrahim_hubaysh_mahdi_nasser_j_2466307432.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
63	Muzammel Hoque	2609437906	2026-06-15	t	Bangladesh	0576324718	1	muzammel_hoque_2609437906.jpeg	\N	Al Hasa	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
64	Muhammad Saqib Hanif Muhammad	2259547251	2025-09-03	t	Pakistan	0594484134	1	muhammad_saqib_hanif_muhammad_2259547251.jpg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
65	Omar Abdu Abdullah Othman	2190465506	2025-10-23	t	Yemen	0500000000	1	omar_abdu_abdullah_othman_2190465506.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
66	MD Rostom Ali	2618248005	2025-12-31	t	Bangladesh	0573012819	1	md_rostom_ali_2618248005.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
67	Anowar Rased Sheikh	2591955428	2026-03-06	t	Bangladesh	0534932784	1	anowar_rased_sheikh_2591955428.jpeg	\N	Al Hasa	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
68	Mohamed Karar Alshekikh Koko	2545619898	2027-05-20	t	Sudan	0546652261	1	mohamed_karar_alshekikh_koko_2545619898.jpeg	\N	Abha	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
69	MD Shamim Miah 	2615501331	2025-12-05	t	Bangladesh	0578246795	1	md_shamim_miah__2615501331.jpeg	\N	Dammam	\N	\N	Completed	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
70	ASHAR AFTAB AFTAB AHMED	٢٥٨٨٦٠٦٨٢٨	2025-02-04	t	Pakistan	0564819357	1	ashar_aftab_aftab_ahmed_.jpg	\N	Dammam	\N	\N	Ops Manager	f	f	f	f	Pending	Pending	\N	\N	\N	\N	\N	f	\N	\N	f	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: driver_platform; Type: TABLE DATA; Schema: public; Owner: dobsykjq_admin
--

COPY public.driver_platform (id, driver_id, platform_name, platform_user_id, assigned_at) FROM stdin;
\.


--
-- Data for Name: offboarding; Type: TABLE DATA; Schema: public; Owner: dobsykjq_admin
--

COPY public.offboarding (id, driver_id, requested_by_id, requested_at, status, ops_supervisor_cleared, ops_supervisor_cleared_at, ops_supervisor_note, fleet_cleared, fleet_cleared_at, fleet_damage_report, fleet_damage_cost, finance_cleared, finance_cleared_at, finance_invoice_file, finance_adjustments, finance_note, hr_cleared, hr_cleared_at, hr_note, tamm_revoked, tamm_revoked_at, created_at, updated_at, company_contract_cancelled, qiwa_contract_cancelled, salary_paid) FROM stdin;
2	21	17	2025-11-08 11:13:15.158869	Finance	t	2025-11-08 11:16:02.632837	ToYou ID 312064 has been taken from Basit Ali and the password has been changed. No company mobile or sim had been issued by me for the driver.	t	2025-11-09 12:42:50.239702	0	0	f	\N	\N	\N	\N	f	\N	\N	t	2025-11-09 12:42:50.239745	2025-11-08 11:13:15.162331	2025-11-09 12:42:50.244456	f	f	f
1	14	17	2025-11-06 08:08:40.813255	Finance	t	2025-11-06 08:11:54.757692	ToYou account 367156 taken and password resetted.\nHe had no mobile and sims issued from my side.	t	2025-11-09 12:45:04.474599	0	0	f	\N	\N	\N	\N	f	\N	\N	t	2025-11-09 12:45:04.47464	2025-11-06 08:08:40.816963	2025-11-09 12:45:04.479125	f	f	f
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: dobsykjq_admin
--

COPY public."user" (id, username, password, role, name, designation, branch_city, email) FROM stdin;
16	usama@ilab.sa	pbkdf2:sha256:260000$XHVH2DkCUWJzohG2$0ac6cd7053cdaad73dcb75a81d623331a4f83c494f7a3a9efd86dba2ea7e6a88	SuperAdmin	Usama Akhtar	IT Manager	Dammam	usama@ilab.sa
17	ala@speed.sa	pbkdf2:sha256:260000$yZYTzvvsxP8zDdvG$2f06c3b0b5fd1f56c867c1d11630b9f0302eca3e3d5c05bf330fb9a3136c839e	OpsManager	Alaa ali Khalil Aboasba	Operation Manager	Dammam	ala@speed.sa
19	kashif@speed.sa	pbkdf2:sha256:260000$G8vYgfa15DkMska9$b3c64dded2d6751857c2e0fb6973053f69cdc5f322e9e353ac6a134c95d41a8e	FleetManager	Kashif Akbar	Fleet Manager	Dammam	kashif@speed.sa
20	hr@ilab.sa	pbkdf2:sha256:260000$TlNWE3umRmm3ajQM$97a25586d77e4697c9728716ba0095e4156e9edbba8a60137579a409d98418aa	HR	Mohanad Abdulmjeed	GRO	Dammam	hr@ilab.sa
21	ayaz@speed.sa	pbkdf2:sha256:260000$emlLxHIvj7KdfEdf$eaa4d3c9c7eac3d4946e1eb1bd85320826d34c67583c45f9c4f7610f01952292	HR	Ayaz Ali	HR Supervisor	Dammam	ayaz@speed.sa
22	rami@ilab.sa	pbkdf2:sha256:260000$t38fpGhvqdmiin9S$ec498d55b3fb0b49dd0681df5afa5701f15c9aaa812a46549177736e8a705acd	FinanceManager	Rami AlDoroubi	Finance Manager	Dammam	rami@ilab.sa
24	ahmed@ilab.sa	pbkdf2:sha256:260000$ipRJkyiafP1YNPIh$3813aaa5efd7c543949a06b4e6bfe90187b44ac7f04f2121c4e12308f0eee506	OpsSupervisor	Ahmed Akhtar	Platform Operations Executive 	Dammam	ahmed@ilab.sa
26	murtadh.abdullah@ilab.sa	pbkdf2:sha256:260000$eHpCBPZ90P7vHiv9$98f6bff01a505a457138ea38c2d21b7d0d62af2931a8c43615659c383af9ac83	FinanceManager	Murtadh Abdullah	Chief Accountant	Dammam	murtadh.abdullah@ilab.sa
27	kawsar@speed.sa	pbkdf2:sha256:260000$EkimgR2B9gVEkDjQ$fa96244e4af441b032855dd97cae045eae8668fbebf689f661b137d8b8e3b961	FleetManager	Kawsar Ahmed	Fleet Coordinator	Dammam	kawsar@speed.sa
28	usman@ilab.sa	pbkdf2:sha256:260000$bTdTeMLiu8uxgrl0$d02b8c184a96080c643d79b0b6c0e33eb667d059ffcc3ee430fdfda2004b51fd	SuperAdmin	Usman Asif Qureshi	Full Stack Developer 	Dammam	usman@ilab.sa
29	moayad@speed.sa	pbkdf2:sha256:260000$RZpTqyeT27zTFsEM$41d6b623b5cba41e45716ccb81a7902cd51618b19f0b3ba3e6f53d5c2942a942	OpsCoordinator	moayad	Operation coordinator	Dammam	moayad@speed.sa
23	ceo@ilab.sa	pbkdf2:sha256:260000$7afGwKlEsgB90e3b$be8aefec74dc3f6320df5c032fa2c3f9279c1e496d5215ff2a011b3142386166	SuperAdmin	Abdulrahman Alzayani	CEO	Dammam	\N
\.


--
-- Name: driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dobsykjq_admin
--

SELECT pg_catalog.setval('public.driver_id_seq', 71, true);


--
-- Name: driver_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dobsykjq_admin
--

SELECT pg_catalog.setval('public.driver_platform_id_seq', 1, false);


--
-- Name: offboarding_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dobsykjq_admin
--

SELECT pg_catalog.setval('public.offboarding_id_seq', 2, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dobsykjq_admin
--

SELECT pg_catalog.setval('public.user_id_seq', 29, true);


--
-- Name: driver driver_iqama_number_key; Type: CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_iqama_number_key UNIQUE (iqama_number);


--
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id);


--
-- Name: driver_platform driver_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.driver_platform
    ADD CONSTRAINT driver_platform_pkey PRIMARY KEY (id);


--
-- Name: offboarding offboarding_pkey; Type: CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.offboarding
    ADD CONSTRAINT offboarding_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: driver driver_hr_approved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_hr_approved_by_fkey FOREIGN KEY (hr_approved_by) REFERENCES public."user"(id);


--
-- Name: driver_platform driver_platform_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.driver_platform
    ADD CONSTRAINT driver_platform_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver(id) ON DELETE CASCADE;


--
-- Name: offboarding offboarding_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.offboarding
    ADD CONSTRAINT offboarding_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver(id);


--
-- Name: offboarding offboarding_requested_by_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dobsykjq_admin
--

ALTER TABLE ONLY public.offboarding
    ADD CONSTRAINT offboarding_requested_by_id_fkey FOREIGN KEY (requested_by_id) REFERENCES public."user"(id);


--
-- Name: TABLE driver; Type: ACL; Schema: public; Owner: dobsykjq_admin
--

GRANT ALL ON TABLE public.driver TO dobsykjq_driver_onboarding2;


--
-- Name: TABLE driver_platform; Type: ACL; Schema: public; Owner: dobsykjq_admin
--

GRANT ALL ON TABLE public.driver_platform TO dobsykjq_driver_onboarding2;


--
-- Name: TABLE offboarding; Type: ACL; Schema: public; Owner: dobsykjq_admin
--

GRANT ALL ON TABLE public.offboarding TO dobsykjq_driver_onboarding2;


--
-- Name: TABLE "user"; Type: ACL; Schema: public; Owner: dobsykjq_admin
--

GRANT ALL ON TABLE public."user" TO dobsykjq_driver_onboarding2;


--
-- PostgreSQL database dump complete
--

