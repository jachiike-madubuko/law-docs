--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

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
-- Name: attorney_buy; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_buy (
    id integer NOT NULL,
    duration interval NOT NULL,
    purchased timestamp with time zone NOT NULL,
    legal_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.attorney_buy OWNER TO jachi;

--
-- Name: attorney_buy_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.attorney_buy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attorney_buy_id_seq OWNER TO jachi;

--
-- Name: attorney_buy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.attorney_buy_id_seq OWNED BY public.attorney_buy.id;


--
-- Name: attorney_client; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_client (
    person_ptr_id integer NOT NULL,
    clientdata jsonb NOT NULL
);


ALTER TABLE public.attorney_client OWNER TO jachi;

--
-- Name: attorney_document; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_document (
    legal_ptr_id integer NOT NULL,
    "fileStackURL" character varying(200)
);


ALTER TABLE public.attorney_document OWNER TO jachi;

--
-- Name: attorney_employee; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_employee (
    id integer NOT NULL,
    date_joined date NOT NULL,
    employed_id integer NOT NULL,
    employer_id integer NOT NULL
);


ALTER TABLE public.attorney_employee OWNER TO jachi;

--
-- Name: attorney_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.attorney_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attorney_employee_id_seq OWNER TO jachi;

--
-- Name: attorney_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.attorney_employee_id_seq OWNED BY public.attorney_employee.id;


--
-- Name: attorney_firm; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_firm (
    "firmID" integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.attorney_firm OWNER TO jachi;

--
-- Name: attorney_firm_firmID_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public."attorney_firm_firmID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."attorney_firm_firmID_seq" OWNER TO jachi;

--
-- Name: attorney_firm_firmID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public."attorney_firm_firmID_seq" OWNED BY public.attorney_firm."firmID";


--
-- Name: attorney_form; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_form (
    legal_ptr_id integer NOT NULL,
    "typeForm" jsonb,
    "docEditor" jsonb
);


ALTER TABLE public.attorney_form OWNER TO jachi;

--
-- Name: attorney_forstate; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_forstate (
    id integer NOT NULL,
    legal_id integer NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public.attorney_forstate OWNER TO jachi;

--
-- Name: attorney_forstate_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.attorney_forstate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attorney_forstate_id_seq OWNER TO jachi;

--
-- Name: attorney_forstate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.attorney_forstate_id_seq OWNED BY public.attorney_forstate.id;


--
-- Name: attorney_instate; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_instate (
    id integer NOT NULL,
    person_id integer NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public.attorney_instate OWNER TO jachi;

--
-- Name: attorney_instate_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.attorney_instate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attorney_instate_id_seq OWNER TO jachi;

--
-- Name: attorney_instate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.attorney_instate_id_seq OWNED BY public.attorney_instate.id;


--
-- Name: attorney_lawyer; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_lawyer (
    person_ptr_id integer NOT NULL,
    lawyerdata jsonb NOT NULL
);


ALTER TABLE public.attorney_lawyer OWNER TO jachi;

--
-- Name: attorney_legal; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_legal (
    "legalID" integer NOT NULL,
    "Name" character varying(512) NOT NULL,
    "Type" character varying(45),
    "Created" timestamp with time zone,
    "LastUpdated" timestamp with time zone,
    tags character varying(200)[] NOT NULL
);


ALTER TABLE public.attorney_legal OWNER TO jachi;

--
-- Name: attorney_legal_legalID_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public."attorney_legal_legalID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."attorney_legal_legalID_seq" OWNER TO jachi;

--
-- Name: attorney_legal_legalID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public."attorney_legal_legalID_seq" OWNED BY public.attorney_legal."legalID";


--
-- Name: attorney_own; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_own (
    id integer NOT NULL,
    owned timestamp with time zone NOT NULL,
    legal_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.attorney_own OWNER TO jachi;

--
-- Name: attorney_own_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.attorney_own_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attorney_own_id_seq OWNER TO jachi;

--
-- Name: attorney_own_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.attorney_own_id_seq OWNED BY public.attorney_own.id;


--
-- Name: attorney_person; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_person (
    "personID" integer NOT NULL,
    "firstName" character varying(128) NOT NULL,
    "lastName" character varying(128) NOT NULL,
    "emailAddress" character varying(254) NOT NULL,
    password character varying(20) NOT NULL,
    created timestamp with time zone,
    "lastLogin" timestamp with time zone NOT NULL,
    "IPAddress" inet NOT NULL,
    "birthYear" integer,
    "deathYear" integer,
    tags character varying(200)[] NOT NULL
);


ALTER TABLE public.attorney_person OWNER TO jachi;

--
-- Name: attorney_person_personID_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public."attorney_person_personID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."attorney_person_personID_seq" OWNER TO jachi;

--
-- Name: attorney_person_personID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public."attorney_person_personID_seq" OWNED BY public.attorney_person."personID";


--
-- Name: attorney_piece; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_piece (
    legal_ptr_id integer NOT NULL,
    content jsonb,
    "pieceType" character varying(30)
);


ALTER TABLE public.attorney_piece OWNER TO jachi;

--
-- Name: attorney_state; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_state (
    id integer NOT NULL,
    state character varying(2) NOT NULL
);


ALTER TABLE public.attorney_state OWNER TO jachi;

--
-- Name: attorney_state_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.attorney_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attorney_state_id_seq OWNER TO jachi;

--
-- Name: attorney_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.attorney_state_id_seq OWNED BY public.attorney_state.id;


--
-- Name: attorney_use; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_use (
    id integer NOT NULL,
    duration interval NOT NULL,
    lastused timestamp with time zone NOT NULL,
    legal_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.attorney_use OWNER TO jachi;

--
-- Name: attorney_use_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.attorney_use_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attorney_use_id_seq OWNER TO jachi;

--
-- Name: attorney_use_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.attorney_use_id_seq OWNED BY public.attorney_use.id;


--
-- Name: attorney_view; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.attorney_view (
    id integer NOT NULL,
    duration interval NOT NULL,
    lastviewed timestamp with time zone NOT NULL,
    "numberOviews" integer NOT NULL,
    legal_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.attorney_view OWNER TO jachi;

--
-- Name: attorney_view_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.attorney_view_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attorney_view_id_seq OWNER TO jachi;

--
-- Name: attorney_view_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.attorney_view_id_seq OWNED BY public.attorney_view.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO jachi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO jachi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO jachi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO jachi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO jachi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO jachi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO jachi;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO jachi;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO jachi;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO jachi;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO jachi;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO jachi;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.blog_post (
    id integer NOT NULL,
    title character varying(140) NOT NULL,
    body text NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.blog_post OWNER TO jachi;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.blog_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_post_id_seq OWNER TO jachi;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.blog_post_id_seq OWNED BY public.blog_post.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO jachi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO jachi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO jachi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO jachi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO jachi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: jachi
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO jachi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jachi
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: jachi
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO jachi;

--
-- Name: attorney_buy id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_buy ALTER COLUMN id SET DEFAULT nextval('public.attorney_buy_id_seq'::regclass);


--
-- Name: attorney_employee id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_employee ALTER COLUMN id SET DEFAULT nextval('public.attorney_employee_id_seq'::regclass);


--
-- Name: attorney_firm firmID; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_firm ALTER COLUMN "firmID" SET DEFAULT nextval('public."attorney_firm_firmID_seq"'::regclass);


--
-- Name: attorney_forstate id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_forstate ALTER COLUMN id SET DEFAULT nextval('public.attorney_forstate_id_seq'::regclass);


--
-- Name: attorney_instate id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_instate ALTER COLUMN id SET DEFAULT nextval('public.attorney_instate_id_seq'::regclass);


--
-- Name: attorney_legal legalID; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_legal ALTER COLUMN "legalID" SET DEFAULT nextval('public."attorney_legal_legalID_seq"'::regclass);


--
-- Name: attorney_own id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_own ALTER COLUMN id SET DEFAULT nextval('public.attorney_own_id_seq'::regclass);


--
-- Name: attorney_person personID; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_person ALTER COLUMN "personID" SET DEFAULT nextval('public."attorney_person_personID_seq"'::regclass);


--
-- Name: attorney_state id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_state ALTER COLUMN id SET DEFAULT nextval('public.attorney_state_id_seq'::regclass);


--
-- Name: attorney_use id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_use ALTER COLUMN id SET DEFAULT nextval('public.attorney_use_id_seq'::regclass);


--
-- Name: attorney_view id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_view ALTER COLUMN id SET DEFAULT nextval('public.attorney_view_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_post id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.blog_post ALTER COLUMN id SET DEFAULT nextval('public.blog_post_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: attorney_buy; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_buy (id, duration, purchased, legal_id, person_id) FROM stdin;
1	6 days 10:00:00	2018-03-19 08:25:45.603521-06	3	2
\.


--
-- Data for Name: attorney_client; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_client (person_ptr_id, clientdata) FROM stdin;
2	[{"dd": "money"}]
\.


--
-- Data for Name: attorney_document; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_document (legal_ptr_id, "fileStackURL") FROM stdin;
1	\N
\.


--
-- Data for Name: attorney_employee; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_employee (id, date_joined, employed_id, employer_id) FROM stdin;
2	2018-03-19	2	1
\.


--
-- Data for Name: attorney_firm; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_firm ("firmID", name) FROM stdin;
1	Lawyer'r'us
\.


--
-- Data for Name: attorney_form; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_form (legal_ptr_id, "typeForm", "docEditor") FROM stdin;
3	\N	\N
\.


--
-- Data for Name: attorney_forstate; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_forstate (id, legal_id, state_id) FROM stdin;
1	2	2
2	3	3
3	1	4
\.


--
-- Data for Name: attorney_instate; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_instate (id, person_id, state_id) FROM stdin;
1	1	2
2	2	3
3	1	4
\.


--
-- Data for Name: attorney_lawyer; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_lawyer (person_ptr_id, lawyerdata) FROM stdin;
1	[{"dd": "money"}]
\.


--
-- Data for Name: attorney_legal; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_legal ("legalID", "Name", "Type", "Created", "LastUpdated", tags) FROM stdin;
1	the Doc	will	2018-03-19 08:23:27.829831-06	2018-03-19 08:23:27.829892-06	{quick,"easy to use"}
2	DocP	will	2018-03-19 08:23:32.784827-06	2018-03-19 08:23:32.784856-06	{flexible,dynamic}
3	A form	will	2018-03-19 08:23:48.566336-06	2018-03-19 08:23:48.56636-06	{"too long",confusing}
\.


--
-- Data for Name: attorney_own; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_own (id, owned, legal_id, person_id) FROM stdin;
1	2018-03-19 08:25:52.855864-06	3	2
\.


--
-- Data for Name: attorney_person; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_person ("personID", "firstName", "lastName", "emailAddress", password, created, "lastLogin", "IPAddress", "birthYear", "deathYear", tags) FROM stdin;
1	Bobo	Jojo	bobo.jojo@hoho.co	1234	2018-03-19 08:21:39.189422-06	2018-03-19 08:20:34.499086-06	98.127.248.2	\N	\N	{trusted,friendly,veteran}
2	Bebe	Jaja	bebe.jaja@hoho.co	4321	2018-03-19 08:21:43.119695-06	2018-03-19 08:20:41.774019-06	98.127.248.2	\N	\N	{elderly,assets,retired}
\.


--
-- Data for Name: attorney_piece; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_piece (legal_ptr_id, content, "pieceType") FROM stdin;
2	\N	\N
\.


--
-- Data for Name: attorney_state; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_state (id, state) FROM stdin;
1	AK
2	CA
3	MT
4	MI
5	DC
6	AL
7	AZ
8	CO
10	CT
11	DE
12	FL
13	GA
14	HI
15	ID
16	IL
17	IN
18	IA
19	KS
20	KY
21	LA
22	ME
23	MD
24	MA
26	MN
27	MO
28	MS
29	NE
30	NV
31	NH
32	NJ
33	NM
34	NY
35	NC
36	ND
37	OH
38	OK
39	OR
40	PA
41	RI
42	SC
43	SD
44	TN
45	TX
46	UT
47	VT
48	VA
49	WA
50	WV
51	WI
52	WY
54	AR
\.


--
-- Data for Name: attorney_use; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_use (id, duration, lastused, legal_id, person_id) FROM stdin;
1	26 days 10:00:00	2018-03-19 08:25:39.776788-06	3	1
\.


--
-- Data for Name: attorney_view; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.attorney_view (id, duration, lastviewed, "numberOviews", legal_id, person_id) FROM stdin;
1	20 days 10:00:00	2018-03-19 08:25:30.390239-06	2	2	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add buy	1	add_buy
2	Can change buy	1	change_buy
3	Can delete buy	1	delete_buy
4	Can add employee	2	add_employee
5	Can change employee	2	change_employee
6	Can delete employee	2	delete_employee
7	Can add firm	3	add_firm
8	Can change firm	3	change_firm
9	Can delete firm	3	delete_firm
10	Can add for state	4	add_forstate
11	Can change for state	4	change_forstate
12	Can delete for state	4	delete_forstate
13	Can add in state	5	add_instate
14	Can change in state	5	change_instate
15	Can delete in state	5	delete_instate
16	Can add legal	6	add_legal
17	Can change legal	6	change_legal
18	Can delete legal	6	delete_legal
19	Can add own	7	add_own
20	Can change own	7	change_own
21	Can delete own	7	delete_own
22	Can add person	8	add_person
23	Can change person	8	change_person
24	Can delete person	8	delete_person
25	Can add state	9	add_state
26	Can change state	9	change_state
27	Can delete state	9	delete_state
28	Can add use	10	add_use
29	Can change use	10	change_use
30	Can delete use	10	delete_use
31	Can add view	11	add_view
32	Can change view	11	change_view
33	Can delete view	11	delete_view
34	Can add client	12	add_client
35	Can change client	12	change_client
36	Can delete client	12	delete_client
37	Can add document	13	add_document
38	Can change document	13	change_document
39	Can delete document	13	delete_document
40	Can add form	14	add_form
41	Can change form	14	change_form
42	Can delete form	14	delete_form
43	Can add lawyer	15	add_lawyer
44	Can change lawyer	15	change_lawyer
45	Can delete lawyer	15	delete_lawyer
46	Can add piece	16	add_piece
47	Can change piece	16	change_piece
48	Can delete piece	16	delete_piece
49	Can add post	17	add_post
50	Can change post	17	change_post
51	Can delete post	17	delete_post
52	Can add log entry	18	add_logentry
53	Can change log entry	18	change_logentry
54	Can delete log entry	18	delete_logentry
55	Can add permission	19	add_permission
56	Can change permission	19	change_permission
57	Can delete permission	19	delete_permission
58	Can add group	20	add_group
59	Can change group	20	change_group
60	Can delete group	20	delete_group
61	Can add user	21	add_user
62	Can change user	21	change_user
63	Can delete user	21	delete_user
64	Can add content type	22	add_contenttype
65	Can change content type	22	change_contenttype
66	Can delete content type	22	delete_contenttype
67	Can add session	23	add_session
68	Can change session	23	change_session
69	Can delete session	23	delete_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$GFl2zhfyGb1H$7uFzxufXlcCiTOZGrjAVfpoJ60to2Suy/YP9qSGyBNc=	2018-03-19 09:10:08.924033-06	t	jachi			jachiike.madubuko@gmail.com	t	t	2018-03-19 09:08:05.764042-06
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.blog_post (id, title, body, date) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-03-19 09:16:11.836213-06	5	DC	1	[{"added": {}}]	9	1
2	2018-03-19 09:16:14.827012-06	6	AL	1	[{"added": {}}]	9	1
3	2018-03-19 09:16:41.167527-06	7	AZ	1	[{"added": {}}]	9	1
4	2018-03-19 09:16:47.631734-06	8	CO	1	[{"added": {}}]	9	1
5	2018-03-19 09:16:53.924596-06	9	CT	1	[{"added": {}}]	9	1
6	2018-03-19 09:17:02.304485-06	10	CT	1	[{"added": {}}]	9	1
7	2018-03-19 09:17:18.649786-06	9	CT	3		9	1
8	2018-03-19 09:17:41.411172-06	11	DE	1	[{"added": {}}]	9	1
9	2018-03-19 09:17:44.429091-06	12	FL	1	[{"added": {}}]	9	1
10	2018-03-19 09:17:47.76629-06	13	GA	1	[{"added": {}}]	9	1
11	2018-03-19 09:17:52.075341-06	14	HI	1	[{"added": {}}]	9	1
12	2018-03-19 09:18:01.417077-06	15	ID	1	[{"added": {}}]	9	1
13	2018-03-19 09:18:06.031918-06	16	IL	1	[{"added": {}}]	9	1
14	2018-03-19 09:18:11.147797-06	17	IN	1	[{"added": {}}]	9	1
15	2018-03-19 09:18:17.603829-06	18	IA	1	[{"added": {}}]	9	1
16	2018-03-19 09:18:20.678967-06	19	KS	1	[{"added": {}}]	9	1
17	2018-03-19 09:18:23.849844-06	20	KY	1	[{"added": {}}]	9	1
18	2018-03-19 09:18:34.562444-06	21	LA	1	[{"added": {}}]	9	1
19	2018-03-19 09:18:44.896036-06	22	ME	1	[{"added": {}}]	9	1
20	2018-03-19 09:18:50.245093-06	23	MD	1	[{"added": {}}]	9	1
21	2018-03-19 09:18:53.809932-06	24	MA	1	[{"added": {}}]	9	1
22	2018-03-19 09:18:57.775261-06	25	MI	1	[{"added": {}}]	9	1
23	2018-03-19 09:19:01.626464-06	26	MN	1	[{"added": {}}]	9	1
24	2018-03-19 09:19:07.962426-06	27	MO	1	[{"added": {}}]	9	1
25	2018-03-19 09:19:11.3893-06	28	MS	1	[{"added": {}}]	9	1
26	2018-03-19 09:19:15.344808-06	29	NE	1	[{"added": {}}]	9	1
27	2018-03-19 09:19:24.786827-06	30	NV	1	[{"added": {}}]	9	1
28	2018-03-19 09:20:00.081256-06	25	MI	3		9	1
29	2018-03-19 09:20:21.425577-06	31	NH	1	[{"added": {}}]	9	1
30	2018-03-19 09:20:26.667004-06	32	NJ	1	[{"added": {}}]	9	1
31	2018-03-19 09:20:31.442832-06	33	NM	1	[{"added": {}}]	9	1
32	2018-03-19 09:20:35.436827-06	34	NY	1	[{"added": {}}]	9	1
33	2018-03-19 09:20:39.223585-06	35	NC	1	[{"added": {}}]	9	1
34	2018-03-19 09:20:44.172749-06	36	ND	1	[{"added": {}}]	9	1
35	2018-03-19 09:20:51.334691-06	37	OH	1	[{"added": {}}]	9	1
36	2018-03-19 09:20:56.484522-06	38	OK	1	[{"added": {}}]	9	1
37	2018-03-19 09:21:02.317335-06	39	OR	1	[{"added": {}}]	9	1
38	2018-03-19 09:21:10.757299-06	40	PA	1	[{"added": {}}]	9	1
39	2018-03-19 09:21:16.351359-06	41	RI	1	[{"added": {}}]	9	1
40	2018-03-19 09:21:21.038133-06	42	SC	1	[{"added": {}}]	9	1
41	2018-03-19 09:21:25.106399-06	43	SD	1	[{"added": {}}]	9	1
42	2018-03-19 09:21:29.091599-06	44	TN	1	[{"added": {}}]	9	1
43	2018-03-19 09:21:33.876722-06	45	TX	1	[{"added": {}}]	9	1
44	2018-03-19 09:21:38.068873-06	46	UT	1	[{"added": {}}]	9	1
45	2018-03-19 09:21:42.383415-06	47	VT	1	[{"added": {}}]	9	1
46	2018-03-19 09:21:47.736897-06	48	VA	1	[{"added": {}}]	9	1
47	2018-03-19 09:21:57.01681-06	49	WA	1	[{"added": {}}]	9	1
48	2018-03-19 09:22:03.344917-06	50	WV	1	[{"added": {}}]	9	1
49	2018-03-19 09:22:07.62651-06	51	WI	1	[{"added": {}}]	9	1
50	2018-03-19 09:22:13.168141-06	52	WY	1	[{"added": {}}]	9	1
51	2018-03-19 09:22:35.171178-06	53	MO	1	[{"added": {}}]	9	1
52	2018-03-19 09:22:54.708201-06	53	MO	3		9	1
53	2018-03-19 09:24:07.041481-06	54	AR	1	[{"added": {}}]	9	1
54	2018-03-19 09:24:13.404001-06	55	AL	1	[{"added": {}}]	9	1
55	2018-03-19 09:24:23.848591-06	55	AL	3		9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	attorney	buy
2	attorney	employee
3	attorney	firm
4	attorney	forstate
5	attorney	instate
6	attorney	legal
7	attorney	own
8	attorney	person
9	attorney	state
10	attorney	use
11	attorney	view
12	attorney	client
13	attorney	document
14	attorney	form
15	attorney	lawyer
16	attorney	piece
17	blog	post
18	admin	logentry
19	auth	permission
20	auth	group
21	auth	user
22	contenttypes	contenttype
23	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-03-19 07:39:29.923001-06
2	auth	0001_initial	2018-03-19 07:39:30.049892-06
3	admin	0001_initial	2018-03-19 07:39:30.084929-06
4	admin	0002_logentry_remove_auto_add	2018-03-19 07:39:30.09893-06
5	attorney	0001_initial	2018-03-19 07:39:30.699381-06
6	contenttypes	0002_remove_content_type_name	2018-03-19 07:39:30.730087-06
7	auth	0002_alter_permission_name_max_length	2018-03-19 07:39:30.735619-06
8	auth	0003_alter_user_email_max_length	2018-03-19 07:39:30.744142-06
9	auth	0004_alter_user_username_opts	2018-03-19 07:39:30.751318-06
10	auth	0005_alter_user_last_login_null	2018-03-19 07:39:30.759771-06
11	auth	0006_require_contenttypes_0002	2018-03-19 07:39:30.761385-06
12	auth	0007_alter_validators_add_error_messages	2018-03-19 07:39:30.771184-06
13	auth	0008_alter_user_username_max_length	2018-03-19 07:39:30.791882-06
14	blog	0001_initial	2018-03-19 07:39:30.806749-06
15	sessions	0001_initial	2018-03-19 07:39:30.822997-06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: jachi
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
z7nl4s97s4o3yave4bt4fobryon0vfy8	ZDhmNzE4NGRlMjk4MWY4ZWVkN2QwMTNhZDIwOTVjMzdhNzczNmQ1OTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NDY4NGJkYWE0YTU0ODllYmU5ZGNkNzkyNzIwNmI4NGVhZGI3YjczIn0=	2018-04-02 09:10:08.926228-06
\.


--
-- Name: attorney_buy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.attorney_buy_id_seq', 1, true);


--
-- Name: attorney_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.attorney_employee_id_seq', 2, true);


--
-- Name: attorney_firm_firmID_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public."attorney_firm_firmID_seq"', 1, true);


--
-- Name: attorney_forstate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.attorney_forstate_id_seq', 3, true);


--
-- Name: attorney_instate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.attorney_instate_id_seq', 3, true);


--
-- Name: attorney_legal_legalID_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public."attorney_legal_legalID_seq"', 3, true);


--
-- Name: attorney_own_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.attorney_own_id_seq', 1, true);


--
-- Name: attorney_person_personID_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public."attorney_person_personID_seq"', 2, true);


--
-- Name: attorney_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.attorney_state_id_seq', 55, true);


--
-- Name: attorney_use_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.attorney_use_id_seq', 1, true);


--
-- Name: attorney_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.attorney_view_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 69, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.blog_post_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 55, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jachi
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 15, true);


--
-- Name: attorney_buy attorney_buy_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_buy
    ADD CONSTRAINT attorney_buy_pkey PRIMARY KEY (id);


--
-- Name: attorney_client attorney_client_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_client
    ADD CONSTRAINT attorney_client_pkey PRIMARY KEY (person_ptr_id);


--
-- Name: attorney_document attorney_document_fileStackURL_key; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_document
    ADD CONSTRAINT "attorney_document_fileStackURL_key" UNIQUE ("fileStackURL");


--
-- Name: attorney_document attorney_document_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_document
    ADD CONSTRAINT attorney_document_pkey PRIMARY KEY (legal_ptr_id);


--
-- Name: attorney_employee attorney_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_employee
    ADD CONSTRAINT attorney_employee_pkey PRIMARY KEY (id);


--
-- Name: attorney_firm attorney_firm_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_firm
    ADD CONSTRAINT attorney_firm_pkey PRIMARY KEY ("firmID");


--
-- Name: attorney_form attorney_form_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_form
    ADD CONSTRAINT attorney_form_pkey PRIMARY KEY (legal_ptr_id);


--
-- Name: attorney_forstate attorney_forstate_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_forstate
    ADD CONSTRAINT attorney_forstate_pkey PRIMARY KEY (id);


--
-- Name: attorney_instate attorney_instate_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_instate
    ADD CONSTRAINT attorney_instate_pkey PRIMARY KEY (id);


--
-- Name: attorney_lawyer attorney_lawyer_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_lawyer
    ADD CONSTRAINT attorney_lawyer_pkey PRIMARY KEY (person_ptr_id);


--
-- Name: attorney_legal attorney_legal_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_legal
    ADD CONSTRAINT attorney_legal_pkey PRIMARY KEY ("legalID");


--
-- Name: attorney_own attorney_own_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_own
    ADD CONSTRAINT attorney_own_pkey PRIMARY KEY (id);


--
-- Name: attorney_person attorney_person_emailAddress_key; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_person
    ADD CONSTRAINT "attorney_person_emailAddress_key" UNIQUE ("emailAddress");


--
-- Name: attorney_person attorney_person_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_person
    ADD CONSTRAINT attorney_person_pkey PRIMARY KEY ("personID");


--
-- Name: attorney_piece attorney_piece_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_piece
    ADD CONSTRAINT attorney_piece_pkey PRIMARY KEY (legal_ptr_id);


--
-- Name: attorney_state attorney_state_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_state
    ADD CONSTRAINT attorney_state_pkey PRIMARY KEY (id);


--
-- Name: attorney_use attorney_use_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_use
    ADD CONSTRAINT attorney_use_pkey PRIMARY KEY (id);


--
-- Name: attorney_view attorney_view_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_view
    ADD CONSTRAINT attorney_view_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_post blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: attorney_buy_legal_id_cf1bfb04; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_buy_legal_id_cf1bfb04 ON public.attorney_buy USING btree (legal_id);


--
-- Name: attorney_buy_person_id_2c506d38; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_buy_person_id_2c506d38 ON public.attorney_buy USING btree (person_id);


--
-- Name: attorney_document_fileStackURL_7a0be42a_like; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX "attorney_document_fileStackURL_7a0be42a_like" ON public.attorney_document USING btree ("fileStackURL" varchar_pattern_ops);


--
-- Name: attorney_employee_employed_id_834f50ad; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_employee_employed_id_834f50ad ON public.attorney_employee USING btree (employed_id);


--
-- Name: attorney_employee_employer_id_85ea031a; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_employee_employer_id_85ea031a ON public.attorney_employee USING btree (employer_id);


--
-- Name: attorney_forstate_legal_id_80e9b754; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_forstate_legal_id_80e9b754 ON public.attorney_forstate USING btree (legal_id);


--
-- Name: attorney_forstate_state_id_9c481188; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_forstate_state_id_9c481188 ON public.attorney_forstate USING btree (state_id);


--
-- Name: attorney_instate_person_id_051ec3a7; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_instate_person_id_051ec3a7 ON public.attorney_instate USING btree (person_id);


--
-- Name: attorney_instate_state_id_48100497; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_instate_state_id_48100497 ON public.attorney_instate USING btree (state_id);


--
-- Name: attorney_own_legal_id_922e9b49; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_own_legal_id_922e9b49 ON public.attorney_own USING btree (legal_id);


--
-- Name: attorney_own_person_id_538f7582; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_own_person_id_538f7582 ON public.attorney_own USING btree (person_id);


--
-- Name: attorney_person_emailAddress_b04abef0_like; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX "attorney_person_emailAddress_b04abef0_like" ON public.attorney_person USING btree ("emailAddress" varchar_pattern_ops);


--
-- Name: attorney_use_legal_id_12dc9c59; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_use_legal_id_12dc9c59 ON public.attorney_use USING btree (legal_id);


--
-- Name: attorney_use_person_id_03ef0342; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_use_person_id_03ef0342 ON public.attorney_use USING btree (person_id);


--
-- Name: attorney_view_legal_id_18552501; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_view_legal_id_18552501 ON public.attorney_view USING btree (legal_id);


--
-- Name: attorney_view_person_id_64e8b117; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX attorney_view_person_id_64e8b117 ON public.attorney_view USING btree (person_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: jachi
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: attorney_buy attorney_buy_legal_id_cf1bfb04_fk_attorney_legal_legalID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_buy
    ADD CONSTRAINT "attorney_buy_legal_id_cf1bfb04_fk_attorney_legal_legalID" FOREIGN KEY (legal_id) REFERENCES public.attorney_legal("legalID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_buy attorney_buy_person_id_2c506d38_fk_attorney_person_personID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_buy
    ADD CONSTRAINT "attorney_buy_person_id_2c506d38_fk_attorney_person_personID" FOREIGN KEY (person_id) REFERENCES public.attorney_person("personID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_client attorney_client_person_ptr_id_3c774050_fk_attorney_; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_client
    ADD CONSTRAINT attorney_client_person_ptr_id_3c774050_fk_attorney_ FOREIGN KEY (person_ptr_id) REFERENCES public.attorney_person("personID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_document attorney_document_legal_ptr_id_73916593_fk_attorney_; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_document
    ADD CONSTRAINT attorney_document_legal_ptr_id_73916593_fk_attorney_ FOREIGN KEY (legal_ptr_id) REFERENCES public.attorney_legal("legalID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_employee attorney_employee_employed_id_834f50ad_fk_attorney_; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_employee
    ADD CONSTRAINT attorney_employee_employed_id_834f50ad_fk_attorney_ FOREIGN KEY (employed_id) REFERENCES public.attorney_person("personID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_employee attorney_employee_employer_id_85ea031a_fk_attorney_firm_firmID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_employee
    ADD CONSTRAINT "attorney_employee_employer_id_85ea031a_fk_attorney_firm_firmID" FOREIGN KEY (employer_id) REFERENCES public.attorney_firm("firmID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_form attorney_form_legal_ptr_id_3e9a2c38_fk_attorney_legal_legalID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_form
    ADD CONSTRAINT "attorney_form_legal_ptr_id_3e9a2c38_fk_attorney_legal_legalID" FOREIGN KEY (legal_ptr_id) REFERENCES public.attorney_legal("legalID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_forstate attorney_forstate_legal_id_80e9b754_fk_attorney_legal_legalID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_forstate
    ADD CONSTRAINT "attorney_forstate_legal_id_80e9b754_fk_attorney_legal_legalID" FOREIGN KEY (legal_id) REFERENCES public.attorney_legal("legalID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_forstate attorney_forstate_state_id_9c481188_fk_attorney_state_id; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_forstate
    ADD CONSTRAINT attorney_forstate_state_id_9c481188_fk_attorney_state_id FOREIGN KEY (state_id) REFERENCES public.attorney_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_instate attorney_instate_person_id_051ec3a7_fk_attorney_person_personID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_instate
    ADD CONSTRAINT "attorney_instate_person_id_051ec3a7_fk_attorney_person_personID" FOREIGN KEY (person_id) REFERENCES public.attorney_person("personID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_instate attorney_instate_state_id_48100497_fk_attorney_state_id; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_instate
    ADD CONSTRAINT attorney_instate_state_id_48100497_fk_attorney_state_id FOREIGN KEY (state_id) REFERENCES public.attorney_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_lawyer attorney_lawyer_person_ptr_id_90ec7b48_fk_attorney_; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_lawyer
    ADD CONSTRAINT attorney_lawyer_person_ptr_id_90ec7b48_fk_attorney_ FOREIGN KEY (person_ptr_id) REFERENCES public.attorney_person("personID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_own attorney_own_legal_id_922e9b49_fk_attorney_legal_legalID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_own
    ADD CONSTRAINT "attorney_own_legal_id_922e9b49_fk_attorney_legal_legalID" FOREIGN KEY (legal_id) REFERENCES public.attorney_legal("legalID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_own attorney_own_person_id_538f7582_fk_attorney_person_personID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_own
    ADD CONSTRAINT "attorney_own_person_id_538f7582_fk_attorney_person_personID" FOREIGN KEY (person_id) REFERENCES public.attorney_person("personID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_piece attorney_piece_legal_ptr_id_f6337638_fk_attorney_legal_legalID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_piece
    ADD CONSTRAINT "attorney_piece_legal_ptr_id_f6337638_fk_attorney_legal_legalID" FOREIGN KEY (legal_ptr_id) REFERENCES public.attorney_legal("legalID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_use attorney_use_legal_id_12dc9c59_fk_attorney_legal_legalID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_use
    ADD CONSTRAINT "attorney_use_legal_id_12dc9c59_fk_attorney_legal_legalID" FOREIGN KEY (legal_id) REFERENCES public.attorney_legal("legalID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_use attorney_use_person_id_03ef0342_fk_attorney_person_personID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_use
    ADD CONSTRAINT "attorney_use_person_id_03ef0342_fk_attorney_person_personID" FOREIGN KEY (person_id) REFERENCES public.attorney_person("personID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_view attorney_view_legal_id_18552501_fk_attorney_legal_legalID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_view
    ADD CONSTRAINT "attorney_view_legal_id_18552501_fk_attorney_legal_legalID" FOREIGN KEY (legal_id) REFERENCES public.attorney_legal("legalID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attorney_view attorney_view_person_id_64e8b117_fk_attorney_person_personID; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.attorney_view
    ADD CONSTRAINT "attorney_view_person_id_64e8b117_fk_attorney_person_personID" FOREIGN KEY (person_id) REFERENCES public.attorney_person("personID") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: jachi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

