--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO niravkntr;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO niravkntr;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO niravkntr;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO niravkntr;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO niravkntr;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO niravkntr;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    mode character(1) DEFAULT 'S'::bpchar NOT NULL
);


ALTER TABLE public.auth_user OWNER TO niravkntr;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO niravkntr;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO niravkntr;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO niravkntr;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO niravkntr;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO niravkntr;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO niravkntr;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO niravkntr;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO niravkntr;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO niravkntr;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO niravkntr;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO niravkntr;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO niravkntr;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO niravkntr;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO niravkntr;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: hub_course; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE hub_course (
    id integer NOT NULL,
    courseno character varying(255) NOT NULL,
    coursename character varying(255) NOT NULL
);


ALTER TABLE public.hub_course OWNER TO niravkntr;

--
-- Name: hub_course_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE hub_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hub_course_id_seq OWNER TO niravkntr;

--
-- Name: hub_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE hub_course_id_seq OWNED BY hub_course.id;


--
-- Name: hub_history; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE hub_history (
    id integer NOT NULL,
    studentname character varying(255) NOT NULL,
    cycleid integer NOT NULL,
    fromlocation character varying(255) NOT NULL,
    tolocation character varying(255) NOT NULL
);


ALTER TABLE public.hub_history OWNER TO niravkntr;

--
-- Name: hub_history_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE hub_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hub_history_id_seq OWNER TO niravkntr;

--
-- Name: hub_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE hub_history_id_seq OWNED BY hub_history.id;


--
-- Name: hub_hubcycle; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE hub_hubcycle (
    id integer NOT NULL,
    cycleid integer NOT NULL,
    hubid_id integer NOT NULL,
    available boolean NOT NULL
);


ALTER TABLE public.hub_hubcycle OWNER TO niravkntr;

--
-- Name: hub_hubcycle_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE hub_hubcycle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hub_hubcycle_id_seq OWNER TO niravkntr;

--
-- Name: hub_hubcycle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE hub_hubcycle_id_seq OWNED BY hub_hubcycle.id;


--
-- Name: hub_hubdetails; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE hub_hubdetails (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    requirement integer NOT NULL,
    available integer NOT NULL,
    newavailable integer NOT NULL
);


ALTER TABLE public.hub_hubdetails OWNER TO niravkntr;

--
-- Name: hub_hubdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE hub_hubdetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hub_hubdetails_id_seq OWNER TO niravkntr;

--
-- Name: hub_hubdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE hub_hubdetails_id_seq OWNED BY hub_hubdetails.id;


--
-- Name: hub_hublandmark; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE hub_hublandmark (
    id integer NOT NULL,
    hub_id integer NOT NULL,
    landmark_id integer NOT NULL,
    landmarkname character varying(255) NOT NULL
);


ALTER TABLE public.hub_hublandmark OWNER TO niravkntr;

--
-- Name: hub_hublandmark_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE hub_hublandmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hub_hublandmark_id_seq OWNER TO niravkntr;

--
-- Name: hub_hublandmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE hub_hublandmark_id_seq OWNED BY hub_hublandmark.id;


--
-- Name: hub_landmark; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE hub_landmark (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.hub_landmark OWNER TO niravkntr;

--
-- Name: hub_landmark_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE hub_landmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hub_landmark_id_seq OWNER TO niravkntr;

--
-- Name: hub_landmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE hub_landmark_id_seq OWNED BY hub_landmark.id;


--
-- Name: hub_registrationdetails; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE hub_registrationdetails (
    id integer NOT NULL,
    courseno_id integer NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.hub_registrationdetails OWNER TO niravkntr;

--
-- Name: hub_registrationdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE hub_registrationdetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hub_registrationdetails_id_seq OWNER TO niravkntr;

--
-- Name: hub_registrationdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE hub_registrationdetails_id_seq OWNED BY hub_registrationdetails.id;


--
-- Name: hub_studentdetails; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE hub_studentdetails (
    id integer NOT NULL,
    rollno integer NOT NULL,
    name character varying(255) NOT NULL,
    location character varying(255) NOT NULL
);


ALTER TABLE public.hub_studentdetails OWNER TO niravkntr;

--
-- Name: hub_studentdetails_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE hub_studentdetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hub_studentdetails_id_seq OWNER TO niravkntr;

--
-- Name: hub_studentdetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE hub_studentdetails_id_seq OWNED BY hub_studentdetails.id;


--
-- Name: hub_timetable; Type: TABLE; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE TABLE hub_timetable (
    id integer NOT NULL,
    courseno character varying(30) NOT NULL,
    coursename character varying(255) NOT NULL,
    starttime time without time zone,
    endtime time without time zone,
    day character varying(30) NOT NULL
);


ALTER TABLE public.hub_timetable OWNER TO niravkntr;

--
-- Name: hub_timetable_id_seq; Type: SEQUENCE; Schema: public; Owner: niravkntr
--

CREATE SEQUENCE hub_timetable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hub_timetable_id_seq OWNER TO niravkntr;

--
-- Name: hub_timetable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: niravkntr
--

ALTER SEQUENCE hub_timetable_id_seq OWNED BY hub_timetable.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_course ALTER COLUMN id SET DEFAULT nextval('hub_course_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_history ALTER COLUMN id SET DEFAULT nextval('hub_history_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_hubcycle ALTER COLUMN id SET DEFAULT nextval('hub_hubcycle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_hubdetails ALTER COLUMN id SET DEFAULT nextval('hub_hubdetails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_hublandmark ALTER COLUMN id SET DEFAULT nextval('hub_hublandmark_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_landmark ALTER COLUMN id SET DEFAULT nextval('hub_landmark_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_registrationdetails ALTER COLUMN id SET DEFAULT nextval('hub_registrationdetails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_studentdetails ALTER COLUMN id SET DEFAULT nextval('hub_studentdetails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_timetable ALTER COLUMN id SET DEFAULT nextval('hub_timetable_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: niravkntr
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: niravkntr
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission VALUES (19, 'Can add hub details', 7, 'add_hubdetails');
INSERT INTO auth_permission VALUES (20, 'Can change hub details', 7, 'change_hubdetails');
INSERT INTO auth_permission VALUES (21, 'Can delete hub details', 7, 'delete_hubdetails');
INSERT INTO auth_permission VALUES (22, 'Can add landmark', 8, 'add_landmark');
INSERT INTO auth_permission VALUES (23, 'Can change landmark', 8, 'change_landmark');
INSERT INTO auth_permission VALUES (24, 'Can delete landmark', 8, 'delete_landmark');
INSERT INTO auth_permission VALUES (25, 'Can add hub landmark', 9, 'add_hublandmark');
INSERT INTO auth_permission VALUES (26, 'Can change hub landmark', 9, 'change_hublandmark');
INSERT INTO auth_permission VALUES (27, 'Can delete hub landmark', 9, 'delete_hublandmark');
INSERT INTO auth_permission VALUES (28, 'Can add student details', 10, 'add_studentdetails');
INSERT INTO auth_permission VALUES (29, 'Can change student details', 10, 'change_studentdetails');
INSERT INTO auth_permission VALUES (30, 'Can delete student details', 10, 'delete_studentdetails');
INSERT INTO auth_permission VALUES (31, 'Can add registration details', 11, 'add_registrationdetails');
INSERT INTO auth_permission VALUES (32, 'Can change registration details', 11, 'change_registrationdetails');
INSERT INTO auth_permission VALUES (33, 'Can delete registration details', 11, 'delete_registrationdetails');
INSERT INTO auth_permission VALUES (37, 'Can add time table', 13, 'add_timetable');
INSERT INTO auth_permission VALUES (38, 'Can change time table', 13, 'change_timetable');
INSERT INTO auth_permission VALUES (39, 'Can delete time table', 13, 'delete_timetable');
INSERT INTO auth_permission VALUES (40, 'Can add course', 14, 'add_course');
INSERT INTO auth_permission VALUES (41, 'Can change course', 14, 'change_course');
INSERT INTO auth_permission VALUES (42, 'Can delete course', 14, 'delete_course');
INSERT INTO auth_permission VALUES (43, 'Can add hub cycle', 15, 'add_hubcycle');
INSERT INTO auth_permission VALUES (44, 'Can change hub cycle', 15, 'change_hubcycle');
INSERT INTO auth_permission VALUES (45, 'Can delete hub cycle', 15, 'delete_hubcycle');
INSERT INTO auth_permission VALUES (46, 'Can add site', 16, 'add_site');
INSERT INTO auth_permission VALUES (47, 'Can change site', 16, 'change_site');
INSERT INTO auth_permission VALUES (48, 'Can delete site', 16, 'delete_site');
INSERT INTO auth_permission VALUES (49, 'Can add history', 17, 'add_history');
INSERT INTO auth_permission VALUES (50, 'Can change history', 17, 'change_history');
INSERT INTO auth_permission VALUES (51, 'Can delete history', 17, 'delete_history');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO auth_user VALUES (22, 'pbkdf2_sha256$24000$x5pzoEx2IN5C$nH9b+C3XDsla7HQRzOqsKrRe1KNu8Kx8FT7HsvK48jA=', NULL, false, 'user_18', 'user_18_firstname', 'user_18_lastname', 'user_18@mailid.com', false, true, '2016-05-22 05:13:49.276089+05:30', 'S');
INSERT INTO auth_user VALUES (23, 'pbkdf2_sha256$24000$uX8qmFDuH2gF$EN6gSpm1vNX4LVIgCt6yT3anB1guVeqMh/X7JmWxNw0=', NULL, false, 'user_19', 'user_19_firstname', 'user_19_lastname', 'user_19@mailid.com', false, true, '2016-05-22 05:13:49.398181+05:30', 'S');
INSERT INTO auth_user VALUES (3, 'pbkdf2_sha256$24000$9lyZqFxvKNsG$hBQg0L3d+CJZpzeElJaaud00DA/esK14CRAGH34elhw=', '2016-05-23 07:17:19.689119+05:30', false, 'root', 'root', 'root', 'root@mailid.com', true, true, '2016-05-21 03:58:34.732887+05:30', 'A');
INSERT INTO auth_user VALUES (4, 'pbkdf2_sha256$24000$UcmtSQLQqRId$jwwOudQttCXEt5WV0pHDt0kSFI1+LeJU4cZ4sCa5j+8=', '2016-05-23 07:01:49.305196+05:30', false, 'amit', 'Amit', 'Zala', 'amit@mailid.com', false, true, '2016-05-21 12:06:34.114478+05:30', 'S');
INSERT INTO auth_user VALUES (7, 'pbkdf2_sha256$24000$PZLnrSoZWnqW$1oQVP6LSAsDCwko3ULIWpQTL1FjQOu7VWkBvPJEwXhA=', NULL, false, 'user_3', 'user_3_firstname', 'user_3_lastname', 'user_3@mailid.com', false, true, '2016-05-22 05:13:47.334241+05:30', 'S');
INSERT INTO auth_user VALUES (8, 'pbkdf2_sha256$24000$pb3D3Dla37pO$0F1N9H4T8UOC2zO2F1pV2ygn21r9kzWBiqjXkNCTTz0=', NULL, false, 'user_4', 'user_4_firstname', 'user_4_lastname', 'user_4@mailid.com', false, true, '2016-05-22 05:13:47.471279+05:30', 'S');
INSERT INTO auth_user VALUES (9, 'pbkdf2_sha256$24000$ZcmLdKnGPwnl$Iptc4SYeh+4UIWQ3wXdSyykdplqMGjUBPrA5P9poM+Q=', NULL, false, 'user_5', 'user_5_firstname', 'user_5_lastname', 'user_5@mailid.com', false, true, '2016-05-22 05:13:47.58955+05:30', 'S');
INSERT INTO auth_user VALUES (10, 'pbkdf2_sha256$24000$GJIUvtLNETs0$LdX9drRwWYnNBhLBHrLBdBabyKiPn4E8fPl/xOykl1o=', NULL, false, 'user_6', 'user_6_firstname', 'user_6_lastname', 'user_6@mailid.com', false, true, '2016-05-22 05:13:47.722783+05:30', 'S');
INSERT INTO auth_user VALUES (11, 'pbkdf2_sha256$24000$odRKL2fRXObQ$47tP1We77LT2MrG8q7295sUuaaz9pVaTBGfh1iOP+2I=', NULL, false, 'user_7', 'user_7_firstname', 'user_7_lastname', 'user_7@mailid.com', false, true, '2016-05-22 05:13:47.844715+05:30', 'S');
INSERT INTO auth_user VALUES (12, 'pbkdf2_sha256$24000$dJeij0xhqIC8$A3UVkqv6vfN3qeOZ/+apRXSNu16/LimRWRlDKPBFAjk=', NULL, false, 'user_8', 'user_8_firstname', 'user_8_lastname', 'user_8@mailid.com', false, true, '2016-05-22 05:13:47.966752+05:30', 'S');
INSERT INTO auth_user VALUES (13, 'pbkdf2_sha256$24000$QKSEtIcJonbS$5GS7KN/ubZSfxKJCryKMHI3IMRs0yngFe4TeTAxR+GA=', NULL, false, 'user_9', 'user_9_firstname', 'user_9_lastname', 'user_9@mailid.com', false, true, '2016-05-22 05:13:48.088787+05:30', 'S');
INSERT INTO auth_user VALUES (14, 'pbkdf2_sha256$24000$TZOgWUsaQSt9$y3qw8GRqJD2LWyTJ5bhTLMOKklAQbZ4YyqGXGZI6Fjo=', NULL, false, 'user_10', 'user_10_firstname', 'user_10_lastname', 'user_10@mailid.com', false, true, '2016-05-22 05:13:48.244529+05:30', 'S');
INSERT INTO auth_user VALUES (15, 'pbkdf2_sha256$24000$8jtjweMns3DR$WcHqvoCuLP+rplZmD3nUocwajQiuNK/thnwH+cNNMjQ=', NULL, false, 'user_11', 'user_11_firstname', 'user_11_lastname', 'user_11@mailid.com', false, true, '2016-05-22 05:13:48.366267+05:30', 'S');
INSERT INTO auth_user VALUES (16, 'pbkdf2_sha256$24000$47AK6yrfEdHm$Hqfr+dhH1ddrYlCA4eJZEa7kgwAtWERtNORPt56+FGM=', NULL, false, 'user_12', 'user_12_firstname', 'user_12_lastname', 'user_12@mailid.com', false, true, '2016-05-22 05:13:48.488262+05:30', 'S');
INSERT INTO auth_user VALUES (17, 'pbkdf2_sha256$24000$nzoDninVBm1A$5p6Wqj6VsPraOW0rTeTphRarcFAxJ2IHVFEl4JZ6N0k=', NULL, false, 'user_13', 'user_13_firstname', 'user_13_lastname', 'user_13@mailid.com', false, true, '2016-05-22 05:13:48.610567+05:30', 'S');
INSERT INTO auth_user VALUES (18, 'pbkdf2_sha256$24000$0KOwJxe86xiA$TVzDjHLrQgADsS1mBP5gekK6wnpXpADvgjAjHoyBc+M=', NULL, false, 'user_14', 'user_14_firstname', 'user_14_lastname', 'user_14@mailid.com', false, true, '2016-05-22 05:13:48.710187+05:30', 'S');
INSERT INTO auth_user VALUES (19, 'pbkdf2_sha256$24000$91xb4F1y2pGK$mTVcvC01NbUvsBqJUNVmQBpCIY1YNd13cpzVQpUFDoc=', NULL, false, 'user_15', 'user_15_firstname', 'user_15_lastname', 'user_15@mailid.com', false, true, '2016-05-22 05:13:48.832253+05:30', 'S');
INSERT INTO auth_user VALUES (20, 'pbkdf2_sha256$24000$TN7iY9wFIF1t$2Cp+OU3pylvadN2X4UHMwqcmt+R9VCO9AcQfBy6zjPk=', NULL, false, 'user_16', 'user_16_firstname', 'user_16_lastname', 'user_16@mailid.com', false, true, '2016-05-22 05:13:48.943476+05:30', 'S');
INSERT INTO auth_user VALUES (25, 'pbkdf2_sha256$24000$ET0QPeuAYQPp$P0zw0cUo4l5ueBRrpXFyd7Ql0CtQhtylbmJc+dCroLU=', NULL, false, 'user_21', 'user_21_firstname', 'user_21_lastname', 'user_21@mailid.com', false, true, '2016-05-22 05:13:49.68683+05:30', 'S');
INSERT INTO auth_user VALUES (21, 'pbkdf2_sha256$24000$RMAJHDVGqSp7$XjgHayEIBrs/mjNn+uB6j01mq3fwfpI1lGZ4ZzldHfI=', NULL, false, 'user_17', 'user_17_firstname', 'user_17_lastname', 'user_17@mailid.com', false, true, '2016-05-22 05:13:49.165263+05:30', 'S');
INSERT INTO auth_user VALUES (26, 'pbkdf2_sha256$24000$fFaA0joAkslZ$Z5SMmQqEdywn90pG7n5C3LAgvTZKxyRX0mOILJmJT14=', NULL, false, 'user_22', 'user_22_firstname', 'user_22_lastname', 'user_22@mailid.com', false, true, '2016-05-22 05:13:49.808996+05:30', 'S');
INSERT INTO auth_user VALUES (27, 'pbkdf2_sha256$24000$nmFgxFi8DJTM$qd2qHCljffsqOxVwWizNA53pG0F42QDbLRQ//GRAcmw=', NULL, false, 'user_23', 'user_23_firstname', 'user_23_lastname', 'user_23@mailid.com', false, true, '2016-05-22 05:13:49.930722+05:30', 'S');
INSERT INTO auth_user VALUES (28, 'pbkdf2_sha256$24000$qKzk4jtA87hm$mMOiEwvJ014rdc6d6JnXzW/jz+8lzZ0cUZ4MxNemlk0=', NULL, false, 'user_24', 'user_24_firstname', 'user_24_lastname', 'user_24@mailid.com', false, true, '2016-05-22 05:13:50.06402+05:30', 'S');
INSERT INTO auth_user VALUES (29, 'pbkdf2_sha256$24000$0amYUutHexKc$2IDCysowqvj7BQtd+VBIkWSpMxfb9nQ9pjBFqMGGrG4=', NULL, false, 'user_25', 'user_25_firstname', 'user_25_lastname', 'user_25@mailid.com', false, true, '2016-05-22 05:13:50.174844+05:30', 'S');
INSERT INTO auth_user VALUES (30, 'pbkdf2_sha256$24000$nYZFxKJyBuXb$6y/VUFz+nTFuUaE9PGKfCj45SrbB/Maim4EurQpKzcY=', NULL, false, 'user_26', 'user_26_firstname', 'user_26_lastname', 'user_26@mailid.com', false, true, '2016-05-22 05:13:50.296978+05:30', 'S');
INSERT INTO auth_user VALUES (31, 'pbkdf2_sha256$24000$rwMJvY3BCssS$EEIO8t0fWwU06SoD00eaMyM2EMfkc8QtbN8SXX0PaxM=', NULL, false, 'user_27', 'user_27_firstname', 'user_27_lastname', 'user_27@mailid.com', false, true, '2016-05-22 05:13:50.407851+05:30', 'S');
INSERT INTO auth_user VALUES (32, 'pbkdf2_sha256$24000$8ck3EOh2D6we$Z02bdDYSJQjaHK9JuLx1oA+o3MyAf2ytQ31wJGUixFs=', NULL, false, 'user_28', 'user_28_firstname', 'user_28_lastname', 'user_28@mailid.com', false, true, '2016-05-22 05:13:50.51882+05:30', 'S');
INSERT INTO auth_user VALUES (33, 'pbkdf2_sha256$24000$AyC3xZZbcj3a$nxWfLf2pO3tMKTiE70WO4gCJgz6p/mmtONta52L95qg=', NULL, false, 'user_29', 'user_29_firstname', 'user_29_lastname', 'user_29@mailid.com', false, true, '2016-05-22 05:13:50.696407+05:30', 'S');
INSERT INTO auth_user VALUES (34, 'pbkdf2_sha256$24000$IhhvQmUOTlg8$B80fzW2q/6CDAqOJMm8z2ICKqFf1gKfuHJksws/K5gU=', NULL, false, 'user_30', 'user_30_firstname', 'user_30_lastname', 'user_30@mailid.com', false, true, '2016-05-22 05:13:50.807377+05:30', 'S');
INSERT INTO auth_user VALUES (35, 'pbkdf2_sha256$24000$g7QboTTTj1qh$wDMR55LLt1dWBtxNIqmJlcvXOkbAPo7+ASP/TVo5q7k=', NULL, false, 'user_31', 'user_31_firstname', 'user_31_lastname', 'user_31@mailid.com', false, true, '2016-05-22 05:13:50.918372+05:30', 'S');
INSERT INTO auth_user VALUES (36, 'pbkdf2_sha256$24000$lZRKKSyLX4lL$ZFuRKgMWYs+MjE4XV89zx1pPrDdwaWlwiv3OpAUV8eM=', NULL, false, 'user_32', 'user_32_firstname', 'user_32_lastname', 'user_32@mailid.com', false, true, '2016-05-22 05:13:51.040406+05:30', 'S');
INSERT INTO auth_user VALUES (37, 'pbkdf2_sha256$24000$3uUvv5oKJ44W$u3UDTuA7klfpH4UgMNdkzw9lUELuRGc9ni2kCUznkG0=', NULL, false, 'user_33', 'user_33_firstname', 'user_33_lastname', 'user_33@mailid.com', false, true, '2016-05-22 05:13:51.162588+05:30', 'S');
INSERT INTO auth_user VALUES (38, 'pbkdf2_sha256$24000$vijQlCznnVGS$JKIvWHP0+vydeGBGFbB1ngeQGjQHx3xWvuR6zaK7Mgw=', NULL, false, 'user_34', 'user_34_firstname', 'user_34_lastname', 'user_34@mailid.com', false, true, '2016-05-22 05:13:51.284518+05:30', 'S');
INSERT INTO auth_user VALUES (39, 'pbkdf2_sha256$24000$vRUuvWyZor3a$sJ9Y4BAbfS7418HIaiucIMhIVixo/p+GoaQ2HCP3QMw=', NULL, false, 'user_35', 'user_35_firstname', 'user_35_lastname', 'user_35@mailid.com', false, true, '2016-05-22 05:13:51.406568+05:30', 'S');
INSERT INTO auth_user VALUES (40, 'pbkdf2_sha256$24000$4n4OnZ0XzePH$84q9dVwpucppOp6IJzyQvVfi/isOBAlXVm1pONlGIaI=', NULL, false, 'user_36', 'user_36_firstname', 'user_36_lastname', 'user_36@mailid.com', false, true, '2016-05-22 05:13:51.528561+05:30', 'S');
INSERT INTO auth_user VALUES (41, 'pbkdf2_sha256$24000$BipGkaY1ghge$s4bSMI+hoaAEXyT7NnC0d1VWs3UtIRno+LFWWeIlUFA=', NULL, false, 'user_37', 'user_37_firstname', 'user_37_lastname', 'user_37@mailid.com', false, true, '2016-05-22 05:13:51.650714+05:30', 'S');
INSERT INTO auth_user VALUES (24, 'pbkdf2_sha256$24000$gvno1YQmsfXF$wGKe0ntVLlw1tAVrbm8jtQ7kRJB3Y/ebGUhRWwAx3Ys=', NULL, false, 'user_20', 'user_20_firstname', 'user_20_lastname', 'user_20@mailid.com', false, true, '2016-05-22 05:13:49.509103+05:30', 'S');
INSERT INTO auth_user VALUES (6, 'pbkdf2_sha256$24000$ckZBWDfo8rrg$5uLnb5oFIGDIvuy3r8sMQfy5u0qGJVL7oiU9QlTuI7s=', '2016-05-23 07:14:51.982865+05:30', false, 'user_2', 'user_2_firstname', 'user_2_lastname', 'user_2@mailid.com', false, true, '2016-05-22 05:13:47.212287+05:30', 'S');
INSERT INTO auth_user VALUES (44, 'pbkdf2_sha256$24000$3XkfAznZyzdZ$Cd7VyDwJbqCXLhuate0euJvHcYKOZqj0MCQ0JtZBgNc=', NULL, false, 'user_40', 'user_40_firstname', 'user_40_lastname', 'user_40@mailid.com', false, true, '2016-05-22 05:13:52.072431+05:30', 'S');
INSERT INTO auth_user VALUES (45, 'pbkdf2_sha256$24000$O67qNl74ZU2v$x6tnU1q2a/QKkWJ9GACXtzanVsPTcLTW04CfXFZ0FqM=', NULL, false, 'user_41', 'user_41_firstname', 'user_41_lastname', 'user_41@mailid.com', false, true, '2016-05-22 05:13:52.210711+05:30', 'S');
INSERT INTO auth_user VALUES (46, 'pbkdf2_sha256$24000$RyrWS24dFAqQ$o5rn44EpHt4C7tOEBZSjY5j272CMXI9OxVv5Po+l0OI=', NULL, false, 'user_42', 'user_42_firstname', 'user_42_lastname', 'user_42@mailid.com', false, true, '2016-05-22 05:13:52.327503+05:30', 'S');
INSERT INTO auth_user VALUES (47, 'pbkdf2_sha256$24000$kl7QBATYjmjB$WvXEtB74al6t4syloUpEippM+8zU77C4wj9JsuDHb2Q=', NULL, false, 'user_43', 'user_43_firstname', 'user_43_lastname', 'user_43@mailid.com', false, true, '2016-05-22 05:13:52.449595+05:30', 'S');
INSERT INTO auth_user VALUES (48, 'pbkdf2_sha256$24000$K2d3Vvp4AzNu$MCDdt44QgPBgsDYpPd3RjDIR1iOXiTmcCNudh5K2e1Y=', NULL, false, 'user_44', 'user_44_firstname', 'user_44_lastname', 'user_44@mailid.com', false, true, '2016-05-22 05:13:52.61609+05:30', 'S');
INSERT INTO auth_user VALUES (49, 'pbkdf2_sha256$24000$ZJlJTilNBves$ayLPUxehLZUT6xKnkqq7P69WDuUUSf3m+gsROiH2ZTI=', NULL, false, 'user_45', 'user_45_firstname', 'user_45_lastname', 'user_45@mailid.com', false, true, '2016-05-22 05:13:52.738049+05:30', 'S');
INSERT INTO auth_user VALUES (50, 'pbkdf2_sha256$24000$wmuNWkXM3TKx$QgHV/bTciPWsYvzTCCI/wGGcrceWMC1LSuBsZzxlOaw=', NULL, false, 'user_46', 'user_46_firstname', 'user_46_lastname', 'user_46@mailid.com', false, true, '2016-05-22 05:13:52.871222+05:30', 'S');
INSERT INTO auth_user VALUES (51, 'pbkdf2_sha256$24000$CwJrqAUVbZPE$QEOL0A0nwlHn6FqPzxb4ZLCoMa7uFtP3fm3njv8jhEI=', NULL, false, 'user_47', 'user_47_firstname', 'user_47_lastname', 'user_47@mailid.com', false, true, '2016-05-22 05:13:52.9937+05:30', 'S');
INSERT INTO auth_user VALUES (52, 'pbkdf2_sha256$24000$xhkdgidZdC7w$u+RUil6xl9Bu6FE/PYF58bmrxzyPMzSmjPgX75XDMkI=', NULL, false, 'user_48', 'user_48_firstname', 'user_48_lastname', 'user_48@mailid.com', false, true, '2016-05-22 05:13:53.115726+05:30', 'S');
INSERT INTO auth_user VALUES (53, 'pbkdf2_sha256$24000$iD7SB4H6LMhn$2nRPoFs5yEq/7vWQvm7vM5aSs3FKjiRcVBqT+zFhcdk=', NULL, false, 'user_49', 'user_49_firstname', 'user_49_lastname', 'user_49@mailid.com', false, true, '2016-05-22 05:13:53.248561+05:30', 'S');
INSERT INTO auth_user VALUES (54, 'pbkdf2_sha256$24000$I8F06GGWrIgB$bVWDKOn7Eg/9YBTi5BlSiQ0CkVWHDHFH0jUO55imeQI=', NULL, false, 'user_50', 'user_50_firstname', 'user_50_lastname', 'user_50@mailid.com', false, true, '2016-05-22 05:13:53.381852+05:30', 'S');
INSERT INTO auth_user VALUES (55, 'pbkdf2_sha256$24000$taGZPpd0mdZE$Klhz1FGbKm1yTs3ZLB93mhGwkCM4v8wDVptWXiiIue4=', NULL, false, 'user_51', 'user_51_firstname', 'user_51_lastname', 'user_51@mailid.com', false, true, '2016-05-22 05:13:53.514878+05:30', 'S');
INSERT INTO auth_user VALUES (56, 'pbkdf2_sha256$24000$vvTGreQRSvzp$Z8elbX2ux6BQ4U+XJn93U3zQKzJUr9qUgIyMNfHzewM=', NULL, false, 'user_52', 'user_52_firstname', 'user_52_lastname', 'user_52@mailid.com', false, true, '2016-05-22 05:13:53.647984+05:30', 'S');
INSERT INTO auth_user VALUES (57, 'pbkdf2_sha256$24000$4d1FumZ4mJQT$nd9GeMYgTiej7Z6Vpi7KeGGmSwZmCUEM6axXj7xaf60=', NULL, false, 'user_53', 'user_53_firstname', 'user_53_lastname', 'user_53@mailid.com', false, true, '2016-05-22 05:13:53.770221+05:30', 'S');
INSERT INTO auth_user VALUES (58, 'pbkdf2_sha256$24000$zr2WhXW2XaXu$xhjNs6YXT3930+b2ekYHIM/kU3DO3Uk4cUJpVSeJVBw=', NULL, false, 'user_54', 'user_54_firstname', 'user_54_lastname', 'user_54@mailid.com', false, true, '2016-05-22 05:13:53.903304+05:30', 'S');
INSERT INTO auth_user VALUES (59, 'pbkdf2_sha256$24000$LI2XQVhRRrth$dUu8emQcGT7XsSy/b0rV9zzefPHByHavsjY58aSrS/Y=', NULL, false, 'user_55', 'user_55_firstname', 'user_55_lastname', 'user_55@mailid.com', false, true, '2016-05-22 05:13:54.02534+05:30', 'S');
INSERT INTO auth_user VALUES (60, 'pbkdf2_sha256$24000$lRYJiaCFseDt$rL7TbH/lrtVoorEc1CHjEt/ZAG/I9PfapwkaV9AKoUA=', NULL, false, 'user_56', 'user_56_firstname', 'user_56_lastname', 'user_56@mailid.com', false, true, '2016-05-22 05:13:54.158659+05:30', 'S');
INSERT INTO auth_user VALUES (61, 'pbkdf2_sha256$24000$tIfK1kaemPsW$qcR7r+gjz7dR6hX0s+iDWGbmKCnzrpNjbg7LuROXWY8=', NULL, false, 'user_57', 'user_57_firstname', 'user_57_lastname', 'user_57@mailid.com', false, true, '2016-05-22 05:13:54.291523+05:30', 'S');
INSERT INTO auth_user VALUES (62, 'pbkdf2_sha256$24000$hWOtzbzV65i6$5XRyC1q1Z+cTlUhdW4hFEkDVcIoTWxTHURnPUtMPA7s=', NULL, false, 'user_58', 'user_58_firstname', 'user_58_lastname', 'user_58@mailid.com', false, true, '2016-05-22 05:13:54.424724+05:30', 'S');
INSERT INTO auth_user VALUES (63, 'pbkdf2_sha256$24000$DH4tL7ktnr2m$rFc7eOkk4YG2F8eo4hIDloDEHp1y77wvyPBR/6F6o6E=', NULL, false, 'user_59', 'user_59_firstname', 'user_59_lastname', 'user_59@mailid.com', false, true, '2016-05-22 05:13:54.569015+05:30', 'S');
INSERT INTO auth_user VALUES (64, 'pbkdf2_sha256$24000$Ayz0yuMqPSOO$7xnepgyqvvWPDFUFM1Mn8MxD1y6LKq6zTnDVU7Nw+BY=', NULL, false, 'user_60', 'user_60_firstname', 'user_60_lastname', 'user_60@mailid.com', false, true, '2016-05-22 05:13:54.702259+05:30', 'S');
INSERT INTO auth_user VALUES (65, 'pbkdf2_sha256$24000$jDybOeY8yD6E$GnLIQSvqecHd7NJ86E7rkCD41L3YBI1mgedCiUUvqI8=', NULL, false, 'user_61', 'user_61_firstname', 'user_61_lastname', 'user_61@mailid.com', false, true, '2016-05-22 05:13:54.824142+05:30', 'S');
INSERT INTO auth_user VALUES (66, 'pbkdf2_sha256$24000$PekBousDye8U$vGLqtXEHIgLyFW75kn3SksSS9KGrdLfZwyj5bgw19C8=', NULL, false, 'user_62', 'user_62_firstname', 'user_62_lastname', 'user_62@mailid.com', false, true, '2016-05-22 05:13:54.946647+05:30', 'S');
INSERT INTO auth_user VALUES (67, 'pbkdf2_sha256$24000$Wy3OM4x4NflN$yTYIvncnxs5eJaCSqFu0hqS/u28QXAq7zWQpif90MSY=', NULL, false, 'user_63', 'user_63_firstname', 'user_63_lastname', 'user_63@mailid.com', false, true, '2016-05-22 05:13:55.079421+05:30', 'S');
INSERT INTO auth_user VALUES (68, 'pbkdf2_sha256$24000$UWjdXfzvTjtQ$+qOS00YMskyhkztoaeCctOg8cS1rOKKLrb38hsQqVok=', NULL, false, 'user_64', 'user_64_firstname', 'user_64_lastname', 'user_64@mailid.com', false, true, '2016-05-22 05:13:55.212777+05:30', 'S');
INSERT INTO auth_user VALUES (69, 'pbkdf2_sha256$24000$PnyYRtphD1dV$MP8l+ZmOofR1VDDIld6Hnk12ayX0N25sufPIiXaRMSQ=', NULL, false, 'user_65', 'user_65_firstname', 'user_65_lastname', 'user_65@mailid.com', false, true, '2016-05-22 05:13:55.367941+05:30', 'S');
INSERT INTO auth_user VALUES (70, 'pbkdf2_sha256$24000$cwb1NidCLXde$uToBT/vm8fBGdT7AATJ401y8S7VZeZB2RDoNiuTfnvY=', NULL, false, 'user_66', 'user_66_firstname', 'user_66_lastname', 'user_66@mailid.com', false, true, '2016-05-22 05:13:55.501108+05:30', 'S');
INSERT INTO auth_user VALUES (71, 'pbkdf2_sha256$24000$ScRc742GNdbn$sX7DIBr8sRlxVCQJTEFj8bxhoSdRo9/c3RpQxOsMhm0=', NULL, false, 'user_67', 'user_67_firstname', 'user_67_lastname', 'user_67@mailid.com', false, true, '2016-05-22 05:13:55.623089+05:30', 'S');
INSERT INTO auth_user VALUES (72, 'pbkdf2_sha256$24000$8cGEvXDb4RoV$ej8oHU7rpg4VWVPTRZOQXJW4BMY2kNg/HUn6UoCgZmk=', NULL, false, 'user_68', 'user_68_firstname', 'user_68_lastname', 'user_68@mailid.com', false, true, '2016-05-22 05:13:55.756278+05:30', 'S');
INSERT INTO auth_user VALUES (73, 'pbkdf2_sha256$24000$7V30ytTa88Iq$eRKv4Fy5ub270ky6gC3IrwfaRl6mmVo2J5EVQ8PaYVk=', NULL, false, 'user_69', 'user_69_firstname', 'user_69_lastname', 'user_69@mailid.com', false, true, '2016-05-22 05:13:55.889338+05:30', 'S');
INSERT INTO auth_user VALUES (74, 'pbkdf2_sha256$24000$NiBAKdvXgFBk$35QUklkA6LrTyh/wGUiFtrKtpZfyVPb4KUCTBWaaorA=', NULL, false, 'user_70', 'user_70_firstname', 'user_70_lastname', 'user_70@mailid.com', false, true, '2016-05-22 05:13:56.022565+05:30', 'S');
INSERT INTO auth_user VALUES (75, 'pbkdf2_sha256$24000$QnukbkId4NLO$U7jcTdUbz0n5I+QhCCakZmQaWMciGRrNbsPY5wHC3HY=', NULL, false, 'user_71', 'user_71_firstname', 'user_71_lastname', 'user_71@mailid.com', false, true, '2016-05-22 05:13:56.144792+05:30', 'S');
INSERT INTO auth_user VALUES (76, 'pbkdf2_sha256$24000$mTJOnOZlbHle$FJdlNZYVtDRK1vJOJBS9HrJg+j33pICqennC/Y88oxk=', NULL, false, 'user_72', 'user_72_firstname', 'user_72_lastname', 'user_72@mailid.com', false, true, '2016-05-22 05:13:56.27774+05:30', 'S');
INSERT INTO auth_user VALUES (77, 'pbkdf2_sha256$24000$C9S51PsTNweW$SIMzhTKEYnRCwChTQ+dTNgr6qI0Cnmx58OS7lP17dcc=', NULL, false, 'user_73', 'user_73_firstname', 'user_73_lastname', 'user_73@mailid.com', false, true, '2016-05-22 05:13:56.411102+05:30', 'S');
INSERT INTO auth_user VALUES (78, 'pbkdf2_sha256$24000$2iQbcZWTeGYS$KL8oyScevvuhoe8jLUDN1eY0YZcdOQiMl6lIN97m+aM=', NULL, false, 'user_74', 'user_74_firstname', 'user_74_lastname', 'user_74@mailid.com', false, true, '2016-05-22 05:13:56.544176+05:30', 'S');
INSERT INTO auth_user VALUES (79, 'pbkdf2_sha256$24000$aStCfh3GN00C$TllzUigygWX9OWl2qAjSTtR4R4x21ajg3YSJ+8BN76Y=', NULL, false, 'user_75', 'user_75_firstname', 'user_75_lastname', 'user_75@mailid.com', false, true, '2016-05-22 05:13:56.688439+05:30', 'S');
INSERT INTO auth_user VALUES (42, 'pbkdf2_sha256$24000$BkLUg8vTOMMZ$mQxi0AXCUx+xJjdVXVG7G0N9GavEsBs7M2TiE2Lc9/0=', NULL, false, 'user_38', 'user_38_firstname', 'user_38_lastname', 'user_38@mailid.com', false, true, '2016-05-22 05:13:51.761641+05:30', 'S');
INSERT INTO auth_user VALUES (43, 'pbkdf2_sha256$24000$GpcWIOMC9puR$VuwXOX2pP5/x8z2dU4M9u1lHjLDqz2Zm4qaivBYwN2M=', NULL, false, 'user_39', 'user_39_firstname', 'user_39_lastname', 'user_39@mailid.com', false, true, '2016-05-22 05:13:51.905874+05:30', 'S');
INSERT INTO auth_user VALUES (89, 'pbkdf2_sha256$24000$2z4QMDWSGi0e$fjX4VhxMQpJPejbQI1hVylT+JY86cnJnkfxnGzWAEug=', NULL, false, 'user_85', 'user_85_firstname', 'user_85_lastname', 'user_85@mailid.com', false, true, '2016-05-22 05:13:58.009064+05:30', 'S');
INSERT INTO auth_user VALUES (90, 'pbkdf2_sha256$24000$cvDQEjDlrBRn$PctHTLk33Z8z1f2kbX40cWEF12NPM5cRUe4wPNb/fO0=', NULL, false, 'user_86', 'user_86_firstname', 'user_86_lastname', 'user_86@mailid.com', false, true, '2016-05-22 05:13:58.142371+05:30', 'S');
INSERT INTO auth_user VALUES (91, 'pbkdf2_sha256$24000$DL8FD4rrYn2s$5QWPKqrAnF+5r+6xzlTc3+sfusGYZ+e9e4ZgDnntCjQ=', NULL, false, 'user_87', 'user_87_firstname', 'user_87_lastname', 'user_87@mailid.com', false, true, '2016-05-22 05:13:58.2975+05:30', 'S');
INSERT INTO auth_user VALUES (92, 'pbkdf2_sha256$24000$AgMhtifPY0z1$ljlutODv7M/ohIbhQMsktC4NZykvLGuMNm1KVnTsMFg=', NULL, false, 'user_88', 'user_88_firstname', 'user_88_lastname', 'user_88@mailid.com', false, true, '2016-05-22 05:13:58.452564+05:30', 'S');
INSERT INTO auth_user VALUES (99, 'pbkdf2_sha256$24000$C0ImeNhDBiOa$y+N5SUKuwl7FlkTvajXQ5aRDDnELNiyNa4DI/zxb2TU=', NULL, false, 'user_95', 'user_95_firstname', 'user_95_lastname', 'user_95@mailid.com', false, true, '2016-05-22 05:13:59.373781+05:30', 'S');
INSERT INTO auth_user VALUES (100, 'pbkdf2_sha256$24000$ZgIk6kZqmtvS$ZxrxugU3/5Hmy7DpGRmn9HXQhIKg2FLyCPW/dLqu1j8=', NULL, false, 'user_96', 'user_96_firstname', 'user_96_lastname', 'user_96@mailid.com', false, true, '2016-05-22 05:13:59.528919+05:30', 'S');
INSERT INTO auth_user VALUES (101, 'pbkdf2_sha256$24000$twrlOraIUdkb$D6Fpi/Go8n+Y1EAdNxl1c2xq3eTQyOV1zFtmemto+rk=', NULL, false, 'user_97', 'user_97_firstname', 'user_97_lastname', 'user_97@mailid.com', false, true, '2016-05-22 05:13:59.650968+05:30', 'S');
INSERT INTO auth_user VALUES (102, 'pbkdf2_sha256$24000$mu6wH1gAZZuK$tUcHt7NKL+GG/Yjfr4Ajs3BTpUEsT/SBIEnJt1d1Ovk=', NULL, false, 'user_98', 'user_98_firstname', 'user_98_lastname', 'user_98@mailid.com', false, true, '2016-05-22 05:13:59.773074+05:30', 'S');
INSERT INTO auth_user VALUES (103, 'pbkdf2_sha256$24000$s3qk6jOvY0EH$ZfTx717yforBryiXlWykG3/u/t0bh53Xv6uls3MF6Xg=', NULL, false, 'user_99', 'user_99_firstname', 'user_99_lastname', 'user_99@mailid.com', false, true, '2016-05-22 05:13:59.895165+05:30', 'S');
INSERT INTO auth_user VALUES (106, 'pbkdf2_sha256$24000$m8hYTbbaa2jo$9fMy7FLyXayQvTD/ELgnns+PygiK58+7So0xp7xALYQ=', '2016-05-23 05:51:11.182837+05:30', false, 'student', 'student', 'student', 'student@mail.com', false, true, '2016-05-22 14:18:00.080845+05:30', 'S');
INSERT INTO auth_user VALUES (80, 'pbkdf2_sha256$24000$HXNn0yPo8y9K$RqnNDtOQm3UsRJp5igTHl4VQeg1TW1Wvwmm7MGOCizk=', NULL, false, 'user_76', 'user_76_firstname', 'user_76_lastname', 'user_76@mailid.com', false, true, '2016-05-22 05:13:56.810556+05:30', 'S');
INSERT INTO auth_user VALUES (81, 'pbkdf2_sha256$24000$KK525K8D5D4k$tR6c69fs8vk6VS2SXG1jDni5PEiEtsXgveqfDk7RCyY=', NULL, false, 'user_77', 'user_77_firstname', 'user_77_lastname', 'user_77@mailid.com', false, true, '2016-05-22 05:13:56.932428+05:30', 'S');
INSERT INTO auth_user VALUES (82, 'pbkdf2_sha256$24000$wMEBhknR4ZmT$EUeX1aYFLiQPhfpfixjLue96R/sKXkCqCYj7XNqWJhQ=', NULL, false, 'user_78', 'user_78_firstname', 'user_78_lastname', 'user_78@mailid.com', false, true, '2016-05-22 05:13:57.054506+05:30', 'S');
INSERT INTO auth_user VALUES (83, 'pbkdf2_sha256$24000$eCizXI1w3NjB$WNcZc+dpuwGYMQY8PKpW5jNdM85A7ZjnLCNgc+cO7aI=', NULL, false, 'user_79', 'user_79_firstname', 'user_79_lastname', 'user_79@mailid.com', false, true, '2016-05-22 05:13:57.165459+05:30', 'S');
INSERT INTO auth_user VALUES (84, 'pbkdf2_sha256$24000$Yz1y1fQGPNsH$WpANJQ6Nw1Kn/wjtmS2c/DB+9w0s0reDRGeV9qLsXDk=', NULL, false, 'user_80', 'user_80_firstname', 'user_80_lastname', 'user_80@mailid.com', false, true, '2016-05-22 05:13:57.321119+05:30', 'S');
INSERT INTO auth_user VALUES (85, 'pbkdf2_sha256$24000$mmyjUiH46tdp$BaUX66/GEIGRZ7M8c1gZ/hq4SYS2d7Ig9v5CKfxZcEY=', NULL, false, 'user_81', 'user_81_firstname', 'user_81_lastname', 'user_81@mailid.com', false, true, '2016-05-22 05:13:57.442885+05:30', 'S');
INSERT INTO auth_user VALUES (86, 'pbkdf2_sha256$24000$E4hxrrWXn91X$Vo/1hHB/ZV2x/8N4KRnJf/5DoqlSdmeTA7QC1FaxHQ0=', NULL, false, 'user_82', 'user_82_firstname', 'user_82_lastname', 'user_82@mailid.com', false, true, '2016-05-22 05:13:57.565262+05:30', 'S');
INSERT INTO auth_user VALUES (87, 'pbkdf2_sha256$24000$FkKIUsZ9h4Z4$ZQnzXrCCwN9+jsToFh4N5nB+6u91xJ01wpH2EoWed+M=', NULL, false, 'user_83', 'user_83_firstname', 'user_83_lastname', 'user_83@mailid.com', false, true, '2016-05-22 05:13:57.720403+05:30', 'S');
INSERT INTO auth_user VALUES (88, 'pbkdf2_sha256$24000$hDkrVa2DReoh$d4Xve4iPY7IP4Qhe8v1w9XByk60yu8LCw1t5Utva6rE=', NULL, false, 'user_84', 'user_84_firstname', 'user_84_lastname', 'user_84@mailid.com', false, true, '2016-05-22 05:13:57.875659+05:30', 'S');
INSERT INTO auth_user VALUES (93, 'pbkdf2_sha256$24000$nI89hmeiwrea$w4nxkXNyf6m1b7hN6AsFS/sEzYxgszBrv0SO/0PdNu0=', NULL, false, 'user_89', 'user_89_firstname', 'user_89_lastname', 'user_89@mailid.com', false, true, '2016-05-22 05:13:58.574686+05:30', 'S');
INSERT INTO auth_user VALUES (94, 'pbkdf2_sha256$24000$tpgiwqduJDSk$dxMQ3Ul2bA1WgjmyPcHsIVPtebDcsdpy6EdkTwoELGs=', NULL, false, 'user_90', 'user_90_firstname', 'user_90_lastname', 'user_90@mailid.com', false, true, '2016-05-22 05:13:58.707789+05:30', 'S');
INSERT INTO auth_user VALUES (95, 'pbkdf2_sha256$24000$f5XSEVXv1rUD$Cu6epVzyKayRNMhYq+Y8BiFB6gGceyyPuAASWasORHA=', NULL, false, 'user_91', 'user_91_firstname', 'user_91_lastname', 'user_91@mailid.com', false, true, '2016-05-22 05:13:58.840945+05:30', 'S');
INSERT INTO auth_user VALUES (96, 'pbkdf2_sha256$24000$Y2qnk1rrQgVB$d+O78vS9CSUs+YO8Iva+lMcAY3fygaGEr8nO2wPqgCY=', NULL, false, 'user_92', 'user_92_firstname', 'user_92_lastname', 'user_92@mailid.com', false, true, '2016-05-22 05:13:58.963092+05:30', 'S');
INSERT INTO auth_user VALUES (97, 'pbkdf2_sha256$24000$D4BnICWsjLvt$b9v1q+FZAw1bAjsc+J1oouPveNvoqXmWt1YILEjHWOk=', NULL, false, 'user_93', 'user_93_firstname', 'user_93_lastname', 'user_93@mailid.com', false, true, '2016-05-22 05:13:59.140597+05:30', 'S');
INSERT INTO auth_user VALUES (98, 'pbkdf2_sha256$24000$wZsk4FeVnRDa$vIahtvVy7XeJ8tRh27GZrVT6EMyMeOEwdN6xhkS/Azk=', NULL, false, 'user_94', 'user_94_firstname', 'user_94_lastname', 'user_94@mailid.com', false, true, '2016-05-22 05:13:59.262709+05:30', 'S');
INSERT INTO auth_user VALUES (104, 'pbkdf2_sha256$24000$VE94OFqTcbyV$SaSL4iHrEbFEwg9M+zwJZrXJ5kS2zc80QPz3yDJTclE=', NULL, false, 'user_100', 'user_100_firstname', 'user_100_lastname', 'user_100@mailid.com', false, true, '2016-05-22 05:14:00.028304+05:30', 'S');
INSERT INTO auth_user VALUES (5, 'pbkdf2_sha256$24000$2UKNVcLtbU1I$tBcTTd7GttWZXG/KJBRa1W4PlNLENlX1Q1d4XPj/qFY=', '2016-05-23 07:27:23.55759+05:30', false, 'user_1', 'user_1_firstname', 'user_1_lastname', 'user_1@mailid.com', false, true, '2016-05-22 05:13:46.963246+05:30', 'S');
INSERT INTO auth_user VALUES (105, 'pbkdf2_sha256$24000$jYYxsexwHdxC$p7shduFUlWf+pd2mOp4QKNeZKpCOPG6VgnB50me+u0Q=', '2016-05-22 14:17:16.871764+05:30', false, 'abc', 'abc', 'abc', 'abc@mail.com', false, true, '2016-05-22 14:17:04.449805+05:30', 'S');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: niravkntr
--



--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('auth_user_id_seq', 106, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: niravkntr
--



--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: niravkntr
--



--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type VALUES (3, 'auth', 'group');
INSERT INTO django_content_type VALUES (4, 'auth', 'user');
INSERT INTO django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type VALUES (7, 'hub', 'hubdetails');
INSERT INTO django_content_type VALUES (8, 'hub', 'landmark');
INSERT INTO django_content_type VALUES (9, 'hub', 'hublandmark');
INSERT INTO django_content_type VALUES (10, 'hub', 'studentdetails');
INSERT INTO django_content_type VALUES (11, 'hub', 'registrationdetails');
INSERT INTO django_content_type VALUES (13, 'hub', 'timetable');
INSERT INTO django_content_type VALUES (14, 'hub', 'course');
INSERT INTO django_content_type VALUES (15, 'hub', 'hubcycle');
INSERT INTO django_content_type VALUES (16, 'sites', 'site');
INSERT INTO django_content_type VALUES (17, 'hub', 'history');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO django_migrations VALUES (1, 'contenttypes', '0001_initial', '2016-05-19 03:49:32.053573+05:30');
INSERT INTO django_migrations VALUES (2, 'auth', '0001_initial', '2016-05-19 03:49:33.477747+05:30');
INSERT INTO django_migrations VALUES (3, 'admin', '0001_initial', '2016-05-19 03:49:33.755115+05:30');
INSERT INTO django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2016-05-19 03:49:33.799395+05:30');
INSERT INTO django_migrations VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2016-05-19 03:49:33.899269+05:30');
INSERT INTO django_migrations VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2016-05-19 03:49:33.932555+05:30');
INSERT INTO django_migrations VALUES (7, 'auth', '0003_alter_user_email_max_length', '2016-05-19 03:49:33.965826+05:30');
INSERT INTO django_migrations VALUES (8, 'auth', '0004_alter_user_username_opts', '2016-05-19 03:49:33.991405+05:30');
INSERT INTO django_migrations VALUES (9, 'auth', '0005_alter_user_last_login_null', '2016-05-19 03:49:34.02143+05:30');
INSERT INTO django_migrations VALUES (10, 'auth', '0006_require_contenttypes_0002', '2016-05-19 03:49:34.033174+05:30');
INSERT INTO django_migrations VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2016-05-19 03:49:34.058418+05:30');
INSERT INTO django_migrations VALUES (12, 'sessions', '0001_initial', '2016-05-19 03:49:34.276821+05:30');
INSERT INTO django_migrations VALUES (13, 'hub', '0001_initial', '2016-05-19 03:55:00.967827+05:30');
INSERT INTO django_migrations VALUES (14, 'hub', '0002_auto_20160519_0629', '2016-05-19 11:59:46.631275+05:30');
INSERT INTO django_migrations VALUES (15, 'hub', '0003_auto_20160519_0854', '2016-05-19 14:24:34.292171+05:30');
INSERT INTO django_migrations VALUES (16, 'hub', '0004_auto_20160519_0902', '2016-05-19 14:37:53.401119+05:30');
INSERT INTO django_migrations VALUES (17, 'hub', '0005_delete_timetable', '2016-05-19 14:37:53.423369+05:30');
INSERT INTO django_migrations VALUES (18, 'hub', '0006_timetable', '2016-05-19 14:38:24.801973+05:30');
INSERT INTO django_migrations VALUES (19, 'hub', '0007_auto_20160519_1415', '2016-05-19 19:45:30.974237+05:30');
INSERT INTO django_migrations VALUES (20, 'hub', '0008_auto_20160519_1455', '2016-05-19 20:25:45.85747+05:30');
INSERT INTO django_migrations VALUES (21, 'hub', '0009_auto_20160519_2000', '2016-05-20 01:32:12.986931+05:30');
INSERT INTO django_migrations VALUES (22, 'hub', '0010_auto_20160519_2037', '2016-05-20 02:07:05.840542+05:30');
INSERT INTO django_migrations VALUES (23, 'hub', '0011_hubdetails_available', '2016-05-21 17:45:32.734148+05:30');
INSERT INTO django_migrations VALUES (24, 'hub', '0012_hubcycle', '2016-05-21 21:57:28.7538+05:30');
INSERT INTO django_migrations VALUES (25, 'hub', '0013_auto_20160521_1629', '2016-05-21 21:59:20.32628+05:30');
INSERT INTO django_migrations VALUES (26, 'hub', '0013_auto_20160521_1643', '2016-05-21 23:23:16.143621+05:30');
INSERT INTO django_migrations VALUES (27, 'hub', '0014_hubcycle', '2016-05-21 23:23:16.366372+05:30');
INSERT INTO django_migrations VALUES (28, 'hub', '0015_auto_20160521_1647', '2016-05-21 23:23:16.411666+05:30');
INSERT INTO django_migrations VALUES (29, 'hub', '0016_hubcycle', '2016-05-21 23:23:16.544115+05:30');
INSERT INTO django_migrations VALUES (30, 'hub', '0017_auto_20160521_1653', '2016-05-21 23:23:16.578021+05:30');
INSERT INTO django_migrations VALUES (31, 'hub', '0018_hubcycle', '2016-05-21 23:23:16.710761+05:30');
INSERT INTO django_migrations VALUES (32, 'hub', '0019_auto_20160521_1657', '2016-05-21 23:23:16.756797+05:30');
INSERT INTO django_migrations VALUES (33, 'hub', '0020_hubcycle', '2016-05-21 23:23:16.889081+05:30');
INSERT INTO django_migrations VALUES (34, 'hub', '0021_auto_20160521_1751', '2016-05-21 23:23:16.944696+05:30');
INSERT INTO django_migrations VALUES (35, 'hub', '0022_hubcycle', '2016-05-21 23:23:17.077317+05:30');
INSERT INTO django_migrations VALUES (36, 'sites', '0001_initial', '2016-05-21 23:23:17.232748+05:30');
INSERT INTO django_migrations VALUES (37, 'sites', '0002_alter_domain_unique', '2016-05-21 23:23:17.388173+05:30');
INSERT INTO django_migrations VALUES (38, 'hub', '0023_history', '2016-05-22 00:55:01.851626+05:30');
INSERT INTO django_migrations VALUES (39, 'hub', '0024_hubcycle_available', '2016-05-22 01:30:08.978308+05:30');
INSERT INTO django_migrations VALUES (40, 'hub', '0025_hubdetails_newavailable', '2016-05-22 20:36:13.373007+05:30');
INSERT INTO django_migrations VALUES (41, 'hub', '0026_capacity', '2016-05-23 02:21:37.189343+05:30');
INSERT INTO django_migrations VALUES (42, 'hub', '0027_delete_capacity', '2016-05-23 07:44:23.65706+05:30');


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('django_migrations_id_seq', 42, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: niravkntr
--



--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO django_site VALUES (1, 'example.com', 'example.com');


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: hub_course; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO hub_course VALUES (1, 'cs681', 'PA');
INSERT INTO hub_course VALUES (2, 'cs435', 'Linear Optimiztion');
INSERT INTO hub_course VALUES (3, 'cs224', 'Computer Networks');
INSERT INTO hub_course VALUES (4, 'cs310', 'Automata');
INSERT INTO hub_course VALUES (5, 'cs718', 'Software Architecture');
INSERT INTO hub_course VALUES (6, 'cs733', 'Cloud Engineering');
INSERT INTO hub_course VALUES (7, 'cs750', 'Linear Opti');
INSERT INTO hub_course VALUES (8, 'cs218', 'Design and Algo');
INSERT INTO hub_course VALUES (9, 'cs302', 'Implementation of Prog. Lang.');
INSERT INTO hub_course VALUES (10, 'cs632', 'Advance DBMS');
INSERT INTO hub_course VALUES (11, 'cs152', 'OPD');
INSERT INTO hub_course VALUES (12, 'cs347', 'Operatin Sysytem(M)');
INSERT INTO hub_course VALUES (13, 'cs792', 'Communication Skills');
INSERT INTO hub_course VALUES (14, 'cs671', 'Embeded System');
INSERT INTO hub_course VALUES (15, 'cs713', 'Automata and Theory');
INSERT INTO hub_course VALUES (16, 'cs333', 'Operating System Lab');
INSERT INTO hub_course VALUES (17, 'cs749', 'Digital Image Processing');
INSERT INTO hub_course VALUES (18, 'cs751', 'Parallel Processing');
INSERT INTO hub_course VALUES (19, 'cs763', 'Computer Vision');
INSERT INTO hub_course VALUES (20, 'Lunch', 'Lunch');


--
-- Name: hub_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('hub_course_id_seq', 1, false);


--
-- Data for Name: hub_history; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO hub_history VALUES (3, 'amit', 3, 'A', 'A');
INSERT INTO hub_history VALUES (2, 'amit', 2, 'A', 'A');
INSERT INTO hub_history VALUES (1, 'amit', 1, 'A', 'C');
INSERT INTO hub_history VALUES (5, 'amit', 70, 'C', 'A');
INSERT INTO hub_history VALUES (6, 'amit', 71, 'C', 'Kresit');
INSERT INTO hub_history VALUES (4, 'amit', 1, 'C', 'C');
INSERT INTO hub_history VALUES (8, 'amit', 15, 'C', 'C');
INSERT INTO hub_history VALUES (9, 'user_1', 53, 'C', 'A');
INSERT INTO hub_history VALUES (10, 'user_1', 9, 'A', 'C');
INSERT INTO hub_history VALUES (7, 'amit', 7, 'A', 'A');
INSERT INTO hub_history VALUES (11, 'user_1', 4, 'A', 'C');
INSERT INTO hub_history VALUES (12, 'amit', 8, 'A', 'A');
INSERT INTO hub_history VALUES (13, 'user_1', 10, 'A', 'C');
INSERT INTO hub_history VALUES (15, 'user_1', 90, 'C', 'Kresit');
INSERT INTO hub_history VALUES (14, 'amit', 38, 'B', 'A');
INSERT INTO hub_history VALUES (16, 'user_2', 52, 'A', 'Kresit');
INSERT INTO hub_history VALUES (18, 'user_1', 39, 'C', 'B');
INSERT INTO hub_history VALUES (17, 'user_2', 26, 'A', 'A');


--
-- Name: hub_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('hub_history_id_seq', 21, true);


--
-- Data for Name: hub_hubcycle; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO hub_hubcycle VALUES (35, 35, 4, true);
INSERT INTO hub_hubcycle VALUES (10, 10, 4, true);
INSERT INTO hub_hubcycle VALUES (27, 27, 4, true);
INSERT INTO hub_hubcycle VALUES (28, 28, 2, true);
INSERT INTO hub_hubcycle VALUES (42, 42, 2, true);
INSERT INTO hub_hubcycle VALUES (43, 43, 2, true);
INSERT INTO hub_hubcycle VALUES (51, 51, 2, true);
INSERT INTO hub_hubcycle VALUES (29, 29, 2, true);
INSERT INTO hub_hubcycle VALUES (38, 38, 2, true);
INSERT INTO hub_hubcycle VALUES (4, 4, 2, true);
INSERT INTO hub_hubcycle VALUES (32, 32, 2, true);
INSERT INTO hub_hubcycle VALUES (44, 44, 2, true);
INSERT INTO hub_hubcycle VALUES (45, 45, 2, true);
INSERT INTO hub_hubcycle VALUES (46, 46, 2, true);
INSERT INTO hub_hubcycle VALUES (47, 47, 2, true);
INSERT INTO hub_hubcycle VALUES (48, 48, 2, true);
INSERT INTO hub_hubcycle VALUES (49, 49, 2, true);
INSERT INTO hub_hubcycle VALUES (26, 26, 2, true);
INSERT INTO hub_hubcycle VALUES (40, 40, 2, true);
INSERT INTO hub_hubcycle VALUES (1, 1, 2, true);
INSERT INTO hub_hubcycle VALUES (30, 30, 1, true);
INSERT INTO hub_hubcycle VALUES (54, 54, 1, true);
INSERT INTO hub_hubcycle VALUES (33, 33, 1, true);
INSERT INTO hub_hubcycle VALUES (39, 39, 4, true);
INSERT INTO hub_hubcycle VALUES (37, 37, 4, true);
INSERT INTO hub_hubcycle VALUES (36, 36, 4, true);
INSERT INTO hub_hubcycle VALUES (31, 31, 4, true);
INSERT INTO hub_hubcycle VALUES (52, 52, 4, true);
INSERT INTO hub_hubcycle VALUES (2, 2, 4, true);
INSERT INTO hub_hubcycle VALUES (3, 3, 4, true);
INSERT INTO hub_hubcycle VALUES (53, 53, 4, true);
INSERT INTO hub_hubcycle VALUES (41, 41, 4, true);
INSERT INTO hub_hubcycle VALUES (34, 34, 3, true);
INSERT INTO hub_hubcycle VALUES (5, 5, 3, true);
INSERT INTO hub_hubcycle VALUES (6, 6, 1, true);
INSERT INTO hub_hubcycle VALUES (7, 7, 1, true);
INSERT INTO hub_hubcycle VALUES (8, 8, 1, true);
INSERT INTO hub_hubcycle VALUES (9, 9, 1, true);
INSERT INTO hub_hubcycle VALUES (11, 11, 1, true);
INSERT INTO hub_hubcycle VALUES (12, 12, 1, true);
INSERT INTO hub_hubcycle VALUES (13, 13, 1, true);
INSERT INTO hub_hubcycle VALUES (14, 14, 1, true);
INSERT INTO hub_hubcycle VALUES (15, 15, 1, true);
INSERT INTO hub_hubcycle VALUES (16, 16, 1, true);
INSERT INTO hub_hubcycle VALUES (17, 17, 1, true);
INSERT INTO hub_hubcycle VALUES (18, 18, 1, true);
INSERT INTO hub_hubcycle VALUES (19, 19, 1, true);
INSERT INTO hub_hubcycle VALUES (20, 20, 1, true);
INSERT INTO hub_hubcycle VALUES (21, 21, 1, true);
INSERT INTO hub_hubcycle VALUES (22, 22, 1, true);
INSERT INTO hub_hubcycle VALUES (23, 23, 1, true);
INSERT INTO hub_hubcycle VALUES (24, 24, 1, true);
INSERT INTO hub_hubcycle VALUES (25, 25, 1, true);
INSERT INTO hub_hubcycle VALUES (50, 50, 2, true);
INSERT INTO hub_hubcycle VALUES (55, 55, 1, true);
INSERT INTO hub_hubcycle VALUES (56, 56, 1, true);
INSERT INTO hub_hubcycle VALUES (57, 57, 1, true);
INSERT INTO hub_hubcycle VALUES (58, 58, 1, true);
INSERT INTO hub_hubcycle VALUES (59, 59, 2, true);
INSERT INTO hub_hubcycle VALUES (60, 60, 2, true);
INSERT INTO hub_hubcycle VALUES (74, 74, 1, true);
INSERT INTO hub_hubcycle VALUES (75, 75, 1, true);
INSERT INTO hub_hubcycle VALUES (76, 76, 2, true);
INSERT INTO hub_hubcycle VALUES (77, 77, 2, true);
INSERT INTO hub_hubcycle VALUES (90, 90, 2, true);
INSERT INTO hub_hubcycle VALUES (78, 78, 2, true);
INSERT INTO hub_hubcycle VALUES (79, 79, 2, true);
INSERT INTO hub_hubcycle VALUES (80, 80, 2, true);
INSERT INTO hub_hubcycle VALUES (81, 81, 2, true);
INSERT INTO hub_hubcycle VALUES (82, 82, 2, true);
INSERT INTO hub_hubcycle VALUES (83, 83, 2, true);
INSERT INTO hub_hubcycle VALUES (84, 84, 4, true);
INSERT INTO hub_hubcycle VALUES (85, 85, 4, true);
INSERT INTO hub_hubcycle VALUES (86, 86, 4, true);
INSERT INTO hub_hubcycle VALUES (87, 87, 4, true);
INSERT INTO hub_hubcycle VALUES (88, 88, 4, true);
INSERT INTO hub_hubcycle VALUES (89, 89, 4, true);
INSERT INTO hub_hubcycle VALUES (91, 91, 4, true);
INSERT INTO hub_hubcycle VALUES (92, 92, 4, true);
INSERT INTO hub_hubcycle VALUES (93, 93, 4, true);
INSERT INTO hub_hubcycle VALUES (94, 94, 4, true);
INSERT INTO hub_hubcycle VALUES (95, 95, 4, true);
INSERT INTO hub_hubcycle VALUES (96, 96, 4, true);
INSERT INTO hub_hubcycle VALUES (97, 97, 4, true);
INSERT INTO hub_hubcycle VALUES (98, 98, 4, true);
INSERT INTO hub_hubcycle VALUES (99, 99, 4, true);
INSERT INTO hub_hubcycle VALUES (100, 100, 4, true);
INSERT INTO hub_hubcycle VALUES (61, 61, 2, true);
INSERT INTO hub_hubcycle VALUES (62, 62, 2, true);
INSERT INTO hub_hubcycle VALUES (63, 63, 2, true);
INSERT INTO hub_hubcycle VALUES (64, 64, 2, true);
INSERT INTO hub_hubcycle VALUES (65, 65, 2, true);
INSERT INTO hub_hubcycle VALUES (66, 66, 2, true);
INSERT INTO hub_hubcycle VALUES (67, 67, 2, true);
INSERT INTO hub_hubcycle VALUES (68, 68, 2, true);
INSERT INTO hub_hubcycle VALUES (69, 69, 2, true);
INSERT INTO hub_hubcycle VALUES (70, 70, 2, true);
INSERT INTO hub_hubcycle VALUES (71, 71, 2, true);
INSERT INTO hub_hubcycle VALUES (72, 72, 2, true);
INSERT INTO hub_hubcycle VALUES (73, 73, 2, true);


--
-- Name: hub_hubcycle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('hub_hubcycle_id_seq', 124, true);


--
-- Data for Name: hub_hubdetails; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO hub_hubdetails VALUES (2, 'B', 3, 42, 42);
INSERT INTO hub_hubdetails VALUES (1, 'A', 2, 28, 28);
INSERT INTO hub_hubdetails VALUES (3, 'Kresit', 0, 2, 0);
INSERT INTO hub_hubdetails VALUES (4, 'C', 2, 28, 28);


--
-- Name: hub_hubdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('hub_hubdetails_id_seq', 4, true);


--
-- Data for Name: hub_hublandmark; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO hub_hublandmark VALUES (1, 1, 3, 'H12');
INSERT INTO hub_hublandmark VALUES (2, 1, 4, 'H13');
INSERT INTO hub_hublandmark VALUES (3, 2, 1, 'H4');
INSERT INTO hub_hublandmark VALUES (4, 2, 2, 'H5');
INSERT INTO hub_hublandmark VALUES (5, 4, 5, 'H8');
INSERT INTO hub_hublandmark VALUES (6, 4, 6, 'H10');


--
-- Name: hub_hublandmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('hub_hublandmark_id_seq', 6, true);


--
-- Data for Name: hub_landmark; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO hub_landmark VALUES (1, 'H4');
INSERT INTO hub_landmark VALUES (2, 'H5');
INSERT INTO hub_landmark VALUES (3, 'H12');
INSERT INTO hub_landmark VALUES (4, 'H13');
INSERT INTO hub_landmark VALUES (5, 'H8');
INSERT INTO hub_landmark VALUES (6, 'H10');


--
-- Name: hub_landmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('hub_landmark_id_seq', 6, true);


--
-- Data for Name: hub_registrationdetails; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO hub_registrationdetails VALUES (1, 1, 1);
INSERT INTO hub_registrationdetails VALUES (2, 2, 2);
INSERT INTO hub_registrationdetails VALUES (3, 3, 3);
INSERT INTO hub_registrationdetails VALUES (4, 4, 4);
INSERT INTO hub_registrationdetails VALUES (5, 5, 5);
INSERT INTO hub_registrationdetails VALUES (6, 6, 6);
INSERT INTO hub_registrationdetails VALUES (7, 7, 7);
INSERT INTO hub_registrationdetails VALUES (8, 8, 8);
INSERT INTO hub_registrationdetails VALUES (9, 9, 9);
INSERT INTO hub_registrationdetails VALUES (10, 10, 10);
INSERT INTO hub_registrationdetails VALUES (11, 11, 11);
INSERT INTO hub_registrationdetails VALUES (12, 12, 12);
INSERT INTO hub_registrationdetails VALUES (13, 13, 13);
INSERT INTO hub_registrationdetails VALUES (14, 14, 14);
INSERT INTO hub_registrationdetails VALUES (15, 15, 15);
INSERT INTO hub_registrationdetails VALUES (16, 16, 16);
INSERT INTO hub_registrationdetails VALUES (17, 17, 17);
INSERT INTO hub_registrationdetails VALUES (18, 18, 18);
INSERT INTO hub_registrationdetails VALUES (19, 19, 19);
INSERT INTO hub_registrationdetails VALUES (21, 1, 21);
INSERT INTO hub_registrationdetails VALUES (22, 2, 22);
INSERT INTO hub_registrationdetails VALUES (23, 3, 23);
INSERT INTO hub_registrationdetails VALUES (24, 4, 24);
INSERT INTO hub_registrationdetails VALUES (25, 5, 25);
INSERT INTO hub_registrationdetails VALUES (26, 6, 26);
INSERT INTO hub_registrationdetails VALUES (27, 7, 27);
INSERT INTO hub_registrationdetails VALUES (28, 8, 28);
INSERT INTO hub_registrationdetails VALUES (29, 9, 29);
INSERT INTO hub_registrationdetails VALUES (30, 10, 30);
INSERT INTO hub_registrationdetails VALUES (31, 11, 31);
INSERT INTO hub_registrationdetails VALUES (32, 12, 32);
INSERT INTO hub_registrationdetails VALUES (33, 13, 33);
INSERT INTO hub_registrationdetails VALUES (34, 14, 34);
INSERT INTO hub_registrationdetails VALUES (35, 15, 35);
INSERT INTO hub_registrationdetails VALUES (36, 16, 36);
INSERT INTO hub_registrationdetails VALUES (37, 17, 37);
INSERT INTO hub_registrationdetails VALUES (38, 18, 38);
INSERT INTO hub_registrationdetails VALUES (39, 19, 39);
INSERT INTO hub_registrationdetails VALUES (41, 1, 41);
INSERT INTO hub_registrationdetails VALUES (42, 2, 42);
INSERT INTO hub_registrationdetails VALUES (43, 3, 43);
INSERT INTO hub_registrationdetails VALUES (44, 4, 44);
INSERT INTO hub_registrationdetails VALUES (45, 5, 45);
INSERT INTO hub_registrationdetails VALUES (46, 6, 46);
INSERT INTO hub_registrationdetails VALUES (47, 7, 47);
INSERT INTO hub_registrationdetails VALUES (48, 8, 48);
INSERT INTO hub_registrationdetails VALUES (49, 9, 49);
INSERT INTO hub_registrationdetails VALUES (50, 10, 50);
INSERT INTO hub_registrationdetails VALUES (51, 11, 51);
INSERT INTO hub_registrationdetails VALUES (52, 12, 52);
INSERT INTO hub_registrationdetails VALUES (53, 13, 53);
INSERT INTO hub_registrationdetails VALUES (54, 14, 54);
INSERT INTO hub_registrationdetails VALUES (55, 15, 1);
INSERT INTO hub_registrationdetails VALUES (56, 16, 2);
INSERT INTO hub_registrationdetails VALUES (57, 17, 3);
INSERT INTO hub_registrationdetails VALUES (58, 18, 4);
INSERT INTO hub_registrationdetails VALUES (59, 19, 5);
INSERT INTO hub_registrationdetails VALUES (61, 1, 7);
INSERT INTO hub_registrationdetails VALUES (62, 2, 8);
INSERT INTO hub_registrationdetails VALUES (63, 3, 9);
INSERT INTO hub_registrationdetails VALUES (64, 4, 10);
INSERT INTO hub_registrationdetails VALUES (65, 1, 55);
INSERT INTO hub_registrationdetails VALUES (66, 2, 56);
INSERT INTO hub_registrationdetails VALUES (67, 3, 57);
INSERT INTO hub_registrationdetails VALUES (68, 4, 58);
INSERT INTO hub_registrationdetails VALUES (69, 5, 59);
INSERT INTO hub_registrationdetails VALUES (70, 6, 60);
INSERT INTO hub_registrationdetails VALUES (71, 7, 61);
INSERT INTO hub_registrationdetails VALUES (72, 8, 62);
INSERT INTO hub_registrationdetails VALUES (73, 9, 63);
INSERT INTO hub_registrationdetails VALUES (74, 10, 64);
INSERT INTO hub_registrationdetails VALUES (75, 11, 65);
INSERT INTO hub_registrationdetails VALUES (76, 12, 66);
INSERT INTO hub_registrationdetails VALUES (77, 13, 67);
INSERT INTO hub_registrationdetails VALUES (78, 14, 68);
INSERT INTO hub_registrationdetails VALUES (79, 15, 69);
INSERT INTO hub_registrationdetails VALUES (80, 16, 70);
INSERT INTO hub_registrationdetails VALUES (81, 17, 71);
INSERT INTO hub_registrationdetails VALUES (82, 18, 72);
INSERT INTO hub_registrationdetails VALUES (83, 19, 73);
INSERT INTO hub_registrationdetails VALUES (85, 1, 75);
INSERT INTO hub_registrationdetails VALUES (86, 2, 76);
INSERT INTO hub_registrationdetails VALUES (87, 3, 77);
INSERT INTO hub_registrationdetails VALUES (88, 4, 78);
INSERT INTO hub_registrationdetails VALUES (89, 5, 79);
INSERT INTO hub_registrationdetails VALUES (90, 6, 80);
INSERT INTO hub_registrationdetails VALUES (91, 7, 81);
INSERT INTO hub_registrationdetails VALUES (92, 8, 82);
INSERT INTO hub_registrationdetails VALUES (93, 9, 83);
INSERT INTO hub_registrationdetails VALUES (94, 10, 84);
INSERT INTO hub_registrationdetails VALUES (95, 11, 85);
INSERT INTO hub_registrationdetails VALUES (96, 12, 86);
INSERT INTO hub_registrationdetails VALUES (97, 13, 87);
INSERT INTO hub_registrationdetails VALUES (98, 14, 88);
INSERT INTO hub_registrationdetails VALUES (99, 15, 89);
INSERT INTO hub_registrationdetails VALUES (100, 16, 90);
INSERT INTO hub_registrationdetails VALUES (101, 17, 91);
INSERT INTO hub_registrationdetails VALUES (102, 18, 92);
INSERT INTO hub_registrationdetails VALUES (103, 19, 93);
INSERT INTO hub_registrationdetails VALUES (105, 1, 95);
INSERT INTO hub_registrationdetails VALUES (106, 2, 96);
INSERT INTO hub_registrationdetails VALUES (107, 3, 97);
INSERT INTO hub_registrationdetails VALUES (108, 4, 98);
INSERT INTO hub_registrationdetails VALUES (109, 5, 99);
INSERT INTO hub_registrationdetails VALUES (110, 6, 100);
INSERT INTO hub_registrationdetails VALUES (111, 7, 101);
INSERT INTO hub_registrationdetails VALUES (112, 8, 102);
INSERT INTO hub_registrationdetails VALUES (113, 9, 103);
INSERT INTO hub_registrationdetails VALUES (114, 10, 104);


--
-- Name: hub_registrationdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('hub_registrationdetails_id_seq', 8, true);


--
-- Data for Name: hub_studentdetails; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO hub_studentdetails VALUES (1, 14301, 'nirav', 'H12');
INSERT INTO hub_studentdetails VALUES (2, 14302, 'amit', 'H12');
INSERT INTO hub_studentdetails VALUES (3, 14303, 'kush', 'H13');
INSERT INTO hub_studentdetails VALUES (4, 14304, 'savan', 'H13');
INSERT INTO hub_studentdetails VALUES (5, 14305, 'jigar', 'H4');
INSERT INTO hub_studentdetails VALUES (6, 14306, 'mayank', 'H4');
INSERT INTO hub_studentdetails VALUES (7, 14307, 'abhi', 'H5');
INSERT INTO hub_studentdetails VALUES (8, 14308, 'khusal', 'H5');
INSERT INTO hub_studentdetails VALUES (9, 14309, 'vyom', 'H12');
INSERT INTO hub_studentdetails VALUES (10, 14310, 'jimmy', 'H12');
INSERT INTO hub_studentdetails VALUES (11, 14311, 'Manthan', 'H12');
INSERT INTO hub_studentdetails VALUES (12, 14312, 'Dhruv', 'H12');
INSERT INTO hub_studentdetails VALUES (13, 14313, 'Parth', 'H12');
INSERT INTO hub_studentdetails VALUES (14, 14314, 'Bunty', 'H13');
INSERT INTO hub_studentdetails VALUES (15, 14315, 'Laltu', 'H13');
INSERT INTO hub_studentdetails VALUES (16, 14316, 'Neil', 'H13');
INSERT INTO hub_studentdetails VALUES (17, 14317, 'Nikki', 'H13');
INSERT INTO hub_studentdetails VALUES (18, 14318, 'Niyti', 'H13');
INSERT INTO hub_studentdetails VALUES (19, 14319, 'Nyoma', 'H13');
INSERT INTO hub_studentdetails VALUES (20, 14320, 'Jagruti', 'H13');
INSERT INTO hub_studentdetails VALUES (21, 14321, 'Rajal', 'H4');
INSERT INTO hub_studentdetails VALUES (22, 14322, 'Payal', 'H4');
INSERT INTO hub_studentdetails VALUES (23, 14323, 'Munni', 'H4');
INSERT INTO hub_studentdetails VALUES (24, 14324, 'Pratiksha', 'H4');
INSERT INTO hub_studentdetails VALUES (25, 14325, 'Mausami', 'H4');
INSERT INTO hub_studentdetails VALUES (26, 14326, 'Khanjan', 'H4');
INSERT INTO hub_studentdetails VALUES (27, 14327, 'Aby', 'H4');
INSERT INTO hub_studentdetails VALUES (28, 14328, 'Imran', 'H5');
INSERT INTO hub_studentdetails VALUES (29, 14329, 'Ahmar', 'H5');
INSERT INTO hub_studentdetails VALUES (30, 14330, 'Sudo', 'H5');
INSERT INTO hub_studentdetails VALUES (31, 14331, 'Sarth', 'H5');
INSERT INTO hub_studentdetails VALUES (32, 14332, 'Sudoku', 'H5');
INSERT INTO hub_studentdetails VALUES (33, 14333, 'Sadagopan', 'H5');
INSERT INTO hub_studentdetails VALUES (34, 14334, 'Henil', 'H5');
INSERT INTO hub_studentdetails VALUES (35, 14335, 'Hridhan', 'H5');
INSERT INTO hub_studentdetails VALUES (36, 14336, 'Aaron', 'H8');
INSERT INTO hub_studentdetails VALUES (37, 14337, 'Abdul', 'H8');
INSERT INTO hub_studentdetails VALUES (38, 14338, 'Abe', 'H8');
INSERT INTO hub_studentdetails VALUES (39, 14339, 'Abel', 'H8');
INSERT INTO hub_studentdetails VALUES (40, 14340, 'Abram', 'H8');
INSERT INTO hub_studentdetails VALUES (41, 14341, 'Adam', 'H8');
INSERT INTO hub_studentdetails VALUES (42, 14342, 'Adan', 'H8');
INSERT INTO hub_studentdetails VALUES (43, 14343, 'Abm', 'H8');
INSERT INTO hub_studentdetails VALUES (44, 14344, 'Adalbetro', 'H8');
INSERT INTO hub_studentdetails VALUES (45, 14345, 'Mohnish', 'H12');
INSERT INTO hub_studentdetails VALUES (46, 14346, 'Ketul', 'H10');
INSERT INTO hub_studentdetails VALUES (47, 14347, 'Kool', 'H10');
INSERT INTO hub_studentdetails VALUES (48, 14348, 'Kenny', 'H10');
INSERT INTO hub_studentdetails VALUES (49, 14349, 'Kent', 'H10');
INSERT INTO hub_studentdetails VALUES (50, 14350, 'Kermit', 'H10');
INSERT INTO hub_studentdetails VALUES (51, 14351, 'Kasey', 'H10');
INSERT INTO hub_studentdetails VALUES (52, 14352, 'Kelvin', 'H10');
INSERT INTO hub_studentdetails VALUES (53, 14353, 'Kevin', 'H10');
INSERT INTO hub_studentdetails VALUES (54, 14354, 'Ken', 'H10');
INSERT INTO hub_studentdetails VALUES (55, 14355, 'Cristie', 'H13');
INSERT INTO hub_studentdetails VALUES (56, 14356, 'Cristin', 'H8');
INSERT INTO hub_studentdetails VALUES (57, 14357, 'Hayden', 'H10');
INSERT INTO hub_studentdetails VALUES (58, 14358, 'Clayton', 'H4');
INSERT INTO hub_studentdetails VALUES (59, 14359, 'Eleanora', 'H5');
INSERT INTO hub_studentdetails VALUES (60, 14360, 'Erich', 'H12');
INSERT INTO hub_studentdetails VALUES (61, 14361, 'Keva', 'H13');
INSERT INTO hub_studentdetails VALUES (62, 14362, 'Roxann', 'H8');
INSERT INTO hub_studentdetails VALUES (63, 14363, 'Tyler', 'H10');
INSERT INTO hub_studentdetails VALUES (64, 14364, 'Sharika', 'H4');
INSERT INTO hub_studentdetails VALUES (65, 14365, 'Lakia', 'H5');
INSERT INTO hub_studentdetails VALUES (66, 14366, 'Francisco', 'H12');
INSERT INTO hub_studentdetails VALUES (67, 14367, 'Beverley', 'H13');
INSERT INTO hub_studentdetails VALUES (68, 14368, 'Echo', 'H8');
INSERT INTO hub_studentdetails VALUES (69, 14369, 'Kent', 'H10');
INSERT INTO hub_studentdetails VALUES (70, 14370, 'Rosenda', 'H4');
INSERT INTO hub_studentdetails VALUES (71, 14371, 'Francene', 'H5');
INSERT INTO hub_studentdetails VALUES (72, 14372, 'Jolie', 'H12');
INSERT INTO hub_studentdetails VALUES (73, 14373, 'Clark', 'H13');
INSERT INTO hub_studentdetails VALUES (74, 14374, 'Markus', 'H8');
INSERT INTO hub_studentdetails VALUES (75, 14375, 'Mavis', 'H10');
INSERT INTO hub_studentdetails VALUES (76, 14376, 'Valarie', 'H4');
INSERT INTO hub_studentdetails VALUES (77, 14377, 'Reiko', 'H5');
INSERT INTO hub_studentdetails VALUES (78, 14378, 'Lura', 'H12');
INSERT INTO hub_studentdetails VALUES (79, 14379, 'Leonia', 'H13');
INSERT INTO hub_studentdetails VALUES (80, 14380, 'Cecily', 'H8');
INSERT INTO hub_studentdetails VALUES (81, 14381, 'Eunice', 'H10');
INSERT INTO hub_studentdetails VALUES (82, 14382, 'Gerardo', 'H4');
INSERT INTO hub_studentdetails VALUES (83, 14383, 'Dacia', 'H5');
INSERT INTO hub_studentdetails VALUES (84, 14384, 'Jacalyn', 'H12');
INSERT INTO hub_studentdetails VALUES (85, 14385, 'Josh', 'H13');
INSERT INTO hub_studentdetails VALUES (86, 14386, 'Renita', 'H8');
INSERT INTO hub_studentdetails VALUES (87, 14387, 'Jaunita', 'H10');
INSERT INTO hub_studentdetails VALUES (88, 14388, 'Merlene', 'H4');
INSERT INTO hub_studentdetails VALUES (89, 14389, 'Stanford', 'H5');
INSERT INTO hub_studentdetails VALUES (90, 14390, 'Mckenzie', 'H12');
INSERT INTO hub_studentdetails VALUES (91, 14391, 'Solomon', 'H13');
INSERT INTO hub_studentdetails VALUES (92, 14392, 'Blanca', 'H8');
INSERT INTO hub_studentdetails VALUES (93, 14393, 'Hiram', 'H10');
INSERT INTO hub_studentdetails VALUES (94, 14394, 'Lavina', 'H4');
INSERT INTO hub_studentdetails VALUES (95, 14395, 'Allan', 'H5');
INSERT INTO hub_studentdetails VALUES (96, 14396, 'Yvone', 'H12');
INSERT INTO hub_studentdetails VALUES (97, 14397, 'Allison', 'H13');
INSERT INTO hub_studentdetails VALUES (98, 14398, 'Nada', 'H8');
INSERT INTO hub_studentdetails VALUES (99, 14399, 'Dorathy', 'H10');
INSERT INTO hub_studentdetails VALUES (100, 14400, 'Meta', 'H4');
INSERT INTO hub_studentdetails VALUES (101, 14401, 'Terresa', 'H5');
INSERT INTO hub_studentdetails VALUES (102, 14402, 'Jillian', 'H12');
INSERT INTO hub_studentdetails VALUES (103, 14403, 'Sheri', 'H13');
INSERT INTO hub_studentdetails VALUES (104, 14404, 'Luciana', 'H8');


--
-- Name: hub_studentdetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('hub_studentdetails_id_seq', 8, true);


--
-- Data for Name: hub_timetable; Type: TABLE DATA; Schema: public; Owner: niravkntr
--

INSERT INTO hub_timetable VALUES (1, 'cs681', 'PA', '08:30:00', '09:30:00', 'MON');
INSERT INTO hub_timetable VALUES (2, 'cs435', 'Linear Optimiztion', '09:30:00', '10:30:00', 'MON');
INSERT INTO hub_timetable VALUES (3, 'cs224', 'Computer Networks', '10:30:00', '11:30:00', 'MON');
INSERT INTO hub_timetable VALUES (4, 'cs310', 'Automata', '11:30:00', '12:30:00', 'MON');
INSERT INTO hub_timetable VALUES (5, 'cs718', 'Software Architecture', '01:30:00', '02:30:00', 'MON');
INSERT INTO hub_timetable VALUES (6, 'cs733', 'Cloud Engineering', '02:30:00', '03:30:00', 'MON');
INSERT INTO hub_timetable VALUES (7, 'cs750', 'Linear Opti', '03:30:00', '04:30:00', 'MON');
INSERT INTO hub_timetable VALUES (8, 'cs218', 'Design and Algo', '04:30:00', '05:30:00', 'MON');
INSERT INTO hub_timetable VALUES (9, 'cs302', 'Implementation of Prog. Lang.', '05:30:00', '06:30:00', 'MON');
INSERT INTO hub_timetable VALUES (10, 'cs632', 'Advance DBMS', '06:30:00', '07:30:00', 'MON');
INSERT INTO hub_timetable VALUES (11, 'cs152', 'OPD', '08:30:00', '09:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (12, 'cs347', 'Operatin Sysytem(M)', '09:30:00', '10:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (13, 'cs792', 'Communication Skills', '10:30:00', '11:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (14, 'cs671', 'Embeded System', '11:30:00', '12:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (15, 'cs713', 'Automata and Theory', '01:30:00', '02:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (16, 'cs333', 'Operating System Lab', '02:30:00', '03:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (18, 'cs751', 'Parallel Processing', '04:30:00', '05:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (19, 'cs763', 'Computer Vision', '05:30:00', '06:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (20, 'cs750', 'Linear Opti', '06:30:00', '07:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (21, 'cs681', 'PA', '08:30:00', '09:30:00', 'WED');
INSERT INTO hub_timetable VALUES (22, 'cs435', 'Linear Optimiztion', '09:30:00', '10:30:00', 'WED');
INSERT INTO hub_timetable VALUES (23, 'cs224', 'Computer Networks', '10:30:00', '11:30:00', 'WED');
INSERT INTO hub_timetable VALUES (24, 'cs310', 'Automata', '11:30:00', '12:30:00', 'WED');
INSERT INTO hub_timetable VALUES (25, 'cs718', 'Software Architecture', '01:30:00', '02:30:00', 'WED');
INSERT INTO hub_timetable VALUES (26, 'cs733', 'Cloud Engineering', '02:30:00', '03:30:00', 'WED');
INSERT INTO hub_timetable VALUES (27, 'cs750', 'Linear Opti', '03:30:00', '04:30:00', 'WED');
INSERT INTO hub_timetable VALUES (28, 'cs218', 'Design and Algo', '04:30:00', '05:30:00', 'WED');
INSERT INTO hub_timetable VALUES (29, 'cs302', 'Implementation of Prog. Lang.', '05:30:00', '06:30:00', 'WED');
INSERT INTO hub_timetable VALUES (30, 'cs632', 'Advance DBMS', '06:30:00', '07:30:00', 'WED');
INSERT INTO hub_timetable VALUES (31, 'cs152', 'OPD', '08:30:00', '09:30:00', 'THU');
INSERT INTO hub_timetable VALUES (32, 'cs347', 'Operatin Sysytem(M)', '09:30:00', '10:30:00', 'THU');
INSERT INTO hub_timetable VALUES (33, 'cs792', 'Communication Skills', '10:30:00', '11:30:00', 'THU');
INSERT INTO hub_timetable VALUES (34, 'cs671', 'Embeded System', '11:30:00', '12:30:00', 'THU');
INSERT INTO hub_timetable VALUES (35, 'cs713', 'Automata and Theory', '01:30:00', '02:30:00', 'THU');
INSERT INTO hub_timetable VALUES (36, 'cs333', 'Operating System Lab', '02:30:00', '03:30:00', 'THU');
INSERT INTO hub_timetable VALUES (38, 'cs751', 'Parallel Processing', '04:30:00', '05:30:00', 'THU');
INSERT INTO hub_timetable VALUES (39, 'cs763', 'Computer Vision', '05:30:00', '06:30:00', 'THU');
INSERT INTO hub_timetable VALUES (40, 'cs750', 'Linear Opti', '06:30:00', '07:30:00', 'THU');
INSERT INTO hub_timetable VALUES (41, 'cs681', 'PA', '08:30:00', '09:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (42, 'cs435', 'Linear Optimiztion', '09:30:00', '10:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (43, 'cs224', 'Computer Networks', '10:30:00', '11:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (44, 'cs310', 'Automata', '11:30:00', '12:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (45, 'cs718', 'Software Architecture', '01:30:00', '02:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (46, 'cs733', 'Cloud Engineering', '02:30:00', '03:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (47, 'cs750', 'Linear Opti', '03:30:00', '04:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (48, 'cs218', 'Design and Algo', '04:30:00', '05:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (49, 'cs302', 'Implementation of Prog. Lang.', '05:30:00', '06:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (50, 'cs632', 'Advance DBMS', '06:30:00', '07:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (51, 'cs152', 'OPD', '08:30:00', '09:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (52, 'cs347', 'Operatin Sysytem(M)', '09:30:00', '10:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (53, 'cs792', 'Communication Skills', '10:30:00', '11:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (54, 'cs671', 'Embeded System', '11:30:00', '12:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (55, 'cs713', 'Automata and Theory', '01:30:00', '02:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (56, 'cs333', 'Operating System Lab', '02:30:00', '03:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (58, 'cs751', 'Parallel Processing', '04:30:00', '05:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (59, 'cs763', 'Computer Vision', '05:30:00', '06:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (60, 'cs750', 'Linear Opti', '06:30:00', '07:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (61, 'Lunch', 'Lunch', '12:30:00', '01:30:00', 'MON');
INSERT INTO hub_timetable VALUES (62, 'Lunch', 'Lunch', '12:30:00', '01:30:00', 'TUE');
INSERT INTO hub_timetable VALUES (63, 'Lunch', 'Lunch', '12:30:00', '01:30:00', 'WED');
INSERT INTO hub_timetable VALUES (64, 'Lunch', 'Lunch', '12:30:00', '01:30:00', 'THU');
INSERT INTO hub_timetable VALUES (65, 'Lunch', 'Lunch', '12:30:00', '01:30:00', 'FRI');
INSERT INTO hub_timetable VALUES (66, 'Lunch', 'Lunch', '12:30:00', '01:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (57, 'cs749', 'Digital Image Processing', '03:30:04', '09:30:00', 'SAT');
INSERT INTO hub_timetable VALUES (37, 'cs749', 'Digital Image Processing', '03:30:04', '09:30:00', 'THU');
INSERT INTO hub_timetable VALUES (17, 'cs749', 'Digital Image Processing', '03:30:04', '09:30:00', 'TUE');


--
-- Name: hub_timetable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: niravkntr
--

SELECT pg_catalog.setval('hub_timetable_id_seq', 2, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: hub_course_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY hub_course
    ADD CONSTRAINT hub_course_pkey PRIMARY KEY (id);


--
-- Name: hub_history_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY hub_history
    ADD CONSTRAINT hub_history_pkey PRIMARY KEY (id);


--
-- Name: hub_hubcycle_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY hub_hubcycle
    ADD CONSTRAINT hub_hubcycle_pkey PRIMARY KEY (id);


--
-- Name: hub_hubdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY hub_hubdetails
    ADD CONSTRAINT hub_hubdetails_pkey PRIMARY KEY (id);


--
-- Name: hub_hublandmark_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY hub_hublandmark
    ADD CONSTRAINT hub_hublandmark_pkey PRIMARY KEY (id);


--
-- Name: hub_landmark_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY hub_landmark
    ADD CONSTRAINT hub_landmark_pkey PRIMARY KEY (id);


--
-- Name: hub_registrationdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY hub_registrationdetails
    ADD CONSTRAINT hub_registrationdetails_pkey PRIMARY KEY (id);


--
-- Name: hub_studentdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY hub_studentdetails
    ADD CONSTRAINT hub_studentdetails_pkey PRIMARY KEY (id);


--
-- Name: hub_timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: niravkntr; Tablespace: 
--

ALTER TABLE ONLY hub_timetable
    ADD CONSTRAINT hub_timetable_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: hub_hubcycle_8f3fed28; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX hub_hubcycle_8f3fed28 ON hub_hubcycle USING btree (hubid_id);


--
-- Name: hub_hublandmark_5925ad19; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX hub_hublandmark_5925ad19 ON hub_hublandmark USING btree (landmark_id);


--
-- Name: hub_hublandmark_97469368; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX hub_hublandmark_97469368 ON hub_hublandmark USING btree (hub_id);


--
-- Name: hub_registrationdetails_0cb1b42a; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX hub_registrationdetails_0cb1b42a ON hub_registrationdetails USING btree (student_id);


--
-- Name: hub_registrationdetails_courseno_id_9ba00176_uniq; Type: INDEX; Schema: public; Owner: niravkntr; Tablespace: 
--

CREATE INDEX hub_registrationdetails_courseno_id_9ba00176_uniq ON hub_registrationdetails USING btree (courseno_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hub_hubcycle_hubid_id_ca562bbd_fk_hub_hubdetails_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_hubcycle
    ADD CONSTRAINT hub_hubcycle_hubid_id_ca562bbd_fk_hub_hubdetails_id FOREIGN KEY (hubid_id) REFERENCES hub_hubdetails(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hub_hublandmark_hub_id_2e6d22fd_fk_hub_hubdetails_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_hublandmark
    ADD CONSTRAINT hub_hublandmark_hub_id_2e6d22fd_fk_hub_hubdetails_id FOREIGN KEY (hub_id) REFERENCES hub_hubdetails(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hub_hublandmark_landmark_id_bcd0ca31_fk_hub_landmark_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_hublandmark
    ADD CONSTRAINT hub_hublandmark_landmark_id_bcd0ca31_fk_hub_landmark_id FOREIGN KEY (landmark_id) REFERENCES hub_landmark(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hub_registrationde_student_id_d99c693b_fk_hub_studentdetails_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_registrationdetails
    ADD CONSTRAINT hub_registrationde_student_id_d99c693b_fk_hub_studentdetails_id FOREIGN KEY (student_id) REFERENCES hub_studentdetails(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: hub_registrationdetails_courseno_id_9ba00176_fk_hub_course_id; Type: FK CONSTRAINT; Schema: public; Owner: niravkntr
--

ALTER TABLE ONLY hub_registrationdetails
    ADD CONSTRAINT hub_registrationdetails_courseno_id_9ba00176_fk_hub_course_id FOREIGN KEY (courseno_id) REFERENCES hub_course(id) DEFERRABLE INITIALLY DEFERRED;


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

