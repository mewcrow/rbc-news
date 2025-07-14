--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.telescope_entries_tags DROP CONSTRAINT telescope_entries_tags_entry_uuid_foreign;
ALTER TABLE ONLY public.news DROP CONSTRAINT news_page_link_id_foreign;
DROP INDEX public.telescope_entries_type_should_display_on_index_index;
DROP INDEX public.telescope_entries_tags_tag_index;
DROP INDEX public.telescope_entries_family_hash_index;
DROP INDEX public.telescope_entries_created_at_index;
DROP INDEX public.telescope_entries_batch_id_index;
DROP INDEX public.sessions_user_id_index;
DROP INDEX public.sessions_last_activity_index;
DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
DROP INDEX public.jobs_queue_index;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
ALTER TABLE ONLY public.telescope_monitoring DROP CONSTRAINT telescope_monitoring_pkey;
ALTER TABLE ONLY public.telescope_entries DROP CONSTRAINT telescope_entries_uuid_unique;
ALTER TABLE ONLY public.telescope_entries_tags DROP CONSTRAINT telescope_entries_tags_pkey;
ALTER TABLE ONLY public.telescope_entries DROP CONSTRAINT telescope_entries_pkey;
ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
ALTER TABLE ONLY public.password_reset_tokens DROP CONSTRAINT password_reset_tokens_pkey;
ALTER TABLE ONLY public.page_links DROP CONSTRAINT page_links_url_unique;
ALTER TABLE ONLY public.page_links DROP CONSTRAINT page_links_pkey;
ALTER TABLE ONLY public.news DROP CONSTRAINT news_slug_unique;
ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
ALTER TABLE ONLY public.news DROP CONSTRAINT news_page_link_id_unique;
ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
ALTER TABLE ONLY public.job_batches DROP CONSTRAINT job_batches_pkey;
ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
ALTER TABLE ONLY public.cache DROP CONSTRAINT cache_pkey;
ALTER TABLE ONLY public.cache_locks DROP CONSTRAINT cache_locks_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.telescope_entries ALTER COLUMN sequence DROP DEFAULT;
ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.page_links ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.news ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP TABLE public.telescope_monitoring;
DROP TABLE public.telescope_entries_tags;
DROP SEQUENCE public.telescope_entries_sequence_seq;
DROP TABLE public.telescope_entries;
DROP TABLE public.sessions;
DROP SEQUENCE public.personal_access_tokens_id_seq;
DROP TABLE public.personal_access_tokens;
DROP TABLE public.password_reset_tokens;
DROP SEQUENCE public.page_links_id_seq;
DROP TABLE public.page_links;
DROP SEQUENCE public.news_id_seq;
DROP TABLE public.news;
DROP SEQUENCE public.migrations_id_seq;
DROP TABLE public.migrations;
DROP SEQUENCE public.jobs_id_seq;
DROP TABLE public.jobs;
DROP TABLE public.job_batches;
DROP SEQUENCE public.failed_jobs_id_seq;
DROP TABLE public.failed_jobs;
DROP TABLE public.cache_locks;
DROP TABLE public.cache;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO "rbc-news";

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO "rbc-news";

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO "rbc-news";

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: rbc-news
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO "rbc-news";

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rbc-news
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO "rbc-news";

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO "rbc-news";

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: rbc-news
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO "rbc-news";

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rbc-news
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO "rbc-news";

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: rbc-news
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO "rbc-news";

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rbc-news
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.news (
    id bigint NOT NULL,
    page_link_id bigint NOT NULL,
    slug character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    image character varying(255),
    text text NOT NULL,
    rating smallint NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.news OWNER TO "rbc-news";

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: rbc-news
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO "rbc-news";

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rbc-news
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: page_links; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.page_links (
    id bigint NOT NULL,
    url character varying(255) NOT NULL,
    is_parsed boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.page_links OWNER TO "rbc-news";

--
-- Name: page_links_id_seq; Type: SEQUENCE; Schema: public; Owner: rbc-news
--

CREATE SEQUENCE public.page_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.page_links_id_seq OWNER TO "rbc-news";

--
-- Name: page_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rbc-news
--

ALTER SEQUENCE public.page_links_id_seq OWNED BY public.page_links.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO "rbc-news";

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO "rbc-news";

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: rbc-news
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO "rbc-news";

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rbc-news
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO "rbc-news";

--
-- Name: telescope_entries; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.telescope_entries (
    sequence bigint NOT NULL,
    uuid uuid NOT NULL,
    batch_id uuid NOT NULL,
    family_hash character varying(255),
    should_display_on_index boolean DEFAULT true NOT NULL,
    type character varying(20) NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.telescope_entries OWNER TO "rbc-news";

--
-- Name: telescope_entries_sequence_seq; Type: SEQUENCE; Schema: public; Owner: rbc-news
--

CREATE SEQUENCE public.telescope_entries_sequence_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.telescope_entries_sequence_seq OWNER TO "rbc-news";

--
-- Name: telescope_entries_sequence_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rbc-news
--

ALTER SEQUENCE public.telescope_entries_sequence_seq OWNED BY public.telescope_entries.sequence;


--
-- Name: telescope_entries_tags; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.telescope_entries_tags (
    entry_uuid uuid NOT NULL,
    tag character varying(255) NOT NULL
);


ALTER TABLE public.telescope_entries_tags OWNER TO "rbc-news";

--
-- Name: telescope_monitoring; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.telescope_monitoring (
    tag character varying(255) NOT NULL
);


ALTER TABLE public.telescope_monitoring OWNER TO "rbc-news";

--
-- Name: users; Type: TABLE; Schema: public; Owner: rbc-news
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'regular'::character varying NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO "rbc-news";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rbc-news
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO "rbc-news";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rbc-news
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: page_links id; Type: DEFAULT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.page_links ALTER COLUMN id SET DEFAULT nextval('public.page_links_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: telescope_entries sequence; Type: DEFAULT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.telescope_entries ALTER COLUMN sequence SET DEFAULT nextval('public.telescope_entries_sequence_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: news news_page_link_id_unique; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_page_link_id_unique UNIQUE (page_link_id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: news news_slug_unique; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_slug_unique UNIQUE (slug);


--
-- Name: page_links page_links_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.page_links
    ADD CONSTRAINT page_links_pkey PRIMARY KEY (id);


--
-- Name: page_links page_links_url_unique; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.page_links
    ADD CONSTRAINT page_links_url_unique UNIQUE (url);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: telescope_entries telescope_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.telescope_entries
    ADD CONSTRAINT telescope_entries_pkey PRIMARY KEY (sequence);


--
-- Name: telescope_entries_tags telescope_entries_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.telescope_entries_tags
    ADD CONSTRAINT telescope_entries_tags_pkey PRIMARY KEY (entry_uuid, tag);


--
-- Name: telescope_entries telescope_entries_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.telescope_entries
    ADD CONSTRAINT telescope_entries_uuid_unique UNIQUE (uuid);


--
-- Name: telescope_monitoring telescope_monitoring_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.telescope_monitoring
    ADD CONSTRAINT telescope_monitoring_pkey PRIMARY KEY (tag);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: rbc-news
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: rbc-news
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: rbc-news
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: rbc-news
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: telescope_entries_batch_id_index; Type: INDEX; Schema: public; Owner: rbc-news
--

CREATE INDEX telescope_entries_batch_id_index ON public.telescope_entries USING btree (batch_id);


--
-- Name: telescope_entries_created_at_index; Type: INDEX; Schema: public; Owner: rbc-news
--

CREATE INDEX telescope_entries_created_at_index ON public.telescope_entries USING btree (created_at);


--
-- Name: telescope_entries_family_hash_index; Type: INDEX; Schema: public; Owner: rbc-news
--

CREATE INDEX telescope_entries_family_hash_index ON public.telescope_entries USING btree (family_hash);


--
-- Name: telescope_entries_tags_tag_index; Type: INDEX; Schema: public; Owner: rbc-news
--

CREATE INDEX telescope_entries_tags_tag_index ON public.telescope_entries_tags USING btree (tag);


--
-- Name: telescope_entries_type_should_display_on_index_index; Type: INDEX; Schema: public; Owner: rbc-news
--

CREATE INDEX telescope_entries_type_should_display_on_index_index ON public.telescope_entries USING btree (type, should_display_on_index);


--
-- Name: news news_page_link_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_page_link_id_foreign FOREIGN KEY (page_link_id) REFERENCES public.page_links(id) ON DELETE CASCADE;


--
-- Name: telescope_entries_tags telescope_entries_tags_entry_uuid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: rbc-news
--

ALTER TABLE ONLY public.telescope_entries_tags
    ADD CONSTRAINT telescope_entries_tags_entry_uuid_foreign FOREIGN KEY (entry_uuid) REFERENCES public.telescope_entries(uuid) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: rbc-news
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_04_04_045052_create_personal_access_tokens_table	1
5	2025_04_04_075305_create_telescope_entries_table	1
6	2025_05_29_152817_create_page_links_table	1
7	2025_06_03_095404_create_news_table	1
\.


--
-- Data for Name: page_links; Type: TABLE DATA; Schema: public; Owner: rbc-news
--

COPY public.page_links (id, url, is_parsed, created_at, updated_at) FROM stdin;
4	https://rt.rbc.ru/tatarstan/freenews/686341f09a794737a49f9a27	f	2025-07-01 10:17:06	2025-07-01 10:17:06
5	https://pro.rbc.ru/demo/68624ae39a79470f9376c2cf	f	2025-07-01 10:17:06	2025-07-01 10:17:06
6	https://rt.rbc.ru/tatarstan/01/07/2025/685d31479a79473466d50a77	f	2025-07-01 10:17:06	2025-07-01 10:17:06
8	https://pro.rbc.ru/demo/6862aaba9a7947f9cd544884	f	2025-07-01 10:17:06	2025-07-01 10:17:06
9	https://rt.rbc.ru/tatarstan/freenews/68635d109a79477db6ef5022	f	2025-07-01 10:17:06	2025-07-01 10:17:06
10	https://pro.rbc.ru/demo/685c1c059a7947dc984f6cea	f	2025-07-01 10:17:06	2025-07-01 10:17:06
12	https://pro.rbc.ru/demo/685d5e749a7947ea1bdd0db8	f	2025-07-01 10:17:06	2025-07-01 10:17:06
1	https://www.rbc.ru/business/01/07/2025/6862badc9a79472cd2204acc	t	2025-07-01 10:17:06	2025-07-01 10:17:13
2	https://www.rbc.ru/politics/01/07/2025/68637b809a79472f9d0b58b2	t	2025-07-01 10:17:06	2025-07-01 10:17:14
7	https://www.rbc.ru/politics/01/07/2025/686380159a794719e59ba467	t	2025-07-01 10:17:06	2025-07-01 10:17:14
3	https://www.rbc.ru/politics/01/07/2025/68636b709a79475307104040	t	2025-07-01 10:17:06	2025-07-01 10:17:14
11	https://www.rbc.ru/society/01/07/2025/6863795f9a7947014c2a21c6	t	2025-07-01 10:17:06	2025-07-01 10:17:14
13	https://www.rbc.ru/business/01/07/2025/686297e99a79478ffe0f36f3	t	2025-07-01 10:17:06	2025-07-01 10:17:15
15	https://www.rbc.ru/politics/01/07/2025/685e79f09a7947a3b98048d0	t	2025-07-01 10:17:06	2025-07-01 10:17:15
16	https://www.rbc.ru/quote/news/article/684fe7ac9a7947ee56b41de7	t	2025-07-01 10:17:06	2025-07-01 10:17:15
14	https://www.rbc.ru/business/01/07/2025/68624d7f9a794769e971064b	t	2025-07-01 10:17:06	2025-07-01 10:17:15
37	https://pro.rbc.ru/demo/6862a1cd9a7947db49982019	f	2025-07-01 10:30:02	2025-07-01 10:30:02
39	https://www.rbc.ru/politics/01/07/2025/686298dd9a7947326b7d1906	t	2025-07-01 10:30:02	2025-07-01 10:35:01
52	https://rt.rbc.ru/tatarstan/freenews/68638bd79a7947d61806f51e	f	2025-07-01 10:40:02	2025-07-01 10:40:02
84	https://rt.rbc.ru/tatarstan/freenews/686391b09a79473dff9e405c	f	2025-07-01 11:00:01	2025-07-01 11:00:01
113	https://rt.rbc.ru/tatarstan/freenews/686396299a79476da4fd6865	f	2025-07-01 11:20:03	2025-07-01 11:20:03
138	https://pro.rbc.ru/demo/685d59919a794717e1b6aba3	f	2025-07-01 11:30:01	2025-07-01 11:30:01
135	https://www.rbc.ru/finances/01/07/2025/6863863c9a7947a1de53fce6	t	2025-07-01 11:30:01	2025-07-01 11:35:02
130	https://www.rbc.ru/society/01/07/2025/68637bb09a79476ce4d9e1f1	t	2025-07-01 11:30:01	2025-07-01 11:35:05
155	https://www.rbc.ru/technology_and_media/01/07/2025/68637efc9a7947cf2e87bf5f	t	2025-07-01 11:40:03	2025-07-01 11:45:01
167	https://pro.rbc.ru/demo/68627d399a794738ec5bb207	f	2025-07-01 12:40:03	2025-07-01 12:40:03
172	https://rbcrealty.ru/news/686289ae9a794786e3b8c50e	f	2025-07-01 12:40:03	2025-07-01 12:40:03
162	https://www.rbc.ru/politics/01/07/2025/6863a6819a794704cb30eb19	t	2025-07-01 12:40:03	2025-07-01 12:45:03
163	https://www.rbc.ru/politics/01/07/2025/686395fb9a79473ab25bb243	t	2025-07-01 12:40:03	2025-07-01 12:45:03
171	https://www.rbc.ru/society/01/07/2025/686398f19a794713e2019a89	t	2025-07-01 12:40:03	2025-07-01 12:45:03
168	https://www.rbc.ru/politics/01/07/2025/685e8cf19a794702d2f3e446	t	2025-07-01 12:40:03	2025-07-01 12:45:03
173	https://www.rbc.ru/politics/01/07/2025/686391d79a794765261124c5	t	2025-07-01 12:40:03	2025-07-01 12:45:04
255	https://pro.rbc.ru/demo/685ea0199a7947aad1a8cf56	f	2025-07-01 13:30:02	2025-07-01 13:30:02
242	https://www.rbc.ru/politics/01/07/2025/6863b6879a7947065027361e	t	2025-07-01 13:30:02	2025-07-01 13:35:03
251	https://www.rbc.ru/business/01/07/2025/6863abcc9a79474432dc055a	t	2025-07-01 13:30:02	2025-07-01 13:35:03
243	https://www.rbc.ru/society/01/07/2025/6863b03f9a7947f0ffaf7f00	t	2025-07-01 13:30:02	2025-07-01 13:35:03
290	https://www.rbc.ru/politics/01/07/2025/6863b40a9a7947d644fa12f2	t	2025-07-01 14:00:03	2025-07-01 14:05:03
298	https://www.rbc.ru/society/01/07/2025/6863a6c99a794704560af6f6	t	2025-07-01 14:00:03	2025-07-01 14:05:04
295	https://www.rbc.ru/politics/01/07/2025/6863b53e9a79471a9d8d069e	t	2025-07-01 14:00:03	2025-07-01 14:05:04
306	https://www.rbc.ru/politics/01/07/2025/6863bc649a79474c87373aaf	t	2025-07-01 14:10:02	2025-07-01 14:15:02
383	https://pro.rbc.ru/demo/685a91bb9a79475023dcfb2e	f	2025-07-01 14:50:04	2025-07-01 14:50:04
386	https://www.rbc.ru/politics/01/07/2025/6863c6939a794755fc5ef4e0	t	2025-07-01 15:00:05	2025-07-01 15:05:06
403	https://www.rbc.ru/politics/01/07/2025/6863d6719a79471ac7013858	t	2025-07-01 15:50:01	2025-07-01 15:50:10
402	https://www.rbc.ru/politics/01/07/2025/6863d26e9a7947e6bbc2bf8e	t	2025-07-01 15:50:01	2025-07-01 15:50:10
407	https://www.rbc.ru/politics/01/07/2025/6863bc859a79470cdc6081be	t	2025-07-01 15:50:01	2025-07-01 15:50:10
405	https://www.rbc.ru/politics/01/07/2025/6863d0239a7947784d852e1d	t	2025-07-01 15:50:01	2025-07-01 15:50:12
461	https://pro.rbc.ru/demo/685e954d9a79475fabf99577	f	2025-07-01 16:10:02	2025-07-01 16:10:02
463	https://pro.rbc.ru/demo/685ba9459a79477e5a5fa974	f	2025-07-01 16:10:02	2025-07-01 16:10:02
450	https://www.rbc.ru/politics/01/07/2025/6863c9a59a79478cba7c7adb	t	2025-07-01 16:10:02	2025-07-01 16:15:01
789	https://pro.rbc.ru/demo/6863f2e89a7947ce8ae90cf5	f	2025-07-02 08:00:02	2025-07-02 08:00:02
511	https://pro.rbc.ru/news/685ba9459a79477e5a5fa974	f	2025-07-01 16:40:01	2025-07-01 16:40:01
792	https://pro.rbc.ru/demo/686410229a79470713153ecd	f	2025-07-02 08:00:02	2025-07-02 08:00:02
795	https://pro.rbc.ru/demo/685aafc39a7947515ebb9331	f	2025-07-02 08:00:02	2025-07-02 08:00:02
799	https://pro.rbc.ru/demo/68625d099a79473b0a5c7480	f	2025-07-02 08:00:02	2025-07-02 08:00:02
790	https://www.rbc.ru/politics/02/07/2025/6864670a9a79470ad8cf493a	t	2025-07-02 08:00:02	2025-07-02 08:05:01
791	https://www.rbc.ru/politics/02/07/2025/686490c79a79471c639e96dc	t	2025-07-02 08:00:02	2025-07-02 08:05:01
793	https://www.rbc.ru/politics/02/07/2025/6864a30e9a794786969daf39	t	2025-07-02 08:00:02	2025-07-02 08:05:02
796	https://www.rbc.ru/politics/01/07/2025/686443789a7947692c72f743	t	2025-07-02 08:00:02	2025-07-02 08:05:02
798	https://www.rbc.ru/politics/01/07/2025/6864099b9a794765a336a0de	t	2025-07-02 08:00:02	2025-07-02 08:05:02
800	https://www.rbc.ru/technology_and_media/02/07/2025/686486e99a79479b1987c017	t	2025-07-02 08:00:02	2025-07-02 08:05:03
801	https://www.rbc.ru/quote/news/article/6864134e9a7947283a0f9a48	t	2025-07-02 08:00:02	2025-07-02 08:05:03
802	https://www.rbc.ru/politics/02/07/2025/686443159a79470b1036b9f7	t	2025-07-02 08:00:02	2025-07-02 08:05:03
803	https://www.rbc.ru/rbcfreenews/686422b49a79478b504e8b6c	t	2025-07-02 08:00:02	2025-07-02 08:05:03
804	https://www.rbc.ru/politics/01/07/2025/6864290d9a7947a82c99c92f	t	2025-07-02 08:00:02	2025-07-02 08:05:03
503	https://www.rbc.ru/politics/01/07/2025/68638aa09a7947716d8f2f15	t	2025-07-01 16:40:01	2025-07-01 16:45:02
993	https://www.rbc.ru/politics/02/07/2025/6864bcc69a794783483c8cd6	t	2025-07-02 08:50:02	2025-07-02 08:55:03
808	https://pro.rbc.ru/demo/686289359a79471a408ee8f0	f	2025-07-02 08:10:01	2025-07-02 08:10:01
822	https://www.rbc.ru/society/02/07/2025/6863da789a7947f0feb9978d	t	2025-07-02 08:30:02	2025-07-02 08:35:02
1026	https://pro.rbc.ru/demo/685e8a119a794767f663d863	f	2025-07-02 09:10:03	2025-07-02 09:10:03
1025	https://www.rbc.ru/society/02/07/2025/6864b3b29a794711c1d9e0a2	t	2025-07-02 09:10:03	2025-07-02 09:15:04
1037	https://www.rbc.ru/politics/02/07/2025/6863f2999a7947d7aeab7b75	t	2025-07-02 09:20:02	2025-07-02 09:25:02
1040	https://www.rbc.ru/politics/02/07/2025/686470289a7947a96cae3835	t	2025-07-02 09:20:02	2025-07-02 09:25:03
1072	https://www.rbc.ru/society/02/07/2025/6864d28f9a794753cdde6ee6	t	2025-07-02 09:40:03	2025-07-02 09:45:03
1118	https://www.rbc.ru/technology_and_media/02/07/2025/686435289a79473244bc80a7	t	2025-07-02 10:10:03	2025-07-02 10:15:01
499	https://www.rbc.ru/politics/01/07/2025/6863dd0e9a7947abff90e180	t	2025-07-01 16:40:01	2025-07-01 16:45:01
1152	https://www.rbc.ru/politics/02/07/2025/6864da3d9a79470c0b36c0ad	t	2025-07-02 10:30:05	2025-07-02 10:35:03
1156	https://www.rbc.ru/politics/02/07/2025/6864cf049a7947a375e93724	t	2025-07-02 10:30:05	2025-07-02 10:35:03
1227	https://rbcrealty.ru/news/68627f589a7947e45e3da690	f	2025-07-02 11:10:02	2025-07-02 11:10:02
1213	https://www.rbc.ru/politics/02/07/2025/6864c6a99a7947336f098617	t	2025-07-02 11:10:02	2025-07-02 11:15:02
1250	https://www.rbc.ru/quote/news/article/6864e7859a7947c79a185414	t	2025-07-02 11:30:01	2025-07-02 11:35:02
1265	https://pro.rbc.ru/demo/6862b8619a7947b54727f823	f	2025-07-02 11:40:03	2025-07-02 11:40:03
1264	https://www.rbc.ru/society/02/07/2025/6864dc599a79478c886482cf	t	2025-07-02 11:40:03	2025-07-02 11:45:03
1278	https://www.rbc.ru/politics/02/07/2025/6864e8329a79470614c74e97	t	2025-07-02 12:30:03	2025-07-02 12:35:02
1282	https://www.rbc.ru/society/02/07/2025/6864ef1e9a79472f68668cc2	t	2025-07-02 12:30:03	2025-07-02 12:35:03
1309	https://www.rbc.ru/business/02/07/2025/6864e6719a7947f9bc22affa	t	2025-07-02 12:50:01	2025-07-02 12:55:02
1310	https://www.rbc.ru/society/02/07/2025/6864f6dc9a7947bf151e7407	t	2025-07-02 12:50:01	2025-07-02 12:55:03
1332	https://www.rbc.ru/society/02/07/2025/6864efa39a79472f68668cc9	t	2025-07-02 13:00:05	2025-07-02 13:05:03
1334	https://www.rbc.ru/politics/02/07/2025/686501479a7947a2a4f43465	t	2025-07-02 13:00:05	2025-07-02 13:05:03
648	https://www.rbc.ru/business/01/07/2025/6863e3ab9a7947b89fef6737	t	2025-07-01 17:00:03	2025-07-01 17:05:01
651	https://www.rbc.ru/politics/01/07/2025/6863e5329a79476528012dfb	t	2025-07-01 17:00:03	2025-07-01 17:05:02
658	https://www.rbc.ru/politics/01/07/2025/685c71799a79474fb1206a1f	t	2025-07-01 17:00:03	2025-07-01 17:05:02
1396	https://www.rbc.ru/politics/02/07/2025/6865062b9a7947298e86d17b	t	2025-07-02 13:40:03	2025-07-02 13:45:05
1394	https://www.rbc.ru/society/02/07/2025/686507939a79471c17c62cc3	t	2025-07-02 13:40:03	2025-07-02 13:45:05
1434	https://pro.rbc.ru/demo/685b96819a7947b62c49a222	f	2025-07-02 14:00:03	2025-07-02 14:00:03
1438	https://www.rbc.ru/politics/02/07/2025/68650fe29a7947a1f9332bce	t	2025-07-02 14:10:01	2025-07-02 14:15:04
1572	https://www.rbc.ru/politics/02/07/2025/6865143b9a79472ddc1ab374	t	2025-07-02 14:30:02	2025-07-02 14:35:02
1578	https://www.rbc.ru/rbcfreenews/686513a89a79472cee23b445	t	2025-07-02 14:30:02	2025-07-02 14:35:03
2046	https://www.rbc.ru/finances/02/07/2025/686519b69a7947d42d96e608	t	2025-07-02 15:10:04	2025-07-02 15:15:01
2168	https://pro.rbc.ru/demo/685d379a9a794768389ab64c	f	2025-07-02 15:40:01	2025-07-02 15:40:01
2184	https://pro.rbc.ru/news/685d379a9a794768389ab64c	f	2025-07-02 15:50:02	2025-07-02 15:50:02
2155	https://www.rbc.ru/politics/02/07/2025/686523b09a7947ca680a6faf	t	2025-07-02 15:40:01	2025-07-02 15:50:02
2202	https://www.rbc.ru/politics/02/07/2025/68652c1a9a7947f641f2c5f5	t	2025-07-02 16:10:03	2025-07-02 16:15:03
2414	https://pro.rbc.ru/demo/686419189a794777e48cffa7	f	2025-07-03 08:10:02	2025-07-03 08:10:02
2422	https://rbcrealty.ru/news/685d776d9a7947f97f6f652b	f	2025-07-03 08:10:02	2025-07-03 08:10:02
2413	https://www.rbc.ru/society/03/07/2025/686544ac9a7947cd2554ca5c	t	2025-07-03 08:10:02	2025-07-03 08:15:02
2465	https://pro.rbc.ru/demo/68652dd79a794726c8e63152	f	2025-07-03 08:40:01	2025-07-03 08:40:01
2493	https://pro.rbc.ru/demo/6863f1dc9a794769ee5c8e61	f	2025-07-03 09:00:03	2025-07-03 09:00:03
2495	https://www.rbc.ru/politics/03/07/2025/68660d409a79475d922e450d	t	2025-07-03 09:00:03	2025-07-03 09:05:00
2849	https://www.rbc.ru/rbcfreenews/6866504c9a794779fcb8071a	t	2025-07-03 13:10:03	2025-07-03 13:15:03
1458	https://www.rbc.ru/politics/02/07/2025/6864fdf59a7947ab7cfc14ad	t	2025-07-02 14:20:04	2025-07-02 14:25:01
1955	https://www.rbc.ru/finances/02/07/2025/68651b679a79473b4f8cab5e	t	2025-07-02 15:00:03	2025-07-02 15:05:03
2352	https://pro.rbc.ru/demo/685e6ddc9a7947d59deba9ae	f	2025-07-02 17:00:03	2025-07-02 17:00:03
2357	https://pro.rbc.ru/demo/685e99299a7947c83ddb3666	f	2025-07-02 17:00:03	2025-07-02 17:00:03
2359	https://pro.rbc.ru/demo/685d16619a79474220acd2e2	f	2025-07-02 17:00:03	2025-07-02 17:00:03
2345	https://www.rbc.ru/rbcfreenews/686532a79a7947111a7f504e	t	2025-07-02 17:00:03	2025-07-02 17:05:04
2361	https://pro.rbc.ru/demo/686531379a79472714bc664e	f	2025-07-03 07:40:03	2025-07-03 07:40:03
2363	https://pro.rbc.ru/demo/68654c139a79471aa44c9b92	f	2025-07-03 07:40:03	2025-07-03 07:40:03
2364	https://rt.rbc.ru/tatarstan/freenews/6865e5459a79474d67d8915e	f	2025-07-03 07:40:03	2025-07-03 07:40:03
2368	https://rbcrealty.ru/news/686538be9a79470c7e03f9ad	f	2025-07-03 07:40:03	2025-07-03 07:40:03
2362	https://www.rbc.ru/politics/03/07/2025/6865bf949a79474429020d13	t	2025-07-03 07:40:03	2025-07-03 07:45:01
2365	https://www.rbc.ru/sport/03/07/2025/686536629a79474c44c720e0	t	2025-07-03 07:40:03	2025-07-03 07:45:02
2366	https://www.rbc.ru/business/03/07/2025/686431299a794769a39730b4	t	2025-07-03 07:40:03	2025-07-03 07:45:02
2367	https://www.rbc.ru/politics/03/07/2025/6865ebba9a79471662637848	t	2025-07-03 07:40:03	2025-07-03 07:45:03
2369	https://www.rbc.ru/society/03/07/2025/6865fe6c9a794725f14b2bec	t	2025-07-03 07:40:03	2025-07-03 07:45:03
2370	https://www.rbc.ru/society/03/07/2025/6865d45d9a7947bc968f8112	t	2025-07-03 07:40:03	2025-07-03 07:45:03
2371	https://www.rbc.ru/politics/02/07/2025/68658aef9a79474a56d18eee	t	2025-07-03 07:40:03	2025-07-03 07:45:03
2373	https://www.rbc.ru/politics/02/07/2025/686537ea9a7947e3b40f3f24	t	2025-07-03 07:40:03	2025-07-03 07:45:04
2372	https://www.rbc.ru/politics/02/07/2025/68658aa09a7947349366b181	t	2025-07-03 07:40:03	2025-07-03 07:45:05
2189	https://www.rbc.ru/politics/02/07/2025/686529b39a79475b0eba85bd	t	2025-07-02 16:00:02	2025-07-02 16:05:02
2196	https://www.rbc.ru/quote/news/article/68550bfd9a7947fdd7028dbd	t	2025-07-02 16:00:02	2025-07-02 16:05:03
2254	https://pro.rbc.ru/demo/6863e0899a7947d08534f69e	f	2025-07-02 16:40:03	2025-07-02 16:40:03
2251	https://www.rbc.ru/politics/02/07/2025/686513679a794718fe1f6789	t	2025-07-02 16:40:03	2025-07-02 16:45:01
2410	https://www.rbc.ru/politics/03/07/2025/6865a9819a794723d44ec20c	t	2025-07-03 08:10:02	2025-07-03 08:15:01
1837	https://www.rbc.ru/politics/02/07/2025/686519509a79473629315ca9	t	2025-07-02 14:50:02	2025-07-02 14:55:02
1836	https://www.rbc.ru/economics/02/07/2025/686514a99a7947bacb925f6d	t	2025-07-02 14:50:02	2025-07-02 14:55:02
2330	https://www.rbc.ru/politics/02/07/2025/6865329e9a794781afd6a65d	t	2025-07-02 16:50:02	2025-07-02 16:55:02
2374	https://www.rbc.ru/society/02/07/2025/68656d5f9a79470cc1145d26	t	2025-07-03 07:40:03	2025-07-03 07:45:04
2375	https://www.rbc.ru/finances/02/07/2025/686524499a79470e1c5d3544	t	2025-07-03 07:40:03	2025-07-03 07:45:04
2376	https://www.rbc.ru/politics/02/07/2025/68654a999a79472c7779be8e	t	2025-07-03 07:40:03	2025-07-03 07:45:05
2578	https://pro.rbc.ru/demo/68627eb49a79477977171481	f	2025-07-03 09:10:01	2025-07-03 09:10:01
2635	https://rt.rbc.ru/tatarstan/freenews/686626819a794746133e0d34	f	2025-07-03 09:50:01	2025-07-03 09:50:01
2649	https://www.rbc.ru/politics/03/07/2025/68661a399a794778c795a000	t	2025-07-03 10:00:03	2025-07-03 10:05:01
2670	https://www.rbc.ru/society/03/07/2025/686609439a7947a6dc2ed990	t	2025-07-03 10:10:01	2025-07-03 10:15:02
2673	https://www.rbc.ru/sport/03/07/2025/6863ed919a7947fef27184d9	t	2025-07-03 10:10:01	2025-07-03 10:15:02
2665	https://www.rbc.ru/business/03/07/2025/68628f0d9a7947353f3477a4	t	2025-07-03 10:10:01	2025-07-03 10:15:02
2700	https://pro.rbc.ru/demo/686521579a79470065d5c4bf	f	2025-07-03 10:50:02	2025-07-03 10:50:02
2680	https://www.rbc.ru/business/03/07/2025/68662aaa9a794718c39f5981	t	2025-07-03 10:20:03	2025-07-03 10:50:02
2702	https://www.rbc.ru/politics/03/07/2025/68662d339a7947226593d011	t	2025-07-03 10:50:02	2025-07-03 10:55:03
2704	https://www.rbc.ru/politics/03/07/2025/686624d69a7947d848c6be72	t	2025-07-03 10:50:02	2025-07-03 10:55:05
2708	https://www.rbc.ru/rbcfreenews/68662c669a79472960f7e585	t	2025-07-03 10:50:02	2025-07-03 10:55:05
2730	https://pro.rbc.ru/demo/68623d7b9a7947623c8ff607	f	2025-07-03 11:10:01	2025-07-03 11:10:01
2738	https://www.rbc.ru/rbcfreenews/6866334d9a7947449d3d7bde	t	2025-07-03 11:10:01	2025-07-03 11:15:02
2770	https://www.rbc.ru/sport/03/07/2025/68663ccb9a79470fb92ab3e9	t	2025-07-03 11:30:02	2025-07-03 11:35:02
2795	https://rt.rbc.ru/tatarstan/freenews/68664d2e9a7947d4c417d15d	f	2025-07-03 12:40:01	2025-07-03 12:40:01
2792	https://www.rbc.ru/business/03/07/2025/6866345b9a794795abeedb52	t	2025-07-03 12:40:01	2025-07-03 12:45:02
2794	https://www.rbc.ru/politics/03/07/2025/686649099a7947c2b0fe2a31	t	2025-07-03 12:40:01	2025-07-03 12:45:02
2796	https://www.rbc.ru/rbcfreenews/686628a59a794740b274e893	t	2025-07-03 12:40:01	2025-07-03 12:45:02
2798	https://www.rbc.ru/politics/03/07/2025/68664bab9a79472e063d97f2	t	2025-07-03 12:40:01	2025-07-03 12:45:03
2799	https://www.rbc.ru/business/03/07/2025/6865081f9a79470c9b85e9f0	t	2025-07-03 12:40:01	2025-07-03 12:45:03
2801	https://www.rbc.ru/politics/03/07/2025/686649ac9a79477c10c33aa3	t	2025-07-03 12:40:01	2025-07-03 12:45:03
2802	https://www.rbc.ru/society/03/07/2025/6866362e9a79474c80fc7866	t	2025-07-03 12:40:01	2025-07-03 12:45:03
2875	https://rt.rbc.ru/tatarstan/freenews/68665a3b9a794770a2bf1b67	f	2025-07-03 13:30:02	2025-07-03 13:30:02
2866	https://www.rbc.ru/politics/03/07/2025/6866525c9a794779b59e98f1	t	2025-07-03 13:20:01	2025-07-03 13:30:02
2912	https://pro.rbc.ru/demo/686258449a7947b017b31cad	f	2025-07-03 13:50:02	2025-07-03 13:50:02
2906	https://www.rbc.ru/finances/03/07/2025/686659c09a79476af1cc5132	t	2025-07-03 13:50:02	2025-07-03 13:55:03
2914	https://www.rbc.ru/society/03/07/2025/686643039a79473313d9657a	t	2025-07-03 13:50:02	2025-07-03 13:55:03
2924	https://www.rbc.ru/politics/03/07/2025/68665c3a9a794723dea2b180	t	2025-07-03 14:00:03	2025-07-03 14:05:03
2927	https://www.rbc.ru/finances/03/07/2025/68663dae9a7947a0a9b34bb3	t	2025-07-03 14:00:03	2025-07-03 14:05:04
2926	https://www.rbc.ru/rbcfreenews/68665fd69a79473f602485c3	t	2025-07-03 14:00:03	2025-07-03 14:05:04
2929	https://www.rbc.ru/politics/03/07/2025/68665b349a79475fa3e2db32	t	2025-07-03 14:00:03	2025-07-03 14:05:04
2938	https://www.rbc.ru/economics/03/07/2025/6866628e9a794757ef5f0b64	t	2025-07-03 14:10:01	2025-07-03 14:15:01
2954	https://www.rbc.ru/finances/03/07/2025/686660fc9a79470e35945e1c	t	2025-07-03 14:20:02	2025-07-03 14:25:02
2998	https://www.rbc.ru/politics/03/07/2025/6866676f9a794773d8f0d6a5	t	2025-07-03 14:40:01	2025-07-03 14:45:02
3034	https://www.rbc.ru/technology_and_media/03/07/2025/68666e4a9a794782d5895275	t	2025-07-03 15:10:01	2025-07-04 10:15:03
3038	https://www.rbc.ru/politics/03/07/2025/686663d59a794780a472af0a	t	2025-07-03 15:10:01	2025-07-04 10:15:03
3050	https://pro.rbc.ru/demo/6866b9509a794722d874a720	f	2025-07-04 10:20:03	2025-07-04 10:20:03
3051	https://rt.rbc.ru/tatarstan/freenews/6867531d9a79477e3758d676	f	2025-07-04 10:20:03	2025-07-04 10:20:03
3052	https://pro.rbc.ru/demo/6866728f9a79471464a7be33	f	2025-07-04 10:20:03	2025-07-04 10:20:03
3053	https://rt.rbc.ru/tatarstan/freenews/686763629a79474b4ca468ab	f	2025-07-04 10:20:03	2025-07-04 10:20:03
3054	https://pro.rbc.ru/demo/686297769a79471ded33de88	f	2025-07-04 10:20:03	2025-07-04 10:20:03
3060	https://pro.rbc.ru/demo/686398169a79477d5dec48b4	f	2025-07-04 10:20:03	2025-07-04 10:20:03
3048	https://www.rbc.ru/politics/04/07/2025/685409459a7947662bba4b08	t	2025-07-04 10:20:03	2025-07-04 10:25:03
3055	https://www.rbc.ru/politics/04/07/2025/6867726a9a79475b6fb26115	t	2025-07-04 10:20:03	2025-07-04 10:25:04
3056	https://www.rbc.ru/politics/04/07/2025/6867691b9a7947359a080ea4	t	2025-07-04 10:20:03	2025-07-04 10:25:04
3057	https://www.rbc.ru/politics/04/07/2025/68673ba19a794759b88093ce	t	2025-07-04 10:20:03	2025-07-04 10:25:04
3049	https://www.rbc.ru/politics/04/07/2025/68665e8c9a79472344eb40cd	t	2025-07-04 10:20:03	2025-07-04 10:25:04
3059	https://www.rbc.ru/politics/04/07/2025/686664bd9a794782e410fe26	t	2025-07-04 10:20:03	2025-07-04 10:25:04
3058	https://www.rbc.ru/politics/04/07/2025/6867598c9a79473c545c7d9a	t	2025-07-04 10:20:03	2025-07-04 10:25:04
3061	https://www.rbc.ru/society/04/07/2025/6867761a9a79476be31497aa	t	2025-07-04 10:20:03	2025-07-04 10:25:05
3062	https://www.rbc.ru/politics/04/07/2025/6867057c9a79471833741b40	t	2025-07-04 10:20:03	2025-07-04 10:25:05
3063	https://www.rbc.ru/politics/04/07/2025/686737b09a7947d05c9c57da	t	2025-07-04 10:20:03	2025-07-04 10:25:05
3073	https://pro.rbc.ru/demo/6863c0da9a7947282dbe5e4c	f	2025-07-04 10:30:02	2025-07-04 10:30:02
3081	https://www.rbc.ru/politics/04/07/2025/686743139a7947d05c9c57e8	t	2025-07-04 10:40:04	2025-07-04 10:45:02
3116	https://pro.rbc.ru/demo/6864ee209a7947daa5422ac6	f	2025-07-04 11:00:02	2025-07-04 11:00:02
3120	https://www.rbc.ru/quote/news/article/68675c5f9a7947363c947cba	t	2025-07-04 11:00:02	2025-07-04 11:05:03
3129	https://www.rbc.ru/politics/04/07/2025/68663e819a7947b7916cafaf	t	2025-07-04 11:10:03	2025-07-04 11:15:03
3136	https://www.rbc.ru/business/04/07/2025/68666b359a79472ad5bd6e7c	t	2025-07-04 11:10:03	2025-07-04 11:15:04
3145	https://www.rbc.ru/politics/04/07/2025/686785c49a794724c411d75c	t	2025-07-04 11:20:02	2025-07-04 11:25:03
3194	https://pro.rbc.ru/demo/686662609a79475f9a1e6046	f	2025-07-04 12:30:02	2025-07-04 12:30:02
3198	https://www.rbc.ru/quote/news/article/686777299a794764d5ca5236	t	2025-07-04 12:30:02	2025-07-04 12:35:03
3206	https://www.rbc.ru/rbcfreenews/68678e649a79474ae9e501c9	t	2025-07-04 12:30:02	2025-07-04 12:35:03
3200	https://www.rbc.ru/politics/04/07/2025/68677e729a79471b3154efc4	t	2025-07-04 12:30:02	2025-07-04 12:35:03
3227	https://rt.rbc.ru/tatarstan/freenews/686776fb9a79472c387609da	f	2025-07-04 12:50:01	2025-07-04 12:50:01
3232	https://www.rbc.ru/business/04/07/2025/6867994a9a794755d6b3c2f0	t	2025-07-04 12:50:01	2025-07-04 12:55:02
3225	https://www.rbc.ru/politics/04/07/2025/6867935b9a7947ab276cd3e0	t	2025-07-04 12:50:01	2025-07-04 12:55:02
3235	https://www.rbc.ru/rbcfreenews/68679b3f9a7947787df648a6	t	2025-07-04 12:50:01	2025-07-04 12:55:03
3256	https://www.rbc.ru/politics/04/07/2025/6867a0799a79471aa53bf78b	t	2025-07-04 13:10:01	2025-07-04 13:15:02
3257	https://www.rbc.ru/politics/04/07/2025/6867a5279a7947e546b83e93	t	2025-07-04 13:10:01	2025-07-04 13:15:02
3264	https://www.rbc.ru/politics/04/07/2025/6867a0f59a79476d9776db88	t	2025-07-04 13:10:01	2025-07-04 13:15:02
3276	https://www.rbc.ru/politics/04/07/2025/6867a0819a794747e0ab7997	t	2025-07-04 13:20:03	2025-07-04 13:25:03
3307	https://rt.rbc.ru/tatarstan/freenews/686771ea9a79474b2f4eff12	f	2025-07-04 13:40:03	2025-07-04 13:40:03
3304	https://www.rbc.ru/politics/04/07/2025/6867adf59a7947647e881c58	t	2025-07-04 13:40:03	2025-07-04 14:05:01
3305	https://www.rbc.ru/quote/news/article/6867a4b29a7947f14a8ec42b	t	2025-07-04 13:40:03	2025-07-04 14:05:02
3310	https://www.rbc.ru/politics/04/07/2025/6867a88c9a7947f5d725f8e5	t	2025-07-04 13:40:03	2025-07-04 14:05:02
3324	https://pro.rbc.ru/demo/6865b4ec9a7947134442d7f7	f	2025-07-04 14:10:02	2025-07-04 14:10:02
3362	https://www.rbc.ru/politics/04/07/2025/6867b55f9a7947ef4fa770be	t	2025-07-04 14:30:01	2025-07-04 14:35:02
3369	https://www.rbc.ru/politics/04/07/2025/6867b9bb9a7947672b57604b	t	2025-07-04 14:40:03	2025-07-04 14:45:03
3393	https://pro.rbc.ru/demo/6863ac1f9a79477d1a852ffe	f	2025-07-04 14:50:01	2025-07-04 14:50:01
3394	https://www.rbc.ru/politics/04/07/2025/6867bbdb9a794765d48c32f7	t	2025-07-04 14:50:01	2025-07-04 14:55:03
3410	https://www.rbc.ru/rbcfreenews/6867b8889a79470ce738c91d	t	2025-07-04 15:00:04	2025-07-04 15:05:01
3420	https://www.rbc.ru/politics/04/07/2025/6867b85c9a794751cab09d6f	t	2025-07-04 15:10:01	2025-07-04 15:15:02
3460	https://www.rbc.ru/sport/04/07/2025/6867b51e9a7947f3ae7db3e8	t	2025-07-04 15:30:01	2025-07-04 15:35:01
3465	https://www.rbc.ru/society/04/07/2025/6867b9f39a7947672b57604f	t	2025-07-04 15:40:02	2025-07-04 15:45:03
3474	https://www.rbc.ru/society/04/07/2025/6867c8099a794735fe128a02	t	2025-07-04 15:40:02	2025-07-04 15:45:03
3495	https://www.rbc.ru/society/04/07/2025/6867bdcd9a79475d264999fb	t	2025-07-04 16:00:02	2025-07-04 16:05:02
3514	https://pro.rbc.ru/demo/685ea5929a79477a8d003826	f	2025-07-04 16:10:03	2025-07-04 16:10:03
3518	https://pro.rbc.ru/demo/6864fe939a794732cfbbc914	f	2025-07-04 16:10:03	2025-07-04 16:10:03
3507	https://www.rbc.ru/politics/04/07/2025/6867cef99a7947cbdc8c60c2	t	2025-07-04 16:10:03	2025-07-04 16:15:05
3546	https://www.rbc.ru/politics/04/07/2025/6867c4cc9a79478250f2f99e	t	2025-07-04 16:30:04	2025-07-04 16:35:03
3554	https://rt.rbc.ru/tatarstan/interview/04/07/2025/6867b52d9a79479f46d6dfb3	f	2025-07-04 16:40:01	2025-07-04 16:40:01
3552	https://www.rbc.ru/politics/04/07/2025/6867a7cf9a79471277878050	t	2025-07-04 16:40:01	2025-07-04 16:45:01
3568	https://www.rbc.ru/politics/04/07/2025/6867d99f9a7947717ebc416a	t	2025-07-04 16:50:02	2025-07-04 16:55:03
3584	https://www.rbc.ru/politics/04/07/2025/6867dab49a7947ce4aa7a157	t	2025-07-04 17:00:03	2025-07-04 17:05:01
3617	https://pro.rbc.ru/demo/68680af79a79477cab285b99	f	2025-07-07 07:50:01	2025-07-07 07:50:01
3618	https://rt.rbc.ru/tatarstan/freenews/686b2ff69a79477baa8c8783	f	2025-07-07 07:50:01	2025-07-07 07:50:01
3620	https://pro.rbc.ru/demo/6863c7799a7947c7f38c1bfd	f	2025-07-07 07:50:01	2025-07-07 07:50:01
3622	https://pro.rbc.ru/demo/6867d6399a79471fc19e2bba	f	2025-07-07 07:50:01	2025-07-07 07:50:01
3623	https://rt.rbc.ru/tatarstan/freenews/686aed259a79472873ff81d5	f	2025-07-07 07:50:01	2025-07-07 07:50:01
3628	https://pro.rbc.ru/demo/686237639a7947ac6a11feec	f	2025-07-07 07:50:01	2025-07-07 07:50:01
3629	https://pro.rbc.ru/demo/68680fad9a79476c596e5a5d	f	2025-07-07 07:50:01	2025-07-07 07:50:01
3615	https://www.rbc.ru/politics/07/07/2025/686b35339a79476d211cbfed	t	2025-07-07 07:50:01	2025-07-07 07:55:02
3616	https://www.rbc.ru/business/07/07/2025/685e5e1c9a7947b3c6e38954	t	2025-07-07 07:50:01	2025-07-07 07:55:02
3619	https://www.rbc.ru/rbcfreenews/686b49169a7947ba2b08bf28	t	2025-07-07 07:50:01	2025-07-07 07:55:03
3621	https://www.rbc.ru/business/07/07/2025/686814649a7947ae1e4a52c5	t	2025-07-07 07:50:01	2025-07-07 07:55:03
3624	https://www.rbc.ru/business/07/07/2025/6867822c9a79473f069824fc	t	2025-07-07 07:50:01	2025-07-07 07:55:03
3625	https://www.rbc.ru/politics/07/07/2025/686b14b49a79473f261ad108	t	2025-07-07 07:50:01	2025-07-07 07:55:03
3626	https://www.rbc.ru/business/07/07/2025/6866cf4e9a794711bb6b3de9	t	2025-07-07 07:50:01	2025-07-07 07:55:03
3627	https://www.rbc.ru/politics/07/07/2025/686b28409a79474d8b4f37ea	t	2025-07-07 07:50:01	2025-07-07 07:55:03
3630	https://www.rbc.ru/politics/07/07/2025/686aeeef9a79476c76215033	t	2025-07-07 07:50:01	2025-07-07 07:55:04
3656	https://pro.rbc.ru/demo/6867db999a794759fc5d4c82	f	2025-07-07 08:10:03	2025-07-07 08:10:03
3648	https://www.rbc.ru/politics/07/07/2025/686b52a89a79475fc87aa252	t	2025-07-07 08:10:03	2025-07-07 08:15:02
3653	https://www.rbc.ru/politics/07/07/2025/686afde19a794703fd437bf1	t	2025-07-07 08:10:03	2025-07-07 08:15:03
3733	https://www.rbc.ru/politics/07/07/2025/686b46189a79479d900c243f	t	2025-07-07 09:00:01	2025-07-07 09:05:02
3742	https://www.rbc.ru/wine/news/6867b45e9a7947d69e491dc5	t	2025-07-07 09:00:01	2025-07-07 09:05:02
3748	https://pro.rbc.ru/demo/686524ff9a79472262b38745	f	2025-07-07 09:10:03	2025-07-07 09:10:03
3775	https://www.rbc.ru/person/648b25739a79476cbcba5f5c	f	2025-07-07 09:40:01	2025-07-07 09:40:01
3797	https://rt.rbc.ru/tatarstan/freenews/6867d37a9a7947232ea1af30	f	2025-07-07 09:50:02	2025-07-07 09:50:02
3847	https://www.rbc.ru/rbcfreenews/686b73509a79479a012f44d6	t	2025-07-07 10:20:02	2025-07-07 10:25:02
3840	https://www.rbc.ru/technology_and_media/07/07/2025/6867df1e9a7947c6f9bf8adc	t	2025-07-07 10:20:02	2025-07-07 10:25:02
3919	https://www.rbc.ru/politics/07/07/2025/686b667c9a79476596c4f53b	t	2025-07-07 11:10:03	2025-07-07 11:15:01
3937	https://rt.rbc.ru/tatarstan/freenews/686b7db39a7947b35271829b	f	2025-07-07 11:20:02	2025-07-07 11:20:02
3938	https://www.rbc.ru/society/07/07/2025/686b61519a79477d53164dc6	t	2025-07-07 11:20:02	2025-07-07 11:25:03
3941	https://www.rbc.ru/society/07/07/2025/686b78079a79479145583cac	t	2025-07-07 11:20:02	2025-07-07 11:25:04
3955	https://rt.rbc.ru/tatarstan/freenews/686b84019a794760ef3e8ee1	f	2025-07-07 11:30:01	2025-07-07 11:30:01
3962	https://pro.rbc.ru/demo/6866492e9a7947ab3c841875	f	2025-07-07 11:30:01	2025-07-07 11:30:01
3968	https://www.rbc.ru/society/07/07/2025/6869aaa49a7947837dab9d83	t	2025-07-07 11:40:03	2025-07-07 11:45:03
3983	https://www.rbc.ru/rbcfreenews/686b90c99a7947dcef500336	t	2025-07-07 12:30:04	2025-07-07 12:35:02
3984	https://www.rbc.ru/politics/07/07/2025/686b8e969a79474d518ab392	t	2025-07-07 12:30:04	2025-07-07 12:35:02
3991	https://www.rbc.ru/rbcfreenews/686b83bf9a79470bc592ab64	t	2025-07-07 12:30:04	2025-07-07 12:35:02
3996	https://www.rbc.ru/rbcfreenews/686b77809a7947d358ea2a72	t	2025-07-07 12:30:04	2025-07-07 12:35:02
4018	https://www.rbc.ru/politics/07/07/2025/686b73809a79478209e3d98b	t	2025-07-07 12:50:02	2025-07-07 12:55:01
4037	https://www.rbc.ru/society/07/07/2025/686b8f3f9a79473f0702087c	t	2025-07-07 13:00:02	2025-07-07 13:05:02
4039	https://www.rbc.ru/politics/07/07/2025/686b89779a7947d3372076f5	t	2025-07-07 13:00:02	2025-07-07 13:05:03
4042	https://www.rbc.ru/economics/07/07/2025/686b8e699a7947a5f08d0edc	t	2025-07-07 13:00:02	2025-07-07 13:05:03
4062	https://www.rbc.ru/industries/news/6842ac969a79476242a62db9	f	2025-07-07 13:10:01	2025-07-07 13:10:01
4066	https://www.rbc.ru/rbcfreenews/686b9dfb9a794725dd7b64d1	t	2025-07-07 13:20:01	2025-07-07 13:25:01
4148	https://www.rbc.ru/person/686b87c29a7947f2ffe6220c	f	2025-07-07 14:10:01	2025-07-07 14:10:01
4149	https://www.rbc.ru/politics/07/07/2025/686ba0989a794762e7de25f0	t	2025-07-07 14:10:01	2025-07-07 14:15:02
4162	https://www.rbc.ru/society/07/07/2025/686ba9aa9a79475f49332e40	t	2025-07-07 14:20:02	2025-07-07 14:25:02
4186	https://rt.rbc.ru/tatarstan/07/07/2025/686bad1a9a7947082f44fb44	f	2025-07-07 14:30:00	2025-07-07 14:30:00
4176	https://www.rbc.ru/society/06/07/2025/686a68a99a79470cf4695c1e	t	2025-07-07 14:30:00	2025-07-07 14:35:02
4180	https://www.rbc.ru/society/07/07/2025/686b83b89a79475b2900cf82	t	2025-07-07 14:30:00	2025-07-07 14:35:02
4191	https://www.rbc.ru/politics/07/07/2025/686b71d59a7947589ea030d4	t	2025-07-07 14:40:00	2025-07-07 14:45:01
4241	https://rt.rbc.ru/tatarstan/freenews/686ba6669a794706d826be99	f	2025-07-07 15:10:02	2025-07-07 15:10:02
4245	https://www.rbc.ru/rbcfreenews/686bb5cd9a7947c391ea67c6	t	2025-07-07 15:10:02	2025-07-07 15:15:00
4263	https://www.rbc.ru/politics/07/07/2025/686bafc49a79471e5816b8fa	t	2025-07-07 15:20:03	2025-07-07 15:25:03
4283	https://pro.rbc.ru/demo/6867f6c69a794735bbf211c6	f	2025-07-07 15:30:01	2025-07-07 15:30:01
4285	https://www.rbc.ru/politics/07/07/2025/686ba78c9a7947a23e3c2be7	t	2025-07-07 15:30:01	2025-07-07 15:35:01
4288	https://pro.rbc.ru/demo/686b70409a794702e84eebf5	f	2025-07-07 15:40:02	2025-07-07 15:40:02
4290	https://www.rbc.ru/society/07/07/2025/686bbb279a7947bef450e5cb	t	2025-07-07 15:40:02	2025-07-07 15:45:03
4297	https://www.rbc.ru/society/07/07/2025/686bb8de9a7947d1e4fd151f	t	2025-07-07 15:40:02	2025-07-07 15:45:03
4322	https://www.rbc.ru/society/07/07/2025/686bc2c89a7947ea2267c0f2	t	2025-07-07 16:00:01	2025-07-07 16:05:02
4372	https://www.rbc.ru/politics/07/07/2025/686bc2909a79477cbb81aed8	t	2025-07-07 16:30:01	2025-07-07 16:35:03
4396	https://pro.rbc.ru/demo/6867b7f39a79470ce738c917	f	2025-07-07 16:40:01	2025-07-07 16:40:01
4383	https://www.rbc.ru/politics/07/07/2025/686bcb179a79474280d284b3	t	2025-07-07 16:40:01	2025-07-07 16:45:01
4468	https://pro.rbc.ru/demo/686405139a7947ae106e60ec	f	2025-07-07 16:50:01	2025-07-07 16:50:01
4467	https://www.rbc.ru/society/07/07/2025/686bc4949a7947265ddad0e7	t	2025-07-07 16:50:01	2025-07-07 16:55:02
4502	https://pro.rbc.ru/demo/686385b49a79471b89f2e26d	f	2025-07-08 08:00:01	2025-07-08 08:00:01
4507	https://pro.rbc.ru/demo/686620e59a79472f09f7ffb9	f	2025-07-08 08:00:01	2025-07-08 08:00:01
4509	https://www.rbc.ru/business/08/07/2025/686c93039a7947390cbce7fd	t	2025-07-08 08:00:01	2025-07-08 08:35:01
4501	https://www.rbc.ru/politics/08/07/2025/686bbc9d9a79476ae53d997f	t	2025-07-08 08:00:01	2025-07-08 08:35:01
4508	https://www.rbc.ru/politics/07/07/2025/686bd5ed9a7947c479711f94	t	2025-07-08 08:00:01	2025-07-08 08:35:01
4504	https://www.rbc.ru/finances/08/07/2025/686c7ffb9a794736497af080	t	2025-07-08 08:00:01	2025-07-08 08:35:01
4494	https://www.rbc.ru/politics/08/07/2025/686c76349a794724b0b624a9	t	2025-07-08 08:00:01	2025-07-08 08:35:01
4495	https://www.rbc.ru/technology_and_media/08/07/2025/686bd6a09a79472adcf2e579	t	2025-07-08 08:00:01	2025-07-08 08:35:01
4497	https://www.rbc.ru/politics/08/07/2025/686ca2909a7947d02b5d126c	t	2025-07-08 08:00:01	2025-07-08 08:35:01
4499	https://www.rbc.ru/rbcfreenews/686c680a9a7947737fb050bd	t	2025-07-08 08:00:01	2025-07-08 08:35:01
4516	https://pro.rbc.ru/demo/686765369a794720d881b945	f	2025-07-08 08:40:01	2025-07-08 08:40:01
4517	https://pro.rbc.ru/demo/686be6049a7947cf77b96d8c	f	2025-07-08 08:40:01	2025-07-08 08:40:01
4524	https://www.rbc.ru/wine/news/686bc7549a794708dc6bcd05	t	2025-07-08 08:40:01	2025-07-08 09:00:02
4518	https://www.rbc.ru/politics/08/07/2025/686c5d5f9a794748f3d2eaa5	t	2025-07-08 08:40:01	2025-07-08 09:00:02
4522	https://www.rbc.ru/politics/08/07/2025/686c822f9a79472f619a8f42	t	2025-07-08 08:40:01	2025-07-08 09:00:02
4510	https://www.rbc.ru/politics/08/07/2025/686c411e9a7947383a2c5d09	t	2025-07-08 08:40:01	2025-07-08 09:00:02
4511	https://www.rbc.ru/politics/08/07/2025/686ca8ae9a79478777f46983	t	2025-07-08 08:40:01	2025-07-08 09:00:02
4513	https://www.rbc.ru/technology_and_media/08/07/2025/686c03389a794750e20d7539	t	2025-07-08 08:40:01	2025-07-08 09:00:03
4532	https://www.rbc.ru/technology_and_media/08/07/2025/686c13ae9a794770c2e76fa8	t	2025-07-08 09:00:02	2025-07-08 09:05:02
4545	https://pro.rbc.ru/demo/686bc88c9a7947dea099373a	f	2025-07-08 09:10:03	2025-07-08 09:10:03
4549	https://www.rbc.ru/rbcfreenews/686caf469a794743c147cc6c	t	2025-07-08 09:10:03	2025-07-08 09:15:01
4610	https://pro.rbc.ru/demo/686847c09a79474d5affe434	f	2025-07-08 09:50:02	2025-07-08 09:50:02
4615	https://rt.rbc.ru/tatarstan/freenews/686bd08e9a7947a6c27173c1	f	2025-07-08 09:50:02	2025-07-08 09:50:02
4608	https://www.rbc.ru/politics/08/07/2025/686cb1ff9a7947387d28478c	t	2025-07-08 09:50:02	2025-07-08 09:55:03
4643	https://pro.rbc.ru/demo/686c0ddf9a7947663e5cf9fa	f	2025-07-08 10:10:02	2025-07-08 10:10:02
4658	https://www.rbc.ru/politics/08/07/2025/686cc2029a7947546f38ae3e	t	2025-07-08 10:20:03	2025-07-08 10:25:01
4670	https://www.rbc.ru/politics/08/07/2025/686bcfd29a794769ac334a3d	t	2025-07-08 10:30:01	2025-07-08 10:35:03
4703	https://rt.rbc.ru/tatarstan/freenews/686ccad99a79473a21767ba9	f	2025-07-08 10:50:02	2025-07-08 10:50:02
4736	https://pro.rbc.ru/demo/686bec379a79473241524205	f	2025-07-08 11:10:02	2025-07-08 11:10:02
4798	https://www.rbc.ru/politics/08/07/2025/686cc5d49a7947f691da6848	t	2025-07-08 12:00:02	2025-07-08 12:05:03
4813	https://www.rbc.ru/rbcfreenews/686cbf1c9a7947c785c811eb	t	2025-07-08 12:00:02	2025-07-08 12:05:03
4814	https://pro.rbc.ru/demo/686b735c9a794743efa3358a	f	2025-07-09 08:00:02	2025-07-09 08:00:02
4815	https://rt.rbc.ru/tatarstan/freenews/686cf6619a7947a356dddb88	f	2025-07-09 08:00:02	2025-07-09 08:00:02
4816	https://pro.rbc.ru/demo/686cb4929a794774d25cd0f7	f	2025-07-09 08:00:02	2025-07-09 08:00:02
4825	https://rt.rbc.ru/tatarstan/08/07/2025/686d216e9a79479b608a088d	f	2025-07-09 08:00:02	2025-07-09 08:00:02
4828	https://pro.rbc.ru/demo/686636b89a79477b389a0713	f	2025-07-09 08:00:02	2025-07-09 08:00:02
4829	https://www.rbc.ru/politics/08/07/2025/686d6a8d9a794782f4b74e76	t	2025-07-09 08:00:02	2025-07-09 08:05:02
4824	https://www.rbc.ru/rbcfreenews/686dcbf39a794729d7d61d8b	t	2025-07-09 08:00:02	2025-07-09 08:05:03
4826	https://www.rbc.ru/rbcfreenews/686dbaae9a7947487f1a902c	t	2025-07-09 08:00:02	2025-07-09 08:05:03
4817	https://www.rbc.ru/politics/09/07/2025/686dcd6d9a7947112f87d346	t	2025-07-09 08:00:02	2025-07-09 08:05:03
4827	https://www.rbc.ru/rbcfreenews/686d98f39a79477809d99d62	t	2025-07-09 08:00:02	2025-07-09 08:05:03
4818	https://www.rbc.ru/politics/09/07/2025/686db0519a794760701c4fe0	t	2025-07-09 08:00:02	2025-07-09 08:05:03
4819	https://www.rbc.ru/politics/09/07/2025/686daaae9a7947708cc235aa	t	2025-07-09 08:00:02	2025-07-09 08:05:04
4820	https://www.rbc.ru/politics/09/07/2025/686de0199a7947a4bd8131ae	t	2025-07-09 08:00:02	2025-07-09 08:05:04
4822	https://www.rbc.ru/politics/09/07/2025/686dc4ca9a7947aa45c6547f	t	2025-07-09 08:00:02	2025-07-09 08:05:04
4821	https://www.rbc.ru/economics/09/07/2025/686ce7189a794734011d3cc8	t	2025-07-09 08:00:02	2025-07-09 08:05:04
4834	https://pro.rbc.ru/demo/686c192b9a794759a3f649b8	f	2025-07-09 08:10:02	2025-07-09 08:10:02
4842	https://pro.rbc.ru/demo/686679ab9a794711c78aea8b	f	2025-07-09 08:10:02	2025-07-09 08:10:02
4849	https://www.rbc.ru/politics/09/07/2025/686df18b9a79478189fc42a1	t	2025-07-09 08:20:03	2025-07-09 08:25:02
4882	https://www.rbc.ru/politics/09/07/2025/686dd7219a79473f2c52eb82	t	2025-07-09 08:40:03	2025-07-09 08:45:01
4926	https://pro.rbc.ru/demo/686d40349a79474e1f48b9ee	f	2025-07-09 09:10:02	2025-07-09 09:10:02
4929	https://www.rbc.ru/technology_and_media/09/07/2025/686bf4a69a79475cf4fdb36d	t	2025-07-09 09:10:02	2025-07-09 09:15:02
5016	https://pro.rbc.ru/demo/686d39399a79475ccea688c3	f	2025-07-09 10:00:02	2025-07-09 10:00:02
5011	https://www.rbc.ru/politics/09/07/2025/686dec1a9a7947bf014254b9	t	2025-07-09 10:00:02	2025-07-09 10:05:02
5024	https://pro.rbc.ru/news/686b735c9a794743efa3358a	f	2025-07-09 10:10:01	2025-07-09 10:10:01
5057	https://www.rbc.ru/politics/09/07/2025/686e0a6f9a794762b07d5927	t	2025-07-09 10:30:03	2025-07-09 10:35:01
5072	https://pro.rbc.ru/demo/686bfd6e9a79472ca2ee661e	f	2025-07-09 10:40:03	2025-07-09 10:40:03
5083	https://www.rbc.ru/politics/09/07/2025/686e190c9a794763d4ec6eaa	t	2025-07-09 10:40:03	2025-07-09 10:45:04
5126	https://pro.rbc.ru/news/686c192b9a794759a3f649b8	f	2025-07-09 11:20:02	2025-07-09 11:20:02
5121	https://www.rbc.ru/politics/09/07/2025/686dfb689a7947863e398d9c	t	2025-07-09 11:20:02	2025-07-09 11:25:02
5172	https://www.rbc.ru/technology_and_media/09/07/2025/686e1aa99a79473b8bdada08	t	2025-07-09 12:40:01	2025-07-09 12:45:02
5174	https://www.rbc.ru/politics/09/07/2025/686e23659a794770e8669439	t	2025-07-09 12:40:01	2025-07-09 12:45:02
5166	https://www.rbc.ru/politics/09/07/2025/686e32039a7947195fddf90c	t	2025-07-09 12:40:01	2025-07-09 12:45:03
5169	https://www.rbc.ru/politics/09/07/2025/6818a4299a7947c95c5df670	t	2025-07-09 12:40:01	2025-07-09 12:45:03
5176	https://pro.rbc.ru/demo/686cd0e09a79475b900114ba	f	2025-07-09 12:40:01	2025-07-09 12:40:01
5179	https://www.rbc.ru/rbcfreenews/686e20f69a7947e38f2ce4c7	t	2025-07-09 12:40:01	2025-07-09 12:45:02
5170	https://www.rbc.ru/quote/news/article/686e22fb9a794769af60429f	t	2025-07-09 12:40:01	2025-07-09 12:45:02
5185	https://www.rbc.ru/politics/09/07/2025/686e314d9a7947bf7cd87c14	t	2025-07-09 13:00:02	2025-07-09 13:05:02
5195	https://www.rbc.ru/politics/09/07/2025/686e10c29a79477ca2cb7e40	t	2025-07-09 13:00:02	2025-07-09 13:05:02
5203	https://pro.rbc.ru/demo/686788eb9a79477ad97d0341	f	2025-07-09 13:10:03	2025-07-09 13:10:03
5204	https://www.rbc.ru/economics/09/07/2025/686cdd079a7947615353e51e	t	2025-07-09 13:10:03	2025-07-09 13:15:01
5219	https://pro.rbc.ru/news/686788eb9a79477ad97d0341	f	2025-07-09 13:20:03	2025-07-09 13:20:03
5268	https://pro.rbc.ru/news/682330099a7947b750bff062	f	2025-07-09 13:50:02	2025-07-09 13:50:02
5284	https://pro.rbc.ru/demo/682330099a7947b750bff062	f	2025-07-09 14:00:03	2025-07-09 14:00:03
5299	https://www.rbc.ru/rbcfreenews/686e401c9a79472be8b37f01	t	2025-07-09 14:10:03	2025-07-09 14:15:02
5313	https://www.rbc.ru/society/09/07/2025/686e4e9e9a79470e09f54e1f	t	2025-07-09 14:20:03	2025-07-09 14:25:03
5315	https://www.rbc.ru/politics/09/07/2025/686e37c69a794710242b3426	t	2025-07-09 14:20:03	2025-07-09 14:25:03
5326	https://www.rbc.ru/rbcfreenews/686e4c8f9a79477a0cc6425e	t	2025-07-09 14:30:02	2025-07-09 14:35:01
5357	https://www.rbc.ru/sport/09/07/2025/686e4c489a7947b012970cb4	t	2025-07-09 14:40:02	2025-07-09 14:45:02
5361	https://www.rbc.ru/rbcfreenews/686e49069a7947a9de6fd290	t	2025-07-09 14:50:02	2025-07-09 14:55:04
5393	https://www.rbc.ru/politics/09/07/2025/686e44dd9a7947b874a19896	t	2025-07-09 15:10:03	2025-07-09 15:15:03
5411	https://www.rbc.ru/society/09/07/2025/686e54e09a79478a5a0eb61f	t	2025-07-09 15:20:01	2025-07-09 15:25:03
5452	https://pro.rbc.ru/demo/685e63c69a7947d051606058	f	2025-07-09 15:40:01	2025-07-09 15:40:01
5470	https://www.rbc.ru/politics/09/07/2025/686e36599a79476ff8e7352c	t	2025-07-09 16:00:02	2025-07-09 16:05:00
5473	https://www.rbc.ru/society/09/07/2025/686e5d509a794774d4756191	t	2025-07-09 16:00:02	2025-07-09 16:05:01
5523	https://www.rbc.ru/politics/09/07/2025/686e57d39a79473156906e17	t	2025-07-09 16:30:00	2025-07-09 16:35:00
5548	https://pro.rbc.ru/demo/6864d7ee9a79474bb27ad567	f	2025-07-09 16:40:01	2025-07-09 16:40:01
5534	https://www.rbc.ru/politics/09/07/2025/686e6cb29a7947f40f0ca83d	t	2025-07-09 16:40:01	2025-07-09 16:45:02
5564	https://pro.rbc.ru/news/6864d7ee9a79474bb27ad567	f	2025-07-09 16:50:00	2025-07-09 16:50:00
5583	https://pro.rbc.ru/demo/686e46dc9a79470413259a66	f	2025-07-10 08:00:03	2025-07-10 08:00:03
5585	https://pro.rbc.ru/demo/686e15b49a7947fea104efaf	f	2025-07-10 08:00:03	2025-07-10 08:00:03
5587	https://rt.rbc.ru/tatarstan/freenews/686e6bb29a79474fcbc39000	f	2025-07-10 08:00:03	2025-07-10 08:00:03
5589	https://pro.rbc.ru/demo/686e470d9a794749f2b63f14	f	2025-07-10 08:00:03	2025-07-10 08:00:03
5597	https://pro.rbc.ru/demo/6867c28d9a79478c4fce19a6	f	2025-07-10 08:00:03	2025-07-10 08:00:03
5596	https://www.rbc.ru/politics/10/07/2025/686ee7b99a7947dd39f56513	t	2025-07-10 08:00:03	2025-07-10 08:05:02
5593	https://www.rbc.ru/politics/09/07/2025/686ecc7b9a79477bf90d8d47	t	2025-07-10 08:00:03	2025-07-10 08:05:02
5594	https://www.rbc.ru/sport/10/07/2025/686ed98f9a7947ec95f67c07	t	2025-07-10 08:00:03	2025-07-10 08:05:02
5595	https://www.rbc.ru/politics/09/07/2025/686eaf4a9a7947f2c24f02fe	t	2025-07-10 08:00:03	2025-07-10 08:05:03
5582	https://www.rbc.ru/politics/10/07/2025/686f05539a794778cd14a170	t	2025-07-10 08:00:03	2025-07-10 08:05:03
5584	https://www.rbc.ru/rbcfreenews/686f14429a794739f1c5a4b3	t	2025-07-10 08:00:03	2025-07-10 08:05:03
5586	https://www.rbc.ru/politics/10/07/2025/686eed349a79474d08b7180f	t	2025-07-10 08:00:03	2025-07-10 08:05:04
5590	https://www.rbc.ru/finances/10/07/2025/686e6fe59a79478626c74311	t	2025-07-10 08:00:03	2025-07-10 08:05:04
5588	https://www.rbc.ru/technology_and_media/10/07/2025/686e83cd9a79471088dc358b	t	2025-07-10 08:00:03	2025-07-10 08:05:04
5591	https://www.rbc.ru/politics/10/07/2025/686eea7a9a79474f5310b78d	t	2025-07-10 08:00:03	2025-07-10 08:05:04
5599	https://pro.rbc.ru/demo/686e93bb9a7947571a12c8d4	f	2025-07-10 08:10:02	2025-07-10 08:10:02
5671	https://www.rbc.ru/politics/10/07/2025/686f509b9a7947a09c8171ce	t	2025-07-10 08:50:01	2025-07-10 08:55:03
5701	https://pro.rbc.ru/demo/686e70d69a79471ba68c8d6a	f	2025-07-10 09:10:02	2025-07-10 09:10:02
5698	https://www.rbc.ru/politics/10/07/2025/686f54df9a7947302212b2ae	t	2025-07-10 09:10:02	2025-07-10 09:15:03
5702	https://www.rbc.ru/politics/10/07/2025/686f49eb9a7947cf824f422a	t	2025-07-10 09:10:02	2025-07-10 09:15:03
5774	https://www.rbc.ru/politics/10/07/2025/686f27b89a79478b63c85aef	t	2025-07-10 10:00:03	2025-07-10 10:05:02
5779	https://www.rbc.ru/politics/10/07/2025/686f61899a79474473d2d0a3	t	2025-07-10 10:00:03	2025-07-10 10:05:03
5782	https://www.rbc.ru/quote/news/article/686e3eed9a794718cd2da8c3	t	2025-07-10 10:00:03	2025-07-10 10:05:03
5854	https://www.rbc.ru/politics/10/07/2025/686f6b189a794720d0418019	t	2025-07-10 10:50:02	2025-07-10 10:55:02
5909	https://www.rbc.ru/politics/10/07/2025/686f71fd9a794753c79ffeb8	t	2025-07-10 11:20:01	2025-07-10 11:25:03
5904	https://www.rbc.ru/business/10/07/2025/686e7f4c9a79477dcbce7a4f	t	2025-07-10 11:20:01	2025-07-10 11:25:03
5958	https://www.rbc.ru/photoreport/10/07/2025/686f66b29a794720f4659aee	t	2025-07-10 11:50:01	2025-07-10 11:55:03
5978	https://pro.rbc.ru/demo/686e46f59a7947487582a3bb	f	2025-07-10 12:40:03	2025-07-10 12:40:03
5966	https://www.rbc.ru/politics/10/07/2025/686f5f039a794759f290da2a	t	2025-07-10 12:40:03	2025-07-10 12:45:01
5968	https://www.rbc.ru/sport/10/07/2025/686f89239a79471857b10f9c	t	2025-07-10 12:40:03	2025-07-10 12:45:01
5985	https://rt.rbc.ru/tatarstan/freenews/686f7c7b9a7947f891d58381	f	2025-07-10 12:50:01	2025-07-10 12:50:01
6018	https://www.rbc.ru/politics/10/07/2025/686f84e89a7947191525aed9	t	2025-07-10 13:10:01	2025-07-10 13:15:02
6036	https://pro.rbc.ru/news/686e93bb9a7947571a12c8d4	f	2025-07-10 13:20:03	2025-07-10 13:20:03
6029	https://www.rbc.ru/politics/10/07/2025/686f5e1d9a7947e307683d51	t	2025-07-10 13:20:03	2025-07-10 13:25:04
6056	https://www.rbc.ru/wine/news/686f76819a794781fd986ead	t	2025-07-10 13:30:02	2025-07-10 13:35:02
6071	https://www.rbc.ru/politics/10/07/2025/686f93a79a79476f5c4846d7	t	2025-07-10 13:40:03	2025-07-10 13:45:02
6077	https://www.rbc.ru/politics/10/07/2025/686f88ca9a79474d17f72545	t	2025-07-10 13:50:04	2025-07-10 13:55:02
6085	https://www.rbc.ru/society/10/07/2025/686f949f9a7947caf27e9a5e	t	2025-07-10 13:50:04	2025-07-10 13:55:02
6186	https://pro.rbc.ru/demo/6867abeb9a79479882be4bd4	f	2025-07-10 14:50:01	2025-07-10 14:50:01
6187	https://www.rbc.ru/politics/10/07/2025/686f968f9a79477471e5405f	t	2025-07-10 14:50:01	2025-07-10 14:55:04
6196	https://www.rbc.ru/politics/10/07/2025/686f9ff89a79474439050faf	t	2025-07-10 15:00:02	2025-07-10 15:05:03
6189	https://www.rbc.ru/politics/10/07/2025/686faa149a7947bc424e31b1	t	2025-07-10 15:00:02	2025-07-10 15:05:02
6251	https://www.rbc.ru/politics/03/07/2025/67ff92b19a79475286999dfe	t	2025-07-10 15:30:02	2025-07-10 15:35:03
6259	https://pro.rbc.ru/demo/686bbdf19a79475c510e7145	f	2025-07-10 15:40:02	2025-07-10 15:40:02
6327	https://pro.rbc.ru/demo/68663e319a79471ceabe2092	f	2025-07-10 16:20:03	2025-07-10 16:20:03
6317	https://www.rbc.ru/rbcfreenews/686fb7279a7947702d76ebe8	t	2025-07-10 16:20:03	2025-07-10 16:25:03
6324	https://www.rbc.ru/technology_and_media/10/07/2025/686fb9f69a7947478aa1b5ef	t	2025-07-10 16:20:03	2025-07-10 16:25:04
6328	https://www.rbc.ru/politics/10/07/2025/686f919e9a7947c1e6f6690c	t	2025-07-10 16:20:03	2025-07-10 16:25:04
6370	https://www.rbc.ru/politics/10/07/2025/686fa48b9a79470b75c35aa9	t	2025-07-10 16:50:03	2025-07-10 16:55:01
6388	https://rbcrealty.ru/news/686f88f19a7947b01dd3ded5	f	2025-07-10 17:00:02	2025-07-10 17:00:02
6383	https://www.rbc.ru/rbcfreenews/686fc3089a7947063235362c	t	2025-07-10 17:00:02	2025-07-10 17:05:02
6386	https://www.rbc.ru/sport/10/07/2025/686fc2609a7947456483c2d1	t	2025-07-10 17:00:02	2025-07-10 17:05:03
6398	https://pro.rbc.ru/demo/686fd5009a79471da18cd2ac	f	2025-07-11 08:00:02	2025-07-11 08:00:02
6404	https://pro.rbc.ru/demo/686fa1219a7947636245e2e7	f	2025-07-11 08:00:02	2025-07-11 08:00:02
6409	https://pro.rbc.ru/demo/68678d569a79473d2dcc80f8	f	2025-07-11 08:00:02	2025-07-11 08:00:02
6411	https://pro.rbc.ru/demo/686e59f39a79477b92d29332	f	2025-07-11 08:00:02	2025-07-11 08:00:02
6412	https://www.rbc.ru/rbcfreenews/687044969a79473528fd739c	t	2025-07-11 08:00:02	2025-07-11 08:05:03
6408	https://www.rbc.ru/society/11/07/2025/6870448e9a7947df05699fb2	t	2025-07-11 08:00:02	2025-07-11 08:05:04
6410	https://www.rbc.ru/politics/11/07/2025/687084ef9a79472aee60e526	t	2025-07-11 08:00:02	2025-07-11 08:05:04
6397	https://www.rbc.ru/rbcfreenews/68708a2b9a7947d1b83e9f18	t	2025-07-11 08:00:02	2025-07-11 08:05:04
6400	https://www.rbc.ru/technology_and_media/11/07/2025/686fba269a79473f48745ff1	t	2025-07-11 08:00:02	2025-07-11 08:05:05
6399	https://www.rbc.ru/rbcfreenews/68708d0a9a7947c47c684a60	t	2025-07-11 08:00:02	2025-07-11 08:05:05
6405	https://www.rbc.ru/politics/11/07/2025/68703bcc9a79471b1abf2c62	t	2025-07-11 08:00:02	2025-07-11 08:05:05
6403	https://www.rbc.ru/politics/10/07/2025/686ff8e79a79477e888f9fdf	t	2025-07-11 08:00:02	2025-07-11 08:05:05
6415	https://www.rbc.ru/business/11/07/2025/686fe57c9a7947528df90599	t	2025-07-11 08:10:02	2025-07-11 08:15:01
6419	https://www.rbc.ru/politics/10/07/2025/687006af9a79478277ac0431	t	2025-07-11 08:10:02	2025-07-11 08:15:01
6424	https://www.rbc.ru/politics/10/07/2025/687001909a7947733f8c6af5	t	2025-07-11 08:10:02	2025-07-11 08:15:01
6445	https://www.rbc.ru/politics/11/07/2025/68709e239a79473b8bfcc675	t	2025-07-11 08:30:02	2025-07-11 08:35:02
6447	https://www.rbc.ru/politics/11/07/2025/68709f949a7947757c8dff71	t	2025-07-11 08:30:02	2025-07-11 08:35:02
6468	https://www.rbc.ru/rbcfreenews/687081909a7947fc18b35c5d	t	2025-07-11 08:40:01	2025-07-11 08:45:02
6494	https://pro.rbc.ru/demo/686e4aa29a79474f86015dc3	f	2025-07-11 09:40:03	2025-07-11 09:40:03
6495	https://www.rbc.ru/politics/11/07/2025/6870abc79a7947edf722dc9a	t	2025-07-11 09:40:03	2025-07-11 09:45:01
6499	https://www.rbc.ru/quote/news/article/6870a8ed9a79473fb75a0196	t	2025-07-11 09:40:03	2025-07-11 09:45:01
6501	https://www.rbc.ru/politics/11/07/2025/68709bfd9a79474803ab59f5	t	2025-07-11 09:40:03	2025-07-11 09:45:02
6504	https://www.rbc.ru/politics/11/07/2025/68705b0f9a79479c9e506772	t	2025-07-11 09:40:03	2025-07-11 09:45:02
6514	https://www.rbc.ru/business/11/07/2025/6870267b9a794779570ded29	t	2025-07-11 09:50:01	2025-07-11 09:55:02
6529	https://rt.rbc.ru/tatarstan/11/07/2025/686f73d59a79479b7eb0e327	f	2025-07-11 10:00:03	2025-07-11 10:00:03
6575	https://www.rbc.ru/rbcfreenews/6870aa299a794756fb3b5494	t	2025-07-11 10:30:01	2025-07-11 10:35:01
6581	https://www.rbc.ru/rbcfreenews/68709e359a79474803ab5a06	t	2025-07-11 10:30:01	2025-07-11 10:35:01
6618	https://www.rbc.ru/quote/news/article/686cf3309a79477d12d26033	t	2025-07-11 10:50:03	2025-07-11 10:55:01
6621	https://www.rbc.ru/society/11/07/2025/686fdb6b9a79471e42a5c512	t	2025-07-11 11:00:01	2025-07-11 11:05:02
6639	https://pro.rbc.ru/demo/686f84db9a7947a99096f0d5	f	2025-07-11 11:10:03	2025-07-11 11:10:03
6642	https://www.rbc.ru/rbcfreenews/6870bf469a794776243f203d	t	2025-07-11 11:10:03	2025-07-11 11:15:01
6672	https://www.rbc.ru/society/11/07/2025/6870a6959a794756ec6d205b	t	2025-07-11 11:30:02	2025-07-11 11:35:01
6687	https://pro.rbc.ru/demo/687000af9a794757df7f9cdd	f	2025-07-11 12:30:01	2025-07-11 12:30:01
6691	https://pro.rbc.ru/demo/686fb8109a7947d165c2039f	f	2025-07-11 12:30:01	2025-07-11 12:30:01
6694	https://rt.rbc.ru/tatarstan/freenews/6870c5e19a7947029b8f5a2f	f	2025-07-11 12:30:01	2025-07-11 12:30:01
6688	https://www.rbc.ru/politics/11/07/2025/6870d4a69a794773106887e2	t	2025-07-11 12:30:01	2025-07-11 12:35:02
6693	https://www.rbc.ru/politics/11/07/2025/6870abac9a794767b9738b44	t	2025-07-11 12:30:01	2025-07-11 12:35:02
6695	https://www.rbc.ru/quote/news/article/6870c4a29a7947654b04c478	t	2025-07-11 12:30:01	2025-07-11 12:35:03
6685	https://www.rbc.ru/politics/11/07/2025/6870bf439a794726984c6aea	t	2025-07-11 12:30:01	2025-07-11 12:35:03
6710	https://rt.rbc.ru/tatarstan/freenews/6870d7e39a7947621da37c02	f	2025-07-11 12:40:01	2025-07-11 12:40:01
6717	https://www.rbc.ru/politics/11/07/2025/6870d0979a79478ceb01603e	t	2025-07-11 12:50:04	2025-07-11 12:55:02
6735	https://www.rbc.ru/politics/11/07/2025/6870dd929a7947630ee37030	t	2025-07-11 13:00:02	2025-07-11 13:05:03
6739	https://www.rbc.ru/politics/11/07/2025/6870d9179a79474a2c2be9fd	t	2025-07-11 13:00:02	2025-07-11 13:05:03
6775	https://www.rbc.ru/sport/11/07/2025/6870ddc39a79471d9d95bfac	t	2025-07-11 13:20:03	2025-07-11 13:25:03
6787	https://www.rbc.ru/politics/11/07/2025/6870cfec9a79474bb174f755	t	2025-07-11 13:30:02	2025-07-11 13:35:04
6828	https://www.rbc.ru/rbcfreenews/6870d4fb9a7947786fe40844	t	2025-07-11 13:50:02	2025-07-11 13:55:03
6895	https://www.rbc.ru/politics/11/07/2025/6870e9179a7947e7a0b8659f	t	2025-07-11 14:40:03	2025-07-11 14:45:01
6903	https://www.rbc.ru/rbcfreenews/6870e8709a79471f8cb943f6	t	2025-07-11 14:40:03	2025-07-11 14:45:01
6936	https://pro.rbc.ru/demo/686cbf669a79474f7d3cf21e	f	2025-07-11 15:00:01	2025-07-11 15:00:01
6930	https://www.rbc.ru/society/11/07/2025/6870f0639a79477390b6144d	t	2025-07-11 15:00:01	2025-07-11 15:05:02
6969	https://www.rbc.ru/politics/11/07/2025/6870deee9a7947200229ddcc	t	2025-07-11 15:20:01	2025-07-11 15:35:02
6987	https://pro.rbc.ru/news/686fd0589a7947868f89f707	f	2025-07-11 15:40:03	2025-07-11 15:40:03
7003	https://pro.rbc.ru/demo/686fd0589a7947868f89f707	f	2025-07-11 15:50:02	2025-07-11 15:50:02
7032	https://pro.rbc.ru/demo/686f91ad9a7947f740cb5765	f	2025-07-11 16:10:03	2025-07-11 16:10:03
7026	https://www.rbc.ru/society/11/07/2025/6870f0939a7947216bb94463	t	2025-07-11 16:10:03	2025-07-11 16:15:02
7023	https://www.rbc.ru/politics/11/07/2025/687107b59a79473e9e6fc1d5	t	2025-07-11 16:10:03	2025-07-11 16:15:02
7033	https://www.rbc.ru/business/11/07/2025/686fccd69a7947350ccd8965	t	2025-07-11 16:10:03	2025-07-11 16:15:03
7037	https://www.rbc.ru/politics/11/07/2025/6870eaa49a7947110952191c	t	2025-07-11 16:20:01	2025-07-11 16:25:01
7063	https://www.rbc.ru/politics/11/07/2025/6870f7c59a794728c6f3c193	t	2025-07-11 16:30:03	2025-07-11 16:35:02
7074	https://www.rbc.ru/politics/11/07/2025/68710a819a79473d01a24c2f	t	2025-07-11 16:40:04	2025-07-11 16:45:01
7091	https://pro.rbc.ru/demo/6864c63d9a7947336f0985ff	f	2025-07-11 16:50:02	2025-07-11 16:50:02
7090	https://www.rbc.ru/politics/11/07/2025/68710bef9a79474dee22660e	t	2025-07-11 16:50:02	2025-07-11 16:55:03
7106	https://www.rbc.ru/quote/news/article/686bb3df9a79475ee5521c21	t	2025-07-11 17:00:03	2025-07-11 17:05:02
7118	https://pro.rbc.ru/demo/686f68709a7947164f610c92	f	2025-07-14 07:50:03	2025-07-14 07:50:03
7128	https://pro.rbc.ru/demo/686e258b9a794714ae31e11a	f	2025-07-14 07:50:03	2025-07-14 07:50:03
7131	https://pro.rbc.ru/books/686685689a79477393979a7d	f	2025-07-14 07:50:03	2025-07-14 07:50:03
7132	https://www.rbc.ru/sport/13/07/2025/6873f5fb9a794784170e3efe	t	2025-07-14 07:50:03	2025-07-14 07:55:01
7127	https://www.rbc.ru/quote/news/article/686f90339a7947d38044484a	t	2025-07-14 07:50:03	2025-07-14 07:55:02
7130	https://www.rbc.ru/politics/14/07/2025/68745efc9a7947be651086b7	t	2025-07-14 07:50:03	2025-07-14 07:55:02
7117	https://www.rbc.ru/rbcfreenews/6873ed039a794783a856d46d	t	2025-07-14 07:50:03	2025-07-14 07:55:02
7129	https://www.rbc.ru/politics/14/07/2025/687445479a79472f836ebff1	t	2025-07-14 07:50:03	2025-07-14 07:55:03
7119	https://www.rbc.ru/society/14/07/2025/68741dd69a79478671286d43	t	2025-07-14 07:50:03	2025-07-14 07:55:03
7120	https://www.rbc.ru/economics/14/07/2025/687435799a794719c778e4a2	t	2025-07-14 07:50:03	2025-07-14 07:55:03
7122	https://www.rbc.ru/wine/news/686f43409a794761aa5567c0	t	2025-07-14 07:50:03	2025-07-14 07:55:03
7123	https://www.rbc.ru/politics/13/07/2025/68740fb19a79479fa02f6e14	t	2025-07-14 07:50:03	2025-07-14 07:55:04
7125	https://www.rbc.ru/sport/14/07/2025/6873f7019a7947e1a33a1779	t	2025-07-14 07:50:03	2025-07-14 07:55:04
7134	https://www.rbc.ru/politics/14/07/2025/68748d5c9a794714ae354cc3	f	2025-07-14 08:00:02	2025-07-14 08:00:02
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: rbc-news
--

COPY public.news (id, page_link_id, slug, title, image, text, rating, deleted_at, created_at, updated_at) FROM stdin;
1	1	rossiya-nachala-sravnivat-rossiyskiy-i-francuzskiy-dvigateli-dlya-ssj-100	«Россия» начала сравнивать российский и французский двигатели для SSJ-100	https://s0.rbk.ru/v6_top_pics/media/img/9/89/347513013926899.jpeg	Авиакомпания «Россия» начала сравнивать технические и экономические характеристики эксплуатации зарубежного двигателя SaM146 и полностью российского ПД-8 для SSJ-100. От итогов анализа зависит перспектива ремоторизации парка Двигатель ПД-8 (Фото: Кирилл Кухмарь / ТАСС) Авиакомпания «Россия» (входит в группу «Аэрофлот») начала сравнивать стоимость эксплуатации российского двигателя ПД-8 и SaM146, рассказал в интервью РБК гендиректор перевозчика Ян Бург. По итогам сравнения параметров силовых установок эксплуатант примет решение о целесообразности закупки отечественных моторов для их установки на находящиеся в парке авиакомпании самолеты. «Сегодня «Россия» сравнивает теоретическую стоимость эксплуатации ПД-8 и SaM146. Она складывается из топливной эффективности, стоимости поддержания летной годности, стоимости запасных частей, стоимости подменных двигателей, когда основной уходит на ремонт, продолжительности этого ремонта и многого другого. Эксплуатант рассчитывает получить ответы на эти вопросы к концу года», — сказал он. В парке авиакомпании «Россия» сегодня 78 самолетов SSJ-100 российской разработки. На данный момент это крупнейший в мире эксплуатант воздушных судов этого типа. Стартовым заказчиком этих судов выступал головной «Аэрофлот», но в 2021 году руководство головной компании приняло решение передать все SSJ-100 в дочернюю компанию, которая займется в том числе развитием региональных хабов группы в Красноярске и Сочи, тогда как головная компания сосредоточится на магистральных авиаперевозках из базового аэропорта Шереметьево. rbc.group Производитель SJ-100 поддержал идею приоритета для самолетов из России Бизнес rbc.group SSJ-100 разрабатывался до введения странами Запада санкций в 2022 году, самолет стал продуктом международной кооперации: значительная часть его комплектующих поставлялась из зарубежных стран. Он оснащался франко-российским двигателем SaM146, который не используется больше ни на одном типе воздушных судов. Горячую часть (газогенератор для компрессора высокого давления, камеры сгорания, турбины высокого давления) силовой установки поставляла французская Snecma, холодную (вентилятор и турбина низкого давления) поставляло НПО «Сатурн» (Рыбинск, входит в Объединенную двигателестроительную корпорацию Ростеха). Двигатель вызывал нарекания эксплуатантов и лизингодателей, после 2–4 тыс. часов полета в камерах сгорания или маслосборниках появлялись трещины, после чего двигатель отправлялся на ремонт, тогда как производитель гарантировал 7,5–8 тыс. часов гарантированного налета до первого капитального ремонта. Ремонт длился около двух месяцев и стоил $2–5 млн. После введения санкций в 2022 году прямые поставки комплектующих из Франции прекратились. ОДК начала разработку двигателя ПД-8 в 2019 году, предполагалось, что ими можно будет оснащать SSJ-100 и самолет-амфибию Бе-200. Директивная цена разрабатываемого двигателя (установлена правительством РФ) оценивается в 1 млрд руб. В марте 2025 года «Ростех» сообщал о первом полете импортозамещенного самолета SJ-100 с российскими ПД-8, что стало началом его летных испытаний. Поставки первых SJ-100 должны начаться в 2026 году. Ян Бург говорит, что «Россия» вместе с ОДК пытаются сформировать приблизительную модель эксплуатации ПД-8, определить ее параметры, в том числе финансовые. «Когда двигатель разрабатывается, его создатели используют гипотезы о ресурсе его комплектующих и других параметрах. Заложенные в конструкцию решения должны обеспечить достижение этих параметров. Никогда двигатель с завода не выходит сразу с полным ресурсом. Например, если в модель заложено целевое значение ресурса 20 тыс. циклов, первый двигатель, скорее всего, будет выпущен с ресурсом 500 циклов. Двигатели, которые проходят испытания и не идут в коммерческую эксплуатацию, нарабатывают часы и циклы, потом их разбирают или иными методами определяют, как ведут себя детали. Также оцениваются результаты эксплуатации двигателей, находящихся в коммерческой эксплуатации, и нередко по результатам этой оценки уже в эксплуатации выполняются доработки», — отметил топ-менеджер. Читайте РБК в Telegram. 	6	\N	2025-07-01 10:17:13	2025-07-01 10:17:13
2	2	odno-iz-predpriyatiy-izhevska-popalo-pod-udar-drona	Одно из предприятий Ижевска попало под удар дрона	https://s0.rbk.ru/v6_top_pics/media/img/1/93/347513541132931.jpeg	В Ижевске одно из предприятий попало под атаку дронов, сообщил глава Удмуртии Бречалов. Незадолго до этого в аэропорту города ввели ограничения на полеты Фото: Сергей Булкин / NEWS.ru / РБК Одно из предприятий Ижевска подверглось атаке беспилотников, сообщил глава Удмуртии Александр Бречалов в телеграм-канале. «Все оперативные службы выехали на место», — написал он. Незадолго до этого в Удмуртии объявили режим опасности атаки дронов, а аэропорт Ижевска приостановил полеты. Позже Бречалов сообщил, что в результате произошедшего есть пострадавшие, им оказывают медицинскую помощь. «Пожарные сейчас устраняют очаги возгорания», — добавил он. Video rbc.group Три лайнера ушли на запасные аэродромы из-за ограничений в Ижевске Политика Ижевск уже попадал под атаку дронов. В ноябре прошлого года в заводском цехе произошел взрыв из-за падения беспилотника. Пострадал один человек. Его госпитализировали с травмой головы средней степени тяжести. Персонал эвакуировали. Это был первый случай, когда власти сообщили о падении беспилотника в Удмуртии с начала военной операции на Украине. Читайте РБК в Telegram.	10	\N	2025-07-01 10:17:14	2025-07-01 10:17:14
3	7	posol-azerbaydzhana-pribyl-v-mid-iz-za-zaderzhaniya-rossiyskih-zhurnalistov	Посол Азербайджана прибыл в МИД из-за задержания российских журналистов	https://s0.rbk.ru/v6_top_pics/media/img/2/83/347513536525832.jpeg	Азербайджанский посол был вызван после визита силовиков в офис редакции «Sputnik Азербайджан» в Баку, а также задержания двух человек. Перед этим МИД Азербайджана вызвал российского представителя из-за задержаний в Екатеринбурге Рахман Мустафаев (Фото: Алексей Майшев / РИА Новости) В МИД России прибыл вызванный посол Азербайджана Рахман Мустафаев, передает ТАСС. Он не дал комментариев журналистам. Мустафаева вызвали в связи с недружественными действиями властей Азербайджана и из-за задержания российских журналистов, «к которым все эти годы у властей Азербайджана не было никаких претензий», пояснил МИД накануне. Азербайджанская полиция 30 июня пришла в редакцию издания Sputnik (входит в российский медиахолдинг «Россия сегодня») в Баку. В полиции сообщили, что проводят операцию в офисе издания. Тогда несколько азербайджанских СМИ, в том числе Vesti.az, APA и Minval, со ссылкой на источники написали, что были задержаны два сотрудника «Sputnik Азербайджан» — агенты ФСБ России под прикрытием. rbc.group В чем причина обострения между Россией и Азербайджаном Политика rbc.group На прошлых выходных МИД Азербайджана вызвал временного поверенного в делах России в Баку Петра Волоковых в связи с задержанием группы азербайджанцев в Екатеринбурге и смертью двух подозреваемых. Задержания проводились в рамках расследования уголовных дел по факту «тяжких преступлений», пояснил российский МИД. Кремль отметил, что действия правоохранительных органов быть поводом для дипломатических демаршей не могут. Силовики в Екатеринбурге задержали более 50 уроженцев Азербайджана, сообщали Ura.ru и E1.ru. Задержания связаны с нераскрытым уголовным делом об убийстве торговца, заведенным в 2001-м. По данным E1.ru, основные подозреваемые — братья Сафаровы, владельцы кафе «Каспий». Им стало плохо после визита силовиков, один из них умер. Читайте РБК в Telegram.	6	\N	2025-07-01 10:17:14	2025-07-01 10:17:14
4	3	tramp-predlozhil-nachat-proverku-raboty-ilona-maska	Трамп предложил начать проверку работы Илона Маска	https://s0.rbk.ru/v6_top_pics/media/img/6/03/347513514414036.jpeg	Трамп счел, что без субсидий Маску пришлось бы «свернуть лавочку» и вернуться в ЮАР, а США сэкономили бы «кучу денег». Он предложил DOGE обратить на это внимание. Маск вновь раскритиковал «большой прекрасный билль» Трампа Илон Маск и Дональд Трамп (Фото: Nathan Howard / Reuters) Президент США Дональд Трамп заявил, что основателю SpaceX и Tesla Илон Маск без субсидий, вероятно, пришлось бы свернуть бизнес и вернуться в ЮАР, а Вашингтон сэкономил бы «кучу денег». Об этом глава Белого дома написал в своей соцсети Truth Social. Маск — богатейший человек в мире (Bloomberg оценивает его состояние в $363 млрд) и один из главных спонсоров президентской кампании Трампа. Родился и вырос в ЮАР, в 17 лет уехал оттуда учиться сначала в Канаду, а затем и в США, где позже сосредоточился на бизнесе. Неоднократно критиковал власти ЮАР и обвинял в «геноциде белых». «Илон, возможно, получает больше субсидий, чем любой человек в истории, и без субсидий Илону, вероятно, пришлось бы свернуть лавочку и вернуться домой в Южную Африку. Больше никаких запусков ракет, спутников или производства электромобилей, и наша страна сэкономила бы КУЧУ ДЕНЕГ. Может быть, DOGE следовало бы хорошенько, пристально взглянуть на это? БОЛЬШИЕ ДЕНЬГИ, КОТОРЫЕ НУЖНО СЭКОНОМИТЬ!» — написал президент США. rbc.group DOGE — Департамент эффективности правительства, который Маск курировал с момента появления после инаугурации Трампа и до конца мая. После ухода из правительства между бизнесменом и президентом произошел заочный конфликт из-за критики Маском законопроекта Трампа о налоговых льготах, который республиканец называет «Один большой прекрасный билль». rbc.group По данным Bloomberg, Маск просил, чтобы в этом законопроекте сохранились субсидии для электромобилей в размере $7,5 тыс., которыми пользуется Tesla, и налоговые льготы на возобновляемую энергию. После того как ему не удалось этого добиться, бизнесмен призвал: «Kill the bill». Трамп назвал Маска «замечательным парнем», который «немного огорчен» Политика Трамп в ходе заочной перепалки заявлял, что самым простым способом сэкономить бюджет США было бы прекратить государственные субсидии и контракты компаний Маска. После этого основатель SpaceX объявил о выводе космического корабля Dragon из эксплуатации, но вскоре отказался от этого. Затем Маск извинился за свои высказывания о президенте. На фоне предстоящего голосования по документу в сенате (верхняя палата конгресса; палата представителей уже одобрила проект) Маск пригрозил в случае его принятия создать новую политическую партию «Америка». Трамп подчеркнул, что бизнесмен еще до того, как поддержал баллотировавшегося на пост президента республиканца, был в курсе его позиции по поводу электромобилей. «Это абсурд, и это всегда было важной частью моей кампании. Электромобили — это хорошо, но не все должны быть вынуждены владеть одним из них», — считает глава Белого дома. По подсчетам бюджетного офиса конгресса, законопроект One Big Beautiful Bill Act предусматривает сокращение налогов и расходов примерно на $5,3 трлн. Он увеличит дефицит бюджета до 7% ВВП к 2026 году и раздует госдолг со 100 до 124% ВВП к 2034-му. One Big Beautiful Bill Act предполагает сокращение налогов примерно на $3,75 трлн за счет продления налоговых послаблений, которые Трамп ввел в свой первый срок в 2017 году, и новых — в частности, отмены налогов на чаевые. Потеря доходов будет частично компенсирована сокращением федеральных расходов на другие нужды почти на $1,3 трлн — в частности, за счет Medicaid и продовольственной помощи. Это оставит без медицинской страховки 10,9 млн человек, отмечало Associated Press. Читайте РБК в Telegram.	9	\N	2025-07-01 10:17:14	2025-07-01 10:17:14
5	11	britanskie-monarhi-perestanut-ispolzovat-korolevskiy-poezd	Британские монархи перестанут использовать королевский поезд		Королевский поезд, на котором передвигались монархи Великобритании, будет выведен из эксплуатации к 2027 году ради сокращения расходов. Король Карл III и другие члены королевской семьи продолжат пользоваться обычными пассажирскими поездами и вертолетами, говорится в сообщении Букингемского дворца. Железнодорожный состав использовался со времен королевы Виктории — прапрапрабабушки короля Карла III. Она заказала первые вагоны в 1869 году. Сейчас поезд состоит из девяти вагонов, последний из которых был добавлен к составу в 1986 году. За 2024 год королевский поезд был использован только два раза, а общая стоимость поездок составила 80 тыс. фунтов стерлингов (около 8,5 млн руб.). «Королевский поезд был частью национальной жизни на протяжении многих десятилетий. Однако, двигаясь вперед, мы не должны быть связаны прошлым. Пришло время попрощаться самым теплым образом, поскольку мы стремимся быть дисциплинированными и ориентированными на будущее при распределении финансирования», — прокомментировал хранитель ассигнований на содержание монарха Джеймс Чалмерс. Материал дополняется.	7	\N	2025-07-01 10:17:14	2025-07-01 10:17:14
6	13	rosatom-lokalizuet-stancii-bystroy-zameny-batarey-na-elektromobilyah	«Росатом» локализует станции быстрой замены батарей на электромобилях	https://s0.rbk.ru/v6_top_pics/media/img/9/16/347512967496169.jpeg	ТВЭЛ, входящий в «Росатом», разрабатывает станции быстрой замены аккумуляторов для электромобилей. Компания намерена локализовать их производство в России. Для эффективной работы технологии батареи придется унифицировать Фото: Sean Gallup / Getty Images ТВЭЛ (топливный дивизион госкорпорации «Росатом») разрабатывает станции быстрой замены аккумуляторов для электромобилей по технологии Battery Swap. В перспективе оборудование планируется производить в России, сообщил РБК директор бизнес-направления «Электромобильность» компании Александр Бухвалов. Технология Battery Swap предусматривает, что станции обеспечивают не зарядку, а именно физическую замену блока аккумуляторов, что сокращает время обслуживания до 2–4 минут. По словам Бухвалова, это актуально для коммерческого транспорта, где для того, чтобы экономика владения сложилась, важна «каждая минута». В компании уточнили, что разрабатывают автоматизированные станции, которые позволят менять батареи без участия водителя. Базовая модель использования электромобиля в концепции Battery Swap не предполагает владения батареей — по версии ТВЭЛ, это может снизить барьер входа на рынок, так как само авто станет дешевле. rbc.group Бухвалов уточнил, что оператор станций замены батарей сможет отслеживать техническое состояние каждого аккумулятора — где тот использовался, в каких режимах эксплуатировался, сколько раз заряжался и разряжался. rbc.group Разработчик электромобиля «Атом» сравнил его с гаджетом Бизнес Отдельно он подчеркнул, что расчет общей стоимости владения (TCO) в ряде случаев может складываться в пользу электромобилей против авто с двигателем внутреннего сгорания. При этом одним из барьеров для массового перехода на электротягу по-прежнему остается время зарядки — сегодня это в среднем 30–40 минут. Концепция Battery Swap, по словам Бухвалова, нацелена на решение этой проблемы и может быть актуальна для корпоративного транспорта с высокой интенсивностью использования. Собеседник РБК убежден, что если бизнес сочтет владение электромобилем выгодным, то со временем «активно подтянется» и массовый потребитель. Как Россия переходит на электротягу Всего по состоянию на 2024 год в России было зарегистрировано 59,6 тыс. электромобилей. Сегодня развитие рынка сдерживают высокая начальная стоимость, быстрый износ аккумуляторов и ограниченный запас хода, особенно при интенсивной эксплуатации. Несмотря на потенциальную экономию на топливе и обслуживании, электромобили остаются выгодными лишь при наличии развитой инфраструктуры и доступа к субсидиям, отмечали эксперты НИУ ВШЭ. Лидером в этой части остается Москва, где реализуется сразу несколько механизмов: субсидии при покупке, бюджетное софинансирование зарядной инфраструктуры, освобождение от транспортного налога, бесплатная зарядка, парковки. По данным за 2024 год, в столице зарегистрировано 6716 электромобилей и действует 466 общественных ЭЗС. В Санкт-Петербурге — 3157 электромобилей и 198 зарядных станций, однако плотная застройка и планировочная структура мешают развитию зарядной сети. В Нижнем Новгороде электромобилей меньше — 1022, но на одну зарядную станцию (91 в городе) их приходится минимальное количество, что делает город лидером по обеспеченности инфраструктурой на единицу транспорта. Технологию планируется внедрять параллельно с расширением производственной базы по выпуску аккумуляторов. В настоящее время «Росатом» строит две «гигафабрики» — в Калининградской области и Новой Москве, — рассчитанные на выпуск до 100 тыс. аккумуляторных блоков в год (по 50 тыс. батарей в год каждая). В мае сообщалось, что фабрика в Немане (Калининградская область) готова на 80%, запустить ее планируют уже в этом году, на полную мощность завод намерен выйти в 2027 году. Выход на проектную мощность новомосковской фабрики запланирован на 2026 год. В 2023-м сообщалось также о планах поставить 150 тыс. тяговых батарей «Москвичу» и более 5 тыс. — «Мосгортрансу» до конца 2030 года. В Дзержинске компания строит предприятие по утилизации литий-ионных батарей мощностью до 20 тыс. тонн в год. По словам Бухвалова, компания также ведет разработку новых типов аккумуляторов с повышенной емкостью — они должны увеличить пробег электромобиля до 700 км на одной зарядке. Первые образцы таких аккумуляторов компания рассчитывает получить уже в 2026 году. Потенциал технологии Battery Swap на российском рынке есть, но будет во многом зависеть от стандартизации компонентов, считает Станислав Зингиревич, руководитель практики Kept по работе с компаниями автомобильной промышленности. Сейчас, по его словам, на рынке используется множество типов аккумуляторов, что затрудняет унификацию замены. Кроме того, для успешного масштабирования необходимо, чтобы процесс замены был технически простым и не требовал специальных навыков. Также Зингиревич указал на риски «кустарного вмешательства»: при сложной конструкции пользователи могут пытаться снимать и менять батареи самостоятельно, что чревато повреждениями. Эксперт отметил, что достижение единого стандарта требует значительных усилий. «Достаточно вспомнить, сколько времени потребовалось производителям электроники для перехода на USB- и Type-C-разъемы. Если история повторится, придется создать своеобразный супермаркет зарядных станций, предлагающих наиболее распространенные типы легко заменяемых батарей», — продолжает он. В долгосрочной перспективе, добавил Зингиревич, технологии быстрой зарядки, например восполнение заряда до 80% за 10–15 минут, могут составить конкуренцию решениям типа Battery Swap. Поэтому, по его мнению, такие станции будут востребованы в узком сегменте рынка. В то же время подход ТВЭЛ эксперт называет экологичным и рациональным: он позволяет продлить срок службы отработавших свое автомобильных аккумуляторов путем повторного использования в качестве элементов накопления энергии, что позволит существенно снизить углеродный след в промышленности. Читайте РБК в Telegram.	7	\N	2025-07-01 10:17:15	2025-07-01 10:17:15
7	15	iskandaryan-nikakoy-perspektivy-nahozhdeniya-armenii-v-es-ne-sushchestvuet	Искандарян: «Никакой перспективы нахождения Армении в ЕС не существует»	https://s0.rbk.ru/v6_top_pics/media/img/6/83/347513091190836.jpeg	Директор Института Кавказа (Ереван) Александр Искандарян в интервью РБК — о деле архиепископа Баграта, мирном договоре с Азербайджаном, стремлении Еревана в ЕС и нынешней роли России на Южном Кавказе Александр Искандарян (Фото: CaucasusInst / Facebook (входит в корпорацию Meta, признана экстремистской и запрещена в России)) О деле «Священной борьбы» — На днях суд в Ереване арестовал архиепископа Баграта и его соратников по движению «Священная борьба». Их обвиняют в попытке свергнуть власть с использованием террористических методов. Насколько это политическое дело? — Дела архиепископа Баграта и Самвела Карапетяна не могут не быть политическими. Архиепископ Баграт позиционирует себя как человека, который ведет политическую деятельность. В его преследовании, как и в целом в конфликте власти с церковью, есть политическая логика. rbc.group Самвел Карапетян(Фото: Роман Шеломенцев / РБК) rbc.group Обычно после революции «берут телеграф, телефон и почту». После революции 2018 года новые лидеры постепенно поменяли руководство в исполнительной, законодательной и судебной власти, сменили руководство армии и даже Карабаха. Церковь оставалась единственной институцией, не подчиненной государству, и столкновения с ней у властей были с самого 2018 года. До выборов в парламент остался год, рейтинг правящей партии довольно низок. Оппозицию она как серьезную угрозу не воспринимает, но есть опасения, что церковь, будучи независимой структурой, сможет запустить оппозиционную волну где-то в стороне от нынешней власти, потому что у нее сегодня самый высокий в Армении рейтинг. Армянская церковь: чем отличается, кто руководит, отношения с властью База знаний — Тогда не лучше ли было бы для властей не воевать с церковью, а, наоборот, сотрудничать? — Поначалу так и было. И в целом политические элиты в отношении церкви какие-то сдержанные позиции сохраняли. Но, может, для обострения были какие-то личные психологические причины. Потому что даже архиепископ Баграт, выступая с политическими заявлениями, подчеркивал, что делает это в личном качестве, и церковь на какое-то время приостанавливала его служение. Но теперь мы видим все больше скандальных высказываний, адресованных именно церкви. Лидер протеста архиепископ Баграт во время демонстрации в Ереване, Армения, октябрь 2024 года(Фото: Anthony Pizzoferrato / Middle East Images / ABACA / ТАСС) — Что вы ожидаете от парламентских выборов 2026 года? — Ситуация очень переменчивая. Если бы выборы были завтра, власть прошла бы через них, хотя и с потерями. Какие сейчас у Никола Пашиняна конкуренты? Их нет. Но и у самой правящей партии рейтинги низкие. Это традиционная для Армении ситуация — в условиях низкой легитимности власти и оппозиции республика просуществовала с 1992 по 2018 год. Потом была послереволюционная эйфория, но сейчас мы вернулись к классическому раскладу. Устойчивой такую систему нельзя назвать в любом случае. Но все это разговоры в пользу бедных, потому что мы видим, насколько все вокруг турбулентно. Интервью с Александром Искандаряном было записано на полях XI научно-экспертного международного форума «Примаковские чтения». Об отношениях с Россией и о ее роли на Южном Кавказе — Как вы оцениваете состояние отношений между Россией и Арменией? — В отношениях России и Армении есть некий кризис. Он продолжается с 2020 года, и начался после так называемой Второй карабахской войны. Кризис этот связан в основном с проблемой безопасности, которая для Армении сейчас ключевая. По мнению официального Еревана, тот формат отношений, который был у Армении с Россией до 2020 года, себя не оправдал. Армения не получила безопасность в том виде, в каком ожидала. Было поражение в войне, затем в 2023 году была депортация армян с территории Нагорного Карабаха. Нельзя не упомянуть начало украинской войны в 2022 году, которая изменила отношение России к постсоветскому пространству вообще и к Армении в частности. Ситуация в городе Вайка, Армения, куда прибывают беженцы из Нагорного Карабаха, сентябрь 2023 года(Фото: Ashley Chan / Keystone Press Agency / Global Look Press) Преуменьшать этот кризис не стоит, поскольку он влияет на внутренние дискурсы в Армении, в том числе по поводу России, и внутреннюю политику. При этом его не надо и преувеличивать. Конечно, никакого разрыва не происходит — Армения по-прежнему является членом ОДКБ и ЕАЭС, на ее территории по-прежнему находится российская военная база. Другое дело, что все это малофункционально: реально в работе ОДКБ Армения не участвует, не финансирует ее деятельность и не приезжает на заседания. То же и с российской базой: в большой степени она дисфункционализирована. Проблемы есть везде. У Москвы и Еревана есть общее понимание каких-то рамочных благопристойных отношений, и недовольство перманентно раздается с обеих сторон. Киркоров напомнил Пашиняну заповедь из-за дела Карапетяна Политика В ноябре 2020 года в результате Второй карабахской войны часть территории Карабаха перешла под контроль Азербайджана. В сентябре 2023-го Вооруженные силы Азербайджана взяли под контроль весь регион. В течение двух недель его покинули более 100 тыс. армян — все население непризнанной и прекратившей к концу сентября свое существование Нагорно-Карабахской республики. Баку утверждал, что армяне могут остаться, — для этого им нужно принять гражданство Азербайджана и пройти регистрацию. Подробнее об истории Нагорного Карабаха читайте в материале РБК. — Институты, о которых вы говорите и которые действовали как залог союзнических отношений между Россией и Арменией, с какого момента стали терять свою функциональность? — Пожалуй, с 2020 года. Между ожиданиями армянской стороны и реальностью была асимметрия. В общественном сознании Армении ее собственная безопасность и безопасность Нагорного Карабаха были слиты воедино: если нападают на Карабах, то нападают и на Армению. Войну 2020 года армянское общество воспринимает как свою собственную, и безопасность, которую должна была обеспечивать Россия как член ОДКБ, воспринималась как безопасность общая. В восприятии Москвы все было совсем не так: у нее были обязательства перед Республикой Армения, а не перед Нагорно-Карабахской республикой, а потому безопасность Армении и Нагорного Карабаха в российском сознании была разделена. Но после 2020 года обострения происходили, собственно, на границе Армении и Азербайджана. Были соответствующие просьбы о реакции к ОДКБ, которой не последовало. После 2020 года образовалась другая юридическая коллизия — тогда было трехстороннее заявление, которое подписали премьер-министр Никол Пашинян и президенты Ильхам Алиев и Владимир Путин. А потом случился 2023 год, когда при наличии российских миротворцев и обязательств, которые они несли, юридически ничего сделано не было — даже при довольно брутальном отношении Азербайджана к российским миротворцам, из которых шесть человек погибли. Мужчина возле кафе в азербайджанском городе Барда, разрушенном в результате ракетного обстрела во время обострения военного конфликта в Нагорном Карабахе, 2020 год(Фото: Ибрагим Гашимов / Sputnik / РИА Новости) Думаю, не будь 2022 года, не было бы и 2023-го — Азербайджан бы не осмелился на такого рода операцию. — С вашей точки зрения, роль России на Южном Кавказе ослабла? — Вне всякого сомнения. Образно говоря, сейчас на столе у господина Алиева не один телефон, а два. И большой вопрос, какой из них громче и крупнее — тот, который в Москву, или тот, который в Анкару. Конечно, в 2020 году воевал Азербайджан, но делал он это при безусловной поддержке Турции, причем не на словах, а вполне реальной — техникой и обучением. И в итоге союзник России проиграл, союзник Турции выиграл. Как это может не ослабить положение России в сфере безопасности на этой территории? В целом в сфере безопасности Азербайджан ориентируется далеко не на Москву. Армения теперь тоже — например, оружие она покупает у французов и индийцев, и это понятно — потому что русским оно самим нужно. Раньше порядка 90% вооружений поступало из России, но когда такой возможности больше нет, ищутся другие источники. — После 2020 года, когда были столкновения уже на границе Армении и Азербайджана и обстрелам подверглись такие армянские города, как Джермук и Горис, Ереван потребовал от ОДКБ осудить Баку. В организации позже, говоря о ее зоне ответственности в Армении, заявили, что она ограничивается армянской суверенной территорией в рамках урегулированных госграниц — то есть все упирается в делимитацию и демаркацию с Азербайджаном. Как вы относитесь к этому заявлению? — С юмором я к нему отношусь. Получается, если азербайджанцы захватят Ереван, то тоже ничего не будет, потому что граница не определена. А все ли страны, у которых есть двусторонние договоры, делимитировали и демаркировали свои границы? Наша граница с Грузией, с которой у нас прекрасные отношения, делимитирована на две трети, и этот процесс продолжается. Не определена и граница Грузии с Азербайджаном. Все ли границы России делимитированы и демаркированы? Конечно, нет. О том, что Джермук находится в составе Азербайджана, не говорят даже азербайджанцы. Последствия обстрела Джермука, Армения, сентябрь 2022 года(Фото: Александр Патрин / ТАСС) — Чем тогда продиктована позиция ОДКБ? — Давайте поймем, что такое ОДКБ. У нее очень интересная структура. Иногда журналисты сравнивают ее с НАТО, и это, на мой взгляд, абсолютно неграмотно. В отличие от НАТО, в ОДКБ есть одна страна, которая больше всех остальных членов вместе взятых по всем параметрам: территории, населению, экономике, военному потенциалу, ядерному оружию. В НАТО такой страны нет. — А США? — США — страна, конечно же, превышающая возможности всех других, но в НАТО есть еще два ядерных государства (Великобритания и Франция), есть страны с мощными армиями (Турция, Франция) и так далее. Эти организации сравнивать нельзя, они структурно разные. Далее, если подумать, что объединяет страны ОДКБ, можно прийти к выводу, что практически ничего. Ну какие общие угрозы, риски и интересы есть у Армении и Кыргызстана, у Кыргызстана и Белоруссии? Поэтому я бы назвал ОДКБ таким колесом без обода: есть центр, от которого расходятся спицы, назовем их «Москва — Ереван», «Москва — Минск», «Москва — Бишкек», а обода, который их всех объединяет, нет. Таким образом, ОДКБ — это такая рамка, формат взаимоотношений с Россией. Никто в Армении всерьез не полагал, что киргизы, таджики и белорусы завтра приедут сражаться за армян. Ожидания были не от ОДКБ, а от России. И Россия не оправдала этих ожиданий. КПП «Лачин», через который массово едут люди, покидающие Нагорный Карабах и направляющиеся в Армению, сентябрь 2023 года(Фото: Мурад Оруджев / Sputnik / РИА Новости) Об отношениях Еревана и Евросоюза — С 2023 года в Армении присутствует гражданская наблюдательная миссия Евросоюза — ее армянское руководство предпочло миссии, которую предлагала ОДКБ. Ереван в целом в последние годы активнее выстраивает отношения с Брюсселем. Верно ли сказать, что Армения отворачивается от России и поворачивается к Западу? — Я не оперирую такого рода выражениями в принципе. Как будто мы в магазине, где на полке стоят Россия и Европа, ты берешь одно, но не берешь другое. Так не бывает. У Армении всегда были отношения с Евросоюзом: она была участником европейской политики добрососедства, между ними действует договор CEPA. Армения выстраивает контакты с отдельными членами ЕС: у нее довольно близкие отношения с Грецией и Францией. Армения пытается гармонизировать свое законодательство с европейским, потому что экономически это приносит выгоды. Концепция внешней политики Армении на протяжении десятилетий сводится к «комплементаризму» — это попытка не разрывать, а соединять, насколько это возможно, взаимодействовать со всеми странами и акторами. Даже нынешний диалог с Евросоюзом руководство Армении называет не поворотом, а диверсификацией. Я просто не могу представить, что Армения разорвет отношения с Россией. Можно ли как-то заменить Верхний Ларс? Это пункт на границе Грузии и России, через который идет огромная часть армянского экспорта в Россию, которая является одним из ключевых потребителей армянской сельхозпродукции. — Это невозможно географически. — Вот-вот. Построить другой Ларс, который соединит Армению не с Россией, а с Люксембургом, невозможно. С другой стороны, повторюсь, когда тебе нужно оружие, а у России его получить невозможно, приходится идти в Индию и Францию, несмотря на географию. Некоторые модели развития внутриполитической системы приходится брать у европейцев — просто потому, что они у них есть. Те же самые переговоры о безвизе с Евросоюзом — замечательная перспектива для граждан Армении, которая значительно облегчит им передвижение в Европу. А еще у нас с Ираном отношения — это 30% нашего экспорта и импорта. И с Грузией прекрасные отношения. И для того, чтобы улучшать российско-армянские отношения, совершенно не обязательно ухудшать армяно-европейские. Вы упомянули мониторинговую миссию ЕС в Армении. Это около 200 человек без оружия, которые ездят вдоль границы, фиксируют, что там происходит, и докладывают об этом в Брюссель. Это закрытые доклады, что в них содержится, не знают ни Ереван, ни Баку. Фото: EU Mission in Armenia — Зачем тогда эта миссия Армении? — С тех пор как она появилась, резко понизилось количество вооруженных акций на границе. Потому что, хотя Азербайджан был против этой миссии и не пустил ее к себе, видимо, для него имеет значение, что в Брюсселе будут знать, кто откуда стреляет. Преувеличивать значение этой миссии не стоит, воспринимать как форму обеспечения безопасности — тоже, но как один из механизмов, который работает на то, чтобы не гибли люди в приграничных районах, — вполне. — В 2025 году Армения приняла закон, который закрепляет ее стремление к членству в Евросоюзе. Зачем? — Давайте говорить серьезно: никакие внутренние законы влиять на вступление стран в Евросоюз не могут в принципе. Существуют копенгагенские критерии членства, которым надо соответствовать для начала переговоров о членстве. Этот закон — фактор внутренней политики, а не внешней. — В армянском обществе такой большой запрос на вступление в ЕС? — Да. Люди вообще живут мифами. Нынешний — что Запад нам поможет. — И руководство Армении этот миф подкрепляет? — Несомненно. Потому что руководству Армении же переизбираться надо. Если есть тезис, который поддерживает большая часть населения, то почему бы им не воспользоваться? — Учитывая трудные отношения России с Евросоюзом, такая риторика российское руководство наверняка раздражает. — Не думаю. Там все прекрасно понимают. Эксперт МГИМО описал оптимальный курс России на Южном Кавказе Политика — Москва неоднократно напоминала о том, что участие Армении в ЕАЭС с членством в Евросоюзе несовместимо. Как в Армении решают эту дилемму? — Конечно, находиться одновременно в ЕАЭС и в ЕС невозможно, потому что и то и другое — таможенные союзы. Если страна будет одновременно в двух товарных союзах, я представляю, какой кошмар начнется в экономике, в торговле, в экспорте. Только никакой перспективы нахождения Армении в ЕС не существует. А потому не существует и дилеммы. Я довольно часто бываю в Европе и там беседую с разными деятелями — в том числе политическими. Они меня спрашивают с квадратными глазами: «Зачем вы это сделали?» (приняли закон. — РБК). И мне приходится им долго объяснять то, что я объясняю вам. Нет такой перспективы — вообще, от слова «совсем». — То есть у Москвы, на ваш взгляд, нет ощущения, что она теряет партнера? — Вы правильное слово использовали — «раздражение». Раздражение, наверное, есть. Но если подниматься на серьезный уровень — людей, которые принимают решения, — то неужели вы думаете, что аналитики Кремля не читали копенгагенские критерии? В Европе ими часто пренебрегали, принимая некоторые государства, но то был явный политический интерес Брюсселя: он делал это для себя, а не для других стран. В отношении Армении такого интереса нет. Но это некий нарратив, который работает в армянской внутренней политике. О мирном договоре между Арменией и Азербайджаном — В 2025 году Армения и Азербайджан одновременно заявили, что мирный договор готов к подписанию. Есть общее представление, о чем в нем может идти речь, но полностью документ не обнародован. Что вам известно о его содержании — какой документ согласован? — Никакой. Я не думаю, что речь идет о подписании документа. Дьявол-то в деталях. Сообщалось, что в соглашении 17 пунктов, и мы знаем, что есть требования Азербайджана, которые в документ не входят, — то есть надо согласовать еще некие постулаты до подписания. Судя по тому, как идет процесс, никакой перспективы подписания не существует. Звучат требования, чтобы Армения поменяла свою Конституцию — а для этого нужны минимум год и референдум — и чтобы распустить Минскую группу ОБСЕ. Но Армения в одиночку это сделать не может: там есть еще Россия, США, Франция. Так что это просто способ тормозить процесс. Теоретически я могу представить, что Азербайджану будет нужно и выгодно соглашение с Арменией. Но это не приведет к миру, потому что мир и соглашение о мире, мир и отсутствие войны — это разные вещи. Если что-то будет подписано, то, скорее, некий меморандум. Азербайджану не нужен мир — ему нужна слабая Армения. Мотивация Еревана к миру понятна: мы слабее Азербайджана, военный механизм безопасности не работает, а Азербайджан тем временем продолжает вооружаться, его армия сильнее. Соответственно, военную безопасность надо заменить на политическую форму — некий договор, который снял бы риски. Логика хромающая, но понятная. Теперь логика Баку: нет никого в Азербайджане, кто бы думал, что армяне нападут и заберут Карабах. А если рисков нет, то зачем заключать мир? Тогда мир — это не цель, а средство давления с выдвижением новых требований, которое может продолжаться до бесконечности. Офицер азербайджанской армии демонстрирует оружие и технику, сданные армянскими войсками в Нагорном Карабахе, в селе Сигнаг, Азербайджан, 2023 год(Фото: Азиз Каримов / AP / ТАСС) — Никол Пашинян пошел на ряд уступок Азербайджану и Турции: признал Карабах азербайджанским и сказал, что тема геноцида армян в Османской империи в политике Еревана больше не приоритет. Как вы оцениваете эту политику уступок и как на нее реагирует избиратель? — Как реагирует избиратель, мы увидим через год на парламентских выборах. Но в целом население воспринимает это в основном негативно. Как к этому отношусь я? Не надо быть семи пядей во лбу, чтобы видеть, что результатов такая политика не приносит. Добиться уступками большей безопасности, а не меньшей невозможно, они приводят к уменьшению ресурса, а не к его увеличению. Идея о том, что ты отдашь что-то и после этого появится красная линия, на которой остановится контрагент и дальше не будет давить, на мой взгляд, порочна, потому что эта красная линия двигается, не останавливаясь. Так что эта стратегия не работает, и такую политику я считаю ошибочной. — Какой может быть альтернативная политика? — А кто вам сказал, что эта альтернатива есть? Теоретически, может, и да, а практически — не очень. Здесь нужны повышение субъектности, укрепление государственных институций, укрепление безопасности, работа с разными союзниками, чтобы укреплялись политические формы безопасности, а не только военные, работа над реформированием и армии, и государственного аппарата. Другими словами, обрести больше ресурса. Я не говорю, что это не делается вообще, но делается недостаточно.	8	\N	2025-07-01 10:17:15	2025-07-01 10:17:15
8	16	chto-izmenitsya-v-sfere-finansov-dlya-rossiyan-s-1-iyulya	Что изменится в сфере финансов для россиян с 1 июля		Как вырастут тарифы за коммуналку, кто сможет открыть социальный вклад, когда истекает дедлайн по уплате НДФЛ и не только — в обзоре «РБК Инвестиций» Сбербанк SBERP +0,18% ВТБ VTBR -0,21% Росбанк ROSB — Какие финансовые изменения ждут россиян в июле 2025 года — в обзоре «РБК Инвестиций» (Фото: Shutterstock) В этом тексте: Пенсии Тарифы ЖКХ Социальный вклад и счет Налоги Пенсии Страховой стаж за периоды работы на территории Украины rbc.group С 1 июля в страховом стаже будут учитываться периоды работы на территории Украины после 1 января 1991 года. В стаж войдут: периоды работы на территории Украины с 1 января 1991 года по 23 февраля 2022 года; периоды работы на территориях ДНР и ЛНР с 11 мая 2014 года по 31 декабря 2022 года; периоды работы на территориях Запорожской области и Херсонской областей с 24 февраля по 31 декабря 2022 года. За каждый полный календарный год такого стажа будет начисляться один пенсионный коэффициент. Распространяется на: граждан России, за исключением лиц, постоянно проживавших на территориях ДНР, ЛНР, Запорожской области и Херсонской области по состоянию на день принятия в Российскую Федерацию указанных республик и областей и образования новых субъектов (30 сентября 2022 года) или постоянно проживавших на территориях ДНР, ЛНР в период с 11 мая 2014 года по 29 сентября 2022 года, на территориях Запорожской области и Херсонской области в период с 24 февраля по 29 сентября 2022 года и выехавших в эти периоды за пределы указанных территорий в Россию; граждан России, за исключением лиц, постоянно проживавших по состоянию на 18 марта 2014 года на территории Республики Крым или на территории города федерального значения Севастополя. На иностранных граждан положения этого закона не распространяются. Подтверждается стаж записями в трудовой книжке, документами, выданными работодателями или архивными организациями. При несохранности документов о работе стаж может быть установлен в особом порядке по решению межведомственной комиссии. По назначенным страховым пенсиям перерасчет с учетом стажа работы на Украине производится на основании заявления пенсионера, которое можно подать начиная с июня 2025 года. Пенсия пересматривается с 1-го числа месяца, следующего за месяцем подачи заявления. Что изменится для россиян в июле и какие законы вступят в силу Дополнительные выплаты Стандартно бессрочную надбавку получат все пенсионеры, которым в июне исполнилось 80 лет. С июля они начнут получать двойную фиксированную выплату — ₽17 815,4. Пенсию повысят в беззаявительном порядке. Эта прибавка распространяется только на получателей страховой пенсии. Тарифы ЖКХ С 1 июля произошло плановое повышение тарифов на жилищно-коммунальные услуги. В 2025 году стоимость таких услуг вырастет в среднем по стране на 11,9% — это больше, чем в предыдущие годы. Например, в 2024 году тарифы увеличились на 9,8%, а в 2023 году — на 8,1%, пишет «РБК Недвижимость». Однако в некоторых регионах увеличение стоимости будет выше средних значений. Согласно утвержденным индексам, сильнее всего коммунальные платежи с 1 июля вырастут в: Пермском крае — на 21,1%; Архангельской области — на 20%; Кемеровской области (Кузбасс) — на 19,8%; Северной Осетии — Алании — на 19,1%; Челябинской области — на 18%; Мордовии — на 18%; Ингушетии — на 17,6%; Дагестане — на 17,5%; Татарстане — на 17,5%; Алтайском крае — на 15,5%. Наименьшее подорожание жилищно-коммунальных услуг, согласно постановлению правительства, произойдет: в Амурской области — на 8,6%, в Республике Алтай — на 8,8%, в Ханты-Мансийском АО — на 9%, в Ямало-Ненецком АО — на 9,2%. Кроме того, правительство определило предельно допустимое отклонение от этих индексов в отдельных муниципалитетах. Данный показатель варьируется от 2,1% до 4,8% в зависимости от региона. Таким образом, рост коммунальных платежей с учетом этих отклонений может быть выше. Социальный вклад и счет С 1 июля у россиян появился новый финансовый инструмент для сбережений, предназначенный для людей, получающих социальную поддержку от государства. Сведения о назначении этих мер должны быть в Единой централизованной цифровой платформе в социальной сфере. Договоры по таким продуктам будут заключаться с клиентами в электронной форме через портал «Госуслуги». Причем банк не вправе отказать, если человек получает господдержку. Условия по вкладу и счету будут действовать, пока гражданин входит в категорию малообеспеченных граждан и официально получает помощь от государства. Оформить вклад или счет можно будет с 1 июля 2025 года в системно значимых кредитных организациях, в остальных банках — с 1 января 2027 года. Особенности соцвклада и соцсчета: сумма вложений — не более ₽50 тыс.; срок — не более одного года с возможностью пролонгации, если вкладчик по-прежнему получает соцподдержку от государства; ставка по вкладу должна быть равна максимальной ставке по вкладам физлиц в конкретном банке сроком до одного года за исключением депозитов по различным акциям; ставка по счету должна быть не меньше половины ключевой ставки Банка России; ограничения по количеству — не более одного вклада и одного счета. Следить за соблюдением этого ограничения банки будут с помощью реестра социальных банковских счетов и вкладов; начисление процентов происходит ежемесячно и перечисляется на отдельный банковский счет без капитализации; валюта — соцвклад и соцсчет возможно открыть только в рублях; снятие и пополнение — при необходимости деньги можно снять в любой момент или пополнить в рамках лимита без потери процентного дохода; комиссия — платежи и переводы с социального счета в пределах ₽20 тыс. будут бесплатны для вкладчика. Что такое социальный вклад и счет для малообеспеченных граждан Банки и финансы , Вклад , Сбережения , Словарь Налоги 15 июля включительно — последний день для своевременной уплаты НДФЛ за 2024 год. Речь идет о тех гражданах, кто был обязан представить налоговую декларацию 3-НДФЛ за 2024 год до 30 апреля 2025 года с исчисленной суммой налога к уплате в ней. Оплатить налог можно с помощью электронного сервиса «Уплата налогов и пошлин» на сайте ФНС России. Пользователи сервисов «Личный кабинет налогоплательщика для физических лиц» и «Личный кабинет налогоплательщика индивидуального предпринимателя» могут сформировать платежный документ в своем личном кабинете и уплатить налог онлайн. С 16 июля за каждый просроченный день уплаты НДФЛ будет начисляться пеня, исходя из 1/300 ставки рефинансирования Банка России. 3-НДФЛ: что это, где взять и как заполнить декларацию Налоги , Сбережения , Личные финансы , Словарь Борьба с мошенниками С 5 июля вступает в силу закон, которым введена уголовная ответственность для дропперов — подставных лиц, которых мошенники явно или скрытно используют для обналичивания или перевода украденных денег у пострадавших. За продажу своей банковской карты, которая потом используется мошенниками для вывода средств, полученных преступным путем, грозит штраф от ₽100 тыс. до ₽300 тыс. или в размере дохода от трех месяцев до года, обязательные работы до 480 часов, исправительные работы до двух лет или ограничение свободы до двух лет. За неправомерные операции с использованием чужих банковских карт или электронных кошельков предусмотрено наказание: принудительные работы на срок до пяти лет со штрафом в размере от ₽300 тыс. до ₽1 млн или в размере дохода за один — три года либо без такового; лишение свободы до шести лет со штрафом в размере от ₽300 тыс. до ₽1 млн или в размере дохода осужденного за один — три года либо без такового и с ограничением свободы на срок до двух лет либо без такового. За приобретение чужих банковских карт и использование их для вывода денежных средств, полученных обманным путем, грозит до шести лет лишения свободы с возможным налагаемым штрафом от ₽100 тыс. до ₽500 тыс. или в размере дохода за период от года до двух лет. Кроме того, возможны штрафы от ₽300 тыс. до ₽1 млн, принудительные работы до четырех лет.	9	\N	2025-07-01 10:17:15	2025-07-01 10:17:15
9	14	s-gazproma-predlozhili-snyat-nalogovuyu-nagruzku-po-dolgam-nord-stream-2	С «Газпрома» предложили снять налоговую нагрузку по долгам Nord Stream 2	https://s0.rbk.ru/v6_top_pics/media/img/8/98/347512737270988.jpeg	«Газпрому» могут помочь избежать дополнительной налоговой нагрузки в связи с прощенными долгами Nord Stream 2 AG. В мае оператор газопровода «Северный поток-2» достиг мирового соглашения с кредиторами, детали которого неизвестны «Газпром» GAZP ₽130,04 +0,12% Купить Фото: Sean Gallup / Getty Images Минфин подготовил поправки в налоговое законодательство, принятие которых поможет «Газпрому» избежать дополнительной налоговой нагрузки, связанной с задолженностью швейцарской «дочки» компании — Nord Stream 2 AG (оператор газопровода «Северный поток-2»). Изменения, с текстом которых ознакомился РБК, планируется внести в уже рассматриваемый и принятый в первом чтении законопроект «О внесении изменений в статьи 164 и 165 Налогового кодекса Российской Федерации». В частности, предлагается дополнить перечень того, что понимается под определением «безнадежный долг», то есть нереальные к взысканию долговые обязательства. Таковыми может быть признана «задолженность по процентам по долговым обязательствам иностранной организации, которые признаны в составе дохода». Дополнительно устанавливается, что выплата налогов с доходов, выплачиваемых иностранным организациям, не производится налоговым агентом этих организаций, если такими доходами является прощенный долг по процентам. Однако и в том, и в другом случае одновременно должны выполняться ряд условий: прощение задолженности происходит на основании соглашения, утверждаемого судом в иностранном государстве в рамках финансового оздоровления такой иностранной организации; заимодавец (налоговый агент) и заемщик (иностранная организация) входят в одну международную группу компаний; в отношении иностранной организации действуют запретительные и ограничительные меры, введенные с 2022 года иностранными государствами, экономическими, политическими, военными или иными объединениями стран, международными финансовыми и другими организациями. rbc.group Проект поправок в понедельник, 30 июня, был рассмотрен и одобрен на заседании правительственной комиссии по законопроектной деятельности, рассказал источник РБК в правительстве. rbc.group «Проект поправок подготовлен в целях недопущения дополнительной налоговой нагрузки ПАО «Газпром» в связи с задолженностью швейцарской компании «Норд Стрим 2 АГ», — говорится в материалах к поправкам. РБК направил запрос в пресс-службу правительства, «Газпрома» и Nord Stream 2 AG. Инвестор из США заявил о готовности купить взорванный «Северный поток-2» Политика Чем известна Nord Stream 2 Швейцарская Nord Stream 2 AG — оператор и проектная компания, отвечавшая за строительство «Северного потока-2». Это экспортный газопровод из России в Европу, который был проложен рядом с «Северным потоком» по дну Балтийского моря с выходом на берегу Германии. Общая мощность двух ниток проекта составляла 55 млрд куб. м в год. Строительство магистрали было завершено в сентябре 2021 года, хотя изначально планировалось в конце 2019 года, но задержалось из-за санкций США. Единственным акционером Nord Stream 2 AG является «Газпром». Однако строительство газопровода осуществлялось с участием иностранных инвесторов — европейских энергетических компаний OMV, Wintershall Dea, Shell, Uniper и Engie. Они обязались предоставить долгосрочное финансирование в размере 50% от общей стоимости проекта, которая оценивалась в €9,5 млрд. Таким образом, каждая компания должна была выделить до €950 млн. О каком урегулировании долга идет речь Запуск «Северного потока-2» в работу так и не состоялся, сначала по причине долгой сертификации, затем — из-за ужесточения санкционного режима в отношении проекта в начале 2022 года. А после подрывов на «Северных потоках» в сентябре 2022 года рабочей осталась только одна из ниток «Северного потока-2». Генпрокуратура тогда возбудила дело об акте международного терроризма. Теперь правительство Германии планирует скорректировать законодательство, чтобы не допустить ввода в эксплуатацию газопровода «Северный поток-2» в будущем, сообщал Der Spiegel. При этом весной 2022 года началась процедура банкротства Nord Stream 2 AG, поскольку из-за санкций США компания не могла соблюдать свои долговые обязательства. Суд тогда предоставил иностранной «дочке» «Газпрома» временный мораторий на выплаты кредиторам, который неоднократно продлевался. В мае 2025 года было объявлено о мировом соглашении между оператором «Северного потока-2» и его кредиторами, которое утвердил суд швейцарского кантона Цуг. Детали договоренностей не разглашались. Позднее «Газпром» заявил, что решение вступило в силу, а мораторий на банкротство организации прекращен. Nord Stream 2 и его кредиторы заключили мировое соглашение Бизнес Как будут действовать поправки По словам профессора кафедры налогов и налогового администрирования Финансового университета при правительстве России Михаила Юмаева, долг Nord Stream 2 AG по процентам должен учитываться в доходах «Газпрома». Это происходит по ряду обстоятельств. Во-первых, Nord Stream 2 AG является дочерней компанией «Газпрома», а согласно международным стандартам финансовой отчетности, проценты по займам между связанными сторонами должны отражаться в консолидированной финансовой отчетности, даже если они не были фактически выплачены. Во-вторых, утверждение мирового соглашения формально признало задолженность, включая проценты, в составе обязательств швейцарской компании. Однако в случае прощения долг Nord Stream 2 AG по процентам перед «Газпромом» является доходом швейцарской компании, замечает партнер адвокатского бюро «Астериск» Федор Закабуня. Поправки в Налоговый кодекс в таком случае позволят «Газпрому» не платить налог на прибыль с безнадежных долгов Nord Stream 2 AG, если выполнены оговоренные условия, дополняет доцент кафедры налогов и налогового администрирования Финуниверситета Алексей Костин. «Если долг признается безнадежным, но ранее был учтен в доходах, это ведет к возникновению налоговых обязательств. Поправки Минфина в этом случае направлены на исключение двойного налогообложения в подобных ситуациях, поскольку оптимизируют налоговую базу для международных групп компаний, позволяя не платить налог с доходов по списанным долгам, если выполнены определенные условия — судебная реструктуризация, санкции и так далее», — заключает Юмаев. Обсуждаемые изменения при этом не должны касаться иностранных заемщиков Nord Stream 2 AG, считает Закабуня. «Вероятнее всего, они коснутся только «Газпрома» и входящих с ним в группу российских юридических лиц, которые предоставляли финансирование Nord Stream 2 AG и которые могли бы выступать налоговыми агентами по обязательствам компании», — полагает он. «Реструктурированные долги Nord Stream 2 AG перед иностранными кредиторами (Wintershall DEA, Shell и др.) не являются прямыми доходами «Газпрома», — добавляет Костин. Однако они все равно могут влиять на его финансовые показатели, замечает он. При этом поправки могут коснуться не только «Газпрома», говорит Закабуня. Изменения могут действовать и для «любых иных российских компаний, предоставляющих заемное финансирование иностранным лицам, входящим с ними в одну группу», заключает эксперт. Читайте РБК в Telegram.	2	\N	2025-07-01 10:17:15	2025-07-01 10:17:15
10	39	pochemu-ssha-pochti-ne-upomyanuty-v-programme-liderstva-danii-v-evrosovete	Почему США почти не упомянуты в программе лидерства Дании в Евросовете	https://s0.rbk.ru/v6_top_pics/media/img/3/97/347512926951973.jpeg	С 1 июля к Дании переходит председательство в Евросовете. Как королевство планирует усилить роль ЕС на международной арене и какую поддержку обещает Украине — в материале РБК Фото: Michele Tantussi / Getty Images С 1 июля Дания берет на себя шестимесячное председательство в высшем политическом органе ЕС — Евросовете. Копенгаген перенимает эстафету у Варшавы в критический для Европы момент — помимо продолжающихся боевых действий на Украине над блоком навис кризис трансатлантического единства, разрастающийся после возвращения в Белый дом Дональда Трампа. Дания на себе ощутила последствия трансформации американской внешней политики: заступив на второй срок, Трамп пообещал присоединить к США Гренландию, автономную территорию в составе королевства. Датский министр по делам Европы Мари Бьерре заявила в недавнем интервью The Parliament, что геополитическая турбулентность сделала сотрудничество в рамках ЕС первоочередной задачей. «Мягко говоря, из США подули новые ветры, и я думаю, что это стало причиной нашего проевропейского настроя», — пояснила она. Программа датского председательства в Евросовете представляет собой 47-страничный документ под девизом «Сильная Европа в меняющемся мире». В нем отмечено: международные события заставляют ЕС стать «более сильным геополитическим игроком», и Дания будет работать над тем, чтобы Европа взяла на себя ответственность за собственную безопасность, а также усилила свою конкурентоспособность. rbc.group Председательство в Евросовете переходит от одного государства — члена ЕС к другому через полгода; таким образом, каждая из 27 стран союза получает его раз в 13–14 лет. С 1 января 2026 года Данию сменит Кипр. В обязанности страны-председателя входят контроль за законодательной деятельностью Евросовета и обеспечение сотрудничества между государствами — членами ЕС. Председательствующая страна также занимается организацией заседаний на разных уровнях Евросовета (за исключением Совета по иностранным делам) и его подготовительных органов, в том числе комитета постоянных представителей стран — членов ЕС (Coreper). rbc.group Как Дания планирует укрепить роль ЕС на международной арене В роли председателя Евросовета Дания будет стремиться усилить геополитическое влияние ЕС путем построения всеобъемлющего и равноправного партнерства с третьими странами, гласит документ. В разделе, посвященном взаимоотношениям с другими странами, отдельно о стратегическом партнерстве с США ничего не сказано — Вашингтон упоминается лишь в разделе, посвященном торговле (в программе польского председательства повторялся тезис, что Соединенные Штаты — ключевой партнер блока). Роль председателя в Евросовете переходит к Дании перед истечением установленного Трампом дедлайна введения «взаимных» тарифов для ЕС. В датской программе указано, что конструктивное сотрудничество с Соединенными Штатами будет продолжено в области торговли и инвестиций, экономической безопасности, однако Еврокомиссия будет поддерживаться равного подхода ко всем партнерам. «В рамках председательства мы будем работать над обеспечением равных условий на внутреннем рынке и в глобальном масштабе, а также над укреплением европейской конкурентоспособности и экономической безопасности», — говорится в документе. Дональд Трамп объявил о введении 20-процентных пошлин на все товары из ЕС 2 апреля. Через несколько дней он «заморозил» это решение на 90 дней. Базовый тариф в отношении стран блока 10% остался в силе, как и 25-процентные пошлины на автомобили. ЕС разработал ответные меры, но предпочел «дать шанс переговорам» и также ввел «заморозку» до 9 июля. Однако в конце мая Трамп, разочарованный ходом переговоров с блоком, порекомендовал ввести 50-процентные пошлины против ЕС, причем уже с 1 июня. Но после переговоров с главой Еврокомиссии Урсулой фон дер Ляйен американский лидер решил по крайней мере оставить в силе прежний дедлайн. Однако в начале июня вступили в силу 50-процентные тарифы США на сталь и алюминий из других стран. В датской программе есть раздел, посвященный взаимодействию с Великобританией и другими западноевропейскими странами, которые не входят в блок. Копенгаген обещает продолжить работу в рамках заключенного в мае с Лондоном соглашения о партнерстве, а также укреплять кооперацию с Швейцарией и странами Европейской экономической зоны (EEA). Отдельно в программе отмечено, что текущие геополитические события ставят на повестку необходимость расширения ЕС. В этом контексте особое внимание Дания планирует уделить евроинтеграции Украины (сейчас этот процесс тормозит Венгрия), а также стран Западных Балкан и Молдавии. Что касается ситуации на Ближнем Востоке, Дания продолжит усилия ЕС по деэскалации, в том числе путем поддержки решения о создании палестинского государства и разработки согласованного подхода к Сирии. Королевство также будет работать над усилением давления на Иран «с целью изменения его дестабилизирующего поведения», а также против вовлеченности исламской республики в военные действия на Украине. Дания также намерена способствовать укреплению отношений ЕС со странами Африки, Индо-Тихоокеанского региона и латиноамериканским объединением МЕРКОСУР. Отдельно в документе подчеркивается, что Копенгаген приложит усилия, чтобы обеспечить более весомый голос ЕС в ООН. Как Дания надеется укрепить обороноспособность ЕС и Украины На пути к членству в ЕС Дания обещает республике «первое место в политической повестке дня». В разделе программы председательства, посвященной внешнеполитическим вызовам, заявлено, что в свете действий России на Украине «не позднее чем к 2030 году» блоку необходимо сделать все возможное, чтобы Европа смогла самостоятельно защитить себя. В частности, необходимо усилить европейскую оборонную промышленность, что также станет «весомым вкладом в евроатлантическую безопасность». Концептуальная основа для перевооружения блока была представлена Еврокомиссией несколько месяцев назад — это проект ReArm Europe с общими затратами €800 млрд, который в опубликованной чуть позже Белой книге об обороне ЕС был переименован в Readiness 2030 («Готовность-2030»). В его рамках Евросовет уже утвердил создание механизма кредитования SAFE объемом €150 млрд, который в том числе предполагает совместное с Украиной производство вооружений. Для укрепления европейской оборонной технологической и промышленной базы Дания планирует способствовать завершению переговоров с Европарламентом в этой области. Кроме того, в Копенгагене надеются на запуск переговоров о соответствующих законодательных актах при подготовке следующего многолетнего финансового плана на период после 2027 года. На саммите НАТО в Гааге Дания вместе с остальными странами — членами альянса согласилась повысить расходы на оборону до 5% ВВП к 2035 году, как того требовал Трамп. Сейчас только две трети членов НАТО тратят около 2% ВВП на военные нужды, что соответствует установленному еще в 2014 году на саммите в Уэльсе минимальному уровню. Само королевство тратит на национальную оборону 2,37% ВВП. Дания также обещает работать над тем, чтобы Украина получила достаточную международную поддержку в 2026 году и потом, в том числе за счет использования доходов от замороженных российских активов. Копенгаген настаивает, чтобы санкционное давление на Россию продолжалось, и особое внимание обращает на важность борьбы с обходом рестрикций. А еще обещает работать над укреплением энергетической независимости ЕС, в частности посредством полного отказа от российских энергоносителей (соответствующую «дорожную карту» REPowerEU подготовила Еврокомиссия). «Крайне важно укрепить долгосрочную обороноспособность Украины, в том числе после потенциального прекращения огня или мирного соглашения», — говорится в документе. В этой связи предполагаются совместные закупки оружия и увеличение инвестиций в оборонный сектор Украины. Дания также настаивает на продолжении Миссии по военной помощи ЕС Украине (EUMAM) и будет стремиться к более тесной координации с НАТО в области обучения украинских военных. Недавно президент Украины Владимир Зеленский заявил, что Дания станет первой страной, с которой будет запущено совместное оборонное производство. На июньском саммите НАТО в Гааге министры обороны стран Рустем Умеров и Троэльс Лунд Поульсен подписали соглашение о намерениях; оно предусматривает создание оборонного производства на территории скандинавской страны. Копенгаген уже выделил на этот проект 500 млн крон (около $80 млн). При этом еще в 2024 году Украина и Дания внедрили механизм финансирования закупок вооружения для ВСУ через возмещение контрактов с украинскими производителями. В рамках этого сотрудничества, получившего название «датская модель», оборонная поддержка Киева, по словам Умерова, достигла к июню этого года €1,3 млрд. Дания наряду с другими странами Северной Европы считается одним из главных военных доноров для Украины. По данным Кильского института мировой экономики, с 2022 года Копенгаген предоставил Киеву €8,6 млрд на военные нужды (2,3% от национального ВВП). Таким образом, королевство входит в топ-10 стран, которые выделили больше всего средств на поддержку Украины.	7	\N	2025-07-01 10:35:01	2025-07-01 10:35:01
11	135	v-gosdume-obyasnili-kto-mog-rasprostranit-sluhi-o-zamorozke-vkladov	В Госдуме объяснили, кто мог распространить слухи о заморозке вкладов	https://s0.rbk.ru/v6_top_pics/media/img/7/60/347513557950607.jpeg	За слухами о возможной заморозке вкладов могут стоять девелоперы, которые хотели подстегнуть интерес к вложениям в недвижимость, заявил Аксаков. ЦБ неоднократно опровергал сообщения о заморозке, называя такой шаг абсурдным Фото: Андрей Любимов / РБК Слухи о возможной заморозке вкладов россиян могли распространить застройщики, заявил глава комитета Госдумы по финансовому рынку Анатолий Аксаков. По его словам, таким образом девелоперы рассчитывали подогреть спрос к вложениям в недвижимость. Аксаков считает, что целью пиар-акции было стремление подстегнуть граждан к покупке квартир и домов. Несмотря на то что «обычные некомпетентные комментарии» растиражировали интернет-ресурсы, Банк России, правительство, Госдума и экспертное сообщество оперативно опровергли эту информацию, подчеркнул депутат. «Деньги на депозитах работают на развитие экономики — за счет них банки выдают кредиты, которые в свою очередь обеспечивают им финансовые результаты для расчета с вкладчиками и выплаты процентов. Изымать средства частных лиц не имеет никакого практического смысла», — рассказал «РИА Новости» Аксаков. rbc.group Дискуссия о рисках заморозки вкладов началась в ноябре 2024 года с комментария директора Института социально-экономических исследований Финансового университета при правительстве России Алексея Зубца. Он сказал, что банки могут пойти на это во избежание «бешеной инфляции». Однако выступавшая в том же месяце в Госдуме председатель Банка России Эльвира Набиуллина заявила, что «большей бессмыслицы придумать сложно». Сам Зубец позднее заверил, что не говорил о заморозке вкладов, а допускал «специальные процедуры снятия денег населения». rbc.group ЦБ пригрозил банкам мерами за навязывание условий вкладов Финансы Вторая волна дискуссии вновь была запущена в телеграм-каналах в начале 2025 года. В официальном ответе регулятора подчеркивалось, что заморозка счетов и вкладов — грубейшее нарушение права граждан и компаний распоряжаться своими активами. Банк России назвал такую меру абсурдной, подчеркнув, что это подорвет основы банковской системы и финансовую стабильность страны. По данным Банка России, на 1 января 2025 года средства населения в банках составляли 57,5 трлн руб., 70,3% из которых, или 40,44 трлн руб., приходится на срочные вклады с начислением процентов. В мае рублевые средства россиян в банках практически не изменились, увеличившись только на 0,2%, или 0,1 трлн руб., по сравнению с существенным приростом в апреле — на 2,8%, или 1,6 трлн руб. На 1 июня их объем составлял 59,4 трлн руб. Читайте РБК в Telegram.	9	\N	2025-07-01 11:35:02	2025-07-01 11:35:02
261	790	tramp-prizval-hamas-k-sdelke-s-izrailem-slovami-luchshe-ne-budet	Трамп призвал ХАМАС к сделке с Израилем словами «лучше не будет»	https://s0.rbk.ru/v6_top_pics/media/img/8/16/347514126056168.jpeg	Израиль согласен на предложение о перемирии в Газе на 60 дней, Катар и Египет представят окончательные условия, заявил Трамп. Он выразил надежду, что ХАМАС поддержит сделку «ради блага Ближнего Востока» Дональд Трамп (Фото: Evelyn Hockstein / Reuters) Президент США Дональд Трамп заявил, что Израиль после переговоров с американскими представителями согласился на «необходимые условия» для соглашения о прекращении огня в секторе Газа на 60 дней. В течение этого срока Соединенные Штаты будут работать со всеми сторонами, чтобы положить конец войне, а окончательное предложение представят Катар и Египет, сообщил Трамп. «Я надеюсь, ради блага Ближнего Востока, что ХАМАС согласится на эту сделку, потому что лучше не будет — БУДЕТ ТОЛЬКО ХУЖЕ», — написал он в Truth Social. rbc.group ХАМАС ответил на предложение Уиткоффа о перемирии в секторе Газа Политика rbc.group В Вашингтон прибыл министр стратегического планирования Израиля Рон Дермер. Как писала The Times of Israel, он собирался провести переговоры со специальным посланником Трампа на Ближнем Востоке Стивом Уиткоффом, госсекретарем Марко Рубио и вице-президентом Джей Ди Вэнсом. По словам Трампа, встреча была долгой и продуктивной. Предложение Соединенных Штатов о 60-дневном перемирии обсуждается последние несколько месяцев. По данным Al Arabiya и Al Jazeera, оно включает освобождение живых израильских заложников и передачу тел в обмен на палестинских заключенных в несколько этапов. Израиль должен остановить всю наступательную деятельность, а после обменов передислоцировать войска в южную часть сектора. Кроме того, в первый день перемирия начнутся переговоры о постоянном прекращении огня В конце мая израильский премьер Биньямин Нетаньяху сообщил, что принимает план США. ХАМАС заявил, что изучает предложение и примет решение, «которое будет служить интересам народа». Впоследствии переговоры зашли в тупик, в основном из-за разногласий о том, что произойдет по окончании срока прекращения огня. Читайте РБК в Telegram.	8	\N	2025-07-02 08:05:01	2025-07-02 08:05:01
262	791	poroshenko-obvinil-zelenskogo-v-avtoritarizme-i-prizval-uchitsya-u-bibi	Порошенко обвинил Зеленского в авторитаризме и призвал «учиться у Биби»	https://s0.rbk.ru/v6_top_pics/media/img/5/68/347514236652685.jpeg	Зеленский хочет «убрать политических конкурентов», санкции — это предупреждение потенциальным кандидатам, считает экс-президент: «Сегодня Порошенко, завтра Залужный». Он недоволен тем, как власти ведут переговоры с США Петр Порошенко (Фото: Andreea Campeanu / Getty Images) Бывший президент Украины и лидер партии «Европейская солидарность» Петр Порошенко в интервью The Times заявил что его преемник, действующий глава государства Владимир Зеленский стремится «убрать любого конкурента с политической сцены». Зеленский, утвердив санкции против Порошенко, проявил «ползучий авторитаризм», который грозит подорвать демократию, считает экс-президент. Ограничения могут препятствовать его выдвижению на выборах и являются предупреждением для каждого потенциального кандидата, утверждает он: «Сегодня Порошенко, завтра [бывший главком ВСУ Виктор] Залужный, послезавтра кто угодно». «Зачем он это делает? Потому что он ненавидит меня на биологическом, химическом уровне», — полагает политик. Порошенко признался, что Зеленский ему тоже не нравится, но он «ни разу во время войны не проявлял враждебности» по отношению к действующему президенту. По словам Порошенко, все больше людей недовольны поведением Зеленского, и ему нужно прислушаться к этим мнениям, так как иначе критика «может иметь эффект кипящего котла». rbc.group Порошенко заявил, что знает Трампа, и дал совет для переговоров с ним Политика rbc.group Лидер «Европейской солидарности» настаивает, что не хочет критиковать Зеленского, а просто дает ему совет. В то же время в разговоре с Times он указал на «ужасные ошибки», допущенные его преемником, например, на февральскую встречу с президентом США Дональдом Трампом в Белом доме, которая закончилась публичной ссорой. Порошенко считает, что Зеленскому нужно «учиться на опыте Биби». Экс-президент имеет в виду премьер-министра Израиля Биньямина Нетаньяху, убедившего США вступить в ирано-израильский конфликт и атаковать ядерные объекты Тегерана. Зеленский же «изо всех сил пытается сохранить поддержку» Трампа в военном конфликте с Россией, что, по мнению Порошенко, связано с тем, что Киев не представил четких целей на переговорах с Вашингтоном. Экс-президент сам пытался наладить связи с командой Трампа во время визита в Вашингтон в феврале. Теперь из-за санкций он не может выезжать за границу. Также ограничения мешают Порошенко поддерживать украинских военных, которым, по его словам, он пожертвовал $200 млн за последние три года. Зеленский допускал, что санкции с Поршенко снимут, если тот передаст армии выведенные из страны деньги. Речь идет о «миллиардах гривен», говорил он. Forbes оценивает состояние Порошенко в $2 млрд. Читайте РБК в Telegram.	5	\N	2025-07-02 08:05:01	2025-07-02 08:05:01
12	130	mintrud-pokazal-proekt-kalendarya-vyhodnyh-dney-v-2026-godu	Минтруд показал проект календаря выходных дней в 2026 году	https://s0.rbk.ru/v6_top_pics/media/img/0/33/347513503487330.jpeg	Новогодние каникулы продлятся 12 дней, пять раз в предстоящем году россиян ждут выходные по три дня подряд Фото: Минтруд России Минтруд разработал проект календаря праздничных и выходных дней на 2026 год, сообщает ведомство. В новогодние каникулы россиян ждет 12 дней отдыха. В феврале россияне будут отдыхать три дня подряд — с 21 по 23 февраля. В марте граждан также ждут трехдневные выходные с 7 по 9 марта. В мае отдых будет разделен на два отрезка: дважды по три дня — с 1 по 3 мая и с 9 по 11 мая. rbc.group В июне выходные будут с пятницы по воскресенье — с 12 по 14 июня. rbc.group В ноябре россиян ждет один праздничный выходной день — 4 ноября. А 31 декабря начнутся новогодние праздники. Глава Минтруда Антон Котяков напомнил, что постановление о переносе выходных дней, которые выпадают на праздничные дни, принимается ежегодно. «Перенос осуществляется таким образом, чтобы оптимально распределить время труда и отдыха, по возможности объединить праздничные и выходные дни. Благодаря переносу новогодние каникулы продлятся 12 дней — с 31 декабря 2025 года по 11 января 2026-го года. Пять раз в будущем году будут выходные по 3 дня: в феврале, марте, дважды в мае и на День России в июне», — отметил он.	1	\N	2025-07-01 11:35:05	2025-07-01 11:35:05
13	155	mincifry-raskrylo-chislo-sdavshih-biometriyu-dlya-svyazi-inostrancev	Минцифры раскрыло число сдавших биометрию для связи иностранцев	https://s0.rbk.ru/v6_top_pics/media/img/8/14/347513537967148.jpeg	С 1 июля начинается отключение мобильной связи для иностранных граждан, которые не зарегистрировались в ЕБС. На текущий момент, согласно данным Минцифры, договоры связи по новым правилам оформили более 2 млн иностранцев Фото: Алексей Даничев / РИА Новости Более 2 млн иностранных граждан зарегистрировались в Единой биометрической системе (ЕБС) и оформили договоры связи по новым правилам, сообщило Минцифры. Сделать это нужно было до 1 июля — начиная с этой даты, иностранцам, не сдавшим биометрию, отключат мобильную связь. С 1 января 2025 года порядок покупки сим-карт иностранцами стал более строгим. Чтобы заключить договор связи, им нужно получить СНИЛС, создать учетную запись на «Госуслугах», зарегистрировать биометрию и сообщить IMEI — код идентификации применяемого телефона. Оформить договор можно только при условии регистрации в ЕБС, а также при личном обращении в салон связи. При этом один человек сможет оформить на себя не более десяти номеров, включая корпоративные. У россиян появится сервис для проверки зарегистрированных на них сим-карт Технологии и медиа rbc.group По ранее заключенным договорам сдать биометрию нужно было до 1 июля. Для нарушивших правила иностранцев предусмотрен ряд ограничений: rbc.group номера, которые были неактивны более трех месяцев, отключат сразу; по активным номерам абоненты будут отключаться поэтапно. Сначала будут заблокированы услуги международной и междугородней связи и снижена скорость интернета, а через 30 дней оказание услуг связи будет прекращено полностью. За это время пользователь может переоформить договор по новым правилам. Меры направлены на борьбу с мошенниками и «серыми» сим-картами, отмечали в Минцифры. В 2024 году Роскомнадзор заблокировал свыше 9 млн сим-карт иностранцев, не подтвердивших персональные данные у операторов сотовой связи. Повторную идентификацию прошли 6 млн иностранных граждан, которые в общей сложности владеют 12,9 млн номеров. Еще 5,2 млн иностранцев не прошли идентификацию: были расторгнуты договоры по 9,5 млн номеров, которыми они владели. Читайте РБК в Telegram.	8	\N	2025-07-01 11:45:01	2025-07-01 11:45:01
14	162	v-azerbaydzhane-zaveli-delo-posle-smerti-dvuh-zaderzhannyh-v-ekaterinburge	В Азербайджане завели дело после смерти двух задержанных в Екатеринбурге	https://s0.rbk.ru/v6_top_pics/media/img/7/42/347513616177427.jpeg	Фото: Михаил Терещенко / ТАСС Генпрокуратура Азербайджана возбудила уголовное дело после гибели двоих граждан страны — 60-летнего Гусейна Сафарова и его 55-летнего брата Зияддина Сафарова — после задержания в ходе рейда в Екатеринбурге. По результатам судмедэкспертизы, проведенной в Баку, Гусейн Сафаров скончался в результате «посттравматического и постгеморрагического шока», а его брат — в результате «посттравматического шока, возникшего на фоне многочисленных полученных травм», говорится в сообщении Генпрокуратуры. Дело возбуждено по статьям 120.2.1, 120.2.4, 120.2.7, 120.2.9 (умышленное убийство двух или более человек, заведомо находящихся в беспомощном состоянии, совершенное с особой жестокостью группой лиц по предварительному сговору), 309.2 (превышение должностных полномочий, повлекшее тяжкие последствия) и 293.3 (пытки или иное жестокое, бесчеловечное или унижающее достоинство обращение или наказание, если эти действия повлекли по неосторожности смерть потерпевшего) Уголовного кодекса Азербайджана. rbc.group В заявлении Генпрокуратуры утверждается, что травмы погибшие получили во время задержания «со стороны сотрудников правоохранительных органов Российской Федерации». rbc.group «Генеральная прокуратура Азербайджанской Республики направит запросы о юридической помощи соответствующим государствам в соответствии с нормами международного права и обеспечит необходимое сотрудничество для эффективного проведения расследования и выявления и привлечения к ответственности преступников», — сказано в публикации. Азербайджанская Генпрокуратура отмечает, что Гусейн Сафаров занимался малым бизнесом, а Зияддин Сафаров работал таксистом. Братьев Сафаровых задержали вместе с другими азербайджанцами в ходе рейда в Екатеринбурге 27 июня в рамках расследования дел об убийствах, совершенных в 2001, 2010 и 2011 годах. Источник РБК в правоохранительных органах уточнял, что фигуранты дела также причастны к массовому отравлению контрафактным алкоголем на Урале в 2021 году, в результате которого погибли около 40 человек. МИД Азербайджана заявил, что среди задержанных есть погибшие и раненые, и попросил привлечь к ответственности причастных к насилию. СК позже сообщил, что один из задержанных погиб, по предварительным данным, из-за сердечной недостаточности, а причины смерти второго устанавливаются. Их тела передали азербайджанской стороне. Материал дополняется.	3	\N	2025-07-01 12:45:03	2025-07-01 12:45:03
15	163	v-baku-zayavili-o-travmah-na-telah-pogibshih-posle-zaderzhaniya-na-urale	В Баку заявили о травмах на телах погибших после задержания на Урале	https://s0.rbk.ru/v6_top_pics/media/img/6/26/347513581132266.jpeg	На теле погибших после задержания азербайджанцев в Екатеринбурге в ходе судмедэкспертизы обнаружили множественные травмы, заявили в Баку. Азербайджан выразил протест. Москва пояснила, что рейды связаны с «тяжкими преступлениями» Фото: Bernd von Jutrczenka / DPA / ТАСС На телах скончавшихся после задержания в ходе рейда в Екатеринбурге граждан Азербайджана Гусейна и Зияддина Сафаровых в ходе проведения судебно-медицинской экспертизы найдены множественные травмы, заявил на пресс-конференции генеральный директор объединения судебно-медицинской экспертизы и патологической анатомии Министерства здравоохранения Азербайджана Адалят Гасанов. «Перед тем как мы осмотрели тела, нам вручили свидетельства о смерти. Согласно показаниям, причиной смерти старшего брата стала травма. Но у младшего брата сердечный приступ», — рассказал он (цитата по Milli.az). По словам Гасанова, «большое количество травм» выявлено при обследовании тела Гусейна Сафарова. У него обнаружили переломы ребер, которые повредили легкие, а также кровоизлияния в твердых и мягких тканях головы и кровоподтеки на слизистой оболочке верхней и нижней губ. rbc.group Эксперт утверждает, что «внутренние повреждения второго брата полностью совпадают с повреждениями первого». «Причиной смерти стал тяжелый посттравматический шок в связи с многочисленными травмами, которые он получил. <...> В России причиной смерти была показана сердечная недостаточность, но мы обнаружили совершенно другие широко распространенные повреждения», — заявил Гасанов (цитата по APA). rbc.group РБК обратился за комментарием в аппарат уполномоченного по правам человека в Российской Федерации и Следственный комитет России. В чем причина обострения между Россией и Азербайджаном Политика Братьев Сафаровых, владельцев ресторана «Каспий», задержали вместе с другими азербайджанцами в ходе рейда в Екатеринбурге 27 июня в рамках расследования дел об убийствах, совершенных в 2001, 2010 и 2011 годах. МИД Азербайджана заявил, что среди задержанных есть погибшие и раненые, и попросил привлечь к ответственности причастных к насилию. СК позже сообщил, что один из задержанных погиб, по предварительным данным, из-за сердечной недостаточности, а причины смерти второго устанавливаются. Уполномоченный по правам человека в России Татьяна Москалькова попросила Генпрокуратуру проверить «законность и обоснованность задержания, соблюдения прав подозреваемых в совершении преступлений и потерпевших по уголовному делу». Омбудсмен рассказала, что к ней обратилась азербайджанская коллега Сабина Алиева. Тела погибших передали азербайджанской стороне, а 30 июня доставили в Баку на экспертизу, по завершении которой отдали родным. 1 июля Сафаровых похоронили на кладбище в селе Гаджибадали Агджабединского района. МИД Азербайджана вызвал временного поверенного в делах посольства России в стране Петра Волоковых и выразил ему протест из-за рейдов, «в результате которых были зверски убиты двое азербайджанцев, несколько человек получили тяжелые ранения, а девять человек были арестованы». В российском МИДе объяснили, что задержания проводились в рамках расследования уголовных дел по факту «тяжких преступлений». В Кремле заявили, что действия правоохранительных органов не должны быть поводом для дипломатических демаршей. На этом фоне азербайджанская полиция 30 июня пришла в редакцию издания Sputnik (входит в российский медиахолдинг «Россия сегодня») в Баку. Несколько азербайджанских СМИ, в том числе Vesti.az, APA и Minval, со ссылкой на источники написали, что были задержаны два сотрудника «Sputnik Азербайджан» — агенты ФСБ России под прикрытием. После этого МИД России вызвал посла Азербайджана Рахмана Мустафаева из-за «недружественных действий Баку». Читайте РБК в Telegram.	9	\N	2025-07-01 12:45:03	2025-07-01 12:45:03
16	171	kak-rossiyane-budut-otdyhat-v-2026-godu-kalendar	Как россияне будут отдыхать в 2026 году. Календарь		В 2026 году новогодние каникулы будут длиться 12 дней. По три дня россияне отдохнут в феврале, марте, дважды в мае и в июне. Полный календарь выходных в 2026 году — в инфографике РБК.	6	\N	2025-07-01 12:45:03	2025-07-01 12:45:03
17	168	kak-razvivaetsya-konflikt-pashinyana-i-armyanskoy-apostolskoy-cerkvi	Как развивается конфликт Пашиняна и Армянской апостольской церкви	https://s0.rbk.ru/v6_top_pics/media/img/4/36/347512794066364.jpeg	Конфликт Армянской апостольской церкви и Никола Пашиняна, который тянется с 2020 года, возобновился и привел к столкновениям с силовиками и арестам архиепископов. РБК собрал хронологию конфликта Фото: РИА Новости Конфликт Армянской апостольской церкви (ААЦ) с премьер-министром Николом Пашиняном начался в 2020 году на фоне событий в Нагорном Карабахе. Тогда католикос всех армян Гарегин II (в миру Ктрич Нерсисян) после поражения во второй карабахской войне призвал премьера уйти в отставку. Так глава ААЦ стал политическим оппонентом Пашиняна. В апреле 2023 года Гарегин II назвал бессрочным свой призыв к Пашиняну об отставке, потому что ситуация в стране остается «опасной и тревожной». «Делаются неверные и неприемлемые заявления в отношении статуса Нагорного Карабаха. Беспокоят углубляющаяся разобщенность, нетерпение, дух нетерпимости нашего народа», — заявил католикос (цитата по «Sputnik Армения»). Премьер ответил, что церковь не может быть выше государства. «Если церковь хочет заниматься политической деятельностью, то Армения — демократическая страна и они могут создать политическую партию», — заявил Пашинян. Движение «Тавуш во имя родины» В апреле 2024 года Пашинян объявил о начале делимитации границы с Азербайджаном и решении передать Баку четыре села в Тавушской области. rbc.group Речь идет о селах Баганис-Айрус, Ашагы-Аскипара, Хейримлы и Гызылгаджылы, которые входили в Азербайджанскую ССР до 1990-х, но в результате первой карабахской войны перешли под контроль Армении. Тогда появилось протестное движение «Тавуш во имя родины» (позднее переименовано в «Священную борьбу»). Его лидером стал глава Тавушской епархии архиепископ Баграт (Вазген Галстанян). Пашинян, реагируя на протесты, заявил, что священнослужители ААЦ выступают в роли «агентов влияния». Архиепископ Баграт(Фото: Мелик Багдасарян / Photolure / Reuters) В начале мая архиепископ Баграт возглавил шествие движения из приграничного села Киранц в Ереван. Сторонники священнослужителя объявили о его выдвижении на пост премьера. Сам Баграт призвал Пашиняна уйти в отставку «мирно, без потрясений». 17 июня должно было пройти внеочередное заседание парламента для обсуждения отставки действующего правительства, но оно не состоялось. Обострение конфликта в 2025 году Новый виток конфликта начался в конце весны. 29 мая Пашинян заявил, что большинство церквей в стране используются как чуланы и завалены мусором. На следующий день с критикой в адрес ААЦ выступила и жена премьера, Анна Акопян. Она назвала Гарегина II «главным духовным мафиози страны», а его сторонников из духовенства — «чернорясыми маньяками». В ответ руководство ААЦ обвинило премьер-министра в «постыдной кампании» против церкви и призвало «компетентные госорганы пресечь эту незаконную и недальновидную политику». 9 июня Пашинян обвинил главу ААЦ в нарушении целибата и потребовал его отставки. 17 июня глава группы компаний «Ташир» Самвел Карапетян (Forbes оценивает его состояние в $3,2 млрд) выступил в защиту церкви. В тот же день в его доме прошли обыски. На следующий день бизнесмена обвинили в «публичных призывах к захвату власти» и арестовали. Брат Самвела Карапетяна Карен (в центре на первом плане) у дома бизнесмена в Ереване(Фото: РИА Новости) 24 июня Пашинян опубликовал материал портала Civic.am с данными о якобы готовящемся захвате власти в стране и назвал это «попыткой переворота мошенников». На следующий день СК Армении обвинил лидера движения «Священная борьба» архиепископа Баграта и его сторонников в подготовке терактов. Тогда же прошли задержания и обыски у участников организации. Руководство ААЦ выразило свою обеспокоенность и обвинило власти в антицерковной кампании. Video 26 июня Генпрокуратура Армении завела дело на главу Ширакской епархии ААЦ архиепископа Микаэла Аджапахяна. На следующий день его попытались задержать, но между силовиками и священниками произошли столкновения. Архиепископ заявил, что не собирался скрываться, и отправился в Следственный комитет. 28 июня его отправили под арест. Католикос всех армян Гарегин II и архиепископ Микаэл Аджапанян(Фото: РИА Новости)	3	\N	2025-07-01 12:45:03	2025-07-01 12:45:03
18	173	wp-uznala-kak-masku-dali-dostup-k-zakrytoy-informacii-konkurentov	WP узнала, как Маску дали доступ к закрытой информации конкурентов	https://s0.rbk.ru/v6_top_pics/media/img/5/62/347513574690625.jpeg	Издание утверждает, что Департамент эффективности государственного управления, который до недавнего времени возглавлял Маск, имел доступ к записям, содержащим коммерческие тайны частных компаний Илон Маск (Фото: Samuel Corum / Getty Images) Илон Маск во время управления Департаментом эффективности государственного управления (DOGE) мог получить доступ к конфиденциальной информации частных компаний, которую может использовать против конкурентов, пишет The Washington Post. Издание не обнаружило доказательств того, что DOGE неправомерно использовал правительственную информацию в интересах бизнес-империи Маска. Однако эксперты, опрошенные газетой, отмечают, что полученные сведения сохраняют ценность, поскольку могут помочь компаниям Маска выходить на новые рынки или получать госконтракты. Как установила газета, помощники DOGE получили практически неограниченный доступ к архивам Бюро финансовой защиты потребителей (CFPB). В этом агентстве хранятся данные об алгоритмах платежных систем, аналогичных тем, которые Маск планирует интегрировать в свою социальную платформу X. По словам экспертов и сотрудников, DOGE также имел доступ к информации о миллионах американских потребителей в Министерстве финансов, Управлении социального обеспечения и департаменте образования. rbc.group Сотрудники NASA сообщили, что представители DOGE могли просматривать внутренние оценки тысяч контрактов, включая те, что были заключены с конкурентами SpaceX. Сотрудники Министерства труда заявили, что помощникам DOGE было разрешено изучать любые записи агентства, включая десятки конфиденциальных расследований в отношении Tesla и других компаний Маска, а также их конкурентов. rbc.group «Ни одному человеку ранее не предоставлялся такой широкий доступ к системам данных бюро», — заявил Эри Мейер, бывший главный технолог CFPB. В интервью он и другие сотрудники охарактеризовали этот доступ как «уровень Бога». Илон Маск и президент США Дональд Трамп сблизились во время предвыборной кампании в прошлом году, в результате чего бизнесмен был назначен куратором DOGE. Вместе они проводили политику сокращения государственных расходов, однако в начале лета поссорились. Причиной разлада стала критика Маска налогового законопроекта Трампа. Миллиардер назвал его «безобразием», а также негативно высказывался о пошлинах президента и заявлял, что без него тот бы не выиграл выборы. Позднее Маск извинился за свои высказывания, а Трамп назвал его «замечательным парнем», который «немного огорчен». Однако к началу июля их ссора вновь начала разгораться — Трамп, в частности, предложил проверить деятельность Маска. Читайте РБК в Telegram.	3	\N	2025-07-01 12:45:04	2025-07-01 12:45:04
19	242	prokuratura-moldavii-poprosila-devyat-let-tyurmy-dlya-bashkana-gagauzii	Прокуратура Молдавии попросила девять лет тюрьмы для башкана Гагаузии	https://s0.rbk.ru/v6_top_pics/media/img/2/47/347513655866472.jpeg	Евгения Гуцул (Фото: Вадим Денисов / ТАСС) Гособивнение потребовало приговорить главу Гагаузии (регион Молдавии) Евгению Гуцул к девяти годам тюрьмы полузакрытого типа, передает Newsmaker. Дело касается нарушений при финансировании запрещенной в Молдавии партии «Шор» и нарушениях в управлении избирательным фондом на выборах весной 2023 года. Гуцул назвала дело сфабрикованным и политически мотивированным. Гуцул была задержана 25 марта в аэропорту Кишинёва, она намеревалась покинуть Молдавию. Примерно тогда же помощники главы Гагаузии попросили российского президента Владимира Путина применить «весь арсенал дипломатических, политических и правовых механизмов» для давления на власти Молдавии с целью «прекратить политические репрессии». Материал дополняется.	3	\N	2025-07-01 13:35:03	2025-07-01 13:35:03
263	793	reuters-soobshchil-chto-iran-gotovilsya-zaminirovat-ormuzskiy-proliv	Reuters сообщил, что Иран готовился заминировать Ормузский пролив	https://s0.rbk.ru/v6_top_pics/media/img/1/11/347514282758111.jpeg	Вскоре после начала израильских атак Иран погрузил на суда морские мины, готовясь заблокировать Ормузский пролив, один из самых загруженных в мире судоходных путей. Мины в итоге не установили, но где они сейчас, неясно Фото: Reuters Иран в разгар 12-дневной войны с Израилем готовился заминировать Ормузский пролив, сообщает Reuters со ссылкой на два источника, знакомые с данными американской разведки. Вскоре после того, как Израиль начал наносить удары по иранской территории, военные погрузили морские мины на суда в Персидском заливе. Это усилило опасения Вашингтона, что Тегеран всерьез намерен заблокировать один из самых загруженных в мире судоходных путей (через Ормузский пролив проходит пятая часть мировой нефти и сжиженного природного газа), что обострило бы конфликт и вызвало серьезные затруднения для мировой торговли. Мины не были установлены в проливе, но неясно, были ли они выгружены с судов, пишет Reuters. Со слов собеседников, в правительстве США не исключают, что действия Ирана были уловкой, предназначенной для Вашингтона, а на самом деле Тегеран не намеревался перекрывать проход. Агентство напоминает, что парламент Ирана поддержал блокировку вскоре после 22 июня, когда США атаковали три ядерных объекта в стране. Окончательное решение должен был принять Высший совет национальной безопасности Ирана, этого не произошло. rbc.group В Ормузском проливе суда стали передавать сообщения «российская нефть» Политика rbc.group На просьбу прокомментировать информацию о подготовке Ирана к минированию пролива представитель Белого дома сказал: «Благодаря блестящему проведению операции «Полуночный молот», успешной кампании против хуситов и кампании максимального давления Ормузский пролив остается открытым, свобода судоходства восстановлена, а Иран значительно ослаблен». Ормузский пролив соединяет Персидский и Оманский заливы в Аравийское море. Он находится между Ираном и Оманом и в основном относится к территориальным водам этих двух стран. Входящие в ОПЕК Саудовская Аравия, ОАЭ, Кувейт и Ирак экспортируют большую часть своей сырой нефти через пролив, в основном в Азию. Через него проходят и сочти все поставки сжиженного природного газа из Катара, одного из крупнейших в мире экспортеров. Блокировка этого пути привела бы к резкому росту мировых цен на энергоносители, пишет Reuters. По оценкам иранских экспертов, стоимость нефти может подскочить до $250 за баррель. МИД Ирака предупреждал о возможной потере примерно 5 млн баррелей нефти в день из Персидского залива и Ирака и к росту цен до $200–$300 за баррель. Читайте РБК в Telegram.	7	\N	2025-07-02 08:05:02	2025-07-02 08:05:02
416	993	politico-uznala-chto-britaniya-i-frg-zaklyuchat-pakt-s-punktom-ob-oborone	Politico узнала, что Британия и ФРГ заключат пакт с пунктом об обороне		Договор будет включать пункт о рассмотрении угрозы одной стороне как угрозы и другой, что позволит сотрудничать теснее, чем в рамках схожего положения соглашения о НАТО. Там есть также пункты о миграции, науке и так далее В ближайшие недели Великобритания и Германия подпишут всеобъемлющий договор о сотрудничестве, который включает пункт о взаимопомощи в обороне, рассказали источники Politico. Основы для соглашения заложены в совместной декларации о более близком сотрудничестве в области экономики и безопасности, документ был подписан прошлым летом. Теперь, после 18 раундов переговоров, близок к готовности полноценный договор. Он может быть заключен 17 июля. Положение об обороне развивает соглашение прошлого года «Тринити Хаус», в котором стороны условились считать любую стратегическую угрозу для одного государства угрозой и для другого. Хотя это созвучно пункту Североатлантического договора, за счет внесения в двустороннее соглашение этого положения сотрудничество между двумя странами будет теснее, отмечает издание. rbc.group Помимо обороны в документе будут обговорены меры по борьбе с нелегальной миграцией, развитию транспорта, научных исследований и инноваций. rbc.group Представитель МИД Германии подчеркнул, что «договор охватит весь спектр» отношений королевства и республики. В британском ведомстве на запрос Politico не ответили. Германия усилила контроль в Балтийском море для борьбы с теневым флотом Политика В мае президент Франции Эмманюэль Макрон и канцлер Германии Фридрих Мерц договорились создать франко-немецкий совет по обороне и безопасности, в рамках которого будут «совместно реагировать на вызовы, с которыми сталкивается Европа». Мерц отмечал, что будет обсуждать сотрудничество с Францией и Британией в области ядерного сдерживания, что станет «дополнением» к обязательствам со стороны США в НАТО. В конце июня глава блока Христианско-демократического и Христианско-социального союзов (ХДС/ХСС, в него входит Мерц) в бундестаге Йенс Шпан отметил, что Германия должна получить доступ к ядерному оружию Британии и Франции или создать европейский «ядерный зонтик», так как размещения в ФРГ американских ядерных ракет недостаточно в долгосрочной перспективе. Читайте РБК в Telegram.	2	\N	2025-07-02 08:55:03	2025-07-02 08:55:03
417	1025	ssha-usilyat-politiku-lisheniya-grazhdanstva-za-prestupleniya	США усилят политику лишения гражданства за преступления		Минюст США активнее будет заводить дела о лишении гражданства против уличенных в преступлениях — терроризме, пытках, насилии, мошенничестве, а также любых других, которые будут считаться «достаточно важными для рассмотрения» США решили уделить приоритетное внимание денатурализации граждан с приобретенным гражданством, совершившим преступления, говорится в меморандуме Минюста страны. «Преимущества лишения гражданства включают возможность государства отозвать гражданство у лиц, совершивших военные преступления, внесудебные убийства или другие серьезные нарушения прав человека; удалять натурализованных преступников, членов банд или любые лица, осужденные за преступления, которые представляют постоянную угрозу для США; а также предотвращать возвращение осужденных террористов на территорию США или их международные поездки по американскому паспорту», — сказано в документе. Минюст намерен заводить дела о денатурализации во всех случаях, когда это позволяет закон и когда имеются доказательства. rbc.group В числе преступлений, за совершение которых может грозить лишение гражданства, названы: rbc.group преступления, создающие угрозу национальной безопасности: терроризм, шпионаж и т.д.; военные преступления, совершение пыток и т.п.; пособничество преступным группировкам, транснациональным преступным организациям и наркокартелям; торговля людьми, сексуальные или насильственные преступления; финансовые махинации в отношении США и мошенничество; получение гражданства коррупционным путем; а также «любые другие дела, переданные в гражданский отдел, [рассматривающий дела по натурализации], которые отдел считает достаточно важными для рассмотрения». Трамп посетил окруженный аллигаторами изолятор для мигрантов Политика The Washington Post отмечает, что возможность денатурализации в США за преступления существует давно, но такие случаи были редкостью. В прошлом правительство применяло эту практику в отношении совершивших военные преступления, в частности бывших нацистов. За 199–-2017 годы было возбуждено около 300 таких дел. Кроме того, внимание уделяли тем, кто получил гражданство по поддельным документам, предоставив фальшивые сведения и т.д. Во время первого срока президента Дональда Трампа власти также пытались приоритизировать дела по натурализации, но им не хватало ресурсов. Теперь президент вновь декларирует ужесточение иммиграционной политики и идет на другие меры — например, во Флориде открыли центр для задержанных мигрантов среди водно-болотных угодий, в которых обитают аллигаторы и питоны. Читайте РБК в Telegram.	5	2025-07-02 16:45:35	2025-07-02 09:15:04	2025-07-02 16:45:35
423	1156	mid-ocenil-prichiny-pretenziy-azerbaydzhana-k-zhurnalistam-v-baku	МИД оценил причины претензий Азербайджана к журналистам в Баку		У Азербайджана не было претензий к местному Sputnik как к СМИ, нынешние действия в отношении редакции и журналистов, двое из которых арестованы, связаны с «другими соображениями», заявила Захарова Российская сторона ранее не получала претензий к работе издания Sputnik в Азербайджане, сейчас меры в отношении него принимаются «исходя из других соображений», заявила представитель МИД России Мария Захарова радио Sputnik. «Никогда никаких претензий к этому средству массовой информации ни по форме, ни по содержанию у азербайджанской стороны не было. <...> И на данном этапе как к средству массовой информации, так и к журналистам не было никаких претензий. <...> Очевидно, что это меры, которые предпринимаются исходя из других соображений», — подчеркнула дипломат. По ее словам, в СМИ работали граждане и Азербайджана, и России. Нынешняя ситуация «не привносит» в двусторонние отношения, а ухудшает их, отметила Захарова. Об этом было заявлено послу Азербайджана в Москве Рахману Мустафаеву, которому также «был сделан жесткий демарш». rbc.group Также Захарова полагает, что на фоне текущего конфликта между сторонами есть «немало тех, кто хочет на этом просто нагреть руки, — пусть только не обожгутся». rbc.group В Азербайджане арестовали восьмерых россиян по делу о транзите наркотиков Политика Напряженность в отношениях России и Азербайджана возникла после того, как в Екатеринбурге провели задержания представителей азербайджанской диаспоры по делам об убийствах и покушении на убийство в 2001, 2010 и 2011 годах. Во время следственных мероприятий два подозреваемых скончались. Российский СК отметил, что один из них умер от сердечной недостаточности. Но Баку утверждает, что они скончались от посттравматического шока, развившегося на фоне множественных травм. В Екатеринбурге арестованы шесть фигурантов дела. Вслед за этим в Баку был проведен рейд силовиков на редакцию Sputnik, были задержаны и арестованы журналисты, среди них — исполнительный директор Sputnik Игорь Картавых и шеф-редактор Евгений Белоусов. С 30 июня на сайте не публикуются новости. МВД Азербайджана возбудило уголовное дело по статьям о мошенничестве, незаконном предпринимательстве и легализации имущества, приобретенного преступным путем. Кроме того, 1 июля Азербайджан объявил о задержании еще нескольких групп россиян. Граждан России обвиняют в транзите наркотиков из Ирана и киберпреступлениях. Читайте РБК в Telegram.	9	\N	2025-07-02 10:35:03	2025-07-02 10:35:03
20	251	durov-otvetil-snup-doggu-na-slova-chto-nuzhno-sbavit-oboroty-s-detmi	Дуров ответил Снуп Доггу на слова, что нужно «сбавить обороты» с детьми	https://s0.rbk.ru/v6_top_pics/media/img/8/53/347513632009538.jpeg	В прошлом году основатель Telegram заявлял, что 15 лет назад стал донором спермы и теперь у него более ста биологических детей. Американский рэпер Снуп Догг написал в X, что Дурову нужно «сбавить обороты» Павел Дуров (Фото: Durov / Telegram) Основатель мессенджера Telegram Павел Дуров, который ранее сообщил, что у него более 100 биологических детей, отреагировал на слова американского рэпера Снуп Догга, посоветовавшего ему притормозить с рождением детей. «Йо, Дуров. Слышал, у тебя теперь 106 детей? Пацан, у тебя нет детей, ты плодишь выводки щенков. Сбавь обороты», — написал рэпер в X, добавив тэг #PuppyLove. «Снуп Догг, нужно быть собакой, чтобы понять собаку, я могу дать вам несколько советов. Лучше всего обсудить это там, где конфиденциальность является королем. Я напишу вам в TG», — ответил Дуров. rbc.group Дурову разрешили уезжать из Франции на две недели только в один город Политика rbc.group В июле 2024 года Дуров заявил, что 15 лет назад стал донором спермы и теперь у него более ста биологических детей в 12 странах. Год спустя, в июне 2025-го, основатель Telegram сообщил, что составил завещание в связи с рисками, связанными с работой. По его словам, дети не получат доступа к его состоянию «до истечения 30-летнего периода, начинающегося сегодня». Состояние Дурова оценивается Forbes в $17,1 млрд, он 134-й в списке богатейших людей планеты и восьмой среди российских бизнесменов (сам он себя российским предпринимателем не считает). В 2024 году Telegram получил первую годовую прибыль — $540 млн. Читайте РБК в Telegram.	10	\N	2025-07-01 13:35:03	2025-07-01 13:35:03
21	243	rossiyane-nazvali-dohod-dlya-normalnoy-zhizni	Россияне назвали доход для «нормальной жизни»	https://s0.rbk.ru/v6_top_pics/media/img/4/31/347513650930314.jpeg	Россиянам для «нормальной жизни» в среднем достаточно дохода 81 тыс. руб. в месяц, следует из проведенного НИУ ВШЭ исследования. С прошлой осени представления граждан о «нормальном» доходе увеличились на 14% Фото: Андрей Любимов / РБК Россиянам по данным на осень 2024 года для «нормальной жизни» в среднем было достаточно дохода 81 тыс. руб. на человека в месяц, говорится в очередном выпуске «Барометра экономического поведения домохозяйств в России», подготовленном НИУ ВШЭ (есть у РБК). За прошедший год показатель вырос на 14%. Согласно исследованию, осенью 2023 года средний размер дохода, который россияне считали достаточным для «нормальной» жизни, составлял 70,8 тыс. руб. Медиана «нормального» дохода к осени прошлого года увеличилась на 20%, до 60 тыс. руб. Для почти трех четвертей россиян величина «нормального» дохода варьируется от 30 до 100 тыс. руб. на человека в месяц: около трети респондентов считают достаточной ежемесячную сумму в диапазоне от 30 до 50 тыс. руб. на человека, еще четверть — от 70 до 100 тыс. руб. rbc.group Минтруд впервые ранжировал вузы по трудоустройству и зарплате выпускников Общество rbc.group С осени 2023-го по осень 2024-го больше всего представления о «нормальном» доходе выросли у: людей в возрасте 25-34 лет и 45-54 лет (+22-23%); семей с детьми до 18 лет (+25%); семей с высоким потребительским статусом (+24-26%); жителей Уральского и Южного федеральных округов (+28- 29%); жителей средних и крупных городов — от 100 тыс. до 1 млн чел. (+18%). Доход, достаточный для «нормальной» жизни, отражает представления о сумме, позволяющей человеку и его семье поддерживать желаемый потребительский стандарт. В сравнении с фактическим доходом и/или текущими расходами он косвенно характеризует восприятие населением собственного материального благополучия. Опрос «Экономическое поведение домашних хозяйств» НИУ ВШЭ проводит с июня 2023 года методом личного интервью. Авторы исследования отмечают, что представления о «нормальном» доходе соотносятся с величиной среднедушевых доходов в регионе, где живет респондент. Более высокий доход считают необходимым для «нормальной» жизни мужчины, нежели женщины. Материальные запросы также выше у молодежи и людей среднего возраста, жителей крупных городов, респондентов с высшим образованием и тех, кто занят своим бизнесом. Жители Москвы и Санкт-Петербурга, в частности, считают, что «нормально» жить позволяет доход в среднем около 110 тыс. руб. на человека, что на треть выше среднероссийского значения. По итогам 2024 года средняя заработная плата в России составила 87 952 руб. в месяц, увеличившись на 18,3% в номинальном выражении, сообщал Росстат. Самые высокие ежемесячные выплаты оказались на Чукотке — 185 тыс. руб., в Ямало-Ненецком автономном округе — 164 тыс. руб. и в Москве — 162 тыс. руб. Читайте РБК в Telegram.	1	\N	2025-07-01 13:35:03	2025-07-01 13:35:03
22	290	kreml-schel-emocionalnoy-reakciey-zaderzhanie-zhurnalistov-v-baku	Кремль счел «эмоциональной реакцией» задержание журналистов в Баку	https://s0.rbk.ru/v6_top_pics/media/img/7/09/347513654110097.jpeg	Дмитрий Песков (Фото: Михаил Гребенщиков / РБК) Москва внимательно относится к информации о задержании российских журналистов в Баку и рассчитывает в «самое ближайшее время» добиться их освобождения в ходе прямых контактов с азербайджанской стороной, заявил пресс-секретарь президента России Дмитрий Песков, передает корреспондент РБК. Так Песков ответил на вопрос, планируются ли в связи с сложившейся ситуацией контакты Москвы и Баку на высшем уровне. Он отметил, что подобные меры в отношении представителей СМИ «абсолютно не соответствуют общепринятым правилам и нормам и, конечно же, не соответствуют духу и характеру российско-азербайджанских отношений». «Мы считаем, что все-таки вот эта эмоциональная, чрезвычайно эмоциональная реакция сменится непосредственно прямым общением, в ходе которого будут даны ответы на все поставленные вопросы», — сказал Песков, отвечая на вопрос о том, видят ли в Кремле риски эскалации в отношениях с Азербайджаном. rbc.group 30 июня азербайджанская полиция пришла в редакцию издания Sputnik (входит в российский медиахолдинг «Россия сегодня») в Баку. Minval сообщил о задержании главы редакции Sputnik Игоря Картавых и шеф-редактора Евгения Белоусова. Minval и несколько других азербайджанских СМИ со ссылкой на источники написали, что были задержаны два сотрудника «Sputnik Азербайджан» — агенты ФСБ России под прикрытием. rbc.group МИД России вызвал посла Азербайджана в связи с «недружественными действиями» Баку. Песков уточнил, что «речь идет именно о журналистах». 1 июля агентство APA сообщило, что МВД Азербайджана после операции в редакции «Sputnik Азербайджан» возбудило уголовное дело о мошенничестве, незаконном предпринимательстве и легализации имущества, приобретенного преступным путем. По этому делу задержаны семь человек, двое арестованы, пишет агентство. В феврале 2025 года Баку решил приостановить деятельность агентства, чтобы добиться паритета в деятельности госмедиа Азербайджана за рубежом и иностранных журналистов в стране. По словам пресс-секретаря МИД страны Айхана Гаджизаде, агентство может получить аккредитацию только на одного корреспондента. Однако «Sputnik Азербайджан» не выполнил это решение и продолжил работать, писало издание Qafqazinfo.  Материал дополняется.	7	\N	2025-07-01 14:05:03	2025-07-01 14:05:03
23	298	miratorg-otvetil-azerbaydzhanu-na-unichtozhenie-partii-lukovyh-kolec	«Мираторг» ответил Азербайджану на уничтожение партии луковых колец	https://s0.rbk.ru/v6_top_pics/media/img/7/72/347513627619727.jpeg	«Мираторг» не выявил несоответствия нормам пищевой безопасности в продукции «Мираторг Запад». Ранее Агентство по продовольственной безопасности Азербайджана сообщило об уничтожении партии луковых колец из-за патогенных бактерий Фото: Сергей Булкин / NEWS.ru / РБК Проведенное на предприятии «Мираторг Запад» внутреннее расследование не выявило отклонений от санитарных нормативов и несоответствий санитарным требованиям технических регламентов Таможенного союза поставленной в Азербайджан партии замороженных луковых колец, сообщили РБК в компании «Мираторг». Проверка была начата после того, как Агентство продовольственной безопасности Азербайджана (АПБА) заявило, что в поступившей из России партии замороженных луковых колец были обнаружены патогенные микроорганизмы. По этой причине была уничтожена 639-килограммовая партия луковых колец, сообщало Media.az. В Азербайджане уничтожили партию луковых колец из России Общество rbc.group «В результате исследований, согласно протоколам лабораторных испытаний готовой продукции по показателям безопасности в аккредитованном испытательном центре ФГБНУ «ВНИРО» (ЛЦ «АтлантНИРО»), отклонений не выявлено», — сообщили РБК в компании. rbc.group В «Мираторге» отметили, что в 2025 году продукция предприятия «Мираторг Запад» поставлялась в целый ряд стран, включая Белоруссию, Казахстан, Ирак, Киргизию, Молдавию, Армению, Грузию, Абхазию и другие государства. Однако ни в одном случае не было выявлено никаких несоответствий продукции нормам пищевой безопасности. Отношения Москвы и Баку обострились в конце июня, после того как в России прошли массовые задержания азербайджанцев. МИД Азербайджана выразил России «решительный протест», заявив о погибших и пострадавших после рейдов. Российское внешнеполитическое ведомство заявило о «недружественных действиях» азербайджанской стороны в ответ на задержания российских журналистов в Баку. Читайте РБК в Telegram.	5	\N	2025-07-01 14:05:04	2025-07-01 14:05:04
24	295	kreml-zayavil-ob-otsutstvii-interesa-k-zatyagivaniyu-peregovorov-s-ukrainoy	Кремль заявил об отсутствии интереса к затягиванию переговоров с Украиной	https://s0.rbk.ru/v6_top_pics/media/img/8/65/347513653971658.jpeg	Россия заинтересована в достижении своих целей, но не затягивает ход переговорного процесса с Украиной, заявил Песков. Зеленский связывал позицию российской стороны с попыткой отсрочки санкций Дмитрий Песков (Фото: Михаил Гребенщиков / РБК) Третий раунд переговоров российской и украинской делегаций состоится, когда будут выполнены все достигнутые ранее гуманитарные договоренности, заявил пресс-секретарь президента России Дмитрий Песков, передает корреспондент РБК. «Здесь как раз никто ничего не затягивает. Мы, естественно, заинтересованы в первую очередь в том, чтобы добиться достижения поставленных целей и целей, которые мы пытаемся достигнуть в ходе специальной военной операции политико-дипломатическими средствами, поэтому мы не заинтересованы в том, чтобы что-то затягивать», — сказал Песков. Пресс-секретарь президента отметил, что до сих пор выполнялись договоренности, достигнутые в ходе второго раунда российско-украинских переговоров. «Ну а дальше надо просто собираться. Когда договорятся, будут выполнены все предыдущие гуманитарные договоренности, соберутся и будут дальше уже обсуждать», — сказал он. rbc.group Ранее Песков говорил, что продвижение процесса мирного урегулирования на Украине зависит от поведения Киева и эффективности действий Вашингтона. Специальный посланник президента США Кит Келлог в ответ заявил, что утверждения о затягивании мирных переговоров США и Украиной не имеют оснований. Он также призвал к немедленному прекращению огня и переходу к трехсторонним переговорам и мире. rbc.group «Безусловно, мы признательны за те усилия, которые прикладывает Вашингтон и члены команды Трампа, с тем чтобы способствовать переговорам по украинскому урегулированию», — указал пресс-секретарь российского президента. Путин заявил о готовности России к третьему раунду переговоров с Украиной Политика Россия и Украина возобновили переговоры, проведя в Стамбуле две встречи — 16 мая и 2 июня. Во время второго переговорного раунда стороны обменялись меморандумами с предложениями по прекращению огня. Владимир Путин назвал эти документы абсолютно противоположными друг другу, но отметил, что для поиска пути решения и нужны переговоры. «В целом мы к этому готовы. Нужно согласовать место, время», — говорил российский президент. Украинский президент Владимир Зеленский счел инициативу российской стороны о проведении нового раунда переговоров потенциальной попыткой отсрочить экономические санкции. «Русские точно будут затягивать «Стамбул», чтобы откладывать санкции и так далее. А мы окажемся в действительно сложной ситуации выбора: продолжать вот так или идти по другому пути», — говорил он. Практическим итогом стамбульских встреч стали обмены военнопленными, в том числе тяжелоранеными и теми, кто моложе 25 лет, и телами погибших бойцов. В июне, в частности, Россия передала Украине останки свыше 6 тыс. человек. Очередной обмен пленными состоялся 20 июня, а также, как рассказал источник РБК в переговорной группе, продолжились «санитарные обмены ранеными». Читайте РБК в Telegram.	9	\N	2025-07-01 14:05:04	2025-07-01 14:05:04
25	306	baku-nazval-ugolovnye-stati-po-kotorym-zaderzhali-rossiyskih-zhurnalistov	Баку назвал уголовные статьи, по которым задержали российских журналистов	https://s0.rbk.ru/v6_top_pics/media/img/4/98/347513673914984.jpeg	Фото: Мурад Оруджев / Sputnik / РИА Новости Азербайджанские полицейские провели в бакинском офисе «Sputnik Азербайджан» (филиал информационного агентства «Россия Сегодня») «оперативно-разыскные мероприятия», в результате которых были задержаны семь человек, сообщает агентство APA. Возбуждено уголовное дело по статьям о мошенничестве, незаконном предпринимательстве и легализации имущества, приобретенного преступным путем. Двое из семи задержанных арестованы, остальные пять человек привлечены к уголовной ответственности, сообщает APA. Азербайджанская полиция пришла в редакцию Sputnik 30 июня. В МВД заявили о проведении проверки по факту того, что бакинское отделение «Россия сегодня» продолжает свою деятельность «на основе незаконного финансирования, несмотря на приостановление его аккредитации в феврале 2025 года». На тот момент было известно о задержании двух российских журналистов — главы редакции Sputnik Игоря Картавых и шеф-редактора Евгения Белоусова. rbc.group В феврале представитель МИД Азербайджана Айхан Гаджизаде сообщил, что власти упразднили «Sputnik Азербайджан» и теперь представительство может получить аккредитацию в стране только на одного корреспондента. Представитель российского МИДа Мария Захарова тогда указала, что Москва поддерживает с Баку диалог по этому очень важному вопросу и доносит до него свою позицию. В мае Minval писало, что сотрудники агентства «по-прежнему получают зарплату, посещают мероприятия и уверенно заявляют, что ждут скорого восстановления полноценной работы». rbc.group МИД России «в связи с недружественными действиями Баку и незаконным задержанием журналистов» вызвал посла Азербайджана. На Смоленский бульвар Рахман Мустафаев прибыл сегодня, однако от комментариев журналистам отказался. Материал дополняется	1	\N	2025-07-01 14:15:02	2025-07-01 14:15:02
26	386	v-baku-soobshchili-o-likvidacii-dvuh-opg-s-uchastiem-rossiyan	В Баку сообщили о ликвидации двух ОПГ с участием россиян		В Баку обезвредили две организованные преступные группы (ОПГ) с участием россиян, пишет Report.az.  Их подозревают в транзите наркотиков из Ирана, онлайн-торговле запрещенными веществами и кибермошенничестве.  Накануне в редакцию издания Sputnik в Азербайджане пришла полиция, задержаны семь человек, двое арестованы. После этого МВД страны возбудило дело о мошенничестве, незаконном предпринимательстве и легализации имущества, приобретенного преступным путем. Материал дополняется	5	\N	2025-07-01 15:05:06	2025-07-01 15:05:06
1158	2649	politico-uznalo-o-podgotovke-razgovora-trampa-i-zelenskogo	Politico узнало о подготовке разговора Трампа и Зеленского		Звонок состоится «очень скоро», сообщило Politico. По его данным, Пентагон, принимая решение заморозить поставки части оружия, не консультировался с Госдепом, посольством в Киеве и командой Келлога. Белый дом это отрицает США и Украина работают над организацией телефонного разговора между президентами Дональдом Трампом и Владимиром Зеленским на фоне приостановки поставок Киеву зенитных ракет, сообщает Politico со ссылкой на два источника. Европейский дипломат, знакомый с ситуацией, сообщил, что беседа должна состояться «очень скоро». «США говорят, что это не пауза, не приостановка. США все еще пытаются решить, как лучше всего поддержать украинскую оборону. Это по-прежнему приоритет», — заверил он. Решение Пентагона заморозить передачу некоторых видов вооружений стало неожиданностью не только для ключевых европейских союзников, но и для некоторых сотрудников Госдепартамента США и конгрессменов, которые обычно хорошо осведомлены о подобных вопросах, сообщили изданию шесть источников. По словам собеседников, Минобороны США не согласовывало свои действия с Госдепом и не консультировалось с посольством США в Киеве или командой спецпредставителя президента Кита Келлога, прежде чем заморозить поставки партии оружия, которая уже находилась в Польше (NBC сообщал, что речь в том числе о перехватчиках для систем Patriot, ракетах Stinger, 155-мм снарядов для гаубиц, поставки которых были обещаны еще при экс-президенте Джо Байдене). rbc.group Bloomberg узнал реакцию НАТО на паузу в поставках оружия США Украине Политика rbc.group Член палаты представителей Майкл Маккол (республиканец от Техаса) усомнился, что вопрос обсуждали с госсекретарем Марко Рубио. «В Белом доме есть внутренние разногласия», — отметил он. Республиканец Брайан Фицпатрик попросил Белый дом и Минобороны провести брифинг, чтобы прояснить ситуацию. И Белый дом, и Госдеп отрицают, что решение застало врасплох членов администрации. «Это ложь», — сказал неназванный представитель Белого дома. По его словам, президент Дональд Трамп и чиновники ожидают, что «Минобороны будет регулярно пересматривать распределение помощи, чтобы убедиться, что оно соответствует программе «Америка прежде всего». Представитель Госдепа Тэмми Брюс заявила, что о полной приостановке поставок помощи Украине речи не идет. С ее слов, Киев был уведомлен о решении: «Такой разговор, очевидно, имел место из-за важности Украины для США». Зеленский накануне сообщил в видеообращении, что представители США и Украины уточняют детали по поставке оборонной поддержки, включая компоненты ПВО. «Так или иначе мы должны обеспечить защиту для наших людей», — сказал он. Читайте РБК в Telegram.	9	\N	2025-07-03 10:05:01	2025-07-03 10:05:01
59	403	advokat-nazval-raspravoy-prigovor-timuru-ivanovu	Адвокат назвал расправой приговор Тимуру Иванову	https://s0.rbk.ru/v6_top_pics/media/img/0/19/347513736548190.jpeg	Суд по делу Тимура Иванова в Московском городском суде, 1 июля 2025 года (Фото: Александр Щербак / ТАСС) Приговор экс-замминистра обороны Тимура Иванова, которого осудили на 13 лет, можно назвать расправой, заявил РБК его адвокат Мурад Мусаев. «Знаете, есть такое понятие как «внесудебная расправа». На мой взгляд, это тоже расправа, только судебная», — прокомментировал приговор Мусаев. Тяжесть приговора Мусаев оценивает как «показательную экзекуцию», а ее исполнители, по мнению адвоката, не сумели доказать причастность Иванова к вменяемым ему преступлениям. rbc.group Оглашение приговора состоялось 1 июля в здании бывшей богадельни Евангелического попечительства о бедных в связи с ремонтом в здании Мосгорсуда. Иванова осудили по двум эпизодам растраты в особо крупном размере и легализации преступных доходов. Помимо реального срока, его лишили звания заслуженного строителя России и назначили штраф в 100 млн руб. rbc.group Материал дополняется	10	\N	2025-07-01 15:50:10	2025-07-01 15:50:10
60	402	protiv-yuriya-dudya-vozbudili-ugolovnoe-delo	Против Юрия Дудя возбудили уголовное дело	https://s0.rbk.ru/v6_top_pics/media/img/9/74/347513727050749.jpeg	Уголовное дело заведено по статье о неисполнении обязанностей иноагента. Оно было инициировано прокуратурой Юрий Дудь (Фото: Владимир Жабриков / URA.ru / ТАСС) Против журналиста и блогера Юрия Дудя (Минюст признал его иноагентом) возбуждено уголовное дело, сообщает Следственный комитет. Он подозревается в совершении преступления, предусмотренного ч. 2 ст. 330.1 УК РФ (уклонение от исполнения обязанностей, предусмотренных законодательством об иностранных агентах). Уголовное дело инициировала прокуратура, указавшая, что Дудь в течение года был дважды привлечен к административной ответственности за нарушение порядка деятельности иностранного агента, но продолжал публикацию материалов без соответствующей маркировки. YouTube-канал Дудя насчитывает свыше 10 млн подписчиков. После присвоения статуса иноагента Дудь неоднократно привлекался к административной ответственности за отсутствие соответствующей маркировки в публикациях. В августе 2024 года Таганский суд Москвы назначил журналисту штраф в размере 40 тысяч руб. В феврале 2025 года Кузьминский районный суд Москвы оштрафовал его на 40 тыс. руб.по аналогичной статье. В апреле того же года Таганский суд вновь назначил штраф в размере 45 тыс. руб.	4	\N	2025-07-01 15:50:10	2025-07-01 15:50:10
61	407	v-rezultate-ataki-vsu-na-izhevsk-pogibli-tri-cheloveka-desyatki-raneny	В результате атаки ВСУ на Ижевск погибли три человека, десятки ранены		В результате атаки дрона на предприятие в Ижевске погибли три человека, 35 госпитализированы, десять из них — в тяжелом состоянии, сообщил Бречалов. Об атаке он рассказал утром, позже добавив, что после атаки возникло возгорание Video В результате атаки дрона на промышленное предприятие в Ижевске погибли три человека, 35 госпитализированы, сообщил глава Удмуртии Александр Бречалов. Глава региона посетил пострадавших в больнице. «Десять из них находятся в тяжелом состоянии. Всем наши доктора оказывают помощь, в том числе консультируются с коллегами из федерального центра», — сообщил он. Бречалов добавил, что доложил о ситуации президенту России Владимиру Путину, тот выразил соболезнования семьям погибших и пожелал пострадавшим скорейшего выздоровления. Украинские беспилотники атаковали промышленное предприятие в Ижевске утром 1 июля. Бречалов сообщал о том, что на предприятии возникли очаги возгораний, сотрудников эвакуировали. rbc.group После атаки администрация Ижевска сообщила об отмене массовых мероприятий на 1–2 июля. В городе открыли горячую линию для получения информации о пострадавших: +7 (3412) 69-35-10. Губернатор — о погибших при атаке ВСУ на Ижевск. Видео Политика Ижевск не впервые попадает под атаку дронов. В ноябре прошлого года в заводском цехе произошел взрыв из-за падения беспилотника. Пострадал один человек. Его госпитализировали с травмой головы средней степени тяжести. Персонал эвакуировали. Это был первый случай, когда власти сообщили о падении беспилотника в Удмуртии с начала военной операции на Украине. Читайте РБК в Telegram.	8	\N	2025-07-01 15:50:10	2025-07-01 15:50:10
62	405	poslu-azerbaydzhana-vruchili-notu-s-trebovaniem-osvobodit-zhurnalistov	Послу Азербайджана вручили ноту с требованием освободить журналистов	https://s0.rbk.ru/v6_top_pics/media/img/2/94/347513721820942.jpeg	Послу Азербайджана Мустафаеву вручена вербальная нота с требованием немедленного освобождения задержанных в Баку российских журналистов. Ему также заявлен протест из-за действий, направленных на «демонтаж двусторонних отношений» Рахман Мустафаев (слева) (Фото: Алексей Майшев / РИА Новости) Посол Азербайджана в России Рахман Мустафаев прибыл в МИД, где ему был заявлен протест из-за «недружественных действий». Ему также вручили вербальную ноту с требованием немедленного освобождения задержанных российских журналистов, сообщила пресс-служба российского дипломатического ведомства. В здании МИД с послом встретился замминистра иностранных дел России Михаил Галузин. Основанием для протеста российское ведомство указало «последние недружественные действия Баку», а также «сознательные шаги азербайджанской стороны по демонтажу двусторонних отношений». МИД указал на развязанную в азербайджанских СМИ «русофобскую кампанию», а также на «возмутительные, неприемлемые действия» азербайджанских правоохранительных органов против информагентства «Sputnik Азербайджан» и его сотрудников. Азербайджанская полиция пришла в редакцию «Sputnik Азербайджан» (филиал информационного агентства «Россия сегодня») 30 июня. В МВД заявили, что проводили «оперативно-разыскные мероприятия». В результате были задержаны семь человек, двое арестованы. Возбуждено уголовное дело по статьям о мошенничестве, незаконном предпринимательстве и легализации имущества, приобретенного преступным путем., сообщало азербайджанское МВД. rbc.group Кроме того, как напомнил МИД, азербайджанская сторона отменила мероприятия высокого уровня в рамках межгосударственного диалога, а также все культурные мероприятия с участием исполнителей из России, в том числе детских творческих коллективов. rbc.group «Главе дипломатической миссии Азербайджана была вручена вербальная нота с требованием немедленного освобождения из-под стражи задержанных в Баку российских журналистов И.Н.Картавых и Е.В.Белоусова», — говорится в сообщении МИД. В чем причина обострения между Россией и Азербайджаном Политика Отдельно в министерстве прокомментировали ситуацию с недавним задержанием в Екатеринбурге россиян, выходцев из Азербайджана. Следственные действия, предпринятые российскими правоохранителями, «осуществлялись в полном соответствии с законодательством России» в рамках расследования уголовных дел по факту совершенных в предыдущие годы «тяжких преступлений на территории Российской Федерации, в том числе против граждан Азербайджана», указали в МИД. «По информации компетентных органов, попытки Баку обвинять российские правоохранительные органы в превышении полномочий являются вмешательством во внутренние дела России», — заявили в МИД, указав, что подробную информацию на этот счет представил Следственный комитет. Отношения Москвы и Баку обострились именно после того, как в Екатеринбурге прошли массовые задержания в рамках дела о заказных убийствах. МИД Азербайджана выразил России «решительный протест», заявив о погибших и пострадавших в ходе рейдов, а также потребовал привлечь к ответственности «виновных в этом неприемлемом насилии». В российском СК указали, что один из задержанных фигурантов дела умер, по предварительным данным, из-за сердечной недостаточности, причины смерти второго устанавливаются. Читайте РБК в Telegram.	1	\N	2025-07-01 15:50:12	2025-07-01 15:50:12
63	450	v-nizhegorodskoy-oblasti-razbilsya-su-34	В Нижегородской области разбился Су-34	https://s0.rbk.ru/v6_top_pics/media/img/9/77/347513710847779.jpeg	Пилоты живы, борт упал в безлюдной местности Штурмовик Су-25 (Фото: Виктор Толочко / Sputnik / РИА Новости) Истребитель-бомбардировщик Су-34 разбился в Нижегородской области во время выполнения планового учебно-тренировочного полета, сообщило Минобороны. Экипаж жив. «При заходе на посадку произошел отказ системы выпуска одной из стоек шасси. Экипаж провел несколько попыток по устранению неисправности в полете, однако ситуация не изменилась. По команде руководителя полетов экипаж вывел самолет в безопасную зону и катапультировался», — рассказали в министерстве. Полет выполнялся без боекомплекта, борт упал в безлюдном районе. Поисково-спасательная команда отправилась к месту аварии для эвакуации экипажа, также туда вылетела комиссия ВКС России. rbc.group В конце марта в Приморском крае разбился штурмовик Су-25 при выполнении учебно-тренировочного полета. Пилот успел катапультироваться, его нашли спасатели. Полет выполнялся без боекомплекта, Су-25 упал в безлюдной местности, на месте падения разрушений не было. «По предварительной информации, причиной происшествия стала техническая неисправность», — пояснили в Минобороны. rbc.group Вечером 2 апреля в Иркутской области потерпел крушение стратегический ракетоносец Ту-22М3. Экипаж катапультировался, один из летчиков погиб. Самолет рухнул в безлюдной местности, разрушений и жертв на земле не было. Причиной стала техническая неисправность. Читайте РБК в Telegram.	10	\N	2025-07-01 16:15:01	2025-07-01 16:15:01
418	1037	prokuratura-potrebovala-cherez-sud-zablokirovat-proekt-deklarator	Прокуратура потребовала через суд заблокировать проект «Декларатор»	https://s0.rbk.ru/v6_top_pics/media/img/6/96/347513817960966.jpeg	Прокуратура Астраханской области обратилась в суд с требованием ограничить доступ к сайту проекта «Декларатор», публикующего декларации чиновников, из-за персональных данных. Авторы проекта заявили, что берут их из открытых данных Фото: Прокуратура Астраханской области На каком основании астраханская прокуратура обратилась в суд Прокуратура Астраханской области подала в суд административный иск в отношении проекта «Декларатор», публикующего открытые данные о доходах российских чиновников, депутатов, судей и других публичных должностных лиц. В Советский районный суд Астрахани дело поступило 12 мая. В качестве истца указана областная прокуратура, в качестве ответчика — Роскомнадзор. В исковом заявлении (есть у РБК) говорится, что прокуратура провела проверку исполнения законодательства о персональных данных и выявила интернет-сайт declarator.org, «обрабатывающий и распространяющий для неопределенного круга лиц персональные данные без согласия их субъектов». Прокуратура ссылается на положения закона «О противодействии коррупции», согласно которым сведения о доходах и имуществе лиц, замещающих определенные должности, размещаются на официальных сайтах. Они предоставляются СМИ в определенном порядке, но declarator.org «не входит в перечень информационных ресурсов, на которых могут размещаться соответствующие сведения», указывает прокуратура. rbc.group Помимо этого, сотрудники прокуратуры выборочно связались с людьми, данные о которых публикует «Декларатор». Они подтвердили «факт отсутствия согласия» на их размещение на этом сайте, говорится в иске. Это влечет за собой нарушение прав субъектов персональных данных, делает вывод прокуратура. rbc.group «В целях защиты института государственной власти Российской Федерации и прав неограниченного круга лиц от дискредитации неофициального информационного источника, осуществляющего необоснованное распространение данных, подлежащих особому порядку раскрытия, прокуратурой области инициировано направление настоящего административного искового заявления», — сказано в документе. Доходы депутатов за 2022 год опубликуют без упоминания имен Политика В итоге прокуратура попросила суд признать информацию с сайта «Декларатор» «обрабатываемой с нарушением требований федерального законодательства», а также обязать Роскомнадзор Астраханской области ограничить доступ к информации, распространяемой сайтом. Спустя несколько дней, 16 мая, суд вынес определение (есть у РБК), в котором согласился с доводами прокуратуры. В определении он указал, что, согласно законодательству, суд может принять меры предварительной защиты по административному иску. Поэтому он постановил ограничить доступ к информации на сайте declarator.org до принятия решения по иску. РБК направил запрос в Роскомнадзор. На сайте Declarator говорится, что в соответствии с законом «О персональных данных» (п. 11 ч. 1 ст. 6), согласие субъекта персональных данных на обработку этих данных не требуется, если обрабатываемые персональные данные стали доступны в результате их раскрытия в соответствии с федеральными законами. «Следовательно, проект «Декларатор» не обязан получать согласие на обработку персональных данных, т.к. использует только открытые и законные источники», — сказано в пояснении. «Декларатор» — это база данных о российских публичных должностных лицах, в том числе депутатах, чиновниках, судьях, представителях региональной и муниципальной власти, сотрудниках госкорпораций, госкомпаний, бюджетных учреждений и других организаций, говорится на сайте проекта. Проект собирает данные о доходах, имуществе и обязательствах имущественного характера. Кроме того, он использует данные о доходах и имуществе кандидатов на выборные должности из их предвыборных деклараций, сведения о среднемесячной зарплате сотрудников подведомственных учреждений, декларации членов делегаций в Парламентской ассамблее Совета Европы, другие данные из открытых источников. Из этих данных формируется единый профиль должностного лица. Сейчас на сайте проекта содержится информация об 1,3 млн людей. Как «Декларатор» объясняет правомерность публикаций В «Деклараторе» об иске узнали случайно — одна из сотрудниц мониторила упоминания проекта в интернете и увидела новость на сайте суда, рассказал РБК координатор проекта Иван Лузин: «Иначе мы бы узнали об этом гораздо позже, а так мы имеем возможность реагировать на иск, участвовать в этом деле, доносить свою позицию». Никаких предупреждений ни от прокуратуры Астраханской области, ни от Роскомнадзора проекту не поступало, говорит он. Лузин отметил, что в прошлом Роскомнадзор обращался к проекту с предписаниями, если какой-либо человек сообщал, что не хочет, чтобы данные о нем были размещены на сайте проекта. В таких случаях «Декларатор» реагировал на них и «все вопросы решались в рабочем порядке» Лузин заявил, что информация, о которой идет речь, публикуется в открытых источниках в силу закона, но, по мнению прокуратуры, ее могут использовать только СМИ, а все остальные «должны прикрыть глаза и на нее не смотреть». «Наша позиция в том, что эта информация общественно значимая, она публикуется в силу закона, и она должна распространяться, быть доступной максимальному числу людей. И, соответственно, именно этим распространением и прозрачностью работы органов власти и людей, которые в них работают, мы и занимаемся», — пояснил координатор проекта. «Рыбный магнат» снова стал богатейшим человеком в российской власти Политика До 2022 года «Декларатор» анализировал информацию, содержащуюся в декларациях о доходах чиновников и других публичных должностных лиц. Но в начале 2023 года президент Владимир Путин подписал закон, согласно которому декларации депутатов Госдумы и членов Совфеда, а также депутатов законодательных органов субъектов будут публиковаться в обезличенном виде, без указания персональных данных. Изменения вступили в силу 1 марта того же года. Тогда же пресс-секретарь президента Дмитрий Песков, отвечая на вопрос о декларациях главы государства и чиновников Кремля, заявлял, что они подадут данные, но их публикация не обязательна. «Главное декларацию подать, а публикация — это вторично», — пояснял он. После того, как подавляющая часть деклараций перестала публиковаться, «Декларатор» продолжил собирать данные о доходах чиновников из других открытых источников, но при этом всегда легальных, подчеркнул Иван Лузин. Он признается, что было искушение уйти в «серую зону» и начать пользоваться так называемыми «сливами», но проект на это не пошел. «Мы всегда работали и продолжаем работать очень щепетильно, ориентируясь на официальные источники информации. Самый неофициальный источник, который у нас есть, — «Википедия». Это та граница, дальше которой мы не заходим», — рассказал Лузин.	3	\N	2025-07-02 09:25:02	2025-07-02 09:25:02
424	1213	le-parisien-uznala-prichinu-zvonka-makrona-putinu	Le Parisien узнала причину звонка Макрона Путину	https://s0.rbk.ru/v6_top_pics/media/img/6/81/347514376589816.jpeg	Макрон в первую очередь связался с Путиным из-за Ирана. Стороны условились продолжать контакты на этот счет, подчеркнули важность соблюдения страной ДНЯО и сотрудничества с МАГАТЭ Эмманюэль Макрон (Фото: Michel Euler / Reuters) Президент Франции Эмманюэль Макрон позвонил российскому коллеге Владимиру Путину из-за ситуации с Ираном, пишет Le Parisien. Незадолго до этого французский лидер общался с иранским президентом Масудом Пезешкианом и главой МАГАТЭ Рафаэлем Гросси. Детали о разговоре Путина и Макрона газете сообщили источники. Один из них сказал, что, хотя беседа 1 июля была первой почти за три года (с сентября 2022-го), «связи никогда не были полностью разорваны»; другие отметили у обоих лидеров «интерес» к возобновлению диалога. По иранской тематике, как сообщила французская сторона, «оба президента договорились координировать свои действия и в ближайшее время провести новые переговоры, чтобы совместно отслеживать развитие ситуации». Российская сторона подтверждала возможность продолжения контактов по этому вопросу. rbc.group Кремль подчеркивал, что важно уважать «законное право Тегерана на развитие мирного атома», Ирану нужно выполнять Договор о нераспространении ядерного оружия (ДНЯО), что включает и сотрудничество с МАГАТЭ. rbc.group Президенты также обсудили Украину. Макрон подчеркнул, что Париж продолжит поддержку Киева, а также призвал к прекращению огня и началу переговоров. Путин «подтвердил принципиальные подходы к возможным договоренностям, которые должны носить комплексный и долгосрочный характер, предусматривать устранение первопричин украинского кризиса и опираться на новые территориальные реалии». Эксперты оценили значение первого за три года разговора Путина и Макрона Политика Парламент Ирана после 12-дневной войны страны с Израилем одобрил приостановку сотрудничества с МАГАТЭ, а также решил не пускать главу агентства на свои ядерные объекты. Макрон в разговоре с Пезешкианом 29 июня призвал Тегеран к соблюдению ДНЯО и сотрудничеству с МАГАТЭ. На встрече с Гросси после решения иранского парламента Макрон выразил поддержку МАГАТЭ и призвал допустить представителей агентства на объекты Ирана. Читайте РБК в Telegram.	8	\N	2025-07-02 11:15:02	2025-07-02 11:15:02
422	1152	iran-priostanovil-sotrudnichestvo-s-magate	Иран приостановил сотрудничество с МАГАТЭ	https://s0.rbk.ru/v6_top_pics/media/img/7/35/347514403524357.jpeg	МАГАТЭ могло проводить инспекции на ядерных объектах Ирана, но после операции Израиля республика решила временно прекратить сотрудничество. Тегеран также заявил, что не будет пускать главу агентства Гросси на свои объекты Масуд Пезешкиан (Фото: Majid Saeedi / Getty Images) Президент Ирана Масуд Пезешкиан издал указ о приостановке сотрудничества с Международным агентством по атомной энергии (МАГАТЭ), передает агентство Tasnim. 25 июня приостановку сотрудничества одобрил парламент страны. Это произошло на следующий день после того, как завершилась 12-дневная война Ирана с Израилем, начатая, по утверждению последнего, из-за близости исламской республики к созданию ядерного оружия. Как заявил затем вице-спикер парламента Хамид Реза Хажи Бабаи, Иран больше не собирается пускать на свои ядерные объекты главу МАГАТЭ Рафаэля Гросси, а также не согласится на установку камер видеонаблюдения на этих объектах. rbc.group Гросси отмечал, что в ходе конфликта иранским ядерным объектам был нанесен ущерб, но Тегеран способен восстановить процессы обогащения урана в течение нескольких месяцев. rbc.group МАГАТЭ заявило, что не может отследить 400 кг обогащенного Ираном урана Политика В 1970-м Тегеран ратифицировал Договор о нераспространении ядерного оружия (ДНЯО) и в 1974-м подписал всеобъемлющее соглашение о гарантиях МАГАТЭ, согласно которым агентство собирает сведения о ядерных объектах страны, инспектирует их и на основе этих данных подтверждает мирный характер ядерной программы. С победой исламской революции в 1979 году программа была остановлена, но потом разработки возобновились. В 1990-х Иран впервые обвинили в намерении создать ядерное оружие. В 2003-м МАГАТЭ нашло признаки обогащения урана республикой, Тегеран признал, что вел незадекларированную деятельность. Тогда был подписан дополнительный протокол к ДНЯО, Иран объявил о приостановке программы обогащения урана по рекомендациям МАГАТЭ, но в 2005-м возобновил ее. Год спустя агентство обвинило Иран в отказе от сотрудничества, и против страны были введены первые санкции. Вслед за этим Тегеран и западные страны попытались заключить соглашение насчет ядерной программы. Документ под названием Совместный всеобъемлющий план действий (СВПД или просто «ядерная сделка») был подписан в 2015-м. Договор предполагал отказ республику от обогащения урана в обмен на снятие санкций. В 2018-м США вышли из сделки, год спустя Иран возобновил ядерные разработки. С 2021-го Тегеран перестала соблюдать некоторые соглашения с МАГАТЭ, пускать его сотрудников на объекты, в то же время проводя обогащение до уровней, близких к оружейным. Перед началом 12-дневной войны США и Иран вели новые переговоры о ядерной сделке, но безуспешно. Читайте РБК в Telegram.	9	\N	2025-07-02 10:35:03	2025-07-02 12:49:48
1013	2046	nabiullina-nazvala-usloviya-dlya-bolee-bystrogo-snizheniya-stavki	Набиуллина назвала условия для более быстрого снижения ставки	https://s0.rbk.ru/v6_top_pics/media/img/9/78/347514577820789.jpeg	Эльвира Набиуллина (Фото: Артём Кудрявцев / пресс-служба Банка России) Если статистические индикаторы будут говорить о замедлении экономики более быстрыми темпами, чем ожидалось, то и инфляция может стремиться к значениям ниже цели — это даст Центробанку возможность снижать ставку быстрее, заявила председатель Банка России Эльвира Набиуллина на Финансовом конгрессе, передает корреспондент РБК. Что будет со ставками по вкладам и кредитам после снижения «ключа» Подписка на РБК «Переохлаждение означало бы, что у нас инфляция падает ниже цели, что у нас появляется переизбыток рабочей силы, что происходит кредитное сжатие вместе с аномально низкими темпами роста денежной массы, — сказала Набиуллина. — Мы видим замедление инфляции, замедление происходит быстрее наших ожиданий, но пока эта инфляция выше цели и в годовом выражении, и в текущих темпах. Мы видим снижение остроты на рынке труда. Это тоже важный индикатор по опросам предприятий, но дефицит на рынке труда остается, и рекордно низкая безработица остается». «Индекс бизнес-климата показывает пока нисходящую динамику. Смотрим на генерацию электроэнергии, загрузку мощностей, объем платежей в нашей платежной системе, финансовые результаты компании, аналитику банков — суммарно всё это сигнализирует о замедлении роста деловой активности, но с очень высоких темпов, которые были в 2023-2024-м году. И если вот эти опасения и индикаторы будут сигнализировать о более быстром замедлении экономики, естественно, тогда инфляция будет снижаться ниже цели, и это даст нам пространство для более быстрого снижения», — подчеркнула глава ЦБ. «Нам всем надо очень плавно пройти этот период, потому что сегодняшняя ситуация — это как некоторое зеркальное отражение того, что было в первой половине прошлого года. В первой половине прошлого года Многие ухватились за наш прогноз, что мы скоро будем снижать ключевую ставку. И проигнорировали, что это будет происходить при замедлении инфляции. Поэтому у нас брали кредиты, а инфляция не замедлялась, и нам пришлось вместо понижения ставки прийти к повышению. Сейчас волна наоборот: я вижу, что есть опасения, что, несмотря на снижение инфляции, мы будем держать высокую ставку и будет происходить переохлаждение экономики. Но это так не работает», — резюмировала Набиуллина. Материал дополняется Читайте РБК в Telegram.	6	\N	2025-07-02 15:15:01	2025-07-02 15:15:01
264	796	glavu-azerbaydzhanskoy-diaspory-v-ekaterinburge-otpustili-posle-doprosa	Главу азербайджанской диаспоры в Екатеринбурге отпустили после допроса		Шахина Шыхлински увезли на допрос в Екатеринбурге. Его сын сообщил, что он проходит свидетелем по делу об убийствах, возбужденному против братьев Сафаровых Главу азербайджанской диаспоры Шахина Шыхлински отпустили после допроса в статусе свидетеля, рассказал РБК его сын Мутвалы Шыхлински. О задержании Шыхлински стало известно вечером 1 июля, об этом сообщил азербайджанский Госкомитет по работе с диаспорой. Шыхлински-младший уточнил, что его отец проходит свидетелем по уголовному делу против братьев Сафаровых, которое связано с расследованием серии убийств и покушений на убийство, совершенных в Екатеринбурге в 2001–2011 годах. Сына и отца задержали на улице Сулимова, Мутвалы Шыхлински говорил, что окна их автомобиля разбили ломами, а самих их повалили на землю. Задержания уроженцев Азербайджана в Екатеринбурге произошли на прошлой неделе, они связаны с делом о заказных убийствах. СК России сообщил, что один из задержанных фигурантов умер, по предварительным данным, из-за сердечной недостаточности, а причины смерти второго устанавливаются. Баку провел свою судмедэкспертизу после смерти задержанных Гусейна и Зияддина Сафаровых и заявил, что они умерли от посттравматического шока. Генпрокуратура Азербайджана возбудила уголовное дело. На фоне этой ситуации отношения Москвы и Баку обострились. В Азербайджане задержали сотрудников российского агентства «Sputnik Азербайджан» (входит в МИА «Россия сегодня»), а также группу россиян, которых заподозрили в транзите наркотиков.	6	\N	2025-07-02 08:05:02	2025-07-02 08:05:02
265	798	putin-vpervye-s-2022-goda-pogovoril-po-telefonu-s-makronom	Путин впервые с 2022 года поговорил по телефону с Макроном	https://s0.rbk.ru/v6_top_pics/media/img/5/44/347513868535445.jpeg	Путин заявил Макрону, что договоренности об урегулировании с Украиной должны носить комплексный характер, включать устранение первопричин кризиса. Елисейский дворец рассказал, что Макрон призвал к перемирию и переговорам Эмманюэль Макрон (Фото: /Jonas Been Henriksen / NTB / Reuters) Российский президент Владимир Путин поговорил с французским коллегой Эмманюэлем Макроном, сообщил Кремль. Затрагивалась в том числе ситуация на Украине. «При рассмотрении ситуации вокруг Украины Владимир Путин напомнил, что украинский конфликт — это прямое следствие политики западных государств», — отметили в Кремле. Также обсуждались перспективы мирного урегулирования: Путин «подтвердил принципиальные подходы к возможным договоренностям, которые должны носить комплексный и долгосрочный характер, предусматривать устранение первопричин украинского кризиса и опираться на новые территориальные реалии». rbc.group Кроме того, во время разговоров обсуждалась ситуация на Ближнем Востоке, в том числе конфронтация Ирана и Израиля, иранская ядерная программа. rbc.group Макрон фразой «я не менял номер» оценил возможность диалога с Путиным Политика По данным Елисейского дворца, лидеры разговаривали более двух часов и обсудили конфликт на Украине и иранскую ядерную проблему. Макрон «подчеркнул непоколебимую поддержку Францией суверенитета и территориальной целостности Украины», а также призвал к прекращению огня и началу переговоров, приводит сообщение BFMTV. Последний телефонный разговор президентов Франции и России состоялся в сентябре 2022 года. В марте французский лидер отмечал, что может позвонить российскому коллеге, если Париж, Киев и союзники в ЕС сочтут, что для этого настал подходящий момент. Последняя личная встреча Путина и Макрона состоялась 7 февраля 2022 года в Москве, когда переговоры продолжались почти шесть часов. Тогда обсуждались вопросы безопасности в Европе на фоне нарастающего кризиса вокруг Украины. Французский президент неоднократно говорил о готовности возобновить контакты с Путиным. При этом в Кремле отмечали, что реальных шагов для общения Макрон до сих пор не делал. Российский министр иностранных дел Сергей Лавров говорил, что «никто не запрещает» французскому президенту позвонить Владимиру Путину и Москва открыта к контактам. В начале 2024 года Макрон сделал ряд заявлений о конфликте на Украине. В частности, он допустил отправку западных войск для участия в боевых действиях и проведение наземной операции против России. В Кремле тогда заявили, что следят за высказываниями президента Франции, и назвали Париж косвенным участником конфликта. Читайте РБК в Telegram.	2	\N	2025-07-02 08:05:02	2025-07-02 08:05:02
266	800	v-telegram-dobavili-spiski-zadach	В Telegram добавили списки задач	https://s0.rbk.ru/v6_top_pics/media/img/2/87/347514201944872.jpeg	Новая опция доступна Premium-подписчикам. Также они могут предлагать посты для публикации в каналах, указав желаемые дату и время, в обмен на «звезды» и Toncoin Фото: Leon Neal / Getty Images Пользователи Telegram после установки нового обновления смогут создавать интерактивные списки задач и отслеживать их выполнение прямо в приложении, говорится в блоге компании. Функция будет доступна владельцам Premium-подписки. Списки можно формировать в любом чате и уточнить в настройках, смогут ли другие пользователи ставить отметки о выполнении пунктов и добавлять новые. Еще одно нововведение — возможность подписчикам предлагать посты для публикации в каналах, указав желаемые дату и время. В обмен нужно будет перечислить владельцу канала «звезды» (внутреннюю валюту мессенджера) или криптовалюту Toncoin. rbc.group В Telegram появилась функция фактчекинга Технологии и медиа rbc.group Владелец канала получит вознаграждение спустя 24 часа после размещения поста. Если его удалят раньше, вся сумма вернется подписчику. В одном из предыдущих обновлений в мессенджере появилась функция обрезки голосовых сообщений. В веб-версию и приложение добавили опцию отправки сообщений владельцу канала или его администраторам. Также разработчики обновили интерфейс чатов с «темами» (разделами основного группового чата), сделав переход между вкладками из списка таких чатов быстрее. Пользователи получили возможность отправлять фотографии оптимального для них формата, добавить больше вариантов ответа в опросы, а сами опросы разместить во вкладке «избранное». Читайте РБК в Telegram.	10	\N	2025-07-02 08:05:03	2025-07-02 08:05:03
267	801	finam-zapustil-opciony-na-fondy-investiruyushchie-v-dogesoin-i-toncoin	«Финам» запустил опционы на фонды, инвестирующие в Dogeсoin и Toncoin		В компании отметили, что инфраструктурные и технологические риски для инвесторов сведены к минимуму. «Финам» намерен дальше расширять линейку инструментов с привязкой к криптовалютам Сбербанк SBER — ВТБ VTBR -2,28% Совкомбанк SVCB — Фото: Shutterstock «Финам» запустил опционы, базовыми активами для которых стали паи фондов, инвестирующих в такие криптовалюты как Dogeсoin, Ripple, Toncoin, Tron, USD Coin, Litecoin, Sui, сообщили «РБК-Инвестициям» в компании. Новые производные инструменты торгуются в беспоставочном режиме, ценовая динамика деривативов привязана к стоимости криптовалюты. Сделки с инструментами доступны для российских квалифицированных инвесторов. Как отметили в компании, инфраструктурные и технологические риски для инвесторов при сделках с новыми инструментами сведены к минимуму, так как все операции совершаются в российском правовом поле. rbc.group Доходности новых инструментов привязаны к стоимости криптовалют как базового актива. С изменением стоимости базового актива — криптовалюты, будет меняться и доходность нового инструмента. «Российские инвесторы все чаще рассматривают криптовалюты как элемент диверсификации своего портфеля, этот актив открывает возможность для применения самых разнообразных стратегий. Кроме того, контракты на криптовалюты можно включать в портфель не только в качестве инструмента для получения прибыли от роста базового актива, но и в качестве инструмента хеджирования валютных рисков, связанных с обесценением рубля», — отметил заместитель генерального директора по брокерскому бизнесу ФГ «Финам» Дмитрий Леснов. Dogeсoin — один из самых известных мемкоинов. Миллиардер Илон Маск заявлял, что Dogeсoin — его любимая криптовалюта. Он также неоднократно упоминал монету в своих соцсетях, после чего ее стоимость сильно возрастала. Кроме того, название Департамента эффективности государственного управления, который Илон Маск создал и возглавлял, был назван с отсылкой на название мемкоина — D.O.G.E. (Department Of Government Efficiency). Toncoin — нативный токен блокчейна TON (The Open Network), который изначально разрабатывался командой Telegram. Формально монета независима от мессенджера, однако ассоциируется с Telegram и его основателем Павлом Дуровым. Telegram отказался от участия в проекте из-за давления регуляторов США, но развитие сети продолжилось усилиями независимого сообщества. В начале 2025 года представители Telegram и разработчики TON договорились о внедрении Toncoin как способа оплаты Telegram Stars, Telegram Premium, Telegram Ads и Telegram Gateway. Ripple — криптовалюта одноименной платформы для платежных систем. Tron — нативная криптовалюта блокчейна TRON. USD Coin (USDC) — стейблкоин, привязан к доллару и может быть обменен на доллары в соотношении 1:1. Litecoin — одноранговая (P2P — peer-to-peer) криптовалюта, которая позволяет переводить средства с минимальными комиссиями. Sui — нативная монета блокчейна Sui, работающего на алгоритме Proof-of-Stake (PoS). Эта сеть отличается высокой производительностью, ее ключевая особенность — возможность проведения параллельных транзакций. В ближайшее время «Финам» намерен расширить линейку инструментов с привязкой к криптвалютам, добавив производные инструменты на другие популярные криптовалюты, в том числе на биткоин, эфир и Shiba Inu, рассказали «РБК-Инвестициям» в компании. Российские брокеры и УК, после того, как ЦБ разрешил профучастникам предлагать квалинвесторам производные финансовые инструменты с привязкой к криптовалютам, сообщили о запуске подобных инструментов. 4 июня на Мосбирже были запущены торги фьючерсом на акции ETF-фонда iShares Bitcoin Trust от BlackRock, который отслеживает динамику цены биткоина. Фьючерс стал первым криптоинструментом на российском рынке. Криптоинструменты, которые уже запустили или анонсировали брокеры и УК: «Сбер»: структурные облигации, доходность которых зависит от цены биткоина, внебиржа. УК «Альфа-Капитал»: структурные облигации, привязанные к криптовалюте в рамках одной из стратегий ДУ. Т-банк: ЦФА на биткоин. «Финам»: сообщал о планах выпустить структурные облигации с привязкой к криптовалютам, арбитражную стратегию, фонд на майниг и стратегию доверительного управления (ДУ). «БКС Мир инвестиций»: стратегия автоследования с ИИ для управления криптовалютными активами, доступ к CFD-контрактам на акции иностранных компаний, связанных с криптой. В марте топ-менеджеры и управляющие рассказывали «РБК-Инвестициям» о том, что они готовятся добавлять для клиентов криптоинструменты, как только для этого появятся законные основания. В том числе, компании сообщали, что обсуждают с партнерами в России и за рубежом технические возможности для работы с криптоактивами. Мосбиржа запустила торги первым в России криптоинструментом Биткоин , Фьючерс , Мосбиржа	9	\N	2025-07-02 08:05:03	2025-07-02 08:05:03
269	803	eksperty-ocenili-znachenie-pervogo-za-tri-goda-razgovora-putina-i-makrona	Эксперты оценили значение первого за три года разговора Путина и Макрона	https://s0.rbk.ru/v6_top_pics/media/img/0/18/347513944236180.jpeg	Владимир Путин и Эмманюэль Макрон впервые с осени 2022 года провели телефонный разговор. Опрошенные РБК эксперты рассказали, почему их контакт состоялся именно сейчас и может ли стать толчком для перезапуска диалога России с ЕС Эмманюэль Макрон (Фото: Alexandros Michailidis / Shutterstock) 1 июля состоялся первый почти за три года телефонный разговор между президентом России Владимиром Путиным и французским лидером Эмманюэлем Макроном. Политики обсудили ситуацию на Ближнем Востоке, а также конфликт на Украине — в частности, перспективы мирного урегулирования. Беседа продлилась более двух часов, заявили в Елисейском дворце. По данным «РБК-Украина» и «Суспільне», после этого Макрон позвонил украинскому президенту Владимиру Зеленскому. Заведующий сектором региональных проблем и конфликтов отдела европейских политических исследований ИМЭМО РАН Павел Тимофеев отметил в разговоре с РБК, что пока сложно рассуждать о том, удалось ли сторонам договориться до чего-то конкретного. «По крайней мере, если мы говорим о ситуации на Украине, то официальные позиции России и Франции слишком разные для того, чтобы они сейчас могли что-то конструктивно обсуждать. Поэтому здесь я бы был очень осторожен в прогнозах», — отметил эксперт. Отвечая на вопрос, почему разговор состоялся именно сейчас, Тимофеев отметил, что, вероятнее всего, к этому лидеров подтолкнула эскалация на Ближнем Востоке. «Грубо говоря, они созвонились ради «сверки часов». Все-таки у России и Франции позиции относительно иранской ядерной программы и палестино-израильского конфликта, в общем-то, близки», — замечает эксперт. rbc.group Такое же мнение высказал и доцент кафедры европейских исследований СПбГУ, ведущий эксперт Центра стратегических исследований ИМВЭС НИУ ВШЭ Алексей Чихачев. По его словам, израильско-иранский конфликт и участие в этом кризисе США требует обмена мнениями между крупными международными игроками. «Несмотря на общий глубочайший кризис в отношениях между Россией и Западом, этот компонент российско-французских отношений — обсуждение ситуации на Ближнем Востоке — сохраняется», — заявил РБК эксперт, отметив, что до 2022 года Россия и Франция регулярно обсуждали ближневосточные сюжеты — от Сирии до иранской ядерной программы. «С тех пор международный ландшафт сильно изменился, но интересы обеих стран в регионе никуда не исчезли, несмотря на их нередко противоположный характер. Оба государства остаются постоянными членами Совбеза ООН и несут особую ответственность за глобальную стабильность», — добавил Чихачев. rbc.group По его оценкам, рассуждать о связи этого звонка с обострением в отношениях России и Азербайджана, учитывая проблемы в диалоге Парижа с Баку, не приходится. «Отношения с Азербайджаном у Франции давно непросто складываются, учитывая понятную симпатию Пятой республики к Армении и многочисленные антиколониальные уколы Баку в сторону Парижа. Однако всерьез ставить вопрос о какой-то российско-французской антиазербайджанской коалиции просто невозможно. Франция — конкурирующая для России держава на Южном Кавказе, она продвигает там собственные и западные интересы, поэтому я бы все-таки разводил эти вещи», — замечает эксперт. По мнению Тимофеева, пока не приходится говорить о том, что этот телефонный разговор сможет стать толчком для возобновления переговоров между Россией и европейцами. «Этот разговор стал большой неожиданностью. В последнее время ничего не предвещало потепления во французско-российских отношениях. Возможно, это и некая первая ласточка, а может быть, и нет. Не исключено, что стороны решат и дальше договариваться, а потом все заглохнет», — замечает Тимофеев. Вместе с тем, по его мнению, не исключено, что Макрон таким образом постарался вернуть Европе инициативу в переговорах по украинскому вопросу. «Действительно, в последнее время многие французские политологи отмечают, что, возобновив диалог с Россией, президент США Дональд Трамп оставил в стороне Европу. Вместе с тем до сих пор не очень понятно, что Европа может такого предложить, чтобы ее пригласили присоединиться к переговорному столу. Та повестка, которую европейцы озвучили публично, остается достаточно неконструктивной для Москвы», — заключает эксперт. По мнению Чихачева, не стоит переоценивать значение этого звонка. «Он вряд ли приведет к изменению позиций сторон по ключевым вопросам, прежде всего — по Украине. Не стоит забывать, что подобные контакты уже имели место — например, в 2024 году — между президентом России и экс-канцлером Германии Олафом Шольцем, но они не стали поворотными точками», — замечает эксперт. По его словам, стоит учитывать также, что роль Франции на Ближнем Востоке сегодня значительно уступает влиянию США и Великобритании. Кроме того, позиция Парижа по Ирану остается достаточно жесткой и односторонней, что затрудняет поиск компромиссов. «Тем не менее сам факт сохранения диалога между Москвой и Парижем — пусть и ограниченного тематически — можно оценивать как позитивный сигнал. Он свидетельствует о том, что каналы связи между ядерными державами не полностью разорваны и при необходимости могут быть использованы. Но ждать кардинального перелома в российско-французских отношениях на этом этапе, безусловно, преждевременно», — замечает эксперт. Последний телефонный разговор между президентами России и Франции состоялся в сентябре 2022 года. В марте Макрон заявлял, что не исключает новой беседы с Путиным, если Париж, Киев и европейские партнеры сочтут момент подходящим. Лично последний раз лидеры встречались 7 февраля 2022 года в Москве; переговоры длились почти шесть часов. Тогда в центре внимания находились вопросы европейской безопасности на фоне стремительно обострявшегося украинского кризиса. Макрон неоднократно выражал готовность к возобновлению диалога с российским президентом. Однако в Москве подчеркивали, что конкретных инициатив с французской стороны предпринято не было. Глава МИД России Сергей Лавров, в свою очередь, напоминал, что «никто не запрещает» Макрону позвонить Путину и что Москва по-прежнему остается открытой к контактам.	9	\N	2025-07-02 08:05:03	2025-07-02 08:05:03
271	822	institut-minprosveshcheniya-otvetil-na-obvinenie-v-otkaze-ot-inklyuzii	Институт Минпросвещения ответил на обвинение в «отказе от инклюзии»	https://s0.rbk.ru/v6_top_pics/media/img/3/98/347513762361983.jpeg	Глава Института предложила проверить западные подходы к образованию детей с ограниченными возможностями на духовно-нравственные ценности. НКО обратились в правительство, обвинив ИКП в дискредитации инклюзивного образования Фото: Институт коррекционной педагогики / VK Институт коррекционной педагогики (ИКП) Министерства просвещения не выступает за отказ от инклюзии в образовании детей с ограниченными возможностью обучения и инвалидностью, а также не предлагает отказаться от права родителей выбирать, в каком учреждении должен учиться их ребенок. Об этом РБК заявила директор института Татьяна Соловьева в ответ на критику со стороны общественных организаций ее доклада на научной конференции. Организации, занимающиеся помощью детям с ограниченными возможностями здоровья, инвалидам, и их родителям, запустили петицию против предложений ИКП по развитию сферы образования, которые Соловьева представила на «Международной научно-практической конференции Инклюзия XXI», прошедшей 18-19 июня в Сириусе. Они утверждают, что предложенные меры могут лишить родителей права выбора формы образования для детей с ограниченным возможностями здоровья, дискредитируют инклюзивное образование, а также приведут к «откату к сегрегационным практикам». Что было в докладе rbc.group Институт коррекционной педагогики вместе с правительством и уполномоченным по правам ребенка в феврале получил поручение президента Владимира Путина провести комплексный анализ системы общего и дополнительного образования обучающихся с ограниченными возможностями здоровья и инвалидностью и представить предложения о совершенствовании данной системы. rbc.group В докладе директор ИКП Соловьева рассказала, что институт проанализировал открытые данные в сфере образования детей с ограниченными возможностями: статистику, нормативно-правовые акты в этой области, проекты по обеспечению ресурсов, а также направил запросы в регионы, чтобы получить от них обратную связь о проблемах и предложениях. Охватить удалось 46 регионов из всех федеральных округов, сообщила докладчик. Среди проблем она назвала: рост числа общественных родительских организаций при снижении численности экспертов; расширение коммерческого сектора предоставления образовательных услуг в сфере коррекционной педагогики при дефиците кадров в госучреждениях; установку на инклюзивность в образовании без внимания к ресурсам и возможностям регионов, а также без учета потребностей самих детей с нарушениями интеллекта, расстройствами аутического спектра (РАС), с тяжелыми множественными нарушениями развития (ТМНР). В ходе выступления Соловьева предложила меры для их решения. Среди них — ввести обязательную оценку российскими экспертами иностранных методик обучения, которая сейчас не предусмотрена. Также глава ИКП предложила ограничить влияние некоммерческих организаций на образовательный процесс без согласования с государственными и профессиональными структурами, что должно позволить соблюдать стандарты качества в образовании. «Все образовательные программы, методики и технологии, особенно разрабатываемые и внедряемые при участии НКО и коммерческих организаций, должны проходить профессиональную экспертизу и государственную аккредитацию», — говорилось в докладе. Это, по мнению ИКП, позволит исключить применение сомнительных или неподтвержденных методик. Также Соловьева предложила уточнить понятие «инклюзивное образование», чтобы предусмотреть «гибкий подход» с учетом возможностей региона, инфраструктурного и кадрового потенциала, а также индивидуальных особенностей детей. Необходимо признать ценность специального образования наряду с инклюзией, говорится в докладе. «В законе об образовании не написано, что инклюзивное образование — это совместно. Нет там таких слов. Там указано: доступность и качество образования, где бы ребенок не учился. Почему мы вдруг решили, что инклюзия — это обязательно совместность?», — также сказал Соловьева. Что касается обучения детей с тяжелыми множественными нарушениями развития (ТМНР), в докладе предлагается создавать для них образовательные комплексы, объединяющие обучение, реабилитацию и социальную адаптацию. Уточняется, что такие комплексы должны предусматривать также и постшкольный этап, включая подготовку к самостоятельной жизни, дальнейшему обучению и трудоустройству с сопровождением специалистов. Какие претензии высказали к докладу Претензии к разработанным и предложенным ИКП мерам общественные организации и фонды сформулировали в петиции, адресованной премьер-министру Михаилу Мишустину, помощнику президента Андрею Фурсенко, заместителю председателя правительства Дмитрию Чернышенко, уполномоченному при президенте по правам ребенка Марии Львовой-Беловой, а также министру просвещения Сергею Кравцову. Все они выступают ответственными за исполнение поручения президента о проведении анализа системы образования обучающихся с ограниченными возможностямии инвалидностью. Петицию подписали представители Всероссийской организации родителей детей-инвалидов (ВОРДИ), Центра проблем Аутизма, ассоциации «Аутизм Регионы», общественной организации «Сообщество семей слепоглухих», Межрегиональной общественной организации инвалидов (МООИ) помощи и поддержки детей-инвалидов и их родителей «Дети-Ангелы». Они обратили внимание на то, что в представленном Соловьевой докладе предлагается лишить родителей права выбора формы образования и образовательной организации для ребенка, и передать решение о судьбе детей в руки специалистов, без учета мнения их законных представителей. По мнению организаций, ИКП фактически предлагает вернуться к исключительно специальному образованию. Они опасаются, что будут внедрены механизмы, согласно которым, детей безальтернативно будут направлять в спецучреждения. «Происходит полная дискредитация инклюзивного образования, при которой отрицается успешный российский и международный опыт (включая опыт стран БРИКС), игнорируются статистические данные об эффективности инклюзии. Докладом производится атака на институты гражданского общества, создающая предпосылки для ограничения деятельности НКО и отрицающая вклад родительских организаций в развитие системы образования лиц с ОВЗ», — заявлено в петиции. В связи с этим организации просят в том числе провести независимую экспертизу доклада ИКП с участием экспертов и практиков в сфере образования детей с ОВЗ, родительского сообщества и представителей НКО. Организации также попросили организовать на независимой конкурсной основе исследования эффективности различных моделей образования для детей с ограниченными возможностями и инвалидностью с учетом перспектив их дальнейшей жизни по окончании обучения; разработать и принять Национальную стратегию развития инклюзивного образования с проведением широкого общественного обсуждения; обеспечить участие родительского сообщества в принятии государственных и практических решений в сфере образования детей с ограниченными возможностями. Как сообщила РБК одна из авторов петиции председатель ВОРДИ Елена Клочко, пока ее подписали около 12 тыс. чел. Организации еще не направляли личные обращения адресатам, указанным в петиции, но планируют сделать это после увеличения числа подписей. По словам Клочко, основные опасения вызывает то, что ИКП является исполнителем поручения президента. «Ранее президент дал много важных поручений по развитию инклюзивного образования, включая разработку межведомственных комплексных планов по развитию инклюзивного образования до 2030 года. Мы опасаемся, что, получив такую однобокую информацию от главы Института коррекционной педагогики, точка зрения главы государства и других органов в этой сфере может измениться не в лучшую сторону», — пояснила она. Она также отметила, что НКО используют не просто иностранные методики, а признанные во всем мире эффективные практики, равных которым в российских школах пока нет, разрабатывать такие методики как раз и должны научные организации. Поэтому, считает Клочко, предложение об ограничении деятельности таких некоммерческих организаций — не в интересах детей. По мнению президента «Центра проблем аутизма» Екатерины Мень, анализ, который провел ИКП, не является комплексным, так как игнорирует ключевые мнения семей, воспитывающих детей с ограничеными возможностями, педагогов, ежедневно сталкивающихся с барьерами «особости» учеников, а также самих обучающихся. Она сообщила, что в рамках мониторинга, ИКП рассылал в регионы анкеты, которые, как у указывает Мень, были составлены некорректно и не соответствуют принципам научного исследования. «В них полностью отсутствует нейтральность — вопросы сформулированы так, чтобы подтолкнуть респондента к заранее заданным выводам. Кроме того, в анкете нет ни одного вопроса, позволяющего сравнить эффективность инклюзивных и коррекционных моделей. Это как изучать эффективность лекарства, не спрашивая пациентов об их состоянии», — уверена она. К тому же, считает Мень, выборка в 46 регионов — не репрезентативна, поэтому на основе собранной информации невозможно реально оценить картину и сформировать эффективные предложения для развития системы образования детей с ограниченными возможностями. Право детей с ограниченными возможностями здоровья обучаться в общеобразовательных школах закрепили в Федеральном законе «Об образовании в Российской Федерации», который вступил в силу в сентябре 2013 года. Но фактически это стало возможным с 2016 года, когда Минпросвещения утвердило Федеральные государственные образовательные стандарты для детей с ОВЗ. Глава ИКП Татьяна Соловьева утверждает, что петиция основана не столько на докладе, озвученном в «Сириусе», сколько на рабочих документах, которые не предназначались для распространения и были получены «неправомерным путем». Соловьева в разговоре с РБК подчеркнула, что доклад содержал исследовательскую позицию, которая была не точно интерпретирована авторами петиции. «Не обсуждался документ стратегического значения. Сообщение, представленное на конференции, не является финальной версией, подготовленных материалов во исполнения поручения президента», — указала Соловьева. Как заявила глава ИКП, информация о том, что институт предлагает лишить родителей права полноценно участвовать в обучении своих детей не соответствует действительности. «Несомненно, без заинтересованной позиции родителей обеспечить качество обучения и воспитания ребенка с ОВЗ крайне сложно. Институт и я лично сторонники сохранения всех вариативных форм получения образования. Представленные указания на отказ от инклюзии не соответствуют тексту моего выступления и действительности. Этого нигде не было сказано», — сказала Соловьева. По ее словам, единственное, что в петиции действительно совпадает с позицией института, это регулирование деятельности НКО в образовании детей с ограниченными возможностями. По мнению Соловьевой, если НКО представляет западные подходы в реализации адаптивных образовательных программ, то необходимо оценить, соответствуют ли они Конституции, духовно-нравственным ценностям, стандартам и федеральным программам. У нас в стране единая программа обучения. «У нас не может быть для здоровых детей один социально-культурный контекст, воспитание и обучение, и для детей с особенностями развития — другой. Мы формируем единое общество», — сказала она. По словам Соловьевой, основные предложения института направлены на развитие инфраструктуры в регионах, чтобы детские сады и школы обеспечивали необходимые условия реализации особых образовательных потребностей. Выбор формы обучения своего ребенка — это общее право всех родителей, вне зависимости от состояния здоровья их ребенка. Несогласованный документ Директор департамента госполитики в сфере защиты прав детей Минпросвещения Лариса Фальковская заявила РБК, что на конференции обсуждались подготовленные ИКП рабочие предложения, которые не были согласованы министерством. Она также отметила, что инклюзия остается значимым инструментом обучения детей с инвалидностью и ограниченными возможностями, но вместе с тем создание специальных условий получения образования — обязательная, требующая постоянного внимания и ресурсов задача. «Мы считаем, что необходимо обеспечить возможность выбора родителями образовательных форматов, учитывая специфические нужды различных категорий детей, расширить консультативную поддержку при выборе и дальнейшее сопровождение на всех этапах взросления ребенка», — сказала Фальковская. В пресс-службе уполномоченного при президенте по правам ребенка Марии Львовой-Беловой также указали, что она выступает за гибкость и вариативность системы образования для детей с инвалидностью, за возможность выбора траектории в зависимости от обстоятельств и за право родителей определять маршрут обучения. Также важно учитывать мнение родителей и детей в определении стратегии государственной политики, считает детский омбудсмен.	7	\N	2025-07-02 08:35:02	2025-07-02 08:35:02
419	1040	nbc-uznal-postavki-kakogo-oruzhiya-ukraine-priostanovili-ssha	NBC узнал, поставки какого оружия Украине приостановили США	https://s0.rbk.ru/v6_top_pics/media/img/8/30/347514152839308.jpeg	США отложили поставки перехватчиков Patriot, ракет Hellfire, Stinger и AIM, 155-мм осколочно-фугасных снарядов для гаубиц и высокоточных ракет GMLRS. Часть вооружений находится в Европе, партию задержали перед отправкой на Украину Владимир Зеленский (Фото: Jens Büttner / Getty Images) Вооружение, поставки которого Украине приостановил Пентагон США, включает десятки ракет-перехватчиков Patriot, тысячи осколочно-фугасных артиллерийских снарядов калибра 155 мм для гаубиц, более ста ракет Hellfire, сообщает NBC со ссылкой на источники. Также задерживается передача более 250 высокоточных ракет GMLRS, десятков ракет класса «земля — воздух» Stinger, ракет класса «воздух — воздух» AIM и гранатометов, пишет издание. Первым о том, что Пентагон остановил поставки, сообщило Politico. Решение в начале июня принял глава политического отдела Минобороны Элбридж Колби, причиной, по данным издания, стала нехватка собственных запасов, которую выявили после проверки. rbc.group Politico узнало о приостановке поставок Украине зенитных ракет из США Политика rbc.group Приостановка коснулась помощи, которую обещал предоставить бывший президент США Джо Байден. Как пишет NBC, часть вооружений уже находится в Европе, но перед передачей Украине партию задержали. Задержка может продлиться «до завершения оценки Пентагона». «Это решение было принято, чтобы поставить интересы Америки на первое место после пересмотра Минобороны военной поддержки и помощи нашей страны другим странам по всему миру», — заявила заместитель пресс-секретаря Белого дома Анна Келли. Действующий президент Дональд Трамп на пресс-конференции по итогам саммита НАТО на прошлой неделе заявил, что Вашингтон пытается найти ракеты для систем ПВО Patriot, чтобы отправить на Украину. «Они действительно хотят получить эти, как они их называют, противоракетные системы, Patriot. Мы посмотрим, сможем ли предоставить их», — заявил он, отметив, что США помогают также Израилю. Соединенным Штатам ракеты «тоже нужны», указывал Трамп. Украина неоднократно обращалась к США и Европе с просьбой предоставить ей дополнительные средства ПВО. Глава офиса президента Украины Андрей Ермак во время визита в Вашингтон 5 июня заявил, что страна нуждается в большем количестве систем, чтобы защитить города от воздушных атак. К дополнительным поставкам призывал и президент Владимир Зеленский. Российские власти требуют от западных стран прекратить поставки вооружений и другой помощи Украине. Москва называет это ключевым условием для предотвращения эскалации конфликта. Читайте РБК в Telegram.	2	\N	2025-07-02 09:25:03	2025-07-02 09:25:03
425	1250	akcii-yuzhuralzoloto-ruhnuli-na-11-na-novosti-ob-obyskah-v-ofisah	Акции «Южуралзолото» рухнули на 11% на новости об обысках в офисах		Сотрудники ФСБ и СК России побывали в офисах ЮГК и главы и основного акционера компании, миллиардера Константина Струкова Южуралзолото UGLD -10,74% Фото: Shutterstock Акции компании «Южуралзолото» (ЮГК) упали 10,72%, до ₽0,6011 за бумагу, свидетельствуют данные торгов на 11:09 мск. Котировки обвалились на новости об обысках в офисах компании. Южуралзолото UGLD ₽0,601 (-10,74%) 1д 1н 1м 3м 1г Все время График... Сотрудники региональных управлений ФСБ и Следственного комитета в Челябинской области побывали с обысками в офисах компании «Южуралзолото группа компаний» (ЮГК), сообщил РБК источник в правоохранительных органах. В пресс-службе ФСБ по Челябинской области подтвердили РБК факт проведения следственных мероприятий. rbc.group По словам источника, обыски также проходят на рабочих местах главы и основного акционера компании, миллиардера Константина Струкова. Силовики пришли с обысками в «Южноуралзолото» Обыски связаны с тем, что ранее были выявлены нарушения правил охраны окружающей среды, промышленной безопасности и эксплуатации промышленных объектов на земельных участках «ЮГК», расположенных в Пластовском и Еткульском районах региона. Это, по версии силовых структур, привело к загрязнению водоохранной зоны и ухудшению экологической обстановки. Кроме того, за последние годы произошло шесть инцидентов, повлекших смерть сотрудников компании, отмечает источник. Новость дополняется	1	\N	2025-07-02 11:35:02	2025-07-02 11:35:02
432	1334	mid-ukrainy-vyzval-diplomata-ssha-iz-za-ogranicheniya-postavok-oruzhiya	МИД Украины вызвал дипломата США из-за ограничения поставок оружия	https://s0.rbk.ru/v6_top_pics/media/img/2/28/347514503384282.jpeg	Фото: Михаил Воскресенский / РИА Новости В МИД Украины «пригласили» временного поверенного в делах США Джона Хинкеля из-за приостановки поставок отдельных видов вооружения, сообщает МИД Украины. «Заместитель министра иностранных дел Украины Марьяна Беца подчеркнула критическую важность продолжения поставок выделенных ранее оборонных пакетов, с особым акцентом на укрепление противовоздушной обороны Украины», — говорится в сообщении. Ранее о том, что Пентагон приостановил поставки части вооружений Украине, сообщило Politico. Причиной, по данным издания, стала нехватка собственных запасов, которую выявили после проверки. По информации NBC, Украина не получила десятки ракет-перехватчиков Patriot, тысячи осколочно-фугасных артиллерийских снарядов калибра 155 мм для гаубиц, более ста ракет Hellfire. rbc.group В то же время член комитета Рады по нацбезопасности и нардеп Федор Вениславский заявил, что украинская сторона пока не имеет официального подтверждения о приостановлении поставок ракет в ПВО и другие снаряды со стороны США, передает «РБК-Украина». rbc.group Материал дополняется.	6	\N	2025-07-02 13:05:03	2025-07-02 13:05:03
1016	2196	nabiullina-rasskazala-o-nozhnicah-v-kotoryh-okazalis-eksportery	Набиуллина рассказала о «ножницах», в которых оказались экспортеры		Глава ЦБ описала ситуацию, в которой оказались российские экспортеры, словом «ножницы». С одной стороны на них давят высокие ставки, с другой — крепкий рубль. В то же время гражданам и импортерам не нужен слабый рубль Индекс МосБиржи IMOEX -0,52% Индекс РТС RTSI -0,52% Индекс МосБиржи в юанях IMOEXCNY -0,55% СПБ Биржа SPBE -1,19% Фото: Артём Кудрявцев / пресс-служба Банка России Российские экспортеры оказались в «ножницах» высоких ставок и крепкого рубля, а также падения цен и спроса на свою продукцию. Об этом заявила глава Банка России Эльвира Набиуллина в ходе Финансового конгресса ЦБ. «РБК Инвестиции  » следили за трансляцией. «Экспортерам сейчас очень сложно, они оказались в «ножницах». И еще и падение цен — и не только цен, но по некоторым и спроса на экспортных рынках. Но все таки экономике, рыночной экономике нужен такой курс, который отражает баланс спроса и предложения валюты со стороны разных участников», — сказала Набиуллина. Она согласилась, что экспортеры хотели бы более слабый курс рубля, но усомнилась в том, что его хотели бы граждане или, например, предприятия, которым нужен импорт оборудования для технологической модернизации. rbc.group «На мой взгляд, важно, чтобы курс был в интересах всей экономики. Важно, чтобы курс уравновешивал интересы разных экономических игроков и чтобы это делалось рыночным образом, а не постоянно через лоббистов, латание регулирования и подгон курса под те или иные нужды. Мне кажется, это одно из преимуществ рыночной экономики, которым нужно дорожить», — уверена Набиуллина. Она также прокомментировала потребность бюджета в слабом рубле. «Да, еще нам говорят, что слабый курс нужен для бюджета. Но влияние курса на бюджет тоже нелинейное. Укрепление рубля действует в сторону замедления инфляции, а значит в сторону гораздо более быстрого снижения ключевой ставки нежели при более слабом курсе», — объяснила глава ЦБ. По ее словам, чем более диверсифицирована экономика, чем меньше она будет зависеть от доходов небольшого круга экспортных отраслей, тем будет меньше зависимость от курса. «Если посмотрим на другие страны, у стран с низкой инфляцией в принципе более крепкий курс. Слабый курс — это частый признак уязвимости, следствие хронически высокой инфляции, недоверия к собственной валюте. Вряд ли это то, к чему мы стремимся сейчас», — заключила Набиуллина. Новость дополняется. Инвестиции — это вложение денежных средств для получения дохода или сохранения капитала. Различают финансовые инвестиции (покупка ценных бумаг) и реальные (инвестиции в промышленность, строительство и так далее). В широком смысле инвестиции делятся на множество подвидов: частные или государственные, спекулятивные или венчурные и прочие. Подробнее	10	2025-07-02 16:43:36	2025-07-02 16:05:03	2025-07-02 16:43:36
268	802	v-rosatome-soobshchili-o-peregovorah-po-prodazhe-doli-v-aes-v-turcii	В «Росатоме» сообщили о переговорах по продаже доли в АЭС в Турции	https://s0.rbk.ru/v6_top_pics/media/img/0/01/347514083235010.jpeg	«Росатом» продолжает переговоры с инвесторами из Турции и других стран. В предыдущий раз компания пыталась продать 49-процентную долю в проекте в 2018 году, но тогда от сделки отказался турецкий консорциум Фото: АО "Аккую Нуклеар" / ТАСС Госкорпорация «Росатом» ведет переговоры с инвесторами о продаже 49% акций строящейся в Турции АЭС «Аккую», сообщает Bloomberg со ссылкой на председателя совета директоров «Аккую нуклеар» («дочка» «Росатома») Антона Дедусенко. В пресс-службе «Росатома» сообщили РБК, что возможность продажи предусмотрена межправительственным соглашением от 2010 года. «Процесс переговоров продолжается, мы обсуждаем возможности с потенциальными партнерами, в том числе с турецкими компаниями», — заявили в госкорпорации, отметив, что выбор партнеров необходимо согласовать с Анкарой. Bloomberg передавал, что обсуждения идут с инвесторами из Турции и других стран. «Чем ближе мы к моменту, когда первый энергоблок начнет вырабатывать электроэнергию, тем больше инвесторов начинают проявлять интерес», — цитировало агентство Дедусенко. По его словам, сейчас первый блок станции мощностью 4,8 гигаватт проходит испытания, а электроэнергию начнет подавать в 2026 году. rbc.group Новак обвинил Siemens в срыве поставок оборудования на АЭС «Аккую» Бизнес rbc.group Агентство писало, что проект сталкивается с задержками и финансовыми трудностями из-за опасений иностранных банков по поводу возможных санкций США. В связи с этим Россия и Турция ищут альтернативные способы оплаты строительства, включая своповые поставки природного газа. В предыдущий раз «Росатом» пытался продать 49-процентную долю в АЭС в 2018 году. Тогда от сделки отказался консорциум турецких компаний Cengiz Holding AS, Kolin Insaat Turizm Sanayi ve Ticaret AS и Kalyon Insaat Sanayi ve Ticaret AS, заявив, что стороны не смогли достичь соглашения по коммерческим условиям. АЭС «Аккую» возводится на южном побережье Турции в провинции Мерсин. Проект включает в себя строительство и запуск четырех энергоблоков с реакторами типа ВВЭР-1200 поколения 3+. Мощность каждого блока составит 1200 МВт, общая мощность АЭС — 4800 МВт. Сроки пуска первого реактора АЭС несколько раз откладывали, «Росатом» отмечал, что реализации проекта мешают западные санкции. Прошлой осенью вице-премьер Александр Новак заявил, что немецкая Siemens не поставила значимое для станции оборудование, его закупили в дружественных странах. В связи с этим Россия и Турция пересмотрели график работ. Читайте РБК в Telegram.	3	\N	2025-07-02 08:05:03	2025-07-02 08:05:03
270	804	zelenskiy-soobshchil-o-gibeli-kombriga-pri-udare-v-dnepropetrovskoy-oblasti	Зеленский сообщил о гибели комбрига при ударе в Днепропетровской области	https://s0.rbk.ru/v6_top_pics/media/img/7/88/347513951313887.jpeg	Зеленский сообщил о гибели украинского комбрига Сергея Захаревича при ударе в Днепропетровской области Сергей Захаревич (Фото: Serhii Sobko / Facebook (входит в корпорацию Meta, признана экстремистской и запрещена в России)) Командир 110-й отдельной механизированной бригады ВСУ Сергей Захаревич погиб в результате удара по Гуляйполю в Днепропетровской области, заявил в обращении украинский президент Владимир Зеленский. Он отметил, что ждет результатов расследования обстоятельств этого удара. По его утверждению, есть потери среди военных и гражданских. Минобороны России подчеркивает, что удары наносятся только по военным и энергетическим объектам Украины и связанной с ними инфраструктуре. rbc.group «Страна» ранее сообщила со ссылкой на украинских военных, что удар был нанесен в Каменском районе Днепропетровской области. Село Гуляйполе находится примерно в 70 км от районного центра — города Каменское. rbc.group Минобороны сообщило об ударе «Кинжалом» по объектам ВПК Украины Политика Российское оборонное ведомство не сообщало об ударах в этом районе. При этом в сводке ведомства говорилось, что 1 июля подразделения группировки войск «Днепр» нанесли поражение формированиям ВСУ в районе Никополя Днепропетровской области, который находится примерно в 80 км от Гуляйполя. В апреле при ударе по Сумам погиб полковник Юрий Юла, бывший заместитель командира 26-й отдельной артиллерийской бригады, которая базируется в Бердичеве Житомирской области. Юла командовал воинской частью А 1476. Читайте РБК в Telegram.	4	\N	2025-07-02 08:05:03	2025-07-02 08:05:03
420	1072	v-ekaterinburge-dali-tri-goda-soosnovatelyu-smyslovyh-gallyucinaciy	В Екатеринбурге дали три года сооснователю «Смысловых галлюцинаций»		Суд в Екатеринбурге приговорил сооснователя группы «Смысловые галлюцинации» Владимира Бурдина к трем годам колонии общего режима по обвинению в причинении тяжкого вреда здоровью, сообщила пресс-служба судов Свердловской области. Сверх того, ему назначен один год ограничения свободы. Следствие установило, что в прошлом ноябре Бурдин ударил ножом знакомого, с которым в одной компании они распивали алкоголь. Он отмечал, что был пьян и не помнил, как все произошло — его разбудили уже силовики. Музыкант сначала признавал вину, а потом заявил, что оговорил себя «из чувства ложного товарищества». rbc.group «Хотел спасти товарищей, взял вину на себя. Я думаю, если бы были проведены дополнительные экспертизы, то результаты доказали бы мою непричастность», — отметил он во время заседания. rbc.group Музыканта осудил Верх-Исетский суд города по п. «з» ч. 2 ст. 111 УК (умышленное причинение тяжкого вреда здоровью с применением оружия или предметов, используемых в качестве оружия). Ura.ru отмечает, что Бурдин ранее был судим за кражу и поножовщину. Материал дополняется	9	\N	2025-07-02 09:45:03	2025-07-02 09:45:03
426	1264	ft-dopustila-prichastnost-ukrainy-k-podryvam-neftetankerov	FT допустила причастность Украины к подрывам нефтетанкеров	https://s0.rbk.ru/v6_top_pics/media/img/4/59/347514444339594.jpeg	За этот год по меньшей мере пять нефтяных танкеров пострадали от взрывов. Один из экспертов, опрошенных FT, допустил, что эти инциденты могут быть частью государственной диверсионной кампании Украины Фото: Морспасслужба Серия атак на танкеры с использованием магнитных мин, произошедшая в этом году, побудила некоторых экспертов по безопасности предположить, что к инцидентам причастны спецслужбы Украины, пишет Financial Times (FT). Газета называет четыре судна, пострадавших от взрывов в районе борта этой зимой: Seacharm, Seajewel, Grace Ferrum и Koala, принадлежащие греческим и кипрским судовладельцам. При этом Koala получил повреждения от взрыва в российском порту Усть-Луга в феврале. В мае судно было включено в санкционный список ЕС. Еще одно судно, Vilamoura, пострадало в результате взрыва на прошлой неделе у берегов Ливии, на нем был 1 млн барр. нефти. Однако тот факт, что корабль получил повреждения корпуса, а не борта, по мнению одного из экспертов, может указывать на иных исполнителей или причины инцидента. rbc.group «Остается ряд альтернативных версий, включая причастность ливийских игроков и других государственных акторов, у которых есть возможности и, вероятно, мотив», — сказал руководитель консультационного отдела группы экспертов по морской безопасности EOS Risk Group Мартин Келли. rbc.group FT отмечает, что данные систем слежения за судами показывают, что все пострадавшие корабли заходили в российские порты, занимающиеся перевалкой казахстанской нефти, не подпадающей под международные санкции. Минэнерго Казахстана отмечало, что на танкере, пострадавшего близ ливийских берегов, казахстанской нефти не было. Недалеко от Ливии взорвался танкер с 1 млн баррелей нефти Общество Причастность к инцидентам с танкерами «государственных акторов» допустила в марте Британская компания по управлению рисками в морских перевозках Ambrey. Она проанализировала повреждения как минимум четырех танкеров и одного сухогруза, которые были связаны с перевозкой российской нефти, с декабря 2024-го, и выявила повреждения, схожие с таковыми от морских мин. В Ambrey предположили, что мины могли установить водолазы, когда суда находились на маршруте в или из портов — в это время они замедляют ход. Установку взрывных устройств в самих портах аналитики фактически исключили из-за высоких рисков. Читайте РБК в Telegram.	7	\N	2025-07-02 11:45:03	2025-07-02 11:45:03
1014	2155	medvedev-raskryl-chislo-kontraktnikov-vstupivshih-v-armiyu-s-nachala-goda	Медведев раскрыл число контрактников, вступивших в армию с начала года	https://s0.rbk.ru/v6_top_pics/media/img/3/09/347514590726093.jpeg	По сравнению с первым полугодием 2024 года число контрактников, пополнивших ряды армии, выросло Фото: Александр Река / ТАСС Более 210 тыс. контрактников прибыли в Вооруженные силы за первое полугодие, сообщил зампред Совбеза Дмитрий Медведев на заседании профильной межведомственной комиссии. Он отметил, что это данные на 1 июля. Еще более 18 тыс. человек присоединились к добровольческим подразделениям. За аналогичный период 2024 года контракт с Минобороны заключили около 190 тыс. человек. В 2024 году общее число заключивших контракт составило около 450 тыс. человек, еще 40 тыс. вступили в добровольческие формирования. rbc.group Межведомственная комиссия по комплектованию Вооруженных сил контрактниками была создана в сентябре 2024 года под руководством Медведева для координации деятельности органов власти по отбору кандидатов на военную службу по контракту. rbc.group Медведев сообщил о выполнении январского плана по набору контрактников Политика Единовременная выплата контрактникам в России в 2025 году составляет 400 тыс. руб. из федерального бюджета плюс региональные доплаты. Региональную часть каждый субъект устанавливает самостоятельно. Например, в Петербурге она суммарно достигает 2,5 млн руб. В Москве бойцам с контрактами от года начисляют 1,9 млн руб. единовременно. Читайте РБК в Telegram.	6	\N	2025-07-02 15:50:02	2025-07-02 15:50:02
433	1396	tramp-pokazal-senatoram-komnatu-moniki-levinski-v-belom-dome	Трамп показал сенаторам «комнату Моники Левински» в Белом доме	https://s0.rbk.ru/v6_top_pics/media/img/4/90/347514519555904.jpeg	Трамп сравнивает Белый дом с вокзалом из-за потока гостей, которые приходят в Овальный кабинет, — это вызывает опасения администрации насчет риска утечек информации, пишет NBC. При республиканце атмосфера в Белом доме изменилась Фото: Chip Somodevilla / Getty Images Дональд Трамп показывал сенаторам-республиканцам «комнату Моники Левински» в Белом доме, где устраивали свидания президент Билл Клинтон и стажерка Белого дома. Об этом NBC сообщил один из сенаторов-республиканцев, приглашенных на подписание законопроекта. Моника Левински оказалась в 1998 году в центре сексуального скандала из-за романа с 42-м президентом США Биллом Клинтоном. Показания Клинтона под присягой относительно его отношений с Левински стали причиной для обвинения президента в лжесвидетельстве и начала процедуры импичмента Клинтона, однако нужная доля конгрессменов не поддержала идею инициативу. Со слов источников NBC, там, около Овального кабинета, у Трампа хранится запас шляп и рубашек с символикой MAGA, которые он дарит гостям. Высокопоставленный чиновник Белого дома описал комнату как «прекрасно организованный» сувенирный магазин. rbc.group NBC также описывает общую атмосферу в Белом доме, который сильно поменялся после прихода республиканца к власти. Трамп называет Белый дом Центральным вокзалом из-за потока посетителей, которые приходят к нему. По данным телеканала, некоторые чиновники озадачены таким потоком гостей и нервничают насчет возможных утечек. rbc.group Опасения возникли в том числе из-за случая, когда президент США и военное командование обсуждали новый истребитель-невидимку F-47. Внезапно посреди собрания к Трампу пришел Марк Цукерберг, возглавляющий Meta (компания признана в России экстремистской и запрещена). Чиновники попросили Цукерберга подождать за дверью, поскольку у него нет доступа к секретной информации. Во время встречи в кабинет также зашла молодая помощница, показала президенту что-то на своем ноутбуке и ушла, пару раз зазвонил мобильный телефон Трампа. Чиновники ожидали большей конфиденциальности на встрече с главнокомандующим, отмечает телеканал. «[Трамп] часто смотрит телевизор и живет в телефоне. Ему нравится принимать звонки. В прошлую встречу он сказал: «Почему ты мне больше не звонишь?» И я подумал: «Потому что мне нечего сказать, и потому что ты президент и ты занят», — рассказал NBC один из конгрессменов. По данным NBC, Трамп может прервать встречу, чтобы позвонить главе UFC Дэну Уайту или почетному председателю Fox Руперту Мердоку. «Он говорит: «Давайте позвоним Руперту. Fox меня сегодня убивает», — рассказал собеседник телеканала. Вмешательство Вэнса спасло «прекрасный билль» Трампа в сенате США Политика Помощники годами пытались приучить Трампа к дисциплине, но полного успеха не достигли, пишет NBC. По данным телеканала, министры часто слоняются по Белому дому, и нередко главы ведомств вместо 30-минутного визита остаются на несколько часов. Например, сотрудники Белого дома были поражены тем, насколько часто они сталкивались с вице-президентом Джей Ди Вэнсом, стоящим у Овального кабинета возле кофемашины, поедающим печенье, рассказал NBC бывший сотрудник по национальной безопасности. «Если вы находитесь на совещании по вопросам готовности [к стихийным бедствиям], а следующее совещание посвящено чему угодно, [Трамп] скажет: «Оставайтесь», — рассказал высокопоставленный сотрудник администрации. Читайте РБК в Telegram.	5	\N	2025-07-02 13:45:05	2025-07-02 13:54:05
1159	2670	v-kotovske-tri-cheloveka-pogibli-pri-pozhare-na-predpriyatii	В Котовске три человека погибли при пожаре на предприятии	https://s0.rbk.ru/v6_top_pics/media/img/0/87/347515213467870.jpeg	Причиной пожара, по предварительным данным, стало «нарушение технологических процессов», сообщили власти. Еще три человека пострадали, двоих госпитализировали Фото: Алексей Белкин / NEWS.ru / РБК Три человека погибли, еще три пострадали при пожаре на предприятии в Котовске, сообщил глава Тамбовской области Евгений Первышов в телеграм-канале. «Как доложил глава Котовска Алексей Плахотников, в ночь на 3 июля произошло возгорание на одном из предприятий города. По предварительным данным, причиной стало нарушение технологических процессов», — рассказал Первышов. По его словам, пожар оперативно локализовали. Тамбовский губернатор сообщил об отражении массовой атаки дронов Политика rbc.group Двое пострадавших госпитализированы. rbc.group В прошлый раз Первышов сообщал о пожаре в Котовске в середине июня, к возгоранию привело падение обломков сбитого беспилотника. Тогда, по данным Минобороны, над Тамбовской областью было уничтожено пять дронов. Минувшей ночью, как рассказали в военном ведомстве, БПЛА были сбиты в Белгородской, Воронежской, Липецкой, Курской областях и в Крыму. Читайте РБК в Telegram.	5	\N	2025-07-03 10:15:02	2025-07-03 10:15:02
101	503	belgorodskiy-gubernator-obyasnil-priznaki-kritichnosti-byudzheta-regiona	Белгородский губернатор объяснил «признаки критичности» бюджета региона	https://s0.rbk.ru/v6_top_pics/media/img/9/29/347513572040299.jpeg	Ситуация с бюджетом Белгородской области непростая, но это не значит, что основные статьи находятся под угрозой, сказал в интервью РБК губернатор Гладков. Дефицит бюджета он связал с падением доходов металлургии НЛМК NLMK ₽114,46 +1,47% Купить Фото: Александр Река / ТАСС Дефицит бюджета Белгородской области связан со снижением доходов металлургии, металлургические предприятия — это основной источник дохода по налогу на прибыль, рассказал в интервью телеканалу РБК губернатор Белгородской области Вячеслав Гладков. В начале 2025 года областной парламент одобрил бюджет на этот год с дефицитом 14,6 млрд руб., что почти в два раза выше, чем в 2021 году. Как отмечает Гладков, 2021 и 2022 годы были крайне комфортны для металлургии и «доходы были, конечно, очень велики». «Снижения доходов металлургии, особенно в 2025 году, в первом полугодии, привели к тому, что у нас более 80% налога на прибыль сократилось от плановых показателей», — указал Гладков. Ситуацию с бюджетом он назвал непростой, однако это не говорит о том, что «основные статьи расходов находятся под угрозой». Глава «Северстали» увидел риск остановки металлургических заводов России Экономика Отвечая на вопрос, насколько критичен для области дефицит бюджета, Гладков сказал, что «он имеет все признаки быть критичным». «Но сказать о том, что мы приступили к каким-то секвестрирующим мерам, что все, начинаем резать статьи расходные, у нас этого, конечно, нет. Но пересмотры по некоторым направлениям есть», — сказал глава области. Руководство региона надеется, что в рамках действующего законодательства обеспечит решение социальных проблем, например, за счет заключения договоров не на год, а на два с переносом части финансовой нагрузки. Согласно утвержденному бюджету, расходы Белгородской области в 2025 году составят 175,6 млрд руб., а доходы — 161,6 млрд руб. rbc.group Video Губернатор отметил, что, несмотря на сложную обстановку, в области наблюдается рост инвестиций: «Мы посчитали, что с 2021 года, включая 2025 год, объем инвестиций должен превысить 1 трлн руб. Достаточно уверенная цифра для нашего в принципе не самого большого региона в Российской Федерации». По оценке Гладкова, высокие показатели достигаются за счет внутренней мобилизации и повышения эффективности на предприятиях. «Борьба за предприятия, за свои дома — это не просто на словах, это фактическая жизнь, в которой живут наши предприятия. <...> По итогам прошлого года у нас самый высокий показатель, например, за всю историю Белгородской области по производству в живом весе мяса свинины — более 1 млн т. Таких показателей не было никогда», — рассказал Гладков. По данным областного инвестиционного портала, расположенные в области предприятия производят треть всероссийского объема железорудного концентрата. На территории области расположено более 80% разведанных запасов железных руд Курской магнитной аномалии (КМА), в числе ведущих предприятий металлургического комплекса — комбинат «КМАруда» (входит в Промышленно-металлургический холдинг) и входящий в состав НЛМК Стойленский ГОК. Президент Владимир Путин 30 мая поручил правительству обеспечить поддержку жителей Белгородской и Курской областей, пострадавших от налетов. Поручение президента должно быть исполнено до 1 августа. 1 июня Гладков сообщил о получении 200 млн руб. от правительства на оплату уже выполненных работ по восстановлению жилья. 1 июля Гладков рассказал, что правительство выделило 3,3 млрд руб. для компенсаций жителям за утраченное жилье. Всего область получила из федерального бюджета, не считая этих средств, более 23 млрд руб. Читайте РБК в Telegram.	7	\N	2025-07-01 16:45:02	2025-07-01 16:45:02
100	499	tramp-predlozhil-natravit-na-maska-monstra-kotoryy-mozhet-ego-sest	Трамп предложил «натравить» на Маска монстра, который может его съесть	https://s0.rbk.ru/v6_top_pics/media/img/3/72/347513757349723.jpeg	Конфликт Трампа и Маска связан с критикой налоговых поправок. Американский президент не исключил, что возглавляемый Маском DOGE может обернуться против самого бизнесмена, и «съесть Илона». Маск решил пока «не обострять ситуацию» Илон Маск (Фото: Gonzalo Fuentes / Reuters) Президент США Дональд Трамп предположил, что Департамент эффективности государственного управления (DOGE) может начать действовать против бизнесмена Илона Маска, который сам возглавлял ведомство до начала июня. Беседуя с журналистами перед отъездом из Белого дома в иммиграционный центр содержания под стражей во Флориде, Трамп сказал: «Нам, возможно, придется натравить DOGE на Илона. Знаете, что такое DOGE? DOGE — это монстр, которому, возможно, придется вернуться и съесть Илона». Департамент эффективности правительства был учрежден одним из первых указов, подписанных президентом США Дональдом Трампом в день инаугурации, 20 января. Задача DOGE — сокращение государственных расходов и реструктуризация федеральных агентств. Маск, так же как и другие сотрудники DOGE, был оформлен как «специальный государственный служащий» и, согласно американскому законодательству, мог работать на правительство не более 130 дней в календарный год. Этот срок истек в конце мая. rbc.group Журналисты также спросили американского президента, могут ли власти депортировать Маска — предприниматель родился и вырос в ЮАР, затем переехал в Канаду, а позже в США, где получил гражданство и возглавил компании SpaceX и Tesla. «Не знаю. Надо будет посмотреть», — ответил Трамп (цитата по Independent). rbc.group По мнению президента США, Маск «расстроен» тем, что потерял мандат на производство электромобилей. «Он очень расстроен из-за всего этого. Но вы знаете, он может потерять гораздо больше. Я должен вам сказать, верно? Илон может потерять гораздо больше», — сказал он. Ранее Трамп пригрозил бизнесмену сокращением субсидий, без которых ему пришлось бы «закрыть магазин и вернуться домой в Южную Африку». Трамп предложил начать проверку работы Илона Маска Политика Чуть позднее Макс ответил Трампу. «Так заманчиво обострить ситуацию. Так, так заманчиво. Но я пока воздержусь», — написал бизнесмен на своей странице в Х. Маск и Трамп, которые сблизились во время предвыборной кампании республиканца, вступили в публичную конфронтацию в начале июня. Это произошло после того, как бизнесмен раскритиковал продвигаемый Трампом «большой прекрасный законопроект» о налоговых льготах, который увеличивает дефицит бюджета США. Маск назвал поправки «мерзостью», а также заявил, что без него Трамп бы не выиграл выборы. Позднее Маск извинился за свои высказывания, а Трамп назвал его «замечательным парнем», который «немного огорчен». Однако к началу июля их ссора вновь начала разгораться — Трамп, в частности, предложил проверить деятельность Маска. Читайте РБК в Telegram.	5	\N	2025-07-01 16:45:01	2025-07-02 14:40:12
431	1332	v-peterburge-zaderzhali-urozhenca-azerbaydzhana-za-moshennichestvo-na-46-mln	В Петербурге задержали уроженца Азербайджана за мошенничество на ₽46 млн		Полиция Петербурга задержала по подозрению в крупных мошенничествах генерального директора стройфирмы, который является уроженцем одной из стран ближнего зарубежья. По данным местных журналистов, бизнесмен приехал из Азербайджана. Video В Петербурге по подозрению в серии мошенничеств на общую сумму более 46 млн руб. задержан 32-летний гендиректор строительной компании, сообщили РБК в пресс-службе управления МВД России по Петербургу и Ленинградской области. Там отметили, что возбуждены уголовные дела по ст. 159 Уголовного кодекса (мошенничество). «По версии полиции, фигурант, действуя под предлогом привлечения инвестиций в возведение жилых домов и их последующей сдачи в аренду, обманом завладел денежными средствами трех петербуржцев», — рассказали в ведомстве. Там уточнили, что подозреваемый является уроженцем одной из стран ближнего зарубежья. Предпринимателя задержали в его частном доме на Вологодской улице в поселке Парголово. Во время обыска силовики изъяли документы на недвижимость, мобильный телефон и деньги (в рублях и иностранной валюте), добавили в МВД. Как уточняет портал 78.ru, задержанный является уроженцем Азербайджана. Дома у него силовики нашли ₽175 тыс. и $500. По данным издания, задержанный возглавляет ООО «Амуров Групп» и в деле фигурируют два эпизода с обманом петербургских предпринимателей на 9,6 млн и на 22 млн руб соответственно. rbc.group В третьем случае, согласно материалам дела, гендиректор стройфирмы обманул потерпевшего на ₽14,7 млн, добавляет «Фонтанка». По ее информации, вменяемые задержанному преступления относятся к периоду с 2020-го по 2021 год. Баку заявил о нарушении прав азербайджанцев в России Политика На сайте строительной компании указано, что «Амуров групп» выполняет все виды строительных работ и имеет опыт исполнения функций подрядчика. Генеральным директором является Марк Александрович Амуров. РБК направил запрос в офис «Амуров групп». В конце июня в Екатеринбурге силовики задержали более 50 уроженцев Азербайджана в рамках расследования серии убийств в городе. Нескольких человек поместили под стражу в СИЗО. Двое подозреваемых во время задержания скончались. СК России сообщил, что один из задержанных фигурантов умер, по предварительным данным, из-за сердечной недостаточности, а причины смерти второго устанавливаются. Баку провел свою судмедэкспертизу и заявил, что мужчины умерли от посттравматического шока. Читайте РБК в Telegram.	8	2025-07-02 16:44:03	2025-07-02 13:05:03	2025-07-02 16:44:03
421	1118	glonass-razrabotaet-standarty-kiberbezopasnosti-dlya-dronov	«ГЛОНАСС» разработает стандарты кибербезопасности для дронов	https://s0.rbk.ru/v6_top_pics/media/img/7/78/347514401228787.jpeg	АО «ГЛОНАСС» разрабатывает программу эксперимента по созданию системы защиты дронов от кибератак. Это ключевое условие для снятия запретов на полеты: взлом дронов грозит потерей груза, травмами и новыми запретами Фото: Сергей Булкин / NEWS.ru / РБК АО «ГЛОНАСС» и ассоциация «Доверенная платформа» инициировали создание экспериментального правового режима по разработке единых стандартов защиты беспилотных воздушных систем (дронов) от кибератак. Об этом РБК рассказал руководитель проектов по авиации АО «ГЛОНАСС» Сергей Кукарев. Цель эксперимента — повысить безопасность промышленного использования наземного, водного и воздушного беспилотного транспорта, пояснил он. Без защиты от взлома и перехвата управления, по словам Кукарева, массовое внедрение дронов для доставки, мониторинга или др. задач невозможно, так как успешная кибератака может привести к ограничениям на технологию. Эксперимент позволит определить основы госполитики, которая приравняет элементы инфраструктуры беспилотников к объектам критической информационной инфраструктуры (сейчас к ней относятся сети связи и информационные системы госорганов, транспортных, энергетических, финансовых и ряда др. компаний). Беспилотник сегодня — это аналог смартфона с рисками взлома и перехвата управления, пояснил РБК гендиректор АО «ГЛОНАСС» Алексей Райкевич. В России, по его словам, пока нет регуляторики для безопасного перемещения дронов. «Мы предлагаем создать единые, доступные правила для кибербезопасной экосистемы до первых серьезных инцидентов», — добавил Райкевич, проведя аналогию со строгими правилами безопасности в медицине и авиации. Президент ассоциации «Доверенная платформа» Андрей Тихонов подчеркнул, что безопасность должна закладываться на этапе проектирования всех элементов системы, что позволит создать устойчивую к кибератакам среду на основе отечественных технологий. rbc.group Эксперты разработали концепцию «цифрового неба России» Технологии и медиа rbc.group По словам Кукарева, разработанные стандарты и подходы сначала будут применять для гражданской беспилотной авиации, а потом распространят на весь беспилотный транспорт. Эксперимент — часть подготовки национального стандарта кибербезопасности для беспилотного транспорта, уточнил он. Программу экспериментального правового режима планируют разработать до конца 2025 года. Представитель Минэкономразвития подтвердил РБК обсуждение такого эксперимента. АО «ГЛОНАСС» — госкорпорация по разработке, производству и эксплуатации глобальной спутниковой навигационной системы ГЛОНАСС. Создана в 2007 году по инициативе правительства для обеспечения независимости страны в области навигации и позиционирования. Она также разрабатывает госинформсистему экстренного реагирования при авариях «ЭРА-ГЛОНАСС», предназначенную для оперативного получения информации о ДТП и др. нештатных ситуациях на дорогах, для обеспечения связи между участниками происшествия и экстренными службами. Безопасны ли дроны В 2022 году российские регионы начали вводить запреты на полеты беспилотников. К декабрю 2023-го такой запрет ввели 68 регионов. Министр транспорта Роман Старовойт в июне 2025-го сообщал, что в России тестируется система идентификации гражданских беспилотников на базе «ЭРА-ГЛОНАСС», которая уже в этом году позволит снять запреты в регионах на полеты гражданских дронов. В Москве начали тестировать подключение электросамокатов к ЭРА-ГЛОНАСС Экономика Кибербезопасность дрона — это один из барьеров развития рынка беспилотных авиационных систем в стране, говорит гендиректор компании «Транспорт будущего» Юрий Козаренко. В качества примера он привел спуфинг, с которым может столкнуться не только каждый дрон, но и каждый житель Центральной части России, когда происходит подмена координат, что для дронов не менее болезненно, чем для человека. Спуфинг в случае с дронами — это намеренная подмена или перехват GPS-сигнала, когда дрон «думает», что он в другой точке города или за его чертой, при этом находясь, например, в центре. По мнению Козаренко, эксперимент АО «ГЛОНАСС» даст возможность тестировать технологии и стандарты в контролируемых условиях, чтобы адаптировать их к реальным. «Даже если все полеты будут разрешены, без наличия защищенных дронов, гарантирующих безопасную доставку посылок, грузов и прочего, рынок не сможет полноценно развиваться, — считает он. — Кибератака на дрон может привести не только к потере груза, но и к травмам у людей, если на них упадет дрон. После такого правила их эксплуатации могут ужесточить, и рынок снова будет закрыт». Сейчас десятки производителей дронов используют разные технологии связи, сервисы навигации, собственное или стороннее программное обеспечение, отметил Козаренко. Кроме того, ввозимые в Россию беспилотники могут передавать данные на серверы за границей. «Такая разрозненность создает реальные уязвимости систем беспилотников, вплоть до перехвата управления, поэтому важно изначально относиться к беспилотному транспорту как к объекту критической информационной инфраструктуры. Стандарты киберзащиты позволят всем российским производителям дронов и разработчикам ПО изначально выводить на рынок продукты, исключающие подобные риски», — заключил эксперт. Читайте РБК в Telegram	10	\N	2025-07-02 10:15:01	2025-07-02 10:15:01
427	1278	baku-zayavil-o-narushenii-prav-azerbaydzhancev-v-rossii	Баку заявил о нарушении прав азербайджанцев в России	https://s0.rbk.ru/v6_top_pics/media/img/2/11/347514441752112.jpeg	Баку считает, что умерших в Екатеринбурге во время следственных действий уроженцев республики, подозреваемых в убийстве, пытали. Российский СК указывал на то, что один из них умер от сердечной недостаточности Фото: Мурад Оруджев / РИА Новости В России были нарушены права проживающих в стране азербайджанцев, заявила заместитель начальника управления международно-правового сотрудничества Генпрокуратуры Азербайджана Самира Наджафзаде, передает Report. «Пытки запрещены международными договорами. Хотя Азербайджан является членом Европейской конвенции по правам человека, Россия вышла из этой конвенции. Права проживающих в России азербайджанцев нарушены», — сказала она. В Азербайджане арестовали восьмерых россиян по делу о транзите наркотиков Политика rbc.group Напряженность в отношениях России и Азербайджана возникла после того, как в Екатеринбурге в конце июня провели задержания представителей азербайджанской диаспоры по делам об убийствах и покушении на убийство в 2001, 2010 и 2011 годах. Во время следственных мероприятий два подозреваемых — 60-летний Гусейн и 55-летний Зияддин Сафаровы — скончались. Российский СК отметил, что один из них умер от сердечной недостаточности, причины гибели второго устанавливаются. Представитель СК Светлана Петренко сообщила, что для «всестороннего и объективного расследования» уголовное дело передадут в Главное следственное управление Следственного комитета России. rbc.group Тела погибших были доставлены в Баку, там их осмотрели, после чего обоих похоронили в Азербайджане. Местные судмедэксперты заявили, что в свидетельстве о смерти старшего брата причиной кончины названа травма, младшего — сердечная недостаточность. У Сафарова-старшего обнаружили переломы ребер, которые повредили легкие, кровоизлияния в твердых и мягких тканях головы и кровоподтеки на слизистой оболочке верхней и нижней губ. После этого Азербайджан возбудил уголовное дело по статьям об умышленном убийстве, пытках и превышении должностных полномочий. В Екатеринбурге арестованы более пяти человек в рамках расследований дел, связанных с азербайджанцами. Баку в то же время начал расследования против россиян, среди которых журналисты местного Sputnik. МВД Азербайджана возбудило против них уголовное дело по статьям о мошенничестве, незаконном предпринимательстве и легализации имущества, приобретенного преступным путем. Кроме того, 1 июля Азербайджан объявил о задержании еще нескольких групп россиян. Граждан России обвиняют в транзите наркотиков из Ирана и киберпреступлениях. Пресс-секретарь президента Дмитрий Песков отмечал в контексте обострения, что действия правоохранительных органов не могут быть поводами для дипломатических демаршей. «Мы искренне сожалеем в связи с такими принятыми решениями», — заявил Песков. По его словам, важно продолжить работу «по разъяснению причин и характеру тех событий, которые, по мнению азербайджанской стороны, послужили причиной для таких демаршей». Читайте РБК в Telegram.	10	\N	2025-07-02 12:35:02	2025-07-02 12:35:02
577	1572	baku-otvetil-na-soobshcheniya-o-priostanovke-obucheniya-na-russkom-v-shkolah	Баку ответил на сообщения о приостановке обучения на русском в школах	https://s0.rbk.ru/v6_top_pics/media/img/1/47/347514554854471.jpeg	Фото: Сергей Лантюхов / NEWS.ru / РБК В Министерстве науки и образования Азербайджана ответили на сообщения о приостановке обучения на русском языке в школах в стране. Там указали, что при освещении решений о «государственной образовательной политике» нужно ссылаться «только на официальные источники». В ведомстве не предоставили официальной информации по этому вопросу, сообщили азербайджанскому агентству Apa в ответ на запрос. О том, что Азербайджан на фоне обострения отношений с Россией принял решение начать закрытие русскоязычных школ в стране, сообщал ранее портал Oxu.az и подтвердил источник РБК в одном из образовательных учреждений. По данным издания Mektebgushesi, сейчас там работают 340 русскоязычных школ, в которых обучается 150 — 160 тыс. человек. В 16 из них обучение проходит только на русском языке, а в остальных — на двух. Большая часть таких школ находится в Баку. rbc.group В Азербайджане решили закрывать русскоязычные школы Общество rbc.group Отношения между Россией и Азербайджаном обострились в конце июня. Причиной стало задержание представителей азербайджанской диаспоры в Екатеринбурге по делам об убийствах и покушениях на убийство в 2001, 2010 и 2011 годах. Двое подозреваемых умерли во время следственных мероприятий, шесть человек арестовали. Материал дополняется Читайте РБК в Telegram.	1	\N	2025-07-02 14:35:02	2025-07-02 14:35:02
429	1309	siloviki-prishli-s-obyskami-v-yuzhuralzoloto	Силовики пришли с обысками в «Южуралзолото»	https://s0.rbk.ru/v6_top_pics/media/img/7/30/347514431404307.jpeg	В Челябинской области проходят обыски в офисах группы компаний «Южуралзолота» и его основного владельца, миллиардера Константина Струкова. Претензии силовиков связаны с нарушениями в области промышленной безопасности и экологии Южуралзолото UGLD ₽0,5949 -11,64% Купить Сотрудники региональных управлений ФСБ и СК в Челябинской области пришли с обысками в офисы ПАО «Южуралзолото группа компаний» (ЮГК), сообщил РБК источник в правоохранительных органах. В пресс-службе ФСБ по Челябинской области подтвердили РБК факт проведения следственных мероприятий. По словам источника, обыски также проходят на рабочих местах главы и основного акционера компании, миллиардера Константина Струкова. Он занимает 78-ю строчку в рейтинге самых богатых людей России по версии Forbes с состоянием $1,9 млрд. ЮГК — одна из крупнейших золотодобывающих компаний России. По собственной оценке, она занимает четвертое место в стране по объему добычи и второе по ресурсной базе. Запасы и ресурсы (MI&I) оцениваются в 46 млн тройских унций золотого эквивалента. Активы предприятия включают месторождения в Челябинской области (помимо них у компании там лицензии на геологоразведку и опытно-промышленное производство: Наилинский, Осейский, Алтын-Таш, Зайцевское) и Республике Хакасия (ОАО «Коммунаровский рудник»). Группа также разрабатывает месторождения россыпного золота в Красноярском крае (ООО АС «Прииск Дражный»). Основной владелец компании — Константин Струков. В декабре 2024 года «ААА Управление капиталом», входящая в группу Газпромбанка, приобрела у бизнесмена 22% акций ЮГК. После сделки у него осталось 67,85%, доля акций в свободном обращении — 10,15%. Акции «Южуралзолото» рухнули на 11% на новости об обысках в офисах Инвестиции rbc.group По словам источника, обыски связаны с тем, что ранее были выявлены нарушения правил охраны окружающей среды, промышленной безопасности и эксплуатации промышленных объектов на земельных участках ЮГК в Пластовском и Еткульском районах Челябинской области. Это, по версии силовых структур, привело к загрязнению водоохраной зоны и ухудшению экологической обстановки. Кроме того, за последние годы произошло шесть инцидентов, повлекших смерть сотрудников компании, отмечает источник. rbc.group В ЮГК отказались от комментариев. О претензиях надзорных органов к ЮГК сообщалось и ранее. Так, в августе 2024 года стало известно, что работа некоторых предприятий, входящих в группу компаний, будет ограничена по требованию Ростехнадзора. Приостановка горных работ коснулась четырех карьеров — «Курасан», «Южный Курасан», «Березняковский» и «Светлинский». Ограничения на первых трех были сняты 12 ноября, на «Светлинском» — 16 декабря после устранения нарушений. Весной 2024 года на Светлинском месторождении ЮГК произошел прорыв дамбы технического пруда. После инцидента в пробах речной воды нашли превышение предельно допустимых концентраций (ПДК) цианидов в 192 раза. Площадь загрязненных мышьяком сельхозземель превысила 330 тыс. кв. м, ущерб оценили в более чем 3 млрд руб. В местной прокуратуре тогда отмечали, что причиной возникшей критической ситуации стали нарушения, допущенные ЮГК при строительстве гидротехнического сооружения и его использовании без введения в эксплуатацию. Из-за нарушений требований закона в области промышленной безопасности в отношении юридического лица было возбуждено более 15 дел об административных правонарушениях. Читайте РБК в Telegram.	9	\N	2025-07-02 12:55:02	2025-07-02 12:55:02
430	1310	v-azerbaydzhane-reshili-zakryvat-russkoyazychnye-shkoly	В Азербайджане решили закрывать русскоязычные школы	https://s0.rbk.ru/v6_top_pics/media/img/8/03/347514486798038.jpeg	Ожидается поэтапное закрытие с переходом на обучение на азербайджанском языке в течение нескольких лет. В стране более 300 школ, где есть возможность учиться на русском Фото: Сергей Лантюхов / NEWS.ru / РБК Азербайджан на фоне обострения отношений с Россией принял решение начать закрытие русскоязычных школ в стране, сообщил портал Oxu.az. Собеседник РБК в одной из школ подтвердил информацию. Портал со ссылкой на родителей пишет, что в школьные группы в WhatsApp поступили соответствующие уведомления, закрывать их будут поэтапно. «В ближайшие три года русскоязычные школы перейдут на преподавание на азербайджанском языке, будут организованы курсы переподготовки для учителей», — сообщает Oxu.az. rbc.group Издание Mektebgushesi отмечает, что в Азербайджане работают 340 русскоязычных школ, в 16 из них обучение ведется только на русском, в остальных на двух языках. По оценке, в них учатся 150–160 тыс. учеников. Большинство школ находится в Баку, в некоторых районах страны их нет вообще. rbc.group РБК направил запрос в Россотрудничество, Минобразования и правительство Азербайджана, управление образования Баку. Баку заявил о нарушении прав азербайджанцев в России Политика Напряженность между Россией и Азербайджаном возникла после того, как в конце июня в Екатеринбурге были задержаны представители азербайджанской диаспоры по делам об убийствах и покушениях на убийство в 2001, 2010 и 2011 годах. Были арестованы шесть фигурантов. Еще два подозреваемых во время следственных мероприятий скончались. Российский Следственный комитет заявил, что один из них умер от сердечной недостаточности, а причина смерти второго устанавливается. Но азербайджанская сторона после судмедэкспертизы заявила, что обнаружила травмы на их телах, и возбудила уголовное дело по статьям об умышленном убийстве, пытках и превышении должностных полномочий. Баку начал собственные расследования против россиян. В частности, силовики провели рейд в редакции Sputnik Azerbaijan. Были арестованы исполнительный директор Игорь Картавых и шеф-редактор Евгений Белоусов по делу о мошенничестве, незаконном предпринимательстве и легализации преступных доходов. Кроме того, 1 июля власти страны объявили о задержании еще нескольких групп россиян, обвиняемых в транзите наркотиков из Ирана и киберпреступлениях. Арестованы восемь человек. Пресс-секретарь президента России Дмитрий Песков, комментируя обострение ситуации, заявил, что действия правоохранительных органов не должны становиться поводом для дипломатических демаршей. Позднее он подчеркнул, что Россия не угрожает Азербайджану. «В настоящий момент председатель СК России Александр Бастрыкин находится в постоянном контакте с генпрокурором Азербайджана, в ходе этих контактов они разбираются с теми вопросами, которые представляются проблемными», — сказал он. Читайте РБК в Telegram.	8	\N	2025-07-02 12:55:03	2025-07-02 12:55:03
578	1578	v-kieve-uvolili-upolnomochennogo-po-zashchite-yazyka-tarasa-kreminya	В Киеве уволили уполномоченного по защите языка Тараса Креминя	https://s0.rbk.ru/v6_top_pics/media/img/1/47/347514550588471.jpeg	Тарас Кремень (Фото: Фонд поддержки и защиты прав соотечественников, проживающих за рубежом) Кабинет министров Украины снял с должности уполномоченного по защите государственного языка Тараса Креминя. Он был освобожден от полномочий в связи с истечением контракта. Новость дополняется	5	\N	2025-07-02 14:35:03	2025-07-02 14:35:03
182	648	putin-odobril-garantii-dlya-vlozheniy-inostrancev-na-rossiyskih-birzhah	Путин одобрил гарантии для вложений иностранцев на российских биржах	https://s0.rbk.ru/v6_top_pics/media/img/1/42/347513769516421.jpeg	Владимир Путин (Фото: Global Look Press) Президент России Владимир Путин подписал указ, который обеспечивает гарантии для иностранных инвесторов на российском рынке. Документ, представленный на официальном портале правовых актов, вступает в силу со дня официального опубликования — 1 июля 2025 года. Гарантии действуют при приобретении или продаже трейдером, действующим в интересах иностранного инвестора, российских ценных бумаг на бирже или при IPO, при использовании им деривативов, а также при размещении иностранным инвестором средств на вкладах в российских банках. Своим указом российский президент ввел спецсчета «Ин» для иностранных инвесторов и распространил гарантии на покупку ценных бумаг российских компаний. Предлагается, что обладатели таких счетов смогут инвестировать на территории России, вести учет денежных средств, а также акций российского акционерного общества, облигаций федерального займа и облигаций российского эмитента, учет прав на которые осуществляется российским депозитарием. rbc.group Режим, вводимый указом, распространяется только на вложение денежных средств со счетов «Ин». Также предусматривается, что денежные обязательства по передаче российских ценных бумаг, выплат по российским ценным бумагам, приобретенным в результате инвестиций, исполняются перед иностранным инвестором только с использованием счетов типа «Ин». rbc.group О том, что Минфин и Центробанк подготовили проект указа президента, который дает гарантии иностранным инвесторам на то, что они смогут вывести вложения из России, стало известно в декабре 2024 года. Замминистра финансов Иван Чебесков в интервью РБК отмечал, что в первую очередь речь идет о так называемых новых деньгах — иностранных инвестициях, которые приходят в российский фондовый рынок. «Если иностранный инвестор захочет проинвестировать в акции, в облигации наших компаний, то он сможет это делать без ограничений на дальнейший вывод и репатриацию этих средств, вне зависимости от того, из какой страны эти деньги пришли», — объяснял Чебесков. Материал дополняется	10	\N	2025-07-01 17:05:01	2025-07-01 17:05:01
183	651	rubio-nazval-datu-svorachivaniya-usaid-programm-inostrannoy-pomoshchi	Рубио назвал дату сворачивания USAID программ иностранной помощи	https://s0.rbk.ru/v6_top_pics/media/img/0/91/347513778260910.jpeg	Марко Рубио (Фото: Joe Raedle / Getty Images) Агентство США по международному развитию USAID официально сворачивает программы иностранной помощи 1 июля, сообщил госсекретарь США Марко Рубио. «С 1 июля USAID официально прекратит реализацию программ иностранной помощи. Программы помощи, соответствующие политике администрации и продвигающие интересы Америки, будут осуществляться государственным департаментом», — написал Рубио в сервисе Substack. Он добавил, что у USAID были «десятилетия и практически неограниченный бюджет налогоплательщиков», чтобы усилить американское влияние и содействовать экономическому развитию во всем мире. rbc.group «Каждый государственный служащий обязан гарантировать американским гражданам, что любые финансируемые им программы способствуют интересам нашей страны. <...> В ходе тщательного анализа администрацией [президента США Дональда] Трампа тысяч программ <...> стало очевидно, что Агентство США по международному развитию (USAID) значительно не соответствует этому стандарту», — отметил Рубио. rbc.group Оставшихся сотрудников USAID уволят до сентября Политика USAID было создано в 1961 году президентом Джоном Кеннеди. Трамп, вернувшись в январе этого года в Белый дом, подверг агентство критике: он обвинял его в коррупции на «невиданном ранее» уровне. Материал дополняется	8	\N	2025-07-01 17:05:02	2025-07-01 17:05:02
184	658	zelenskiy-i-sovet-evropy-sozdali-spectribunal-po-konfliktu-na-ukraine	Зеленский и Совет Европы создали спецтрибунал по конфликту на Украине	https://s0.rbk.ru/v6_top_pics/media/img/9/93/347513781386939.jpeg	По мнению Зеленского, трибунал позволит Киеву «добиться справедливости». Россия отказывалась признавать легитимность какого-либо трибунала по Украине по инициативе ЕС, из Совета Европы она вышла три года назад Владимир Зеленский (Фото: Thomas Peter / Reuters) Киев и Совет Европы подписали соглашение о создании «Специального трибунала по преступлению агрессии против Украины», сообщил президент страны Владимир Зеленский в телеграм-канале. «Сегодняшнее соглашение и этот трибунал дают нам реальный шанс добиться справедливости за преступление агрессии. Мы должны ясно показать: агрессия ведет к наказанию. И мы должны сделать это вместе, всей Европой», — подчеркнул он. Зеленский уточнил, что соглашение о создании трибунала должен быть ратифицировано, и сказал, что «только что подписал» соответствующие документы. Документ должна одобрить Верховная рада, украинский президент попросил депутатов рассмотреть этот вопрос «безотлагательно». rbc.group К управлению трибуналом смогут присоединиться как члены Совета Европы, так и не входящие в него страны. rbc.group Запрос на создание трибунала от Украины поступил 13 мая, на следующий день главы МИД стран Совета Европы одобрили эту идею. При этом обсуждение создания какого-либо трибунала из-за конфликта длилось с 2022-го. В том же году Россия вышла из Совета Европы. Каллас выразила надежду, что США присоединятся к спецтрибуналу по России Политика В Совете ЕС отметили, что создание трибунала позволило «восполнить пробел», связанный с невозможностью Международного уголовного суда (МУС) расследовать события на Украине из-за ограничений юрисдикции (Россия ее не признает). Тем не менее, этот суд выдал ордеры на арест президента Владимира Путина, экс-министра обороны Сергея Шойгу и некоторых других высокопоставленных россиян. Москва называла эти решения юридически ничтожными. В феврале, комментируя позицию стран Совета Европы, желающих создать трибунал для России, пресс-секретарь президента Дмитрий Песков оценил ее как однобокую и неконструктивную. По его словам, международные структуры и их экспертов в данной ситуации Россия не может «как-то воспринимать, считать экспертами» и «соответствующим образом» к ним относится. В 2022-м Песков подчеркивал, что Россия не будет считать легитимным создание по инициативе Евросоюза специального трибунала, который будет заниматься расследованием действий России на Украине. Читайте РБК в Telegram.	1	\N	2025-07-01 17:05:02	2025-07-01 17:05:02
1199	3120	nvidia-prevzoshla-apple-i-ustanovila-novyy-mirovoy-rekord-po-kapitalizacii	NVIDIA превзошла Apple и установила новый мировой рекорд по капитализации		Акции NVIDIA дорожают из-за роста оптимизма Уолл-стрит в отношении искусственного интеллекта. Это позволило компании ненадолго стать самой дорогой за всю историю рынков NVIDIA NVDA +1,33% Apple AAPL +0,52% Фото: Jack Hong / Shutterstock Акции NVIDIA (NVDA) на NASDAQ в четверг, 3 июля, подорожали на пике на 2,37%, до $160,98 за бумагу, в результате чего рыночная стоимость NVIDIA достигла $3,92 трлн. Как пишет Reuters, это ненадолго сделало NVIDIA самой дорогой публичной компанией в истории. Чипмейкеру удалось побить рекорд Apple, который производитель iPhone установил 26 декабря 2024 года на отметке $3,915 трлн. Однако к концу торгов в четверг рост акций NVIDIA замедлился до 1,33%, а цена откатилась к $159,34, следует из данных торгов биржи NASDAQ. Бигтех завершил день с капитализацией  $3,89 трлн, свидетельствуют данные TradingView.  «Когда первая компания преодолела отметку в триллион долларов, это было потрясающе. А теперь речь идет о четырех триллионах, что просто невероятно. Это говорит о том, что сейчас наблюдается огромный ажиотаж вокруг расходов на искусственный интеллект, и все гонятся за ним», — говорит один из торговых управляющих в Themsis Trading Джо Салуцци. rbc.group Капитализация NVIDIA выросла на $1 трлн за два месяца Акции , NVIDIA , Китай По подсчетам Reuters, рыночная стоимость NVIDIA за последние четыре года выросла почти в восемь раз — с $500 млрд в 2021 году до почти $4 трлн в настоящее время. Стоимость NVIDIA сейчас превышает совокупную капитализацию фондовых рынков Канады и Мексики. Бигтех также стоит дороже, чем все публичные компании в Великобритании вместе взятые. Акции разработчика выросли более чем на 68% по сравнению с минимумом 4 апреля, когда Уолл-стрит была потрясена новостями о том, что президент США Дональд Трамп вводит торговые пошлины. Акции NVIDIA потеряли 7% из-за запрета на экспорт чипов H20 в Китай Акции , NVIDIA , Китай Растущая капитализация NVIDIA отражает большие ставки Уолл-стрит на распространение технологии генеративного искусственного интеллекта, основой которого является оборудование NVIDIA. Как отмечает Reuters, резкий рост акций компании и других «тяжеловесов» привел к тому, что люди, которые откладывают деньги на пенсию через индексные фонды S&P 500, оказались сильно зависимы от будущего технологии искусственного интеллекта. «Я твердо верю, что искусственный интеллект (ИИ) — это чрезвычайно продуктивный инструмент, но я совершенно убежден, что нынешнее внедрение ИИ через языковые модели и большие модели рассуждений вряд ли оправдает ажиотаж», — предупредила директор по инвестициям Bokeh Capital Partners Ким Форрест. Мировые компании с высокой капитализацией В топ-5 компаний с самой высокой капитализацией, по данным Trading View, входят: NVIDIA, американская компания, ведущий производитель графических процессоров, Капитализация компании составляет $3,89 трлн. Microsoft, американская компания, один из крупнейших в мире разработчиков программного обеспечения для персональных компьютеров, игровых приставок, мобильных телефонов и прочего. Капитализация компании составляет $3,71 трлн Apple, американская корпорация, разработчик персональных и планшетных компьютеров, аудиоплееров, смартфонов, программного обеспечения и цифрового контента. Капитализация компании составляет $3,19 трлн. Amazon.com, американская компания, занимается электронной коммерцией, облачными вычислениями, онлайн-рекламой, цифровой потоковой передачей и искусственным интеллектом. Капитализация составляет $2,37 трлн. Alphabet, холдинговая компания Google и ее дочерних структур. Рыночная капитализация компании составляет $2,18 трлн. Стоимость компании на рынке, рассчитанная из количества акций компании, умноженного на их текущую цену. Капитализация фондового рынка – суммарная стоимость ценных бумаг, обращающихся на этом рынке.	4	\N	2025-07-04 11:05:02	2025-07-04 11:05:02
1242	3742	yablochnye-fantazii-smozhet-li-sidr-stat-zamenoy-pivu-i-vinu-v-rossii	Яблочные фантазии: сможет ли сидр стать заменой пиву и вину в России	https://s0.rbk.ru/v6_top_pics/media/img/3/30/347516293645303.webp	Действительно ли россияне все чаще покупают сидр и сможет ли этот напиток потеснить пиво или составить конкуренцию вину? Опрошенные «РБК Вино» эксперты считают, что перспективы есть — но существуют и нюансыПо данным статистики, в России в 2025 году существенно вырос объем продаж сидраПодпишитесь на телеграм-канал «РБК Вино»В России в 2025 году значительно выросла популярность сидра у потребителей. Об этом «РБК Вино» сообщили в исследовательской компании «Ромир».По данным аналитиков, это произошло за счет притока новой аудитории (хотя бы раз сидр покупали уже 5,3% россиян старше 18 лет) и за счет того, что потребители, которые уже пробовали сидр, стали покупать его чаще. Выросла не только средняя частота покупки сидра, но и средний чек — до 203 руб.Рост популярности сидра в России подтверждается и данными государственной статистики. Как рассказали «РБК Вино» в Росалкогольтабакконтроле, за январь—май 2025 года продажи выросли на 54,9%. Если в 2024 году за пять месяцев было реализовано 2,2 млн дал сидра, то в 2025 году — уже 3,5 млн дал (служба уточнила, что данные за текущий год посчитаны на основании актов списания с причиной «реализация»).В аналитической компании «Нильсен» также говорят о росте продаж сидра в России. За январь—апрель прибавка в этой категории по сравнению с данными 2024 года составила 164,5% в денежном и 68,2% в натуральном выражении.Объем производства сидра в России за первые пять месяцев 2025 года тоже вырос. Он прибавил 15,1% и составил 3,9 млн дал вместо 3,4 млн дал за тот же период годом ранееОбъем производства сидра в России за первые пять месяцев 2025 года тоже вырос. Он прибавил 15,1% и составил 3,9 млн дал вместо 3,4 млн дал за тот же период годом ранее. Большая часть сидров (74%) была произведена в пяти регионах страны, где сосредоточены основные сидродельни.Взгляды на то, почему в России растут производство и потребление сидра, разнятся. Директор по работе с клиентами «Ромира» Маргарита Абрамкина считает, что меняются потребительские привычки россиян: потребители ищут альтернативу традиционным напиткам, а сидр «идеально вписывается в тренд на натуральность». Исполнительный директор Ассоциации производителей пива, солода и напитков Вячеслав Мамонтов называет причинами роста активное формирование гастрономической культуры, развитие потребительских предпочтений и желание потребителей пробовать новые вкусы.Потребители в России, действительно, стали чаще интересоваться традиционными сидрами и популярность этой категории растет, согласен Сергей Бочковенко, основатель компании «Яблочко» (выпускает традиционные сидры). «Я всю жизнь занимался производством фруктовых сидров, а год назад я начал делать именно традиционные сидры, потому что вижу в этом направлении потенциал. Его популяризация идет, например, через ярмарки и фестивали, и люди уже нормально воспринимают, что сидр может стоить дороже пива», — отметил он в разговоре с «РБК Вино». По словам Бочковенко, выросло и количество наименований сидров на полках масс-маркета, что тоже говорит о востребованности этой категории.Между тем аналитики «Нильсен» отмечают, что рост связан не только с популярностью самого напитка, но и с тем, что производители, которые ранее маркировали свою продукцию как плодово-ягодные напитки начали писать на этикетках «сидр». Так, по данным компании, в 2024 ряд крупных брендов игристого «вина» (например, Santo Stefano, Bosca, Lavetti), которые в силу технологии производства логичнее отнести к плодово-ягодным напиткам, с точки зрения позиционирования на упаковке «перешли» в категорию сидра. Такое уточнение определений напитков в зависимости от состава и способа производства заметно сказалось на динамике продаж обеих категорий, уточнили в «Нильсен».«Сидром мы можем смело называть напиток, который производится из яблочного сока прямого отжима путем брожения. Этот сидр называют традиционным. А у нас сидром называют и напиток из концентрата, и те напитки, которые раньше назывались слабоалкогольной плодовой продукцией. По сути, к сидру они отношения вообще не имеют, но у нас нет закона, который бы защищал это наименование, как это происходит в случае с вином», — говорит глава Союза производителей традиционного сидра Алексей Небольсин.Он отметил, что традиционный сидр и плодовые или фруктовые напитки, которые именуют сидром производители, принципиально отличаются как по вкусу, так и по составу. В традиционном сидре из добавок, по его словам, может быть только диоксид серы. В остальном это полностью натуральный продукт. По словам Небольсина, Союз проводил исследование образцов сидров на полках супермаркетов, из которых ни один не соответствовал требованиям ГОСТа. После этого некоторые партии продукции были отозваны, а общий объем производства в этой категории за май и июнь 2025 года сократился.Мамонтов также отмечает миграцию в категорию сидров других напитков и говорит о том, что этот процесс вызывает опасения и у пивоваров. «Такая мимикрия, порой, напитков сомнительного качества и происхождения под пивные напитки и сидры негативно влияет на пивоваренную отрасль. На полке магазина потребитель не всегда может отличить пиво и сидр от коктейля, поэтому мы рекомендуем внимательно изучать состав и приобретать продукцию только проверенных и всем известных производителей», — добавил он.Рост популярности сидра может быть связан и с общим трендом на сокращение потребления алкоголя, который продвигают власти в странеРост популярности сидра может быть связан и с общим трендом на сокращение потребления алкоголя, который продвигают власти, считает президент гильдии экспертов алкогольного рынка «Алкопро» Андрей Московский. По его словам, одним из путей развития этого тренда может быть переключение потребителей с более крепких напитков на напитки полегче, к которым относится сидр.Опрошенные «РБК Вино» эксперты считают, что традиционный классический сидр имеет потенциал к росту. Этот напиток не сможет конкурировать с крепким алкоголем, но в перспективе вполне сможет перетянуть на себя как часть аудитории, которая предпочитала слабоалкогольную продукцию (часть из которой сейчас и выпускают под наименованием «сидр»), так и часть тех, кто предпочитает некрепкое пиво и даже вино.«В первую очередь, на сидр могут переключиться те, кому нравится легкое вкусовое пиво или пивные напитки. Понятно, что любители крепкого пива — это не целевая аудитория сидра, а вот там, где потребителю важен вкус, это возможно. Кроме того, сидр может выступать и некой заменой вина. Он есть и тихий, и игристый, и в целом напитки схожи, особенно в плане совмещения с гастрономией», — считает Московский.О том, что аудиторией сидра могут стать любители вина, говорит и Бочковенко. По его словам, это связано в том числе с ростом стоимости вина, однако он подчеркивает, что сегмент, который станет предпочитать сидры вину, будет небольшим. «Я делаю ставку на безалкогольный сидр. О нем пока мало, кто знает. Скорее всего, в категорию безалкогольных сидров будут переходить те, кто любит квас или безалкогольные вина. Я надеюсь, сюда перейдут и те, кто любит энергетики, потому что безалкогольный сидр — это естественный изотоник, который в том числе помогает восстанавливаться после физических нагрузок», — добавил он.Небольсин говорит, что сидру в России еще есть, куда расти. По его словам, до революции 1917 года в Российской империи производили 200 млн литров сидра в год. Сейчас этот объем он оценил на уровне 6-7 млн литров.«Точка роста есть и в объемах потребления сидра в России. В Европе на душу населения в год приходится в среднем 1,7 л, а у нас это 0,5 л. Мы яблочная страна и мы просто обязаны наращивать производство традиционного сидра, но для этого нужно в том числе, чтобы на государственном уровне сидром разрешили называть только традиционный напиток из яблок и груш без смешения с водой», — уверен он.По оценке Московского, кратный рост производства и потребления сидра в России возможен в перспективе 5-10 лет. Помочь в этом сможет как активность производителей на продвижение продукта, так и возможные уточнения стандарта для защиты категории от имитаций.	5	\N	2025-07-07 09:05:02	2025-07-07 09:05:02
428	1282	v-golovnom-ofise-tashira-karapetyana-v-erevane-proshli-obyski	В головном офисе «Ташира» Карапетяна в Ереване прошли обыски	https://s0.rbk.ru/v6_top_pics/media/img/9/72/347514469568729.jpeg	Глава компании миллиардер Карапетян был арестован две недели назад по делу о призывах к захвату власти. СК Армении утверждает, что проводит обыски в рамках расследования Самвел Карапетян (Фото: Роман Шеломенцев / РБК) Силовики пришли с обысками в головной офис группы компаний «Ташир» Самвела Карапетяна в Ереване, передает News.am и Armenia Today. В СК республики подтвердили, что проводят неотложные следственные действия в рамках уголовного дела. Карапетян был арестован 18 июня по обвинению в публичных призывах к захвату власти (ч. 2 ст. 422 УК Армении). Его защита сообщала, что обвинения основаны на интервью бизнесмена, где он сказал, что «по-своему» примет участие в разрешении ситуации вокруг Армянской Апостольской церкви (ААЦ). В конфликт с церковью ранее вступил премьер Никол Пашинян, призывавший к отставке ее лидера, католикоса Гарегина II. Некоторым священнослужителям также предъявлены обвинения в попытке захвата власти. rbc.group Карапетян отверг, что призывал к участию «в каких-либо политических процессах». rbc.group Пашинян пригрозил уволить протестующих сотрудников компании Карапетяна Политика Карапетяну 59 лет, он владеет компанией «Ташир Групп». Его состояние — $3,2 млрд по версии российского Forbes. Компания носит название в честь его родного города в Армении. В число ее активов в России входят торговые центры «Рио» и Фора-банк, а в Армении группе принадлежат «Электрические сети», обеспечивающие более 1 млн потребителей. Премьер-министр Никол Пашинян угрожал национализировать эту энергокомпанию. Адвокат Карапетяна Арам Вардеванян сказал, что бизнесмен был заключен под стражу для беспрепятственной национализации «Электросетей», которую обещал в скором времени начать Пашинян. Защита ранее отозвала апелляцию на арест бизнесмена в местные судебные органы, отметив, что готовит жалобу в Европейский суд по правам человека. Читайте РБК в Telegram.	4	\N	2025-07-02 12:35:03	2025-07-02 14:37:44
434	1394	v-ingushetii-proshli-obyski-u-glavy-mvd-respubliki	В Ингушетии прошли обыски у главы МВД республики	https://s0.rbk.ru/v6_top_pics/media/img/7/58/347514523741587.jpeg	Михаил Коробкин (Фото: МВД по Республике Ингушетия) В Ингушетии проходят обыски у главы управления МВД по республике, сообщает ТАСС со ссылкой на правоохранительные органы региона. Главой регионального управления МВД является генерал-лейтенант полиции Михаил Коробкин. «Два месяца назад были задержаны руководители финотделов как регионального МВД, так и районных и муниципальных отделов. Из Москвы прибыла первая группа Главного управления собственной безопасности МВД РФ и провела обыски в ведомстве и у министра. Обыски проходили в рамках расследования дела о хищении федеральных средств», — сказал собеседник агентства. Об обысках у руководящего состава полиции региона и у помощника министра накануне сообщил «Интерфакс». Агентство писало, что по делу о многомиллионных хищениях задержаны глава центра финансового обеспечения республиканского МВД, начальник финотдела (находится под домашним арестом) и сотрудница бухгалтерии ОМВД России по Сунженскому району. rbc.group Суд вынес приговор по делу о покушении на экс-вице-премьера Ингушетии Политика rbc.group О том, что оперативники собственной безопасности МВД выявили факты возможной причастности нескольких сотрудников республиканского управления ведомства и подведомственных территориальных подразделений на районном уровне «к хищению денежных средств, выделенных на финансирование деятельности органов внутренних дел», стало известно в мае. Провинившихся сотрудников пообещали уволить, их руководителей - привлечь к дисциплинарной ответственности.  Материал дополняется.	8	\N	2025-07-02 13:45:05	2025-07-02 14:05:53
435	1438	kiev-reshil-poprosit-obyasneniy-u-ssha-iz-za-soobshcheniy-o-zaderzhkah-pomoshchi	Киев решил попросить объяснений у США из-за сообщений о задержках помощи	https://s0.rbk.ru/v6_top_pics/media/img/8/85/347514541228858.jpeg	Фото: Nikoletta Stoyanova / Getty Images Украина видит сообщения о задержке поставок согласованной США военной помощи, официальных уведомлений на этот счет не поступало, сообщило Минобороны страны. «Министерство обороны Украины запросило телефонный разговор с коллегами из США для дополнительного уточнения деталей. <...> Отдельные лица в Украине, которые в настоящее время дают публичные комментарии по этой ситуации, по объективным причинам не владеют всеми фактическими данными», — рассказали в ведомстве. Ранее данные о задержках поставок приводили Politico и NBC News. Первое издание писало, что Пентагон приостановил поставки Украине некоторых зенитных ракет и других высокоточных боеприпасов после проверки собственных запасов и опасений в их сокращении. rbc.group По данным телеканала, задержаны поставки: rbc.group десятков ракет для системы ПВО Patriot; тысяч осколочно-фугасных артиллерийских снарядов калибра 155 мм для гаубиц; более ста ракет Hellfire; более 250 высокоточных ракет GMLRS; десятки ракет класса «земля — воздух» Stinger, ракеты класса «воздух — воздух» AIM; гранатометов. МИД Украины вызвал дипломата США из-за ограничения поставок оружия Политика В МИД Украины ранее пригласили временного поверенного в делах США Джона Хинкеля из-за приостановки поставок отдельных видов вооружения.  Материал дополняется	6	\N	2025-07-02 14:15:04	2025-07-02 14:15:04
1015	2189	zelenskiy-lishil-grazhdanstva-mitropolita-onufriya	Зеленский лишил гражданства митрополита Онуфрия	https://s0.rbk.ru/v6_top_pics/media/img/4/46/347514605348464.jpeg	Митрополит Онуфрий (Фото: church.ua / Global Look Press) Украина лишила гражданства предстоятеля Украинской православной церкви митрополита Онуфрия (в миру Орест Березовский), сообщила Служба безопасности Украины (СБУ) в телеграм-канале. «По материалам СБУ было прекращено украинское гражданство Ореста Березовского, больше известного как деятель УПЦ (МП) Онуфрий. Соответствующий указ подписал президент Украины Владимир Зеленский», — говорится в сообщении. По данным СБУ, Онуфрий «добровольно получил гражданство России в 2002 году», о чем не уведомил украинские власти. rbc.group Митрополит «поддерживает связь с московской патриархией и сознательно противодействовал получению канонической независимости украинской церкви от московской патриархии», заявила СБУ. Он «фактически продолжает поддерживать политику РПЦ и ее руководства, в частности, патриарха Кирилла», сказала спецслужба. rbc.group Материал дополняется	1	\N	2025-07-02 16:05:02	2025-07-02 16:05:02
1167	2770	pogib-forvard-liverpulya-i-sbornoy-portugalii-diogu-zhota	Погиб форвард «Ливерпуля» и сборной Португалии Диогу Жота		Жота находился в автомобиле со своим 26-летним братом Андре, тоже профессиональным футболистом. Нападающий сборной Португалии и «Ливерпуля» Диогу Жота погиб в автокатастрофе. Об этом сообщает Marca. Жота находился в автомобиле со своим 26-летним братом Андре, тоже профессиональным футболистом. Материал дополняется...	5	\N	2025-07-03 11:35:02	2025-07-03 11:35:02
1160	2673	karpin-zayavil-o-roste-slozhnostey-s-podpisaniem-legionerov-v-tysyachi-raz	Карпин заявил о росте сложностей с подписанием легионеров в «тысячи раз»	https://s0.rbk.ru/v6_top_pics/media/img/3/02/347513794302023.jpeg	Валерий Карпин считает, что подписание контракта и переезд иностранного футболиста в Россию значительно усложнились Валерий Карпин (Фото: Михаил Гребенщиков/РБК) В тысячу раз возросли трудности, с которыми сталкиваются российские клубы при попытке привезти легионера в Россию. Об этом в интервью «РБК Спорт» рассказал главный тренер российской сборной по футболу и московского «Динамо» Валерий Карпин. «Не могу сказать, насколько процент отказов увеличился (при подписании легионеров). Стало сложнее? Да, в тысячу раз сложнее», — сказал Карпин. Карпин — РБК: «Зарплаты футболистов в России завышены минимум на 50%» Спорт rbc.group Валерий Карпин, возглавляющий сборную России с 2021 года, в июне этого года также стал главным тренером московского «Динамо». Ранее он работал тренером в московском «Спартаке», испанской «Мальорке», армавирском «Торпедо» и «Ростове». rbc.group С февраля 2022 года, после начала специальной военной операции на Украине, сборная России и российские футбольные клубы отстранены от участия в международных соревнованиях. За это время неоднократно срывались переходы из европейских чемпионатов в РПЛ. Так, в 2023 году бразильский защитник «Сассуоло» Рожерио не смог перейти в «Спартак». В итальянском клубе сказали, что «переговоров с Россией не будет» из-за ситуации на Украине.	1	\N	2025-07-03 10:15:02	2025-07-03 10:15:02
1168	2792	pochemu-genprokuratura-trebuet-peredat-yuzhuralzoloto-gosudarstvu	Почему Генпрокуратура требует передать «Южуралзолото» государству	https://s0.rbk.ru/v6_top_pics/media/img/8/53/347515349833538.jpeg	Надзорное ведомство требует обратить в доход государства активы, которые, по мнению прокуратуры, были приобретены владельцем «Южуралзолото» с использованием служебного положения. РБК узнал, в чем суть претензий Генпрокуратуры Южуралзолото UGLD ₽0,539 -6,16% Купить Константин Струков (Фото: Вадим Ахметов / URA.ru / Global Look Press) Генпрокуратура обратилась в Советский районный суд Челябинска с требованием изъять активы заместителя председателя законодательного собрания Челябинской области и главы ЮГК Константина Струкова и еще семи ответчиков. По информации источника РБК в Генпрокуратуре и собеседника знакомого с иском, суть претензий к бизнесмену и его структурам заключается в следующем: С 2000 года Струков занимает должность депутата регионального парламента, а с 2017 года является заместителем его председателя. При этом он состоит в комитете по экологии и природопользованию, что, как указано в иске, обеспечивало ему доступ к информации о приоритетных инфраструктурных проектах в сфере недропользования, приоритетах государственной политики по их развитию. По мнению Генпрокуратуры, Струков имел возможность вводить такое нормативное регулирование, которое было выгодно бизнес-интересам подконтрольных ему коммерческих организаций. Акции ЮГК обрушились на 17% после иска о конфискации компании Инвестиции rbc.group По словам собеседника РБК, в ведомстве считают, что за 24 года в региональном парламенте депутат «приобрел безграничное влияние на административно-властные структуры региона и сегодня выступает фактическим руководителем законодательного органа», а также использует статус для создания незаконных преференций и неконкурентных преимуществ собственному бизнесу. rbc.group По словам собеседника РБК, Генпрокуратура считает, что Струков в 1997 году установил контроль над государственным предприятием «Южуралзолото», когда был назначен директором компании при губернаторе Челябинской области Петре Сумине (занимал пост с 1997 по 2010 годы). Предприятие было преобразовано в ОАО, а затем — через процедуру банкротства — передано подконтрольной Струкову структуре ПАО «Южуралзолото Группа Компаний» (ЮГК). Активы предприятия были выведены в пользу нового юридического лица, где Струков сохранил ключевые управленческие позиции. Сейчас холдинг производит 450 тыс. унций золота в год, осваивает месторождения на территории Челябинской области, Красноярского края и Хакасии. Его капитализация превышает 180 млрд рублей, ежегодная выручка составляет 54 млрд. рублей, валовая прибыль — 34 млрд. рублей. Тем самым депутат, курирующий недропользование, «сосредоточил в своем подчинении ключевые активы в данной сфере, монополизировав стратегическую отрасль по добыче золота в Уральском и других федеральных округах», говорится в иске Генпрокуратуре, говорит собеседник РБК. По информации источника, Струков управлял холдингом напрямую, либо через доверенных лиц. В частности, в 2022 году доля в ЮГК была оформлена на кипрскую компанию UGOLD LIMITED, номинальным владельцем которой числится его дочь Александра Струкова — гражданка Швейцарии. После возврата акций в российскую юрисдикцию они вновь были зарегистрированы на Струкова. Среди других ответчиков по делу — предполагаемые аффилированные лица Струкова. В списке третьих лиц — ПАО «Южуралзолото Группа Компаний», ООО «УК ЮГК», а также компании «Бизнес-Актив», «Хоум» и «Уралвент», зарегистрированные в Челябинске. Как отмечает источник РБК в Генпрокуратуре, в иске отмечается, что доходы от бизнеса Струков выводит в значительных объемах за границу, где он и его родственники приобретают недвижимость, автомобили, яхты и иные предметы роскоши, а доходы организаций не идут на повышение зарплаты сотрудников и на поддержание безопасной работоспособности оборудования, что влечет наступление чрезвычайных ситуаций. Выявленные нарушения со стороны Струкова и связанных с ним лиц по неправомерному обогащению отнесены законом к актам коррупции, угрожающим стабильности и безопасности общества, говорится в иске Генпрокуратуры, отметил собеседник РБК. РБК направил запросы в ЮГК и представителю Струкова. Накануне сотрудники региональных управлений ФСБ и СК по Челябинской области пришли с обысками в офисы ЮГК, в том числе на рабочее место Струкова. По словам источника РБК в правоохранительных органах, следственные действия были связаны с нарушением правил охраны окружающей среды, промышленной безопасности и эксплуатации промышленных объектов на земельных участках компании в Пластовском и Еткульском районах.	4	\N	2025-07-03 12:45:02	2025-07-03 12:45:02
461	1458	kreml-otreagiroval-na-zvonok-zelenskogo-alievu-na-fone-obostreniya-s-baku	Кремль отреагировал на звонок Зеленского Алиеву на фоне обострения с Баку	https://s0.rbk.ru/v6_top_pics/media/img/9/11/347514492045119.jpeg	Песков отметил, что Украина будет провоцировать Азербайджан на дальнейшие «эмоциональные действия». Зеленский и Алиев пообщались 1 июля, когда Баку стал задерживать россиян после задержания уроженцев республики в России Виды Баку (Фото: Мурад Оруджев / Sputnik / РИА Новости) Киев будет «подливать масла в огонь» на фоне обострения российско-азербайджанских отношений, заявил пресс-секретарь президента Дмитрий Песков, комментируя телефонные переговоры президентов Азербайджана и Украины Ильхама Алиева и Владимира Зеленского, которые прошли 1 июля. «Украина будет делать все возможное, чтобы подливать масла в огонь, чтобы провоцировать азербайджанскую сторону на продолжение эмоциональных действий», — сказал он (цитата по «Интерфаксу»). Зеленский указывал, что «выразил со стороны Украины поддержку в ситуации, когда Россия издевается над гражданами Азербайджана и угрожает Азербайджану». Алиев выразил признательность за выраженные украинским лидером соболезнования. rbc.group Россия ведет переговоры с Азербайджаном на уровне правоохранительных органов, добавил Песков. В контакте находятся председатель СК России Александр Бастрыкин и генпрокурор Азербайджана Камран Алиев. rbc.group Пресс-секретарь подчеркнул, что Россия будет защищать законные интересы своих граждан «по дипломатическим каналам» и с помощью всех имеющихся средств. Баку заявил о нарушении прав азербайджанцев в России Политика К ухудшению отношений Москвы и Баку привели задержания в Екатеринбурге уроженцев республики. Российские правоохранительные органы арестовали шесть представителей диаспоры по подозрению в причастности к убийствам и покушениям на убийство, совершенным в 2001, 2010 и 2011 годах. Во время следственных действий двое подозреваемых скончались. Российские следователи сообщили, что один из задержанных умер от сердечного приступа, причины гибели второго устанавливали. Но в Азербайджане после судмедэкспертизы заявили, что обнаружили травмы на телах погибших. Это послужило основанием для возбуждения в республике уголовного дела по статьям об убийстве, применении пыток и злоупотреблении служебным положением. В ответ на эти события азербайджанские власти начали собственные расследования в отношении российских граждан. В Баку прошел обыск в офисе Sputnik Azerbaijan, под стражу были взяты исполнительный директор Игорь Картавых и шеф-редактор Евгений Белоусов по обвинениям о мошенничестве, незаконном предпринимательстве и легализации преступных доходов. Помимо этого, 1 июля стало известно о задержании в Азербайджане еще восьми россиян, подозреваемых в наркоторговле и киберпреступлениях. Читайте РБК в Telegram.	2	\N	2025-07-02 14:25:01	2025-07-02 14:25:01
1080	2330	postpred-ssha-pri-nato-obyasnil-pauzu-v-postavkah-oruzhiya-na-ukrainu	Постпред США при НАТО объяснил паузу в поставках оружия на Украину	https://s0.rbk.ru/v6_top_pics/media/img/5/15/347514630217155.jpeg	Фото: Sean Gallup / Getty Images Постоянный представитель США при НАТО Мэттью Уитакер заявил в интервью телеканалу Fox Business, что пауза в поставках оружия Украине связана с приоритетом собственных нужд Вашингтон. «Самое важное, что нужно понять, — то, как выглядит политика «Америка прежде всего». В первую очередь мы должны заботиться о нуждах самих США. Пентагон всегда следит за тем, чтобы у США были стратегические оборонные возможности, необходимые для проецирования силы», — сказал Уитакер. Вашингтон должен быть уверен, что американская армия имеет достаточное количество систем ПВО, в том числе Patriot, чтобы обеспечить «собственный успех на поле боя, где бы оно ни было», объяснил он. rbc.group Как заявила ранее заместитель пресс-секретаря Белого дома Анна Келли, решение о приостановке поставок было принято, чтобы «поставить интересы Америки на первое место, после того, как Министерство обороны провело обзор военной поддержки». rbc.group Материал дополняется	9	\N	2025-07-02 16:55:02	2025-07-02 16:55:02
1081	2345	gref-zayavil-o-neobhodimosti-bolee-sereznogo-snizheniya-klyuchevoy-stavki	Греф заявил о необходимости более серьезного снижения ключевой ставки	https://s0.rbk.ru/v6_top_pics/media/img/6/94/347514631678946.jpeg	Снижение ключевой ставки на 100–200 базисных пунктов будет неощутимым для экономики, заявил глава Сбербанка Герман Греф. Он призвал Банк России к более решительным шагам Сбербанк SBER ₽319,16 +0,23% Купить Сбербанк SBERP ₽316,05 +0,22% Купить Герман Греф (Фото: Петр Ковалев / ТАСС) Ожидаемое снижение ключевой ставки в июле должно быть более существенным, чем на 100–200 базисных пунктов, поскольку такое смягчение не окажет ощутимого эффекта на экономику. Об этом заявил на Финансовом конгрессе Банка России глава Сбербанка Герман Греф. «Очевидно, что снижение назрело и, на мой взгляд, снижение на 100 или 200 базисных пунктов — оно будет совершенно неощутимым. Нужно делать значительно более серьезный шаг», — подчеркнул он. По словам главы Сбербанка, реальная ставка на данный момент составляет 15–16% и сегодня экономика под «беспрецедентным давлением». rbc.group Греф добавил, что не видит рисков в случае ускоренного снижения ставки, а давление на ЦБ со стороны бизнеса объяснил как проявление «реальной озабоченности». «Я такой опасности вообще не ощущаю. Такое давление очевидно... Это демонстрация реальной озабоченности ситуацией, которая сложилась», — отметил он. rbc.group Набиуллина назвала условия для более быстрого снижения ставки Финансы ЦБ пока не определился, какое решение по ключевой ставке будет принято на заседании в июле, заявила ранее глава регулятора Эльвира Набиуллина. По ее словам, подход к снижению ставки требует большей осторожности, а в случае прекращения устойчивого снижения инфляции или ее роста не исключено повышение ключевой ставки. В июне Банк России первый раз с осени 2022 года снизил ключевую ставку до 20% годовых. Все это время она держалась на рекордном уровне — 21%. К концу года ключевая ставка может опуститься до 15–16%, заявил ранее Греф на полях Петербургского международного экономического форума. По его словам, траектория снижения ключевой ставки будет зависеть от проявления проинфляционных факторов. Читайте РБК в Telegram.	4	\N	2025-07-02 17:05:04	2025-07-02 17:05:04
1083	2365	karpin-rasskazal-chto-zhdet-rossiyskiy-futbol-bez-gazproma-i-gosbankov	Карпин рассказал, что ждет российский футбол без «Газпрома» и госбанков	https://s0.rbk.ru/v6_top_pics/media/img/2/73/347514636260732.jpeg	По мнению тренера сборной России, зависимость российских клубов от поддержки со стороны госкомпаний преувеличена. Если они решал урезать инвестиции, это даже оздоровит рынок, полагает Карпин Валерий Карпин (Фото: Михаил Гребенщиков/РБК) Российские топ-клубы получают очень значительные суммы от госкомпаний, но это не значит, что без них команды прекратят существование. Такое мнение в интервью «РБК Спорт» высказал главный тренер сборной России и московского «Динамо» Валерий Карпин. По его мнению, сокращение вложений со стороны крупных спонсоров способно даже оздоровить ситуацию в российском футболе. «Рынок станет реальным. Он просто будет реальным, вот и все. Ни у кого не будет завышенных зарплат. <...> На сегодняшний день в среднем зарплаты футболистов в России завышены на 50% минимум», — сказал Карпин. rbc.group Карпин — РБК: «Зарплаты футболистов в России завышены минимум на 50%» Спорт rbc.group В этом контексте он напомнил о кризисе на американском рынке недвижимости, который положил начало мировому финансовому кризису 2008 года. «Был раздут рынок, и в один момент этот мыльный пузырь лопнул. То же самое может произойти (в футболе), если завтра скажут: «Больше не будет вливаний». Соответственно, все зарплаты будут соответствовать текущей ситуации на рынке. Не знаю, каким будет этот рынок», — сказал он. Российские футбольные клубы имеют давние партнерские отношения с крупными компаниями, в том числе с госучастием. «Зенит» получает финансовую поддержку от «Газпрома», ЦСКА — от ВЭБ.РФ, а «Динамо» — от ВТБ. «Спартак» с 2000 года связан с частной компанией ЛУКОЙЛ (а с 2022 года полностью принадлежит ей). Президент РФС Александр Дюков ранее заявил «Спорт-Экспрессу», что не видит логики в сокращении финансирования футбола госкомпаниями. Он также выступил против этой идеи. Валерий Карпин с 2021 года является главным тренером сборной России, а с июня 2025-го возглавил московское «Динамо». Ранее он работал с «Ростовом», «Спартаком», испанской «Мальоркой» и армавирским «Торпедо».	2	\N	2025-07-03 07:45:02	2025-07-03 07:45:02
1084	2366	milliarder-rybolovlev-podal-v-sud-na-partnera-po-investiciyam-v-biomed	Миллиардер Рыболовлев подал в суд на партнера по инвестициям в биомед	https://s0.rbk.ru/v6_top_pics/media/img/6/13/347513973069136.jpeg	Структуры Дмитрия Рыболовлева заявили о попытке его партнера по венчурному фонду ATP, объемом $2,7 млрд, присвоить в нем 50% их доли. Сам партнер пожаловался в суд Делавэра на отказ миллиардера выдавать ему средства на инвестиции Дмитрий Рыболовлев (Фото: Panoramic / Zuma / Global Look Press) Суд Каймановых островов зарегистрировал ходатайство структур, принадлежащих трасту семьи миллиардера Дмитрия Рыболовлева, следует из документа, имеющегося в распоряжении РБК. В нем они просят расформировать фонд венчурных инвестиций ATP Life Science Ventures, L.P. в связи со злоупотреблением служебным положением и нечестным ведением дел со стороны генерального партнера фонда — компании ATP III GP. Ltd. Заявители утверждают, что генеральный партнер, отвечающий за управление, хочет присвоить себе 50% их доли в фонде, действуя в интересах сооснователя — доктора Сета Харрисона. Чем известен фонд ATP Life Science Ventures, L.P. занимается венчурными инвестициями в технологии биомедицины. Компания зарегистрирована в 2012 году и сегодня имеет офисы в Нью-Йорке, Лондоне, Сан-Франциско и Кембридже (Массачусетс). Ее капитал оценивается почти в $2,7 млрд. Фонд инвестировал более чем в 30 трансформационных компаний, ориентированных на предоставление передовых методов лечения. rbc.group Что предшествовало спору rbc.group Еще до обращения структур Рыболовлева, 30 мая, ATP III GP инициировала судебное разбирательство, подав иск в суд Делавэра против Rigmora Biotech Investor One LP и Rigmora Biotech Investor Two LP (структуры семейного траста Рыболовлевых, выступающие ограниченными партнерами в фонде). На сайте фонда указывалось, что этот судебный процесс «направлен на то, чтобы заставить ограниченных партнеров выполнить свои договорные обязательства в соответствии с условиями соглашения об ограниченном партнерстве». «Мы боремся изо всех сил, чтобы гарантировать, что наши портфельные компании и инновации, разрабатываемые ими, могут продолжать движение вперед ради заинтересованных сторон и пациентов», — говорилось в заявлении. В иске утверждается, что семейный траст Рыболовлевых демонстрирует преднамеренное деструктивное с финансовой точки зрения поведение, отказываясь выполнять свои обязательства перед фондом. Речь идет о случаях, когда траст превентивно не отвечает на запросы капитала, которые обязан выполнять, или отказывается утверждать новые бюджеты портфельных компаний. Такие ситуации стали заметны с конца 2021 — начала 2022 года, но особенно участились в последние 18 месяцев, в которые траст «отчаянно пытается избежать своих инвестиционных обязательств», уверена ATP III GP. Суд в Монако аннулировал уголовное дело против миллиардера Рыболовлева Общество В итоге, складывается «чрезвычайная ситуация», и портфельным компаниям «грозит крах», поскольку эти средства «жизненно важны для продолжения их работы». «Это не вопрос перерасхода», — заявляет генеральный партнер. Кто такой доктор Харрисон Как говорится в ходатайстве, фонд ATP был основан «после обсуждений между доктором Сетом Харрисоном и доктором Дмитрием Рыболовлевым о формировании механизма инвестиций в индустрию биомедицины с использованием капитала предприятий, которые принадлежат трасту семьи Рыболовлевых». Харрисон инвестировал в биомедицину с 1991 года в качестве венчурного партнера в Sevin Rosen Funds и стал генеральным партнером в Oak Investment Partners. С 2002 по 2010 год он также входил в совет International Partnership for Microbicides, некоммерческого партнерства по разработке продуктов, ориентированного на здоровье женщин и профилактику ВИЧ. В настоящее время он входит в советы директоров всех портфельных компаний, созданных в рамках фонда ATP. В документе отмечается, что по состоянию на июнь 2025 года 99% из $2,7 млрд инвестированного в фонд капитала поступило от структур Рыболовлева. Оставшиеся $53,8 млн были вложены Харрисоном и его трастом Les Pommes, но «они в значительной степени были профинансированы кредитом, выданным Ezbon (одна из структур российского миллиардера)». Харрисон при этом руководит ATP III GP, Ltd. (генеральным партнером фонда), указано делавэрском иске компании. «Предательство» и да Винчи: как российский миллиардер судится с Sotheby's Технологии и медиа Вместе с тем, приходят к выводу заявители, «доктор Харрисон, действуя через генерального партнера, начал разбирательство в Делавэре, в котором стремится изъять активы на сумму в миллиарды долларов у заявителей и передать эти активы себе», — говорится в документе. Какие претензии у Рыболовлева к партнеру Структуры Рыболовлева заявляют о «потере доверия и уверенности в способности генерального партнера управлять делами партнерства» в интересах фонда. Это проявилось: в попытках запросить взнос в фонд в размере более $100 млн (сверх обязательств), нарушив положения соглашения об ограниченном партнерстве; некоторые расходы генерального партнера могли быть неправомерно отнесены к портфельным компаниям фонда, а сам партнер не предоставлял своевременно или вообще информацию, необходимую для проверки расходов или утверждения бюджетов входящих в портфель фонда активов; кроме того, в действиях партнера наблюдается конфликт интересов; также генеральный партнер в нарушение договора начал разбирательство в Делавэре, пытаясь получить дополнительное финансирование, а также конфисковать 50% доли истцов в фонде, стоимость которого он оценил в $4 млрд. Таким образом, «поскольку партнерство больше не управляется в соответствии с разумными ожиданиями ограниченных партнеров», структуры Рыболовлева считают «справедливым и равноправным», если фонд будет ликвидирован. Чем известен Дмитрий Рыболовлев Дмитрий Рыболовлев занимает 26-е место в рейтинге российских миллиардеров по версии Forbes за 2025 год, его состояние оценивается в $6,4 млрд. Он является президентом футбольного клуба «Монако», а также бывшим акционером компании «Уралкалий». В 1992 году Рыболовлев участвовал в процессе приватизации компании и получил контроль над ней в 2000-м. В 2011 году он продал 53,2% производителя и экспортера минеральных удобрений Сулейману Керимову, Александру Несису и Филарету Гальчеву и покинул состав акционеров «Уралкалия». Переехав в Монако, Рыболовлев начал инвестировать в искусство. С 2015 года бизнесмен в течение многих лет судился с швейцарским арт-дилером Ивом Бувье в нескольких странах. В том числе он обвинял аукционный дом Sotheby's в помощи Бувье в завышении цен при продаже произведений искусств. Представитель Рыболовлева опроверг планы купить еще один футбольный клуб Спорт В своем заявлении, поступившем в РБК, траст Рыболовлевых отмечает, что только с 2022 года вложил в фонд более $800 млн, а судебный процесс в Делавэре был возбужден в ответ на «законные запросы» предоставить информацию о деньгах, поступающих в распоряжение генерального партнера. «Нам представляется, что вместо того, чтобы ответить на эти вопросы, генеральный партнер выражает свое неудовлетворение условиями партнерского соглашения, ограничивающими степень, в которой генеральный партнер может требовать от нас взносы капитала», — сообщает он. Траст надеется, что генеральный партнер «поступит правильно, отойдя от дел». «Но в противном случае мы уверены, что суд Каймановых островов предоставит нам соответствующую судебную защиту», — говорится в заявлении. Генеральный партнер, в свою очередь, считает обвинения структур Рыболовлевых «беспочвенными, противоречащими фактам и, следовательно, несущими ущерб». Кроме того, он заверяет, что «не было никакого ненадлежащего управления или нецелевого использования средств». «Family Office (траст. — РБК) не полностью профинансировал свои обязательства. Все требования по капиталу, по которым он не выполнил обязательства, являются обоснованными. Оставшиеся инвестиции в портфеле ATP жизнеспособны, но требуют капитала для реализации своего потенциала», — говорится в ответном заявлении ATP III GP на сайте фонда. Там же указано, что компания подала ходатайство о приостановлении производства по данному делу. Заявление о роспуске ATP Life Science Ventures LP имеет вполне разумное основание, полагает Георгий Сухов, адвокат, советник «Рустам Курмаев и партнеры». Он говорит, что в ситуации неразрешимых противоречий между партнерами инвестиционного фонда (либо участниками, акционерами юридического лица) юрисдикции англо-американской правовой традиции широко используют инструмент ликвидации или роспуска совместного предприятия с последующим разделом активов. «Что касается иска, предъявленного второй группой партнеров в штате Делавэр, то данный иск основан на попытке понуждения их оппонентов к внесению капитала в фонд и сопряжено также с требованием в виде явно непропорционального перераспределения долей в фонде», — отмечает Сухов. При таких обстоятельствах, заключает эксперт, следует ожидать, что Канцлерский суд штата Делавэр примет во внимание развитие судебного процесса на Каймановых островах и осторожно отнесется к требованиям, заявленным со стороны ATP III GP. Читайте РБК в Telegram.	5	\N	2025-07-03 07:45:02	2025-07-03 07:45:02
1085	2367	ssha-snyali-chast-ogranicheniy-na-eksport-v-kitay-posle-novoy-sdelki	США сняли часть ограничений на экспорт в Китай после новой сделки		США сняли ограничения на экспорт в Китай программного обеспечения для производства чипов, а также этана, пишут Reuters и Bloomberg. Меры отменили после заключения новой торговой сделки Правительство США уведомило немецкую Siemens AG о снятии ограничения на экспорт в Китай программного обеспечения для разработки чипов, сообщает Bloomberg со ссылкой на заявление компании. Siemens объявила, что восстановила полный доступ к своему программному обеспечению и технологиям для своих китайских клиентов. Также о снятии ограничений на экспорт ПО для разработки микросхем сообщил американский поставщик Cadence Design Systems, передает Reuters. Компания заявила, что находится в процессе восстановления доступа к программному обеспечению и технологиям для клиентов из Китая. rbc.group Bloomberg сообщил о том, что власти США потребовали прекратить поставки программного обеспечения для проектирования чипов китайским фирмам, в конце мая. Это произошло после того, как американский президент Дональд Трамп обвинил Пекин в нарушении торгового соглашения, заключенного в начале мая. Китай отверг обвинения в нарушении договоренностей и выдвинул собственные, отметив «ряд дискриминационных и ограничительных мер» со стороны США. rbc.group 25 июня стороны заключили новое торговое соглашение, в рамках которого США согласились отменить ряд ограничений для Китая. Трамп заявил, что «вчера» подписал торговую сделку с Китаем Политика Как пишет Reuters, также Вашингтон снял ограничения на экспорт этана в Китай, направив соответствующие уведомления производителям Enterprise Products Partners и Energy Transfer. По данным агентства, «первый шаг» в возобновлении поставок этана был сделан на прошлой неделе, когда министерство торговли США отправило Enterprise Products, Energy Transfer, а также дистрибьюторам Satellite Chemical USA и Vinmar International уведомления о том, что они могут загружать этан на суда, направляющиеся в Китай, но не могут выгружать этан в Китае без разрешения. Reuters отмечает, что более половины американского экспорта этана направляется в Китай. Согласно данным Кpler, после введения требования о получении лицензии на экспорт этана в Китай в июне поставки туда были приостановлены, сократившись с 257 тыс. баррелей в день в мае. По меньшей мере восемь судов, застрявших у американского побережья Мексиканского залива из-за ограничений, после отмены меры направились в Китай, пишет Reuters. Агентство сообщает, что как минимум одно судно, которое обычно курсирует между США и Китаем, в июне отправилось в Индию на фоне поиска компаниями альтернативных рынков сбыта. Читайте РБК в Telegram.	4	2025-07-03 09:03:49	2025-07-03 07:45:03	2025-07-03 09:03:49
1082	2362	politico-soobshchilo-o-smene-taktiki-kieva-v-popytke-dobitsya-oruzhiya-ot-ssha	Politico сообщило о смене тактики Киева в попытке добиться оружия от США		Украина вместо военной помощи планирует попросить у США разрешения закупать оружие за счет средств стран Европы, некоторые из них изучают подобные планы, пишет Politico. США 1 июля приостановили поставки части оружия Украине Украина в попытке добиться от США поставок большего количества оружия планирует попробовать новый подход и попросить Вашингтон разрешить европейским странам закупать американское оружие для Киев, сообщили Politico шесть человек, знакомых с вопросом. Украинский чиновник отметил, что Киеву нужно менять подход на фоне отсутствия дополнительной помощи от Вашингтона и успехов российской армии. «У нас нет выбора», — говорит он. В рамках нового подхода власти некоторых европейских стран изучают планы закупки вооружений американского производства за счет своих оборонных бюджетов для передачи Украине, однако твердых обязательств пока нет, отмечает Politico. По словам собеседника издания, знакомого с разрабатываемыми планами, эти переводы должны быть одобрены правительством США, детали которого обсуждаются. rbc.group «Учитывая тот факт, что некоторые критически важные для нас виды вооружений не производятся никем в демократическом мире, кроме США, мы вместе с нашими европейскими партнерами готовы их закупать», — сказал второй украинский чиновник. rbc.group Одним из потенциальных препятствий являются ограничения, которые Вашингтон обычно налагает на союзников, использующих американское вооружение, пишет Politico. Украинский чиновник уточнил, что часть переговоров будет посвящена этим разрешениям. Bloomberg сообщил об опасениях ЕС насчет дальнейших закупок оружия у США Политика Глава комитета по вооруженным силам в сенате США Роджер Уикер заявлял, что, как ему сообщили, президент Украины Владимир Зеленский на встрече с американским лидером Дональдом Трампом на полях саммита НАТО в конце июня вместо увеличения финансирования попросил разрешить использовать средства европейских стран для закупки оружия. О том, что в Европе изучают альтернативные варианты закупки американского вооружения для Украины на случай, если администрация Трампа не одобрит новые поставки, в июне писала The Washington Post. Европейские чиновники в разговоре с газетой предупредили о «тяжелой и дорогостоящей битве». По их оценкам, одобренные администрацией экс-президента США Джо Байдена закончатся этим летом и европейским странам придется покрывать нехватку вооружений у Украины. Украина меняет подход в попытке добиться от США наращивания поставок оружия на фоне приостановки поставок части вооружений, включая ракеты для комплексов ПВО Patriot, о которой стало известно 1 июля. В Пентагоне решение объяснили «пересмотром возможностей» для того, чтобы убедиться, что «военная помощь США соответствует с нашими приоритетами в обороне». Москва осуждает военную помощь Киеву. В Кремле заявили, что сокращение поставок оружия Украине приближает окончание специальной военной операции. Читайте РБК в Telegram.	3	2025-07-03 09:04:02	2025-07-03 07:45:01	2025-07-03 09:04:02
1018	2251	mid-predlozhil-azerbaydzhanu-vernutsya-k-strategicheskomu-soyuznichestvu	МИД предложил Азербайджану вернуться к «стратегическому союзничеству»	https://s0.rbk.ru/v6_top_pics/media/img/1/06/347514551059061.jpeg	Захарова отметила, что Баку предпринимает множество недружественных действий — от отмены двусторонних мероприятий до преследования журналистов, — и призвала его вернуться к уровню отношений, закрепленному в документах двух стран Мария Захарова (Фото: Максим Константинов / Global look press) Россия призывает Азербайджан принять меры, чтобы вернуть отношения двух стран к уровню стратегического союзничества, заявила представитель российского МИДа Мария Захарова на брифинге. «Мы, конечно, призываем азербайджанскую сторону принять меры по возвращению к уровню межгосударственных отношений, который сформулирован в официальных документах. Напомню, это уровень стратегического союзничества», — подчеркнула дипломат. Захарова добавила, что на встрече с азербайджанским дипломатом накануне, 1 июля, заместитель главы российского внешнеполитического ведомства Михаил Галузин заявил своему собеседнику решительный протест в связи с намеренным демонтажем двусторонних российско-азербайджанских отношений и действий азербайджанских силовиков в отношении российских граждан. Video Среди недружественных действий Баку Захарова назвала отмену мероприятий высокого уровня в рамках межгосударственного диалога и культурных мероприятий с участием российских исполнителей, неприемлемые действия против российского информагентства «Sputnik Азербайджан» и его сотрудников, распространение фейков в СМИ страны. rbc.group В Москве 22 февраля 2022 года была подписана Декларация о союзническом взаимодействии между Российской Федерацией и Азербайджанской Республикой. Подписи под документом поставили президенты Владимир Путин и Ильхам Алиев. Первый пункт документа гласит: «Российская Федерация и Азербайджанская Республика строят свои отношения на основе союзнического взаимодействия, взаимного уважения независимости, государственного суверенитета, территориальной целостности и нерушимости государственных границ двух стран, а также приверженности принципам невмешательства во внутренние дела друг друга, равноправия и взаимной выгоды, мирного урегулирования споров и неприменения силы или угрозы силой». Баку ответил на сообщения о приостановке обучения на русском в школах Политика В конце июня в Екатеринбурге российские правоохранительные органы провели операцию по задержанию представителей азербайджанской диаспоры в рамках расследования убийств и покушений на убийство, совершенных в период с 2001 по 2011 год. Шестеро фигурантов в итоге арестованы. При этом двое подозреваемых умерли — это Гусейн и Зияддин Сафаровы. Российский Следственный комитет заявил, что один из них скончался от сердечной недостаточности, а причины смерти второго устанавливаются. Азербайджанская сторона после проведения судебно-медицинской экспертизы заявила, что обнаружила на их телах травмы, было возбуждено уголовное дело по статьям об умышленном убийстве, о пытках и превышении должностных полномочий. Помимо перечисленных Захаровой недружественных действий, азербайджанские власти начали собственные расследования в отношении россиян. В частности, был проведен рейд в редакции «Sputnik Азербайджан», под арест взяты исполнительный директор издания Игорь Картавых и шеф-редактор Евгений Белоусов, обвиняемые в мошенничестве, незаконном предпринимательстве и легализации преступных доходов. Еще одну группу россиян арестовали по делу о наркоторговле и киберпреступлениях. Читайте РБК в Telegram.	7	\N	2025-07-02 16:45:01	2025-07-03 09:04:46
1161	2665	pokupatel-tc-mega-raskryl-dedlayn-vladelca-ikea-po-obratnomu-vykupu	Покупатель ТЦ «Мега» раскрыл дедлайн владельца IKEA по обратному выкупу	https://s0.rbk.ru/v6_top_pics/media/img/9/16/347512902119169.jpeg	Право шведской Ingka на обратный выкуп торговых центров «Мега», где находились магазины IKEA, истекает в сентябре 2025 года, заявил зампредправления Газпромбанка. Но он сомневается, что владелец ТЦ вернется в Россию Фото: Константин Кокошкин / Global look Press Право шведской Ingka Centres на обратный выкуп принадлежавших ей в России торговых центров «Мега» с располагавшимися там магазинами IKEA истекает в сентябре 2025 года. Об этом заявил в интервью «РБК Отрасли» заместитель председателя правления Газпромбанка Тигран Хачатуров. Сделку по покупке сети ТЦ «Мега» у владельца магазинов мебели и товаров для дома IKEA группа Газпромбанк закрыла в сентябре 2023 года. Покупателю перешло 14 торговых центра площадью 2,3 млн кв. м в Москве, Подмосковье, Ленинградской области, Омске, Уфе, Ростове-на-Дону, Самаре, Адыгее, Казани, Екатеринбурге, Новосибирске и Нижнем Новгороде. Сумма сделки не раскрывалась, но ее условия предусматривали возможность обратного выкупа магазинов «Мега» прежним владельцем. С предложением о реализации своего опциона Ingka Centres (оператор торговых центров, принадлежащих Ingka Group), по словам Хачатурова, не обращалась, и он сомневается, что шведская компания им воспользуется. «У них дедлайн — сентябрь 2025 года. Если спросите мое мнение — они вряд ли этой возможностью воспользуются. Мне кажется, ситуация такая, что они возвращаться сегодня не будут», — заявил Хачатуров. rbc.group Газпромбанк купил торговые центры «Мега» у экс-владельца IKEA в России Бизнес rbc.group Приобретение торговых центров «Мега» в Газпромбанке рассматривали как долгосрочную инвестицию с намерением дальше развивать этот актив, говорит топ-менеджер кредитной организации. Обычная сделка, по его словам, идет полтора года, а эту транзакцию завершили за шесть месяцев. «Когда у нас появилась эта инвестиционная возможность, мы недолго рассуждали. У нас был определенный опыт управления торговыми центрами, но подобного рода актива у нас не было, и опыта управления таким активом никогда не было. Нам показалось это очень интересным», — говорит Хачатуров. До 2022 года главным «якорем» торговых центров «Мега» выступали принадлежавшие тому же владельцу магазины IKEA. В марте 2022 года Ingka Group на фоне специальной военной операции на Украине приостановила работу своих магазинов в России. Летом того же года компания устроила онлайн-распродажу товаров IKEA и в августе окончательно закрыла магазины под этим брендом в России. ТЦ «Мега» при этом работу продолжили. Первый год после смены владельца был для «Меги» с одной стороны сложным, с другой стороны, хорошим, говорит Хачатуров. По итогам 2024 года операционная прибыль «Меги» выросла на 46% к предыдущему году, а в 2025 году ожидается рост на 30%. Рост обеспечил «комплекс факторов». «В первую очередь, это загрузка простаивающих площадей. У нас был большой вызов, чем заместить IKEA», — отмечает Хачатуров. В апреле 2024 года стало известно, что об аренде площадей, которые ранее занимали магазины IKEA, договорился маркетплейс «Мегамаркет». В компании тогда говорили о планах оборудовать площади под склады и запустить в тестовом режиме классическую модель пунктов выдачи заказов, в том числе с возможностью оформления возвратов и примерки. Сегодня доля свободных площадей «Меги», по словам Хачатурова, не превышает 1-2%. На площади ушедшей IKEA в торговых центрах «Мега» нашелся арендатор Бизнес Когда в 2022-2023 годах из России уходили иностранные бренды, основной задачей было «вывести» в торговые центры российского производителя и поставить на полку отечественные бренды, продолжает собеседник РБК. «Я считаю, что рынок с этой задачей справился», — говорит Хачатуров. Он отмечает, что помимо большого количества российских производителей появились новые турецкие и китайские бренды, а также марки с Ближнего Востока, хотя доля магазинов в категории fashion в целом снизилась. В прошлом году рынок коммерческой недвижимости начал восстанавливаться после спада, спровоцированного массовым уходом западных брендов. Но со второго полугодия 2024 года из-за высокой стоимости заемных средств многие игроки были вынуждены пересмотреть свои инвестиционные программы, говорит Хачатуров. Повышение ключевой ставки давит на инвестиционную активность внутри торговых центров — их обновление идет не так, как изначально планировалось. Тренд на снижение активности и товарооборота в офлайне сохраняется, а около 80% проектов и инвестиционных программ стоит «на стопе или точечном развитии», говорит Хачатуров. На торговые центры давит и развитие онлайн-торговли. Новый владелец «Меги» внимательно следит за этим трендом и планирует самостоятельно развивать онлайн. Речь, по словам Хачатурова, идет о бизнес-модели, которая «объединит преимущества цифрового и физического форматов торговли». Сам проект будет реализован на платформе «Мегамаркета». «Мега Онлайн» значительно упростит вывод брендов на маркетплейс, а также обеспечит дополнительный канал продаж для арендаторов торговых центров, объясняет зампредправления Газпромбанка. На первом этапе основной фокус будет сделан на товары категории fashion — мужская, женская и детская мода, спортивная одежда и аксессуары, представленные у арендаторов торговых центров. Подробности проекта станут известны ближе к концу года, говорит Хачатуров. На месте сгоревшего OBI в Химках построят акватермальный комплекс Бизнес В условиях меняющейся конкуренции торговые центры трансформируют стратегию — они должны предлагать то, что хотят покупатели, в том числе, развлечения. К примеру, в «Мега Химки» на месте сгоревшего в декабре 2022 года магазина OBI к концу 2027 года планируется открыть акватермальный комплекс. Объект площадью 13,5 тыс. кв. м будет встроен в торговый центр. Во внутренней его части разместятся спа, бассейны, бани, сауны, хаммамы, бассейны и кафе. Также у комплекса будет внешняя часть с термальными бассейнами и зонами отдыха на открытом воздухе, которыми можно будет пользоваться всесезонно. Проект реализуется совместно с девелопером «Квантум групп», инвестиции в него составят 3 млрд руб., сообщала ранее управляющая компания «Мега». Читайте РБК в Telegram.	8	\N	2025-07-03 10:15:02	2025-07-03 10:15:02
1200	3129	pochemu-moldaviya-nachinaet-operezhat-ukrainu-na-puti-v-es	Почему Молдавия начинает опережать Украину на пути в ЕС	https://s0.rbk.ru/v6_top_pics/media/img/6/64/347516163561646.jpeg	4 июля в Кишиневе пройдет первый саммит ЕС — Молдавия. Насколько республика близка к членству в блоке и почему она может получить его раньше, чем Украина, — в материале РБК Фото: Shutterstock 4 июля в Кишиневе состоится первый саммит ЕС — Молдавия. Президент республики Майя Санду, премьер-министр Дорин Речан и спикер парламента Игорь Гросу обсудят с председателем Евросовета Антониу Коштой и главой Еврокомиссии Урсулой фон дер Ляйен будущее Молдавии в Евросоюзе, а также двустороннее сотрудничество в области безопасности и обороны. В период 2021 по 2025 год ЕС выделил республике €197 млн на поддержку модернизации вооруженных сил. Ожидается, что по итогам саммита стороны обнародуют совместную декларацию. Молдавия подала заявку на вступление в ЕС следом за Украиной — в марте 2022-го — и уже в июне того же года обе страны получили статус стран-кандидатов. В ноябре 2023 года Еврокомиссия рекомендовала начать переговоры с Украиной и Молдавией о членстве в союзе, и через месяц лидеры ЕС согласовали их запуск, преодолев попытки Венгрии заблокировать этот процесс. В июне 2024-го года Еврокомиссия заявила, что обе страны выполнили условия вступления, и в том же месяце ЕС начал формальные переговоры о вступлении Украины и Молдавии в объединение. Одновременно с Молдавий заявку на вступление подавала и Грузия, однако статус кандидата она получила только в декабре 2023-го. Уже в следующем году, после того как контролируемый «Грузинской мечтой» парламент принял закон об иноагентах, Брюссель заявил, что приостанавливает с Тбилиси переговоры о членстве. rbc.group Как продвигается евроинтеграция Молдавии rbc.group Незадолго до саммита президент Румынии Никошур Дар сообщил, что на встрече в Кишиневе будет принято решение об открытии первого переговорного кластера по вступлению Молдавии в ЕС — о фундаментальных ценностях. Однако позднее он уточнил свои слова. «Я говорил о документах, с которых начались дебаты. <...> Обе стороны говорят о прогрессе, достигнутом обеими странами и рекомендуют открытие кластера», — пояснил он. По словам Дара, разница заключается лишь в том, что документ для Молдавии был принят 27 государствами, а для Украины — 26 (без Венгрии). Речь идет о двух отдельных коммюнике, которые были приняты по итогам заседания Евросовета, прошедшего в Брюсселе 26-27 июня. В первом документе, который подписали все страны блока, говорится о том, что Евросовет активно поддерживает Молдавию на ее пути в ЕС и призывает Еврокомиссию и республику активизировать совместную работу в этой области. Было рекомендовано открыть переговорные кластеры, учитывая, что ранее Еврокомиссия заявила о готовности страны к этому шагу. Во втором коммюнике, которое отказалась подписывать Венгрия, то же самое говорится об Украине. При этом конкретные сроки в коммюнике не содержатся. Каковы этапы вступления в ЕС 1. Получение статуса кандидата. Согласовывается всеми членами блока после того, как Еврокомиссия представит заключение о заявке страны на членство в ЕС. 2. Официальные переговоры о членстве. Этап включает в себя скрининг законодательства страны-кандидата и его адаптацию к действующему законодательству ЕС, а также реализацию судебных, административных, экономических и других реформ, необходимых для удовлетворения требований союза (так называемых копенгагенских критериев). Весь процесс включает шесть тематических переговорных кластеров, которые подразделяются на 31 главу. Первый кластер «Основы» включает в себя, в частности, вопросы деятельности судебной системы и основных прав, а также финансового контроля. 3. Когда переговоры и соответствующие реформы завершены и результат удовлетворяет обе стороны, страна-кандидат сможет присоединиться к ЕС. Для этого договор, закрепляющий членство нового государства в блоке, должен получить поддержку Евросовета, Еврокомиссии и Европарламента. Документ подписывается страной-кандидатом и представителями всех стран — членов ЕС, а также ратифицируется отдельно каждым членом объединения в соответствии с установленными в Конституции правилами. ЕС имеет право приостановить или прекратить переговоры в одностороннем порядке. Еще в декабре 2024-го Санду поставила цель — открыть первый переговорный кластер о вступлении в ЕС в первой половине 2025 года, в период председательства Польши в Евросовете. Варшава, в свою очередь, активно поддерживала Кишинев на этом пути — в программе председательства польского председательства отмечалась важность расширения ЕС на Восток и Юг. В апреле этого года представители Еврокомиссии заявили, что Украина и Молдавия «выполнили домашнюю работу» и готовы к открытию первого кластера. При этом евроинтеграцию Молдавии и Украины в ЕС неформально рассматривали как «пакетное решение» (для блока свойственно проводить расширение «группами» — за семь волн расширения только дважды страны присоединились к ЕС поодиночке: это Греция в 1981-м и Хорватия в 2013-м). Однако с февраля Венгрия последовательно блокирует запуск открытия первого кластера для Украины. Поскольку для старта переговорного процесса о вступлении необходимо согласие всех 27 стран-членов ЕС, в Брюсселе стали задумываться над тем, чтобы разъединить Украину и Молдавию в переговорах о вступлении в ЕС с целью ускорить евроинтеграцию второй, сообщала «Европейская правда». На этом настаивали в Будапеште — глава венгерского внешнеполитического ведомства Петер Сийярто отмечал, что результаты деятельности стран, желающих присоединиться к блоку, должны оцениваться отдельно. Тем не менее представитель Еврокомиссии Гийом Мерсье заявил 1 июня, что комиссия не настаивает на таком подходе. «Наша позиция в этом контексте абсолютно четкая: мы не призываем к отделению Молдавии. Это решение должны принять государства-члены, если они пожелают этого», — добавил он, отметив, что обе страны «демонстрируют стабильный прогресс». Вместе с тем в начале июня глава генерального директората Еврокомиссии по вопросам расширения и Восточного соседства (DG ENEST) Герт Ян Коопман заявил, что в течение последних полутора лет Молдова продвигалась к членству в ЕС темпами, «не сопоставимыми ни с одним другим кандидатом». По его оценке, страна сможет стать полноправным членом блока к концу 2027 года или даже немного раньше. Дания, которой с 1 июля перешло председательство в Евросовете, как и Польша, подчеркивает необходимость расширения ЕС в нынешних геополитических условиях. «Это особенно касается Украины, и датское председательство будет отдавать приоритет достижению ею существенного прогресса, а также Молдавии и Западных Балкан», — говорится в программе ее председательства. В Европейском совете по иностранным делам (ECFR) отмечают, что евроинтеграция Молдавии и Украины отвечает целям ЕС по укреплению безопасности союза. Ряд стран блока, прежде всего Прибалтики и Северной Европы, рассматривают расширение как «необходимый геополитический ответ на российскую агрессию», отмечая, что присоединение Молдавии и Украины обезопасит восточные границы Европы. При этом Брюссель активно помогает Кишиневу провести необходимые для получения членства реформы. В феврале ЕС согласовал так называемый «Фонд реформ и роста» объемом €1,9 млрд — крупнейший пакет помощи, который Молдавия когда-либо получала от блока. Эти средства предназначены для инфраструктурных проектов, а также строительства социальных учреждений (больниц и школ). Как в республике относятся к вступлению в Евросоюз В Кишиневе считают, что нынешний саммит «знаменует новый этап» молдавского пути в Европу. «Такие двусторонние встречи проводятся только с партнерами, имеющими стратегическое значение, или со странами-кандидатами — такими, как Украина и Западные Балканы. Проведение саммита подтверждает не только признание предпринятых нами шагов, но и твердую политическую приверженность Европейского союза европейскому будущему нашей страны», — говорится на сайте президента Молдавии. Внешнеполитический курс стал в Молдавии ключевым вопросом президентской предвыборной кампании 2024 года. 20 октября параллельно с первым туром выборов президента и с подачи правящей партии «Действие и солидарность» (Partidul Acțiune și Solidaritate — PAS) в республике прошел референдум о евроинтеграции. Избиратели должны были ответить «Да» или «Нет» на вопрос, поддерживают ли они изменения в Конституции, закрепляющие курс республики на вступление в Евросоюз. В итоге победили сторонники евроинтеграции, хотя и с минимальным перевесом — в пользу поправок высказались 50,46% участников плебисцита, против — 49,54%. Эти результаты оказались ниже, чем ожидалось; как обратили внимание аналитики, сторонники евроинтеграции победили за счет голосов молдавской диаспоры за рубежом. Тем не менее выборы показали, что вопрос «Молдавия с Евросоюзом или Молдавия с Россией» перед республикой не стоит. Главный соперник Майи Санду, кандидат от Партии социалистов Республики Молдова (ПСРМ), которая традиционно выступала за сближение с Москвой, Александр Стояногло не отвергал вступление в Евросоюз. Перед вторым туром он говорил, что евроинтеграция — это возможность обеспечить республике «стабильное развитие, улучшение уровня жизни и соблюдение демократических ценностей». «Курс на Европейский союз не должен восприниматься как антагонизм в отношении России. Молдова должна стремиться строить внешнюю политику на основе взаимного уважения интересов как с ЕС, так и с Россией», — подчеркивал он в интервью ТАСС. Впрочем, это не мешало ему критиковать и прошедший референдум, и Евросоюз. Результаты голосования он назвал «настолько спорнымм», что они вряд ли могут быть «признаны и законны». «Всем понятно, что итоги референдума отражают скорее отношение общества к Санду, а не к европейской модернизации. Проталкивать этот сомнительный результат дальше, менять Конституцию — означает лишь одно: усиливать раскол, поднимать градус противостояния, ломать Молдову через колено», — написал Стояногло в своем телеграм-канале. И подчеркнул: референдум о евроинтеграции, «безусловно, нужен», но своевременен он будет тогда, когда Кишинев достойно завершит переговоры с ЕС и это голосование станет обязательным условием со стороны Брюсселя. Теперь Молдавии предстоит пройти через парламентские выборы. Они назначены на 28 сентября 2025 года. По данным опроса молдавской компании iData от 30 июня 2025 года (их приводит Radio Moldova), если бы выборы состоялись 6 июля, в парламент прошли бы две партии и два блока. Это PAS с 26,8% и ПСРМ с 10,9%, а также блок «Победа» беглого олигарха Илана Шора, который сейчас находится в Москве, с 10,3% (о создании этого блока было объявлено через год после того, как молдавский суд признал неконституционной партию «Шор»; в 2024 году ЦИК республики отказал «Победе» в регистрации на президентских выборах) и блок «Альтернатива», который в 2025 году создали мэр Кишинева Ион Чебан, Александр Стояногло, экс-премьер Ион Кику и экс-депутат Марк Ткачук, с 6,9% голосов. Сложно сказать, в какие сроки Молдавия сможет стать полноценным членом Евросоюза. В планах Санду завершить процесс до того, как истечет ее второй президентский срок. По ее мнению, членство в ЕС поможет Кишиневу гораздо легче «обеспечить мир и свободу» в республике. «Там мы будем защищены, как в большой любящей семье. Вот почему мы должны продолжать работать день и ночь, чтобы вступить в ЕС как можно скорее. Не через 10-20 лет, а в ближайшие четыре года. Это будет нелегко, но и не невозможно», — заявила она в обращении к парламенту 17 апреля.	1	\N	2025-07-04 11:15:03	2025-07-04 11:15:03
874	1837	mid-vystupil-s-predosterezheniem-k-rossiyanam-kotorye-edut-v-azerbaydzhan	МИД выступил с предостережением к россиянам, которые едут в Азербайджан	https://s0.rbk.ru/v6_top_pics/media/img/1/24/347514563558241.jpeg	Мария Захарова (Фото: MariaVladimirovnaZakharova / Telegram) Россиянам, которые едут в Азербайджан или собираются туда, нужно «тщательно учитывать текущую обстановку». Об этом на брифинге заявила представитель ведомства Мария Захарова. «О дальнейшей информации мы будем с вами делиться», — сказала она. По словам Захаровой, 1 июля замглавы МИД Михаил Галузин выразил азербайджанскому дипломату решительный протест в связи с намеренным демонтажем отношений между двумя странами и действиями азербайджанских силовиков в отношении российских граждан. Москва призывает Баку вернуть отношения на уровень «стратегического союзничества», сказала она. rbc.group Накануне азербайджанский посол Рахман Мустафаев был вызван в МИД после визита силовиков в офис редакции «Sputnik Азербайджан» в Баку, а также задержания нескольких сотрудников. человек. Суд арестовал исполнительного директора бакинского филиала информационного агентства «Россия сегодня» («Sputnik Азербайджан») Игоря Картавых и шеф-редактора Евгения Белоусова. МВД Азербайджана завело уголовное дело по статьям о мошенничестве, незаконном предпринимательстве и легализации имущества, приобретенного преступным путем. rbc.group Материал дополняется Читайте РБК в Telegram.	10	2025-07-02 15:22:13	2025-07-02 14:55:02	2025-07-02 15:22:13
1017	2202	shesti-zaderzhannym-azerbaydzhancam-predyavili-obvinenie-v-ubiystve	Шести задержанным азербайджанцам предъявили обвинение в убийстве	https://s0.rbk.ru/v6_top_pics/media/img/7/62/347514613464627.jpeg	Ахлиман Гянджиев во время избрания меры пресечения в суде, Екатеринбург, 1 июля 2025 года (Фото: Размик Закарян / URA.RU / Global Look Press) Следователи предъявили обвинение в убийстве шести азербайджанцам, которые были задержаны в Екатеринбурге. Об этом заявила официальный представитель СК России Светлана Петренко. Она указала, что они входили в преступную группу, которая была «причастна к ряду особо тяжких преступлений в Екатеринбурге». Все задержанные — выходцы из Азербайджана, но являются гражданами России. Убийства были совершены в 2001, 2010 и 2011 годах. В числе фигурантов дела: rbc.group Мазахир Сафаров; Акиф Сафаров; Аяз Сафаров; Ахлиман Гянджиев; Шахин Лалаев; Бакир Сафаров. rbc.group Им предъявлены обвинения по п.п. «ж», «з» ч. 2 ст. 105 УК, ч. 3 ст. 30, ч. 2 ст. 105 УК (убийство, совершённое группой лиц по предварительному сговору; убийство по найму; покушение на убийство по найму). Следствие полагает, что они причастны к убийству Ю.Пашаева, который скончался от полученных колото-резаных ран; покушению на убийство по найму Ф.Ширинова в 2010 году и убийству в 2011 году гражданина Азербайджанской Республики И.Гаджиева. Преступления были совершены из-за «раздела сфер влияния в бизнесе, а также личной мести», полагают следователи. Материал дополняется Читайте РБК в Telegram.	2	\N	2025-07-02 16:15:03	2025-07-02 16:15:03
1169	2794	kreml-zayavil-chto-po-novomu-raundu-peregovorov-s-ukrainoy-zatykov-net	Кремль заявил, что по новому раунду переговоров с Украиной «затыков» нет	https://s0.rbk.ru/v6_top_pics/media/img/8/39/347515346014398.jpeg	Фото: Евгений Биятов / РИА Новости Россия и Украина договорятся о новом раунде переговоров, как только завершатся все процедуры согласования, в процессе «нет затыков», сообщил журналистам пресс-секретарь президента Дмитрий Песков, передает корреспондент РБК. Он отметил, что каждая сторона ждет предложения по срокам проведения встречи. Песков заявил, что Россия публично не обсуждает содержание проектов меморандумов по урегулированию, которые российские представители «даже не обсуждали с украинской стороной». «Мы считаем, что обсуждаем через СМИ может только навредить процессу», — заявил он в ответ на вопрос, содержится в российском документе предложение о взаимной амнистии политзаключенных. rbc.group Российская и украинская делегации провели две встречи в Стамбуле: первая прошла 16 мая, вторая — 2 июня. Киев передал Москве версию меморандума за несколько дней до второго раунда переговоров, а Россия представила свою уже в Турции. rbc.group Российский проект предусматривает нейтралитет Украины и отказ от вступления в военные союзы, безъядерный статус страны и снятие санкций с России. Он предлагает два варианта прекращения огня, один из которых подразумевает вывод украинских военных с территорий ДНР, ЛНР, Запорожской и Херсонской областей и отвод от российских границ на согласованное расстояние. Во втором речь идет о запрете передислокации войск, прекращении мобилизации и поставок иностранной военной помощи Киеву. Согласно документу Украины, Киев прежде всего предлагает установить полное и безусловное прекращение огня в воздухе, на суше и на море. Украинская сторона хочет получить гарантии безопасности со стороны международного сообщества и настаивает, чтобы территории, которые она утратила с 2014 года, не были признаны российскими на международном уровне. Российский президент Владимир Путин отмечал, что документы «абсолютно противоположны». Украинский лидер Владимир Зеленский называл условия Москвы ультиматумом. На переговорах стороны также договорились об обменах военнопленными, в том числе тяжелоранеными и теми, кто моложе 25 лет, а также телами погибших бойцов. После завершения обмена будет определена дата новой встречи, сообщали ранее в Кремле. Читайте РБК в Telegram.	10	\N	2025-07-03 12:45:02	2025-07-03 12:45:02
1170	2796	v-peterburge-fsb-zaderzhala-devushku-v-moment-zakladki-bomby-pod-mashinu	В Петербурге ФСБ задержала девушку в момент закладки бомбы под машину		Девушка самостоятельно связалась с украинскими спецслужбами. Взамен на участие в теракте ей должны были помочь оформить паспорт одной из стран Евросоюза Video Сотрудники ФСБ задержали в Петербурге девушку, когда она закладывала бомбу под машину сотрудника оборонного предприятия, силовики предотвратили теракт, сообщает Центр общественных связей (ЦОС) ФСБ. «В момент закладки СВУ (самодельное взрывное устройство. — РБК) под автомобиль объекта террористических устремлений она была задержана сотрудниками ФСБ России», — говорится в сообщении. Как уточнили в ведомстве, девушка 2002 года рождения в июне 2024 года самостоятельно связалась с представителями украинских спецслужб в Telegram и WhatsApp (принадлежит Meta, которая признана экстремистской организацией на территории России и запрещена). Она сама изъявила желание принять участие в диверсионно-террористической деятельности, чтобы ей взамен помогли получить гражданство одной из стран Евросоюза. rbc.group В апреле 2025 года девушка выехала из города, где наблюдала за сотрудником одного из оборонных предприятий. Взрывное устройство ей предоставили представители спецслужбы. Девушку отправили под стражу. На нее завели уголовное дело по нескольким статьям Уголовного кодекса: ч. 3 ст. 30, ч. 2 ст. 205 — покушение на террористический акт. Максимальное наказание — до 15 лет лишения свободы. ч. 3 ст. 222.1 — незаконные приобретение, передача, сбыт, хранение, перевозка, пересылка или ношение взрывчатых веществ или взрывных устройств. Статья предусматривает наказание в виде лишения свободы на срок до 20 лет. «Мне сказали просто проследить за этой машиной, тогда мне дадут деньги. Я пыталась какое-то устройство подложить под машину», — сказала девушка во время задержания. ФСБ сообщила о предотвращении теракта против военного в Подмосковье Общество Ранее, 25 июня, силовики пресекли еще одну попытку подорвать машину российского военнослужащего в Московской области. Тогда сотрудники ФСБ пытались задержать двух граждан, но они «оказали вооруженное сопротивление и ответным огнем были нейтрализованы». В ведомстве назвали их «пособниками украинских спецслужб». Читайте РБК в Telegram.	7	\N	2025-07-03 12:45:02	2025-07-03 12:45:02
1173	2801	kreml-otreagiroval-na-reshenie-ssha-priostanovit-voennye-postavki-ukraine	Кремль отреагировал на решение США приостановить военные поставки Украине	https://s0.rbk.ru/v6_top_pics/media/img/5/19/347515341816195.jpeg	Фото: Matt Slocum / AP / ТАСС Решение США приостановить поставку военной помощи Украине говорит о проблемах с производством — «промышленность просто не успевает производить ракеты в необходимом количестве», заявил пресс-секретарь российского президента Дмитрий Песков, передает корреспондент РБК. Так он прокомментировал материал The Economist, который со ссылкой на украинских чиновников сообщил, что США прекратили поставки Украине всей военной помощи, а не только отдельных категорий вооружения. Песков напомнил о своих вчерашних словах: «чем меньше ракет поступает на Украину, тем ближе конец специальной военной операции». О том, что США приостановили поставки некоторых видов оружия Украине, включая ракеты для системы ПВО Patriot, сообщили ранее Politico и NBC. Позднее информацию подтвердили в Белом доме. Такое решение было принято в процессе оценки запасов в американских арсеналах, проводимой Пентагоном. В Госдепе тогда отметили, что пауза в поставках части вооружений не означает полной приостановки военной помощи. rbc.group Politico писало, что инициатором приостановки военной помощи стал глава политического отдела Пентагона Элбриджа Колби. The Economist отмечает, что Колби давно выступает за перемещение американских военных ресурсов из Европы и Ближнего Востока, чтобы сосредоточиться на Азии и соперничестве с Китаем. rbc.group Киев заявил, что не получал официальных уведомлений по поводу приостановки поставок оружия. Материал дополняется	2	\N	2025-07-03 12:45:03	2025-07-03 12:45:03
1201	3136	dohodnost-perevozchikov-uglya-ruhnula-na-fone-krizisa-u-ego-dobytchikov	Доходность перевозчиков угля рухнула на фоне кризиса у его добытчиков	https://s0.rbk.ru/v6_top_pics/media/img/9/83/347515427220839.jpeg	Доходность оперирования полувагонами, которые используются для перевозки угля, сократилась не менее чем в два раза на фоне кризиса в угольной отрасли. Участники рынка не ожидают улучшения ситуации в среднесрочной перспективе Фото: Илья Галахов / Global Look Press Доходность оперирования полувагонами в июне 2025 года обвалилась в 2–2,5 раза по отношению к началу 2024 года, следует из данных Центра ценовых индексов (ЦЦИ). Текущая доходность позволяет окупать лишь парк, приобретенный до 2018 года. В июне ставки предоставления продолжили снижаться из-за негативной конъюнктуры на угольном рынке: например, в июне на маршруте Кузбасс — порты Дальнего Востока они сократились на 16% месяц к месяцу, до 105 тыс. руб., за рейс для типовых полувагонов и на 13%, до 132 тыс. руб., для инновационных (повышенной грузоподъемности). Аналогично на западных направлениях — цена предоставления под поставки продукции в адрес портов Северо-Запада и Юга снизилась на 11–13%, до 85–115 тыс. руб., и на 7–11%, до 85–120 тыс. руб., за рейс соответственно в зависимости от типа вагона. Спотовые и долгосрочные ставки аренды упали в прошлом месяце до минимума с начала года и обновили минимум сентября 2021 года, по состоянию на июнь они были на уровне 1,6 тыс. руб. (-16% в сравнении с маем) и 1,4 тыс. руб. (-24%) за типовой полувагон соответственно. rbc.group Зарплаты угольщиков выросли на фоне кризиса в отрасли Бизнес rbc.group Данные ЦЦИ подтвердили несколько источников РБК среди крупных операторов, пояснив, что ставки на перевозку угля снизились «кратно» из-за падения угольных котировок (в начале января 2024 года они были на уровне $104 за тонну в дальневосточных портах отгрузки, $72 — в северо-западных, $57 — южных; по итогам июня текущего года стоимость тонны энергетического угля на базисе российских портов оценивается в $82 на Востоке, $63 на Северо-Западе и $68 на Юге) и укрепления курса национальной валюты. В январе ставки на типовой вагон направлением на восток были на уровне 160 тыс. руб., в июле — 88 тыс. руб., уточняет один из собеседников. По словам представителя Информационного центра операторов (ИЦО), такой уровень стоимости операторских услуг не позволяет окупить новые вагоны, купленные за последние годы по высокой цене — в среднем 5,7 млн руб. для типового полувагона в 2024 году и 6,9 млн руб. для инновационного. Эксперты оценили убыточность угольного экспорта к 2030 году Бизнес Ставки за рейс операторы согласуют с грузоотправителями, в первую очередь угольными компаниями, поясняет Александр Котов, партнер NEFT Research по консалтингу. «Ухудшение экономики угольщиков на фоне падения цен на уголь и роста тарифов РЖД (последняя индексация в декабре 2024 года составила 13,8%), безусловно, отражается и на их расходах на привлечение парка», — говорит эксперт. Ситуацию обостряет профицит вагонов (сейчас количество парка на инфраструктуре РЖД достигает 1,4 млн т, перевозчик с октября 2024 года ведет работу по его снижению, к началу июля это позволило отставить от движения 211 тыс. вагонов) из-за ухудшения погрузки: операторы активно вступают в «ценовую конкуренцию», снижая стоимость за рейс. Что поможет стабилизировать ситуацию По оценке ЦЦИ, фактическая доходность вагонного парка оператора может быть выше за счет ранее заключенных сервисных контрактов, увеличения попутной погрузки стройматериалов (их перевозки, согласно данным РЖД, сократились в первом полугодии на 19,5%, до 46,5 млн т) или контейнеров после выгрузки угля, а также при работе на более доходных маршрутах (при перевозках руды или черных металлов). Ситуацию помогла бы стабилизировать «технологическая кооперация» — исключение встречных порожних вагонопотоков и маршрутизация вагонов при их перемещении в порожнем состоянии, считает собеседник РБК в одном из операторов. Это позволит сократить издержки на порожние железнодорожные тарифы и ускорить оборачиваемость вагонов (этот показатель характеризует среднее время производственного цикла вагонов — от погрузки вагона до следующей погрузки. — РБК). «Дополнительно нужно ожидать конъюнктуры на товарных рынках, что позволит вернуть и увеличить спрос на вагоны», — говорит источник. РЖД решили проверить вместимость путей для регистрации новых вагонов Бизнес Снижение доходности приводит к тому, что операторы перестают ремонтировать вагоны и отправляют парк в отстой, объясняет другой собеседник РБК в операторской компании. «В перспективе это может привести к существенным потерям: при изменении конъюнктуры на угольном рынке и необходимости грузить уголь вагонов может просто не хватить. Поднять парк и провести плановый ремонт оперативно не получится, — рассказывает он. — Это приведет к локальному дефициту вагонов, срыву сроков вывоза груза и в конечном счете негативно отразится на экономике в целом». По мнению участника рынка, необходимо «уже сейчас» на государственном уровне обеспечить поддержку экспортно ориентированных отраслей, в том числе за счет корректировки курса валюты. «Иначе в обозримом будущем компании-экспортеры утратят конкурентоспособность на мировых экспортных рынках, что повлечет за собой снижение прибыли и, соответственно, налоговых выплат», — заключил он. Какие прогнозы Дальнейшая динамика ставок на полувагоны будет зависеть от объема предъявления грузов, полагают в ИЦО. По данным аналитиков, мировые цены уже «пошли вверх» по сравнению с весенними минимумами. Ослабление рубля и рост внутренних перевозок угля в осенне-зимний сезон поддержат угольную погрузку. В первом полугодии погрузка угля сократилась на 3,6% к аналогичному периоду предыдущего года, до 163,1 млн т, следует из статистики РЖД. При этом в компании отметили рост перевозок твердого топлива в экспортном направлении на восток в размере 2,3%. В РЖД заявили о новом вызове из-за «читерства» с заявками на вывоз угля Бизнес При этом, как следует из последнего заявления РЖД, «недогруз» из-за непредъявления грузов его собственниками по ранее согласованным заявкам составил 22,4 млн т, из них — 4,8 млн т приходится на уголь. Операторы ожидают, что на фоне проблем на угольном рынке сегмент грузоперевозок в перспективе третьего и четвертого кварталов будет стагнировать — падение ставок продолжится, но его темпы будут менее резкими, чем в первом полугодии. «Рынок испытывает серьезное давление на фоне операционных сложностей на сети и профицита вагонов. Усиливает негативный эффект значительное снижение грузооборота и погрузки из-за неблагоприятной конъюнктуры на внешних и внутреннем рынках (общее снижение погрузки за шесть месяцев 2025 года составило 7,6%, до 554,5 млн т, во многом из-за сокращения объемов перевозок стройматериалов, черных металлов и металлолома, нефтяных грузов в связи со «сжатием спроса на внутреннем рынке» и ремонтами НПЗ), укрепления курса рубля, высокой закредитованности предприятий», — сетует источник в операторской компании. При этом, подчеркивает он, затраты операторов постоянно растут — за счет увеличения стоимости ремонтов (уже в январе цены ремонтов достигли трехлетнего максимума) и запчастей и роста регулируемых тарифов на перевозку порожних вагонов (с 1 января 2025 года тарифы на порожний пробег были проиндексированы на 10%). Стимулировать рост ставок могло бы увеличение перевозок угля, однако ожидать, что он будет резким, «не приходится», заключают в ИЦО. Ставки вернутся к уровню окупаемости инвестиций при условии долгосрочного положительного тренда в показателях погрузки и отказа операторов от стратегии наращивания парка. Читайте РБК в Telegram.	2	\N	2025-07-04 11:15:04	2025-07-04 11:15:04
1244	3840	twitch-poprosil-zapretit-synu-konstantina-malofeeva-suditsya-vne-ssha	Twitch попросил запретить сыну Константина Малофеева судиться вне США	https://s0.rbk.ru/v6_top_pics/media/img/2/41/347516404481412.jpeg	Amazon и Twitch требуют заочно запретить сыну Константина Малофеева Кириллу судиться с ними в любом месте, кроме Калифорнии. Это нужно, чтобы прекратить его попытки взыскать штраф, который уже превысил все деньги мира Кирилл Малофеев (Фото: albusnoxlol / VK) Компания Amazon и принадлежащий ей стриминговый видеосервис Twitch подали в суд Калифорнии ходатайство против Кирилла Малофеева — сына российского бизнесмена Константина Малофеева. Они просят запретить ответчику инициировать или продолжать любые судебные разбирательства против Twitch и Amazon, связанные с его аккаунтом на платформе, а также запретить попытки признания или принудительного исполнения любого решения, полученного Малофеевым в других юрисдикциях (включая российское решение и астрент). Это следует из материалов дела, опубликованных в американской системе раскрытия судебных документов (PACER). Кирилл Малофеев — профессиональный игрок в League of Legends (псевдоним — Likkrit). Аккаунт на стриминговой платформе Twitch он начал вести в 2013 году. В 2022-м этот аккаунт был заблокирован после того, как США ввели санкции против Кирилла и нескольких принадлежащих ему криптовалютных фирм, которые, по версии американских властей, были «частью сети по уклонению от санкций». После этого он подал иск в Арбитражный суд Москвы с требованием о восстановлении аккаунта. Российский суд удовлетворил требование и обязал платформу не только восстановить доступ, но и выплачивать «астрент» — штрафные санкции в размере 100 тыс. руб. ежедневно с удвоением суммы каждую неделю без временных ограничений. По расчетам Amazon и Twitch, к июню 2025 года эта сумма превысила «все деньги мира», говорится в заявлении. Московский суд арестовал имущество Amazon и Twitch в России на 3 млрд руб. в качестве обеспечительных мер. В 2023 году Малофеев подал в Турции иск к Amazon и Twitch с требованием принудительно исполнить решение российского суда. Рассмотрение дела должно пройти в октябре этого года. В ответ на это Amazon и Twitch в феврале 2025-го инициировали процесс в Калифорнии, утверждая, что Малофеев нарушил условия договора, с которыми он согласился, когда завел аккуант на Twitch. Договор требует разрешать споры исключительно через арбитраж в округе Санта-Клара Калифорнии. rbc.group Захарова назвала грабежом конфискацию активов Малофеева в США Политика rbc.group Рассмотрение ходатайства в калифорнийский суд может состояться 7 августа этого года. Истцы просят суд вынести заочное решение «по умолчанию». Ранее калифорнийский суд вынес временный предварительный запрет на разбирательства по делу в иных юрисдикциях. Но, как указано в ходатайстве Amazon и Twitch, Малофеев не явился на ключевые слушания 26 февраля этого года, несмотря на надлежащее уведомление на русском, турецком и английском языках, не представил письменных ответов на исковые требования и не опротестовал временный предварительный запрет, не отреагировал на уведомление о нынешних требованиях. Такое поведение, согласно Федеральным правилам гражданского судопроизводства США (FRCP), дает суду основания вынести решение без участия Малофеева, говорится в документе. В нем также указано, что «без решения по умолчанию Малофеев продолжит уклоняться от ответственности по договорам и попытается исполнить российское решение в Турции и других странах, оставив истцов без правовой защиты и причинив непоправимый ущерб». При этом в заявлении отмечается, что размер астрента «необоснован и совершенно несоразмерен доходу в менее $2 тыс., полученному от аккаунта ответчика за почти девятилетний период, пока он был активен». Представитель Кирилла Малофеева отказался от комментариев. Какими могут быть последствия Судебные системы третьих стран не связаны напрямую c антиисковым запретом, вынесенным судом США, говорит юрист практики «Разрешение споров» компании «Лемчик, Крупский и Партнеры» Екатерина Розум. Но с практической точки зрения вынесение такого судебного запрета, по ее словам, существенно усложнит признание и исполнение этого решения в других странах. «В ходе судебного разбирательства в суде третьей страны Amazon и Twitch непременно предъявит суду антисковый запрет, аргументируя им недопустимость признания и исполнения российского судебного решения, — пояснила юрист. — В этой связи суд столкнется с необходимостью учитывать два противоречащих друг другу судебных акта: с одной стороны — решение российского суда, с другой — запретительный приказ суда Калифорнии, блокирующий его исполнение». Также надо учитывать, что судебные инстанции государств, тесно связанных с западной финансовой системой, расположены принимать во внимание судебные приказы США, что существенно осложняет процедуру признания российского судебного решения, продолжает Розум. Кроме того, необходимо учитывать фактор санкционного давления на операторов платежных систем, который негативно влияет на исполнимость решения, противоречащего запрету американского суда, указала она. «Таким образом, формально решение [российского решения] останется действительным, но его реальное исполнение за пределами России резко усложнится. В подобной ситуации целесообразно действовать проактивно, подавая заявление о признании до вынесения антиисквого запрета. В противном случае взыскание будет чрезвычайно сложным и маловероятным. В России решение суда сохранит свою полную силу и может быть исполнено в обычном порядке», — заключила юрист. Суд ограничил «бесконечный» штраф Google Технологии и медиа Судебный запрет на исполнение решения российского суда по всему миру автоматически не остановит текущие процессы, например, в Турции, и не заблокирует подачу новых исков, согласен старший юрист практики трансграничных споров BGP Litigation Андрей Есманский. Суды третьих стран, по его словам, будут самостоятельно оценивать конфликт между решением России и запретом США, опираясь на Нью-Йоркскую конвенцию о признании арбитражных решений. «Глобальные запреты — стандартная практика защиты активов, но они допустимы лишь при четком ограничении предмета спора», — уточнил юрист. Он также пояснил, что размеры астрента объясняются не компенсацией убытков, а попыткой создать экономический стимул для исполнения решении. «Чем большей экономической силой обладает ответчик, тем больше должен быть размер астрента, чтобы заставить его соблюдать судебное решение», — добавил он. Нарушение запрета на продолжение разбирательств в других юрисдикциях, по словам Есманского, может повлечь уголовную ответственность за неуважение к суду и гражданские иски о возмещении убытков от Amazon и Twitch. Но взыскание таких убытков в России исключено: страна не признает решение американского суда, поскольку оно противоречит вступившему в силу вердикту российского арбитража, пояснил юрист. Ранее антиисковый запрет в отношении принадлежащего Константину Малофееву телеканала «Царьград», а также «Спаса» и Russia Today, получила Google (компания обращалась для этого в том же калифорнийский суд, а также в Высокий суд Англии и Уэльса), напомнил Есманский. Причиной запрета судиться в любых юрисдикциях, кроме США или Великобритании, стали требования, которые на тот момент были в 20 трлн раз больше общего ВВП всех стран. По состоянию на 15 января 2025-го они составляли 1,81 дуодециллиона руб. (единица с 39 нулями). В марте Арбитражный суд Москвы ограничил начисление судебной неустойки моментом признания российской «дочки» Google ООО «Гугл» банкротом (это произошло 18 октября 2023 года). К тому времени сумма астрента составляла 91,5 квинтиллиона руб. (единица с 18 нулями). Множество процессов по исполнению российских решений по всему миру, по мнению Есманского, могут инициировать, чтобы наложить взыскания хотя бы на некоторые активы Google и других компаний-ответчиков в дружественных юрисдикциях. Астрент является побуждением к исполнению решения, а не к компенсации ущерба, согласен советник Pen & Paper Роман Кузьмин. Он отметил, что заочное решение американского суда не нарушает доступ к правосудию в других странах, поскольку по общему правилу суды сами решают вопрос о своей юрисдикции в спорах с иностранной компанией. Например, иностранный суд может прийти к выводу, что заочное решение нарушило право Кирилла Малофеева на справедливое судебное разбирательство и не признавать его. Отказ Кирилла Малофеева участвовать в судебном процессе в Калифорнии, по оценке Кузьмина, может быть сознательной процессуальной стратегией: «Вероятно, с точки зрения американского права, оспорить юрисдикцию калифорнийских судов и арбитража затруднительно. Но представители Кирилла Малофеева могут попытаться оспорить заочное решение как нарушение его права на защиту. Аналогичный аргумент может быть в дальнейшем использован Малофеевым при попытках исполнить это решение в иностранных судах», — пояснил юрист. РБК направил запрос в Amazon и Twitch. Читайте РБК в Telegram.	6	\N	2025-07-07 10:25:02	2025-07-07 10:25:02
1251	3991	polsha-nachala-specoperaciyu-na-granice-s-germaniey-iz-za-potoka-migrantov	Польша начала спецоперацию на границе с Германией из-за потока мигрантов	https://s0.rbk.ru/v6_top_pics/media/img/3/10/347518778346103.jpeg	Фото: Lisi Niesner / Reuters Польская армия проводит специальную операцию «Безопасный Запад» на границе с Германией, сообщил министр национальной обороны республики Владислав Косиняк-Камыш в соцсети X. «Началась операция «Безопасный Запад» — польская армия поддерживает пограничников и полицию на границе с Германией. Параллельно мы расширяем действия на границе с Литвой в рамках операции «Безопасное Подлясье». <...> Усиливаем безопасность — решительно реагируем на миграционные угрозы», — говорится в сообщении. Польша и Германия поспорили о пограничной политике Политика rbc.group В военной операции на границе с ФРГ задействованы 5 тыс. солдат. rbc.group Польша 7 июля ввела на 30 дней временный пограничный контроль с Германией и Литвой. На границе с Литвой за ночь проверили 620 человек и 400 автомобилей, задержали первых нелегальных мигрантов, пишет Radio ZET. Пограничная служба сообщила, что ночью был задержан курьер, гражданин Эстонии, пытавшийся переправить в Польшу нелегальных мигрантов, которые могли быть гражданами Афганистана. «Мероприятия продолжаются», — отметило ведомство в X. Ранее The Washington Post сообщила, что Польша и Германия вступили в «обостряющийся спор о пограничной политике», который препятствует свободному передвижению в Европе. На это указывают меры особого контроля, принятые обеими странами. В сентябре 2024 года Германия на шесть месяцев ввела временный контроль на всех сухопутных границах, а также активизировала высылку беженцев. Тогда Польша обвинила Германию во враждебном шаге и пообещала ответить на ужесточение контроля на границе, поскольку «друзья и соседи так не поступают». Канцлер Германии Фридрих Мерц, придя к власти в мае этого года, начал реализовывать ряд жестких мер по борьбе с нелегалами. В их числе — введение постоянного контроля на границах. В ответ Польша объявила о введении пограничного контроля с Германией. «Причина этого решения — общая проблема, которая есть у нас, как и у Литвы, Польши, Европейского союза, — это борьба с нелегальной миграцией», — заявил министр внутренних дел Томаш Семоняк и добавил, что Варшава может отменить контроль на границе с Германией, если Берлин примет аналогичное решение. В 1995 году Европа начала отменять пограничный контроль между странами ЕС, однако при определенных обстоятельствах страны могут его восстановить. Некоторые сделали это во время пандемии коронавируса и после притока мигрантов, начавшегося в 2015 году. Читайте РБК в Telegram.	3	\N	2025-07-07 12:35:02	2025-07-07 12:35:02
1255	4039	postradavshim-ot-sovetskih-repressiy-grekam-vyplatili-kompensaciyu-za-zhile	Пострадавшим от советских репрессий грекам выплатили компенсацию за жилье	https://s0.rbk.ru/v6_top_pics/media/img/6/90/347518796184906.jpeg	Члены семьи Панаетиди, которую в 1940-х выслали по национальному признаку с Кубани в Казахстан, добились от краснодарских чиновников компенсации за утраченное жилье Фото: Екатерина Кузьмина / РБК Члены семьи греков Панаетиди, репрессированной в советское время, выиграли дело о компенсации за утраченное жилье, сообщил РБК юрист семьи Иван Калгин. «Наше дело завершилось победой. Дело полностью завершено, деньги выплачены, квартиры оформлены на реабилитированных и важно, что это первая такая выплата в России», — сказал он. Калгин уточнил, что каждому реабилитированному выделили 5,5 млн руб., или 21,9 млн руб. на четверых. «Краснодарский краевой суд оставил решение Приморского суда Новороссийска от 05.12.2024 без изменения, именно это решение было исполнено», — рассказал юрист. Приморский суд тогда обязал министра труда и соцразвития Краснодарского края вынести приказ о выплате денежных средств из расчета 33 кв. м площади на каждого истца. rbc.group Истцами выступили Надежда Рыбалкина, Анна, Ольга и Василий Панаетиди — дети Ивана Панаетиди, которого в 1942 году выслали из станицы Северской в Казахстан в ходе массовой депортации греков. Там он женился, в Краснодарский край семья смогла вернуться несколько десятилетий спустя. Детей супругов признали жертвами политических репрессий, которые имеют право на возмещение утраченного имущества. rbc.group «Ъ» узнал об иске жертв советских репрессий к краснодарским чиновникам Общество В 2020-м членов семьи поставили на учет в администрации Северского района как нуждающихся в жилплощади. После судебных разбирательств их внесли в льготную очередь. Панаетиди решили получить денежную компенсацию, на их сторону встали суды. Однако региональный минтруд издал приказ о компенсации, рассчитанной по нормативу 18 кв. м на человека, — сумму занизили почти в два раза, отмечал Калгин. Чиновники посчитали, что истцы должны купить одно жилье на всех. «Хотя по закону они не являются членами одной семьи, поскольку к таким лицам относятся несовершеннолетние дети, родители и супруги», — пояснял юрист. В краевом минтруда отмечали прошлой весной, что репрессированные имеют право на обеспечение жильем при условии «возвращения в те местности и населенные пункты, где они проживали до репрессий». Дети Панаетиди, как заявили в ведомстве, это условие не соблюли — их отца депортировали из станицы Северской, а сами они поселились в Новороссийске. Калгин с этим не согласился, сославшись на определение Конституционного суда от 2019 года о том, что всех детей жертв репрессий должны принимать на жилищный учет в родных местах «без каких-либо условий» — то есть без прописки и регистрации. Читайте РБК в Telegram.	3	\N	2025-07-07 13:05:03	2025-07-07 13:05:03
1258	4149	kreml-zayavil-chto-moskva-i-baku-dolzhny-ostatsya-partnerami-i-soyuznikami	Кремль заявил, что Москва и Баку должны остаться партнерами и союзниками	https://s0.rbk.ru/v6_top_pics/media/img/9/86/347518862581869.jpeg	«Логика говорит только об одном»: Россия и Азербайджан должны сохранить союзнические и партнерские отношения, заявил Песков. Дипломаты поддерживают контакты с Баку и отстаивают интересы задержанных россиян, добавил он Дмитрий Песков (Фото: Михаил Гребенщиков / РБК) Россия рассчитывает, что все проблемы с Азербайджаном будут урегулированы конструктивно, таким образом, «чтобы он соответствовал общему духу двусторонних отношений», заявил журналистам пресс-секретарь президента Дмитрий Песков, передает корреспондент РБК. «Логика говорит только об одном: Россия и Азербайджан являются и должны оставаться ближайшими партнерами, союзниками и странами, которых объединяет общая история, общее настоящее, общее будущее», — подчеркнул он. Новый кризис в отношениях Москвы и Баку. Хронология Политика rbc.group Песков сообщил, что российские дипломаты находятся в постоянном контакте с Баку и отстаивают интересы задержанных россиян, «используя все возможности». Также диалог с азербайджанской стороной поддерживают глава Следственного комитета Александр Бастрыкин и генпрокурор Игорь Краснов. rbc.group Новое обострение в отношениях Москвы и Баку произошло после того, как в конце июня в Екатеринбурге задержали уроженцев республики. Российский Следственный комитет назвал их фигурантами дел об убийствах и покушении на убийство в 2001, 2010 и 2011 годах. Двое из задержанных скончались, по данным СК, причиной смерти одного из них стала сердечная недостаточность. В чем причина обострения между Россией и Азербайджаном Политика Тела погибших доставили в Азербайджан, судмедэксперты сообщили, что они умерли от посттравматического шока в результате множественных травм. Прокуратура страны завела дело по статьям об убийстве, применении пыток и злоупотреблении служебным положением. Российского посла вызвали в МИД Азербайджана, ведомство выразило обеспокоенность в связи с «противоправными действиями», повлекшими гибель двух азербайджанцев, и «проявлениями этнической нетерпимости в связи с рейдами». На этом фоне в редакции «Sputnik Азербайджан» в Баку прошли обыски, нескольких сотрудников арестовали по делу о мошенничестве и незаконном предпринимательстве. Помимо этого, под стражу отправили еще восьмерых россиян, которых обвинили в транзите наркотиков из Ирана и киберпреступлениях. На кадрах из суда было видно, что у мужчин на лицах кровоподтеки и синяки. В числе задержанных оказались IT-разработчики, их родственники и знакомые назвали обвинения абсурдными. МИД России также вызвал посла Азербайджана из-за действий Баку и выразил протест в связи с «сознательными шагами азербайджанской стороны по демонтажу двусторонних отношений». Читайте РБК в Telegram.	7	\N	2025-07-07 14:15:02	2025-07-07 14:15:02
1262	4191	pochemu-otpravili-v-otstavku-ministra-transporta-romana-starovoyta	Почему отправили в отставку министра транспорта Романа Старовойта	https://s0.rbk.ru/v6_top_pics/media/img/3/89/347518767104893.jpeg	На отставку Старовойта с поста министра транспорта повлияли расследование хищений при строительстве фортификаций на границе Курской области, транспортный коллапс и инерция в отрасли, говорят источники РБК Роман Старовойт (Фото: Алексей Даничев / ТАСС) Утром в понедельник 7 июля президент России Владимир Путин своим указом сначала снял министра транспорта Романа Старовойта с должности без указания причин, а чуть позже назначил исполняющим обязанности главы ведомства его заместителя, бывшего губернатора Новгородской области Андрея Никитина. Путин отметил, что рабочие качества и опыт Никитина будут наилучшим образом способствовать тому, чтобы это «важнейшее ведомство» выполняло свои задачи. Пресс-секретарь президента Дмитрий Песков, отвечая на вопросы журналистов, подчеркнул, что отставка не была связана с утратой доверия: «Про утрату доверия говорят, если это утрата доверия. Как вы видели, такой формулировки (в указе — РБК) использовано не было». rbc.group РБК разбирался, с чем связана отставка Старовойта и почему на его место назначен человек, с небольшим транспортным бэкграундом. rbc.group Как связаны Старовойт и уголовное дело против бывшего руководства Курской области До назначения на пост министра транспорта в мае 2024 года Роман Старовойт был губернатором Курской области. На пост главы родного региона он был назначен Владимиром Путиным, до этого он возглавлял Росавтодор. Преемником Старовойта на должности главы региона стал его первый заместитель, глава правительства области Алексей Смирнов. Спустя 2,5 месяца после ухода Старовойта на федеральный уровень, 6 августа, на территорию Курской области вторглись украинские военные. К 12 августа под их контролем оказались 28 населенных пунктов, а глубина проникновения на территорию региона составила 12 км. О полном освобождении Курской области власти объявили только в мае 2025 года. В декабре 2024 года Смирнов ушел в отставку. Как объяснял Старовойт, из-за провала коммуникации с жителями приграничья. Спустя некоторое время правоохранительные органы стали сообщать о коррупционных злоупотреблениях в регионе, связывая их со строительством оборонительных сооружений на границе. Позже было заведено дело по ст. 159 УК о мошенничестве. Из иска Генпрокуратуры известно, что в 2022–2023 годах правительству Курской области из федерального бюджета было выделено 19,4 млрд руб. для строительства защитных сооружений (блиндажей, огневых точек, опорных пунктов, противотанковых пирамид и рвов). Ответчики создали «видимость выполнения работ по строительству защитных сооружений и реализовали ложную схему расходов, заключив фиктивные договоры с фирмами-однодневками на поставку строительных материалов», отмечали истцы. В рамках расследования дела в декабре был арестован генеральный директор АО «Корпорация развития Курской области», которая в том числе отвечала за установку оборонительных сооружений, Владимир Лукин, а также его заместители. Смирнов был арестован в апреле этого года. Источники РБК еще до отставки Старовойта с поста министра транспорта говорили, что рано или поздно эта история ударит и по нему, ведь строительство защитных сооружений началось при нем. По их словам, все зависело лишь от того, что скажут уже арестованные по делу. «Свидетелем он точно пойдет. Потому что он либо не видел, что у него происходит, либо покрывал происходящее», — говорит федеральный чиновник. Источник, близкий к администрации президента, добавляет, что вопросы к Старовойту у правоохранительных органов действительно есть. На отставку Старовойта, оставившего в Курской области своего преемника, повлияли дела о коррупции при строительстве оборонительных сооружений на границе, считает политолог Евгений Минченко. «После коррупционных дел в Курской области я давал прогноз, что это скорее всего может затронуть и Романа Старовойта, как бывшего губернатора этой области, оставившего своего преемника. Когда Андрея Никитина назначили на позицию замминистра транспорта, я высказал версию о том, что скорее всего его готовят в качестве преемника Романа Старовойта», — отметил политолог. Старовойт назвал причины крушений танкеров в Керченском проливе Общество Основная версия причин отставки Старовойта — последствия расследований в Курской области, согласен политолог Дмитрий Еловский. «Даже если Старовойт не был замешан в коррупционных делах, ситуация бросает тень и на него. У общества есть незаданный вопрос: если там была коррупция, то какова ответственность бывшего губернатора? Так что отставка в итоге — вполне логичное решение», — делает он вывод. Говоря о том, почему этого не произошло раньше, Еловский уточняет, что это «стиль нашей политической системы: не делать резких движений, убеждаться, рассматривать все варианты, чтобы снизить риск ошибки». Почему коллапс в аэропортах мог стать триггером отставки Один из источников РБК, близких к администрации президента, добавляет, что на отставку мог повлиять коллапс в аэропортах, произошедший в минувшие выходные из-за атаки дронов. Старовойт недостаточно активно работал по ситуации, говорит он: это могло стать триггером отставки. Впрочем, два других источника РБК, близких к администрации президента, сомневаются в этой версии. «А что он мог сделать? Сам взять зенитку и сбивать дроны?» — сказал один собеседник РБК. «Все-таки Старовойт был на позиции министра чуть больше года. За такое время редко кому удается что-то кардинально поменять в курируемой отрасли. И учитывая нашу скорость принятия кадровых решений в связи с качеством работы, я в этом сомневаюсь», — добавил другой. Песков не стал отвечать на уточняющий вопрос РБК, о том, что эксперты связывают перестановку с коллапсом в аэропортах и строительством защитных сооружений в Курской области: «Мне нечего добавить к тому, что я сказал. Еще раз повторяю: в письменном указе формулировки об утрате доверия не было». Политолог Еловский также обратил внимание на другие проблемы отрасли - рост кредиторской задолженности в отрасли, проблемы с безопасностью в морских портах и тд. «И хотя во многом это не его вина и не последствия его управления, но получается, что ему не удается справиться с проблемой», — заключил политолог. Путин уволил Старовойта с поста главы Минтранса Политика Собеседники РБК в разных отраслях, связанных с транспортом, говорят, что смена министра для многих стала неожиданностью: два источника отмечают, что график совещаний Старовойта был расписан «на много недель вперед». Один из источников предположил, что к середине лета сложилось несколько факторов, приведших к отставке министра, в том числе, атаки дронов на российские аэропорты, которые привели к массовым задержкам рейсов. Источник в судоходной отрасли говорит, что экс-министр в приоритетном порядке занимался автодорожным хозяйством, что логично, учитывая его опыт работы в Росавтодоре. При этом Старовойт проявлял интерес к судоходной отрасли — собирал просьбы судоходных компаний к правительству о мерах господдержки, выступал в поддержку отрасли на правительственных совещаниях. Другой источник допустил, что Старовойт изначально был временной фигурой на позиции министра. По его словам, за год работы он не успел запомниться ни успехами, ни ошибками. Какое будущее ждет Старовойта Очевидно, что после отставки Старовойт становится более уязвимой персоной, и это кадровое решение открывает новый этап расследования по поводу оборонительных сооружений, полагает политолог Ростислав Туровский. «Становится особенно важным, какое число влиятельных персон и регионов оно затронет, ведь дело уже не сводится к одной Курской области. И, конечно, включатся ли политические ограничители, если маховик этого процесса будет затрагивать влиятельных людей», — добавляет он. Судьба Старовойта в большей степени сейчас связана не с доказательствами, а с тем, насколько сильна элитная группа, к которой он принадлежит, и насколько она готова его защищать, подытожил Минченко. Отставка Старовойта как следствие коррупционных скандалов в Курской области может быть связана с желанием «не переводить стрелки» на пограничников и военных, говорит президент фонда «Петербургская политика» Михаил Виноградов. «Военные эксперты исходят из того, что оборонительные сооружения имели там смысл, когда есть военные, а поскольку военных там не было, эти претензии не всегда выглядят достаточно мотивированно», — объясняет он. Почему преемником Старовойта стал Андрей Никитин Исполняющим обязанности министра транспорта президент Владимир Путин назначил замминистра Андрея Никитина. До этого он в министерстве курировал цифровую трансформацию и деятельность «по информатизации и автоматизации транспортного комплекса России». Никитин пришел в министерство в феврале 2025 года, после неожиданной отставки с поста губернатора Новгородской области, которую занимал с 2017 года. Должность министра источники РБК предрекали Никитину уже с момента назначения в Минтранс. По их словам, Никитин был на хорошем счету у Владимира Путина. При этом, по оценке источников и экспертов, переход на позицию заместителя министра с губернаторской нельзя было однозначно рассматривать как повышение. Они придерживались версии, что Никитин перешел в Минтранс именно с перспективой занять место Старовойта, чьи позиции пошатнулись в связи с происходящим в Курской области. «Хочу предложить шаг вперед»: как Путин предложил Никитину пост министра Политика По их словам, поработать в позиции замминистра — это хорошая возможность разобраться в работе ведомства перед тем, как возглавить его. Еще будучи губернатором, Никитин достаточно хорошо погрузился в тему беспилотной авиации, добавляли собеседники РБК. Никитин очень активно занимался темой беспилотников, это могло быть аргументом при его назначении, считает Евгений Минченко. Он также уточняет, что здесь скорее важен внутриэлитный бэкграунд. «Никитин не транспортник, но в качестве опытного менеджера может справиться с новым объемом задач», — полагает Ростислав Туровский. Никитин как «нетранспортник» за время на посту замминистра, видимо, входил в курс дела, предполагает Михаил Виноградов. «Его назначение замминистра транспорта выглядело дауншифтингом, так редко бывает с губернаторами, которые на хорошем счету. Его повышение до министра позволяет серьезно не переделывать контроль финансовых потоков в сфере, сохранить преемственность, но в то же время принять меры», — утверждает он. Андрею Никитину 45 лет, он родился в Москве. Закончил Государственный университет управления по специальности «Государственное и муниципальное управление», затем получил степень MBA Стокгольмской школы экономики. Доктор экономических наук. В 2000-х годах работал в коммерческих структурах, в том числе был замгендиректора по развитию сети ресторанов «Теремок», возглавлял компанию «Стеклонит», производящую продукцию на основе стекловолокна, а затем и компанию «Рускомпозит», в которую она входит. В 2011 году был назначен гендиректором Агентства стратегических инициатив (АСИ), а спустя шесть лет получил назначение врио губернатора Новгородской области. Позже официально избрался на должность с результатом 67,9% голосов. В 2022 году переизбрался с результатом 77%.	4	\N	2025-07-07 14:45:01	2025-07-07 14:45:01
1267	4297	rossiyane-stolknulis-s-dvoynym-nalogooblozheniem-pri-rabote-s-kazahstanom	Россияне столкнулись с двойным налогообложением при работе с Казахстаном	https://s0.rbk.ru/v6_top_pics/media/img/0/02/347518907060020.jpeg	ФНС начала рассылать россиянам, получавшим доходы в Казахстане, уведомления с требованием оплатить НДФЛ по полной ставке. При этом в Казахстане их заработок уже облагался ИПН. В ФНС заявили, что проводят «контрольные мероприятия» Фото: Михаил Гребенщиков / РБК Граждане России, получавшие доходы от работодателей в Казахстане, столкнулись с двойным налогообложением, сообщили «Ведомости». По словам опрошенных газетой налоговых юристов, ФНС обратила внимание на россиян, работающих на иностранные компании, «из-за стремительного распространения удаленной занятости», а также релокации как граждан, так и компаний в Казахстан после 2022 года. В начале июня налоговая стала вызывать в инспекцию россиян, которые в 2022–2023 годах получали доход от казахстанских компаний и отразили в декларации уплату индивидуального подоходного налога (ИПН) в республике, рассказала юрист Линда Куркулите. При этом в Казахстане заработок таких россиян уже облагался ИПН по ставке от 5% до 20%. Управляющий партнер GidPrava Consulting Group Илья Назаров отметил, что обращения за консультациями в связи с двойным налогообложением доходов, полученных в Казахстане, носят массовый характер. Первый запрос от клиента юрист получил еще в мае. РБК направил запрос в ФНС. rbc.group В 1996 году Россия и Казахстан подписали Конвенцию об устранении двойного налогообложения. Устранение двойного налогообложения представляет собой процедуру, когда каждая из сторон обеспечивает налогоплательщику возможность уплатить налог только один раз — в одном из государств. Конвенция предусматривает, что для определения государства, которое будет взимать налог с доходов от работы по найму, имеют значение два основных обстоятельства: в какой стране находился сотрудник при выполнении работы, а также его должность. rbc.group По общему правилу ИПН остается в Казахстане, если работник жил там во время выполнения своих обязанностей, даже при сохранении налогового резидентства России, отмечают «Ведомости». Если же работник находился на территории России, то он должен платить только НДФЛ. Исключения предусмотрены только для так называемых гонораров директоров — доходов сотрудника на одной из высших управленческих должностей — налог с них платится в стране нахождения работодателя. В Казахстане предложили повысить налог на элитные дома, машины и яхты Общество В ФНС заявили «Ведомостям», что проводят «контрольные мероприятия», направленные на подтверждение права зачета иностранного налога. По словам представителя ведомства, чтобы использовать зачет, россияне должны указать сумму налога, уплаченного в другой стране, в декларации по форме 3-НДФЛ, а также предоставить трудовой договор, где указано место фактического выполнения работ. Если же работа выполнялась за пределами России, хотя работник в этот период сохранил статус российского налогового резидента, должны быть представлены сведения о командировании сотрудника. Сохранение статуса налогового резидента России не означает, что территория страны будет автоматически признаваться местом выполнения работы, подчеркнули в ФНС. К концу декабря 2023 года в Казахстане остались не более 80 тыс. из 400 тыс. россиян, въехавших в республику в сентябре 2022 года, когда в России была объявлена частичная мобилизация, говорил генконсул России в Алма-Ате Дмитрий Тураев. Выбор Казахстана в качестве страны для переезда он связывал с безвизовым режимом и отсутствием языкового барьера. При этом дипломат отмечал, что россияне переезжали в Казахстан «во многом на эмоциях». Читайте РБК в Telegram.	10	\N	2025-07-07 15:45:03	2025-07-07 15:45:03
875	1836	gref-uvidel-v-ekonomike-rossii-mnogo-priznakov-rezkogo-tormozheniya	Греф увидел в экономике России много признаков резкого торможения	https://s0.rbk.ru/v6_top_pics/media/img/7/18/347514560369187.jpeg	Герман Греф (Фото: Михаил Гребенщиков / РБК) К настоящему времени уже очевидны риски переохлаждения экономики России, эксперты видят много признаков того, что экономика уже начала «резко тормозить». Об этом заявил на Финансовом конгрессе Банка России глава Сбербанка Герман Греф. «Действительно, признаков того, что экономика стала резко тормозить, достаточно много. Мы имеем кризис на сырьевых рынках, падение цен на ключевые наши товары экспортные. И у нас явно перегрет рынок труда», — перечислил Греф. По его словам, экономику России тормозит «целый ряд факторов», среди которых «самым ключевым» является высокий уровень ключевой ставки ЦБ. rbc.group «И, конечно, я думаю, что это все понимают, и Центральный банк это хорошо понимает, что сейчас пришло время выровнять ситуацию. Очень важно не передержать высокие реальные ставки», — добавил глава Сбербанка. rbc.group Материал дополняется Читайте РБК в Telegram.	7	\N	2025-07-02 14:55:02	2025-07-02 16:27:25
1162	2680	genprokuratura-poprosila-peredat-gosudarstvu-aktivy-konstantina-strukova	Генпрокуратура попросила передать государству активы Константина Струкова	https://s0.rbk.ru/v6_top_pics/media/img/7/60/347515271718607.jpeg	В надзорном ведомстве заявили, что активы оформлены на доверенных лиц, а также дочь бизнесмена Александру Струкову, имеющую гражданство Швейцарии. Накануне в «Южуралзолоте» прошли обыски Южуралзолото UGLD ₽0,505 -12,08% Купить Константин Струков (Фото: Вадим Ахметов / URA.RU / ТАСС) Генпрокуратура обратилась в Советский райсуд Челябинска с требованием передать активы президента золотодобывающей компании «Южуралзолото» (ПАО «Южуралзолото Группа Компаний», ЮГК) Константина Струкова, зампреда законодательного собрания Челябинской области от «Единой России в доход государства. Как пишет «Коммерсантъ», в ведомстве считают, что Струков незаконно получил ЮГК и еще десять компаний под контроль, используя свои должности и положение в органах госвласти. Сейчас они оформлены на его дочь Александру Струкову, имеющую гражданство Швейцарии и доверенных лиц. Накануне сотрудники региональных управлений ФСБ и СК в Челябинской области пришли с обысками в офисы ЮГК, они в том числе посетили рабочие места Струкова, основного акционера компании. По словам источника РБК, следственные действия были связаны с нарушением правил охраны окружающей среды, промышленной безопасности и эксплуатации промышленных объектов на земельных участках компании в Пластовском и Еткульском районах. rbc.group В «Южуралзолоте» сообщили, что компания работает штатно. Там заверили, что «уделяют максимальное внимание безопасности производства и минимизации экологического воздействия» своих производств. rbc.group Силовики пришли с обысками в «Южуралзолото» Бизнес ЮГК занимает четвертое место по объему производства золота в России, в 2024 году, по данным на ее сайте, было реализовано 330 тыс. тр. унций. Струков — основной владелец компании. В 2024 году «ААА Управление капиталом», входящая в группу Газпромбанка, приобрела у бизнесмена 22% акций ЮГК. После сделки у него осталось 67,85%, доля акций в свободном обращении — 10,15%. Струков занимает 78 место рейтинга миллиардеров России Forbes, его состояние журнал оценивает в $1,9 млрд. С 2000 года является депутатом закосбрания Челябинской области. В 1997 году он стал генеральным директором ЮГК, а с 2001 по 2007 годы возглавлял совет директоров компании. В середине 2000-х также руководил Челябинской угольной компанией. Имеет несколько региональных наград Челябинской области. Читайте РБК в Telegram.	8	\N	2025-07-03 10:50:02	2025-07-03 10:50:02
881	1955	kostin-prizval-ne-robko-nazvat-dve-prichiny-situacii-v-ekonomike	Костин призвал не робко назвать две причины ситуации в экономике		Причиной «инфляции у нас являются большие военные расходы». Об этом заявил глава банка ВТБ Андрей Костин. Он указал, что говорить о проблемах в экономике «нам помогает президент», который дважды об этом рассказал на прошедшей неделе. Костин добавил, что «мы всегда очень робкие», когда пытаемся говорить о ситуации в экономике. Костин предложил оценивать ситуацию исходя из положения, «в которое попала страна». «Это большие военные расходы. Помимо того, что они вообще большие, и являются частью государственных расходов и стимулируют развитие определенных отраслей экономики, они еще и не производят продукцию, которая потом попадает на рынок. Поэтому предложение не увеличивается на рынке, а расходы — растут», — сказал он. Вторая причина — это «огромное количество санкций». Материал дополняется Читайте РБК в Telegram.	10	2025-07-02 16:43:18	2025-07-02 15:05:03	2025-07-02 16:43:18
1164	2704	cbs-uznal-chto-ssha-peresmotreli-voennuyu-pomoshch-ne-tolko-ukraine	CBS узнал, что США пересмотрели военную помощь не только Украине	https://s0.rbk.ru/v6_top_pics/media/img/2/58/347515284401582.jpeg	США «перевели в другую категорию» ряд государств, лишив их приоритета в вопросе поставок оружия, сообщил представитель Белого дома. Решение принято в рамках проверки Пентагона Фото: Matt Rourke / Reuters США не только заморозили поставки некоторых видов вооружений Украине, но и лишили приоритета в получении оружия и боеприпасов некоторые другие страны, сообщает CBS со ссылкой на представителя Белого дома. Чиновник не уточнил, о каких именно государствах речь, отметив, что их «перевели в другую категорию». Он также не пояснил, как долго продлится пауза в поставках Киеву. Со слов представителя Белого дома, решение было принято в рамках проверки Пентагона в отношении передачи оружия всем странам, которые получают помощь США. Министр обороны Пит Хегсет начал ее несколько недель назад по указанию президента Дональда Трампа, чтобы убедиться, что Пентагон при предыдущей администрации «отдавал приоритет потребностям Америки». rbc.group В Киеве заявили о прекращении США поставок всей военной помощи Политика rbc.group Представитель Пентагона Шон Парнелл на брифинге вечером 2 июля подтвердил, что пересмотр экспорта американского оружия может затронуть не только Украину, но и другие страны. Однако он отказался уточнить, приостановили ли США поставки другим получателям. В Минобороны допустили, что Трамп, «в зависимости от результатов проверки» Пентагона, может распорядиться отправить на Украину все оружие, передачу которого заморозили, или его часть. Politico и NBC сообщали, что Пентагон заморозил поставки Киеву ракет для систем ПВО Patriot, ракет Hellfire и других высокоточных боеприпасов из-за опасений, что запасы этих вооружений в США слишком сократились. Решение стало неожиданным не только для Украины и союзников по НАТО, но и некоторых членов американской администрации: по данным Politico, Минобороны не согласовывало его с Госдепом. При этом в Белом доме это отрицают.  Госдепартамент настаивает, что речь не идет о полном прекращении помощи. Вашингтон и Киев готовят телефонный разговор Трампа с президентом Украины Владимиром Зеленским. Последний накануне сообщил, что детали по поставке оборонной поддержки, включая компоненты ПВО, уточняются. Читайте РБК в Telegram.	3	\N	2025-07-03 10:55:05	2025-07-03 10:55:05
1174	2802	sud-razreshil-rossiyanam-ne-zamechat-melkie-oshibki-v-zagranpasportah	Суд разрешил россиянам не замечать мелкие ошибки в загранпаспортах	https://s0.rbk.ru/v6_top_pics/media/img/8/54/347515322487548.jpeg	Пара не смогла вылететь в Таиланд из-за ошибки в графе «пол» в загранпаспорте жены. В паспортном столе посчитали, что она должна была убедиться в отсутствии недочетов, суд отклонил довод. МВД обязали выплатить более ₽200 тыс. Фото: Виталий Невар / ТАСС Суд в Краснодарском крае постановил, что россияне не обязаны замечать мелкие недочеты в заграничных паспортах, сообщает «Российская газета» со ссылкой на решение инстанции. В суд обратилась семейная пара, которая собиралась в Таиланд. При прохождении контроля обнаружилось, что в документе жены в графе «пол» было указано «м», поэтому пограничники не пропустили женщину. В итоге от поездки отказался и ее муж. Суды первой и второй инстанции признали, что МВД должно и компенсировать паре путевки стоимостью 206 тыс. руб., и возместить моральный ущерб в 20 тыс. руб. В паспортном столе решение оспорили, посчитав, что женщина сама должна была изучить документ и убедиться, что ошибок нет. rbc.group МИД исключил изъятия загранпаспортов из-за транслитерации Политика rbc.group Кассация отклонила этот довод. «Ошибка в графе «пол» при верных остальных данных не является очевидной для непрофессионала (п. 147.3 Административного регламента МВД)», — заявили в суде. В кассации отметили также, что тур был приобретен для совместной поездки на празднование 8 Марта. МВД обязали выплатить всю сумму. Туристам не впервые удается отсудить у МВД компенсацию за сорвавшуюся поездку из-за ошибок в загранпаспортах. В прошлом году семья из Челябинской области не смогла вылететь в Таиланд, поскольку у женщины в отчестве не хватало буквы, а у ребенка в графе «пол» вместо необходимой буквы значился символ «>». Семья ранее путешествовала по этим же документам, и претензий к их паспортам не было. В итоге министерство обязали выплатить почти 500 тыс. руб. Ребенка не пустили на рейс в Дубай из-за одной буквы в паспорте Общество В декабре 2023 года в России вступил в силу закон о перечне оснований недействительности паспортов. После этого у россиян начали изымать загранпаспорта на границе из-за опечаток — например, из-за пропущенной буквы в названии города или ошибки в имени. К весне 2024-го проблема приобрела «лавинообразный характер», сообщили в Ассоциации туроператоров России. Например, одного из пассажиров, у которого место рождения было указано как просто «Ленинградская область», «со скрипом» пропустили в аэропорту Пулково. МВД отрицало, что ошибки допущены массово. Самым распространенным недочетом в написании имен и фамилий ведомство назвало употребление буквы «ё» и ее некорректную транслитерацию. Министерство попросило граждан тщательно проверять правильность данных при получении загранпаспортов и пообещало оформить новый документ в короткие сроки и без взимания госпошлины. МИД указывал, что одно и то же имя может быть транслитерировано по-разному, это не ошибка и не основание для изъятия паспорта.	10	\N	2025-07-03 12:45:03	2025-07-03 12:45:03
1163	2702	v-kieve-zayavili-o-prekrashchenii-ssha-postavok-vsey-voennoy-pomoshchi	В Киеве заявили о прекращении США поставок всей военной помощи	https://s0.rbk.ru/v6_top_pics/media/img/7/84/347515278193847.jpeg	В Киеве считают, что США предприняли такой шаг, чтобы добиться политических уступок. Пентагон объяснял приостановку помощи приоритетами в обороне Фото: Matt Slocum / AP / ТАСС США прекратили поставки Украине всей военной помощи, а не только отдельных категорий вооружения, заявили украинские чиновники изданию The Economist на условиях анонимности. Собеседники издания не верят заявлению Пентагона о том, что приостановка поставок — временная и ограниченная мера, а считают, что ее целью является добиться политических уступок от Киева. Economist напоминает, что в марте поставки приостанавливались после перепалки лидеров США и Украины в Овальном кабинете. Киев решил попросить объяснений у США из-за сообщений о задержках помощи Политика rbc.group Как пишет Politico, Пентагон не уведомил о решении заморозить передачу вооружений Киеву Госдепартамент США и конгрессменов, которые обычно хорошо осведомлены о подобных вопросах. Это стало для них неожиданностью. По данным издания, идет подготовка телефонного разговора президентов США и Украины Дональда Трампа и Владимира Зеленского. Решение застало врасплох европейских союзников и Украину. Как передает Bloomberg со ссылкой на неназванного европейского чиновника, один из членов НАТО оказывает давление на Пентагон, чтобы ведомство пересмотрело решение. rbc.group 1 июля Politico и NBC News сообщили, что США приостановили поставки части вооружений Украине, включая ракеты для систем ПВО Patriot. По информации Financial Times, решение о паузе в поставках вступило в силу, когда некоторые из них уже направлялись на Украину. Пентагон объяснил решение о паузе в поставках части вооружений Киеву «пересмотром возможностей», для того чтобы убедиться, что «военная помощь США соответствует с нашими приоритетами в обороне». Россия выступает против поставок военной помощи Украине. Москва неоднократно отмечала, что они не изменят итогов конфликта, а лишь затянут его.	10	\N	2025-07-03 10:55:03	2025-07-03 10:55:03
1203	3198	mosbirzha-priostanovila-torgi-akciyami-yuzhuralzolota	Мосбиржа приостановила торги акциями «Южуралзолота»		За два дня акции ЮГК потеряли более 30% на фоне обысков в офисах и иска Генпрокуратуры об изъятии доли мажоритарного акционера. Мосбиржа пояснила, что решение принято на основании предписания от ЦБ Южуралзолото UGLD -0,08% Фото: Илья Наймушин / РИА Новости Московская биржа  приостановила торги акциями «Южуралзолота» на фоне обысков в офисах компании и иска Генпрокуратуры об изъятии активов. Об этом «РБК Инвестициям» рассказал источник в крупной брокерской компании. «Выглядит так, будто торги остановлены, но официальных оповещений от биржи пока не было», — отметил второй источник. «РБК Инвестиции» убедились, что сделки нельзя совершить в брокерских приложениях «Альфа-Инвестиций», «Финама», «Т-Инвестиций» и «СберИнвестиций». В приложении БКС можно выставить заявку, но она не исполняется. В то же время СПБ Биржа продолжает торги акциями ЮГК, сообщил «РБК Инвестициям» представитель площадки. rbc.group Позднее Московская биржа сообщила, что торги акциями «Южуралзолота» были приостановлены во всех режимах на основании предписания Банка России. «РБК Инвестиции» направили запрос в пресс-службу ЦБ. Торговая площадка также установила запрет на короткие продажи по акциям и двум облигационным выпускам ЮГК: 001P-03 и 001P-04. Брокер «Т- Инвестиции  » пояснил, что будет с позициями его клиентов по ЮГК. «Если стоимость вашего портфеля опустится ниже минимальной маржи, ваша позиция может быть закрыта принудительно. В случае, если бумаги куплены в лонг, закрыть непокрытую позицию можно пополнив счет. Короткие позиции  по акциям «Южуралзолота» будут закрыты принудительно, когда появится такая возможность», — сказано в сообщении инвесткомпании. Согласно данным терминала TradingView, последняя сделка с бумагами золотодобывающей компании была совершена 4 июля в 10:29 мск. Котировки замерли на отметке 0,4768 руб. (-0,13% к закрытию предыдущей торговой сессии). Объем free-float компании ЮГК по состоянию на 4 июля составляет 10%, а капитализация на момент остановки торгов — ₽106,22 млрд. Объем торгов на Мосбирже до остановки торгов составлял ₽2,73 млрд. Генпрокуратура попросила передать государству активы Константина Струкова 3 июля Советский районный суд Челябинска одобрил ходатайство Генпрокуратуры об обеспечительных мерах по иску об обращении в доход государства доли основного владельца «Южуралзолота» Константина Струкова. Суть обеспечительных мер не раскрывалась. Акции отреагировали на новость негативно и в моменте теряли более 17%. Акции ЮГК обрушились на 17% после иска о конфискации компании Южуралзолото , Инвестиции , Акции На этом фоне инвестиционные аналитики начали предупреждать миноритарных инвесторов о рисках. Однако в Центробанке заявили, что не слышали о прямой угрозе акциям ЮГК, которыми владеют миноритарии. В ЮГК Струкову принадлежит 67,85%, 22% через ЗПИФ «Фиалка» владеет Газпромбанк, остальное — акции в свободном обращении. Аналитики «Ренессанс Капитала» в ежедневном обзоре обозначали три варианта дальнейшего развития событий: вариант 1: мажоритарная доля Струкова будет изъята в пользу Росимущества, а доли владения миноритариев компании не будут затронуты. Что касается доли ЗПИФ «Фиалка» — здесь все будет зависеть от аффилиированности бенефициаров к Струкову — данная доля тоже может быть изъята, если будет доказано, что бенефициары ЗПИФ связаны с мажоритарным акционером; вариант 2: изъятие 100% акций ПАО «ЮГК» в пользу Росимущества, с последующей денежной компенсацией миноритарным акционерам; вариант 3: изъятие 100% акций ПАО в пользу Росимущества без компенсации миноритарным акционерам, в случае если те не будут признаны «добросовестными приобретателями» актива. Способ торговли на бирже, когда инвестор заимствует у брокера акции, которыми сам не владеет, чтобы продать их по текущей рыночной цене с тем, чтобы купить эти же акции по более низкой цене и извлечь выгоду. В этом случае инвестор ограничен сроками расчетов, а открытие короткой позиции сопряжено с высоким риском. Регламентированный рынок, где встречаются продавцы и покупатели, торгующие различными активами: акциями, облигациями, валютой, фьючерсами, товарами. Стать участником торгов на бирже может каждый – для этого нужно открыть брокерский счет. Каждая сделка заключается по рыночной цене, совершается практически мгновенно, а также регистрируется и контролируется. Подробнее Инвестиции — это вложение денежных средств для получения дохода или сохранения капитала. Различают финансовые инвестиции (покупка ценных бумаг) и реальные (инвестиции в промышленность, строительство и так далее). В широком смысле инвестиции делятся на множество подвидов: частные или государственные, спекулятивные или венчурные и прочие. Подробнее	9	\N	2025-07-04 12:35:03	2025-07-04 12:35:03
1172	2799	zarplaty-ugolshchikov-vyrosli-na-fone-krizisa-v-otrasli	Зарплаты угольщиков выросли на фоне кризиса в отрасли	https://s0.rbk.ru/v6_top_pics/media/img/9/55/347515335571559.jpeg	Зарплаты угольщиков выросли за последний год на фоне развития новых технологий, обеспечивших высокий спрос на специалистов в этой области. Несмотря на кризис в отрасли, вознаграждение и потребность в кадрах остаются стабильными Фото: Таисия Воронцова / РИА Новости По итогам весны 2025 года зарплаты в угольной отрасли выросли в среднем на 13% по отношению к аналогичному периоду прошлого года, отметили аналитики «Авито Работы» и инжиниринговой компании TAPP Group в совместном обзоре (есть в распоряжении РБК). К концу мая кандидатам предлагали около 80,2 тыс. руб. за полный рабочий день. Эту динамику поддерживает повышенный спрос на квалифицированных специалистов в сфере высоких технологий, потребность в которых усиливается с развитием инжиниринговых и цифровых проектов на предприятиях и внедрением технологий на базе искусственного интеллекта, объясняют аналитики. Самые высокие зарплаты — в Центральном федеральном округе из-за концентрации штаб-квартир компаний и инжиниринговых центров в Москве и Подмосковье, здесь среднее предложение оценивается в 126,7 тыс. руб. На втором месте — Северо-Западный федеральный округ (119,8 тыс. руб.) из-за близости портовой инфраструктуры и размещения промышленных предприятий, на третьем — Дальневосточный (115,6 тыс. руб.) благодаря развитию новых месторождений и господдержки, включая налоговые льготы, которые способствуют экономическому росту региона и развитию инфраструктуры. Рост заработных плат в сфере добычи угля подтверждают и данные Росстата. Так, среднемесячная номинальная начисленная зарплата в этой отрасли в марте (последние доступные данные) 2025 года составила около 126,9 тыс. руб., годом ранее — порядка 116,6 тыс. руб., приводят данные во ВНИИ труда. rbc.group Наибольший годовой рост показателя наблюдается в дальневосточных регионах: на 20 тыс. руб. за год выросли зарплаты на Сахалине (на 1 марта текущего года, согласно статистике Минэнерго, средняя зарплата была 159,1 тыс. руб.), Чукотке (175,3 тыс. руб.), в Бурятии (125,5 тыс. руб.) и Забайкальском крае (110,5 тыс. руб.); на 30 тыс. руб. и более — в Хабаровском (153,2 тыс. руб.) и Приморском краях (111,9 тыс. руб.), Амурской (121,2 тыс. руб.) и Магаданской областях (193,3 тыс. руб.). В Минэнерго, в свою очередь, добавляют, что в угольных регионах уровень зарплат в отрасли в принципе превалирует над средней по субъекту: например, в Кузбассе разница оценивается в 116,8 тыс. руб. и 78,8 тыс. руб. соответственно, Хакасии — 112,3 тыс. руб. и 74,9 тыс. руб., Якутии — 174,1 тыс. руб. и 125,2 тыс. руб. rbc.group Увеличение зарплат также связано с ежегодной индексацией по Федеральному отраслевому соглашению по угольной промышленности (регулирует социально-трудовые отношения в этой сфере, заключается между Росуглепрофом и ассоциацией «Общероссийское отраслевое объединение работодателей угольной промышленности» с 2007 года, последний раз — 7 ноября 2024 года до конца 2027 года), напомнили в Росуглепрофе. В этом году она была проведена 1 февраля и составила 10,4% (с учетом индекса роста потребительских цен). Число нарушений на предприятиях угольной отрасли сократилось вдвое Бизнес Какие специалисты самые востребованные Наиболее заметный рост зарплат по состоянию на конец мая 2025 года в сравнении с прошлым годом отмечается у машинистов спецтехники (+56%, до 135 тыс. руб.), электромонтажников (+48%, до 74 тыс. руб.) и механиков (+44%, до 167 тыс. руб.) — это объясняется высокой конкуренцией на рынке труда, особенно на фоне реализации инфраструктурных проектов и модернизации производств, подсчитали в «Авито Работе» и TAPP Group. Самый высокий спрос — на работников, способных обслуживать современное высокотехнологичное оборудование. Отдельно эксперты отмечают инженеров — год к году их зарплаты выросли на 10%, до 89,6 тыс. руб., что подчеркивает устойчивый спрос на инженерные специальности, значимые для развития промышленности и инфраструктурных инициатив. По словам Дмитрия Лохова, гендиректора TAPP Group, внедрение интеллектуальных алгоритмов для управления технологическими процессами решает проблему дефицита кадров и среднего инженерного состава. «В результате этого повышается производительность труда, увеличивается выход продукции и ее качество — за счет исключения человека из рутинных операций. Искусственный интеллект предотвращает перегрузку оборудования, не допускает работы с пониженной эффективностью, снижает риск аварий и оптимизирует график плановых ремонтов», — заключил он. Больше всего вакансий в угольной промышленности, по информации ВНИИ труда, размещено сейчас на популярных платформах по поиску работы для машинистов бульдозера (5,4 тыс. объявлений), бурильщиков и машинистов буровой установки (3,9 тыс.), дробильщиков (1,3 тыс.), горнорабочих (1,1 тыс.), горных мастеров (1 тыс.), проходчиков (0,9 тыс.) и крепильщиков (0,2 тыс.). Троценко оценил фразой «лед тронулся» поддержку угольщиков Бизнес В «Эн+ Уголь» подтверждают особую востребованность специалистов по обслуживанию сложного горного оборудования и рабочих, задействованных в процессе добычи полезных ископаемых, — машинистов шагающих экскаваторов и машинистов буровых установок, а также водителей автомобиля «БелАЗ» по перевозке горной массы и машинистов бульдозера. Количество вакансий «стабильно высокое» на протяжении нескольких лет, эта ситуация решается «комплексно», рассказывает представитель компании. По его словам, создана отдельная группа по подбору персонала, проводится работа по обеспечению оптимальных условий труда для работников — построены новые столовые, ремонтируются бытовые помещения, введена частичная оплата питания. Учебные пункты филиалов проводят обучение по востребованным профессиям, доступна переквалификация. «Кроме того, сформирован кадровый резерв на ключевые должности, реализуются корпоративные программы развития. В целях подготовки кадрового резерва на ключевые должности заключены договоры на софинансирование получения высшего образования работниками «Эн+ Уголь», — продолжают в пресс-службе «Эн+ Уголь». Для сотрудников, переезжающих из других регионов, предусмотрены подъемные выплаты. Как угольщики работают в период кризиса В условиях кризиса в угольной отрасли (его спровоцировал ряд негативных внешних и внутренних факторов, главный из которых — обвал цен на твердое топливо на мировых рынках) некоторые предприятия приостанавливают свою деятельность, в том числе из-за долгов по зарплате. Последним из них стала шахта Спиридоновская в Кемеровской области — задолженность по зарплате, отпускным и расчетным выплатам составляет примерно 90 млн руб. перед 900 сотрудниками. В конце мая было принято решение о сокращении 760 работников из-за дефицита инвестиций, в течение месяца 120 из них уже уволились. По словам Ивана Мохначука, председателя Росуглепрофа, в основном для сотрудников убыточных предприятий, приостанавливающих работу, предусмотрен перевод на другие промышленные объекты либо отпуск с сохранением 60% зарплаты. «Надеемся, что рынки как-то всколыхнутся, появится потребитель, и мы вернем людей на рабочие места, будем добывать уголь», — пояснил он. В конце мая этого года правительство утвердило антикризисную программу для угольной отрасли, которая направлена, в частности, на помощь компаниям в погашении задолженностей (в 2024 году задолженность угольных предприятий по кредитам и займам составила 1,191 трлн руб.) посредством реструктуризации платежей, нивелировании логистических издержек, усиливающих кризисное положение (транспортная составляющая берет на себя существенную часть от цены реализации продукции, в Минэнерго признают, что сейчас экспорт угля убыточен во всех направлениях). Будут утверждены программы финансового оздоровления (в том числе при помощи самих бенефициаров, а также ограничений на выплату дивидендов, повышение зарплат топ-менеджменту и оптимизации затрат) и предоставлены отсрочки по налогам, страховым взносам и сборам. В «Авито Работе» и TAPP Group рассчитывают, что эти меры поддержки окажут позитивное влияние на дальнейший рост средних зарплат. По данным замминистра энергетики Дмитрия Исламова, адресная помощь охватит 73 предприятия угольной отрасли, по 20 она рассматривается в настоящее время, говорил он в недавнем интервью ТАСС. По состоянию на конец июня поддержка согласована четырем компаниям — это «Мечел-Майнинг» (десять предприятий), «Воркутауголь» (пять предприятий), СУПК, «СДС-Уголь» (пять предприятий). По трем из них «решение принято», по «СДС-Углю» еще «будет идти обсуждение», пояснял Исламов. Читайте РБК в Telegram.	4	\N	2025-07-03 12:45:03	2025-07-03 13:56:02
1245	3919	putin-uvolil-starovoyta-s-posta-glavy-mintransa	Путин уволил Старовойта с поста главы Минтранса	https://s0.rbk.ru/v6_top_pics/media/img/2/69/347518704429692.jpeg	Старовойт до назначения министром возглавлял Курскую область, его преемник на этой должности был арестован по делу о хищении бюджетных средств, потраченных на линии обороны региона Владимир Путин и Роман Старовойт (Фото: Администрация Президента России) Президент Владимир Путин освободил Романа Старовойта от должности министра транспорта, указ опубликован на портале правовых актов. Старовойт — бывший губернатор Курской области. В 2012–2018 годах Старовойт руководил Росавтодором. С 1 по 10 октября 2018 года занимал должность замминистра транспорта. После шести лет во главе Курской области, в мае 2024 года, он был назначен министром транспорта. На место губернатора Курской области после Старовойта был назначен Алексей Смирнов, он возглавлял область с мая по декабрь 2024 года. В апреле 2025 года Смирнова задержали. Задержание было связано с делом о хищении средств, выделенных на возведение оборонительных сооружений в Курской области. Источник РБК рассказывал, что у правоохранительных органов возникли вопросы к качеству «зубов дракона» — бетонных заграждений на границе с Украиной. Позднее в уголовном деле против бывшего губернатора появились пункты о растрате бюджетных средств при возведении опорных сооружений для погранслужбы rbc.group По делу о мошенничестве были арестованы также бывший заместитель Старовойта Алексей Дедов, а также экс-депутат Курской областной думы Максим Васильев, последний частично признал вину в растрате. rbc.group Зимой 2024-го был арестован генеральный директор Корпорации развития Курской области Владимир Лукин, которого обвинили в злоупотреблении должностными полномочиями при строительстве фортификационных сооружений. Руководство корпорации и ее деятельность не раз критиковал Александр Хинштейн, который стал врио губернатора Курской области в декабре. После начала специальной военной операции Старовойт попал в санкционные списки Великобритании, Канады, Австралии, Новой Зеландии, Украины и США. Награжден орденами Почета, Александра Невского и Дружбы. Действительный государственный советник Российской Федерации 1-го класса. В феврале 2025 года заместителем Старовойта стал экс-губернатор Новгородской области Андрей Никитин. В Минтрансе он отвечает за цифровую трансформацию, а также деятельность «по информатизации и автоматизации транспортного комплекса России». До того, как возглавить Новгородскую область в 2017 году, Никитин был гендиректором АНО «Агентство стратегических инициатив по продвижению новых проектов». РБК направил запрос в Минтранс. Читайте РБК в Telegram.	2	\N	2025-07-07 11:15:01	2025-07-07 11:15:01
1253	4018	putin-naznachil-i-o-glavy-mintransa-eks-gubernatora-novgoroda-nikitina	Путин назначил и.о. главы Минтранса экс-губернатора Новгорода Никитина	https://s0.rbk.ru/v6_top_pics/media/img/7/52/347518730505527.jpeg	Новым министром транспорта вместо Романа Старовойта станет Андрей Никитин, занявший должность заместителя главы ведомства в феврале. Указ об увольнении Старовойта президент Путин подписал 7 июля без указания причины Андрей Никитин (Фото: Андрей Любимов / РБК) Новым главой Минтранса после увольнения с этой должности Романа Старовойта станет нынешний заместитель министра транспорта Андрей Никитин. Он назначен исполняющим обязанности министра, указ подписал президент Владимир Путин. Никитин стал замглавы Минтранса в феврале. До этого он с 2017 года был губернатором Новгородской области, также возглавлял комиссию госсовета по демографии. На посту замминистра транспорта он курировал цифровую трансформацию, деятельность по информатизации и автоматизации транспортного комплекса страны. Video «Надеюсь, что Вы приложите все свои силы, знания, умения, организаторские способности для того, чтобы решать те важнейшие задачи, которые стоят в этой сфере», — заявил Путин на встрече с Никитиным. Президент отметил, что намерен внести в Госдуму кандидатуру Никитина для утверждения на пост министра транспорта. В случае если депутаты поддержат это, глава государства подпишет указ об окончательном назначении его на эту должность. rbc.group Никитин родился в 1979 году в Москве. Окончил Государственный университет управления по направлению «Государственное и муниципальное управление», имеет степень доктора экономических наук. C 2002 по 2011 год работал в группе компаний «РУСКОМПОЗИТ», объединяющей крупнейшие предприятия России на рынках стекловолокна, композитов и геосинтетических материалов. В 2011 году занял должность генерального директора Агентства стратегических инициатив. В феврале 2017 года был назначен врио главы Новгородской области. В том же году был избран (получил 67,99% голосов избирателей) губернатором. 7 февраля 2025 года назначен заместителем министра финансов. 7 июля президент подписал указ об отставке министра транспорта Романа Старовойта. Он занимал этот пост чуть больше года — с мая 2024-го. До перехода в федеральное правительство Старовойт был главой Курской области. На этот пост его избрали в сентябре 2019 года. Одним из заместителей Старовойта во время работы губернатором был Алексей Смирнов. Последний после перехода Старовойта в федеральное правительство весной 2024 года возглавил регион. При Смирнове произошло вторжение ВСУ в приграничные районы Курской области. В декабре того же года его сняли с поста по собственному желанию (врио губернатора стал Александр Хинштейн), а весной 2025-го задержали, дело против него касается мошенничества, а также растраты бюджетных средств при возведении опорных сооружений на границе с Украиной. За время работы Старовойта на посту министра транспорта (чуть более года) произошло несколько серьезных инцидентов в транспортной отрасли: В декабре 2024-го в Черном море произошло крушение танкеров, что привело к утечке мазута, последствия которой устраняют до сих пор. Часть черноморского побережья, в том числе пляжи Анапы, до сих пор считаются непригодными для отдыха. В феврале 2025-го в порту Усть-Луга произошел взрыв в иностранном нефтяном танкере Koala, экипаж эвакуировали, а нефтепродукты откачали, утечки удалось избежать. Судно в итоге отправили на ремонт. Накануне отставки Старовойта, 6 июня, Минтранс сообщил об утечке аммиака на танкере «ЭКО ВИЗАРД» в Усть-Луге. В ведомстве ее назвали «незначительной», ликвидацией последствий занимаются аварийные службы терминала, планируется осмотр судна водолазами.	9	\N	2025-07-07 12:55:01	2025-07-07 12:55:01
1090	2374	rezhisser-aleksandr-mitta-popal-v-bolnicu	Режиссер Александр Митта попал в больницу	https://s0.rbk.ru/v6_top_pics/media/img/7/17/347514781320177.jpeg	30 июня телеграм-канал Shot писал, что 92-летнему режиссеру стало плохо дома в Москве. Его сын Евгений и помощник тогда опровергли информацию об ухудшении здоровья Митты Александр Митт (Фото: Евгения Новоженина / РИА Новости) Александр Митта госпитализирован, сообщил РБК помощник режиссера Геннадий Иванов. «Мы все, его команда и студенты, молимся за него», — сказал Иванов. 30 июня телеграм-канал Shot писал, что 92-летнему режиссеру стало плохо дома в Москве, он потерял сознание, ему вызвали скорую. От госпитализации Митта отказался, сообщал Shot. Его сын Евгений и помощник тогда опровергли информацию об ухудшении здоровья режиссера. rbc.group Михаила Боярского выписали из больницы после неожиданной госпитализации Общество rbc.group В ноябре 2023 года Митта был экстренно госпитализирован из-за пневмонии. Его состояние ухудшилось на фоне перенесенного инсульта, заявили тогда в киношколе режиссера. Его сын говорил, что состояние кинематографиста стабильное. Александр Митта окончил режиссерский факультет ВГИКа. Его дебют в кино состоялся в 1961 году, когда он вместе с кинорежиссером Алексеем Салтыковым поставил фильм «Друг мой, Колька!». В 1982 году он снял фильм «Сказка странствий», музыку к которому написал композитор Альфред Шнитке, а также «Гори, гори, моя звезда» (1969), «Точка, точка, запятая...» (1972), «Экипаж» (1979). За свои фильмы Митта неоднократно получал премии кинокритиков. Он был награжден кинопремией «Ника» за сценарий к сериалу «Граница. Таежный роман», а в 2008 году его наградили орденом «За заслуги перед Отечеством» IV степени за большой вклад в развитие отечественного кинематографа и многолетнюю творческую деятельность. Читайте РБК в Telegram.	9	\N	2025-07-03 07:45:04	2025-07-03 07:45:04
1091	2375	ni-dengi-ni-gazovozy-ne-vernulis-chto-obsuzhdali-bankiry-s-glavoy-cb	«Ни деньги, ни газовозы не вернулись». Что обсуждали банкиры с главой ЦБ	https://s0.rbk.ru/v6_top_pics/media/img/6/23/347514687078236.jpeg	Замедление экономики и крепкий рубль, снижение ставки и военные расходы, пропавшие газовозы и орган для Мариинского театра, а также ИИ как вишенка без торта. Что главы крупнейших банков и ЦБ обсудили на Финконгрессе в Петербурге Финансовый конгресс Банка России в Санкт-Петербурге, 2 июня 2025 года (Фото: Максим Константинов / Global Look Press) О торможении экономики Герман Греф, президент — председатель правления Сбербанка: «Признаков того, что экономика стала резко тормозить, достаточно много, и причиной тому, конечно, целый набор факторов. Ставка является одним из них, может быть, самым ключевым. Но тем не менее так сложилось, что мы имеем сегодня сочетание еще и очень крепкого рубля. Кризис на сырьевых рынках, падение цен на наши ключевые экспортные товары. И у нас явно перегрет рынок труда». rbc.group «Мы видим очевидные риски переохлаждения экономики. <...> Очень важно не передержать высокие реальные ставки. Проблема даже не в величине самой ставки, а в том, что у нас по отношению к текущей инфляции реальная ставка в районе 15–16%». rbc.group О росте цен из-за военных расходов Андрей Костин, президент — председатель правления ВТБ: «Мы какие-то очень всегда робкие, когда говорим о причинах возникновения тех проблем в экономике, которые у нас имеются. Хорошо, что нам помогает президент. Он за последнюю неделю дважды высказался о том, что причиной инфляции у нас являются большие военные расходы. Я вообще предлагаю всегда все-таки оценивать нынешнюю ситуацию, исходя из той особой ситуации, в которой оказалась страна. Это большие военные расходы, которые <…> стимулируют развитие определенных отраслей экономики. Они еще и не производят продукцию, которая потом попадает на рынок. Эта продукция улетает куда-то, и поэтому предложение не увеличивается на рынке, а расходы растут. И вторая причина, конечно, которую нельзя не учитывать, — это огромное количество санкций. Президент называл порядка 28 тысяч. <…> Сколько у нас предприятий, которые дважды платили за оборудование? Крупный инновационный проект в Красноярском крае по платине (Черногорское месторождение компании «Русская платина», которое кредитует ВТБ. — РБК) — они заплатили все деньги за немецкое оборудование. Потом пришлось им делать новый проект, покупать то же самое в Китае. И таких много. И газовозы были куплены в Южной Корее — и ни деньги, ни газовозы не вернулись. <…> Что говорить? Вот Герман Оскарович решил подарить Мариинскому театру орган. Заплатил деньги, орган изготовили, а не получили ни орган, ни денег». О смене цели по инфляции Андрей Костин: «Можно было бы и таргетирование другое сделать. Вот 4%, как заветная сумма, я думаю, что в условиях тех факторов, о которых я сказал… А что, 8% — плохая цифра для инфляции? Мне кажется, прекрасная, красиво пишется. И в этом плане не видел бы такой трагедии. Но 4 так 4, давайте ее достигать». О том, как будет действовать ЦБ Эльвира Набиуллина, председатель Банка России: «Мы видим, замедление инфляции происходит быстрее наших ожиданий, но пока эта инфляция выше цели и в годовом выражении, и в текущих темпах. Мы видим снижение остроты на рынке труда. Это тоже важный индикатор по опросам предприятий, но дефицит на рынке труда остается, и рекордно низкая безработица остается». «Индекс бизнес-климата показывает пока нисходящую динамику. Смотрим на генерацию электроэнергии, загрузку мощностей, объем платежей в нашей платежной системе, финансовые результаты компании, аналитику банков — суммарно все это сигнализирует о замедлении роста деловой активности, но с очень высоких темпов, которые были в 2023–2024 годах. И если вот эти опасения и индикаторы будут сигнализировать о более быстром замедлении экономики, естественно, тогда инфляция будет снижаться ниже цели, и это даст нам пространство для более быстрого снижения». «Нам всем надо очень плавно пройти этот период, потому что сегодняшняя ситуация — это как некоторое зеркальное отражение того, что было в первой половине прошлого года. В первой половине прошлого года многие ухватились за наш прогноз, что мы скоро будем снижать ключевую ставку. И проигнорировали, что это будет происходить при замедлении инфляции. Поэтому у нас брали кредиты, а инфляция не замедлялась, и нам пришлось вместо понижения ставки прийти к повышению. Сейчас волна наоборот: я вижу, что есть опасения, что, несмотря на снижение инфляции, мы будем держать высокую ставку и будет происходить переохлаждение экономики. Но это так не работает». О турецком опыте Фатих Карахан, глава Центрального банка Турецкой Республики: «В процессе дезинфляции важна жесткая денежная политика. Возможны краткосрочные или секторальные ослабления, но эти меры не должны наблюдаться в течение длительного времени. Долгосрочной целью является коррекция инфляционных эффектов перегрева экономики. И мы именно это называем мягкой посадкой для экономики». Об эффекте крепкого рубля Эльвира Набиуллина: «Экспортерам сейчас очень сложно. Они оказались в ножницах. Высокие ставки, низкий курс, и еще и падение цен и спроса на экспортных рынках. Но все-таки экономике нужен такой курс, который отражает баланс спроса и предложения валюты со стороны разных участников. И понятно, что экспортеры хотели более слабый курс, но я не уверена, что под этим подпишутся наши граждане или те предприятия, которым нужен импорт оборудования для технологической модернизации. Поэтому, на мой взгляд, важно, чтобы курс был в интересах всей экономики. Важно, чтобы курс уравновешивал интересы разных экономических игроков и чтобы это делалось рыночным образом, через постоянную борьбу лоббистов, латание регулирования и подгонку курса под те или иные нужды. Мне кажется, это одно из преимуществ рыночной экономики, которым нужно дорожить. Еще нам говорят, что слабый курс нужен для бюджета. Но влияние курса на бюджет тоже нелинейно. Потому что укрепление рубля действует в сторону замедления инфляции, а значит, в сторону гораздо более быстрого снижения ключевой ставки, нежели если бы было при более слабом курсе. И, кстати, чем более диверсифицированная будет экономика, чем меньше будет она зависеть от доходов от небольшого круга экспортных отраслей, тем будет меньше зависимость от курса». О структурных изменениях экономики и неэффективности труда Андрей Костин: «Мы сейчас приступаем к модернизации одной из крупнейших верфей — «Северная верфь», — где после модернизации в 16 раз вырастет производительность, а численность рабочих практически останется на одном месте. Поэтому, когда мы говорим о структурных изменениях, безусловно, мы должны смотреть прежде всего на этот фактор — рост производительности труда. <…> В том же судостроении есть верфи, построенные в 30-е годы, которые не могут быть эффективными сегодня в силу своего географического положения. Там стоимость производства на 20–30% всегда выше, чем, допустим, в Петербурге. И нам, конечно, надо их закрывать. Там говорят: моногород, а куда девать? Значит, надо иметь программы, которые позволят людям переезжать, надо развивать наемное жилье, надо делать другие меры. Но вот так просто кормить неэффективное производство из года в год — это неправильно». «Я вот даже не знал, пока не стал заниматься судостроением, насколько много денег государство выделяет на поддержку наших предприятий и разных программ. Мы должны от этого уйти. Нам нужно, конечно, перейти на рыночные методы и поддерживать только там, где это действительно является государственным приоритетом государственной программы. <…> У нас на подсосе сидит огромное количество разного рода предприятий, которые не могут обеспечить эффективность в силу разных причин, в том числе отчасти государственной политики, ценообразования и так далее. Поэтому я думаю, что структурные изменения неминуемы. Мы должны на этом сфокусировать свое внимание, обеспечив и перестройку структуры нашей экономики, и, главное, повышение производительности и эффективности». О неспособности ИИ стать скатертью-самобранкой Герман Греф: «Знаете, вот мы всегда любим искать что-то такое, опять скатерть-самобранку. Но кто-то саму скатерть должен произвести. А потом произвести все, начиная от наших традиционных напитков и заканчивая всей сельскохозяйственной номенклатурой. И вот мы говорим «искусственный интеллект» как панацея, которая нам сейчас, завтра вдруг что-то там где-то подорвет. Ну какой искусственный интеллект? Надо сказать, что подавляющее большинство наших отраслей от искусственного интеллекта на абсолютно недосягаемом расстоянии находятся. Миллионы световых лет. Мы с компанией «Газпром нефть» последние два года занимались анализом целого ряда важных предприятий. Но то, что мы видим внутри, — там нет базовых принципов менеджмента. Вот Андрей сейчас рассказывал про судостроительную компанию. Ну как в 16 раз можно поднять производительность труда? Как? Это означает, что она там лежит просто на полу. Это плохая новость. В этих предприятиях искусственный интеллект может дать очень мало. Хорошая новость заключается в том, что если просто-напросто менеджмент обучить элементарным принципам управления, то там можно делать сумасшедшие скачки в производительности, вот даже в 16 раз. И я бы не уповал на какую-то одну технологию, которая может нам быть таким золотым ключиком, который откроет все двери. Технология искусственного интеллекта — это вишенка на торте. Если торта нет, то вишенку положить некуда. Торт надо испечь сначала. Нужно решить базовые проблемы менеджмента. Нужно оцифровать свои процессы. И только после этого по-настоящему ты можешь использовать технологию искусственного интеллекта».	3	\N	2025-07-03 07:45:04	2025-07-03 07:45:04
1093	2376	novyy-krizis-v-otnosheniyah-moskvy-i-baku-hronologiya	Новый кризис в отношениях Москвы и Баку. Хронология	https://s0.rbk.ru/v6_top_pics/media/img/8/27/347514764460278.jpeg	27 июня силовики задержали в Екатеринбурге девятерых граждан Азербайджана, двое из них умерли по задержании. Это привело к новому обострению отношений между странами. Как развивались события — в материале РБК Обстановка возле Баку Плаза на месте задержания главы азербайджанской диаспоры Екатеринбурга Шахина Шихлинского, 1 июля 2025 года (Фото: Размик Закарян / URA.RU / Global Look Press) Нынешнее обострение отношений Москвы и Баку — не первое за последнее время. 25 декабря 2024 года самолет, летевший из Баку в Грозный, разбился в казахстанском Актау. Погибли 38 человек, в том числе 25 граждан Азербайджана. Москва заявила, что в момент, когда борт заходил на посадку в Чечне, регион подвергся атакам украинских беспилотников. 28 декабря Владимир Путин позвонил Ильхаму Алиеву и «принес свои извинения в связи с тем, что трагический инцидент произошел в воздушном пространстве России» (цитата по сайту Кремля). На следующий день президент Азербайджана заявил, что самолет «был поврежден снаружи», «фактически потерял управление» и «был поставлен в негодное состояние радиоэлектронной борьбой». Алиев также отметил, что «российская сторона должна извиниться перед Азербайджаном» и «признать свою вину». В феврале 2025-го Баку потребовал от Москвы закрыть «Русский дом» (филиал Россотрудничества), а вскоре после этого решил ликвидировать представительство «Sputnik Азербайджан» (входит в МИА «Россия сегодня»). В мае Алиев в последний момент отменил свое присутствие на параде Победы в Москве. rbc.group 27 июня в Екатеринбурге задержали девятерых уроженцев Азербайджана. Заявленная причина: возможная причастность к убийствам и покушениям, совершенным в 2001, 2010 и 2011 годах. Двое подозреваемых — Гусейн и Зияддин Сафаровы — скончались во время задержания. Это событие вызвало резкую реакцию Баку. За ним последовала череда задержаний и демаршей с обеих сторон. rbc.group РБК собрал хронологию нового кризиса в отношениях двух стран.	3	\N	2025-07-03 07:45:05	2025-07-03 07:45:05
1094	2410	bloomberg-uznal-reakciyu-nato-na-pauzu-v-postavkah-oruzhiya-ssha-ukraine	Bloomberg узнал реакцию НАТО на паузу в поставках оружия США Украине	https://s0.rbk.ru/v6_top_pics/media/img/3/96/347514973500963.jpeg	Одна из стран НАТО оказывает давление на Пентагон, чтобы он пересмотрел решение о паузе в поставках части оружия Киеву, пишет Bloomberg. Этот шаг застал Украину и ее союзников врасплох, также решение критикуют в конгрессе США Фото: Omar Marques / Getty Images Решение Вашингтона приостановить поставки части оружия Киеву застало Украину и ее союзников врасплох, сообщает Bloomberg. Также замешательство этот шаг вызвал и в администрации США: по словам двух знакомых с вопросом источников агентства, решение было принято без консультаций «даже» с Госдепартаментом. Европейский чиновник, знакомый с вопросом, заявил Bloomberg, что один из членов НАТО оказывает давление на Пентагон, чтобы ведомство пересмотрело решение. Также решение о приостановке поставок раскритиковали американские законодатели из обеих партий. Республиканец, член палаты представителей от Пенсильвании Брайан Фитцпатрик потребовал от администрации США провести экстренный брифинг о решении отказать в «срочной военной помощи, спасающей жизни людей». rbc.group «Я понимаю, что в Индо-Тихоокеанском регионе и на Ближнем Востоке существуют угрозы, и мы должны пополнять запасы, но решение заключается в том, чтобы производить больше, а не удерживать это у Украины», — заявил сенатор-демократ Ричард Блюменталь. rbc.group Госдеп заявил, что США приостановили только часть поставок оружия Украине Политика 1 июля Politico и NBC News сообщили, что США приостановили поставки части вооружений Украине, включая ракеты для систем ПВО Patriot. По их данным, решение было принято в Пентагоне в начале июня, но вступило в силу только сейчас. По информации Financial Times, решение о паузе в поставках вступило в силу, когда некоторые из них уже направлялись на Украину. В Белом доме подтвердили приостановку поставок и уточнили, что решение было принято, чтобы «поставить интересы Америки на первое место после того, как Министерство обороны провело обзор военной поддержки». Пентагон объяснил решение о паузе в поставках части вооружений Киеву «пересмотром возможностей» для того, чтобы убедиться, что «военная помощь США соответствует с нашими приоритетами в обороне». В Госдепе подчеркнули, что этот шаг не означает полной приостановки военной помощи Украине. Также в ведомстве опровергли данные о том, что Киев не знал о решении. Украинское Минобороны заявило, что официальных уведомлений по этому поводу не поступало. МИД Украины вызвал временного поверенного в делах США Джона Хинкеля. Президент Украины Владимир Зеленский заявил, что Киев проясняет ситуацию в диалоге с Вашингтоном. При этом в конце июня после встречи с Зеленским американский президент Дональд Трамп пообещал изучить возможность передачи Украине дополнительных комплексов Patriot. По его словам, их «очень трудно достать» и они также нужны США. Москва осуждает военную помощь Киеву. «Чем меньше оружия поставляется Украине, тем ближе окончание специальной военной операции», — сказал пресс-секретарь российского президента Дмитрий Песков, комментируя решение США о приостановке поставок вооружения Украине. Читайте РБК в Telegram.	6	\N	2025-07-03 08:15:01	2025-07-03 08:15:01
1095	2413	superjob-nazval-vuzy-s-samymi-vysokimi-zarplatami-vypusknikov-yuristov	SuperJob назвал вузы с самыми высокими зарплатами выпускников юристов	https://s0.rbk.ru/v6_top_pics/media/img/4/29/347514676972294.jpeg	Зарплаты молодых юристов за год выросли минимально — от 5 тыс. до 20 тыс. руб., Количество вакансий в юридической отрасли за год снизилось на 18%, подсчитали в SuperJob Здание Московского государственного института международных отношений МИД России (МГИМО) (Фото: Борис Кавашкин / ТАСС) МГИМО уже традиционно занял первое место рейтинга SuperJob по уровню зарплат выпускников в сфере юриспруденции. Речь идет о доходах выпускников 2019–2024 годов. РБК ознакомился с рейтингом, первая десятка которого за год практически не изменилась. За год зарплаты выпускников МГИМО, который занимает первую строчку рейтинга с 2021 года, увеличились на 20 тыс. руб. (+10%). Это меньше, чем в прошлом году, когда средний доход увеличился на 30 тыс. руб. В среднем размер зарплаты составил 220 тыс. руб. На втором месте Московский государственный университет им. Ломоносова: зарплаты выросли в среднем на 20 тыс. руб. (+12%), до 190 тыс. руб. rbc.group Третье место снова разделили Санкт-Петербургский государственный университет (СПбГУ) и Высшая школа экономики (ВШЭ). Зарплаты их выпускников в среднем составляют 160 тыс. руб., что на 10 тыс. руб. больше прошлого года. rbc.group Также на 10 тыс. руб. за год выросли средние зарплаты выпускников Финансового университета при правительстве и Московского государственного юридического университета им. О. Е. Кутафина (МГЮА). Они разделили четвертое место со средним заработком выпускников в 150 тыс. руб. Пятое место сохранила Всероссийская академия внешней торговли Минэкономразвития, которая впервые вошла в пятерку лидеров в прошлом году. Правда, в этом году рост средней зарплаты значительно уменьшился. Выпускники стали получать 140 тыс. руб., что больше на 5 тыс. руб., или 4%, чем годом ранее. В прошлом году зарплаты выросли на 23%, или 25 тыс. руб. В 2025 году Министерство труда впервые опубликовал рейтинги трудоустройства выпускников колледжей и вузов. Они разделены по направлениям и формируются по двум показателям: доле трудоустроившихся выпускников-очников на второй год после выпуска и данных о среднемесячной медианной зарплате за второй год после выпуска. К примеру, есть отдельный рейтинг «Науки об обществе», который в том числе охватывает направление юриспруденции. МГИМО в этом рейтинге по направлениям бакалавриата занимает 18-е место, а магистратуры — 15-е место. МГУ занимает 15-е и 14-е места соответственно. Из пятерки представленного рейтинга SuperJob наиболее высоко в рейтинге Минтруда расположились ВШЭ, Финансовый университет, а также Всероссийская академия внешней торговли (ВАВТ). Так ВШЭ заняла четвертое место по направлениям бакалавриата и шестое по направлениям магистратуры. Финансовый университет — пятые строчки в обоих рейтингах, а ВАВТ — на восьмом месте среди направлений бакалавриата и на девятом месте по магистратуре. СПбГУ занял 22-е и 36-е места, а МГЮА — 14-е и 22-е. Шестое и седьмое место снова заняли Российский экономический университет им. Г. В. Плеханова и Казанский (Приволжский) федеральный университет соответственно. Выпускники РЭУ им. Плеханова в среднем зарабатывают 135 тыс. руб., что больше на 5 тыс. руб. (4%) по сравнению с прошлым годом. Средний доход специалистов, окончивших КФУ, за год увеличился на 10 тыс. руб. (8%) и составляет 130 тыс. руб. Всероссийский государственный университет юстиции (РПА Минюста) опустился с седьмого на восьмое место. За год средний уровень дохода его выпускников не изменился и остался на уровне 120 тыс. руб. Аналогичную зарплату получают выпускники Московского университета МВД им. В. Я. Кикотя, за год она увеличилась на 5 тыс. руб. (4%). Вузы разделили восьмую строчку рейтинга. Также на строчку ниже переместился Национальный исследовательский Нижегородский государственный университет им. Н. И. Лобачевского, зарплата его выпускников за год не изменилась. Он разделил девятое место с Государственным университетом управления. Средняя зарплата выпускников этих вузов составил 115 тыс. руб. Для ГУУ эта цифра выросла на 5%, или 5 тыс. руб. На десятом месте со средним заработком выпускников в 110 тыс. руб. — Российская академия народного хозяйства и государственной службы при президенте и Пермский государственный национальный исследовательский университет. У выпускников РАНХиГС зарплата за год выросла также на 5 тыс. руб. (5%), а в Пермском ГНИУ она осталась на том же уровне, поэтом университет также спустился с девятой строчки на десятую. Для рейтинга SuperJob отбирал резюме на поиск работы в правовой сфере, размещенные не позже чем за год до публикации исследования. В рейтинге учитывают зарплатные ожидания как в Москве, так и в регионах, которые корректируются с учетом региональных IT-коэффициентов SuperJob до уровня московского рынка труда. Всего в рейтинг юридических вузов SuperJob вошли 60 государственных вузов из 39 городов. В исследовании принимают участие государственные вузы, как классические, так и профильные. На рынке много юристов Как рассказали РБК в SuperJob, количество вакансий в юридической отрасли за год снизилось на 18%. В компании отметили, что такая тенденция характерна для всего рынка труда России в первом полугодии 2025 года. В прошлом году спрос на юристов, наоборот, вырос на 20%. Число резюме за год выросло на 16%, а учитывая, что в прошлом году оно практически не росло, за два года динамика составила +18%, отметили в SuperJob. В то же время юридическая отрасль остается высококонкурентной сферой, так как количество резюме значительно превышает число вакансий, следует из данных сервиса. Структура спроса и предложения на рынке труда не совпадает: больше всего вакансий (40%) для юристов со стажем работы в правовой сфере 1—3 года и 3—6 лет (34%), а среди соискателей преобладают профи со стажем от шести лет (таких 88%), отметили в SuperJob. Также важно, что чуть более половины кандидатов составляют не безработные, а работающие: они вышли на рынок труда искать лучших условий в найме, в частности, по зарплате», указали в SuperJob. По словам управляющего партнера московского адвокатского бюро Loyal Partners Дениса Алехина, на рынке ощущается избыток молодых специалистов. «Конкурс высокий — резюме приходит очень много. Но, к сожалению, среди этого потока не так часто встречаются те, кто уже определился со своей профессиональной траекторией и готов серьезно вкладываться в работу, поэтому мы особенно ценим тех, кто уже сейчас понимает, чего хочет от профессии, готов много работать, учиться и расти вместе с командой», — пояснил он. Также, указал Алехин, в бюро строго не ориентируются на вуз, который окончил кандидат. Если специалист окончил престижное учебное заведение — это плюс, но важнее личные и профессиональные качества самого кандидата такие как: ответственность, нацеленность на результат, внимательность к деталям, желание учиться и развиваться, сказал эксперт. По его словам, большим преимуществом для кандидата будет участие в юридических конкурсах, научных конференциях. Еще один важный маркер — практика в юридических компаниях или судах, который показывает заинтересованность в профессии и определенную зрелость, понимание реальной юридической практики. Для юридической фирмы CLS, напротив, вуз который окончил кандидат, имеет большое значение. «Так как требования к опыту у нас минимальны, вуз становится одним из ключевых критериев. Мы предпочитаем кандидатов из ВШЭ, СПбГУ, МГУ, МГЮА, МГИМО. Большинство наших юристов сами закончили эти вузы и хотят видеть в своей команде юристов с хорошей теоретической подготовкой», — пояснила РБК директор по персоналу юрфирмы Яна Чеповецкая. Отбирая резюме, наряду с вузом, компания также обращает внимание на знание английского языка, опыт стажировок и участие в игровых процессах и конкурсах. «Так что при принятии решения о приеме на работу начинающего специалиста мы учитываем комплекс факторов: вуз, знания права, уровень владения английским языком, мотивацию и амбиции», — указала Чеповецкая. По ее мнению, на рынке нет переизбытка выпускников, которые действительно настроены на построение карьеры и готовы инвестировать в нее большое количество энергии и времени.	5	\N	2025-07-03 08:15:02	2025-07-03 08:15:02
1087	2370	u-beregov-bali-zatonul-parom-s-bolee-60-chelovek-na-bortu	У берегов Бали затонул паром с более 60 человек на борту		Паром с 65 людьми на борту затонул примерно через 25 минут после отплытия вечером 2 июля. Найдены два тела и 20 выживших, многие из них были без сознания. Более 40 человек числятся пропавшими без вести Video В Балийском проливе затонул паром KMP Tunu Pratama Jaya вечером 2 июля, сообщает CNN Indonesia. Судно, следовавшее по маршруту Кетапанг — Баньюванги — Гилиманук, затонуло примерно через 25 минут после отплытия. По предварительным данным, на борту находились 53 пассажира и 12 членов экипажа. Также паром перевозил 22 автомобиля, в том числе 14 грузовиков. Спасатели обнаружили четырех выживших пассажиров, которые эвакуировались с затонувшего судна на спасательной шлюпке. Начальник полиции Баньюванги Рама Самтама Путра позже сообщил, что были обнаружены два тела, еще 20 человек спасены, многие из них были без сознания «после многочасового дрейфа в неспокойных водах», передает Associated Press (AP). 43 человека остаются пропавшими без вести.  В ДР Конго 38 человек погибли и более 100 пропали после крушения парома Общество rbc.group AP отмечает, что в поисках участвуют девять судов. Поиски продолжались в ночной темноте при волнах, которые достигали 2 м.  Позже в поисково-спасательном агентстве Сурабаи уточнили, что найдены еще двое погибших и трое выживших. Ведутся поиски 38 пропавших. Читайте РБК в Telegram.	9	2025-07-03 09:03:41	2025-07-03 07:45:03	2025-07-03 09:03:41
1088	2371	baku-oproverg-zayavleniya-o-nasilii-v-otnoshenii-rossiyan-v-azerbaydzhane	Баку опроверг заявления о насилии в отношении россиян в Азербайджане		Баку заявил, что передал Москве данные о задержанных лицах. Посольство России сообщало, что не может получить к ним консульский доступ, а также рассказывало об обращениях россиян по поводу применения насилия в Азербайджане Заявления посольства России о применении правоохранительными органами Азербайджана физической силы к посещающим страну россиянам и отсутствии реакции Баку на запросы о доступе дипломатов к арестованным гражданам России «не имеют под собой никаких оснований», заявили в пресс-службе азербайджанского МИДа. В ведомстве также утверждают, что информация о личности задержанных и уполномоченном органе, проводящем расследование в отношении россиян, была представлена российской стороне в соответствии с положениями Консульской конвенции. Представитель МИД республики добавил, что «азербайджанская сторона никогда публично не политизировала многонедельные задержки ответов России на наши неоднократные обращения в связи с организацией консульских встреч с арестованными и осужденными гражданами Азербайджана, содержащимися в различных городах России». rbc.group В ведомстве также призвали Россию «воздержаться от шагов и заявлений, искусственно усугубляющих ситуацию». rbc.group В российском посольстве в Азербайджане ранее сообщили, что к ним поступило множество обращений от россиян, в том числе туристов, по поводу визитов к ним людей, представляющихся сотрудниками полиции, которые интересовались целью пребывания в стране и проверяли документы. По словам некоторых, они и члены их семей столкнулись с физическим насилием, заявили дипломаты. В российском посольстве также заявили, что направили в МИД Азербайджана ноту с требованием предоставить консульский доступ к арестованным российским гражданам, но ответа на это не последовало. МИД России рекомендовал россиянам при решении вопроса о поездке в Азербайджан «тщательно учитывать обстановку в этой стране», соблюдать там «повышенную осторожность и осмотрительность», а при возникновении проблем незамедлительно связываться с посольством. Отношения между Москвой и Баку осложнились после задержания представителей азербайджанской диаспоры по делу об убийствах и покушениях в Екатеринбурге в начале 2000-х и 2010-х годов. Всего по делу на данный момент арестованы восемь человек. Двое скончались во время следственных мероприятий, это братья Зияддин и Гусейн Сафаровы. МИД Азербайджана заявил, что умершие получили травмы во время задержания, и потребовал привлечь к ответственности причастных к насилию. Генпрокуратура республики сообщала о возбуждении уголовного дела по факту смерти Сафаровых. СК России сообщал, что причиной смерти одного из мужчин стала сердечная недостаточность, причины смерти второго устанавливаются. Следственные действия, предпринятые российскими правоохранителями, «осуществлялись в полном соответствии с законодательством России» в рамках расследования уголовных дел по факту совершенных в предыдущие годы «тяжких преступлений на территории Российской Федерации, в том числе против граждан Азербайджана», указали в МИДе. На фоне событий в Екатеринбурге правоохранительные органы Азербайджана провели следственные действия в редакции Sputnik, а также задержали, а 1 июля арестовали директора бакинского представительства агентства Игоря Картавых и шеф-редактора Евгения Белоусова. Против них возбудили дело по статьям о мошенничестве, незаконном предпринимательстве и легализации имущества, приобретенного преступным путем. Еще в феврале местные власти упразднили местное представительство Sputnik и разрешили получить аккредитацию для работы только одного журналиста агентства. Россия потребовала от Азербайджана немедленно освободить задержанных. 1 июля также были арестованы восемь россиян, которые, как заявляют следственные органы Азербайджана, причастны к транзиту наркотиков из Ирана. На заседании, где избирали меру пресечения задержанных, они выглядели сильно избитыми, обращало внимание «Осторожно новости». Москва заявляла, что азербайджанская сторона не предоставила консульский доступ к задержанным российским журналистам и россиянам, которых обвиняют по статье о наркотиках.	2	2025-07-03 09:03:47	2025-07-03 07:45:03	2025-07-03 09:03:47
1089	2373	putin-podpisal-zakrytyy-ukaz-o-kadrovyh-perestanovkah	Путин подписал закрытый указ о кадровых перестановках	https://s0.rbk.ru/v6_top_pics/media/img/4/22/347514717871224.jpeg	12 высокопоставленных сотрудников МВД, МЧС, СК и прокуратуры получили новые должности, девять — лишились постов, пишет «Честный детектив» со ссылкой на указ президента России. Официально документ не был опубликован Владимир Путин (Фото: Александр Казаков / Администрация Президента России) Президент России Владимир Путин подписал указ о кадровых назначениях в силовых структурах и отставках высокопоставленных сотрудников Минюста, СК, МВД и МЧС, пишет телеграм-канал «Честный детектив» (проект ВГТРК, объединенный с «Вести.Дежурная часть») со ссылкой на копию документа, не опубликованного официально. Согласно данным «Честного детектива», новые должности получили: Максим Ваничкин (начальник УВД по Юго-Западному административному округу Москвы) стал замначальника ГУ МВД России по Москве по вопросам гражданства и регистрации иностранных граждан; Сергей Воложинов (заместитель начальника ГУ МВД по Краснодарскому краю) — начальник УМВД по Курганской области; это назначение, в частности, в мае допускал источник местного портала «Область 45»; Михаил Должиков (заместитель прокурора Ставропольского края) — первый заместитель прокурора Нижегородской области; Юрий Завьялов (замначальника ГУ МВД по Красноярскому краю) — министр внутренних дел по Республике Тыва; Александр Иванов — замначальника Главного управления экономической безопасности и противодействия коррупции МВД; Александр Коробейников (замглавы УМВД по Белгородской области) — замначальника ГУ МВД по Херсонской области; Андрей Макеев — замдиректора департамента надзорной деятельности и профилактической работы МЧС, на сайте ведомства у него указана эта должность; Дмитрий Свинов (врио главы ГУ МВД по Волгоградской области) — начальник ГУ МВД по Волгоградской области; Николай Смоляков (замглавы полиции — начальник управления Госавтоинспекции ГУ МВД по Краснодарскому краю) — замначальника ГУ МВД по обеспечению охраны общественного порядка и координации взаимодействия с органами исполнительной власти субъектов России; Бэликто Базаров — глава следственного управления СК по Сахалинской области, эту должность он занимает с августа 2020 года; Константин Мальцев (врио главы следственного управления СК по Республике Алтай) — глава следственного управления СК по Республике Алтай; Алексей Попов — глава следственного управления СК по Архангельской области и Ненецкому автономному округу. Он находится на этом посту с августа 2020 года. rbc.group Помимо прочего, закрытым указом от должностей был отстранен ряд высокопоставленных сотрудников Минюста, СК, МВД и МЧС, отмечает телеграм-канал. Среди них: rbc.group замдиректора департамента международного права и сотрудничества Минюста Дмитрий Бабекин; директор департамента государственной политики в сфере судебно-экспертной деятельности Минюста Владимир Лукьянов; руководитель СУ СК по Кемеровской области Александр Безукладников; руководитель СУ СК по Кировской области Андрей Виноградов; замглавы МВД по Республике Татарстан Фяргат Мухаметзянов; замначальника полиции по оперативной работе ГУ МВД по Московской области Артур Озеров; главный инспектор МВД Дмитрий Петрунин; глава ГСУ СК по Москве Андрей Стрижов; директор департамента информационных технологий и связи МЧС Евгений Горленко. РБК направил запрос пресс-секретарю президента России Дмитрию Пескову. В мае Путин присвоил звания 19 генералам. В частности, звание генерал-лейтенанта получил заместитель командующего войсками ЦВО по военно-политической работе Кирилл Кулаков, который занимает эту должность с июня 2024 года. Читайте РБК в Telegram.	8	\N	2025-07-03 07:45:04	2025-07-03 08:45:55
1096	2495	bayden-rasskazal-o-zvonkah-ot-evropeyskih-liderov-s-prosboy-o-sovetah	Байден рассказал о звонках от европейских лидеров с просьбой о советах	https://s0.rbk.ru/v6_top_pics/media/img/7/42/347515222160427.jpeg	Байден рассказал, что с ним советуются европейские и американские политики, а при новых властях возник риск изоляции США. Белый дом заявил, что политика экс-президента «ослабила Америку», а Трамп восстановил ее положение Джо Байден (Фото: White House / Global Look Press) Бывший президент США Джо Байден, выступая на конференции ассоциации специалистов по управлению персоналом SHRM в Сан-Диего, заявил, что ключевые достижения его администрации сводятся на нет действующими властями, передает The Wall Street Journal. «Многое из того, над чем я так усердно работал, и того, что, как думал, смог поменять, меняется так быстро», — сказал он. Байден заявил, что при его президентстве НАТО значительно укрепилось, а теперь, по его словам, есть риск, что США уйдут с мировой арены. Он не упомянул своего преемника Дональда Трампа по имени. «Я получаю звонки — не буду вдаваться в детали, я не могу этого делать — от ряда европейских лидеров, которые просят меня подключиться. Я этого не делаю, но даю советы», — рассказал Байден. rbc.group NYP узнала о тайных визитах Байдена в Вашингтон из-за секретного проекта Политика rbc.group По словам 82-летнего экс-президента, он продолжает участвовать в политической жизни США, с ним советуются законодатели как от Демократической, так и от Республиканской партии: «Мне действительно было небезразлично то, что я делаю». В Белом доме после замечаний Байдена раскритиковали внешнюю политику 46-го президента, заявив, что она «сделала Америку слабее, чем когда-либо прежде». Заместитель пресс-секретаря Белого дома Анна Келли отметила, что при действующем главе государства Дональде Трампе союзники по НАТО обязались повысить расходы на оборону с 2 до 5% ВВП. Благодаря республиканцу «ядерный потенциал Ирана уничтожен, а положение США на мировой арене восстановлено», заявила она. Байден заключил соглашение с агентством для продвижения творческих людей Политика В мае Байдену диагностировали рак простаты, медики обнаружили также метастазы в кости. Бывший президент заявил, что его лечение сводится к приему «одной конкретной таблетки» в течение нескольких недель, а после — другой. Он заверил, что органы рак не затронул. New York Post писала, что политик продолжает ездить в Вашингтон на поезде из своей резиденции в штате Делавэр для работы над неким проектом. Источник издания предположил, что он пишет книгу, занимается открытием библиотеки и своего фонда. Читайте РБК в Telegram.	1	\N	2025-07-03 09:05:00	2025-07-03 09:05:00
1092	2372	glava-obshchiny-soobshchil-ob-unichtozhenii-dvuh-predpriyatiy-bliz-zhitomira	Глава общины сообщил об уничтожении двух предприятий близ Житомира		Глава Глубочицкой общины Сокальский заявил, что взрывы близ Житомира произошли на территории двух промышленных объектов, они полностью уничтожены. На месте работает следственная группа, причины взрыва пока не называются Взрывы вблизи Житомира произошли на территории двух производственных предприятий, они полностью уничтожены, заявил в эфире телеканала «Киев» глава Глубочицкой общины Сергей Сокальский. На месте работает следственная группа. По словам Сокальского, людей эвакуируют с места происшествия. Он добавил, что взрывная волна «далеко пошла». Причины случившегося устанавливаются.  Глава Житомирской областной военной администрации Виталий Бунечко ранее сообщил, что два взрыва произошли на трассе М-06 Киев — Чоп у села Березино. По его словам, погибли двое, еще 15 пострадали. rbc.group На трассе близ Житомира прогремели взрывы Политика rbc.group Житомирская городская дума сначала объявила, что взрыв произошел на заправке, но затем опровергла эти данные, сообщив, что авария случилась «на другом рядом расположенном объекте вблизи трассы в направлении Киева». Сокальский говорил, что взрыв мог произойти на складе промышленного предприятия. Трассу, где произошло ЧП, перекрыли, затем для движения открыли по одной полосе в каждую сторону. Жителей близлежащих населенных пунктов призвали закрыть окна и воздержаться от пребывания на улице. Читайте РБК в Telegram.	1	2025-07-03 07:52:36	2025-07-03 07:45:05	2025-07-03 07:52:36
1181	2926	v-azerbaydzhane-soglasovali-dostup-k-zaderzhannym-rossiyanam	В Азербайджане согласовали доступ к задержанным россиянам	https://s0.rbk.ru/v6_top_pics/media/img/6/48/347515400276486.jpeg	Фото: Андрей Любимов / РБК В Азербайджане согласовали визит российских дипломатов к задержанным в Азербайджане гражданам России, сообщила официальный представитель внешнеполитического ведомства Мария Захарова. «Согласован доступ консульских сотрудников к 13 задержанным в Азербайджане гражданам России», — приводит слова дипломата ТАСС. Баку опроверг заявления о насилии в отношении россиян в Азербайджане Политика Материал дополняется	1	\N	2025-07-03 14:05:04	2025-07-03 14:05:04
1086	2369	v-irkutske-muzhchina-s-nozhom-napal-na-vrachey-dvoe-v-tyazhelom-sostoyanii	В Иркутске мужчина с ножом напал на врачей, двое в тяжелом состоянии		Пациент с ножом напал на замглавврача и секретаря больницы в Иркутске, женщины — в тяжелом состоянии, сообщил губернатор Кобзев. Напавший объяснил, что его «лишили права на жизнь по конвенции ООН о правах инвалидов». Video Утром 3 июля в городской клинической больнице № 8 в Иркутске пациент с ножом и газовым баллончиком напал на медицинских работников, его задержали, сообщил глава региона Игорь Кобзев. «Заместитель главного врача и секретарь учреждения госпитализированы в тяжелом состоянии. Медики сейчас борются за их жизни. <...> Что послужило причиной, еще предстоит выяснить. Со своей стороны отмечу, что мы окажем всю необходимую помощь пострадавшим и их семьям. На месте находится министр здравоохранения Андрей Арсеньевич Модестов, правоохранительные и следственные органы», — написал он в телеграм-канале. Следователи завели уголовное дело о покушении на убийство двух и более лиц — ч. 3 ст. 30, ч. 2 ст. 105 Уголовного кодекса России, уточнили в отделе СК по Иркутской области. Максимальное наказание — пожизненное лишение свободы. Телеграм-канал Babr Mash выложил кадры, на которых видно лицо мужчины, которого скрутили и прижали к столу. «Хотел убить врача <...> Меня лишили права на жизнь по Конституции и по Конвенции ООН о правах инвалидов», — говорит мужчина. rbc.group Телеграм-канал отметил, что напавший ранее несколько раз приходил с жалобами в городскую клиническую № 8. Сообщая об инциденте, Кобзев также напомнил, что в 2024 году пациент, которого забрала бригада скорой помощи Казачинско-Ленской районной больницы, внезапно избил фельдшера Александра Печелатова, он умер.	6	2025-07-03 09:03:35	2025-07-03 07:45:03	2025-07-03 09:03:35
1165	2708	fsb-pokazala-kak-zaderzhannaya-v-peterburge-podkladyvala-bombu-pod-mashinu	ФСБ показала, как задержанная в Петербурге подкладывала бомбу под машину		Video Силовики в Петербурге задержали девушку, когда она пыталась заложить бомбу под машину одного из сотрудников оборонного предприятия. Об этом сообщил Центр общественных связей (ЦОС) ФСБ. На кадрах, которые опубликовала ФСБ, видно, как девушка с пакетами идет по двору, потом — подходит к машине, наклоняется под днище и что-то пытается там сделать. На кадры попал момент попытки закладки бомбы, сообщила ФСБ. Летом 2024 года девушка самостоятельно связалась с представителями украинских спецслужб, она захотела принять участие в диверсионно-террористической деятельности, чтобы ей взамен помогли получить гражданство одной из стран Евросоюза, заявили в спецслужбе. Самодельное взрывное устройство ей предоставили представители спецслужбы. На нее завели уголовное дело по ч. 3 ст. 30, ч. 2 ст. 205 и ч. 3 ст. 222.1 — покушение на террористический акт и незаконное приобретение, передача, сбыт, хранение, перевозка, пересылка или ношение взрывчатых веществ или взрывных устройств. Максимальное наказание по статьям — 15 и 20 лет соответственно. rbc.group В Петербурге ФСБ задержала девушку в момент закладки бомбы под машину Политика В конце июня сотрудники ФСБ также предотвратили теракт в Московской области. Тогда силовики «нейтрализовали» в Подмосковье двух россиян, готовивших теракт в отношении российского военнослужащего. Читайте РБК в Telegram.	4	\N	2025-07-03 10:55:05	2025-07-03 10:55:05
1166	2738	posle-vzryva-v-poltave-zagorelos-zdanie-tck	После взрыва в Полтаве загорелось здание ТЦК	https://s0.rbk.ru/v6_top_pics/media/img/7/59/347515302871597.jpeg	В здании полтавского военкомата возник пожар. По данным главы военной администрации, предварительно, погибли два человека Фото: Joe Raedle / Getty Images Здание полтавского объединенного городского территориального центра комплектования и социальной поддержки (аналог военкомата на Украине) пострадало после взрывов в городе, сообщает пресс-служба Сухопутных войск Вооруженных сил Украины в телеграм-канале. В здании возник пожар, также загорелся рядом стоящий частный жилой дом, уточнила пресс-служба. Кроме этого, есть погибшие и раненые. По данным врио руководителя Полтавской областной военной администрации Владимира Когута, предварительно, погибли два человека, еще 11 пострадали. rbc.group В Полтаве прогремел взрыв Политика rbc.group Взрыв прогремел в районе 8:00 на фоне продолжающейся воздушной тревоги, сообщило ранее «Полтавщина» со ссылкой на Когута и секретаря Полтавского городского совета Катерину Ямщикову. Как уточнили Сухопутные войска, взрыв произошел в 9:00 (совпадает с московским). Минобороны России подчеркивает, что удары наносятся по военным и энергетическим объектам Украины и связанной с ними инфраструктуре. Читайте РБК в Telegram.	8	\N	2025-07-03 11:15:02	2025-07-03 11:15:02
1175	2849	v-centre-luganska-progremel-vzryv	В центре Луганска прогремел взрыв	https://s0.rbk.ru/v6_top_pics/media/img/2/56/347515364775562.jpeg	Фото: соцсети В Луганске на улице Тараса Шевченко произошел взрыв, сообщает «Луганскинформцентр» со ссылкой на очевидцев. «В Луганске громко. Уточняем информацию» — говорится в сообщение агентства в 11:54 мск. В телеграм-канале также опубликовано видео, которое обозначено как снятое на месте «прилета». На кадрах у трехэтажного здания частично разрушены проем входной двери и крыльцо. Рядом на тротуаре лежит человек, над ним склонились прохожие. ТАСС со ссылкой на оперативные службы уточняет, что при взрыве погиб один человек. Об этом также информирует «Интерфакс» со ссылкой на экстренные службы. Материал дополняется	4	\N	2025-07-03 13:15:03	2025-07-03 13:15:03
1176	2866	pogibshiy-v-kurskoy-oblasti-zamkomanduyushchego-vmf-gudkov-video	Погибший в Курской области замкомандующего ВМФ Гудков. Видео		Video Погибший в Курской области заместитель главнокомандующего ВМФ Михаил Гудков много общался с губернатором Приморского края Олегом Кожемяко, рассказал последний. Губернатор опубликовал посмертное видео, посвященное генерал-майору. На кадрах показаны Гудков с губернатором в различных ситуациях — на командном пункте при награждении, в официальной обстановке. Также на видео показаны бои, которые ведут российские войска. В Курской области погиб заместитель главнокомандующего ВМФ Гудков Политика По словам Кожемяко, погибший генерал был «сильным духом воином, который не представлял себя нигде, кроме флота». Гудков командовал 155-й отдельной гвардейской бригадой морской пехоты Тихоокеанского флота, которая ведет бои в зоне военной операции. После назначения на должность замкомандующего ВМФ, Гудков «не перестал лично выезжать на позиции наших морпехов», сообщил Кожемяко. rbc.group Вместе с замкомандующего ВМФ Гудковым погиб еще один офицер Политика Читайте РБК в Telegram.	10	\N	2025-07-03 13:30:02	2025-07-03 13:30:02
1171	2798	minoborony-soobshchilo-o-zanyatii-dvuh-sel-v-dnr-i-harkovskoy-oblasti	Минобороны сообщило о занятии двух сел в ДНР и Харьковской области	https://s0.rbk.ru/v6_top_pics/media/img/3/18/347515349236183.jpeg	Фото: сервис «Яндекс.Карты» Минобороны сообщило о занятии населенных пунктов Разино и Меловое. Разино находится в ДНР. Это село находится к северу от Новоэкономического и к северо-востоку от Покровска (Красноармейска) и Мирнограда (Димитрова). Материал дополняется	2	\N	2025-07-03 12:45:03	2025-07-03 14:14:34
1177	2906	cb-prizval-ostavit-v-proshlom-investicionnoe-strahovanie-zhizni	ЦБ призвал оставить в прошлом инвестиционное страхование жизни	https://s0.rbk.ru/v6_top_pics/media/img/7/78/347515390401787.jpeg	ЦБ не видит смысла в возвращении инвестиционного страхования жизни. Пусть этот продукт лучше «уйдет в прошлое», считает зампред регулятора Фото: Михаил Гребенщиков / РБК Банк России не видит необходимости в возвращении на рынок инвестиционного страхования жизни (ИСЖ), заявил зампред Банка России Филипп Габуния на Финансовом конгрессе в Санкт-Петербурге, передает корреспондент РБК. «Нам кажется, что как раз-таки ДСЖ (долевое страхование жизни. — РБК) убрало все те изъяны, которые были в ИСЖ. И вот все негативные практики, которые мы имели, гораздо сложнее применить через ДСЖ. При этом ДСЖ дает все возможности, делая комбинированный продукт, сочетающий в себе страховую защиту и инвестиции. Поэтому, с нашей точки зрения, ИСЖ уйдет в прошлое, и возвращаться к нему не нужно. При этом это не отменяет других форм накопительного страхования жизни, оно продолжит работать как обычно», — сказал Габуния. ИСЖ позволяет получить инвестиционный доход, так как средства вкладываются в активы, а в случае смерти клиента гарантируется страховая выплата. Вложения клиентов страховщики делят на две части — гарантийную и инвестиционную (рисковую). Гарантийная часть вкладывается в консервативные инструменты (например, ОФЗ), а инвестиционная часть, как правило, направляется в более рискованные инструменты с более высокой потенциальной доходностью. Однако из-за инвестиционной специфики доход по ИСЖ непредсказуем. rbc.group ИСЖ, а также аналогичное ему НСЖ (накопительное страхование жизни) не раз критиковал ЦБ. Регулятор выявлял случаи недобросовестных продаж, когда ИСЖ и НСЖ сотрудники банков (агенты по продаже страховок) предлагали под видом вкладов с повышенной доходностью, не объясняя гражданам особенности и риски таких продуктов. В 2022 году возникли проблемы с выплатами по инвестиционной доле у страхователей, так как денежные средства были вложены в иностранные активы, которые впоследствии оказались заморожены. rbc.group Полисы ИСЖ ограничены в продажах с октября 2024 года — страховщикам запретили продавать подобные продукты без обязательного тестирования клиентов, если они не являются квалифицированными инвесторами, а с 1 января 2026 года вступит в силу запрет на полную продажу ИСЖ. На смену ИСЖ приходит ДСЖ. Владелец полиса ДСЖ сам решает, какую часть направить на покрытие страхового риска, а какую инвестировать в паи закрытых или открытых паевых инвестиционных фондов. При этом весной страховщики обратились в Банк России с предложением создать новый продукт страхования жизни с инвестиционной составляющей. Компании таким образом хотят заместить нишу продуктов с высоким риском. «Есть острожное обсуждение с рынком, чтобы, возможно, какую-то версию ИСЖ все-таки вернуть для квалифицированных инвесторов. Страховщики заинтересованы в этом для полноты линейки своих инструментов, чтобы конкурировать с управляющими компаниями, с брокерами, которые предоставляют похожие продукты. Пока мы вместе с Банком России на это внимательно смотрим», — говорил в интервью РБК замминистра финансов Иван Чебесков. Но то, что произошло с ИСЖ, стоило страховой отрасли триллионов рублей будущей капитализации для всех компаний, подчеркивал Чебесков: «Акционеры потеряли эти деньги из-за плохих практик их компаний с ИСЖ. И в большинстве случаев они даже не понимали, как это прекратить». Читайте РБК в Telegram.	6	\N	2025-07-03 13:55:03	2025-07-03 13:55:03
1207	3232	v-transnefti-rasskazali-o-zaslugah-pokonchivshego-s-soboy-vice-prezidenta	В «Транснефти» рассказали о заслугах покончившего с собой вице-президента	https://s0.rbk.ru/v6_top_pics/media/img/5/02/347516217235025.jpeg	Бадалов пришел в «Транснефть» в 2021 году и курировал цифровую трансформацию. В качестве предварительной причины смерти рассматривается самоубийство. В «Транснефти» назвали его «уникальным профессионалом» и «надежным коллегой» Андрей Бадалов (Фото: Максим Слуцкий / ТАСС) За время работы вице-президентом ПАО «Транснефть» Андрей Бадалов проявил высочайший профессионализм, компетентность, талант руководителя и опыт эксперта, говорится в некрологе, опубликованном на сайте компании. Бадалов пришел в «Транснефть» в 2021 году, до этого он возглавлял научно-исследовательский институт «Восход». В «Транснефти» Бадалов курировал вопросы цифровой трансформации и информационных технологий. «Под его непосредственным руководством и с его личным участием в кратчайшие сроки были реализованы масштабные наукоемкие проекты, позволившие вывести «Транснефть» на качественно новый технологический и организационный уровень, эффективно преодолеть вызовы санкционных ограничений, особенно остро затронувших отрасль информационных технологий», — говорится в сообщении. В Москве погиб вице-президент «Транснефти» Андрей Бадалов Политика В компании отметили, что даже в сложные и напряженные моменты Бадалов проявлял «высокие человеческие качества», всегда был отзывчив к проблемам коллег, делился знаниями и опытом, объединял и воодушевлял людей своей энергией и оптимизмом. rbc.group О смерти Андрея Бадалова стало известно ранее 4 июля. ТАСС писал, что предварительная причина смерти — самоубийство. Тело 62-летнего топ-менеджера обнаружили под окнами его дома на Рублевском шоссе. «РИА Новости» отмечало, что погибший отправил супруге прощальное сообщение. Источник РБК в правоохранительных органах сообщил, что оперативно-следственная группа выясняет обстоятельства произошедшего. Читайте РБК в Telegram.	9	\N	2025-07-04 12:55:02	2025-07-04 12:55:02
1183	2938	nabiullina-rasskazala-kogda-rassmotryat-snizhenie-klyuchevoy-stavki	Набиуллина рассказала, когда рассмотрят снижение ключевой ставки	https://s0.rbk.ru/v6_top_pics/media/img/6/32/347515406986326.jpeg	Эльвира Набиуллина (Фото: Максим Константинов / ТАСС) Банк России на заседании в июле будет рассматривать снижение ключевой ставки, если не появятся непредвиденные обстоятельства, шаг будет обсуждаться, заявила глава регулятора Эльвира Набиуллина, передает корреспондент РБК. «Скорее всего, если ничего не произойдет непредвиденного, если сохранятся те тенденции, которые сейчас сформировались, то с большей вероятностью, если можно так сказать, будем рассматривать снижение ставки, скорее, будет обсуждаться шаг этого снижения», — сказала она во время пресс-конференции на Финансовом конгрессе. Следующее заседание совета директоров Банка России, на котором будет рассматриваться уровень ключевой ставки, запланировано на 25 июля. Набиуллина отметила, что к этому моменту у регулятора будет больше информации для анализа ситуации. «Будем смотреть на текущие тенденции в экономике, в инфляции, в инфляционных ожиданиях. Ну, весь традиционный набор факторов, которые влияют на принятие решения», — указала она. rbc.group На данный момент регулятор фиксирует замедление инфляции, «причем в устойчивой компоненте», отметила Набиуллина. Замедление, по ее словам, происходит быстрее, чем прогнозировал Банк России. В последнем пресс-релизе по итогам июньского заседания по ставке регулятор подчеркнул, что проинфляционные риски уменьшились, но все еще преобладают над дезинфляционными на среднесрочном горизонте. rbc.group Материал дополняется	7	\N	2025-07-03 14:15:01	2025-07-03 14:39:10
1186	3034	vo-vkontakte-proizoshel-sboy	Во «ВКонтакте» произошел сбой	https://s0.rbk.ru/v6_top_pics/media/img/9/48/347515435750489.jpeg	Фото: Михаил Гребенщиков / РБК Социальная сеть «ВКонтакте» перестала открываться днем 3 июля. При попытке открыть ее высвечивалось предупреждение: «Страница временно недоступна. Пожалуйста, попробуйте еще раз позже». В VK сообщили РБК, что знают о проблеме. «Пользователи в некоторых регионах могут испытывать затруднения с загрузкой «ВКонтакте». Мы работаем над восстановлением доступа в полном объеме», — заявили в компании. rbc.group К 15:30 в пресс-службе сообщили, что соцсеть заработала в штатном режиме. rbc.group В работе оператора T2 произошел сбой Технологии и медиа Сервис Downdetector зарегистрировал первые обращения примерно в 14:30. Больше всего жалоб поступило из Москвы, Санкт-Петербурга и Магаданской области. Чаще всего жаловались на сбой в работе сайта (70%). Значительно меньше людей заметили трудности в доступе к мобильному приложению. Сервис «Сбой.рф» зарегистрировал от пользователей почти 14 тыс. жалоб. Читайте РБК в Telegram.	1	\N	2025-07-04 10:15:03	2025-07-04 10:15:03
1206	3225	politico-uznalo-o-zhelanii-specpredstavitelya-trampa-snyat-sankcii-s-rossii	Politico узнало о желании спецпредставителя Трампа снять санкции с России	https://s0.rbk.ru/v6_top_pics/media/img/5/20/347516187487205.jpeg	Уиткофф хочет снять энергетические санкции с России, в то время как министр внутренних дел США предпочел бы вытеснить Москву, чтобы освободить место для американского импорта. Российские власти считают санкции незаконными Стив Уиткофф (Фото: Daniel Torok / Reuters) Спецпредставитель американского президента Стив Уиткофф хочет снять энергетические санкции США с России, но министр внутренних дел Даг Бергам хотел бы использовать ограничения для наращивания американского экспорта, сообщает издание Politico со ссылкой на источники. В случае отказа США от санкций в отношении российского энергетического сектора под угрозой может оказаться рынок Европы, отмечает Politico. В Брюсселе опасаются, что президенты Владимир Путин и Дональд Трамп «хотят разделить европейский энергетический рынок и создать отдельные сферы влияния», говорит источник издания. Как напоминает Politico, по итогам одного из разговоров с российским президентом Трамп заявил, что потенциал торгово-экономического сотрудничества России и США по завершении конфликта на Украине неограничен. «Россия хочет развернуть масштабную торговлю с Соединенными Штатами после завершения этой катастрофической кровавой бани, и я согласен», — написал американский лидер в соцсети Truth Social 19 мая. rbc.group Трамп объяснил, почему не вводит санкции против России Политика rbc.group Американский президент, несмотря на угрозы санкциями России, уже несколько раз откладывал решение, полагая, что ему удастся добиться «плодотворных переговоров» с Путиным, сообщал Reuters. Трамп рассчитывает, что ему удастся выстроить с Россией экономическое сотрудничество, отмечало агентство. Сам Трамп говорил, что санкции обходятся США в «миллиарды долларов». При этом президент отмечал, что «у него в голове» есть крайний срок для ужесточения антироссийских ограничений. Урегулирование конфликта России и Украины было одним из предвыборных обещаний Трампа. Изначально он говорил, что сможет добиться завершения боевых действий за 24 часа. Однако позднее, уже став президентом, республиканец пояснил, что в этих словах была доля сарказма. В июне Трамп заявил, что в урегулировании конфликта России и Украины наблюдается небольшой прогресс. Что именно он имел в виду, американский президент не уточнил. Во время последнего разговора с Путиным, который состоялся накануне, Трамп призвал к скорейшему прекращению боевых действий. В ответ Путин заявил о приверженности политическому решению конфликта, но подчеркнул, что Россия не откажется от своих целей. Позднее Трамп заявил, что недоволен прошедшим разговором. По словам американского лидера, ему не удалось добиться «никакого прогресса» по Украине. Госсекретарь Марко Рубио не исключал, что сенат может рассмотреть законопроект об усилении санкций против России после завершения работы над законопроектом о налогах, писало ранее Politico. «Прекрасный билль», продвигаемый лично Трампом, палата представителей вслед за сенатом утвердила в финальной редакции накануне, 3 июля. Российские власти считают западные санкции незаконными. В Кремле заявляли, что попытки давления на Москву «бесполезны». Читайте РБК в Telegram.	3	\N	2025-07-04 12:55:02	2025-07-04 12:55:02
1208	3235	medinskiy-obyasnil-smenu-oblozhki-uchebnikov-po-istorii-dlya-11-klassov	Мединский объяснил смену обложки учебников по истории для 11 классов	https://s0.rbk.ru/v6_top_pics/media/img/8/22/347516207243228.jpeg	Фото: vr_medinskiy / Telegram Помощник президента Владимир Мединский объяснил, почему на обложку нового учебника по истории для 11-х классов поместят изображение стыковки космических кораблей «Союз» и «Аполлон». Советский летчик-космонавт Алексей Леонов рассказывал Мединскому, что «стыковка удивительным совпадением прошла прямо над Эльбой», поделился помощник президента в своем телеграм-канале. «Смысл [нового изображения на обложке]: Россия всегда за сотрудничество», — объяснил Мединский. Кроме того, фоном на переплете учебника изобразят суперкубок по хоккею СССР-Канада. «Любые битвы — только в спорте», — отметил политик. rbc.group На обложках учебников истории покажут стыковку «Союз» — «Аполлон» Общество rbc.group Ранее на лицевой стороне учебников по всеобщей истории для 11-х классов была напечатана фреска Ганса Энри в Женеве близ здания ООН. О том, что обложки планируют обновить осенью 2025 года, Мединский сообщил в июне. Первая стыковка советского космического корабля «Союз» и американского «Аполлон» состоялась 17 июля 1975 года. Это событие заложило основу для будущих международных полетов и стало знаковым в истории мировой космонавтики. В 1972 году состоялась серия из восьми товарищеских матчей между сборными по хоккею СССР и Канады. Это были первые подобные встречи профессиональных хоккеистов. Первый матч выиграла советская сборная со счетом 7:3. Сборная Канады победила в четырех встречах серии, сборная СССР — в трех, один матч окончился ничьей. Читайте РБК в Telegram.	9	\N	2025-07-04 12:55:03	2025-07-04 12:55:03
1178	2914	turisticheskiy-zaezd-v-yaponiyu-snizilsya-iz-za-komiksa-pro-budushchee	Туристический заезд в Японию снизился из-за комикса про будущее	https://s0.rbk.ru/v6_top_pics/media/img/7/82/347515337304827.jpeg	Манга Рё Тацуки «Будущее, которое я вижу» — это собрание футуристических снов художницы. Со временем некоторые читатели стали считать, что описанные ею события так или иначе сбываются, и они начали делиться этим в интернете Манга под названием «Будущее, которое я вижу» Рё Тацуки в книжном магазине в Токио, Япония, 30 июня 2025 года (Фото: Issei Kato / Reuters) Туристический сезон в Японии переживает спад — виновата манга «Будущее, которое я вижу», фанаты которой убеждены, что автор комикса Рё Тацуки предсказала крупные катастрофы, пишет Reuters. Манга, впервые опубликованная в 1999 году, привлекла широкое внимание после разрушительного землетрясения 2011 года. Поклонники заметили сходство между реальной катастрофой и событиями, описанными в книге. Впоследствии в интернете появились теории, что многие предсказанные в манге катастрофические события так или иначе сбылись. После переиздания в 2021 году автор убрала эпизод о землетрясении 2011 года, однако фанаты интерпретировали изменения как новый прогноз, согласно которому следующая катастрофа произойдет 5 июля 2025 года. В результате в мае количество туристов из Гонконга в Японию сократилось на 11% по сравнению с аналогичным периодом прошлого года. В среду лоукостер Greater Bay Airlines отменил рейсы в страну из-за низкого спроса. Стив Хуэн из гонконгского турагентства EGL Tours заявил агентству, что его фирма потеряла половину своих доходов, связанных с Японией, из-за постов о катастрофах в соцсетях. rbc.group Автор манги Рё Тацуки опровергает слухи о предсказаниях, подчеркивая, что она не пророк. rbc.group Читайте РБК в Telegram.	7	\N	2025-07-03 13:55:03	2025-07-03 13:55:03
1184	2954	nabiullina-nazvala-neobosnovannymi-opaseniya-bankovskogo-krizisa	Набиуллина назвала необоснованными опасения банковского кризиса	https://s0.rbk.ru/v6_top_pics/media/img/8/71/347515411018718.jpeg	Опасения банковского кризиса в России необоснованы, заявила председатель ЦБ Эльвира Набиуллина Эльвира Набиуллина (Фото: Максим Константинов / ТАСС) Опасения о банковском кризисе в России не имеют оснований, заявила на брифинге председатель Банка России Эльвира Набиуллина, передает корреспондент РБК. «Обладая всей полнотой информации по банкам, естественно, как орган, который осуществляет надзор за банками, совершенно ответственно говорю, что эти опасения абсолютно необоснованны. Да, у нас банковская система хорошо капитализирована. Несмотря на то, что этот капитал неравномерно распределен по банковской системе, запас капитала большой, это 8 трлн руб.», — подчеркнула Набиуллина на Финансовом конгрессе в Санкт-Петербурге. Об опасениях банковского кризиса в конце июня сообщило агентство Bloomberg. Источники агентства в банковском секторе рассказали о рисках распространения долгового кризиса по финансовому сектору в следующем году в условиях высоких ставок. rbc.group «Мы видим определённое увеличение, но очень незначительное, доли проблемных активов как в рознице, так и в корпоративном секторе, но оно небольшое. И, кстати, в розничном кредитовании мы макропруденциальные меры принимали заранее, видя, что в 2023-2024 году вначале был большой прирост розничного кредитования, в том числе за счет увеличения доли рискованных кредитов», — отметила глава ЦБ. Все эти кредиты очень хорошо покрыты резервами, подчеркнула Набиуллина. rbc.group ЦБ также дал банкам возможность «без необходимости создания резервов реструктурировать кредиты, но только по тем кредитам, где мы видим абсолютно объективное восстановление нормального обслуживания кредитов после того, как ставки начнут снижаться», напомнила глава ЦБ. При этом заявки на реструктуризацию кредита в последние месяцы снижаются в целом по банковской системе, хотя у каких-то банков, возможно, и выросли. Читайте РБК в Telegram.	6	\N	2025-07-03 14:25:02	2025-07-03 14:25:02
1187	3038	v-armenii-odobrili-zakon-o-nacionalizacii-elektrosetey-karapetyana	В Армении одобрили закон о национализации «Электросетей» Карапетяна	https://s0.rbk.ru/v6_top_pics/media/img/8/22/347515418222228.jpeg	Национализацию энергокомпании поддержали 65 депутатов, против высказались 27. На заседании произошла потасовка, после того как один из депутатов посчитал закон «попыткой властей углубить антироссийские настроения» в Армении Офис компании «Электрические сети Армении» (Фото: Эрик Романенко / ТАСС) Парламент Армении во втором, окончательном чтении одобрил законопроект о возможности национализировать компанию «Электрические сети Армении», которая принадлежит Самвелу Карапетяну, передает «Sputnik Армения». Инициативу поддержали 65 депутатов, против проголосовали 27, еще один воздержался. В процессе голосования произошла потасовка, пишет News.am. Оппозиционный депутат, бывший член правящей партии «Гражданский договор» Овик Агазарян заявил, что подобные законопроекты являются «попыткой действующей власти углубить антироссийские настроения», чтобы «не сегодня так завтра мы смогли развернуться в сторону Запада». Он призвал Москву «не поддаваться на провокации». rbc.group Пашинян пригрозил уволить протестующих сотрудников компании Карапетяна Политика Его выступление вызвало бурную реакцию членов «Гражданского договора». В частности, депутат Арман Егоян стал кричать «Позор!». Агазарян в ответ кинул бутылку в представителей правящей партии, после чего к нему бросился Егоян. Участники заседания с трудом разняли депутатов, отмечает издание. Вице-спикер парламента Акоп Аршакян удалил Агазаряна из зала и сделал предупреждение Егояну. rbc.group Согласно одобренной инициативе, комиссия по регулированию общественных услуг Армении наделяется полномочиями отстранить руководство «Электросетей» и ввести временное управление при выявлении серьезных нарушений в деятельности и проведении расследования. В первом чтении она была одобрена накануне, 2 июля. Самвел Карапетян был арестован 18 июня по обвинению в публичных призывах к захвату власти, после чего официальный Ереван объявил о решении национализировать и выставить на торги «Электросети». Обыски также прошли в ереванском офисе «Ташир групп», которая принадлежит бизнесмену. Читайте РБК в Telegram.	7	\N	2025-07-04 10:15:03	2025-07-04 10:15:03
1190	3056	lavrov-v-den-nezavisimosti-ssha-napomnil-rubio-o-realiyah-na-zemle	Лавров в День независимости США напомнил Рубио о «реалиях на земле»	https://s0.rbk.ru/v6_top_pics/media/img/7/40/347516100004407.jpeg	Лавров поздравил госсекретаря Рубио с Днем независимости США, выразив надежду на то, что отношения между Москвой и Вашингтоном обретут стабильность. Путин поздравил Трампа еще накануне во время телефонного разговора Сергей Лавров (Фото: Наталья Шатохина / NEWS.ru / РБК) Министр иностранных дел России Сергей Лавров направил поздравительную телеграмму госсекретарю США Марко Рубио по случаю Дня независимости. Он выразил надежду, что отношения между странами «обретут стабильность и предсказуемость», но подчеркнул необходимость учитывать «реалии на земле». В телеграмме, текст которой распространила пресс-служба МИДа, Лавров попросил передать американскому народу искренние поздравления и выразить поддержку России «его чаяниям единства и реализации традиционной американской мечты». «Рассчитываю, что совместными усилиями и отношения между нашими странами закрепятся на созидательном векторе, обретут позитивную стабильность и предсказуемость на основе взаимного уважения и учета национальных интересов друг друга, предопределенных историей, географией и «реалиями на земле», — говорится в телеграмме. rbc.group МИД заявил о постоянном контакте Лаврова и Рубио Политика rbc.group Министр также отметил, что, пользуясь случаем, хочет пожелать гражданам США «следовать дорогой мира и общего процветания». Он также напомнил о важности заветов Декларации независимости США, в которой говорится о праве каждого человека на жизнь, свободу и стремление к счастью. День независимости, который в США отмечают ежегодно 4 июля, считается главным национальным праздником страны. В 1776 году в этот день была принята Декларация независимости Соединенных Штатов. Российский президент Владимир Путин поздравил американского лидера Дональда Трампа с этим праздником накануне, 3 июля, во время телефонного разговора. Он также отметил, что Россия «сыграла не последнюю роль в становлении американской государственности». Читайте РБК в Telegram.	5	\N	2025-07-04 10:25:04	2025-07-04 10:25:04
1191	3057	v-rostovskoy-oblasti-pensionerka-pogibla-pri-obrushenii-doma-iz-za-bpla	В Ростовской области пенсионерка погибла при обрушении дома из-за БПЛА	https://s0.rbk.ru/v6_top_pics/media/img/1/55/347515973960551.png	Из-за падения беспилотника в Миллеровском районе был поврежден восьмиквартирный жилой дом. Там обрушилась плита перекрытия, что привело к гибели пенсионерки. Других пострадавших нет Фото: Яндекс.Карты Ростовская область этой ночью подверглась атаке украинских беспилотников, есть погибшие, сообщил врио губернатора региона Юрий Слюсарь. «В поселке Долотинка Миллеровского района из-за падения БПЛА был поврежден двухэтажный 8-квартирный дом, обрушилась плита перекрытия, в результате погибла женщина-пенсионер, бывший учитель. Из разрушенного дома эвакуированы 20 жителей», — рассказал он. Под ударом ВСУ оказались также Азов и Тарасовский район. В Азове «повреждены стекла в многоквартирном доме по пер. Коллонтаевский, 94», обломки дрона упали на стадион им. Э.П. Лакомова (расположен неподалеку). О других пострадавших не сообщается. rbc.group Силы ПВО за ночь сбили 69 дронов над пятью регионами России Общество rbc.group Этой ночью в нескольких регионах России был введен режим опасности атаки БПЛА. Это Липецкая, Воронежская, Курская, Ивановская области. В Ростовской области последний раз об атаке дронов сообщалось в ночь на 2 июля. Тогда было уничтожено два БПЛА — в Новошахтинске и Аксайском районе. Читайте РБК в Telegram.	1	\N	2025-07-04 10:25:04	2025-07-04 10:25:04
1215	3310	lavrov-raskryl-kakuyu-ploshchadku-rossiya-rassmotrit-dlya-peregovorov-s-ssha	Лавров раскрыл, какую площадку Россия рассмотрит для переговоров с США	https://s0.rbk.ru/v6_top_pics/media/img/4/05/347516244315054.jpeg	Фото: Bernd von Jutrczenka / dpa / Global Look Press Россия готова рассматривать площадку Саудовской Аравии в случае нового раунда переговоров с представителями США, заявил министр иностранных дел Сергей Лавров на пресс-конференции по итогам переговоров с главой МИД Саудовской Аравии Фейсалом бен Фарханом Аль Саудом. «Мы готовы рассматривать эту гостеприимную, доброжелательную площадку, как мы это уже сделали в феврале. Я исхожу из того, что и мы, и американцы, чувствовали себя предельно комфортно, и если в последующем будут намечаться новые контакты, то по согласованию с Вашингтоном, конечно же, мы будем иметь в виду в том числе и Саудовскую Аравию», — сказал Лавров. Трансляцию пресс-конференции вел МИД России. Первые за три года переговоры России и США прошли в столице Саудовской Аравии Эр-Рияде 18 февраля. Лавров напомнил, что тогда российскую делегацию представлял он сам совместно с помощником президента Юрием Ушаковым, а американскую — госсекретарь Марко Рубио, советник по национальной безопасности Майк Уолтц и спецпосланник президента США Стив Уиткофф. rbc.group «Мы очень неплохо поработали, рассказали о том, как шла эта наша беседа — вполне конкретно, предметно, без отвлечения на какую-то политизацию и идеологизацию», — отметил глава российского МИДа. rbc.group Американская сторона также положительно оценила результаты переговоров. Рубио отметил, что Россия полностью готова к тому, чтобы начать «серьезный процесс» для завершения вооруженного конфликта на Украине, а Уиткофф — что США «и представить себе не могли лучшего результата после сессии». В июне российский посол в Вашингтоне Александр Дарчиев анонсировал новый раунд переговоров. По словам дипломата, он должен был состояться в Москве, так как стороны договорились о переносе встреч в столицы друг друга. Однако позже представитель российского МИДа Мария Захарова сообщила, что встреча России и США по дипломатическим «раздражителям» была отменена по инициативе американской стороны. Юрий Ушаков после этого заявил, что вопрос о встрече «подвис». Материал дополняется	2	\N	2025-07-04 14:05:02	2025-07-04 14:05:02
1246	3938	ochevidcy-rasskazali-o-haose-v-aeroportah-iz-za-situacii-v-pulkovo	Очевидцы рассказали о хаосе в аэропортах из-за ситуации в Пулково		В Пулково сообщили, что на утро понедельника 104 рейса задержаны, 20 отменены. Очевидцы, летящие в Петербург и из города, рассказали о ситуации в аэропортах из-за ограничений, которые несколько раз вводили с 5 июля Video К утру 7 июля сложности с авиарейсами из и в Санкт-Петербург по-прежнему сохраняются из-за введенных ранее ограничений в использовании воздушного пространства, жалуются пассажиры. Один из очевидцев в Пулково рассказал РБК, что в петербургском аэропорту «люди спят и сидят на полу». Его рейс на Пхукет SU628 изначально должен был вылететь в воскресенье, 6 июля, в 19:25. По словам пассажира, сейчас на табло указано, что вылет назначен на 9:30 7 июля, но регистрация так и не началась, при этом на борту должно быть 300 человек. «Я уезжал из аэропорта и обеспечивал себя сам, поэтому не могу сказать про поддержку от аэропорта и авиакомпании «Аэрофлот». Но объявляют, что обладатели посадочных [талонов] могут подойти за водой и питанием. А вот те, кто без посадочного, — не знаю», — сказал он. Другой пассажир сообщил РБК, что направлялся из Новосибирска в Санкт-Петербург и должен был прилететь около 17:00 в воскресенье, но около 20:00 самолет приземлился в Домодедово. В четыре утра понедельника, после восьмичасового пребывания в московском аэропорту, он вылетел в Петербург. «В Домодедово было нормально, тут были задержаны, посажены рейсы S7 и «Уральских авиалиний», всего около шести рейсов», — сказал собеседник. Транспортный коллапс между Москвой и Петербургом. Главное Общество rbc.group Еще одна очевидица рассказала, что третий день не может вылететь из Еревана в Санкт-Петербург, рейс был назначен на 21:10 5 июля. «Компания «Аэрофлот» на обе ночи предоставила хорошие гостиницы с питанием и трансфером. В аэропорту Еревана спокойно, представители авиакомпании выходят на связь с людьми», — сказала она РБК. По словам очевидицы Виктории, она должна была вылететь из Пулково в Шереметьево в восемь утра, но ночью рейс отменили, а ее пересадили на другой, назначенный в 9:30. Сейчас он задерживается. «Толпа, очередь в пол-Пулково на информационные стойки «Аэрофлота», чтобы обменять билеты, — рассказала она «Фонтанке». Толпы людей скопились и в Шереметьево. В Пулково предупредили об ограничениях на проход в зоны ожидания вылета Общество Еще один пассажир сообщил изданию, что вечером и ночью в Пулково «была патовая ситуация». По словам собеседника, авиакомпании переносили рейсы на один час, а пассажиров по телефону призывали ориентироваться на табло. «Люди вынуждены ехать в аэропорт. Приезжаешь в аэропорт — там говорят, зачем приехали, небо закрыто, табло неактуально, все неверно, интернета нет», — рассказал он. По словам очевидицы Аполлинарии, ночью в Пулково табло не работали и не было сотовой связи, но сотрудники аэропорта старались помочь пассажирам. Людям дают воду, раскладные стулья, а семьи с детьми пускают в бизнес-зал, аэропорт ввел комплекс мер для комфорта пассажиров, пишет «Фонтанка». В пресс-службе Пулково сообщили РБК, что за последние трое суток ограничения на прием и выпуск самолетов вводили пять раз, последние длились восемь часов. Меры принимали по независящим от аэропорта причинам, отметили там. По состоянию на 8:00 мск 104 рейса задержаны на два и более часов, сообщили в Пулково. За трое суток на запасные аэродромы отправили 82 рейса, из них 52 вернулись. 20 отменены с последующей перерегистрацией. «Стабилизировать расписание планируем до конца дня с частным переносом рейсов на 8 июля», — сообщили в аэропорту. Губернатор сообщил о попытке атаки дронов в Ленинградской области Политика Ограничения в Пулково и других российских аэропортах вводят на фоне угроз атак беспилотников. С 5 июля аэропорт Санкт-Петербурга приостанавливал работу несколько раз, вечером в воскресенье в терминал пускали только по билетам. В Пулково работает оперативный штаб, в который входят представители аэропорта, авиакомпаний и различных ведомств. В аэропорту Сочи сообщили РБК, что в течение 7 июля «авиакомпании будут стабилизировать расписание полетов» в связи с ограничениями в Поволжье, Москве и Петербурге. «Возможны вынужденные переносы, отмены или объединения некоторых рейсов, о чем авиакомпании своевременно информируют пассажиров», — отметили там, добавив, что в сочинском аэропорту скоплений пассажиров сейчас нет. Росавиация сообщила, что вместе с Минтрансом контролирует работу воздушного транспорта, «ситуация полностью управляема и нормализуется». По данным ведомства, с 5 июля задержали 1,9 тыс. рейсов на вылет и прилет, 485 отменили, 88 ушло на запасные аэродромы. Было оформлено 43 тыс. вынужденных возвратов билетов. Читайте РБК в Telegram.	4	\N	2025-07-07 11:25:03	2025-07-07 11:25:03
1179	2924	minoborony-rasskazalo-detali-gibeli-general-mayora-gudkova-v-prigraniche	Минобороны рассказало детали гибели генерал-майора Гудкова в приграничье	https://s0.rbk.ru/v6_top_pics/media/img/9/25/347515392898259.jpeg	Михаил Гудков (слева) (Фото: kozhemiakoofficial / Telegram) Замглавкома ВМФ России генерал-майор Михаил Гудков погиб во время боевой работы в одном из приграничных районов Курской области, сообщило Минобороны России. Это произошло накануне, 2 июля. Ранее о гибели Гудкова рассказал губернатор Приморья Олег Кожемяко. Гудков стал заместителем главнокомандующего Военно-морским флотом в марте. До этого он командовал 155-й бригадой морской пехоты Тихоокеанского флота. Решение о назначении Гудкова тогда принял президент Владимир Путин. В Курской области погиб заместитель главнокомандующего ВМФ Гудков Политика Президент сказал в марте, встречаясь с моряками атомного подводного крейсера «Архангельск», что опыт Гудкова «нужно тиражировать на другие подразделения». «По мнению министра обороны, начальника Генерального штаба, то, чего добился генерал-майор Гудков, должно тиражироваться и на другие подразделения вооруженных сил и прежде всего, конечно, подразделения морской пехоты, которая в целом воюет отлично», — говорил президент. rbc.group Video Медалью «Золотая звезда» Героя России Гудкова наградили осенью 2023 года «за мужество, героизм и умелое командование подчиненными соединениями», сообщало Минобороны. «Российская газета» писала, что 155-я бригада морской пехоты ТОФ в 2022 году принимала участие в боевых действиях в предместьях Киева, в ДНР и ЛНР, а также в занятии Мариуполя. В январе 2025 года, сообщало издание, соединение во главе с Гудковым сражалось в Курской области. Путин назвал бригаду одной из лучших.	7	\N	2025-07-03 14:05:03	2025-07-03 14:05:03
1180	2927	cb-ocenil-riski-izyatiya-akciy-yuzhuralzolota-u-chastnyh-investorov	ЦБ оценил риски изъятия акций «Южуралзолота» у частных инвесторов	https://s0.rbk.ru/v6_top_pics/media/img/1/00/347515315405001.jpeg	Права акционеров «Южуралзолота», чьи бумаги прокуратура хочет изъять в доход государства, не должны быть ущемлены, заявили в ЦБ. При этом в Банке России пока не слышали о таких угрозах Выплавка золотых банковских слитков на Щелковском заводе предприятия АО "Южуралзолото Группа Компаний" (Фото: Станислав Красильников / ТАСС) За ситуацией с изъятием «Южуралзолота» в собственность государства нужно следить, чтобы права акционеров не были ущемлены, сказал первый зампред ЦБ Владимир Чистюхин на Финансовом конгрессе в Санкт-Петербурге, отвечая на вопрос РБК. «Государство имеет право и должно защищать свои интересы в том случае, если в отношении каких-то компаний были допущены противоправные действия. Поэтому мы никоим образом не оспариваем, не комментируем действия Генеральной прокуратуры, которая в соответствии со своими полномочиями осуществляет действия по возврату собственности государству». Почему Генпрокуратура требует передать «Южуралзолото» государству Бизнес rbc.group «Очевидно, что у данной компании, помимо мажоритарного акционера, есть и миноритарные акционеры, среди которых и розничные инвесторы. Мы, я очень надеюсь, не слышали о том, что есть какие-то в настоящий момент прямые угрозы. Но, конечно, за этой ситуацией надо следить очень внимательно, чтобы права розничных акционеров не были ущемлены. Плюс к этому, эта компания выпускала и облигации, и надо, конечно, обеспечить, чтобы и все обязательства по данным облигациям также выполнялись», — добавил Чистюхин. rbc.group В четверг, 3 июля, Генпрокуратура обратилась в Советский районный суд Челябинска с требованием передать активы президента золотодобывающей компании «Южуралзолото» (ПАО «Южуралзолото Группа Компаний», ЮГК) Константина Струкова в доход государства. По данным источника РБК в Генпрокуратуре, в ведомстве считают, что Струков (зампред Заксобрания Челябинской области от «Единой России») незаконно получил ЮГК и еще десять компаний под контроль, используя свои должности и положение в органах госвласти. Сейчас они оформлены на его дочь Александру Струкову, имеющую гражданство Швейцарии, и доверенных лиц. За день до этого сотрудники региональных управлений ФСБ и СК в Челябинской области пришли с обысками в офисы ЮГК. В ноябре 2023 года «Южуралзолото» провело IPO. Компания привлекла 7 млрд руб., цена размещения составила 0,55 руб. за акцию. Речь шла о 70 тыс. новых инвесторов, доля крупных институциональных инвесторов составила в размещении около 50%. Акции золотодобытчика обрушились сначала на новостях об обысках, а затем — об изъятии активов. По состоянию на 11:30 мск они торгуются по 0,5 руб., что на 10% дешевле, чем на закрытии торгов предыдущего дня. В моменте падение достигало по меньшей мере 17%. Это не первый прецедент с изъятием в доход государства активов, торгующихся на бирже. Весной 2024 года Арбитражный суд Пермского края удовлетворил иск прокуратуры об изъятии у частных инвесторов акций Соликамского магниевого завода, которые были куплены на Мосбирже (до этого 89,4% СМЗ были изъяты у мажоритарных акционеров). Причиной изъятия прокуратура и суд назвали незаконную приватизацию предприятия в 1992 году. Это было первое решение суда, по которому изъяли акции, приобретенные инвесторами на организованных торгах. Дело стало прецедентным, с критикой решения выступили Мосбиржа и Центробанк. В мае 2025 года суд отменил это решение.	10	\N	2025-07-03 14:05:04	2025-07-03 14:05:04
1182	2929	mvd-ingushetii-oproverglo-informaciyu-ob-obyskah-v-vedomstve	МВД Ингушетии опровергло информацию об обысках в ведомстве	https://s0.rbk.ru/v6_top_pics/media/img/7/83/347515388172837.jpeg	МВД Ингушетии опровергло сведения об обысках в офисах и по месту жительства двух его сотрудников. ТАСС и «Интерфакс» написали, что обыски прошли по делу о хищении федеральных средств, о котором само ведомство сообщило еще в мае Фото: МВД по Республике Ингушетия Управление министерства внутренних дел по республике Ингушетия опровергло сообщения, что в ведомстве прошли обыски в связи с хищениями средств. В пресс-службе ведомства назвали эти сведения недостоверными. «Вчера в средствах массовой информации и сети Интернет получила распространение недостоверная информация о якобы прошедших в МВД по Республике Ингушетия и по месту жительства двух сотрудников полиции обысковых мероприятиях. Предлагаем журналистам и представителям блогосферы использовать только достоверные источники и тщательно проверять соответствие действительности распространяемой информации», — говорится в сообщении. Об обысках у руководящего состава полиции Ингушетии и у помощника главы ведомства 1 июля сообщил «Интерфакс». На следующий день ТАСС написало, что следственные действия затронули и самого министра. Источники агентства утверждали, что обыски у него провели сотрудники Главного управления собственной безопасности МВД России. rbc.group В Ингушетии задержали «борцов с наркотиками» за нападения на людей Общество rbc.group Обыски, по информации ТАСС и «Интерфакса», стали частью расследования уголовного дела о хищении. В МВД Ингушетии еще в мае сообщили, что оперативники отдела собственной безопасности выявили факты возможной причастности нескольких сотрудников республиканского управления к хищению денег, выделенных на финансирование деятельности органов внутренних дел. Пресс-служба ведомства со ссылкой на главу республиканского управления Михаила Коробкина уточнила, что речь идет о «планомерной и поступательной» работе, которая направлена на «профилактику и недопущение правонарушений в собственных рядах». Читайте РБК в Telegram.	1	\N	2025-07-03 14:05:04	2025-07-03 14:05:04
1185	2998	v-kaliningrade-otmenili-koncert-emina-agalarova	В Калининграде отменили концерт Эмина Агаларова	https://s0.rbk.ru/v6_top_pics/media/img/9/55/347515419514559.jpeg	Эмин Агаларов (Фото: Антон Беркасов / РБК) В городе Светлогорск в Калининградской области перенесли на год концерт российского и азербайджанского певца и бизнесмена Эмина (Эмина Агаларова). Об этом сообщила площадка, где должен был пройти концерт — «Янтарь холл». Там указали, что концерт перенесен по «независящим от театра эстрады «Янтарь-холл» причинам». Он должен был пройти 6 июля. Теперь его перенесли на 5 июля 2026 года. Как уточнила площадка, старые билеты действуют на новую дату концерта. rbc.group В чем причина обострения между Россией и Азербайджаном Политика rbc.group Отец Агаларова — уроженец Азербайджана Араз Агаларов, предприниматель и владелец холдинга Crocus Group. Основным направлением деятельности компании был выставочный бизнес, но в 2000 году выставочная программу продали. Сегодня Crocus Group — одна из крупнейших девелоперских компаний в России. Материал дополняется	1	\N	2025-07-03 14:45:02	2025-07-03 14:45:02
1188	3048	advokaty-i-klishas-posporili-o-sroke-dlya-obmanutyh-moshennikami-terroristov	Адвокаты и Клишас поспорили о сроке для обманутых мошенниками террористов	https://s0.rbk.ru/v6_top_pics/media/img/3/93/347515714959933.jpeg	Вице-президент ФПА Зубков призвал разграничить в УК наказание для убежденных террористов и для попавших под влияние мошенников людей. У судов и так есть основания, чтобы по-разному отнестись к обвиняемым, заявил Клишас Сергей Зубков (Фото: ФПА России) Подростков и пенсионеров стали судить за терроризм После начала боевых действий на Украине в России появилась новая категория преступников — те, кто совершил действия условно террористической направленности под воздействием мошенников, обманувших или запугавших человека. В такой обман бывают втянуты наиболее уязвимые люди — подростки и пожилые. Мошенники выдают себя за сотрудников спецслужб, банков, органов власти, заставляя людей поджигать релейные шкафы, военкоматы, здания администраций. Кого-то они убеждают «помочь Родине», кого-то загоняют в долговую яму с помощью кредитов, и единственный способ из нее выбраться — выполнить задание. На проблему, при которой тех преступников, которые осознанно совершили теракт, и тех, которые считали, что помогают Родине, судят по одной и той же статье, давая им сроки в одном диапазоне, обратили внимание юристы. В частности, об этом в начале июня говорил в своем выступлении в Совете Федерации вице-президент Федеральной палаты адвокатов, президент Адвокатской палаты Москвы Сергей Зубков. «Мы все чаще и чаще видим, как по этой статье [205-й] фигурантами становятся пожилые люди, а самое неприятное — несовершеннолетние, которые втягиваются обманным путем нашими активно действующими на территории Российской Федерации телефонными мошенниками, которые контролируются зачастую спецслужбами иностранных государств. Нам нужно совместно думать над тем, как с точки зрения правоприменения и законотворчества решать эту проблему», — заявил юрист. rbc.group В законодательстве необходимо разграничить разные виды и обстоятельства совершения преступлений, пояснил в разговоре с РБК Сергей Зубков: «Должно быть четкое разграничение умышленной террористической деятельности, когда человек четко сознает, чем он занимается, и стремится к тому, чтобы причинить вред людям, обществу, государству, и действий, когда обманутый человек участвует в чем-то, а его потом судят наравне с настоящим террористом. Это неправильно». rbc.group Как правило, дела возбуждают по ст. 205 УК (террористический акт), минимальное наказание по которой — десять лет лишения свободы, максимальное — 20 лет. В некоторых случаях действия «поджигателей» квалифицируются по более «легкой» ст. 167 УК (умышленное уничтожение или повреждение имущества). По ней могут назначить лишение свободы на срок до двух или до пяти лет. Согласно ст. 205 УК, теракт — это взрыв, поджог или другие действия, которые устрашают население и создают опасность гибели человека, причинения значительного ущерба имуществу либо наступления иных тяжких последствий. При этом у человека, совершающего теракт, должна быть цель дестабилизировать работу органов власти или международных организаций либо воздействовать на принятие ими решений, говорится в статье. Помимо этого, терактом считается угроза совершения таких действий для того, чтобы оказать давление на органы власти. Адвокат подчеркнул, что и в том и в другом случае преступление все же было совершено и должно быть наказано, но подходить к таким людям с одинаковой меркой нельзя. «Я понимаю, что есть общий принцип — наказать максимально сурово, чтобы другим не было повадно. Но дело в том, что здесь это плохо работает, потому что люди, которые были обманом втянуты в это, не понимают, что они совершают преступление», — добавил он. Решать проблему также призывает управляющий партнер московской коллегии адвокатов «Аронов и партнеры», профессор Высшей школы экономики Александр Аронов. Дети — одна из самых уязвимых категорий населения, так как они не имеют опыта общения с правоохранителями, не знают, что правомерно, а что нет, их очень легко обманом втянуть в совершение преступления, подчеркивает он. «Для того чтобы 14-летний или 15-летний ребенок понял, что он совершает террористический акт, он должен хотя бы знать, что это такое и какие должны возникнуть последствия. А когда он верит в то, что с ним разговаривает сотрудник правоохранительных органов, он не совершает террористический акт. Он считает, что помогает Родине в настоящий момент, сотрудничая со следствием», — говорит адвокат. И вот здесь возникает казус, продолжает он: с точки зрения следствия объективная сторона преступления — следование чьим-либо указаниям по нанесению вреда — выполнена. А субъективная сторона — отношение субъекта к собственным действиям — основывается только на показаниях подозреваемого. «А откуда основания доверять его показаниям о том, что он не понимал, что делает?» — поясняет логику следствия Аронов. Именно поэтому отношение субъекта к своему деянию квалифицируется как осознанное со всеми вытекающими последствиями, заключает юрист. «Поймать преступников и спасти родителей» В январе силовики в Москве задержали 14-летнего Даниила после того, как он бросил бутылку с зажигательной смесью в здание администрации одного из городских поселений Подмосковья, а также поджег релейный шкаф. Его действия квалифицировали как теракт. Защита утверждает, что подросток стал жертвой мошенников. Сначала они связались с ним под видом чиновников из системы образования, предложив зарегистрироваться на олимпиаду. Даниил согласился, отправил мошенникам код, после чего они взломали «Госуслуги» его родителей. Мошенники сообщили подростку, что к деньгам родителей получили доступ украинцы и скоро средства будут направлены на финансирование ВСУ, после чего родителей посадят в тюрьму, а подростка отправят в детский дом. Чтобы этого избежать, ему нужно было помочь «поймать преступников», бросив бутылку с зажигательной смесью в здание администрации. При этом о том, что это здание администрации, он не знал, ему сказали, что там находится call-центр украинских мошенников, подчеркивают адвокаты. Кроме того, надо было поджечь стоящие рядом автомобили, чтобы «подать сигнал» правоохранителям. Помимо этого, мошенники убедили Даниила поджечь релейный шкаф на железной дороге, сказав, что в нем находятся провода, обеспечивающие электропитание украинского call-центра. Все это время Даниил был уверен, что с ним общаются сотрудники ФСБ, которые обещали представить его к награде за помощь Родине. В момент задержания он считал, что его приехали награждать. Как юристы предлагают решать проблему Одним из вариантов решения проблемы, по мнению Сергея Зубкова, могла бы стать отмена нижних границ возможного наказания в УК или снижение их до очень низкого уровня, что позволит судьям более гибко подходить к таким делам и учитывать все обстоятельства. Помимо этого, можно ввести в Уголовный кодекс дополнительный состав преступления для тех, кто был втянут обманом в совершение преступления, полагает адвокат. Отвечая на вопрос о том, не откроет ли это лазейку для преступников, осознанно совершивших преступление, к тому, чтобы получать менее суровое наказание, юрист указал на то, что следственные органы, прокуратура и суды должны разобрать каждый случай и определить справедливое наказание. Говоря о возможной коррупционной составляющей, Зубков подчеркнул, что жизнь человека не должна быть разменной монетой: «С коррупцией надо бороться. Если вдруг судья системно начинает выносить какие-то сомнительные приговоры, то нужно специальным службам заниматься проверкой и повышенным контролем. И, конечно, судьи — это все-таки те люди, которые должны быть под пристальным вниманием общества, включая то, соответствует ли их образ жизни получаемым официальным доходам. Но, еще раз говорю, нельзя из-за вопроса борьбы с коррупцией разрушать чью-то жизнь». Для решения проблемы необходимо в первую очередь, чтобы поменялась правоприменительная практика в том, что касается назначения психолого-психиатрической экспертизы, уверен адвокат Аронов. Теракт относится к категории особо тяжких преступлений, поэтому суд автоматически удовлетворяет ходатайство о заключении подозреваемого под стражу. После этого до назначения экспертизы может пройти четыре-пять месяцев. «Но за эти четыре-пять месяцев ребенок уже социализировался в том месте, где он находится: уже побрился налысо, возможно, начал курить, играть в карты и получать взыскания. Он уже находится в окружении преступников. И этого надо избежать. Поэтому важно, чтобы экспертиза назначалась в первую очередь, чтобы выяснить отношение ребенка к своему деянию», — поясняет собеседник РБК. Кроме того, считает Аронов, необходимо дополнить ст. 205 примечанием о том, что лицо, совершившее преступление в возрасте до 18 лет под влиянием угрозы или обмана, освобождается от уголовной ответственности, если в его действиях не содержится иного состава преступления. «А иной состав — это когда ты все-таки что-то сжигаешь, например, релейный шкаф. Ты же понимаешь при этом, что причиняешь ущерб? И в этом случае это преступление уже должно квалифицироваться по ст. 167 УК (повреждение чужого имущества), либо по ст. 213 (хулиганство), либо ст. 267 (приведение в негодность транспортных средств или путей сообщения)», — поясняет он. Для того чтобы решать проблему более комплексно, необходимо изменить профилактическую работу, проводимую государством, считает Аронов. Сейчас такая работа проводится, но государство «все время находится в роли догоняющего»: «Профилактика ведется на взрослом уровне и, как правило, не достигает детей, а нужно создавать контент, понятный детям, говорить на их языке, идти к ним в соцсети, играть с ними на одном поле». Как растет число зарегистрированных терактов Согласно данным МВД, в 2024 году в России было зарегистрировано 3714 преступлений террористического характера, что на 56% больше, чем годом ранее. В том числе был совершен 1191 теракт, это на 190,5% больше год к году. В целом число преступлений, квалифицированных как теракты, за последние годы резко выросло. Так, с 2019 по 2021 год в МВД фиксировали от 41 до 50 терактов в год. В последующем их число стало увеличиваться: в 2022 году было зафиксировано 127 терактов, в 2023-м — 410, а в прошлом году этот показатель перешагнул планку в 1 тыс. Статистики об умышленном повреждении или уничтожении чужого имущества (ст. 167 УК) в отчетах МВД нет. Источник, близкий к правоохранительным органам, сообщил, что, руководствуясь геополитической обстановкой, дела о поджогах, например на транспорте, по умолчанию квалифицируют как теракт, по ст. 205. «Следственный комитет на транспорте предъявляет обвинение по ст. 167 (умышленное повреждение имущества) и направляет в суд. Ст. 167 — это мировой участок. Но после этого прокуратура идет обжаловать квалификацию в вышестоящий суд, районный. И тот возвращает дело с обоснованием «неправильная квалификация». И у следствия уже нет другого выхода, кроме как переквалифицировать дело на теракт», — поясняет собеседник РБК. Аналогичного резкого роста по уже вынесенным приговорам по ст. 205 УК пока не наблюдается. В 2024 году были осуждены 132 человека (это те, у кого теракт был основной статьей, и те, у кого он был дополнительной квалификацией), следует из статистики Судебного департамента при Верховном суде. В частности, были осуждены восемь подростков в возрасте от 14 до 17 лет, это наибольший показатель за шесть лет. Кроме того, приговоры вынесли в отношении 19 молодых людей (18–24 года), что тоже является максимумом с 2019 года. Помимо этого, впервые за этот срок были осуждены три пенсионерки. Все эти данные по тем, у кого теракт был основной статьей. По ст. 167 УК в 2024 году был осужден 3631 человек. Из тех, у кого статья была основной, — 53 подростка, 339 молодых людей, 36 пенсионеров и 23 пенсионерки. Дела по ст. 205 УК рассматривают окружные военные суды, их в России шесть, не считая флотских. РБК с помощью парсера проекта «Если быть точным» собрал данные с их сайтов по вынесенным приговорам за последние три года. Однако ни в одном случае не был опубликован текст приговора, поэтому невозможно определить, какая доля преступлений была совершена людьми, обманутыми мошенниками, а какая — умышленно. По результатам анализа сайтов окружных военных судов стало известно, что в 2025 году по статье о теракте в период до 30 июня было вынесено 106 приговоров (учитывались дела, в числе статей которых была ст. 205). При этом за весь 2024 год, по данным Судебного департамента Верховного суда, было вынесено 134 приговора. Еще по шести делам в 2025 году были применены принудительные меры медицинского характера. Нет решения, то есть еще находятся на рассмотрении судов, по 116 делам. «С точки зрения абстрактного гуманизма понимаю адвокатов» Сейчас суд, применяя закон, смотрит в том числе на личность совершившего преступление, поэтому у него есть возможность по-разному отнестись к человеку, который сознательно шел на это, и к тому, кого фактически обманули, сказал РБК глава комитета по госстроительству и законодательству Госдумы Павел Крашенинников. «Я согласен с тем, что ущерб есть и с тем, что человек должен нести наказание, но я также согласен и с тем, что наказание не должно быть одинаково, — рассуждает он. — Поэтому, мне кажется, что если нужны какие-то поправки, их надо смотреть. Но, подчеркну, и сейчас суд, принимая решение, обязан учитывать характеристику человека и в целом субъективную сторону преступления». Полностью убирать нижнюю границу наказания по террористической статье не надо, но вполне возможно рассмотреть варианты ее снижения в отдельных случаях, полагает Крашенинников. Он также подчеркнул, что необходимо вести профилактику вовлечения в такую деятельность, рассказывая людям, в особенности детям и пожилым, как это происходит и что в таких случаях необходимо предпринять. Суды и сейчас по действующему закону должны подходить индивидуально, анализируя субъективную сторону состава преступления, считает глава комитета по конституционному законодательству и госстроительству Совета Федерации Андрей Клишас. «В данном плане никакие поправки не нужны», — сказал он РБК. В СПЧ не поступали обращения, связанные со случаями, когда людей обманом вынуждали совершить подобные преступления, сообщил РБК глава СПЧ Валерий Фадеев. Что касается взрослого человека, то когда к нему обращаются с просьбой поджечь релейный шкаф, он должен задуматься, почему он должен это делать, не надо ли ему обратиться в полицию или ФСБ, считает Фадеев. Он также напомнил, что суд имеет право в отдельных случаях назначать наказание ниже того, что указано в статьях Уголовного кодекса. «Мне кажется, что суд вполне может разобраться в том, в каком состоянии находился человек, совершивший такой акт», — выразил он мнение. Россия «ведет тяжелую войну с целым Западом на украинском театре военных действий», поэтому взрослому человеку надо со всей тщательностью относиться к тем предложениям, которые ему делаются, говорит глава СПЧ. «С точки зрения абстрактного гуманизма я понимаю адвокатов. Но поджигать релейные шкафы и вышки электропередачи — это, конечно, теракт», — подытожил он. Что касается детей, то в школах было бы правильно проводить занятия, в рамках которых рассказывали бы о том, какую опасность могут представлять мошенники, если этого еще не делается, посчитал Фадеев. В аппарате уполномоченного по правам ребенка отказались комментировать проблему, в аппарате уполномоченного по правам человека не ответили на запрос РБК. Как задерживают и судят тех, кого обманули мошенники В январе 2025 года суд приговорил 76-летнюю петербурженку Галину Иванову к десяти годам лишения свободы по делу о теракте. Мошенники, выдавая себя за сотрудников спецслужб, связались с ней в 2023 году. На женщину оформили кредиты, она перевела мошенникам более 500 тыс. руб. Спустя полтора месяца «обработки» ее убедили бросить «коктейль Молотова» в военкомат на набережной Фонтанки. В результате загорелся стоящий рядом автомобиль, но пламя погасло через несколько секунд. По данным «Фонтанки», подбежавший водитель спросил у Ивановой, зачем она поджигает его автомобиль, на что женщина ответила фразой, «которая прославляет одну из соседних стран», — так ее инструктировали по телефону кураторы. «Поймите, я послевоенный ребенок, человек, сформированный Советским Союзом, у нас в крови доверие к таким словам, как «государство», «милиция», — позже объясняла свои действия Иванова. — Мы во все это свято верили, а теперь с нашей верой и идеалами вот так вот. Знаете, что они мне говорили? «Вас же Родина просит!» В конце декабря 2024 года 65-летний мужчина два раза бросил «коктейли Молотова» в полицейский автомобиль в центре Москвы возле здания ОВД «Арбат». После задержания он рассказал, что считает, что помогает спецслужбам. При этом, по его словам, в случае отказа от «помощи» ему угрожали убийством жены. На него завели уголовное дело по статьям о теракте и умышленном повреждении чужого имущества. В июне в Нефтеюганске (ХМАО) полиция задержала девятиклассника, который поджег несколько автомобилей, следуя указаниям мошенников. Было заведено уголовное дело по ст. 167 УК. Как сообщали в МВД, 16-летнему подростку позвонила женщина, представившаяся заведующей его школы, и попросила прислать фотографию его паспорта. После этого ему позвонили якобы правоохранители, сообщив о взломе «Госуслуг» и о необходимости перевести деньги на безопасный счет. После перевода ему сообщили, что деньги ушли на финансирование запрещенной организации, поэтому его маму и сестру могут арестовать. Чтобы этого избежать, необходимо было найти и поджечь автомобили с «патриотической символикой». В конце мая ФСБ отчиталась о задержании шестерых молодых людей, совершавших поджоги на транспорте, а также декораций к празднованию 80-летия Победы в Великой Отечественной войне. Все они от 2002 до 2010 годов рождения. По сообщению спецслужбы, они выполняли поджоги под угрозой привлечения к уголовной ответственности за финансирование ВСУ после того, как перевели деньги на «безопасный счет».	4	\N	2025-07-04 10:25:03	2025-07-04 10:25:03
1189	3055	karapetyan-podal-v-sud-na-deputatov-armenii-posle-slov-o-fsb-i-boegolovkah	Карапетян подал в суд на депутатов Армении после слов о ФСБ и боеголовках	https://s0.rbk.ru/v6_top_pics/media/img/7/61/347516121891617.jpeg	Арестованный в Армении Карапетян подал иск за клевету против депутатов парламента от правящей фракции «Гражданский договор» Торосяна и Конджоряна. Бизнесмен требует от каждого из депутатов опровержения и компенсации в $23,5 тыс. Самвел Карапетян (Фото: Роман Шеломенцев / РБК) Глава промышленно-строительной группы «Ташир», российский бизнесмен армянского происхождения Самвел Карапетян обратился в Ереванский городской суд с исками к депутатам парламента от правящей фракции «Гражданский договор» Арсену Торосяну и Айку Конджоряну, следует из базы данных портала судебной информации datalex.am. В иске Карапетян требует от депутатов принести публичные извинения и опровергнуть сделанные ими заявления о его связях с ФСБ России и противоправной экономической деятельности. Он также настаивает, чтобы каждый из депутатов опубликовал на своей странице в Facebook (принадлежит признанной в России экстремистской и запрещенной Meta) сообщение под заголовком «Опровержение сведений, представляющих клевету в отношении Самвела Карапетяна». В публикации бизнесмен требует указать следующее: «Публично заявляю, что эти сведения являются клеветническими, ложными и необоснованными, за что приношу свои извинения». Ставшее поводом для иска заявление Арсен Торосян озвучил, выступая с трибуны Национального собрания Армении 17 июня. Депутат обвинил Карапетяна в связях с российскими спецслужбами, утверждая, что бизнесмен «действовал по указанию ФСБ» и выступил с заявлениями в защиту Армянской апостольской церкви с целью дестабилизировать ситуацию в стране. Претензии Самвела Карапетяна к главе фракции «Гражданский договор» Айку Конджоряну связаны с заявлениями, которые он сделал 17 и 18 июня. Депутат, в частности, в одном из выступлений сравнил Католикоса всех армян, главу Армянской апостольской церкви Гарегина II с «боеголовкой», под которой, по его словам, «собрались преступники, олигархи, бывшие грабители, выскочки и святотатцы», среди которых оказался и Карапетян. rbc.group В случае невозможности публикации опровержения в социальной сети Карапетян требует обязать Торосяна и Конджоряна в течение пяти рабочих дней после вступления решения суда в силу выпустить аналогичное заявление в любой армянской печатной газете тиражом не менее 5 тыс. экземпляров. В качестве компенсации за оскорбление и клевету, а также сумму судебных издержек, состоящую из государственной пошлины и гонораров адвоката, Карапетян просит взыскать с каждого депутата 9 млн драмов ($23,5 тыс. или 1,8 млн руб.). rbc.group В Армении одобрили закон о национализации «Электросетей» Карапетяна Политика Самвелу Карапетяну 59 лет, его состояние — $3,2 млрд по версии российского Forbes. Возглавляемая им компания «Ташир Групп» носит название в честь родного города бизнесмена в Армении. В число активов группы в России входят торговые центры «Рио» и Фора-банк. В Армении ей принадлежат «Электрические сети», обеспечивающие более 1 млн потребителей. 17 июня в доме у Карапетяна в Ереване провели обыски. На следующий день, 18 июня, сотрудники Главного управления по борьбе с организованной преступностью МВД Армении задержали бизнесмена, в тот же день суд в Ереване решил его арестовать. Карапетяна обвинили в публичных призывах к захвату власти (ч. 2 ст. 422 УК Армении). После ареста власти заявили о решении национализировать и выставить на торги принадлежащую ему компанию «Электрические сети Армении». Уголовное дело против Карапетяна совпало по времени с его поддержкой Армянской апостольской церкви, которую критикует премьер-министр Армении Никол Пашинян. Читайте РБК в Telegram.	6	\N	2025-07-04 10:25:04	2025-07-04 10:25:04
1192	3049	eks-gensek-obse-obyasnil-kak-vosstanovit-bezopasnost-evropy	Экс-генсек ОБСЕ объяснил, как восстановить безопасность Европы	https://s0.rbk.ru/v6_top_pics/media/img/6/05/347515397566056.jpeg	Глава Женевского центра политики безопасности (Geneva Centre for Security Policy — GCSP), генеральный секретарь ОБСЕ в 2017–2020 годах Томас Гремингер объяснил РБК, с чего начать восстановление системы европейской безопасности Томас Гремингер (Фото: Christophe Morin / Imago / Global Look Press) Выстраивать новую европейскую безопасность следует в сотрудничестве с Россией, сказал в интервью РБК на полях XI научно-экспертного международного форума «Примаковские чтения» исполнительный директор Женевского центра политики безопасности (Geneva Centre for Security Policy — GCSP), генеральный секретарь ОБСЕ в 2017–2020 годах Томас Гремингер. «Нам надо сфокусироваться на структурных элементах, которые обеспечат восстановление европейской безопасности. Прямо сейчас у нас есть европейский порядок безопасности, который в основном направлен на защиту Европы от России. Я же думаю, что этот порядок надо выстраивать как европейскую безопасность с Россией — безопасность на всем континенте мы можем строить только вместе. Для этого необходимо восстановить доверие», — считает эксперт. Песков заявил о нежелании ОБСЕ предотвратить конфликт на Украине Политика rbc.group По его оценке, первым шагом должно стать завершение боевых действий на Украине, причем на условиях, которые стали бы приемлемы для всех заинтересованных сторон. «Если военные действия на Украине прекратятся таким образом, который все стороны посчитают справедливым, то у нас будет среда, в которой будет возможно вести переговоры о мерах по снижению военных рисков и мерах укрепления доверия и безопасности», — отметил Гремингер. rbc.group В марте 2025 года состоялся первый с 2021 года визит генерального секретаря ОБСЕ в Россию — с декабря 2024-го эту должность занимает турецкий дипломат Феридун Синирлиоглу. В Москве он встретился с главой МИДа Сергеем Лавровым, который заявил на пресс-конференции, что доставшееся Синирлиоглу наследство «не может вызвать зависти». «За предшествовавшие годы Запад запретил себе вступать с нами в диалог. Распространил этот запрет на международную организацию, которой является ОБСЕ», — сказал Лавров. Он также отметил, что сейчас идут разговоры «не об евроатлантических концепциях, а о евразийском подходе, о евразийской архитектуре». Речь, в частности, об идее Большого евразийского партнерства, которую президент России Владимир Путин впервые обнародовал в 2015 году и цель которой — «формирование широкого интеграционного контура на Евразийском континенте».	4	\N	2025-07-04 10:25:04	2025-07-04 10:25:04
1193	3059	eks-gensek-obse-rasskazal-chego-ne-hvataet-peregovoram-po-ukraine	Экс-генсек ОБСЕ рассказал, чего не хватает переговорам по Украине	https://s0.rbk.ru/v6_top_pics/media/img/5/52/347515414086525.jpeg	Глава Женевского центра политики безопасности (Geneva Centre for Security Policy — GCSP), генсек ОБСЕ в 2017–2020 годах Томас Гремингер поделился с РБК, что сделает переговоры между Россией и Украиной более эффективными Томас Гремингер (Фото: Global Look Press) Нынешним прямым переговорам между Россией и Украиной не хватает четкой структуры и конкретной повестки. Такую оценку в интервью РБК, данном на полях XI научно-экспертного международного форума «Примаковские чтения», высказал исполнительный директор Женевского центра политики безопасности (Geneva Centre for Security Policy — GCSP), генеральный секретарь ОБСЕ в 2017–2020 годах Томас Гремингер. «Необходимо, чтобы стороны снова вели переговоры в рамках структурированного переговорного процесса. Именно этого сейчас не хватает, — считает эксперт. — Мы наблюдаем политические импульсы, которые заставили стороны снова говорить друг с другом. К настоящему моменту было несколько обменов пленными, и это позитивно — я бы не стал это недооценивать. Но чего мы не наблюдаем, так это структурированного переговорного процесса, как в 2022 году». По оценке Гремингера, три года назад переговоры не привели к урегулированию, поскольку тогда «стороны пришли к выводу, что они все еще могут улучшить свои позиции на поле боя». «Поэтому сегодня снова должно быть ощущение, что конфликт созрел для урегулирования. Мое внутреннее чувство подсказывает, что стороны близки тому, чтобы это признать», — отметил эксперт, подчеркнув, что переговоры должны сосредоточиться на двух принципиальных вопросах: условия прекращения огня и общие принципы урегулирования. rbc.group Лавров назвал незавидным наследством ситуацию в ОБСЕ Политика rbc.group Украина настаивала, что сначала надо договориться о прекращении боевых действий, Россия же утверждает, что сначала должны быть «решены первоначальные причины специальной военной операции». «Лучший способ справиться с этой дилеммой — договориться о повестке переговоров, которая касалась бы обоих вопросов: прекращения огня и рамок принципов урегулирования, — отметил Гремингер. — Затем вы можете договориться о временном прекращении огня и продлить его в зависимости от прогресса переговоров о принципах. Дипломатия располагает механизмами, позволяющими справляться с этими дилеммами. Но прежде всего нужна повестка дня переговоров, и немного удивительно, что не было соглашения о такой повестке». 16 мая 2025 года в Стамбуле после трехлетнего перерыва возобновились прямые переговоры российской и украинской делегаций. Они договорились обменяться военнопленными по формуле «1000 на 1000». Вторая встреча прошла в Стамбуле 2 июня — тогда делегации обменялись меморандумами с предложениями по урегулированию и договорились вернуть друг другу тела погибших военнослужащих по формуле «6000 на 6000». Как заявили 3 июля в Кремле, сейчас Москва и Киев договариваются, когда провести третий раунд переговоров.	10	\N	2025-07-04 10:25:04	2025-07-04 10:25:04
1216	3362	bazy-britanskih-vvs-zashchitili-sadovoy-izgorodyu-i-tablichkoy-ne-vhodit	Базы британских ВВС защитили садовой изгородью и табличкой: «Не входить»	https://s0.rbk.ru/v6_top_pics/media/img/4/83/347516285436834.jpeg	На посещенных журналистами базах патрулирование осуществлялось редко, колючая проволока отсутствовала на значительных участках, а системы видеонаблюдения, судя по всему, не охватывали всю территорию. Фото: Getty Images Важнейшая база британских ВВС, где разместятся истребители F-35, защищена забором высотой 150 см, выяснила The Telegraph. Издание обнаружило уязвимости еще на двух базах, которые пропалестинская организация Palestine Action объявила целями для нападений. Как пишет издание, в некоторых случаях взлетно-посадочные полосы защищены изгородями, деревянными заборами или вообще ничем. Эти уязвимости можно обнаружить даже через Google Street View. Эксперты не исключают, что активисты Palestine Action и враждебные государства могли уже использовать этот сервис для выявления слабых мест в охране объектов. Ранее активисты беспрепятственно проникли на базу ВВС Великобритании Брайз-Нортон в Оксфордшире и покинули ее, испачкав краской два военных самолета. The Telegraph отмечает, что на главной разведывательной и наблюдательной базе Королевских ВВС 700-метровый участок периметра возле взлетно-посадочной полосы огорожен лишь изгородями, металлическими и деревянными заборами высотой не более 170 см. Колючая проволока здесь отсутствует, что позволяет потенциальным нарушителям быстро скрыться на пролгающем рядом шоссе A15. Рядом расположена еще одна база, защищенная лишь садовой изгородью также высотой 180 см, которая тянется почти на 2,4 км вдоль северного и восточного периметра. На этой базе дислоцируются эскадрильи истребителей RAF Typhoon. rbc.group Уязвимость периметров была выявлена и на двух других базах Королевских ВВС, которые организация Palestine Action назвала своими целями на прошедшей неделе. Одной из таких баз оказалась школа подготовки офицеров Королевских ВВС. Ее периметр практически не защищен: 6,3 км ограждения состоят из сухих каменных стен, сломанных деревянных заборов, изгородей или вовсе отсутствуют. На территории также есть несколько слабоохраняемых аварийных выходов — два из них остаются полностью открытыми, а один перекрыт лишь передвижными металлическими баррикадами и табличкой с надписью: «Не входить». rbc.group Секретные документы о британской военной базе нашли на улице в Ньюкасле Политика Эд Арнольд, бывший офицер британской армии, отвечавший ранее за безопасность военных объектов, заявил, что Королевские ВВС превратились в «легкую мишень» как для активистов, так и для иностранных агентов. «Palestine Action наглядно показала уязвимость наших баз. Если более опасные группы последуют их примеру, последствия могут быть куда серьезнее — например, кто-то бросит ручную гранату в двигатель самолета, а не просто обольет его краской. Россия и Иран наверняка следят за этим и изучают возможности для саботажа», — предупредил он. Марк Франсуа, теневой министр обороны от Консервативной партии, заявил, что ВВС Великобритании необходимо срочно пересмотреть систему безопасности баз после «столь серьезных разоблачений». По его словам, Министерство обороны уже объявило о проверке защиты на всех военных объектах, которая «должна быть тщательной, но проведенной в сжатые сроки». В Министерстве обороны изданию сообщили, что после инцидента на базе Брайз-Нортон «срочно пересматривают процедуры безопасности на всех объектах». Читайте РБК в Telegram.	7	\N	2025-07-04 14:35:02	2025-07-04 14:35:02
1224	3495	niderlandy-lishili-grazhdanstva-rodivshegosya-v-sssr-nobelevskogo-laureata	Нидерланды лишили гражданства родившегося в СССР нобелевского лауреата	https://s0.rbk.ru/v6_top_pics/media/img/0/43/347516310986430.jpeg	Андрея Гейма лишили гражданства Нидерландов, которое он получил в 1990-е годы после того, как покинул СССР, пишет NYT. В 2010-м он и Константин Новоселов получили Нобелевскую премию по физике за создание графена Андрей Гейм (Фото: ТАСС) Лауреата Нобелевской премии по физике Андрея Гейма лишили гражданства Нидерландов, пишет The New York Times (NYT) со ссылкой на письмо ученого. «Лично я считаю себя нидерландско-британским лауреатом Нобелевской премии (именно в таком порядке), — написал он. — История и время, которое я провел в Нидерландах, работая там, очень дороги моему сердцу». Гейм рассказал NYT, что ему сообщили о том, что он больше не является гражданином Нидерландов и должен сдать свой паспорт в голландском посольстве в Лондоне, «иначе грозят последствия со стороны Интерпола». Он назвал это решение «печальным и странным». rbc.group Ученый родился в 1958 году в Сочи, окончил школу в Нальчике с золотой медалью и МФТИ с отличием. В 1987 году он стал кандидатом физико-технических наук, а в 1990-м получил стипендию Английского королевского общества и уехал из СССР. По данным NYT, в тот же период он стал гражданином Нидерландов. Гейм работал в университетах в Великобритании, Германии, Нидерландах, Дании и Швейцарии. rbc.group В 2010 году Гейм вместе с другим ученым Константином Новоселовым получили Нобелевскую премию за создание графена (тончайшего и прочного материала) Он может быть использован для производства сенсорных экранов, световых панелей и, вероятно, солнечных элементов, отмечали в Нобелевском комитете. Королева Великобритании Елизавета II пожаловала физиков в рыцари-бакалавры за научные заслуги. Для того, чтобы Гейм также получил право прибавлять к своему имени «сэр», ему пришлось получить британское подданство. Однако, как отмечает NYT, Нидерланды строго ограничивают двойное гражданство — его добровольное получение может привести к потере голландского паспорта, что и произошло в случае с Геймом. Нобелевский лауреат посоветовал молодежи не спешить в айтишники Общество «Я сделал это, чтобы получить рыцарское звание в Великобритании и официально именоваться сэром Андре, что престижно в Соединенном Королевстве, — сказал он. — Я сделал это только ради того, чтобы получить британское рыцарское звание».  В ЕС двойное гражданство распространено, вместе с тем европейцы могут свободно переезжать из одной страны в другую без необходимости получать новый правовой статус. Великобритания официально вышла из Евросоюза в 2020 году. «Я бы, наверное, отказался от рыцарского звания, если бы знал, какие последствия это будет иметь для моего голландского гражданства, но это было до Brexit, и тогда никто не сообщил мне о возможных последствиях», — сказал Гейм, добавив, что его «выгнали из страны как бесполезного человека». Гейм также является членом-корреспондентом Королевской академии наук и искусств Нидерландов и иностранным членом НАН США. Читайте РБК в Telegram.	10	\N	2025-07-04 16:05:02	2025-07-04 16:05:02
1194	3058	nad-rossiyskimi-regionami-za-noch-sbili-48-bespilotnikov	Над российскими регионами за ночь сбили 48 беспилотников	https://s0.rbk.ru/v6_top_pics/media/img/1/88/347516097121881.jpeg	Военные уничтожили ночью 48 беспилотников над регионами России, сообщило Минобороны. Атакам подверглись Ростовская, Курская, Белгородская, Орловская и Липецкая области. Об ударах БПЛА также сообщили власти Сергиева Посада Фото: Алексей Коновалов / ТАСС За прошедшую ночь средства противовоздушной обороны уничтожили и перехватили 48 украинских беспилотников самолетного типа, сообщило Минобороны. По информации ведомства, атакам подверглись пять российских регионов. Как сообщается в телеграм-канале Минобороны, в ночь на 4 июля 26 беспилотников было сбито над территорией Ростовской области. Еще 12 дронов уничтожено над Курской областью, шесть — над Белгородской областью, три — над Орловской областью и один — над территорией Липецкой области. По информации врио губернатора Ростовской области Юрия Слюсаря, под ударом ВСУ оказались Азов и Тарасовский район. В поселке Долотинка Миллеровского района из-за падения беспилотника был поврежден двухэтажный 8-квартирный дом, обрушилась плита перекрытия, в результате погибла пожилая женщина. В Азове и Азовском районе наибольшие повреждения получил 40-квартирный дом, где проживают 120 человек, уточнил позже глава региона. Сергиев Посад атаковали беспилотники Политика rbc.group В Липецкой области угроза атаки БПЛА действовала на территории Ельца и Елецкого района. Об отмене красного уровня предупреждения губернатор Игорь Артамонов сообщил около 6:00. Вместе с тем на территории всего региона сохраняется желтый уровень воздушной опасности. rbc.group Об атаке беспилотников ночью также сообщили в Московской области. В городе Сергиев Посад в результате удара украинских беспилотников повреждена подстанция, сообщила глава городского округа Оксана Ероханова. Без электричества остались микрорайоны Рабочий, Звездочка, Скобянка, Птицеградский и Клементьевский. Пострадали двое мужчин, угрозы жизни нет. Читайте РБК в Telegram.	9	\N	2025-07-04 10:25:04	2025-07-04 10:25:04
1196	3062	scmp-uznala-chto-porazhenie-rossii-na-ukraine-ne-v-interesah-kitaya	SCMP узнала, что поражение России на Украине не в интересах Китая	https://s0.rbk.ru/v6_top_pics/media/img/2/16/347515850180162.jpeg	Такое заявление глава МИД Китая Ван И сделал на встрече с коллегой из ЕС Каей Каллас. Позицию он объяснил тем, что сейчас США сосредоточены на ситуации на Украине, но потом неизбежно переключат внимание на Азию Кая Каллас и Ван И (Фото: сайт МИД Китая) Китай заявил ЕС, что не может допустить поражения России на Украине, так как из-за него США сосредоточат свое внимание на КНР, сообщили источники South China Morning Post (SCMP). Соответствующее заявление в закрытом формате сделал на встрече с главой дипломатии ЕС Каей Каллас министр иностранных дел Китая Ван И. Он отметил, что КНР считает неизбежным переключение США на Азию, в связи с этим затягивание российско-украинского конфликта выгодно Пекину. Газета пишет, что откровенность министра поразила европейских чиновников. При этом Ван И отверг обвинения в военной или финансовой поддержке России. По его словам, если бы такая помощь оказывалась, то конфликт на Украине прекратился бы раньше. Еще одна тема, которую затронул министр с Каллас, касалась включения китайских банков в 18-й пакет антироссийских санкций ЕС — на эту меру Пекин пообещал ответить. rbc.group SCMP отмечает, что подобные заявления прозвучали незадолго до крупного саммита ЕС — Китай, таким образом, ожидание результатов от «дипломатии обаяния» не оправдались. Ван И, отметили источники, также намекнул Брюсселю на возможное сокращение программы саммита. rbc.group Ушаков заявил, что визит Путина в Китай будет редким по длительности Политика В релизе дипломатической службы ЕС о встрече Вана и Каллас сказано, что верховный европейский дипломат назвала угрозой сотрудничество китайских компаний и России, призвала Китай прекратить «любую материальную поддержку российского военно-промышленного комплекса» и выступила за прекращение огня. Как сообщил МИД Китая, Ван И подчеркнул приверженность китайской дипломатии миру, инклюзивности и сотрудничеству. «Китай — это не США, и не следует проецировать американский путь развития на Китай», — сказал он. Пекин не раз заявлял, что выступает за мирное разрешение конфликта на Украине. В 2023-м он даже представлял свой план урегулирования. Президент Владимир Путин говорил о своей уверенности, что военная операция на Украине завершится победой России. В то же время он неоднократно отмечал, что Москва готова к дипломатическому решению конфликта. Читайте РБК в Telegram.	5	\N	2025-07-04 10:25:05	2025-07-04 10:25:05
1195	3061	rvalasya-k-moryu-protiv-buri-v-peterburge-nachalos-navodnenie	«Рвалася к морю против бури»: в Петербурге началось наводнение		Video В Петербурге идет наводнение — с внешней стороны защитных сооружений уровень воды там поднялся выше 180 см. На кадрах, которые публикует Дамба Петербурга, видно, как с внешней стороны дамбы плещутся волны. При этом в самом Петербурге, с внутренней стороны дамбы, уровень воды ниже. Синоптики ранее прогнозировали первое за 160 лет июльское наводнение в городе. Утром 4 июля начал усиливаться западный ветер в городе до 20–25 м/с. Это создало нагонную волну, которая двинулась по Финскому заливу в сторону Петербурга. Уровень воды у дамбы в Петербурге поднялся выше 180 см Общество	3	\N	2025-07-04 10:25:05	2025-07-04 10:25:05
1197	3063	merkel-rasskazala-kak-tramp-otkazalsya-pozhat-ey-ruku	Меркель рассказала, как Трамп отказался пожать ей руку	https://s0.rbk.ru/v6_top_pics/media/img/6/74/347516092979746.jpeg	Бывший немецкий канцлер описала Трампа как человека, который ищет внимания, и вспомнила случай, как он отказался пожать ей руку не на виду у всех Ангела Меркель и Дональд Трамп (Фото: Sean Gallup / Getty Images) Экс-канцлер Германии Ангела Меркель рассказала о моменте, когда президент США Дональд Трамп отказался пожать ей руку. Об этом она вспомнила в Афинах во время беседы с газетой Kathimerini. В Грецию она приехала в связи с презентацией греческого перевода ее мемуаров «Свобода». «Я сказала: «Дональд, я хочу пожать вам руку», но он не стал этого делать. Он хотел привлечь к себе внимание. Это его цель — отвлечь внимание и заставить всех смотреть на него», — заявила Меркель, говоря о встрече с политиком в 2017 году в Овальном кабинете. «Это хорошо видно по его действиям с тарифами. В конечном итоге он должен обеспечить хорошие результаты для американского народа. Ему нужно доказать свою компетентность, хотя бы в собственной стране», — добавила она. Если пошлины приведут к росту цен в США, то политик столкнется с последствиями, уверена экс-канцлер. rbc.group Евросоюзу Меркель посоветовала сохранять единство и не поддаваться давлению в торговой войне Трампа, а также принимать зеркальные меры и вести переговоры. rbc.group Меркель заявила, что конфликт России и Украины не закончится без диалога Политика Меркель была канцлером Германии с 2005 по 2021 год, соответственно, на этом посту она застала первый президентский срок Трампа (2017–2021). Бывший канцлер уже высказывалась о президенте США. Так, в марте она говорила, что Трамп «очарован» Россией как «огромной страной со множеством природных ресурсов, мощной ядерной державой с авторитарным президентом». Трамп, в свою очередь, в начале июня раскритиковал Меркель за политику «открытых дверей» Германии для беженцев. «Я говорил ей, что этого не должно было случиться», — сказал американский президент во время встречи с нынешним канцлером Германии Фридрихом Мерцем. Читайте РБК в Telegram.	3	\N	2025-07-04 10:25:05	2025-07-04 10:25:05
1198	3081	sergiev-posad-atakovali-bespilotniki	Сергиев Посад атаковали беспилотники	https://s0.rbk.ru/v6_top_pics/media/img/7/32/347515980333327.jpeg	В микрорайоне Звездочка произошло четыре взрыва, ранен мужчина, рассказали власти города. Московская область — второй регион, где сообщили об атаке дронов прошедшей ночью Фото: OErohanovaSP / Telegram Город Сергиев Посад в Московской области атаковали украинские дроны, сообщила глава городского округа Оксана Ероханова. «В настоящий момент известно о четырех взрывах в районе микрорайона Звездочка. Пострадал один мужчина, его незначительно посекло осколками», — рассказала она. Позже мэр сообщила, что из-за атаки оказалась повреждена подстанция. Без электричества оказались Звездочка и соседний район Рабочий поселок. rbc.group Также в городе перекрыли въезды на улицы Октябрьскую и Симоненкова (в микрорайне Звездочка). rbc.group Об атаке беспилотников также рассказал врио губернатора Ростовской области Юрий Слюсарь. Из-за падения БПЛА там погибла женщина-пенсионерка: в восьмиквартирном жилом доме обрушилась плита перекрытия. Это произошло в Миллеровском районе. Также падения обломков дронов зафиксированы в городе Азове. Беспилотники нанесли удар по объекту в Удмуртии Политика В июне ВСУ не раз пытались атаковать Подмосковье беспилотниками. В ночь на 26 июня было уничтожено три дрона, два из которых летели на Москву. Сергиев Посад в последний раз подвергался атаке БПЛА в январе. Читайте РБК в Telegram.	1	\N	2025-07-04 10:45:02	2025-07-04 10:45:02
1202	3145	klichko-rasskazal-o-povrezhdeniyah-v-shesti-rayonah-kieva-nochyu	Кличко рассказал о повреждениях в шести районах Киева ночью	https://s0.rbk.ru/v6_top_pics/media/img/1/87/347516154966871.jpeg	Около полуночи Кличко сообщал о воздушной тревоге в Киеве. По его словам, повреждения зафиксированы в шести районах украинской столицы. Власти предупредили, что в Киеве зафиксирован высокий уровень загрязненности воздуха Виталий Кличко (Фото: Nazar Furyk / ZUMA / Global Look Press) В результате ночной атаки зафиксированы повреждения в шести районах украинской столицы, сообщил мэр Киева Виталий Кличко. Повреждения есть в Соломенском, Днепровском, Святошинском, Дарницком, Голосеевском и Шевченковском районах. Он уточнил, что везде были зафиксированы падения обломков. Около полуночи Кличко сообщал о воздушной тревоге в городе. Следом предупредительный сигнал прозвучал на всей территории Украины. rbc.group В Киеве снова прозвучали взрывы Политика rbc.group Министерство защиты окружающей среды и природных ресурсов Украины зафиксировало высокий уровень загрязненности воздуха в Киеве, передает «РБК Украина». Причина ухудшения — пожары. Радиационный фон в столице остается в норме. Минобороны России подчеркивает, что удары наносятся только по военным и энергетическим объектам Украины и связанной с ними инфраструктуре. Читайте РБК в Telegram.	9	\N	2025-07-04 11:25:03	2025-07-04 11:25:03
1204	3206	v-rime-vzryv-raznes-avtozapravku-video	В Риме взрыв разнес автозаправку. Видео		Video В Риме произошел взрыв на заправочной станции, пишет Il Fatto Quotidiano. Пострадал по меньшей мере 21 человек, пятеро из них госпитализированы в тяжелом состоянии. В трубу на заправочной станции Eni врезался грузовик, после чего начался пожар и прогремел взрыв. Он нанес ущерб нескольким близлежащим зданиям, люди в них сравнили произошедшее с землетрясением. Взрыв был слышен почти по всему Риму, пишет издание. Причины происшествия устанавливаются. Прокуратура Рима ожидает первых отчетов от пожарных и сотрудников правоохранительных органов, после чего будет открыто следственное дело. Читайте РБК в Telegram.	1	\N	2025-07-04 12:35:03	2025-07-04 12:35:03
1205	3200	v-moskve-pogib-vice-prezident-transnefti-andrey-badalov	В Москве погиб вице-президент «Транснефти» Андрей Бадалов	https://s0.rbk.ru/v6_top_pics/media/img/1/75/347516133598751.jpeg	Тело Бадалова обнаружили под окнами его дома на Рублевском шоссе. Топ-менеджеру было 62 года. В «Транснефти» он работал с 2021 года, курировал вопросы цифровой трансформации и информационных технологий Андрей Бадалов (Фото: Максим Константинов / Global Look Press) В Москве погиб вице-президент «Транснефти» Андрей Бадалов, сообщает ТАСС со ссылкой на источник в правоохранительных органах. По информации агентства, предварительная причина смерти — самоубийство. Тело Бадалова обнаружили под окнами его дома на Рублевском шоссе, пишет агентство. «РИА Новости» сообщает, что на момент происшествия в квартире находились его жена и две дочери, с ними работают психологи. Оперативно-следственная группа выясняет обстоятельства, сообщил источник РБК в правоохранительных органах. РБК направил запрос в ПАО «Транснефть». По словам источника «РИА Новости», перед смертью Бадалов написал супруге прощальные сообщения. «По предварительным данным, перед смертью он отправлял супруге сообщения, прощался», — сказал собеседник агентства. О гибели вице-президента «Транснефти» также пишут телеграм-каналы Mash и Baza. По информации Mash, у Бадалова были проблемы с сердцем, он носил холтер — медицинский прибор для суточного мониторинга кардиопоказателей. Его тело обнаружил охранник ЖК, уточняет телеграм-канал. rbc.group Позднее информацию о смерти Бадалова подтвердили и в самой компании. «Скорбим о невосполнимой утрате, постигшей наш коллектив. В расцвете сил и созидательной работы оборвалась жизнь замечательного человека, уникального профессионала, надежного коллеги и товарища», — говорится в сообщении «Транснефти». В «Транснефти» отметили, что Бадалов пришел в компанию «в сложный и напряженный период». Под его руководством были реализованы проекты, позволившие «Транснефти» преодолеть «вызовы санкционных ограничений, особенно остро затронувших отрасль информационных технологий». 62-летний Андрей Бадалов работал в «Транснефти» с 2021 года. Он курировал вопросы цифровой трансформации и информационных технологий. До назначения в «Транснефть» Бадалов возглавлял научно-исследовательский институт «Восход». Читайте РБК в Telegram.	3	\N	2025-07-04 12:35:03	2025-07-04 12:35:03
1209	3256	minoborony-soobshchilo-o-massirovannom-udare-po-predpriyatiyam-vpk-v-kieve	Минобороны сообщило о массированном ударе по предприятиям ВПК в Киеве	https://s0.rbk.ru/v6_top_pics/media/img/6/41/347516225733416.jpeg	Фото: Алексей Коновалов / ТАСС Российские военные минувшей ночью нанесли массированный удар по предприятиям ВПК в Киеве, а также инфраструктуре военного аэродрома и нефтеперерабатывающему заводу, сообщило Минобороны России. Удар был нанесен в ответ «на террористические акты» ВСУ. В ходе атаки применялось высокоточное оружие большой дальности наземного базирования, гиперзвуковой комплекс «Кинжал», ударные беспилотники. Целью стали предприятия, разрабатывавшие и производившие беспилотники, FPV-дроны и прочие роботизированные мобильные комплексы, а также иную аппаратуру военного назначения. Также удар был нанесен по военному аэродрому и НПЗ. rbc.group «Цель удара достигнута. Все назначенные объекты поражены», — говорится в сообщении ведомства. rbc.group Минобороны России подчеркивает, что удары наносятся только по военным и энергетическим объектам Украины и связанной с ними инфраструктуре. Минобороны отчиталось об уничтожении трех британских ракет Storm Shadow Политика В ночь на 4 июля средства противовоздушной обороны (ПВО) уничтожили и перехватили 48 украинских беспилотников самолетного типа. Из них 26 было сбито над территорией Ростовской области,12 дронов — над Курской, шесть — над Белгородской, три — над Орловской и один — над территорией Липецкой области. В поселке Долотинка Миллеровского района Ростовской области в результате падения беспилотника, повредившего перекрытия жилого дома, погибла пожилая женщина. В Московской области в городе Сергиев Посад в результате удара украинских беспилотников была повреждена подстанция, без электричества остались микрорайоны Рабочий, Звездочка, Скобянка, Птицеградский и Клементьевский. Пострадали двое мужчин, угрозы жизни нет. Читайте РБК в Telegram.	5	\N	2025-07-04 13:15:02	2025-07-04 13:15:02
1210	3257	kreml-otreagiroval-na-nedovolstvo-trampa-posle-razgovora-s-putinym	Кремль отреагировал на недовольство Трампа после разговора с Путиным	https://s0.rbk.ru/v6_top_pics/media/img/7/62/347516237112627.jpeg	Владимир Путин и Дональд Трамп (Фото: Marcos Brindicci / Reuters) Российская сторона внимательно относится ко всем заявлениям американского президента Дональда Трампа, заявил пресс-секретарь главы государства Дмитрий Песков, передает корреспондент РБК. Так он прокоментировал слова Трампа, который заявил, что остался недоволен прошедшим разговором с Владимиром Путиным. По словам американского лидера, ему не удалось добиться «никакого прогресса» по Украине. «Безусловно, мы очень внимательно относимся ко всем заявлениям президента Трампа. В ходе разговора президент Путин повторил, что мы заинтересованы в том, чтобы достичь наших целей и предпочтительно сделать это политико-дипломатическими средствами, но пока это не представляется возможным, мы продолжаем нашу спецоперацию. Также президент информировал коллегу, что мы ожидаем согласование дат третьего раунда прямых переговоров», — сказал Песков. Материал дополняется	5	\N	2025-07-04 13:15:02	2025-07-04 13:15:02
1211	3264	minoborony-soobshchilo-o-zanyatii-sela-ryadom-s-konstantinovkoy	Минобороны сообщило о занятии села рядом с Константиновкой	https://s0.rbk.ru/v6_top_pics/media/img/1/76/347516221596761.jpeg	Российские подразделения продвинулись в ДНР Фото: сервис «Яндекс.Карты» Министерство обороны сообщило о взятии под контроль населенного пункта Предтечино в Донецкой Народной Республике. Это село расположено к востоку от города Константиновка и к югу от города Часов Яр. В конце мая на пути к нему российские подразделения заняли населенный пункт Ступочки. Материал дополняется	6	\N	2025-07-04 13:15:02	2025-07-04 13:15:02
1212	3276	varshava-soobshchila-o-povrezhdenii-konsulskogo-otdela-v-kieve	Варшава сообщила о повреждении консульского отдела в Киеве	https://s0.rbk.ru/v6_top_pics/media/img/2/30/347516228236302.jpeg	При ночной атаке повреждено здание консульского отдела польского посольства, пострадавших нет, заявил Сикорский. Минобороны утверждает, что целью удара были расположенные в Киеве предприятия военно-промышленного комплекса Радослав Сикорский (Фото: Clemens Bilan / EPA / ТАСС) Здание консульского отдела посольства Польши в Киеве повреждено в результате ночных ударов, заявил польский министр иностранных дел Радослав Сикорский в социальной сети Х. «Повреждено здание консульского отдела нашего посольства. Все живы и здоровы. Украине срочно нужны средства ПВО», — написал Сикорский. Он отметил, что обсудил произошедшее с послом Польши на Украине Петром Лукашевичем. Ночью на всей территории Украины, включая Киев, была объявлена воздушная тревога. Утром мэр украинской столицы Виталий Кличко сообщил, что повреждения зафиксированы в шести районах: Соломенском, Днепровском, Святошинском, Дарницком, Голосеевском и Шевченковском. rbc.group Минобороны сообщило о массированном ударе по предприятиям ВПК в Киеве Политика rbc.group Министерство защиты окружающей среды и природных ресурсов Украины сообщило, что в Киеве зафиксирован высокий уровень загрязненности воздуха. Причиной ухудшения обстановки ведомство назвало пожара. Радиационный фон в столице остается в норме, отметили в министерстве. В Минобороны позднее сообщили, что целью массированной атаки были расположенные в Киеве предприятия военно-промышленного комплекса, а также инфраструктура военного аэродрома и нефтеперерабатывающий завод. Удар был нанесен «в ответ на террористические акты ВСУ», подчеркнули в ведомстве. В ходе атаки применялось высокоточное оружие большой дальности наземного базирования, гиперзвуковой комплекс «Кинжал», ударные беспилотники. Читайте РБК в Telegram.	3	\N	2025-07-04 13:25:03	2025-07-04 13:25:03
1213	3304	vsu-nanesli-udar-po-zapadu-donecka	ВСУ нанесли удар по западу Донецка	https://s0.rbk.ru/v6_top_pics/media/img/9/27/347516255091279.jpeg	Фото: Nikoletta Stoyanova / Getty Images Украинские Вооруженные силы нанесли удар по поселку Трудовские на западе Донецка, сообщает ТАСС со ссылкой на источник в оперативных службах. По предварительной информации, есть погибшие, четыре человека ранены. «Четыре человека ранены в результате обстрела. Уточняется информация по погибшим, предварительно, они есть», — сказал собеседник агентства. Мэр Донецка Алексей Кулемзин сообщил, что под обстрелом находится Петровский район. «В Донецке громко! Будьте осторожны», — написал Кулемзин в телеграм-канале. Материал дополняется	9	\N	2025-07-04 14:05:01	2025-07-04 14:05:01
1214	3305	cb-obyasnil-ostanovku-torgov-akciyami-yugk-slovami-dat-rynku-uspokoitsya	ЦБ объяснил остановку торгов акциями ЮГК словами «дать рынку успокоиться»		ЦБ сделал предписание Мосбирже о приостановке торгов акциями ЮГК на фоне высокой волатильности. За два дня бумаги потеряли около 35% после обысков в офисах, а также иска Генпрокуратуры об изъятии доли мажоритария Южуралзолото UGLD -0,08% Фото: Михаил Гребенщиков / РБК Торги акциями «Южуралзолота» были приостановлены в связи с высокой волатильностью  , такая мера носит временный характер. Об этом сообщил зампред ЦБ Филипп Габуния в кулуарах Финансового конгресса, который проходит в Санкт-Петербурге. Его слова передает корреспондент «РБК Инвестиций». «В связи с ситуацией, когда возникла очень высокая волатильность на данной бумаге и потенциальные очень высокие потери, неоправданные для инвесторов, мы приняли решение временно приостановить торги данным инструментом, дабы дать рынку успокоиться. И будем смотреть за развитием ситуации», — отметил он. Ранее первый зампред Банка России Владимир Чистюхин в кулуарах Финансового конгресса говорил, что ЦБ не слышал о прямой угрозе акциям ЮГК, которыми владеют миноритарии, на фоне обысков в офисах, а также иска Генпрокуратуры об изъятии доли мажоритарного акционера. За два дня акции компании обвалились на 35%. rbc.group Мосбиржа приостановила торги акциями «Южуралзолота» Южуралзолото , Иск , Акции , Брокер Ранее крупные брокеры начали сообщать о полном или частичном ограничении торгов акциями «Южуралзолота», а 4 июля примерно с 10:30 мск Московская биржа  полностью приостановила торги акциями компании во всех режимах на основании предписания Банка России. Позднее торговая площадка установила запрет на короткие продажи по акциям и двум облигационным выпускам ЮГК: 001P-03 и 001P-04. Вслед за Мосбиржей СПБ Биржа перестала принимать заявки на сделки с бумагами «Южуралзолота» с 12:39 мск. Согласно данным терминала TradingView, последняя сделка с бумагами золотодобывающей компании была совершена 4 июля в 10:29 мск. Котировки замерли на отметке ₽0,4768 (-0,13% к закрытию предыдущей торговой сессии). Объем free-float компании ЮГК по состоянию на 4 июля составляет 10%, а капитализация на момент остановки торгов — ₽106,22 млрд. Объем торгов на Мосбирже до остановки торгов составлял ₽2,73 млрд. 3 июля Советский районный суд Челябинска одобрил ходатайство Генпрокуратуры об обеспечительных мерах по иску об обращении в доход государства доли основного владельца «Южуралзолота» Константина Струкова. Суть обеспечительных мер не раскрывалась. Аналитики «Ренессанс Капитала» в ежедневном обзоре обозначали три варианта дальнейшего развития событий: вариант 1: мажоритарная доля Струкова будет изъята в пользу Росимущества, а доли владения миноритариев компании не будут затронуты. Что касается доли ЗПИФа «Фиалка», здесь все будет зависеть от аффилиированности бенефициаров к Струкову — данная доля тоже может быть изъята, если будет доказано, что бенефициары ЗПИФа связаны с мажоритарным акционером; вариант 2: изъятие 100% акций ПАО «ЮГК» в пользу Росимущества с последующей денежной компенсацией миноритарным акционерам; вариант 3: изъятие 100% акций ПАО в пользу Росимущества без компенсации миноритарным акционерам, в случае если те не будут признаны «добросовестными приобретателями» актива. Изменчивость цены в определенный промежуток времени. Финансовый показатель в управлении финансовыми рисками. Характеризует тенденцию изменчивости цены – резкое падение или рост приводит к росту волатильности. Подробнее Регламентированный рынок, где встречаются продавцы и покупатели, торгующие различными активами: акциями, облигациями, валютой, фьючерсами, товарами. Стать участником торгов на бирже может каждый – для этого нужно открыть брокерский счет. Каждая сделка заключается по рыночной цене, совершается практически мгновенно, а также регистрируется и контролируется. Подробнее	2	\N	2025-07-04 14:05:02	2025-07-04 14:05:02
1217	3369	top-menedzhery-mestorozhdeniya-yugk-stali-figurantami-ugolovnogo-dela	Топ-менеджеры месторождения ЮГК стали фигурантами уголовного дела	https://s0.rbk.ru/v6_top_pics/media/img/6/11/347516293745116.jpeg	Офис компании «Южуралзолото» (Фото: Сергей Карпухин / ТАСС) В отношении топ-менеджеров Светлинского месторождения компании «Южуралзолото» (ПАО «Южуралзолото Группа Компаний», ЮГК) возбуждены уголовные дела, пишет ТАСС со ссылкой на правоохранительные органы. Экологический ущерб от структур «Южуралзолота» предварительно оценивается в 6 млрд руб. Как сообщили агентству источники, дела заведены в отношении директора горно-обогатительного комбината «Светлинский» Сергея Щелокова и начальника золотоизвлекательной фабрики «Светлинская» Дмитрия Бендика. Производитель вин Kacha Valley оказался фигурантом дела «Южуралзолота» Бизнес rbc.group Материал дополняется rbc.group Читайте РБК в Telegram.	4	\N	2025-07-04 14:45:03	2025-07-04 14:45:03
1218	3394	osvobozhdennye-iz-plena-rossiyskie-voennye-video	Освобожденные из плена российские военные. Видео		Video Российские военные после освобождения из украинского плена и обмена сели в автобусы. Это видно на кадрах, которые опубликовало Минобороны после окончания обмена с Украиной. Обмен происходит в Белоруссии. После обмена российских военных доставят в Россию для лечения и прохождения реабилитации. Вместе с военными в Россию вернулись два жителя Курской области, сообщал РБК источник в переговорной группе. Россия и Украина обменялись пленными Политика Читайте РБК в Telegram.	8	\N	2025-07-04 14:55:03	2025-07-04 14:55:03
1226	3546	u-eks-ministra-oborony-ukrainy-proshli-obyski-po-delu-o-zakupkah-dlya-vsu	У экс-министра обороны Украины прошли обыски по делу о закупках для ВСУ	https://s0.rbk.ru/v6_top_pics/media/img/1/97/347516315577971.jpeg	По данным источников «Зеркала недели», обыски были связаны с делом о закупке продуктов для ВСУ по завышенным ценам. Скандал разгорелся в январе 2023 года, на фоне него Резников ушел в отставку Алексей Резников (Фото: Matthias Schrader / AP / ТАСС) Национальное антикоррупционное бюро Украины (НАБУ) провело обыски у бывшего министра обороны страны Алексея Резникова, передает «Украинская правда» со ссылкой на источники. Также об обысках сообщает издание «Зеркало недели». По словам собеседников «Украинской правды», у Резникова при обыске «нашли левый телефон и еще что-то». Правоохранители изъяли у экс-министра некоторые значимые документы, пишет газета. Источники «Зеркала недели» не исключили, что мероприятия были связаны с делом о закупке продуктов для ВСУ по завышенным ценам. rbc.group Почему украинский министр обороны Резников подал в отставку Политика rbc.group В апреле в НАБУ заявляли, что Резников на тот момент не являлся подозреваемым в рамках этого производства, отмечает «Украинская правда». Резников возглавлял Минобороны Украины в 2021-2023 годах. За несколько месяцев до его отставки возник скандал из-за закупки продуктов для украинских военных по завышенным ценам. В январе 2023 года «Зеркало недели» опубликовало копии соглашений об организации питания воинских частей в шести украинских областях — исходя из них, Минобороны согласовало закупку продуктов по ценам в два-три раза выше, чем в розничной торговле в Киеве (например, в то время как в магазине куриные яйца стоили в среднем 7 грн за штуку (13 руб.), в контракте они шли по цене 17 грн (31,7 руб.). В украинском Минобороны тогда заявили, что СМИ распространяют «заведомо ложные сведения». Резников ошибки в обнародованном контракте признал, но также назвал расследование информационной атакой под надуманным предлогом. На фоне скандала ушел с поста замминистра обороны Вячеслав Шаповалов, отвечавший за материально-техническое обеспечение армии. Президент Украины Владимир Зеленский объявил о решении сменить главу Минобороны вечером 3 сентября 2023 года. Он объяснил, что ведомство нуждается «в новых подходах и других форматах взаимодействия как с военными, так и с обществом в целом». На место Резникова был назначен нынешний министр обороны Рустем Умеров. Власти России смену главы Минобороны Украины назвали внутренним делом страны. Читайте РБК в Telegram.	10	\N	2025-07-04 16:35:03	2025-07-04 16:35:03
1248	3968	kak-shkolniki-sdali-ege-i-po-kakim-predmetam-snizilsya-sredniy-ball	Как школьники сдали ЕГЭ и по каким предметам снизился средний балл	https://s0.rbk.ru/v6_top_pics/media/img/0/32/347518725240320.jpeg	РБК проанализировал результаты ЕГЭ по каждому предмету за последние четыре года. За это время средние баллы по естественно-научным предметам увеличились, а по гуманитарным снизились. Число стобальников резко сократилось Фото: Алексей Белкин / NEWS.ru / РБК По каким естественно-научным предметам упал или вырос средний балл Результаты Единого государственного экзамена в 2025 году не демонстрируют ни резкого падения, ни взлета по сравнению с предыдущими годами, заявил руководитель Федеральной службы по надзору в сфере образования и науки Анзор Музаев, на пресс-конференции по итогам экзамена. По данным Рособрнадзора, в этом году на 7% увеличилось количество школьников, которые сдавали экзамен по профильной математике и биологии, по физике число сдававших увеличилось на 13%, по информатике — на 5%. Также выросло и количество участников, получивших результат выше 60 баллов: по профильной математике такой результат получили более 60% от общего числа, по биологии — более 49%, по химии — больше 46%, по физике — больше 52%, а по информатике — более 44%. По мнению Музаева, это значит, что выросло и число молодых людей, готовых уверенно продолжить обучение в вузах по инженерным и IT специальностям, а также по направлениям естественных наук и медицине. rbc.group Глава Рособрнадзора утверждает, средние тестовые баллы по этой группе предметов демонстрируют стабильность или небольшой рост. При этом сократилась доля экзаменуемых, которые не смогли преодолеть минимальный порог по профильной математике — на 3%, биологии — на 1%, химии — на 1,7%, физике — на 1,6%. rbc.group Рособрнадзор отмечал, что в этом году вырос средний балл по химии с 56,8 до 58,2 одновременно с увеличением количества участников этого экзамена. В 2024 году их было 79,7 тыс. чел., а в 2025 году — 85,8 тыс. Как проанализировал РБК, тенденция увеличения среднего балла по химии наблюдается с 2022 года. Число выбравших этот предмет упало в 2023 году, но затем стало увеличиваться. В связи с этим Музаев также прогнозировал рост абитуриентов на инженерных и технических специальностях. По биологии средний балл остался примерно на том же уровне: 54,5 балла, в 2024 году он составлял 54,1. Это больше, чем двумя годами ранее, когда средний балл составлял 50,1 и 50,9. Количество человек, сдавших в этом году биологию, самое высокое за четыре года — 114,1 тыс. По физике увеличилось количество участников, но средний балл снизился по сравнению с прошлым годом: с 64,5 до 61,8. Это все равно больше, чем двумя годами ранее. В 2022 году средний балл составлял 50,1, а в 2023 — 50,9. Как сообщал Рособрндзор, результат более 60 баллов в этом году получили около 50 тыс. участников, что также на 2 тыс. больше прошлого года. Количество участников итогового экзамена по информатике стабильно растет, за четыре года оно выросло с 101,7 тыс. до 122,7 тыс. Средний балл в 2025 году немного выше — 55,9, но ниже, чем в 2022 и 2023 годах. Число, выбравших профильную математику, также заметно выросло и составило 305,8 тыс. чел. Это самый высокий показатель за последние четыре года. Средний балл при этом остался примерно на уровне 2024 года: 62,1 балл, а годом ранее — 62,6, но это заметно выше, чем двумя годами ранее. В связи с такими результатами Рособрнадзор прогнозировал увеличение числа желающих поступить на массовые инженерные программы и IT-специальности на 18 тыс. человек. В этом году школьники и их родители жаловались на высокую сложность заданий второй части профильной математики. Глава «Лиги безопасного интернета» Екатерина Мизулина сообщала, что ей поступает много писем по этому поводу. Школьники утверждали, что задания для Дальнего Востока были легче, чем в других регионах, что привело к снижению оценок в Москве и Санкт-Петербурге. Глава Рособрнадзора Музаев на пресс-конференции ответил, что претензии экзаменуемых к сложности заданий по математики поступают каждый год. Гуманитарные предметы: средний балл снизился по русскому, а история стала популярнее Среди гуманитарных предметов заметно увеличилось число выбравших ЕГЭ по истории с 74,3 тыс. до 82,9. Тестовый балл при этом остался на том же уровне — 55,9. В предыдущие три года количество участников и средний балл немного снижались. «С учетом роста количества выпускников, которые выбирают ЕГЭ по истории, провала не произошло, и если бы подготовка была на недостаточном уровне, мы бы увидели по среднему баллу», — указал РБК учитель истории и обществознания гимназии № 9 городского округа Химки Григорий Назаров. По его наблюдениям, ни структура экзамена, ни содержание задания с прошлого года не изменились: требуются знания по всем периодам отечественной истории, включая текущий период, в том числе об участниках военной операции на Украине. Требуется и разные навыки — комплексный анализ текста, навык определения исторических терминов, фиксации историко-географических объектов, выстраивания логических и причинно-следственных связей. В июне президент Владимир Путин поддержал предложение сделать ЕГЭ по истории обязательным для поступления в вуз на гуманитарные специальности. По словам Назарова, учителя готовы к такому массовому росту участников экзамена по истории. «Экзамен непростой, требует усердной подготовки и крепких знаний по всем периодам истории. Учителя истории в стране знакомы с экзаменом, знают, как готовить, кого готовить, какие акценты правильно расставить, как быстро идти в идеальный маршрут для каждого ребенка, который собирается сдавать ЕГЭ по истории», — сказал Назаров. По русскому языку средний балл снизился на три и составил 60,7. При этом число участников за год выросло с 612 тыс. до 638 тыс. человек. Рособрнадзор объяснят это изменениями, которые были внесены в экзамен в 2025 году, чтобы повысить его объективность и исключить возможность использования разного рода домашних заготовок. В частности, скорректировали формат сочинения, исключили возможность использования при аргументации примеры из комиксов, аниме, манги, компьютерных игр, повысили внимание к критерию грамотности в письменной речи. Член Общественного совета при Рособрнадзоре, преподаватель русского языка и литературы Роман Дощинский отметил, что предпринимаются меры по «объективизации экзамена», чтобы полученные баллы действительно отражали уровень знания русского языка, а не набирались интуитивно. «У экзамена должна быть дифференцирующая способность. Были сделаны шаги, направленные на то, чтобы баллы коррелировали с отметками, которые получает ученик в школе по этому предмету. В принципе, мы сейчас практически на такую корреляцию вышли. Можем констатировать, что условно на пятерку знает не так много, большинство знают на четверку», — пояснил он. К тому же, считает Дощинский, изменения среднего тестового балла, которые колеблются в пределах 10, статистически не значимы, то есть по ним нельзя сделать вывод о действительно высоком увеличении или снижении показателей. «Да, вроде как тенденция на снижение, но это тенденция в пределах 10 баллов. К тому же сигнал тревоги для нас тогда, когда, например, средний тестовый балл ниже 60. Вот если он был бы ниже этого значения, был бы повод для волнения. Но сейчас все в допустимых пределах», — пояснил эксперт. Самым популярным предметом по выбору осталось обществознание, но количество участников экзамена и средний балл с 2022 года постепенно снижаются. К примеру в 2022 году предмет сдали 276,8 тыс. человек, а в 2025 — 254,7 тыс. Средний балл за это время снизился с 59,9 до 53,6. В 2024 года он составлял 55,2. Снижение также прослеживается по английскому языку. В 2022 году его сдавали 87,3 тыс. чел., а в 2025 — 75,5 тыс. Наиболее высокий средний балл в рассматриваемом периоде был в 2022 году — 73,3. Он заметно снизился через год, тогда были внесены изменения в структуру заданий, а также в систему оценивания ЕГЭ по английскому. В 2025 году средний балл по предмету составил 64,1. По литературе средние баллы несколько лет держатся на одном уровне, но в 2025 году больше всего снизилось число участников с 42,6 тыс. до 37,7 тыс. человек. Дощинский отметил, что в этом году изменились правила набора на некоторые специальности, и литература исчезла из предметов, которые обязательны для сдачи, или ее можно заменить другим. По мнению эксперта, это тоже могло повлиять на число тех, кто решил сдавать литературу. В связи с этим, указал Дощинский, выпускники могли отдавать предпочтение, например, обществознанию, если можно предоставить результаты этого экзамена вместо ЕГЭ по литературе. По его словам, многие считают, что необходимый объем знания для ЕГЭ по обществознанию реально освоить за 10-11 классы, но с литературой в таком случае сложнее, потому что нужно перечитать большой объем текстов, начиная с 5 класса. «Дети перестают читать. Это однозначно, об этом говорят словесники, учителя, литература как учебный предмет имеет неустойчивую позицию в школе», — указал Дощинский. Наименее популярным предметом для сдачи ЕГЭ по-прежнему остается география, но ежегодно число сдающих увеличивается примерно на 1 тыс. человек. Наибольший средний балл за последний четыре года был в 2024 году — 56,3. В этом году он составил 54,9 балла, что сопоставимо с показателями 2022-2023 годов. Почему снизилось число стобалльников Количество стобалльников в 2025 году уменьшилось почти на 40% по сравнению с прошлым годом. Всего, по данным Рособрнадзора, их 6,8 тыс. человек, а в прошлом году было 9,5 тыс.  100 баллов по двум предметам получили 331 человек, 13 — по трем и одна выпускница из Москвы получила высший балл по четырем предметам (русский язык, профильная математика, физика и информатика). Дощинский уверен, что это также результат совершенствования экзамена, который становится более объективным. К тому же, отметил он, в последние годы количество стобалльников не является значимым показателем качества экзаменов для Рособрнадзора. Более значимый показатель — количество высокобалльников, которые набирают выше 80 баллов, считают в ведомстве. Также в 2025 году первые стобалльники появились в новых регионах — 11 человек. По информации Рособрнадзора, наивысший результат они показали по русскому языку, химии, физике, литературе, истории. Главное нововведение в ЕГЭ прошлого года — возможность для выпускников пересдать один из уже сданных предметов по выбору и использовать новый результат для поступления в вуз. В этом году данной возможностью воспользовались больше выпускников, чем в прошлом, сообщил Музаев. На пересдачи зарегистрировались 144,4 тыс. человек, они прошли 3 и 4 июля, а результаты будут готовы до 15 июля.	9	\N	2025-07-07 11:45:03	2025-07-07 11:45:03
1254	4037	v-rossiyskih-aeroportah-otmenili-bolee-190-reysov	В российских аэропортах отменили более 190 рейсов	https://s0.rbk.ru/v6_top_pics/media/img/4/37/347518824281374.jpeg	В Пулково отменили вылет 56 рейсов, включая 24 рейса в Москву. Прилететь в Санкт-Петербург не смогли пассажиры 38 рейсов. Больше всего отмен из столицы. Росавиация сообщила, что контролирует работу воздушного транспорта Фото: Александр Демьянчук / ТАСС В российских аэропортах 7 июля отменили более 190 рейсов, следует из данных онлайн-табло с 00.00. Речь идет об аэропорту Пулково в Санкт-Петербурге, Шереметьево, Домодедово, Внуково, Жуковский в Москве, а также об аэропортах в Сочи и Казани.  В Пулково отменили вылет 56 рейсов, включая 24 рейса в Москву. Прилететь в Санкт-Петербург не смогли пассажиры 38 рейсов. Больше всего отмен из столицы. В пресс-службе Пулково сообщили РБК, что за последние трое суток ограничения на прием и выпуск самолетов вводили пять раз, последние длились восемь часов. Меры принимали по независящим от аэропорта причинам, отметили там. rbc.group Очевидцы рассказали о хаосе в аэропортах из-за ситуации в Пулково Общество rbc.group В Шереметьево отменили на вылет и прилет в общей сложности более 65 рейсов, в то время как из Домодедово не смог вылететь только один самолет. Отмены рейсов затронули и другие российские города. Так, в Сочи отменили 5 рейсов на вылет и прилет, а в Казани — 13. В аэропорту Сочи сообщили РБК, что в течение 7 июля «авиакомпании будут стабилизировать расписание полетов» в связи с ограничениями в Поволжье, Москве и Петербурге. «Возможны вынужденные переносы, отмены или объединения некоторых рейсов, о чем авиакомпании своевременно информируют пассажиров», — отметили там, добавив, что в сочинском аэропорту скоплений пассажиров сейчас нет. К утру 7 июля сложности с авиарейсами из и в Санкт-Петербург по-прежнему сохранились из-за введенных ранее ограничений в использовании воздушного пространства, жаловались пассажиры. В Росавиации назвали число рейсов, которые еще задерживаются Политика Один из очевидцев в Пулково рассказал РБК, что в петербургском аэропорту «люди спят и сидят на полу». Его рейс на Пхукет SU628 изначально должен был вылететь в воскресенье, 6 июля, в 19:25. По словам пассажира, сейчас на табло указано, что вылет назначен на 9:30 7 июля, но регистрация так и не началась, при этом на борту должно быть 300 человек.  Росавиация сообщила, что вместе с Минтрансом контролирует работу воздушного транспорта, «ситуация полностью управляема и нормализуется». По данным ведомства, с 5 июля задержали 1,9 тыс. рейсов на вылет и прилет, 485 отменили, 88 ушло на запасные аэродромы. Было оформлено 43 тыс. вынужденных возвратов билетов. Читайте РБК в Telegram.	6	\N	2025-07-07 13:05:02	2025-07-07 13:05:02
1219	3410	moskva-i-kiev-proveli-sanitarnyy-obmen-ranenymi	Москва и Киев провели «санитарный обмен» ранеными		В рамках достигнутых в Стамбуле договоренностей Москва и Киев провели в пятницу, 4 июля, санитарный обмен ранеными с линии фронта, сообщил РБК источник российской переговорной группе. «Сегодня также состоялся очередной этап бессрочных санитарных обменов ранеными», — сказал собеседник. О начале таких обменов сообщил 12 июня помощник президента России Владимир Мединский, который возглавляет российскую делегацию на переговорах с Украиной. Россия и Украина обменялись пленными Политика Ранее сегодня стало известно, что Россия и Украина провели очередной паритетный обмен пленными. С российской стороны об этом сообщили Минобороны и представитель парламентской координационной группы по вопросам военной операции, депутат Госдумы Шамсаил Саралиев, с украинской — президент Украины Владимир Зеленский и украинский координационный штаб. rbc.group Video Стороны, как и в прошлый обмен 26 июня, не раскрыли число возвращенных людей. Наряду с военными Россия вернула из Украины двух плененных жителей Курской области, уточнил РБК источник в переговорной группе. Во время переговоров в Стамбуле 2 июня Москва и Киев договорились обменяться в формате «всех на всех» ранеными, тяжелобольными, а также лицами моложе 25 лет. Читайте РБК в Telegram.	4	\N	2025-07-04 15:05:01	2025-07-04 15:05:01
1220	3420	sud-vynes-prigovor-eks-zamglavy-mchs-iz-za-trehkomnatnoy-kvartiry	Суд вынес приговор экс-замглавы МЧС из-за трехкомнатной квартиры	https://s0.rbk.ru/v6_top_pics/media/img/1/25/347516289699251.jpeg	Суд пришел к выводу, что экс-замминистра подделал документы на получение квартиры Павел Барышев (Фото: РИА Новости) Экс-замглавы МЧС Павел Барышев приговорен к трем годам колонии за мошенничество в крупном размере, сообщили в СКР. Ему также назначен штраф в размере 200 тыс. руб. По данным следствия, 2017–2019 годах Барышев подделал документы о наличии у него права на обеспечение жилым помещением, благодаря чему получил трехкомнатную квартиру в Московской области. Таким образом, Барышев причинил ущерб государству в особо крупном размере, отметили в СКР. Против экс-замглавы МЧС Павла Барышева завели дело о мошенничестве Общество rbc.group О возбуждении уголовного дела, фигурантом которого является Барышев, стало известно в сентябре 2024 года. Согласно его декларации о доходах, на тот момент он владел земельным участком на 1,5 тыс. кв. м и квартирой площадью 91,3 кв. м, а также гаражом. Его годовой доход превысил 8,6 млн руб. У жены Барышева в собственности тогда находились две квартиры — площадью 137,8 и 110 кв. м, а также автомобиль Mercedes-Benz GLE 300. Она отчиталась о годовом доходе в 499,3 тыс. руб. rbc.group Барышев был назначен заместителем министра по делам гражданской обороны в феврале 2017 года указом президента. До этого он занимал пост начальника Академии гражданской защиты МЧС. Президент России Владимир Путин освободил Барышева от должности в мае 2021 года. Причина отставки в указе не была названа. Впоследствии он был назначен на должность замминистра природных ресурсов. С этой должности он был уволен 19 июня этого года указом премьера Михаила Мишустина «в связи с выходом на пенсию». Читайте РБК в Telegram.	1	\N	2025-07-04 15:15:02	2025-07-04 15:15:02
1221	3460	pavlyuchenkova-pobedila-byvshuyu-pervuyu-raketku-mira-na-uimbldone	Павлюченкова победила бывшую первую ракетку мира на Уимблдоне	https://s0.rbk.ru/v6_top_pics/media/img/0/57/347516271292570.jpeg	Российская теннисистка победила в третьем круге японку Наоми Осаку, которая сейчас занимает 53-е место в рейтинге WTA Анастасия Павлюченкова (Фото: Hannah Peters / Getty Images) Российская теннисистка Анастасия Павлюченкова вышла в 1/8 финала Уимблдона, третьего в сезоне турнира «Большого шлема». В третьем круге 34-летняя россиянка победила японку Наоми Осаку, 53-ю ракетку мира, со счетом 3:6, 6:4, 6:4. Следующей соперницей Павлюченковой будет Диан Парри (Франция, 118-й номер рейтинга WTA) или Сонай Картал (Великобритания, 51). rbc.group Павлюченкова занимает 50-е место в рейтинге WTA (восьмая из россиянок). На счету бывшей 11-й ракетки мира 12 титулов WTA. Второй раз в карьере Павлюченкова дошла на Уимблдоне до четвертого круга. В 2016 году она играла в 1/4 финала. rbc.group 27-летняя Осака, бывшая первая ракетка мира, на Уимблдоне никогда не проходила дальше третьего круга. Уимблдон завершится 13 июля. Общий призовой фонд турнира составляет £53,55 млн. Обсудите новость в телеграм-канале «РБК Спорт».	4	\N	2025-07-04 15:35:01	2025-07-04 15:35:01
1222	3465	v-chehii-proizoshel-blekaut	В Чехии произошел блэкаут		По всей стране приостановлено движение поездов, больницы перешли на резервные источники питания. Полиция ведет расследование причин блэкаута и подчеркивает, что пока данных, свидетельствующих о том, что это кибератака, нет. Video В Чехии произошло масштабное отключение электроэнергии, сообщает Novinky. Неисправность возникла в магистральной сети линий сверхвысокого напряжения компании ČEPS, которая обеспечивает передачу электроэнергии на подстанции по всей территории страны. Полиция усилила патрулирование. Приостановлено движение поездов, пожарные в некоторых районах выезжают на помощь людям, застрявшим в лифтах. Больницы работают на резервных источниках питания. Блэкаут также затронул работу метро, но позже поезда возобновили движение в штатном режиме. Прага, Чехия(Фото: CTK / Reuters)Прага, Чехия(Фото: CTK / Reuters)Усти-над-Лабем, Чехия(Фото: CTK / Reuters)Прага, Чехия(Фото: CTK / Reuters)Прага, Чехия(Фото: CTK / Reuters) По данным ČEPS, отключение затронуло пять регионов и часть Праги. rbc.group В полиции заявили, что пока не располагают информацией о том, что за масштабным отключением электроэнергии в Чешской Республике может стоять кибератака или террористическая атака. По данным электрораспределительной компании PRE, подача электроэнергии в Праге начнет восстанавливаться с 14:00 (15:00 мск). В апреле масштабное отключение электричества произошло в Испании. Сбой в работе электросетей парализовал работу общественного транспорта, светофоров и телефонной связи на полуострове, а движение поездов было практически остановлено. Национальный суд Испании ведет расследование блэкаута. Одна из версий — кибератака. Данные расследования засекретили.	3	\N	2025-07-04 15:45:03	2025-07-04 15:45:03
1223	3474	kak-v-chehii-vstali-poezda-metro-i-tramvai-iz-za-blekauta	Как в Чехии встали поезда метро и трамваи из-за блэкаута		Video В Чехии произошло крупное отключение электроэнергии, причиной которого стала авария в магистральной сети сверхвысокого напряжения компании ČEPS, отвечающей за передачу электроэнергии по всей стране. Без света остались пять регионов и часть Праги. В результате сбоя было приостановлено движение поездов, временно не работало метро, а также возникли перебои в работе трамваев и троллейбусов. Пожарные оказывали помощь людям, застрявшим в лифтах, а больницы перешли на резервные источники питания. Полиция усилила патрулирование улиц. Прага, Чехия(Фото: CTK / Reuters)Прага, Чехия(Фото: CTK / Reuters)Усти-над-Лабем, Чехия(Фото: CTK / Reuters)Прага, Чехия(Фото: CTK / Reuters)Прага, Чехия(Фото: CTK / Reuters) Власти сообщили, что пока нет данных о возможной кибератаке или террористическом характере произошедшего. По информации электрораспределительной компании PRE, восстановление электроснабжения в Праге началось с 14:00 по местному времени. Причины аварии расследуются, энергетики работают над устранением последствий. В Чехии произошел блэкаут Общество rbc.group Читайте РБК в Telegram.	7	\N	2025-07-04 15:45:03	2025-07-04 15:45:03
1234	3624	mechel-pochti-na-chetvert-sokratil-dobychu-uglya-iz-za-ogranicheniya-sprosa	«Мечел» почти на четверть сократил добычу угля из-за ограничения спроса	https://s0.rbk.ru/v6_top_pics/media/img/0/32/347516328457320.jpeg	«Мечел» снизил добычу угля на 24% за первые пять месяцев 2025 года из-за неблагоприятной конъюнктуры рынка и низких цен на твердое топливо. Развернуть негативный тренд помогут только крупные инфраструктурные проекты «Мечел» MTLR ₽88,53 -1,94% Купить Фото: Артем Геодакян / ТАСС В январе-мае 2025 года добыча угля «Мечелом» упала на 24% по отношению к аналогичному периоду прошлого года, до 3,3 млн т: в частности «Якутугля» на 490 тыс. т, до 1,6 млн т, «Южного Кузбасса» — на 570 тыс. т, до 1,7 млн т, следует из соответствующего обзора Argus, который есть в распоряжении РБК. В конце июня, на тот момент гендиректор «Мечела» Олег Коржов говорил, что финансовое положение компании осложнено снижением цен на уголь. По его словам, котировки на сырье достигли минимума (по данным Центра ценовых индексов (ЦЦИ), они на 31% ниже в сравнении с аналогичным периодом 2024-го, на 30 июня стоимость тонны марки ГЖ составляла $97 на базисе FOB Дальний Восток), и меньше «быть уже не могут». Повышения спроса на твердое топливо в Китае «ждать не приходится» в силу уменьшения объемов выплавки чугуна и стали (за пять месяцев оно оценивается в 1,7%, до 431,6 млн т, по данным NEFT Research) — загрузка мощностей предприятий находится на уровне 85%, при этом внутренняя добыча растет. На рынок также давит действие импортных пошлин (они составляют 3-6% в зависимости от типа угля. — РБК), распространяющихся в том числе на российский уголь, и перспектив их отмены нет. «На этом фоне где-то порядка 20% мировых угольных компаний убыточны», — заключил Коржов. rbc.group В результате «Мечел» оптимизирует производство и инвестиции, по итогам 2025 года топ-менеджер прогнозировал снижение отгрузки продукции в размере 25% в пессимистичном сценарии, отмечая, что сейчас производство нерентабельных сейчас марок угля уже существенно сокращено. На «Якутугле» компания не планировала существенно снижать объемы добычи, не более чем на 10-15%, но пожар, произошедший на угольном складе на фабрике «Нерюнгринская» привел к большему сокращению производства. В «Мечеле» рассчитывают запустить предприятие в октябре. rbc.group «Мечел» раскрыл детали антикризисной программы на фоне проблем угольщиков Бизнес При этом Коржов полагает, что снижение объемов производства приведет к повышению цен в третьем-четвертом квартале текущего года. «Плюс ставка, плюс курс доллара. <...> Я не думаю, что дальше будут цены снижаться, они сегодня и так находятся на достаточно серьезном минимуме с точки зрения затрат», — добавил топ-менеджер. Как реализуется коксующийся уголь Экспорт коксующегося угля за январь—май 2025 года снизился на 18% год к году, составив 15,8 млн т, следует из данных ЦЦИ. К этому привели высокие логистические издержки и переизбыток запасов в Китае, которые давят на цены, сокращая рентабельность экспорта (по оценке NEFT Research, сейчас он убыточен во всех направлениях либо «балансирует на грани рентабельности» — от 100 до 1,2 тыс. руб. за тонну), что вынуждает ряд российских компаний сокращать добычу и накапливать складские запасы. Китай стремится нарастить собственную добычу коксующегося угля для снижения зависимости от импорта, говорит Данил Удачин, аналитик ЦЦИ. При этом металлургические компании увеличивают поставки из Монголии за счет выгодной логистики и низких цен. Они также ищут новые рынки сбыта в Азии и Африке из-за ограничений на экспорт стали в ЕС (осенью прошлого года европейские металлурги призвали властей замедлить импорт для защиты внутреннего рынка, в итоге ЕС ввел ряд торговых ограничений) и США (с июня 2025 года действуют 50-процентные пошлины на ввоз всей стали и алюминия). Кризис на китайском рынке недвижимости, сохраняющийся с 2021 года, в свою очередь, продолжает сдерживать потребление стали и цемента. Трамп в два раза повысил пошлины на сталь и алюминий Политика В то же время, отмечает Александр Котов, партнер по консалтингу NEFT Research, ресурсная база металлургического угля в Китае не очень высока, кроме того, у предприятий есть «технологическая привязка» оборудования металлургических комбинатов к российскому коксующемуся углю — он подходит по спецификации. Индийские сталелитейные заводы также не нуждаются в дополнительных объемах угля в ближайшие пару месяцев, кроме того, спрос снижается из-за сезона муссонов, указывает Котов. В Европе производство на этом фоне снизилось на 3,1% в мае по отношению к аналогичному периоду прошлого года, до 11,4 млн т. Ситуацию в Индии также усугубляет сохраняющаяся неопределенность в отношении квот на импорт кокса, что сдерживает закупочную активность. «Цены на премиальный коксующийся уголь в Азии снижались из-за слабого спроса, вызванного неопределенностью с квотами на импорт кокса в Индии и приближением сезона муссонов», — рассказывает Котов. По его прогнозу, тренд останется негативным в ближайшие месяцы, развернут его может только реализации масштабных строительных проектов. РБК направил запрос в пресс-службу «Мечела». Читайте РБК в Telegram.	6	\N	2025-07-07 07:55:03	2025-07-07 07:55:03
1236	3626	burberry-prodlil-arendu-ofisa-v-centre-moskvy-na-fone-zakrytiya-butikov	Burberry продлил аренду офиса в центре Москвы на фоне закрытия бутиков	https://s0.rbk.ru/v6_top_pics/media/img/5/97/347515692523975.jpeg	Burberry, окончательно закрывший все свои магазины в России, продлил договор аренды офиса на Петровке. Теперь соглашение с владельцем объекта будет действовать до 2027 года, хотя изначально завершалось в августе этого года Фото: Сергей Бобылев / ТАСС Британский модный дом Burberry, три года назад временно приостановивший работу своих бутиков в России, а затем закрывший их окончательно, продлил договор аренды офиса на Петровке,16 в центре Москвы. Об этом говорится в пояснениях к бухгалтерской отчетности российской «дочки» компании за 2023 и 2024 годы, которые изучил РБК. Из документов следует, что изначально соглашение между компанией и собственником объекта действовало до конца августа 2025-го, но впоследствии оно было пролонгировано до марта 2027 года. Площадь занимаемых ретейлером помещений за год не изменилась — она все также составляет 153 кв. м. РБК направил запрос в Burberry. Получить комментарий собственника здания на Петровке не удалось. Что происходит с бутиками Burberry в России rbc.group В марте 2022 года Burberry следом за Louis Vuitton, Hermès, Chanel, Prada и другими люксовыми брендами временно закрыл свои бутики в России — модный дом, как утверждала The Guardian, сделал это одним из последних. Всего у Burberry, по данным издания, было в стране три магазина. В прошлом году свою работу окончательно прекратил магазин модного дома в ГУМе на Красной площади, следует из материалов бухгалтерской отчетности. Бутик с люксовой одеждой и аксессуарами был открыт еще в 2004 году и стал для компании вторым пространством в России. Сперва он занимал в торговом комплексе порядка 170 кв. м, но затем его площадь была увеличена примерно до 1 тыс. кв. м. Дизайн пространства напоминал оригинальную архитектору ГУМа, включая крестовые своды и деревянную отделку стен. С 2019 года оно считалось флагманским магазином британского ретейлера в России. rbc.group Что происходит с Cartier и Tiffany в России после закрытия бутиков Бизнес На момент ухода из ГУМа компания арендовала в нем помещение на 621 кв. м. Изначально договор между сторонами действовал до 26 сентября 2023 года, но затем было пролонгирован до середины августа 2024-го. После этого британская компания уже не стала возобновлять соглашение, сказано в материалах отчетности. Помимо магазина в ГУМе у Burberry также окончательно закрылись пространства в Сrocus City Mall в Красногорске и в торговом центре «Времена года» на Кутузовском проспекте. Первый бутик был закрыт в 2022 году, второй — в 2023 году. Соглашения по аренде этих помещений компания не продлевала. Чем известен модный дом Burberry — один из старейших британских домов моды, который был основан в 1856 году бывшим помощником продавца тканей Томасом Берберри. Он считал, что одежда должна защищать людей от британской погоды, и руководствовался этим принципом в работе. В 1879 году Берберри изобрел габардин — прочный и непромокаемый материал, который использовался для пошива верхней одежды. А спустя 12 лет он выпустил офицерский плащ Tielocken Coat, который стал прототипом современного тренча Burberry. В XX веке компания активно сотрудничала с британской армией — во время Первой мировой войны она стала поставлять габардиновые плащи для королевского корпуса. Впоследствии Burberry также стал выпускать пальто для конной полиции, лыжные костюмы, мотоциклетные куртки и костюмы для авиаторов. А в 1955 году модный дом получил королевский патент от королевы Елизаветы II и стал эксклюзивным поставщиком одежды для королевского двора. Его одежда была востребована у политиков и писателей — в тренче Burberry появлялись Уинстон Черчилль, Рональд Рейган, Бернард Шоу, Артур Конан Дойль и Сомерсет Моэм. Ее можно было видеть и в фильмах, например, в «Касабланке» с Хамфри Богартом и «Завтраке у Tiffany» с Одри Хепберн. Сейчас Burberry выпускает женскую, мужскую и детскую одежду, парфюмерию и косметику, аксессуары и украшения. Компания публичная, ее акции торгуются на Лондонской фондовой бирже, а среди акционеров — инвестфонды и управляющие ими компании, в том числе Lindsell Train Ltd (6,1%), Schroder Investment Management Ltd (5,4%), The Vanguard Group (4,3%) и другие. Но в последние годы результаты культового британского бренда не слишком радовали инвесторов. Остановить падение продаж модный дом пытался еще в середине 2010-х годов: тогда перед его руководством была поставлена задача превратить Burberry в «супер-люксовый бренд» уровня Gucci и Dior с более высокими ценами и маржинальностью, писала The Guardian. Позиционирование бренда и коллекции, выпущенные под руководством креативного директора Рикардо Тиши, стали более современными, но это создавало риск оттолкнуть историческую аудиторию бренда, состоявшую из более консервативных потребителей. Кроме того, основной рынок для Burberry — Китай, поэтому бренд сильно пострадал из-за локдауна во время пандемии, последующего снижения спроса на предметы роскоши и медленного восстановления экономики в Китае. Burberry впервые за 20 лет сменила логотип Бизнес В 2022 году Burberry сменила креативного директора — этот пост занял Дэниел Ли, до этого возродивший люксовый бренд Bottega Veneta, который специализируется на суммках и других изделиях из кожи ручной работы. Он сделал ставку на возвращение к «британскому наследию» Burberry, которое отличало его от других люксовых марок, и увеличение продаж аксессуаров, в том числе кожаных сумок. По итогам 2021/2022 финансового года (завершился 2 апреля того года) выручка модного дома превысила уровень, который был до пандемии, достигнув £2,8 млрд. Увеличение выручки наблюдалось и в следующем финансовом году (до £3 млрд). Но удержать этот рост не удалось — уже по итогам года, завершившегося в апреле 2024-го, продажи пошли на спад. В июле компания сообщила о падении квартальных продаж на 20% и отставке генерального директора Джонатана Акройда, а уже в сентябре Burberry выбыла из индекса крупнейших компаний Великобритании FTSE 100, где находилась с 2009 года. Причиной стало сильное снижение капитализации, вызванное длительным падением продаж. По итогам последнего финансового года (он завершился в конце марта 2025-го) выручка компании снизилась на 17% — до £2,46 млрд (против £2,96 млрд за предыдущий годовой период). Операционный убыток достиг £3 млн, в то время как годом ранее компания вышла на прибыль в £418 млн. В ноябре 2024-го новый гендиректор Джошуа Шульман представил обновленную стратегию Burberry. Компания планирует вновь сосредоточиться на своих основных моделях — тренчах и шарфах, а также будет менее амбициозна в отношении цен на сумки и обувь. Также в мае этого года стало известно о планах Burberry по увольнению 1,7 тыс. сотрудников. Акции Burberry выросли на 15% после объявления плана реструктуризации Инвестиции Как российская «дочка» бренда закончила год Burberry пришел в Россию в 2004 году — именно тогда здесь открылся его первый монобрендовый магазин. Изначально компания развивалась здесь по франчайзингу в партнерстве с группой «Джамилько», которая и помогла ей выйти на этот рынок. Но в 2014 году она приняла решение перейти к прямой модели управления и зарегистрировала здесь собственную дочернюю компанию. С тех пор британский модный дом развивался в России самостоятельно и открыл несколько магазинов. В 2024 году выручка британского модного дома в России составила 65,2 млн руб. (-62,4% год к году). Чистый убыток компании за этот период снизился на 74,5% — с 437,8 до 111,6 млн руб. Для сравнения: в 2019 году выручка бренда оценивалась в 931 млн руб., а чистая прибыль — в 5,9 млн руб. Что говорят эксперты Соглашения об аренде в основном продлевают для тех мест, которые стратегически важны для бренда, будь то офис или флагманский магазин, рассуждает директор подразделения представления интересов арендаторов CORE.XP Евгений Домашенко. Если же точка не столь значима, а условия договора позволяют выйти без серьезных финансовых потерь, то его расторгают досрочно, отмечает он. В остальных ситуациях, по его словам, зарубежные люксовые бренды просто дожидаются окончания срока аренды. В случае, если офис компании имеет небольшую площадь, как, например, у Burberry, расходы на его содержание не оказывают существенного влияния на общий бюджет, указывает партнер и директор департамента офисной недвижимости NF Group Мария Зимина. В такой ситуации сохранить площади и продлить аренду оказывается проще и экономически целесообразнее, чем впоследствии искать новое помещение при возвращении на рынок, полагает она. Это позволяет бренду сохранить символическое присутствие и приоткрытую «дверь» на российский рынок, говорит эксперт. Из отчетностей «дочек» зарубежных люксовых брендов следует, что они не часто продлевают подписанные ранее соглашения по аренде. Так, Dior в прошлом году отказался от 5 магазинов — теперь у французского модного дома остается лишь 4 бутика в России. А итальянская Prada Group приняла решение закрыть все подразделения, зарегистрированные в ЦУМе. Кроме того, он не продлил аренду магазина для бренда Miu Miu (входит в Prada Group), расположенного в Столешниковом переулке. Французский дом Hermès, в свою очередь, полностью ушел из торгового центра «Времена года», а также бизнес-центре в Нижнем Кисельном переулке. Читайте РБК в Telegram.	2	\N	2025-07-07 07:55:03	2025-07-07 07:55:03
1225	3507	kadyrov-obratilsya-k-nedobrozhelatelyam-iz-za-sluhov-o-smerti	Кадыров обратился к недоброжелателям из-за слухов о смерти	https://s0.rbk.ru/v6_top_pics/media/img/6/74/347516340446746.jpeg	В Чечне построена система управления, которая позволяет не проводить постоянно совещания, заявил Рамзан Кадыров. Он ответил тем, кто пишет «дешевые вещи» — если человек не идет на совещание, то не значит, что он «при смерти». Рамзан Кадыров (Фото: Григорий Сысоев / ТАСС) Если человек не идет и не проводит совещание, это не значит, что он «при смерти или уже умер». Об этом заявил на совещании с членами регионального правительства глава Чечни Рамзан Кадыров, видео оттуда он опубликовал в своем Telegram-канале (цитата по «РИА Новости»). По словам Кадырова, каждый день не нужно проводить совещания, потому что «система хорошо поставлена». «Достаточно позвать к себе или позвонить, дать любое поручение — вот такая система у нас», — сказал Кадыров. «Обращаюсь к тем, кто пишет дешевые вещи — мы живы... Наша идеология — это путь нашего первого президента, и ни на секунду мы не сворачивали с этого пути», — добавил Кадыров. rbc.group Кадыров опубликовал видео с размышлениями о болезни, жизни и смерти Общество rbc.group В мае Кадыров опубликовал видео с размышлениями о болезни, жизни и смерти. Там он сказал, что «все чаще слышу сплетни о моей болезни — мол, я умираю, мне осталось немного». В ответ он сказал, что это путь каждого человека, а «если мне суждено прожить 50, 60 или 70 лет, я их проживу, как предписано, и никто не отнимет ни дня». Также он добавил, что «вы как были сплетниками без мужества, прячущимися, словно мыши, за границей, так и остались, это ваша сущность», — говорит закадровый голос. На записи был показан Кадыров, который движется на фоне старинной башни. Кадырову 48 лет. Глава Чечни и его окружение неоднократно опровергали данные об ухудшении его здоровья. В 2023-м он опубликовал видео своей прогулки в Грозном и посоветовал тем, «кто в интернете не может отличить правду от лжи, прогуляться на свежем воздухе, привести мысли в порядок». Читайте РБК в Telegram.	4	\N	2025-07-04 16:15:05	2025-07-04 16:15:05
1227	3552	rossiya-i-ukraina-obmenyalis-plennymi	Россия и Украина обменялись пленными	https://s0.rbk.ru/v6_top_pics/media/img/6/46/347516239949466.jpeg	Число военнопленных, которых обменяли сегодня, не раскрывали ни российская, ни украинская стороны. В Кремле утверждали, что после завершения всех обменов будет согласована дата третьего раунда переговоров Фото: ТАСС Россия вернула еще одну группу военных по договоренностям в Стамбуле, взамен передана группа пленных ВСУ, сообщает Минобороны. Информацию об обмене РБК также сообщил представитель парламентской координационной группы по вопросам военной операции, депутат Госдумы Шамсаил Саралиев. Сейчас российские военные находятся в Белоруссии, где им оказывается необходимая помощь. Позднее их доставят в Россию для лечения в медицинских учреждениях Минобороны. Video Факт обмена также подтвердил президент Украины Владимир Зеленский. По его словам, среди вернувшихся — военнослужащие и гражданские лица, большинство из них находились в плену с 2022 года. Как уточнили в украинском координационном штабе, речь идет о раненых, тяжелобольных и лицах младше 25 лет. «Точное количество освобожденных лиц будет объявлено после завершения всех этапов обмена. Сегодняшний этап обмена состоялся при участии главы координационного штаба, начальника Главного управления разведки Минобороны Украины, генерал-лейтенанта Кирилла Буданова», — говорится в сообщении штаба. rbc.group Число обменянных пленных не раскрыла и российская сторона. Источник РБК в переговорной группе сообщил, что Россия в том числе вернула двух жителей Курской области. «Сегодня также состоялся очередной этап бессрочных санитарных обменов ранеными», — добавил он. Последний раз Россия и Украина обменялись пленными 26 июня. «Обмен пленными был паритетный. Работа продолжается», — говорил РБК тогда источник в переговорной группе. Стороны также не называли количество обменянных лиц. Россия и Украина провели новый этап обмена пленными Политика Об обмене пленными стороны договорились в начале июня во время переговоров в Стамбуле. С тех пор они провели несколько этапов обмена. После завершения этого процесса будет согласована дата третьего раунда переговоров России и Украины, сообщали в Кремле. По словам президента Владимира Путина, стороны планировали встретиться после 22 июня. Читайте РБК в Telegram.	4	\N	2025-07-04 16:45:01	2025-07-04 16:45:01
1228	3568	glavu-azerbaydzhanskoy-diaspory-podmoskovya-deportiruyut-iz-rossii	Главу азербайджанской диаспоры Подмосковья депортируют из России	https://s0.rbk.ru/v6_top_pics/media/img/4/19/347516368060194.jpeg	Эльшан Ибрагимов (Фото: Региональная национально-культурная автономия азербайджанцев Московской области) Главу азербайджанской диаспоры Подмосковья Эльшана Ибрагимова лишили гражданства России. Об этом он сообщил изданию Oxu.az, отметив, что через несколько дней приедет в Азербайджан и даст комментарий. Как рассказал источник РБК, Ибрагимова лишили гражданства 18 июня за «совершение действий, создающих угрозу национальной безопасности Российской Федерации». После новостей о лишении гражданства c сайта Общественной палаты Подмосковья удалили упоминание про Эльшана Ибрагимова в качестве члена Консультативного совета по делам национально-культурных автономий Московской области. rbc.group РБК обратился за комментарием к Эльшану Ибрагимову. rbc.group Накануне в столице был задержан азербайджанский авторитет Вагиф Сулейманов (Вагиф Бакинский). По данным «Коммерсанта», поводом стало нарушение правил пребывания в России. Сулейманова доставили в спецприемник миграционного центра в Сахарово, там он будет содержаться три месяца, после чего его депортируют в Азербайджан. В Оренбурге арестовали азербайджанского авторитета Заура Нахичеванского Политика Материал дополняется.	8	\N	2025-07-04 16:55:03	2025-07-04 16:55:03
1229	3584	ofis-zelenskogo-soobshchil-o-vazhnom-razgovore-prezidentov	Офис Зеленского сообщил о «важном разговоре президентов»	https://s0.rbk.ru/v6_top_pics/media/img/8/68/347516374228688.jpeg	Владимир Зеленский (Фото: Suzanne Plunkett / Getty Images) Президент Украины Владимир Зеленский провел «важный и содержательный» разговор со своим коллегой, сообщил глава его офиса Андрей Ермак в телеграм-канале. «Суспiльне» и «РБК-Украина» пишут, что Зеленский говорил с президентом США Дональдом Трампом. «Очень важный и содержательный разговор между Президентами», — написал Ермак, пообещав рассказать о деталях позднее. Кремль отреагировал на недовольство Трампа после разговора с Путиным Политика rbc.group Накануне, 3 июля, Трамп провел телефонные переговоры с российским президентом Владимиром Путиным. Разговор политиков стал шестым с момента вступления Трампа в должность на второй срок. rbc.group Как рассказал помощник российского президента Юрий Ушаков, Трамп призвал к скорейшему прекращению боевых действий на Украине. В ответ Путин заявил о приверженности политическому решению конфликта, но подчеркнул, что Россия не откажется от своих целей. Материал дополняется Читайте РБК в Telegram.	10	\N	2025-07-04 17:05:01	2025-07-04 17:05:01
1230	3615	economist-rasskazal-ob-usilenii-raskola-na-ukraine-vo-glave-s-ermakom	Economist рассказал об усилении раскола на Украине во главе с Ермаком	https://s0.rbk.ru/v6_top_pics/media/img/6/89/347518617282896.jpeg	Economist упоминает коррупционный скандал, фигурантом которого стал вице-премьер Алексей Чернышов, и попытки сменить на посту премьера Дениса Шмыгаля, за которыми, по словам собеседников, стоит глава офиса Зеленского Владимир Зеленский (Фото: Drew Angerer / Getty Images) На фоне приостановки поставок американского оружия не менее тревожным выглядят внутриполитический раскол, чистки и внутренние распри, которые могут расколоть Украину изнутри, пишет The Economist. Издание упоминает коррупционный скандал, фигурантом которого стал вице-премьер Алексей Чернышов, и попытки сменить на посту премьер-министра Дениса Шмыгаля. За этим, по словам источников, стоит глава офиса президента Андрей Ермак. Нет никаких доказательств, что Ермак приказал провести расследование в отношении Чернышова, но, по словам трех чиновников, он «использовал свое влияние, намеренно позволяя делу развиваться, в то время как другие дела замораживались». Они считают, что «настоящим преступлением Чернышова было то, что он встал на пути Ермака». Глава офиса Зеленского предложил ему баллотироваться на второй срок Политика rbc.group «Падение» чиновника расчистило путь для возможного назначения новым премьером 39-летней Юлии Свириденко, «протеже» Ермака. Как отмечает издание, идея о том, что его протеже заменит Шмыгаля не нова. Год назад президент Владимир Зеленский не позволил это сделать, но «с тех пор Ермак стал сильнее, а его соперники — слабее». Ожидается, что голосование в Верховной раде по этому вопросу состоится в ближайшие недели. rbc.group Кроме того, в течение июня трехлетняя вражда между Ермаком и главой военной разведки Кириллом Будановым грозила достичь кульминации со смещением последнего. Источники, близкие к главе офиса Зеленского, называют генерала «эксцентричным революционером, строящим собственную политическую машину». «Девяносто процентов [президентского] корпуса считают его сумасшедшим, а десять процентов считают его гением», — пояснил один из собеседников. То, что Буданову удалось остаться на посту, свидетельствует, что Зеленский оставляет за собой решение, какой бы ни была роль Ермака. Как писало Politico в июне, в администрации президента США Дональда Трампа устали от «второго по влиянию человека на Украине» — Ермака. К нему не были расположены ни при Байдене, ни при Трампе, при последнем ситуация стала сложнее, отмечало издание. По словам собеседников, негативное отношение к главе офиса Зеленского повлияло и на отношение Вашингтона к Киеву. Читайте РБК в Telegram.	10	\N	2025-07-07 07:55:02	2025-07-07 07:55:02
1231	3616	rosavtodor-zakazhet-koncepciyu-platy-za-proezd-po-trassam-v-regionah	Росавтодор закажет концепцию платы за проезд по трассам в регионах	https://s0.rbk.ru/v6_top_pics/media/img/6/07/347510154851076.jpeg	Росавтодор закажет консалтинговые услуги для создания системы взимания платы с грузовиков, проезжающих по региональным трассам общего пользования. Подрядчик проработает варианты привлечения льготного финансирования и господдержки Фото: Александр Манзюк / ТАСС Федеральное казенное учреждение (ФКУ) «Дороги России» (подведомственно Федеральному дорожному агентству Минтранса) объявило тендер на получение консалтинговых услуг для разработки системы взимания платы с грузовиков тяжелее 12 тонн, проезжающих по региональным, межмуниципальным и местным трассам общего пользования. Организация готова заплатить победителю тендера 73 млн руб., информация о закупке размещена на сайте Единой информационной системы в сфере закупок. Победитель конкурса должен будет предложить заказчику порядок и структуру взаимодействия будущего оператора этой системы с федеральными и региональными органами власти, говорится в техническом задании тендера. Компания-победитель также должна будет представить анализ возможной «доработки интегрированной системы взимания платы «Платон» до государственной информационной системы». Зачем платить за дороги общего пользования rbc.group Летом 2024-го председатель комитета Госдумы по транспорту и развитию транспортной инфраструктуры Евгений Москвичев предложил распространить систему «Платон» на региональные дороги и собранные за проезд деньги направить на их реконструкцию и развитие. В декабре 2024-го глава Минтранса Роман Старовойт подтвердил проработку этого предложения. В мае 2025 года, по итогам заседания президиума Госсовета по вопросам развития инфраструктуры, президент России Владимир Путин поручил, в частности, правительству рассмотреть вопросы, касающиеся предоставления субъектам права взимать плату в счет возмещения вреда, причиняемого автомобильным дорогам общего пользования регионального, межмуниципального и местного значения транспортными средствами, имеющими разрешенную максимальную массу свыше 12 тонн (срок исполнения — 15 сентября). rbc.group Согласно шестилетнему плану дорожной деятельности (.pdf), общий объем финансирования капремонта, текущего ремонта и содержания автодорог до конца 2030 года составит 2,48 трлн руб., что на 42% меньше, чем требуется по федеральным нормативам. Дефицит составляет около 1,73 трлн руб. Как именно будет организована система и возможная схема взимания платы с проезда по региональным дорогам, пока не решено. «Задача — найти варианты пополнения дорожных фондов, за счет которых идет восстановление дорог», — объясняет один из источник РБК в федеральном министерстве, задействованном в обсуждении вопроса. Обсуждение этих идей, указывает один из собеседников РБК, проходило в частности на стратсессии под руководством премьера Михаила Мишустина 17 июня. РБК направил запрос в аппараты вице-премьеров Марата Хуснуллина и Виталия Савельева. Как формируются дорожные фонды Наполнение дорожных фондов регламентировано ст. 179.4 Бюджетного кодекса. Ежегодный базовый объем Федерального дорожного фонда составляет 345 млрд руб., подлежащих индексации на прогнозируемую инфляцию, и прогнозируемым на год доходам бюджета от акцизов на автомобильный бензин, дизельное топливо и моторные масла, помноженных на коэффициент 0,83. Из Федерального дорожного фонда предусмотрены межбюджетные трансферты в бюджеты субъектов в размере до 8% от его объема. Размер таких трансфертов определяется законом о бюджете на плановый год. Кроме акцизов на топливо, дорожные фонды формируются за счет поступлений платы от проезда по российским дорогам автомобилей, зарегистрированных в иностранных юрисдикциях, платы в счет возмещения вреда грузовиками тяжелее 12 тонн, проезжающих по федеральным трассам (взимается через систему «Платон»), доходов от передачи в аренду земельных участков в полосе отвода автодорог общего пользования федерального значения, штрафов за нарушения дорожного движения тяжеловесными или крупногабаритными транспортными средствами и других источников. Что нужно разработать Победитель тендера ФКУ «Дороги России» должен будет проанализировать как российский, так и мировой опыт внедрения технологий оплаты за причинение вреда автодорогам: изучить технологии идентификации транспортных средств, оплаты проезда, нормативно-правовые основы внедрения систем взимания платы и основные финансовые модели, применяемые в них. Компания должна будет разработать варианты привлечения льготного финансирования для региональных проектов систем взимания платы, в том числе, например, за счет средств Фонда национального благосостояния (ФНБ), Российского фонда развития информационных технологий, Российского фонда прямых инвестиций (РФПИ), выпуска инфраструктурных облигаций, субсидий, льготных кредитов или займов. «Автодор» заявил о невозможности обеспечить связью все участки дорог Экономика Подрядчик также должен будет разработать предложения по господдержке региональных проектов систем взимания платы за счет различных федеральных программ, инвестиционных налоговых вычетов (ИНВ) по налогу на прибыль, соглашений о защите и поощрении капиталовложений (СЗПК), госгарантий и налоговых преференций. ФКУ также должно получить предложения по обеспечению единства требований к контрольной инфраструктуре систем взимания платы при проектировании и создании ее объектов. В Росавтодоре напомнили, что на сегодня в дорожно-транспортном комплексе нашей страны «нет альтернативных [«Платону»] систем, которые могли бы так же работать в режиме онлайн одновременно с порядка двумя миллионами пользователей». И при этом определять с точностью до метров проходимый путь по автодорогам общего пользования, рассчитывать по тарифу плату за каждые сутки и перечислять ее в федеральный бюджет, выявлять нарушителей-неплательщиков, формируя доказательную базу по каждому из них и направляя ее в соответствующие инстанции. «Кроме того, именно система «Платон» сертифицирована как средство измерения. Она в постоянном режиме взаимодействует с владельцами транспортных средств, предоставляя им объективную информацию прикладного значения, а также с заинтересованными ведомствами», — добавили в агентстве. «За десять лет работы система взимания платы «Платон» зарекомендовала себя как надежный и эффективный механизм пополнения Федерального дорожного фонда», — указывает представитель «РТ — Инвест транспортные системы» (РТИТС; оператор системы «Платон»). В компании считают, что накопленный опыт «Платона» представляет «несомненную ценность для возможного тиражирования на региональном уровне»: «Вместе с тем, решение о форме и порядке использования опыта «Платона» при создании региональных систем будет приниматься правительством с учетом всех экономических, технологических и правовых аспектов». Как работает «Платон» Система «Платон» начала работать в России с 15 ноября 2015 года. Она обеспечивает взимание платы для компенсации ущерба дорожному полотну с грузовиков тяжелее 12 тонн, проезжающих по федеральным трассам. Средства направляются в Федеральный дорожный фонд, их направляют не только на ремонт существующей инфраструктуры, но и на строительство новых дорог и мостов. Накануне запуска системы, в ноябре 2015 года в России начались забастовки дальнобойщиков, которые требовали отключить «Платон» и ввести трехлетний мораторий на ее использование, так как считали ее неработоспособной, а размер сбора (3,73 руб. за км) слишком большим, грозящим банкротством малому и среднему бизнесу, работающему в сфере грузоперевозок. Правительство пошло на уступки и на несколько месяцев снизило плату за проезд по федеральным трассам до 1,52 руб. за км. Для считывания сигнала водители грузовиков тяжелее 12 тонн должны оснащать автомобили специальными бортовыми устройствами, оснащенными навигационными модулями ГЛОНАСС и коммуникационными модулями GSM/GPRS. Что говорят логисты и эксперты Эдуард Миронов, директор по закупкам транспортных услуг FM Logistic в России отмечает, что тема расширения системы «Платон» на региональные трассы поднимается «с завидной регулярностью». «Есть тенденция по переводу региональных дорог в ведение федеральных властей и соответственно ввода на них данной системы. Инициатива требует детального анализа и деликатного внедрения. Повторения негативных настроений, которые были при вводе системы «Платон», никто не хочет», — считает он. По мнению Миронова, готовность перевозчиков платить за проезд по региональным трассам будет зависеть от многих факторов: качество дорожного покрытия, наличие альтернативных бесплатных маршрутов и экономическая целесообразность для бизнеса. «Важно учитывать текущие проблемы в работе системы «Платон» и бортовых устройств из-за средств радиоэлектронной борьбы — увеличение количества штрафов не интересно ни одной транспортной компании. Расширение платного проезда, безусловно, скажется на экономике перевозчиков. Это приведет к увеличению операционных расходов (хоть и на 3 рубля с километра), что будет транслировано в рост цен на услуги грузоперевозок», — заключил он. Михаил Коптев, коммерческий директор федеральной транспортной компании «Скиф-Карго» считает, что, с одной стороны, для перевозчиков это повысит операционные расходы, особенно, у компаний с крупными автопарками и большими пробегами. Расширение платного проезда создаст дополнительное финансовое бремя для перевозчиков, что неминуемо скажется на рентабельности, особенно для малого и среднего бизнеса. С другой стороны, если средства от оплаты действительно будут направляться на поддержание и развитие дорожной инфраструктуры, это может улучшить качество дорог и снизить износ автомобилей, частично компенсируя дополнительные расходы: «Если новые трассы будут более быстрыми и безопасными, это может сократить время в пути и снизить затраты на ГСМ». Михаил Блинкин, научный руководитель Института экономики транспорта ВШЭ, считает, что расширять взимание платы с проезда по дорогам общего пользования необходима — «идея уже получила признание в мире». Он добавил, что дорожные фонды трещат по швам практически во всех развитых странах мира. «Традиционная система пополнения дорожных фондов больше не работает. Во-первых, благодаря научно-техническому прогрессу автомобили потребляют сегодня меньше топлива, чем еще 10 лет назад, из-за чего падают отчисления в дорожные фонды по топливному акцизу. Во-вторых, постоянно растет доля легальных неплательщиков — владельцев электромобилей, а также прочих автомобилей на альтернативных топливах», — пояснил эксперт. Блинкин считает, что за право стать оператором системы могут побороться крупные российские IT-компании, которые могут составить конкуренцию оператору системы «Платон». Читайте РБК в Telegram. 	3	\N	2025-07-07 07:55:02	2025-07-07 07:55:02
1233	3621	analitiki-anonsirovali-konsolidaciyu-ugolnogo-rynka-iz-za-krizisa	Аналитики анонсировали консолидацию угольного рынка из-за кризиса	https://s0.rbk.ru/v6_top_pics/media/img/8/07/347516525714078.jpeg	Консолидация угольного рынка может произойти в ближайший год или полтора в связи с высоким финансовым давлением на отрасль в условиях ее кризиса, следует из прогноза НКР. Но этому могут помешать высокие кредитные ставки Фото: Алексей Майшев / РИА Новости Аналитики ожидают консолидацию угольного рынка за счет поглощений или санаций в условиях повышенного финансового давления в горизонте полутора лет. В результате мелкие компании перейдут более крупным структурам. К такому выводу пришли аналитики НКР, следует из соответствующего обзора. Сейчас в России работает порядка 180 угольных компаний, напоминают в НКР. По данным Росстата, 2024 год отрасль завершила с рекордным убытком в размере 113 млрд руб. из-за кризисного положения, возникшего вследствие потери части традиционных рынков сбыта после 2022 года (прежде всего это ЕС, доля экспорта в направлении европейских стран составляла 25%) и падения цен на твердое топливо: по оценке НКР, экспортная стоимость тонны энергетического угля в 2022 году составляла $148-192 в зависимости от порта отгрузки, по итогам 2024-го — $72-106. Для сравнения в 2020 году, также убыточном для производителей, прибыль составила 38 млрд руб. В «наиболее непростой» ситуации оказались средние и небольшие компании, выпускающие энергетический уголь — они столкнулись с резким сокращением экспортной выручки, констатируют аналитики. На новых рынках — с августа 2022 года, после отказа странами ЕС от российского угля, поставки переориентировались на рынки Китая (40-45% экспорта в 2023-2024 годах), Индии (10-12%) и Турции (10-15%) — угольщики из России вынуждены «заново завоевывать место под солнцем и играть с ценами». Сохранение и развитие экспорта «критически важно» для поддержания рентабельности бизнеса, финансовые результаты отрасли напрямую зависят от экспортной активности и глобальной конъюнктуры. rbc.group Банки реструктуризируют кредиты угольщиков на льготных условиях Бизнес rbc.group Высокий уровень процентных ставок в экономике и ограниченность доступа к «длинным деньгам», в свою очередь, больше сказываются на среднем бизнесе, тогда как точечные меры господдержки пока в большей степени ориентированы на крупные предприятия. «Средние и небольшие компании первыми продемонстрируют ухудшение финансовых метрик, и именно их первыми затронут проблемы кредитного качества», — прогнозируют в НКР. Какие меры господдержки подготовили для угольщиков В конце мая текущего года правительство утвердило перечень мер поддержки для угольной отрасли в рамках антикризисного плана для нее, который в декабре 2024 года профильным ведомствам поручил сформировать вице-премьер Александр Новак. В предоставлении помощи власти избрали «адресный подход». В актуальном списке — рассрочки по налогам, страховым взносам и сборам до 1 декабря 2025 года для всех организаций, возможность пролонгации рассмотрит специальная подкомиссия под председательством министра финансов Антона Силуанова (например, «Мечелу» согласовали такую помощь на максимальный срок — три года); программы финансового оздоровления при помощи непосредственных бенефициаров, в том числе ограничений по выплатам дивидендов и повышению зарплат топ-менеджменту, оптимизации затрат, а также реструктризация долгов компаний, которые испытывают серьезную долговую нагрузку. Сибирским угольщикам предоставят скидки на железнодорожные перевозки в адрес портов Юга и Северо-Запада в размере 12,8%, остальным затраты на дальнюю логистику компенсируют из субсидии. По состоянию на начало июля за помощью обратились 73 предприятий, из них 20 — на рассмотрении, говорил в недавнем интервью ТАСС замминистра энергетике Дмитрий Исламов. Поддержку уже ободрили трем компаниям — это «Мечел-Майнинг», «Воркутауголь» и СУПК, по «СДС-Углю» продолжается обсуждение. Весной текущего года Минэнерго опасалось, что без антикризисной программы консолидированный убыток отрасли возрастет до 261 млрд руб. РБК направил запросы в крупнейшие угольные компании. Как будет проходить консолидация Консолидация рынка возможна при «относительно недорогих» кредитах, необходимых для осуществления сделок, полагает Илья Жарский, управляющий партнер Экспертной группы Veta. «Если же кредитно-денежная политика долгое время была жесткой, то кредитные линии, вероятно, в угольной отрасли исчерпаны, а новые — слишком дорогие», — рассуждает эксперт. Власти дали прогноз о росте долгов угольщиков на четверть к концу 2025-го Бизнес Директор группы корпоративных рейтингов АКРА Илья Макров, в свою очередь, допускает, что речь идет скорее не о поглощениях крупными компаниями небольших игроков, а улучшении производителями с более прибыльными активами своей рыночной доли без дополнительных приобретений. С текущей ключевой ставкой сделок M&A на заемные сделки на угольном рынке «не предвидится», соглашается Александр Григорьев, замгендиректора Института проблем естественных монополий. Кроме того, у подавляющего большинства компаний кредитная нагрузка «крайне высока» (в 2024 году задолженность угольщиков по кредитам и займам составила 1,191 трлн руб.) В результате отрасль снизит объем добычи угля до уровня, позволяющего удовлетворить внутренний спрос, и экспорта, который смог бы обеспечить рентабельность (по итогам этого года власти рассчитывают сохранить добычу на уровне 2024 года — 443,5 млн т.), считает Макаров. По прогнозам НКР, основной спрос на твердое топливо в «ближайшие годы» будет приходиться на страны Юго-Восточной Азии, Китай и Индию в силу развития в этих странах угольной генерации и одновременно инвестиций в возобновляемые источники энергии, расширение газовой инфраструктуры. Последние выступают основными альтернативами энергетического угля в Азии, следовательно спрос и цены на него в большей степени зависят от конъюнктуры на других энергетических рынках и политической обстановки. В России угольная генерация занимает около 15% в общем объеме производства электроэнергии, но внутренние цены на твердое топливо примерно в три раза ниже экспортных. Говоря о потенциальной консолидации, Жарский предполагает, что среди претендентов на приобретение небольших активов — «Мечел», СУЭК и «Кузбассразрезуголь». Также интересантом может выступить «Эльгауголь», у которой могут быть «свободные средства под покупки». «В 2022-2023 годах компании удавалось привлекать финансирование под экспортные контракты», — поясняет эксперт. Те же компании перечисляет источник РБК на угольном рынке и добавляет, что маленькие активы они смогут получить либо за «бесценок», либо на условиях погашения долгов. «Просто будет передел рынка, укрупнение и, возможно, монополизация», — говорит собеседник. Читайте РБК в Telegram.	6	\N	2025-07-07 07:55:03	2025-07-07 07:55:03
1232	3619	minoborony-otchitalos-ob-unichtozhenii-91-ukrainskogo-drona-za-noch	Минобороны отчиталось об уничтожении 91 украинского дрона за ночь		Средства противовоздушной обороны за ночь сбили 91 беспилотник Вооруженных сил Украины над 15 российскими регионами, сообщает Минобороны. Больше всего, 20, были сбиты надо территорией Белгородской области, после нее идет Курская область (14) и Липецкая (девять). По восемь дронов сбили над территорией Брянской, Воронежской областей и Московского региона. Еще семь уничтожили над Черным морем, по три беспилотника — над Новгородской, Тверской, Тамбовской и Ленинградской областями. Два дрона сбили над Орловской областью, и по одному — над Владимирской областью, Краснодарским краем и Крымом. rbc.group Над Воронежской областью уничтожили несколько беспилотников Политика rbc.group В течение ночи власти некоторых российских регионов отчитывались о работе ПВО и уничтоженных украинских дронах. Так, примерно в 0:18 мск глава Воронежской области сообщил, что над регионом сбили несколько беспилотников. Точное число он тогда не назвал. Ранее об уничтожении беспилотника также сообщили власти Новгородской области. Читайте РБК в Telegram.	7	2025-07-07 08:34:29	2025-07-07 07:55:03	2025-07-07 08:34:29
1241	3733	eks-glavu-cru-zapodozrili-v-lozhnyh-pokazaniyah-o-vyborah-2016-i-rossii	Экс-главу ЦРУ заподозрили в ложных показаниях о выборах-2016 и России		Джон Бреннан, который возглавлял ЦРУ при Обаме, включил в доклад разведки о выборах 2016 года неподтвержденное досье Кристофера Стила о связях Трампа с Россией, пишет Breitbart. На слушаниях в конгрессе Бреннан заявлял обратное Бывший глава ЦРУ Джон Бреннан может стать фигурантом дела о лжесвидетельствовании во время дачи показаний перед конгрессом по поводу «российского вмешательства» в выборы США, сообщает Breitbart News. Бреннан возглавлял ЦРУ при 44-м президенте Бараке Обаме, в 2013–2017 годах. На прошлой неделе действующее руководство разведуправления сообщило, что выявило нарушения в докладе о вмешательстве России в выборы главы государства в 2016 году. Там сочли необоснованными суждения, что президент России Владимир Путин хотел помочь кандидату Дональду Трампу. По утверждению нынешнего главы ЦРУ Джона Рэтклиффа, Бреннан, Обама, а также на тот момент директора ФБР и нацразведки Джеймс Коми и Джеймс Клэппер решили «подставить Трампа». Республиканцы и союзники Трампа долгие годы заявляли, что доклад, вышедший при руководстве Бреннана, был неточным, поскольку его выводы были частично основаны на досье Кристофера Стила, экс-сотрудника службы внешней разведки Великобритании MI6, напоминает Breitbart. В нем, в частности, утверждалось, что у российских властей есть компромат на Трампа, с помощью которого Кремль может давить политика. Впоследствии Федеральная избирательная комиссия США начислила штраф нацкомитету Демпартии и избирательному штабу экс-кандидата и соперницы Трампа Хиллари Клинтон за нарушения, касающиеся финансирования подготовки досье. rbc.group ЦРУ выявило нарушения в докладе о вмешательстве России в выборы 2016 года Политика rbc.group Как пишет Breitbart со ссылкой на новый отчет ЦРУ, досье Стила в доклад от 2016 года включил именно Бреннан, несмотря на возражения сотрудников разведки. Эти сведения «ошеломили» конгрессменов, так как во время дачи показаний на слушаниях в конгрессе Бреннан заявлял обратное. По словам источника издания, эка-глава ЦРУ осознавал, что документ призван помешать Трампу стать президентом, но «все равно имел наглость лгать конгрессу с невозмутимым лицом». Бреннан прежде отрицал, что досье Стила с неподтвержденными сведениями распространилось из-за него. В 2017 году экс-глава ЦРУ заявлял, что не придал этому документу особого значения и не читал его. Читайте РБК в Telegram.	3	\N	2025-07-07 09:05:02	2025-07-07 09:05:02
1243	3847	oblomki-drona-upali-na-territorii-ilskogo-npz-na-kubani	Обломки дрона упали на территории Ильского НПЗ на Кубани	https://s0.rbk.ru/v6_top_pics/media/img/2/85/347518729932852.jpeg	Фото: Константин Михальчевский / РИА Новости В Северском районе на территории Ильского НПЗ произошло падение обломков беспилотника, сообщил оперштаб Кубани в телеграм-канале. Пострадавших нет, видимых повреждений объектов НПЗ, а также возгораний, задымления — нет. Материал дополняется	10	\N	2025-07-07 10:25:02	2025-07-07 10:25:02
1235	3625	tramp-rasskazal-o-prosbe-maska-naznachit-blizkogo-druga-glavoy-nasa	Трамп рассказал о просьбе Маска назначить близкого друга главой NASA	https://s0.rbk.ru/v6_top_pics/media/img/3/23/347518498441233.jpeg	В мае Трамп отозвал кандидатуру миллиардера и астронавта Джареда Айзекмана на пост главы NASA. Бизнесмен предположил, что поводом стали его отношений с Маском Илон Маск и Дональд Трамп (Фото: Kevin Dietsch / Getty Images) Президент США Дональд Трамп рассказал, что Илон Маск просил его назначить своего близкого друга директором NASA. «Илон попросил меня назначить одного из своих близких друзей главой NASA, и хотя я считал его друга очень хорошим человеком, я был удивлен, узнав, что он был демократом голубых кровей, который никогда раньше не делал пожертвований республиканцам. Илон, вероятно, тоже», — заявил Трамп. По его словам, он также посчитал неуместным, что «очень близкий друг» Маска будет руководить космическим агентством, когда оно «играет такую большую роль в корпоративной жизни Илона». rbc.group Трамп счел нелепым решение Маска создать партию Политика rbc.group В мае Трамп отозвал кандидатуру миллиардера и астронавта Джареда Айзекмана на пост главы NASA, которого до этого выбрал, «после тщательного анализа предыдущих связей». Некоторые республиканцы критиковали Айзекмана за пожертвования в пользу демократов, а некоторые в конгрессе были обеспокоены его связями со SpaceX и Маском. Бизнесмен дважды летал в космос со SpaceX, писала The Washington Post. Сам Айзекман предположил, что поводом стали его отношений с Маском, писал Axios. Джаред Айзекман — американский бизнесмен, миллиардер, летчик и астронавт. Предпринимателю 41 год. Его состояние — $1,7 млрд. В 2021 году он возглавил первую полностью гражданскую миссию в космос на чартерном рейсе SpaceX, а в сентябре 2024-го он был командиром миссии Polaris Dawn, в которой экипаж гражданских астронавтов SpaceX совершил первый коммерческий выход в открытый космос. Позднее Трамп на фоне ссоры пригрозил отозвать все госконтракты и субсидии, предоставляемые Маску, ради экономии, тот ответил отзывом своих кораблей Crew Dragon — кроме них к МКС сейчас летают только российские «Союзы». Читайте РБК в Telegram.	1	\N	2025-07-07 07:55:03	2025-07-07 07:55:03
1237	3627	minyust-i-fbr-oprovergli-teorii-zagovora-iz-za-dela-epshteyna-i-ego-smerti	Минюст и ФБР опровергли теории заговора из-за дела Эпштейна и его смерти	https://s0.rbk.ru/v6_top_pics/media/img/8/37/347518619542378.jpeg	Следователи не обнаружили «никакого компрометирующего списка клиентов» Эпштейна, осужденного за вовлечение несовершеннолетних в занятие проституцией, и никаких доказательств того, что он шантажировал влиятельных лиц, пишет Axios Протестующая с портретом Джеффри Эпштейна перед зданием суда (Фото: Stephanie Keith / Getty Images) Министерство юстиции США и ФБР пришли к выводу, что у них нет доказательств того, что осужденный за вовлечение несовершеннолетних девушек в занятие проституцией финансист Джеффри Эпштейн шантажировал влиятельных людей, вел «список клиентов» или был убит, пишет Axios со ссылкой на документ. Согласно видеозаписям, никто не входил на территорию тюрьмы, где содержался Эпштейн в ночь своей смерти в 2019 году. Видео подтверждает вывод судмедэксперта о том, что финансист покончил жизнь самоубийством, утверждается в записке. Издание отмечает, что администрация президента Дональда Трампа впервые официально опровергла теории заговора вокруг дела Эпштейна и его смерти. rbc.group Как пишет Axios, следователи внимательно изучили записи с камер примерно с 22:40 9 августа 2019 года, когда Эпштейн был в своей камере, и примерно до 6:30 следующего дня, когда он был обнаружен без признаков жизни. Также они не обнаружили «никакого компрометирующего списка клиентов» Эпштейна и «никаких достоверных доказательств» того, что он шантажировал влиятельных лиц. rbc.group Что было в «файлах Эпштейна» и почему появление там болезненно для Трампа База знаний Дело Эпштейна — это резонансное дело американского инвестиционного банкира Джеффри Эпштейна (1953–2019). В 2008 году он признал вину в склонении к занятию проституцией и был осужден за изнасилование несовершеннолетней, а в 2019-м был повторно арестован за торговлю людьми и вовлечение их в проституцию и покончил с собой, не дожидаясь решения суда. Эпштейн считался создателем сети по вовлечению в проституцию и сексуальную эксплуатацию несовершеннолетних девушек, некоторых из которых он насиловал сам или продавал состоятельным клиентам. Файлами Эпштейна называются материалы его уголовного дела — это тысячи документов из свидетельских показаний, адресной книги, справок, накладных, стенограмм допросов свидетелей, полицейских отчетов и имейлов. Там, в частности, содержатся данные о круге знакомств финансиста, среди которых оказалось большое число знаменитостей, политиков и бизнесменов. Среди них — Билл Клинтон, Дональд Трамп, принц Эндрю, брат нынешнего короля Великобритании Карла III, кронпринц Саудовской Аравии Мухаммед бен Сальман, иллюзионист Дэвид Копперфильд, актеры Джон Керри и Дастин Хоффман, основатель Microsoft Билл Гейтс и другие. Самоубийство финансиста-педофила в августе 2019 года породило множество слухов и теорий заговора, построенных на предполагаемых связях финансиста с высокопоставленными политиками. На фоне ссоры с Трампом бизнесмен Илон Маск заявил, что пришло «время сбросить настоящую бомбу» и что президент США фигурирует в «файлах Эпштейна». Позднее после разговора с вице-президентом Джей Ди Вэнсом и главой аппарата Белого дома Сьюзи Уайлс он удалил посты об этом. Основатель SpaceX и Tesla выразил сожаление из-за своих слов, заявив, что «зашел слишком далеко». Перед этим, как сообщали The New York Times и ABC со ссылкой на источники, Вэнс убедил бизнесмена прекратить публичную ссору с Трампом, после чего Маск позвонил ему. Читайте РБК в Telegram.	6	\N	2025-07-07 07:55:03	2025-07-07 07:55:03
1238	3630	izrail-obyavil-ob-operacii-chernyy-flag-protiv-husitov	Израиль объявил об операции «Черный флаг» против хуситов	https://s0.rbk.ru/v6_top_pics/media/img/0/55/347518507513550.jpeg	Израильские ВВС нанесли удары по портам Ходейда, Салиф и Рас-Иса, электростанции Рас-Катиб и судну Galaxy Leader, которое хуситы захватили в ноябре 2023 года в Красном море Фото: Uriel Sinai / Getty Images Армия обороны Израиля (ЦАХАЛ) провела операцию «Черный флаг» против хуситов, сообщает N12. Израильские ВВС нанесли удары по портам Ходейда, Салиф и Рас-Иса. Министр обороны Исраэль Кац подтвердил, что в настоящее время Израиль наносит удары «по объектам террористического режима хуситов в портах Ходейда, Рас-Иса и Салиф». Среди целей также — электростанция и судно Galaxy Leader, которое хуситы захватили в ноябре 2023 года в Красном море. «Как я и предупреждал, с Йеменом будут обращаться так же, как с Тегераном», — заявил Кац. rbc.group Как пояснили в ЦАХАЛ, эти цели использовались поддерживаемыми Ираном хуситами для поставок оружия и «террористической деятельности против Израиля и мирового судоходства». rbc.group Израиль нанес удар по порту Ходейда в Йемене после призыва об эвакуации Политика По данным Ynet, Израиль выпустил около 50 ракет и бомб по портам, судну и электростанции. Премьер-министр Биньямин Нетаньяху наблюдал за операцией против хуситов из своего самолета по пути в Вашингтон, сообщает N12. Это первый случай атаки Израиля на Йемен после покушения на начальника штаба хуситов Мухаммеда Абдель Карима аль-Гамари во время войны против Ирана, отмечает Ynet. Перед ударами арабоязычный представитель израильской армии Авичай Адраи призвал жителей портов эвакуироваться. Член политбюро хуситского движения «Ансар Аллах» Мухаммед Аль-Фарах назвал атаку Израиля «преступной агрессией, поддерживаемой Западом, передает Al Mayadeen. Представитель хуситов Яхья Сариа утверждает, что йеменские силы ПВО отбили атаку. Читайте РБК в Telegram.	1	\N	2025-07-07 07:55:04	2025-07-07 07:55:04
1240	3653	tramp-schel-nelepym-reshenie-maska-sozdat-partiyu	Трамп счел нелепым решение Маска создать партию	https://s0.rbk.ru/v6_top_pics/media/img/9/23/347518497229239.jpeg	Ему «грустно наблюдать», как Маск полностью «слетел с катушек» за последние пять недель, заявил президент. Бизнесмен после ссоры с Трампом из-за «прекрасного билля» объявил о создании партии «Америка» Илон Маск и Дональд Трамп (Фото: Kevin Dietsch / Getty Images) Президент США Дональд Трамп считает, что заявление Илона Маска о создании партии — «нелепо». Его слова приводит Reuters. «Я считаю, что это смешно — создавать третью партию», — сказал Трамп журналистам перед посадкой на «Борт номер один» (Air Force One) в Нью-Джерси. «Создание третьей партии только добавляет путаницы... Он может развлечься, но я считаю, что это смешно», — добавил глава Белого дома. По словам американского лидера, ему «грустно наблюдать», как Маск полностью «слетел с катушек» за последние пять недель. Он отметил, что третьи партии «никогда не добивались успеха в Соединенных Штатах» и что «единственное, для чего они хороши, так это для создания тотального хаоса». rbc.group Республиканцы в то же время представляют собой отлаженную «машину», которая только что приняла «прекрасный билль», подчеркнул Трамп. rbc.group Маск подал документы на регистрацию своей America Party Политика Маск, самый богатый человек в мире (Forbes оценивает его состояние в $405,2 млрд) после ссоры с Трампом объявил о создании новой политической партии, которую назвал «Америка». Бизнесмен и глава Белого дома поссорились из-за «большого и прекрасного билля» — законопроекта о госрасходах и налогах, который Маск критиковал. Сенат утвердил билль с перевесом всего в один голос (50 против 51) — его отдал вице-президент США Джей Ди Вэнс. Как председатель сената он имеет право голоса в случае ничьей. Трамп подписал билль в День независимости. Миллиардер объяснял, что кардинально поменял свое отношение к республиканцу, поскольку увеличение дефицита бюджета до $2,5 трлн приведет США к банкротству. Трамп утверждал, что Маск «расстроен» тем, что потерял мандат на производство электромобилей. «Он очень расстроен из-за всего этого. Но вы знаете, он может потерять гораздо больше», — говорил глава Белого дома. Американский лидер пригрозил бизнесмену сокращением субсидий, без которых ему пришлось бы «закрыть магазин и вернуться домой в Южную Африку». Читайте РБК в Telegram.	8	\N	2025-07-07 08:15:02	2025-07-07 08:15:02
1239	3648	v-voronezhskoy-oblasti-iz-za-padeniya-drona-zaderzhali-neskolko-poezdov	В Воронежской области из-за падения дрона задержали несколько поездов		В Воронежской области ночью сбили восемь дронов, обломки одного из них упали на железнодорожные пути. Власти сообщили, что движение уже восстановлено Обломки беспилотника упали на железнодорожные пути на юге Воронежской области, в результате были задержаны несколько поездов, сообщил губернатор Александр Гусев. Он уточнил, что к 7 утра движение восстановлено. Минобороны сообщало, что ночью в регионе уничтожили восемь беспилотников. По словам Гусева, их сбили на территории Воронежа и трех районов, по предварительным данным, никто не пострадал. rbc.group Губернатор сообщил о попытке атаки дронов в Ленинградской области Политика rbc.group В области с вечера 6 июля действовал режим опасности атаки беспилотников, его отменили утром в понедельник. Всего за ночь над Россией сбили 91 дрон, в том числе в Белгородской, Курской, Липецкой, Тамбовской областями, которые граничат с Воронежской областью. Еще восемь БПЛА были сбиты в Московском регионе, три — в Ленинградской области. Читайте РБК в Telegram.	3	2025-07-07 08:34:26	2025-07-07 08:15:02	2025-07-07 08:34:26
1247	3941	fas-zavela-delo-protiv-importera-antibiotika-dlya-lecheniya-pnevmonii	ФАС завела дело против импортера антибиотика для лечения пневмонии	https://s0.rbk.ru/v6_top_pics/media/img/2/03/347518741634032.jpeg	Компания «Замбон-Фарма» необоснованно повысила на 46% отпускную цену на препарат «Флуимуцил-антибиотик ИТ», который используют при лечении инфекций дыхательных путей, заявила антимонопольная служба Фото: Олег Яковлев / РБК Федеральная антимонопольная служба (ФАС) возбудила дело в отношении компании «Замбон-Фарма», российского представительства итальянской фармацевтической компании Zambon SpA. «Замбон-Фарма» — единственный импортер в Россию препарата на основе тиамфеникола «Флуимуцин-Антибиотик ИТ», который используется при лечении инфекций дыхательных путей, ларинготрахеитов, бронхитов и пневмоний. В связи с этим компания занимает доминирующее положение на рынке, заявили в ФАС. Служба проанализировала данные компании и пришла к выводу, что с 2023 года по первый квартал 2025-го «Замбон-Фарма» необоснованно повысила отпускную цену на препарат на 46%, «при этом темпы роста прибыли фармкомпании значительно превысили рост расходов на производство». rbc.group ФАС напомнила, что препарат не входит в перечень жизненно необходимых и важнейших, на него не распространяется государственное регулирование цен. rbc.group В конце 2022 года в российских аптеках зафиксировали резкий рост спроса на «Флуимуцин-Антибиотик ИТ» и повышение цен. Источники РБК в отрасли сообщали, что дефицита нет, но «в связи с политической обстановкой в мире» выросли сроки отгрузок с недель до месяцев, на этом фоне он не исключает попыток «манипулировать рынком». В Росздравнадзоре тогда заявили, что нехватки антибиотиков нет. Врачи в разговоре с РБК отмечали, что препарат не пользуется большим спросом в клинической практике, хотя «обладает рядом удобств. В 2024 году ФАС проанализировала 11 тыс. цен на лекарственные препараты, включенные в перечень жизненно необходимых, в первом квартале 2025 года — еще 1,6 тыс. «По результатам экономического анализа снижено 890 цен в среднем на 15%», — сообщал глава ведомства Максим Шаскольский. Читайте РБК в Telegram.	3	\N	2025-07-07 11:25:04	2025-07-07 11:25:04
1249	3983	minoborony-soobshchilo-ob-udarah-po-centram-komplektovaniya-vsu	Минобороны сообщило об ударах по центрам комплектования ВСУ	https://s0.rbk.ru/v6_top_pics/media/img/0/57/347518802069570.jpeg	Фото: Алексей Коновалов / ТАСС Вооруженные силы России нанесли поражение территориальным центрам комплектования ВСУ, сообщило Минобороны в телеграм-канале. Также удары нанесли по предприятию сборки и местам хранения ударных беспилотных летательных аппаратов, складам боеприпасов, горючего, а также пунктам временной дислокации украинских вооруженных формирований и иностранных наемников в 138 районах. Материал дополняется	4	\N	2025-07-07 12:35:02	2025-07-07 12:35:02
1250	3984	rossiyskaya-armiya-vzyala-dva-sela-v-sumskoy-i-dnepropetrovskoy-oblastyah	Российская армия взяла два села в Сумской и Днепропетровской областях	https://s0.rbk.ru/v6_top_pics/media/img/5/24/347518800771245.jpeg	Российская армия продолжает продвижение в Сумской и Днепропетровской областях. От села Дачное, о взятии которого отчиталось Минобороны, до города Днепр около 120 км Фото: сервис «Яндекс.Карты» Российская армия взяла под контроль села Бессаловка в Сумской области и Дачное в Днепропетровской, сообщает Минобороны. Бессаловка была взята силами группировки войск «Север», подразделения которой «продолжили продвижение в глубину обороны противника». Дачное было взято подразделениями группировки войск «Центр». Дачное находится у границы Днепропетровской и Донецкой областей, между селами Ялта и Новоукраинка, о взятии которых Минобороны уже отчитывалось. От него до областного центра, города Днепр, порядка 120 км. rbc.group Бессаловка в Сумской области — это приграничное село, всего в 2 км через границу от него расположено российское село Заря. В 7 км к северо-западу — поселок Теткино в Курской области. rbc.group Материал дополняется.	6	\N	2025-07-07 12:35:02	2025-07-07 12:35:02
1252	3996	v-rosaviacii-nazvali-chislo-reysov-kotorye-eshche-zaderzhivayutsya	В Росавиации назвали число рейсов, которые еще задерживаются	https://s0.rbk.ru/v6_top_pics/media/img/3/63/347518751522633.jpeg	На фоне временных ограничений в небе над Россией аэропорты справляются с нагрузкой — тысячи пассажиров получили компенсации, а авиакомпании усилили работу персонала. При этом только с 5 по 7 июля в России отменили почти 500 рейсов Фото: Андрей Любимов / РБК Российские аэропорты продолжают работать в штатном режиме на фоне временных ограничений и приостановок полетов, сообщает Росавиация. По данным агентства, с 5 по 7 июля авиакомпании отменили 485 рейсов, 88 направили на запасные аэродромы, задержано около 1,9 тыс. рейсов. Пассажирам, столкнувшимся с ограничениями, предоставили 199 тыс. ваучеров на напитки и 155 тыс. — на питание. За указанный период в аэропортах оформили 43 тыс. возвратов билетов, в гостиницах разместили 94 тыс. человек. Росавиация указала, что последствия ограничительных мер больше всего затронули Шереметьево, Пулково и аэропорты Нижнего Новгорода. Video Так, в Шереметьево 6 июля обслужили 140,5 тыс. пассажиров, остаются задержанными 40 рейсов. Группа «Аэрофлот» увеличила число работающих сотрудников, чтобы разобраться с последствиями. За 7 июля в Шереметьево планируют обслужить на прилет и вылет 1065 рейсов. В Пулково на вылет задержали 104 рейса, работают дополнительные 90 специалистов. За 6 июля в этом аэропорту обслужили 36,9 тыс. пассажиров, за 7 июля планируется обслужить 658 рейса. Тут остаются задержанными 104 рейса. rbc.group В нижегородском аэропорту остаются задержанными три рейса. Там уже обслужил 4,3 тыс. пассажиров, за 7 июля отменили один рейс. Минтранс и Росавиация заверили, что ситуация полностью управляется и нормализуется. Очевидцы рассказали о хаосе в аэропортах из-за ситуации в Пулково Общество Накануне в Росавиации заявили, что авиатранспортная система России на фоне введения ограничений справляется с проблемами. Сообщение агентство выпустило на фоне отмены рейсов в Пулково из-за ограничений, где, например, к 18:00 мск 6 июля отменили на прилет и вылет 90 рейсов, задержали более чем на два часа 37. В Шереметьево вместе с тем отменили на прилет и вылет 171 рейс, задержали 56 рейсов. Утром 7 июля очевидцы рассказали о хаосе в аэропортах из-за ситуации в Пулково, где 104 рейса задержали, еще 20 отменили. Читайте РБК в Telegram.	3	\N	2025-07-07 12:35:02	2025-07-07 12:35:02
1256	4042	iz-peterburga-v-moskvu-pustili-dvoynye-sapsany-iz-za-kollapsa-samoletov	Из Петербурга в Москву пустили двойные «Сапсаны» из-за коллапса самолетов	https://s0.rbk.ru/v6_top_pics/media/img/1/92/347518797971921.jpeg	Фото: Сергей Булкин / NEWS.ru / РБК Между Москвой и Петербургом запустили еще несколько сдвоенных поездов Сапсан. Об этом сообщили в РЖД. Решение принято на фоне коллапса полетов самолетов, где до сих пор происходят задержки рейсов. В частности, запущены: 7 июля: двойные «Сапсаны»: rbc.group № 755 Санкт-Петербург — Москва; rbc.group № 781 Санкт-Петербург — Москва; № 774 Москва — Санкт-Петербург; дополнительный поезд «Ласточка» № 845 Санкт-Петербург — Москва. 8 июля № 767 Санкт-Петербург — Москва; № 754 Москва — Санкт-Петербург; № 780 Москва — Санкт-Петербург; Материал дополняется	9	\N	2025-07-07 13:05:03	2025-07-07 13:05:03
1257	4066	minoborony-pokazalo-kadry-boev-v-dnepropetrovskoy-oblasti	Минобороны показало кадры боев в Днепропетровской области		Video Минобороны показало видео боев за населенный пункт Дачное в Днепропетровской области. На кадрах видно, как бойцы 114-й отдельной гвардейской мотострелковой бригады занимают позиции в селе. Дачное — первый населенный пункт в Днепропетровской области, о занятии которого официально сообщило российское военное ведомство. Российская армия взяла первый населенный пункт в Днепропетровской области Политика	10	\N	2025-07-07 13:25:01	2025-07-07 13:25:01
1259	4162	v-ershove-proizoshel-vzryv-gaza-v-pyatietazhke	В Ершове произошел взрыв газа в пятиэтажке	https://s0.rbk.ru/v6_top_pics/media/img/8/02/347518868559028.jpeg	Взрыв произошел на верхнем этаже, частично разрушены три квартиры. По предварительной информации, пострадавших нет Фото: Алексей Белкин / NEWS.ru / РБК В городе Ершов Саратовской области в пятиэтажном жилом доме произошел взрыв газа. Информацию об этом «Взгляд-инфо» подтвердил начальник управления региональной безопасности Юрий Юрин. Взрыв произошел на последнем этаже, разрушено и повреждено несколько квартир. Губернатор Роман Бусаргин сообщил, что в многоквартирном доме «произошло возгорание с частичным обрушением на этаже». rbc.group «По предварительным данным, пострадали три квартиры, среди людей жертв нет. В настоящее время идет тушение пожара, организована эвакуация жильцов», — написал он. rbc.group Канал «112» утверждает, что взрыв случился в квартире, «в которой проживает одинокая пожилая женщина». Она же пока что остается единственной обратившейся к врачам — у неё резко подскочило давление, пишет канал. «В 14:28 поступило сообщение о хлопке газо-воздушной смеси в квартире на 5 этаже 5-ти этажного дома. Предварительно пострадавших, погибших нет. Площадь пожара 20 кв.м., частично разрушена кровля над квартирой, выбиты стекла», — рассказали РБК в региональном МЧС. В 15:02 возникший пожар был локализован силами трех расчетов. РБК обратился за комментарием в пресс-службу регионального минздрава.	4	\N	2025-07-07 14:25:02	2025-07-07 14:25:02
1260	4176	transportnyy-kollaps-mezhdu-moskvoy-i-peterburgom-glavnoe	Транспортный коллапс между Москвой и Петербургом. Главное	https://s0.rbk.ru/v6_top_pics/media/img/0/99/347518056544990.jpeg	Ограничение работы аэропортов в Петербурге и Москве привело к задержкам и отмене сотен рейсов. Для поездок в столицу из Петербурга люди стали покупать железнодорожные билеты, РЖД запустило дополнительные поезда Фото: Евгений Биятов / РИА Новости На фоне временного закрытия столичных и петербургского аэропортов 5–6 июля пассажирам стало сложнее добираться из Петербурга в Москву и в обратном направлении. Что известно к 14:00 мск 7 июля По данным Росавиации все аэропорты (в том числе в столичном регионе и Санкт-Петербурге работают штатно). В ночь на 7 июля ограничения вводили в Саратове. Там отметили, что с 5 июля по 06:00 МСК 7 июля авиакомпании отменили 485 рейсов, на запасные аэродромы ушли 88 рейсов. Было задержано на вылет и прилет 1,9 тыс. рейсов, оформлено 43 тыс. вынужденных возвратов билетов. В Шереметьево: за первую половину суток было обслужено более 360 рейсов.  В Пулково: ограничения были сняты в 1:15 мск. Судя по онлайн-табло отмененными или задержанными числятся 126 рейсов на вылет. Роспотребнадзор запустил горячую линию в связи с задержкой, отменой и переносами авиарейсов: обратиться можно по бесплатному номеру 8 800 555 49 43. Закрытие аэропортов rbc.group Паузы в работе Пулково начались в ночь на 5 июля (сначала с 23:25 4 июля по 1:50, затем с 2:49 по 5:44; время дано по публикациям Росавиации). В течение дня 5 июля воздушная гавань также прекращала работу с 16:32 по 17:40, потом с 22:15 по 0:29. 6 июля в первой половине дня аэропорт работал штатно, но в 17:00 полеты снова остановили. Работа была возобновлена в 1:15. 5 июля была ограничена работа московского Шереметьево: около 11:00 Росавиация сообщила, что вылеты из аэропорта приостановлены из-за «ограничений в ряде секторов московской воздушной зоны и усиления ветра». В 14:38 служба заявила, что аэропорт снова работает штатно. Примерно с 23:40 и до 0:10 в ночь на 6 июля была ограничена работа аэропортов Домодедово и Жуковский. Аэропорт Внуково в эти дни работает без сбоев. 5–6 июля останавливалась работа и других российских аэропортов: среди них нижегородский, калужский, псковский, кировский и др. rbc.group Задержки авиарейсов 5 июля в Пулково в целом за сутки, согласно данным табло, были отменены более 70 рейсов на вылет, с задержкой отправились свыше 100 рейсов. На прилет также были отменены около 70 перелетов, многие рейсы тоже прибывали с задержкой. Пауза в работе Шереметьево 5 июля привела к тому, что на 21:00 было отменено 174 рейса на прилет и вылет, на период более двух часов были задержаны 47 рейсов, сообщала Росавиация. Железнодорожные билеты Ситуация с приостановкой работы аэропортов вызвала рост спроса на железнодорожные билеты. Утром 6 июля Ассоциация туроператоров России сообщила, что в продаже полностью закончились билеты на поезда из Петербурга в Москву. Вечером 5 июля на следующий день оставался один билет, на 7 июля билеты «тоже стремительно заканчиваются». Как убедился корреспондент РБК около 16:00 6 июля, на поезда из Петербурга в Москву на 7 июля осталось менее 50 билетов, в обратном направлении свободных мест несколько сотен. Федеральная пассажирская компания (ФПК, дочерняя компания РЖД) сообщила 6 июля, что следит за числом свободных мест в поездах между Москвой и Петербургом. Утром 7 июля РЖД сообщила о запуске нескольких сдвоенных поездов «Сапсан»; 7 июля. № 781 Санкт-Петербург — Москва (время отправления — 19:10); № 774 Москва — Санкт-Петербург (время отправления — 15:40); дополнительный поезд «Ласточка» № 845 Санкт-Петербург — Москва (время отправления — 15:59; без остановок). 8 июля № 767 Санкт-Петербург — Москва (время отправления — 13:00); № 754 Москва — Санкт-Петербург; № 780 Москва — Санкт-Петербург (время отправления — 19:30). Уничтожение беспилотников Минобороны сообщало, что 5–6 июля над российскими регионами (до 16:00 воскресенья) были сбиты примерно 350 дронов. Из них в Московском регионе — восемь, в Ленинградской области — шесть. Около 19:00 6 июля мэр столицы Сергей Собянин сообщил о шести сбитых дронах, ленинградский губернатор Александр Дрозденко — о двух. В ночь на 7 июля дежурными средствами ПВО был уничтожен и перехвачен 91 украинский беспилотный летательный аппарат самолетного типа. Из них: 8 БПЛА – над территорией Московского региона;  по 3 БПЛА – над территориями Новгородской, Тверской,  Ленинградской областей. Читайте РБК в Telegram.	1	\N	2025-07-07 14:35:02	2025-07-07 14:35:02
1261	4180	chislo-reshivshih-uchitsya-v-pedagogicheskom-obognalo-it-specialnosti	Число решивших учиться в педагогическом обогнало IT-специальности	https://s0.rbk.ru/v6_top_pics/media/img/8/51/347518780938518.jpeg	Число желающих пересдать ЕГЭ выросло на 30 тыс. за год. Больше всего нарушителей попались с телефоном. По данным Рособрнадзора, число желающих поступить в колледжи выросло почти на 80% Фото: Максим Платонов / Бизнес Online / ТАСС Количество заявлений, поданных для поступления на педагогические направления на бюджетной основе уже обогнало все другие направления, в том числе информационные технологии. Всего подали 233 тыс. заявлений на 70 тыс. бюджетных мест, сообщил министр просвещения Сергей Кравцов на пресс-конференции, посвященной итогам ЕГЭ. К тому же увеличилось число заявок для поступления в учреждения среднего профессионального образования. По словам министра, их уже подали 450 тыс. человек, что на 200 тыс. больше прошлого года в этот период. Он также отметил, что большой интерес проявляют к техническим профессиям. Руководитель Федеральной службы по надзору в сфере образования Анзор Музаев отметил положительные изменения в результатах ЕГЭ по естественнонаучным предметам: увеличилось число сдававших экзамен по профильной математике и биологии на 7%, физике — на 13%, информатике — на 5%. Также выросло количество участников, которые получили результат более 60 баллов: по профильной математике такой получили больше 60% от общего числа участников, по биологии — больше 49%, по химии — 46%, по физике — 52%, по информатике — 44%. rbc.group Как школьники сдали ЕГЭ и по каким предметам снизился средний балл Общество rbc.group В этом году из вошедших в состав России в 2022 году регионов ЕГЭ сдавали около 1,6 тыс. человек. Там впервые появились стобалльники — 11 человек. В целом количество стобалльников в этом году снизилось с 9,5 тыс. до 6,8 тыс. человек. Возможность пересдать экзамен в этом году выбрали больше выпускников, чем в прошлом, — 144,4 тыс. человек. В 2024 году таких заявлений было 113,5 тыс. Больше всего желающих изменить результат экзамена зарегистрировались на обществознание — 36,4 тыс. чел. Информатику выбрали 24,6 тыс. чел., русский язык — 20,1 тыс. человек, профильную математику — 19,5 тыс. человек, а химию — 11,5 тыс. человек. По остальным предметам число желающих пересдать меньше 10 тыс. человек, а географию выбрали 497 человек. Результаты пересдач будут известны до 15 июля. Что касается нарушений, всего с экзамена был удален 781 человек, из них за наличие телефона — 261 человек, а за шпаргалки — 413, еще 107 человек были удалены по другим причинам. У выпускницы аннулировали результат ЕГЭ из-за «умных» очков Общество Также в Рособрнадзор поступали обращения о нарушениях в проведении итогового экзамена, всего служба получила 72 обращения из 32 регионов. В 69 обращениях содержались жалобы на нарушение порядка проведения экзаменов в пунктах проведения, а 55 обращений связаны с проведением именно ЕГЭ (а не ОГЭ после 9-го класса). Служба подтвердила нарушения в 14 случаях. В основном, по данным Рособрнадзора, обращения были связаны с комфортностью экзаменационной процедуры — например, организацией туалетных комнат, запретами проносить в аудиторию воду и еду, а также с неудобными партами. В нескольких регионах во время ОГЭ по русскому языку ученикам включили не тот аудиофайл для написания изложения. В результате школьники в Дубне, Чехове и Воронежской области получили за изложение ноль баллов. В итоге приняли решение, что работы перепроверят и оценят по фактически озвученному тексту.	10	\N	2025-07-07 14:35:02	2025-07-07 14:35:02
1263	4245	igor-vernik-popal-v-dtp	Игорь Верник попал в ДТП	https://s0.rbk.ru/v6_top_pics/media/img/1/03/347518898656031.jpeg	Игорь Верник (Фото: Сергей Булкин / NEWS.ru / РБК) Народный артист России Игорь Верник не сможет выйти на сцену 7 июля из-за дорожно-транспортного происшествия с его участием. Об этом сообщило театральное агентство «Арт-партнер XXI». Верник должен был сыграть в спектакле «Торговцы резиной» на сцене Театра Эстрады. «В связи с болезнью народного артиста РФ Игоря Верника, вызванной дорожно-транспортным происшествием, спектакль «Торговцы резиной», запланированный к показу 7 июля 2025 года на сцене Театра Эстрады, переносится на 13 октября 2025 и будет показан на сцене Театра Терезы Дуровой», — говорится в сообщении. Материал дополняется	9	\N	2025-07-07 15:15:00	2025-07-07 15:15:00
1264	4263	soyuz-operatorov-otvetil-na-plany-ukrainy-konfiskovat-rossiyskie-vagony	Союз операторов ответил на планы Украины конфисковать российские вагоны	https://s0.rbk.ru/v6_top_pics/media/img/0/51/347518884730510.jpeg	В 2022 году на Украине объявили о начале процедуры национализации 15 тыс. российских вагонов, которая, как отметили тогда, «займет время». 5 июля Зеленский внес в Верховную раду проект закона о принудительном изъятии 1592 вагонов Фото: Yulii Zozulia / ZUMA / ТАСС Союз операторов железнодорожного транспорта России (СОЖТ) ответил на планы Украины конфисковать российские вагоны. Как заявили в организации РБК, изъятие, удержание или другие ограничения на использование российского железнодорожного подвижного состава, вводимые украинской стороной, являются незаконными и не соответствуют требованиям международных соглашений. В том числе — соглашению о международном железнодорожном грузовом сообщении. В СОЖТ напомнили, что на территории Украины с начала российско-украинского конфликта оказалось более 15 тыс. российских вагонов. В 2022 году компания «Укржелдорога» объявила о начале процедуры национализации 15 тыс. российских вагонов, находящихся на территории Украины. Как заявили в компании, составы принадлежат 250 компаниям. 5 июля 2025 года украинский президент Владимир Зеленский зарегистрировал в Верховной раде проект закона о принудительном изъятии в пользу Украины 1592 железнодорожных вагонов. Документ обосновывает «правовые основы принудительного изъятия» по мотивам общественной необходимости объектов права собственности России. rbc.group В течение последних трех лет украинские власти активно проводили конфискацию имущества, связанного с Россией и Белоруссией. С марта 2022 года на Украине действует закон, позволяющий принудительно изымать объекты собственности России и ее резидентов на территории Украины без компенсации. rbc.group Читайте РБК в Telegram.	5	\N	2025-07-07 15:25:03	2025-07-07 15:25:03
1266	4290	pravitelstvo-predlozhilo-novye-gosposhliny-dlya-avtovladelcev-i-migrantov	Правительство предложило новые госпошлины для автовладельцев и мигрантов	https://s0.rbk.ru/v6_top_pics/media/img/0/98/347518911070980.jpeg	Пошлины на госуслуги для автомобилистов могут вырасти в России с 1 сентября — соответствующие поправки правительство направило в Госдуму. Также может быть введен сбор за постановку на учет по месту пребывания для иностранцев Фото: Андрей Любимов / РБК Правительство внесло в Госдуму законопроект, которым предлагается с 1 сентября 2025 года ввести новые государственные пошлины для автовладельцев и мигрантов, а также повысить ряд уже действующих пошлин для них. Документ опубликован в базе данных нижней палаты парламента. Изменения предлагается внести в Налоговый кодекс России. В пояснительной записке говорится, что госпошлины были установлены в 2014 году и с тех пор не менялись. Также отмечается, что при «значительных миграционных потоках» работа по контролю за пребыванием иностранных граждан в России представляет «особую важность». В случае принятия поправок, пошлина за получение паспорта транспортного средства (ПТС) возрастет с 800 до 1,2 тыс. руб., за внесение изменений в выданный ранее паспорт — с 350 до 525 руб. Пошлину за выдачу свидетельства о регистрации транспорта предлагается увеличить сразу в три раза: до 1,5 тыс. руб. за бумажный документ и до 4,5 тыс. руб. — за пластиковый. rbc.group В России удвоят пошлину за получение водительских прав Общество rbc.group Пошлина за выдачу национального водительского удостоверения, изготавливаемого на пластиковой основе, вырастут с 2 тыс. руб. до 4 тыс. руб., нового поколения — с 3 тыс. руб. до 6 тыс. руб. Пошлины за выдачу международного водительского удостоверения повышаются с 1,6 тыс. руб. до 3,2 тыс. руб., за выдачу свидетельства о допуске транспортных средств к перевозке опасных грузов — с 1,5 тыс. руб. до 2250 руб., а за его продление — с 1 тыс. руб. до 1,5 тыс. руб. Что касается иностранных граждан, то для них предлагается ввести сбор за постановку на учет по месту пребывания в размере 500 руб., а также за продление срока временного пребывания — 1 тыс. руб. Также устанавливается пошлина за выдачу или переоформление патента в размере 4,2 тыс. руб. За продление срока действия разрешения на работу мигрантам придется заплатить 4,2 тыс. руб., а за выдачу его дубликата или внесение в разрешение правок — 2,1 тыс. руб. Предполагается, что в случае принятия закон вступит в силу с 1 сентября 2025 года, но не ранее чем по истечении месяца со дня его официального опубликования. Читайте РБК в Telegram.	10	\N	2025-07-07 15:45:03	2025-07-07 15:45:03
1265	4285	bastrykin-reshil-zavesti-delo-protiv-voennogo-sudi	Бастрыкин решил завести дело против военного судьи	https://s0.rbk.ru/v6_top_pics/media/img/3/78/347518867833783.jpeg	Бастрыкин хочет завести против военного судьи Тришкина дело об умышленном причинении вреда здоровью из хулиганских побуждений и с применением оружия. Для этого нужно разрешение коллегии судей Александр Бастрыкин (Фото: Наталья Шатохина / NEWS.ru / РБК) Глава Следственного комитета Александр Бастрыкин попросил согласия на возбуждение уголовного дела против судьи 2-го Западного окружного военного суда Альберта Тришкина, следует из повестки Высшей квалификационной коллегии судей. Дело касается умышленного причинения вреда здоровью средней тяжести из хулиганских побуждений, по мотивам ненависти к социальной группе и с применением оружия (пункты «д», «е», «з» ч. 2 ст. 112 УК), других подробностей не приводится. В соответствии с законом о статусе судей, судья неприкосновенен. Согласие Высшей квалификационной коллегии необходимо для возбуждения уголовного дела либо для привлечения его в качестве обвиняемого по другому делу. rbc.group Представление Бастрыкина будет рассмотрено на заседании 16 июля. rbc.group Дело против бывшего главы «Ночлежки» завели после письма 6 депутатов Думы Политика Тришкин был назначен судьей военного суда в 2016 году, отмечает «РИА Новости». Сейчас он рассматривает дело координатора «Левого фронта» Сергея Удальцова. Удальцов был арестован в начале января 2024 года по обвинению в оправдании терроризма из-за постов в защиту членов уфимского марксистского кружка, которым вменили создание и участие в экстремистском сообществе. Удальцов называет обвинения против себя бредом. В 2014-м лидеру «Левого фронта» дали 4,5 года колонии по «болотному делу», признав виновным в организации беспорядков на Болотной площади. Он вышел на свободу летом 2017 года, с тех пор Удальцова не раз привлекали к административной ответственности за нарушение порядка проведения митингов. Читайте РБК в Telegram.	4	\N	2025-07-07 15:35:01	2025-07-07 15:35:01
1268	4322	tass-soobshchil-o-zaderzhanii-byvshego-pervogo-zamglavy-rosgvardii	ТАСС сообщил о задержании бывшего первого замглавы Росгвардии	https://s0.rbk.ru/v6_top_pics/media/img/4/37/347518930185374.jpeg	Виктор Стригунов (Фото: Кирилл Зыков / АГН «Москва») Бывшего первого замглавы Росгвардии Виктора Стригунова задержали по делу о злоупотреблении полномочиями, сообщает ТАСС со ссылкой на правоохранительные органы. «РИА Новости» позднее сообщило, что он обвиняется в злоупотреблении полномочиями. Пост первого замглавы Росгвардии Стригунов занял в конце января 2020 года. До этого он командовал войсками Сибирского округа войск Национальной гвардии. С 2017 года — генерал-полковник. Материал дополняется	7	\N	2025-07-07 16:05:02	2025-07-07 16:05:02
1269	4372	glava-mchs-priletel-v-baku	Глава МЧС прилетел в Баку	https://s0.rbk.ru/v6_top_pics/media/img/0/26/347518929185260.jpeg	Александр Куренков (Фото: Михаил Терещенко / ТАСС) Глава МЧС Александр Куренков прилетел в Баку, сообщило МЧС. В ведомстве указали, что он прибыл для участия в заседании Международной организации гражданской обороны (МОГО). Ранее самолет МЧС вылетел из Внуково и приземлился в Баку, следовало из данных Flightradar24. В пресс-службе министерства отметили, что ключевой вопрос повестки — выборы генерального секретаря Международной организации гражданской обороны. Сейчас МОГО объединяет на своей площадке чрезвычайные службы более 60 государств. МЧС России стало членом организации в 1993 году. С января 2025 года исполняющим обязанности генерального секретаря МОГО назначен Роман Лапин. Кроме того, на полях заседаний Исполнительного совета и Генеральной ассамблеи МОГО в Баку Александр Куренков проведет двусторонние встречи с представителями ряда иностранных государств. rbc.group Отношения Москвы и Баку обострились в конце июня, после того как в России прошли массовые задержания азербайджанцев. МИД Азербайджана выразил России «решительный протест», заявив о погибших и пострадавших после рейдов. Российское внешнеполитическое ведомство заявило о «недружественных действиях» азербайджанской стороны в ответ на задержания российских журналистов в Баку. Материал дополняется rbc.group Читайте РБК в Telegram.	6	\N	2025-07-07 16:35:03	2025-07-07 16:35:03
1270	4383	na-meste-gibeli-starovoyta-nashli-nagradnoy-pistolet	На месте гибели Старовойта нашли наградной пистолет	https://s0.rbk.ru/v6_top_pics/media/img/9/38/347518949942389.jpeg	Роман Старовойт (слева) (Фото: Администрация Курской области) На месте гибели Романа Старовойта был найден наградной пистолет, сообщил РБК источник в правоохранительных органах. Его тело нашли в личном автомобиле, сообщал СК. На теле экс-министра нашли огнестрельное ранение. Старовойт совершил самоубийство, это основная версия, сообщали в ведомстве. О том, что экс-министр покончил с собой, сообщил также РБК источник, близкий к администрации президента. rbc.group Утром 7 июля стало известно, что Старовойта отправили в отставку с должности министра транспорта. На его место назначили бывшего заместителя министра и экс-губернатора Новгородской области Андрея Никитина. rbc.group Источники РБК сообщали, что к нему рано или поздно могут возникнуть вопросы из-за уголовного дела о хищениях при строительстве фортификаций в Курской области. Ранее по этому делу арестовали сменщика Старовойта на посту главы региона — Алексея Смирнова. Материал дополняется Почему отправили в отставку министра транспорта Романа Старовойта Политика Читайте РБК в Telegram.	7	\N	2025-07-07 16:45:01	2025-07-07 16:45:01
1332	4467	glava-rosaviacii-obsudil-s-aksenovym-vozobnovlenie-raboty-aeroporta-kryma	Глава Росавиации обсудил с Аксеновым возобновление работы аэропорта Крыма	https://s0.rbk.ru/v6_top_pics/media/img/7/70/347518933277707.jpeg	Руководитель Росавиации и глава Крыма обсудили возобновление работы аэропорта в Симферополе, который уже три года не принимает и не отправляет рейсы. Аксенов заявил о готовности запустить работу аэропорта при распоряжении Путина Международный аэропорт Симферополь (Фото: Сергей Мальгавко / ТАСС) Руководитель Федерального агентства воздушного транспорта (Росавиация) Дмитрий Ядров и глава Крыма Сергей Аксенов обсудили готовность международного аэропорта Симферополь и его персонала к потенциальному возобновлению работы, а также общего материально-технического состояния воздушной гавани. Аэропорт в Симферополе перестал принимать и отправлять рейсы в феврале 2022 года. Глава Росавиации отметил, что несмотря на временное закрытие, симферопольской воздушной гавани продолжают уделять должное внимание. «Занимаемся вопросами по его поддержке и дальнейшему развитию. Это крайне важно, потому что воздушный транспорт всегда будет играть ключевую роль как для крымчан, так и гостей полуострова. Экономика Крыма не стоит на месте, поэтому, уверен, после открытия пассажиропоток симферопольского аэропорта превысит прежние рекордные показатели», — сказал Ядров. Его слова приводит пресс-служба Росавиации. rbc.group Аксенов, в свою очередь, заявил о готовности немедленно запустить работу аэропорта при получении соответствующего распоряжения от президента Владимира Путина. По его словам, авиация остается для Крыма основным видом транспорта, без которого республика теряет определенную долю туристов. rbc.group В Росавиации опровергли данные об открытии аэропортов на юге России Общество Глава Крыма также отметил, что в аэропорту проводятся все необходимые работы по его содержанию. Сотрудники регулярно повышают уровень своей квалификации, практикуясь в других аэропортах страны. «Команда здесь собралась профессиональная, решение любых проблемных вопросов, даже самых сложных, ей по плечу», — добавил он. Аэропорты Анапы, Геленджика, Краснодара, Ростова-на-Дону, Симферополя, Белгорода, Брянска, Курска, Липецка, Воронежа и Элисты закрыли для массовых полетов после начала военной операции на Украине в феврале 2022 года. С тех пор открылся лишь один из них — в Элисте, воздушная гавань там начала снова принимать и отправлять рейсы в конце мая 2024 года. В декабре 2023 года Аксенов говорил, что аэропорт Симферополя будет открыт только после окончания военной операции на Украине. Путин отмечал, что главным критерием возобновления работы аэропортов на юге России остается безопасность полетов. Читайте РБК в Telegram.	1	\N	2025-07-07 16:55:02	2025-07-07 16:55:02
1333	4509	wp-rasskazala-pochemu-programma-zolotyh-kart-trampa-ne-zarabotaet	WP рассказала, почему программа «золотых карт» Трампа не заработает		Программа «золотых виз» Трампа может остаться нереализованной, поскольку администрация президента не предприняла усилий для изменения законодательства, необходимого для введения новой категории виз, говорят эксперты WP Программа «золотых виз», предложенная президентом США Дональдом Трампом, с высокой вероятностью никогда не будет воплощена в жизнь, пишет Washington Post (WP). Трамп анонсировал эту программу в феврале. Новая «золотая карта» стоимостью $5 млн призвана заменить правительственную программу по выдаче иммиграционных виз EB-5, для получения которых требуются инвестиции в размере $1,8 млн. Американский президент неоднократно вновь упоминал о ней после анонса. В марте глава американского Минфина Говард Лютник объявил, что за день продал «тысячу» «золотых карт», а вырученные $5 млрд пошли на погашение госдолга. В июне в США был запущен сайт для записи желающих в лист ожидания. Лютник в июньском интервью Financial Times утверждал, что заявки на «золотую визу» подали 70 тыс. человек. В Вашингтоне ожидают, что эту карту купят около миллиона человек. rbc.group Однако администрация США не предприняла никаких усилий для изменения законодательства, чтобы реализация программы стала возможной, отмечает WP. Иммиграционные адвокаты и другие эксперты в области права сказали изданию, что у президента нет полномочий в одностороннем порядке создавать новую категорию виз, это потребовало бы принятия закона конгрессом. rbc.group В то же время американский парламент в течение 35 лет не менял категории виз и в некоторых случаях, когда предыдущие администрации пытались создать их, противодействовали таким шагам, если законодатели считали, что это ограничивает их полномочия, пишет издание. США анонсировали запуск программы «золотых карт» в ближайшие дни Политика Юристы, говоря о замене «золотой картой» виз EB-5, подчеркивают, что любые попытки выдать визы состоятельным людям раньше тех, кто уже стоит в очереди, приведут к судебным разбирательствам. Иммиграционный адвокат из Филадельфии Рон Класко сказал, что некоторые его клиенты из Канады и Европы проявляли интерес к получению визы, но он сказал им, что нет смысла даже записываться в список ожидания, пока не прояснятся подробности. «Зачем мне это делать, пока я не узнаю, является ли это законом, что в нем говорится, каковы требования, какая информация будет запрашиваться в форме, какие документы я должен предоставить, каковы условия», — отметил юрист. Читайте РБК в Telegram.	4	\N	2025-07-08 08:35:01	2025-07-08 08:35:01
1334	4501	pravitelstvo-odobrilo-proekt-zakona-o-rubkah-na-baykale	Правительство одобрило проект закона о рубках на Байкале	https://s0.rbk.ru/v6_top_pics/media/img/9/28/347518927960289.jpeg	В правительстве одобрили поправки ко второму чтению законопроекта о рубках на Байкале, предложив оставить в нем норму о сплошных рубках. Экологи считают, что прописывать рубки в законе не нужно Остров Ольхон на озере Байкал (Фото: Михаил Мордасов / РИА Новости ) Как в Минприроды предложили дополнить законопроект Правительственная комиссия по законопроектной деятельности одобрила подготовленные Минприроды поправки к законопроекту о рубках на Байкале, следует из материалов комиссии (есть у РБК). Одобрение проекта подтвердил источник в правительстве. Поправки предлагаются к законопроекту, внесенному в Госдуму в июне 2023 года и принятому в первом чтении в июле того же года. Минприроды предложило сохранить дискуссионную норму, принятую в первом чтении, против которой выступали ученые и экологи, — возможность проведения сплошных рубок в центральной экологической зоне Байкальской природной территории. Согласно проекту поправок, такие рубки будут допустимы, если выборочные рубки не смогут обеспечить замену лесных насаждений (сейчас в законе установлен запрет на сплошные рубки в центральной экологической зоне Байкальской природной территории). rbc.group Кроме того, планируется разрешить переводить земли лесного фонда, занятые защитными лесами, в земли других категорий для размещения определенных объектов — гидро- и селезащитных сооружений, автомобильных дорог, объектов теплоснабжения, водоснабжения, водоотведения, газоснабжения, а также кладбищ. rbc.group В законопроекте о Байкале появилась передача участков в собственность Политика Поправки предусматривают, что вопросы о согласовании проекта перечня земель, на которых допускаются сплошные рубки, а также проекты документов по переводу таких земель будет рассматривать комиссия по обеспечению охраны озера Байкал и социально-экономическому развитию Байкальской природной территории. Согласно предлагаемым поправкам, в нее войдут депутаты, сенаторы, представители администрации президента, правительства, ФСБ, высшие должностные лица Иркутской области и Бурятии. Помимо этого, поправками предусматривается запрет на размещение частных домов в особых экономических зонах, расположенных в границах центральной экологической зоны. Создание в центральной экологической зоне новых особых экономических зон не допускается. 23 июня в президиуме РАН прошло заседание, посвященное законопроекту по рубкам на Байкале, на котором в том числе присутствовал глава Минприроды Александр Козлов. Как рассказал РБК источник, знакомый с ходом встречи, чиновники и ученые пытались найти компромисс по формулировкам законопроекта, но достичь его на заседании не получилось. В итоге было решено, что РАН предложит формулировку, которая бы теоретически устроила всех, и после этого будет финализирована версия законопроекта ко второму чтению. На момент одобрения проекта поправок комиссией протокол этой встречи еще не был подписан, сказал собеседник РБК. Почему экологи против нормы о сплошных рубках Экологи утверждают, что отменять действующий запрет на сплошные рубки незачем. «Согласно действующему лесному законодательству, в лесах, где заготовка древесины запрещена, допускается уборка неликвидной древесины (УНД), — объяснил координатор программ по особо охраняемым природным территориям природоохранного проекта «Земля касается каждого» Михаил Крейндлин. — Принципиальная разница между УНД и сплошными санитарными рубками погибших насаждений заключается в том, что при УНД древесина должна оставаться на лесосеке, а при проведении сплошных рубок может вывозиться и быть объектом сделок купли-продажи. Есть серьезные основания полагать, что снятие запрета на сплошные санитарные рубки в лесах, имеющих исключительное значение для сохранения экосистемы Байкала, станет стимулом к уничтожению здоровых лесных насаждений, например, путем поджога, с целью последующего признания их погибшими и коммерческого использования древесины». Академики РАН поспорили с главой Бурятии из-за закона о Байкале Общество В 2021 году начальник управления по надзору за исполнением законодательства в экологической сфере Антон Головин рассказывал, что проверки в Иркутской области показали, что региональные власти несколько лет организовывали вырубки наиболее ценного леса под видом санитарных мероприятий. Были возбуждены десятки уголовных дел. Рубка леса и искусственное лесовосстановление в горных условиях с использованием соответствующей техники также могут привести к резкому росту эрозии почвы, объясняет эксперт: «Чем больше будет сплошных санитарных рубок вблизи Байкала, тем больше будет смываться глины, песка и биогенных элементов в озеро и впадающие в него водотоки, причиняя ущерб водным биоресурсам». Кроме того, может вырасти пожарная опасность, потому что проведение сплошных рубок потребует строительства новых дорог. Это увеличит доступность территории и, соответственно, риск возникновения пожаров, в подавляющем большинстве которых виноват человек. Также экологов беспокоит норма, которая разрешает «фактически неограниченно строить дороги» в центральной экологической зоне Байкальской природной территории, говорит Крейндлин. Строительство линейных объектов, особенно дорог, всегда приводит к фрагментации природных комплексов и, как следствие, их деградации, передал он позицию своих коллег. Сплошные рубки не нужны в законопроекте, считает директор Центра по проблемам экологии и продуктивности лесов РАН, председатель научного совета РАН по лесу Наталья Лукина. По ее словам, руководитель Рослесхоза Иван Советников предлагал проведение сплошных рубок на участке 6 тыс. га. Он объяснял, что специалисты обследовали этот участок и установили факт гибели древостоя, поэтому нужны рубки и лесовосстановление. «Для нас просто удивительно, если речь идет именно об участке 6 тыс. га, неужели действительно для участка такой площади в законопроект необходимо включать сплошные рубки, на наш взгляд, они не нужны в законопроекте. Мы должны обосновать и показать эти самые точечные решения, о которых говорили ранее», — утверждала Лукина. 6 июля был опубликован проект решения Комитета всемирного наследия ЮНЕСКО, в котором он выражает обеспокоенность «неопределенной правовой защитой Байкала». «[Комитет всемирного наследия] повторно выражает обеспокоенность из-за ослабления правовой защиты объекта в то время, когда его экологическое состояние продолжает ухудшаться, <...> и настоятельно призывает государство-участника обеспечить и стабилизировать правовой статус объекта для защиты его выдающейся всемирной ценности», — говорится в проекте решения. Там также призвали российские власти избегать любых законодательных изменений, которые могут привести к неблагоприятным последствиям. Ученые призвали Володина не принимать закон о сплошных рубках на Байкале Политика Как идет работа над законопроектом о Байкале Законопроект, о котором идет речь, был внесен в Госдуму в июне 2023 года и принят в первом чтении в июле того же года. В первой версии содержалась норма, разрешавшая сплошные рубки в центральной экологической зоне Байкальской природной территории для строительства и эксплуатации не только селезащитных и гидротехнических сооружений, но и гостиниц, кафе, туалетов, автомобильных дорог и т.д. Там также были прописаны запрет на увеличение площади особой экономической зоны «Ворота Байкала» и создание новых экономических зон в центральной экологической зоне Байкальской природной территории. Весь следующий год законопроект лежал без движения, пока в июне 2024 года не появилась версия ко второму чтению. Она существенно отличалась от первоначальной: законопроект был расширен, в нем появилось понятие частной собственности на Байкале (сейчас она там запрещена), появилось положение о запрете сплошных рубок, но с оговорками (в том числе разрешались сплошные рубки погибшего леса (например, выгоревшего), если нельзя очистить пострадавшую территорию и заменить лес на здоровый с помощью выборочных рубок), и т.д. После этого в разное время были подготовлены еще несколько вариантов поправок к законопроекту, но ни один из предлагавшихся вариантов пока не был рассмотрен на заседании профильного комитета Госдумы по экологии. Официально срок представления поправок истек 1 июля 2024 года.	7	\N	2025-07-08 08:35:01	2025-07-08 08:35:01
1335	4508	razreshite-dolozhit-kakim-gubernatorom-i-ministrom-byl-starovoyt-video	«Разрешите доложить»: каким губернатором и министром был Старовойт. Видео		Video Роман Старовойт за последние 15 лет успел поработать главой Росавтодора, заместителем министра транспорта, губернатором Курской области и министром транспорта. Работа на посту губернатора пришлась на время пандемии и специальной военной операции на Украине, когда он неоднократно выступал с видеообращениями к жителям Курской области. На посту министра транспорта он проработал чуть более года — с мая 2024 года. Как он рассказывал и докладывал об обстановке — в видео РБК. Утром 7 июля вышел указ об отставке Старовойта с поста министра транспорта. Позже стало известно о его самоубийстве. Источники РБК сообщали ранее, что Старовойта могли допросить по уголовному делу о хищениях при строительстве фортификационных сооружений. По этому делу был задержан его преемник на посту губернатора Алексей Смирнов. Что известно о самоубийстве экс-министра транспорта Старовойта. Главное Политика	9	\N	2025-07-08 08:35:01	2025-07-08 08:35:01
1336	4504	izvestiya-uznali-chto-kabmin-odobril-spisanie-dolgov-po-nalogam-bez-suda	«Известия» узнали, что кабмин одобрил списание долгов по налогам без суда		По новым правилам ФНС будет уведомлять должников через «Госуслуги» или личный кабинет на сайте ведомства. У граждан будет месяц на подачу возражений. Если человек не отреагирует, средства спишут автоматически Правительственная комиссия 7 июля поддержала поправки, упрощающие взыскание задолженностей по налогам. Они подготовлены ко второму чтению законопроекта, разработанного Минфином, пишут «Известия» со ссылкой на источник в правительстве. Законопроект был подготовлен по поручению президента. В марте Госдума приняла его в первом чтении. В настоящее время внесудебный порядок взыскания налоговых долгов применяется только к бизнесу, но с ноября 2025 года его планируют распространить и на граждан. Новые правила коснутся тех, кто самостоятельно заявляет о своих налоговых обязательствах — например, при подаче декларации или при самозанятости. rbc.group Сейчас налоговая подает в суд, который выносит решение без заседания и передает его приставам. Гражданин получает уведомление через федеральные сервисы. Если он не согласен, то может подать краткое возражение — тогда приказ отменят. Но если пропустить срок, налоговая почти всегда выигрывает дело, говорит глава Союза бухгалтеров и налоговых консультантов, основатель компании BiznesiNalogi Евгения Мемрук. rbc.group Процесс может растянуться на год, за который долг постепенно растет из-за пеней, госпошлины и исполнительского сбора, пояснила юрист. Согласно новым правилам, налоговая будет направлять гражданам через «Госуслуги» или их личный кабинет на сайте ФНС уведомления или требования об уплате долга. Если гражданин не заплатит и не подаст возражения в течение месяца, инспекция вынесет решение о взыскании. ФНС спишет деньги со счетов, а при их нехватке передаст дело приставам, которые будут взыскивать средства за счет имущества. Если возражение подано, налоговая, как и раньше, пойдет в суд. Россияне столкнулись с двойным налогообложением при работе с Казахстаном Общество Согласно документу, при взыскании долгов будут действовать те же гарантии, что и при обычном принудительном изъятии — например, сохранение прожиточного минимума и блок на арест определенного имущества. Среди плюсов новых правил в ФНС отметили увеличение срока на возражения граждан и упрощение способа их подачи, а также защиту спорных сумм — если налогоплательщик оспаривает платеж, эти средства нельзя будет списать до окончательного решения суда. Сейчас такой гарантии нет.  О необходимости введения внесудебного взыскания налоговых задолженностей ранее говорили Минфин и Верховный суд. Опрошенные РБК эксперты предупредили о необходимости избегать ошибок в этом вопросе. Читайте РБК в Telegram.	2	\N	2025-07-08 08:35:01	2025-07-08 08:35:01
1337	4494	wsj-uznala-skolko-oruzhiya-poobeshchal-zelenskomu-tramp	WSJ узнала, сколько оружия пообещал Зеленскому Трамп	https://s0.rbk.ru/v6_top_pics/media/img/5/83/347519481839835.jpeg	Трамп в беседе с Зеленским 4 июля пообещал ему, что США направят столько оружия, сколько смогут, пишет WSJ. Трамп в ночь на 8 июля подтвердил намерение передать Киеву больше оружия. Россия осуждает военную помощь Украине Дональд Трамп (Фото: Hu Yousong / XinHua / Global Look Press) Президент США Дональд Трамп в беседе с украинским коллегой Владимиром Зеленским 4 июля пообещал ему, что Вашингтон направит на Украину «столько оружия, сколько сможет». Об этом сообщает газета The Wall Street Journal (WSJ) со ссылкой на осведомленные источники. Тем не менее поставки по-прежнему остаются под вопросом, сказал WSJ представитель Пентагона. Как сообщает издание, поставки вооружения Киеву из США по-прежнему приостановлены. В частности, Вашингтон задерживает поставку на Украину зенитно-ракетных комплексов (ЗРК) Patriot, ракет AIM-120, гаубиц, ракет AGM-114 Hellfire, ракет GMLRS для РСЗО HIMARS, ракет для ПЗРК Stinger и гранатометов. rbc.group Трамп пообещал поставить больше оружия Украине Политика rbc.group По сведениям WSJ, Трамп во время беседы сказал Зеленскому, что он не стоит за приостановкой поставок оружия США Киеву. Он отметил, что поручил провести проверку запасов Пентагона после ударов по Ирану в прошлом месяце, но не замораживал поставки. В начале июля Politico и NBC сообщили, что США приостановили поставки некоторых видов оружия Украине, включая ракеты для системы ПВО Patriot. The Economist со ссылкой на украинских чиновников писал, что США прекратили поставки Украине всей военной помощи, а не только отдельных категорий вооружения. В ответ на вопрос о том, принадлежит ли решение о приостановке поставок ряда видов вооружений Украине лично Трампу, пресс-секретарь Белого дома Кэролайн Левитт впоследствии заявила, что «это стандартная проверка Пентагона всей военной помощи, которую США оказывают всем странам и регионам мира, а не только Украине». Киев заявил, что не получал официальных уведомлений по поводу приостановки поставок оружия. МИД Украины вызвал временного поверенного в делах США Джона Хинкеля. Президент Украины Владимир Зеленский заявил, что Киев проясняет ситуацию в диалоге с Вашингтоном. Трамп в ночь на 8 июля заявил, что США будут продолжать поставки оружия Украине и намерены нарастить их. «Мы собираемся отправить больше оружия. Мы должны. Они должны иметь возможность защищать себя. Они сейчас получают очень сильные удары. Мы собираемся отправлять больше оружия, в первую очередь — оборонительного», — сказал он. Пентагон впоследствии подтвердил подготовку к отправке дополнительного оружия на Украину. Россия выступает против поставок военной помощи Украине. Президент Владимир Путин неоднократно говорил, что западные страны, поставляя Киеву вооружения, лишь затягивают боевые действия. Читайте РБК в Telegram.	3	\N	2025-07-08 08:35:01	2025-07-08 08:35:01
1338	4495	mts-zaymetsya-razrabotkoy-mobilnyh-igr	МТС займется разработкой мобильных игр	https://s0.rbk.ru/v6_top_pics/media/img/6/89/347519004876896.jpeg	Оператор займется разработкой собственных мобильных игр, в том числе для детей, чтобы привлечь дополнительную аудиторию. Эксперты отмечают, что такие проекты популярны, требуют небольших инвестиций и часто быстро окупаются МТС MTSS ₽193,05 -0,39% Купить Фото: Михаил Гребенщиков / РБК МТС запустил центр, который будет заниматься разработкой видеоигр, сообщили РБК в самой компании. Первым проектом центра станет детская игра «Киба». Она реализована на платформе Telegram Mini App и включает в себя пять казуальных мини-игр — так называются простые игры с примитивными механиками, чаще всего логические. «Киба» будет ориентирована на детей до 12 лет. Также в работе центра геймификации сейчас находится еще один мультиплатформенный проект, сообщил руководитель центра Альберт Гиновкер. Его сначала тоже запустят на Telegram Apps, но позже планируют опубликовать в магазинах мобильных приложений. «Эта игра будет ориентирована уже на взрослую аудиторию», — отметил он, не уточнив сроки выхода и концепцию проекта. Запустить собственные игры именно в Telegram в МТС решили из-за высокой популярности этой площадки у детей. В компании привели статистику Mediascope, согласно которой на Telegram приходится 18% всего времени, что аудитория от семи до 11 лет проводит в мобильных приложениях. Реализация игры именно на этой платформе, как уточняет представитель МТС, позволила разработать и запустить проект всего за несколько месяцев, что значительно быстрее, чем размещение отдельного приложения в цифровом магазине. Сколько зарабатывают разработчики видеоигр и на чем Подписка на РБК Мобильные игры с «микробюджетами для запуска» — востребованный тренд, считает партнер Exectica Capital Алексей Замесов. «Опыт показывает, что такие проекты хорошо выживают в совокупности: запустил десять игр, три из них выжили и имеют хоть какой-то трафик, а из этих трех одна выстрелила», — объясняет эксперт. Получаемый от игр трафик МТС, по мнению Замесова, сможет использовать для укрепления лояльности аудитории и для продвижения своих продуктов в игровой форме. «Обычно такие проекты требуют минимальных инвестиций, а затраты на продвижение можно регулировать в зависимости от успеха игры», — уточнил он. Глава агентства TelecomDaily Денис Кусков назвал запуск собственных игровых проектов МТС «пробным камнем». «Telegram активно используется в России и позволит МТС расширить аудиторию, — отметил он. — На старте инвестиций в такой проект с учетом его кросс-платформенности вся разработка вряд ли стоила дороже 3–4 млн руб. Но, скорее всего, при удачной раскрутке это направление получит дальнейшее развитие». Читайте РБК в Telegram.	1	\N	2025-07-08 08:35:01	2025-07-08 08:35:01
1339	4497	politico-nazvalo-klyuch-k-vozobnovleniyu-postavok-oruzhiya-ssha-ukraine	Politico назвало ключ к возобновлению поставок оружия США Украине		Ключом к возобновлению поставок части оружия Вашингтоном Киеву, приостановленным в начале июля, могут стать ряд встреч американских и украинских высокопоставленных чиновников в Италии и на Украине, сообщает Politico со ссылкой на два источника, знакомых с планированием. Так, спецпосланник президента США Дональда Трампа по Украине Кит Келлог встретится с украинским министром обороны Рустемом Умеровым в Риме на международной конференции по оказанию помощи, рассказали собеседники издания. За этим последуют встречи в Киеве на этой и на следующей неделях. Представитель Келлогга Морган Мерфи заявил, что встреча была назначена до того, как стало известно о приостановке поставок вооружений и изначально не предназначалась для обсуждения военной помощи. rbc.group По словам источников Politico, США дали понять Украине, что поставки инженерного оборудования и некоторых единиц бронетехники вскоре возобновятся, хотя сроки пока не называются. rbc.group 1 июля Politico и NBC News сообщили, что США приостановили поставки части вооружений Украине, включая ракеты для комплексов Patriot. В Пентагоне решение объяснили «пересмотром возможностей» для того, чтобы убедиться, что «военная помощь США соответствует нашими приоритетам в обороне». The Economist писала, что Вашингтон поставил на паузу поставки всей военной помощи Киеву, хотя в Госдепе это отрицали. Киев заявил, что не получал официальных уведомлений по поводу приостановки поставок оружия. МИД Украины вызвал временного поверенного в делах США Джона Хинкеля. Президент Украины Владимир Зеленский заявил, что Киев проясняет ситуацию в диалоге с Вашингтоном. 4 июля Трамп поговорил по телефону с украинским президентом. Зеленский рассказал, что они договорились, что будут работать над увеличением защиты неба. Axios со ссылкой на источник писал, что Трамп сказал Зеленскому, что «хочет помочь с противовоздушной обороной и проверит, «действительно ли что-то было приостановлено». За день до этого у Трампа состоялась беседа с российским президентом Владимиром Путиным, после которой американский лидер заявил, что ему не удалось добиться «никакого прогресса» по Украине. Как рассказали в Кремле, Путин повторил, что Россия заинтересована в достижении своих целей, предпочтительно политико-дипломатическими средствами, но пока это не представляется возможным, военная операция продолжится. Москва осуждает военную помощь Киеву. Материал дополняется.	10	\N	2025-07-08 08:35:01	2025-07-08 08:35:01
1340	4499	netanyahu-priehal-k-trampu-s-pismom-o-vydvizhenii-na-nobelevskuyu-premiyu	Нетаньяху приехал к Трампу с письмом о выдвижении на Нобелевскую премию		Нетаньяху вручил Трампу письмо, которое он отослал в Нобелевский комитет. Ранее за его роль в урегулировании конфликта между Ираном и Израилем выдвинуть Трампа на премию предлагали в палате представителей США Премьер-министр Израиля Биньямин Нетаньяху в понедельник сообщил президенту США Дональду Трампу, что выдвинул его на Нобелевскую премию мира, вручив соответствующее письмо во время встречи в Белом доме. Об этом пишет The Hill. «Я хочу представить вам, господин президент, письмо, которое я отправил в комитет Нобелевской премии. В нем выдвигается ваша кандидатура на премию мира, что вполне заслуженно», — сказал Нетаньяху. «Я не знал этого», — сказал Трамп, взяв письмо. «Ого. Большое спасибо. Исходя именно от вас, это очень значимо». rbc.group В понедельник Нетаньяху посетил Белый дом, что стало первой личной встречей с Трампом с тех пор, как президент приказал США нанести удары по иранским ядерным объектам. 23 июня Трамп объявил, что Израиль и Иран согласились на перемирие, которое положило конец 12-дневному обмену ударами. Тогда президент США выразил уверенность, что перемирие Израиля и Ирана будет «вечным». rbc.group Как отмечает The Guardian, ожидается, что Трамп будет настаивать на том, чтобы Нетаньяху согласился на перемирие в 21-месячной войне Израиля против ХАМАС в секторе Газа. Болтон заявил, что Трамп бросит Украину ради Нобелевской премии мира Политика Ранее выдвинуть Трампа на Нобелевскую премию мира также предложил конгрессмен-республиканец Бадди Картер. В письме, которое Картер отправил в Нобелевский комитет, говорилось, что Трамп сыграл «экстраординарную и историческую роль» в предотвращении получения «крупнейшим в мире государством — спонсором терроризма самого смертоносного оружия на планете». В январе 2024 года член палаты представителей от Республиканской партии Клаудия Тенни выдвинула Трампа на Нобелевскую премию мира за содействие подписанию так называемых «Соглашений Авраама». В сентябре 2020 года, во время первого президентского срока Трампа, в Вашингтоне при посредничестве США были подписаны документы о нормализации отношений Израиля с Бахрейном и ОАЭ. Сделка получила название «Соглашения Авраама», отсылающее к патриарху Аврааму, который считается духовным предком верующих всех авраамических религий, в том числе ислама, христианства и иудаизма. Кандидатуру Трампа на соискание Нобелевской премии мира в июне также предлагало правительство Пакистана. Там отметили вклад президента США в урегулирование конфликта страны с Индией. В правительстве Пакистана также отметили, что Трамп «продемонстрировал выдающуюся государственную мудрость», взаимодействуя одновременно и с Исламабадом, и с Нью-Дели путем дипломатии. Сам Трамп говорил, что заслуживает такую награду, но выражал сомнения в том, что ему вручат премию. Читайте РБК в Telegram.	3	\N	2025-07-08 08:35:01	2025-07-08 08:35:01
1341	4524	v-rossii-za-polgoda-sokratilos-proizvodstvo-tolko-odnoy-kategorii-vin	В России за полгода сократилось производство только одной категории вин	https://s0.rbk.ru/v6_top_pics/media/img/9/24/347519035609249.webp	На фоне общего снижения объемов производства алкогольной продукции в России единственной категорией, которая демонстрирует рост, остается виноПодпишитесь на телеграм-канал «РБК Вино»На фоне общего снижения объемов производства алкогольной продукции в России единственной категорией, которая демонстрирует рост, остается вино. Это следует из данных Росалкогольтабакконтроля, поступивших в «РБК Вино» (учет пива, пивных напитков и сидра ведомство ведет отдельно). Исключением стали ликерные винаТак, за январь—июнь 2025 года объем производства тихих вин вырос на 12,4% до 17,6 млн дал, а объем игристых вин — на 18,5% до 7,2 млн дал. Объем производства ликерных же сократился за полгода на 9,6% до 644,9 тыс. дал.«РБК Вино» создал онлайн-сомелье, который поможет вам подобрать подходящее вино — чтобы воспользоваться им, необходимо запустить бот в Telegram. Наш бот поможет вам с выбором, даже если вы только начинаете свое знакомство с увлекательным миром вина.Александр Ставцев, вице-президент Ассоциации экспертов рынка ретейла, говорит о том, что падение в категории ликерных вин связано в первую очередь с повышением акциза на спирт, который используется при изготовлении этой продукции. Наиболее сильно это, по его словам, отразилось на сегменте недорогих ординарных портвейнов и кагоров, но меньше затронуло премиальные ликерные вина.«Марки премиальных ликерных вин все равно найдут своего покупателя, потому что там разница в стоимости плюс-минус 100 руб. не критична, а вот недорогие крепленые вина делать стало невыгодно. А именно они составляли значимую часть этой категории», — считает он.Ставцев также добавил, что ликерные вина — это в целом нишевая категория, которая сейчас сохранилась в виде ностальгического потребления или используется в коктейлях. Кроме того, эксперт считает, что в России существует нехватка хересов, которых производят десятками тысяч бутылок в то время, как удавалось бы продавать и 100, и 150 тыс. бутылок.Закон о повышении с 2025 года акцизов на алкоголь был принят Госдумой в октябре 2024 года. Согласно ему, акциз на этиловый спирт и спиртосодержащую продукцию в 2025 году составил 740 руб. за 1 литр безводного спирта, в 2026 году он вырастет до 770 руб., а в 2027 году — до 801 руб. На момент принятия изменений в 2024 году ставка акциза составляла 643 руб. за 1 литр.Объемы производства алкоголя во всех категориях, которые учитывает статистика, продолжают падатьОбъемы производства алкоголя во всех категориях, которые учитывает статистика, продолжают падать. Так, общий объем сокращения составил 14,1 млн дал или 16,1% по сравнению с данными за аналогичный период 2024 года. Из-за перевода напитков в другие категории сильнее всего сократились показатели в слабоалкогольной продукции (-91,6%), плодовой алкогольной продукции (-84,7%) и в сегменте виноградосодержащих напитков с этиловым спиртом и без него (падение от 60,5% до 73,2%).Кроме того, на 17% упало производство коньяка. Если за первое полугодие 2024 года оно составляло 4,1 млн дал, то в текущем году — только 3,9 млн дал. Водка просела на 10,9% до 31,3 млн дал, а ликеро-водочные изделия потеряли за полгода 0,5%. Их объем производства составляет 8 млн дал.Президент гильдии экспертов алкогольного рынка «Алкопро» Андрей Московский ранее говорил о связи сокращения объемов производства водки и коньяка в России с сокращением продаж этого алкоголя. «Можно сказать, что по продажам мы вышли на пик в этих товарах и сейчас у нас идет плато. То есть продажи водки и коньяка не растут. Произведенная и просто выставленная на склад водка — это замороженные деньги, а при нынешней ставке для производителей это могут быть достаточно большие суммы», — говорил он. Эксперт также называл вероятным в ближайшие годы процесс укрупнения производителей водки и ухода с рынка мелких, региональных заводов.Сократился и выпуск в категории других спиртных напитков, куда относят виски, ром, текилу, джин и тд. По словам Ставцева, данные статистики не отражают роста объемов производства в некоторых небольших категориях крепкого алкоголя, таких как текила, джин или виски. «В случае с этими напитками возможен рост в тысячи процентов с низкой базы, но они включены в более крупные категории, поэтому отдельно динамику по ним не видно», — считает эксперт.	7	\N	2025-07-08 09:00:02	2025-07-08 09:00:02
1342	4518	tramp-poobeshchal-postavit-bolshe-oruzhiya-ukraine	Трамп пообещал поставить больше оружия Украине	https://s0.rbk.ru/v6_top_pics/media/img/2/47/347519482889472.jpeg	По словам Трампа, акцент будет сделан на оборонительных вооружениях, поскольку Украина «должна иметь возможность защищать себя». Россия осуждает военную помощь Киеву Дональд Трамп (Фото: Al Drago / CNP/ Global Look Press) США будут продолжать поставки оружия Украине и намерены нарастить их. Об этом заявил американский президент Дональд Трамп на встрече с израильским премьером Биньямином Нетаньяху, Трансляцию вело агентство Associated Press. Речь идет в первую очередь об оборонительных средствах, подчеркнул Трамп. «Мы собираемся отправить больше оружия. Мы должны. Они должны иметь возможность защищать себя. Они сейчас получают очень сильные удары. Мы собираемся отправлять больше оружия, в первую очередь оборонительного», — сказал он. Зеленский анонсировал увеличение производства дальнобойного оружия Политика В начале июля Politico и NBC сообщили, что США приостановили поставки некоторых видов оружия Украине, включая ракеты для системы ПВО Patriot. The Economist со ссылкой на украинских чиновников писал, что США прекратили поставки Украине всей военной помощи, а не только отдельных категорий вооружения. rbc.group В ответ на вопрос о том, принадлежит ли решение о приостановке поставок ряда видов вооружений Украине лично Трампу, пресс-секретарь Белого дома Кэролайн Левитт впоследствии заявила, что «это стандартная проверка Пентагона всей военной помощи, которую США оказывают всем странам и регионам мира, а не только Украине». Киев заявил, что не получал официальных уведомлений по поводу приостановки поставок оружия. МИД Украины вызвал временного поверенного в делах США Джона Хинкеля. Президент Украины Владимир Зеленский заявил, что Киев проясняет ситуацию в диалоге с Вашингтоном. 4 июля Зеленский и Трамп поговорили по телефону. Украинский президент назвал прошедший разговор «очень важным и полезным». По словам украинского президента, они обсудили ситуацию на фронте и договорились, что будут работать над увеличением защиты неба. Axios со ссылкой на источник писал, что Трамп сказал Зеленскому, что «хочет помочь с противовоздушной обороной и проверит, «действительно ли что-то было приостановлено». По сведениям The Wall Street Journal, Трамп во время беседы сказал Зеленскому, что он не стоит за приостановкой поставок оружия. Он отметил, что поручил провести проверку запасов Пентагона после ударов по Ирану в прошлом месяце, но не заморозил поставки. Как пишет издание, президент США также заверил Зеленского, что США отправят столько помощи, сколько смогут, хотя поставки все еще приостановлены. Россия выступает против поставок военной помощи Украине. Президент Владимир Путин неоднократно говорил, что западные страны, поставляя Киеву вооружения, лишь затягивают боевые действия. Читайте РБК в Telegram.	10	\N	2025-07-08 09:00:02	2025-07-08 09:00:02
1343	4522	pentagon-anonsiroval-otpravku-dopolnitelnogo-oruzhiya-na-ukrainu	Пентагон анонсировал отправку дополнительного оружия на Украину	https://s0.rbk.ru/v6_top_pics/media/img/3/95/347519543592953.jpeg	Пентагон после того, как Трамп пообещал поставить Киеву больше оружия, в первую очередь для обороны, анонсировал его отправку. Москва осуждает военную помощь Украине Фото: Анатолий Степанов / Reuters США готовятся отправить на Украину дополнительное вооружение для обороны. Об этом говорится в заявлении, опубликованном на сайте Пентагона. «По указанию президента [США Дональда] Трампа Министерство обороны направит дополнительное оборонительное оружие на Украину, чтобы гарантировать, что украинцы смогут защитить себя, пока мы работаем над обеспечением прочного мира», — сказано в сообщении. WSJ узнала, сколько оружия пообещал Зеленскому Трамп Политика rbc.group Трамп ранее заявил, что его страна продолжит поставки оружия Украине и собирается их нарастить. rbc.group «Мы собираемся отправить больше оружия. Мы должны. Они должны иметь возможность защищать себя. Они сейчас получают очень сильные удары. Мы собираемся отправлять больше оружия, в первую очередь оборонительного», — сказал он. В начале июля Politico и NBC сообщили, что США приостановили поставки некоторых видов оружия Украине, включая ракеты для системы ПВО Patriot. The Economist со ссылкой на украинских чиновников писал, что США прекратили поставки Украине всей военной помощи, а не только отдельных категорий вооружения. Газета The Wall Street Journal (WSJ) утверждала, что Вашингтон задерживает поставку на Украину зенитно-ракетных комплексов (ЗРК) Patriot, ракет AIM-120, гаубиц, ракет AGM-114 Hellfire, ракет GMLRS для РСЗО HIMARS, ракет для ПЗРК Stinger и гранатометов. По сведениям издания, пока поставки оружия остаются приостановленными. Киев заявил, что не получал официальных уведомлений по поводу приостановки поставок оружия, и проясняет ситуацию в диалоге с Вашингтоном. Белый дом объяснил остановку поставок «стандартной проверкой» Пентагоном всей военной помощи, которую США оказывают всем странам и регионам. 4 июля Трамп поговорил по телефону с украинским коллегой Владимиром Зеленским. Последний описал беседу как лучшую за все время и «максимально продуктивную». Россия выступает против поставок военной помощи Украине. Президент Владимир Путин неоднократно говорил, что западные страны, поставляя Киеву вооружения, лишь затягивают боевые действия. Читайте РБК в Telegram.	5	\N	2025-07-08 09:00:02	2025-07-08 09:00:02
1344	4510	golos-obyavil-o-prekrashchenii-deyatelnosti-posle-prigovora-melkonyancu	«Голос» объявил о прекращении деятельности после приговора Мельконьянцу	https://s0.rbk.ru/v6_top_pics/media/img/1/27/347519520381271.jpeg	Движение «Голос» прекратило работу после приговора его сопредседателю Григорию Мельконьянцу. В организации заявили, что дальнейшая деятельность сопряжена с риском уголовного преследования для сторонников Григорий Мельконьянц (Фото: Максим Шипенков / ЕРА / ТАСС) Общероссийское общественное движение в защиту прав избирателей «Голос» (включено в реестр иностранных агентов) завершило свою работу. Об этом говорится в официальном заявлении, поступившем в РБК. Прекращение деятельности связано с приговором сопредседателю движения Григорию Мельконьянцу, которого 14 мая судья Басманного суда Москвы Евгения Николаева признала виновным в организации деятельности нежелательной организации и отправила на пять лет в колонию общего режима. В руководстве движения подчеркнули, что теперь любые формы участия в работе «Голоса» могут повлечь за собой уголовную ответственность. «Это окончание истории, которая, по версии следствия и суда, длилась 25 лет. <...> Справедливость, увы, побеждает не всегда — за нее нужно бороться. И всегда есть риск проиграть. В этот раз получилось так», — говорится в заявлении. Его авторы отмечают, что в условиях уголовного преследования невозможно продолжать деятельность даже в ограниченном формате: под угрозой могут оказаться не только активисты, но и даже те, кто обращался за юридической помощью и делал репосты публикаций движения. rbc.group Согласно сообщению, сегодня были досрочно прекращены полномочия членов совета движения, председателей и членов региональных отделений, а также членов ревизионной комиссии. Прекращена работа всех проектов, включая один из самых известных — «Карту нарушений», где во время выборов на протяжении многих лет размещалась информация о возможных нарушениях на избирательных участках. Обновление сайта и аккаунтов в социальных сетях остановлено. Подписки на пожертвования, направляемые в адрес партнерских организаций, с сегодняшнего дня также прекращены. rbc.group В движении «Голос» подчеркивают, что не ставили перед собой задачу обеспечивать победу каких-либо политических сил, поскольку считают наблюдение за выборами не формой политической деятельности, а способом защиты конституционного строя и одним из гарантируемых прав граждан. В заявлении также содержится рекомендация удалить репосты публикаций движения, чтобы избежать возможного преследования за распространение материалов нежелательной организации. «Голос» не включен в соответствующий перечень Минюста. В августе 2023 года сопредседатель движения Григорий Мельконьянц был задержан и вскоре отправлен в СИЗО по обвинению в организации деятельности нежелательной неправительственной организации. Следствие сочло, что «Голос» связан с международной сетью ENEMO, признанной осенью 2021 года нежелательной на территории России. Спустя более полутора лет, в мае 2025 года, Басманный суд Москвы приговорил Мельконьянца к пяти годам лишения свободы в исправительной колонии общего режима. Кроме того, электоральному эксперту запретили заниматься общественной деятельностью еще девять лет после отбытия основного срока. Адвокаты Мельконьянца намерены оспорить приговор, однако дата рассмотрения апелляционной жалобы еще не назначена. В тексте приговора Григорию Мельконьянцу суд установил принадлежность «Голоса» к «Европейской сети организаций по наблюдению за выборами» (ENEMO, в сентябре 2021 года Генпрокуратура признала ее нежелательной). В движении настаивают, что ENEMO никогда не вела работу в стране, а «Голосу» не было предъявлено доказательств противоправной деятельности или ущерба государственным интересам. В подтверждение этого тезиса в ходе прений сторон 12 мая Мельконьянц приводил ответ из Министерства юстиции, в котором говорилось об отсутствии у ЕNЕМО структурных подразделений в России. Общероссийское общественное движение в защиту прав избирателей «Голос» — одно из старейших и наиболее известных объединений в России, специализирующихся на независимом наблюдении за выборами. Организация была основана в 2000 году как некоммерческое партнерство, а позднее, после вступления в силу закона об иностранных агентах, преобразована в общественное движение без юридического лица. В разные годы «Голос» проводил обучение наблюдателей, оказывал юридическую помощь по вопросам избирательных прав, запускал горячие линии и онлайн-сервисы для фиксирования возможных нарушений в ходе выборов. Одним из самых известных проектов движения стала «Карта нарушений» — цифровая платформа, на которую избиратели и наблюдатели могли отправлять сообщения о предполагаемых фальсификациях. «Голос» осуществлял как краткосрочное, так и долгосрочное наблюдение за выборами федерального, регионального и муниципального уровней. В 2013 году ассоциация некоммерческих организаций «В защиту прав избирателей «Голос» стала первым юридическим лицом, включенным Минюстом в реестр иностранных агентов. Вскоре после этого организация была ликвидирована, а работа продолжилась на общественных началах — без регистрации, но с сохранением федеральной и региональной структуры.	1	\N	2025-07-08 09:00:02	2025-07-08 09:00:02
1345	4511	siloviki-prishli-v-shtab-kvartiru-elektrosetey-armenii-karapetyana	Силовики пришли в штаб-квартиру «Электросетей Армении» Карапетяна		Силовики вошли в здание штаб-квартиры «Электросетей» Карапетяна, а также пришли с обысками к главе совета председателей компании, племяннику бизнесмена Нареку. Парламент Армении ранее одобрил национализацию «Электросетей» Утром сотрудники правоохранительных органов вошли в здание головного офиса «Элетросетей Армении» арестованного бизнесмена Самвела Карапетяна и не пускают сотрудников в штаб-квартиру компании, сообщил пресс-секретарь ЭСА, передает News.am. По данным издания, также силовики пришли в дом племянника Карапетяна Нарека, который является председателем совета директоров компании. В настоящее время у него дома проводят обыски, пишет Hraparak. Нарек Карапетян — сын брата Самвела Карапетяна Карена. Он также занимает пост первого вице-президента в группе компаний «Ташир», куда входят «Электросети». rbc.group Карапетян подал в суд на депутатов Армении после слов о ФСБ и боеголовках Политика rbc.group В головном офисе «Ташира» в Ереване обыски прошли 2 июля. В СК Армении подтвердили, что проводят неотложные следственные действия в рамках уголовного дела. 18 июня Карапетяна арестовали по обвинению в публичных призывах к захвату власти (ч. 2 ст. 422 УК Армении) на фоне его высказываний в поддержку Армянской апостольской церкви (ААЦ), которая критикует премьер-министра Армении Никола Пашиняна. После этого официальный Ереван объявил о решении национализировать и выставить на торги «Электросети». 3 июля парламент Армении одобрил соответствующую инициативу. Она предполагает, что комиссия по регулированию общественных услуг Армении наделяется полномочиями отстранить руководство «Электросетей» и ввести временное управление при выявлении серьезных нарушений в деятельности и проведении расследования. Пашинян после ареста Карапетяна пригрозил уволить сотрудников «Электросетей» за участие в протестах в поддержку бизнесмена, а также привлечь к ответственности руководителей за принуждение работник к участию в акциях. Материал дополняется. Читайте РБК в Telegram.	1	\N	2025-07-08 09:00:02	2025-07-08 09:00:02
1346	4513	yota-i-sbermobayl-rezko-snizili-chislo-otkazov-v-perenose-nomerov	Yota и «СберМобайл» резко снизили число отказов в переносе номеров	https://s0.rbk.ru/v6_top_pics/media/img/9/26/347519096048269.jpeg	За последние полгода Yota и «СберМобайл» снизили процент отказов абонентам в переходе к другим операторам с сохранением номера. Но в целом по рынку компании удовлетворяют менее 50% заявок клиентов Фото: Екатерина Кузьмина / РБК За последние шесть-семь месяцев у операторов «СберМобайл» и «Скартел» (бренд Yota) резко снизилось число отказов в процедуре MNP (mobile number portability — переход к другому оператору с сохранением своего номера мобильного телефона). Это следует из опубликованной в отраслевом журнале «Электросвязь» статистики «НИЦ Телеком», который является оператором базы данных перенесенных номеров (отвечает за технический процесс передачи номера и поддерживает корректную маршрутизацию звонков и сообщений после этого). С июля по сентябрь прошлого года «СберМобайл» отказывал абонентам, желающим перейти к другому оператору, в 75–82% случаев, а в апреле нынешнего года показатель составлял 23%. У «Скартела» с июля прошлого года по апрель текущего показатель снизился с более 80 до 45%. Возможность переходить к другому оператору со своим номером мобильного в России появилась с конца 2013 года. Сейчас можно переносить номер между операторами, работающими в одном регионе. Клиент не сможет перенести номер к другому оператору, если не погасит долг перед компанией-донором (той, от кого уходит). rbc.group В 2023-м резко выросло число желающих перенести номер к другому оператору Технологии и медиа rbc.group В среднем за последний год у всех мобильных операторов процент отказов снизился с 65 до 54%. Наиболее высоким показатель остается у компании «Екатеринбург-2000», которая оказывает услуги под брендом «Мотив» в Свердловской и Курганской областях, Ханты-Мансийском и Ямало-Ненецком автономных округах: последние полтора года он держится на уровне 94,5–97%. Наиболее низкий — у «Т-Мобайла» (оператор Т-банка) — 11–14%. У операторов «большой четверки» за последний год процент отказов в целом почти не менялся: у МТС он колебался с 61 до 71%, у «МегаФона» — с 45 до 63%, у «Т2 РТК Холдинга» (бренд Т2) — с 51 до 60%, у «ВымпелКома» («Билайн») — с 54 до 64%. Всего в 2024 году было перенесено более 2,97 млн номеров, а в первом квартале этого — 1,21 млн. «НИЦ Телеком» не раскрывает данные, от каких операторов и к каким уходили абоненты с сохранением номера. Как пояснил замгендиректора, руководитель аппарата «НИЦ Телеком» Владимир Рисман, в целом спрос на услугу растет — например, в феврале поступило на 15% больше заявок по сравнению с тем же месяцем 2024-го. Снижение доли отказов в переносе на сетях «Скартела» и «СберМобайла», по его мнению, может быть связано с оптимизацией процессов на стороне каждого из операторов и постоянной актуализацией абонентской базы. Рисман напомнил, что с 1 сентября должна заработать процедура независимого арбитража. В конце прошлого года правительство приняло новую редакцию Правил оказания услуг телефонной связи, в которой прописано, что «НИЦ Телеком» будет сверять сведения об абонентах, то есть выступать независимым арбитром в процессе MNP. Как пояснил Рисман, 1 июля начались тестовые испытания нового программного обеспечения для проведения такого арбитража. В них участвуют «ВымпелКом», «МегаФон» и «Т2 РТК Холдинг». По прогнозу топ-менеджера «НИЦ Телеком», после введения независимого арбитража для абонентов смена оператора без потери номера станет более удобной, а для рынка борьба за клиентов будет идти по правилам, так как в игре появится независимый арбитр. «Процесс переноса станет прозрачным, и неправомерные отказы со стороны операторов-доноров в связи с несовпадением сведений об абонентах будут исключены», — рассчитывает он. Почему операторы отказывают в MNP Глава информационно-аналитического агентства TelecomDaily Денис Кусков отмечает, что, несмотря на наличие MNP, операторы стараются не отпускать от себя абонентов: предлагают дополнительные возможности, специальные тарифные планы или ставят определенные препоны — часто, если договор с абонентом был подписан несколько лет назад, последнему бывает сложно подтвердить требуемые сведения. «Скартел» и «СберМобайл», по словам Кускова, — это два ведущих виртуальных оператора мобильной связи (MVNO, работают на сетях существующих операторов), «очень легкие на подъем». Плюс у этих компаний гораздо меньше пользователей, чем у «большой четверки», поэтому они могут воспринимать MNP менее болезненно. Мобильный оператор «Сбера» начал переговоры о создании «суперсети» Технологии и медиа «СберМобайл» в конце мая объявил, что его абонентская база превысила 3,5 млн клиентов. У Yota, по оценке TelecomDaily, около 8 млн абонентов. Для сравнения: крупнейший мобильный оператор в России МТС обслуживал 82,7 млн абонентов по итогам первого квартала. Коммерческий директор телекоммуникационной группы «Мотив» Андрей Золотарев настаивает, что они «строго соблюдают требования законодательства» и порядок взаимодействия в рамках процедуры MNP. «Высокий процент отказов, зафиксированный аналитикой «НИЦ Телеком», обусловлен рядом факторов, которые характерны для рынка в целом. Причин отказа может быть множество, включая некорректные паспортные данные, задолженности абонентов, ошибки при заполнении заявки оператором-реципиентом, а также несоблюдение временных ограничений на перенос номера, предусмотренных законом «О связи», — поясняет Золотарев. Он утверждает, что за 2024 год статистика MNP была в пользу их компании: с сохранением номера к ней перешло 14,4 тыс. абонентов других операторов, а ушло 13,8 тыс. Среди причин, почему абоненты уходят из «Мотива», Золотарев назвал «попытки оптимизировать затраты на услуги связи», среди причин прихода — «лучшее покрытие сети 4G в домашнем регионе» и снижение цен в национальном роуминге. По его оценке, при здоровой конкуренции нормальным будет одинаковый показатель ухода и прихода абонентов по MNP. Глава МТС — РБК: «Какой мы теперь мобильный оператор?» Бизнес Представитель Yota пояснил общее снижение количества отказов в процедуре MNP в их сети тем, что с сентября прошлого года была конкретизирована процедура переноса номера и сокращен необходимый для этого перечень сведений об абоненте. Это привело к снижению процента ошибок при подаче заявлений. Вдобавок к процедуре стали внимательнее относится как абоненты, так и операторы. Представитель «СберМобайла» отметил, что среди новых абонентов, которых компания подключила с начала года, около трети присоединились через процедуру MNP. «При этом почти половина всех заявок на переход от «большой четверки» не завершились — в среднем это около 50 тыс. заявок ежемесячно. Чаще всего в переносе номера на «СберМобайл» отказывает «ВымпелКом» (бренд «Билайн». — РБК) — в январе—июне 2025 года шесть из десяти абонентов, которые подавали заявки на MNP, не смогли совершить переход», — рассказал представитель «СберМобайла». По его словам, процедура MNP все еще не сильно популярна среди абонентов, но для телеком-компаний это один из самых значимых драйверов роста. Он считает здоровым для рынка нулевой процент отказа в MNP. «Также эта процедура должна происходить моментально, так как все данные абонента уже подтверждены через «Госуслуги». На уровне оператора эти сроки вполне реалистичны. Но очень часто операторы-доноры искусственно затягивают этот процесс, что ограничивает пользователя», — указал он. Представитель «ВымпелКома» заявил, что они «придерживаются неукоснительного соблюдения требований применимого законодательства в области связи». «ВымпелКом» не допускает необоснованных отказов в перенесении абонентских номеров, — заверил он. — В каждом конкретном случае, при котором происходит прекращение процесса перенесения абонентского номера, мы направляем в адрес оператора-реципиента код ошибки, из-за которой произошло такое прекращение. Наиболее частыми причинами прекращения портации являются отказ самого абонента, несоответствие персональных данных в заявке и абонентском договоре, а также задолженность». Читайте РБК в Telegram.	7	\N	2025-07-08 09:00:03	2025-07-08 09:00:03
1347	4532	wildberries-protestiruet-dostavku-gotovoy-edy-iz-restoranov	Wildberries протестирует доставку готовой еды из ресторанов	https://s0.rbk.ru/v6_top_pics/media/img/6/51/347519151687516.jpeg	Wildberries запускает в тестовом режиме услугу экспресс-доставки готовых блюд из ресторанов и кафе. В 2021 году компания уже пыталась выйти на этот рынок, но тогда проект не продвинулся дальше стадии эксперимента Фото: Олег Елков / Shutterstock Объединенная компания Wildberries и Russ в тестовом режиме запускает доставку готовой еды, которая будет приготовлена и доставлена силами партнеров в течение часа, рассказал РБК представитель площадки. Первым к пилотному FoodTech-проекту подключится сервис доставки еды «Dostaевский», работающий в формате dark kitchen (ориентированная на доставку кухня без посадочных мест). На витрине маркетплейса будет представлено все меню «Dostaевского» — более 450 позиций готовой еды. Сначала услуга будет доступна для жителей определенных районов Москвы и Санкт-Петербурга — в пределах зон доставки «Dostaевского». На следующих этапах компании планируют запуск в Краснодаре, Сочи, Новосибирске, Ярославле, Тюмени и Уфе. «С выходом на рынок доставки готовых блюд наступает новый этап развития продуктового направления внутри экосистемы Wildberries и Russ. <...> Мы находимся только на стартовой позиции FoodTech-направления, который планируем масштабировать по всем регионам присутствия компании», — заявила руководитель направления доставки силами продавца объединенной компании Wildberries и Russ Елизавета Шлеин. Представитель Wildberries подчеркнул, что при заказе на маркетплейсе цены будут теми же, что у «Dostaевского». «Отдельной комиссии при таких партнерствах не предусмотрено, она будет установлена согласно единой оферте и составит до 3%», — сообщил он. Минимальную сумму заказа партнер устанавливает самостоятельно — в Москве она составит 550 руб., в Санкт-Петербурге — 500 руб. rbc.group Онлайн-площадка, по словам ее представителя, ведет переговоры с рядом крупных игроков ресторанной индустрии, но детали он не раскрыл. rbc.group Объем рынка доставки готовой еды из ресторанов по итогам 2024 года вырос на 30% и достиг 649 млрд руб., следует из данных «РБК Исследования рынков». По итогам первого полугодия 2024 года продукты питания впервые обогнали товары для дома, одежду и электронику по обороту покупок в интернете. Wildberries уже предпринимала попытку выйти на рынок продажи готовой еды из ресторанов на фоне пандемии коронавируса в 2021 году. В компании поясняют, что проект был частью направления экспресс-доставки, а его тестирование длилось непродолжительное время. «За этот период нам удалось понять, какие технические доработки требуются для проекта, а также собрать обратную связь от пользователей и оценить уровень функционирования услуги для ее введения в более поздний период», — указал собеседник РБК в компании. Читайте РБК в Telegram.	8	\N	2025-07-08 09:05:02	2025-07-08 09:05:02
1348	4549	umerla-zasluzhennaya-artistka-rossii-dressirovshchica-nina-kornilova	Умерла заслуженная артистка России дрессировщица Нина Корнилова	https://s0.rbk.ru/v6_top_pics/media/img/9/90/347519539383909.jpeg	Нина Корнилова (Фото: Росгорцирк) На 99-м году жизни умерла заслуженная артистка России дрессировщица слонов Нина Корнилова, сообщает пресс-служба Большого Московского цирка в телеграм-канале. «Мастерство дрессуры и артистизм сделали ее одной из самых уважаемых фигур в мире циркового искусства, а любовь Нины Андреевны к животным и умение находить с ними общий язык поражали всех, кто имел честь видеть ее выступления», — говорится в сообщении. Корнилова родилась в декабре 1926 года. Как рассказывала сама артистка, во время войны ее семья оказалась в Пензе, туда «приехал Ростовский театр оперетты, при котором открылась балетная студия». «Я туда поступила и работала балериной до 1943 года», — вспоминала артистка. В 16 лет Корнилову зачислили в систему главного управления цирками в создаваемый номер ­«Ривьера». Материал дополняется rbc.group Читайте РБК в Telegram.	9	\N	2025-07-08 09:15:01	2025-07-08 09:15:01
1349	4608	pashinyan-zayavil-chto-budet-rukovodit-osvobozhdeniem-armyanskoy-cerkvi	Пашинян заявил, что будет руководить «освобождением» Армянской церкви	https://s0.rbk.ru/v6_top_pics/media/img/8/19/347519557067198.jpeg	Пашинян заявил, что Армянская апостольская церковь захватила «антихристианская группировка» и что он намерен возглавить ее «освобождение». Под арестом находятся ряд священников ААЦ Никол Пашинян (Фото: Laurent Gillieron / EPA / ТАСС) Премьер-министр Армении Никол Пашинян заявил, что за время его конфликта с Армянской апостольской церковью (ААЦ) выяснилось «отсутствие связи и отношений» с Иисусом Христом и его учением ряда высокопоставленных священников ААЦ, включая ее главу, католикоса всех армян Гарегина II. Об этом армянский премьер написал в Facebook (принадлежит Meta, признанной экстремистской и запрещенной в России). По мнению Пашиняна, духовный и административный центр ААЦ, Первопрестольный Эчмиадзин, «захвачен антихристианской, распутной, антинациональной, антигосударственной группировкой и должен быть освобожден». «Я буду руководить этим освобождением», — заявил премьер. rbc.group В «отсутствии связей» с Иисусом Христом Пашинян также обвинил лидера движения «Священная борьба», архиепископа ААЦ Баграта Галстаняна и главу Ширакской епархии ААЦ Микаэля Аджапахяна, арестованных в конце июня по обвинению в призывах к захвату власти. rbc.group Накануне армянский премьер заявил, что если Гарегин II считает аресты этих священников незаконными, то он «разделяет идеологию и планы указанных лиц совершить военный переворот, <...> создать хаос в стране». «Особенно в данном случае ни один участок укрупненной общины Вагаршапат (там находится Первопрестольный Эчмиадзин. — РБК) не может быть закрыт для деятельности правоохранительных органов», — написал Пашинян в Facebook. После этого 24news сообщил о подготовке следственной группы и силовиков для проведения обысков в Эчмиадзине 7 и 8 июля. 27 июня силовики пытались задержать Аджапахяна на территории Эчмиадзина, там между ними и священниками, а также протестующими произошли потасовки. Аджапахяну стало плохо во время задержания, позже он сам пришел в СК. Священник считает обвинения против себя сфабрикованными. Конфликту между представителями властей Армении и церкви предшествовала критика Пашиняна в адрес главы ААЦ Гарегина II, которого премьер обвинил в нарушении обета безбрачия, потребовав от него оставить пост. В ответ в ААЦ заявили, что вопросы, касающиеся церкви, «решаются в соответствии с церковными канонами и уставами и не входят в сферу компетенции государственных и политических деятелей». В июне Пашинян заявил о предотвращении попытки переворота в Армении, упоминалось движение «Священная борьба». Вскоре были арестованы более десяти его сторонников. Также в середине июня был арестован глава группы компаний «Ташир» Самвел Карапетян, который выступал в поддержку ААЦ. Читайте РБК в Telegram.	5	\N	2025-07-08 09:55:03	2025-07-08 09:55:03
1350	4658	kazahstan-podgotovit-otvet-na-pismo-trampa-o-poshlinah	Казахстан подготовит ответ на письмо Трампа о пошлинах		Минторг Казахстана сообщил, что готовит официальный ответ в связи с письмом Трампа о введении с 1 августа 25-процентных пошлин на поставляемые в США казахстанские товары. Речи об ответных мерах не идет, добавили там Министерство торговли и интеграции Казахстана подготовит ответ на введение США пошлин на поставляемые в Штаты казахстанские товары, заявили в пресс-службе ведомства. «В связи с введением США 25% пошлины на товары из Казахстана министерство торговли и интеграции Республики Казахстан готовит официальный ответ», — приводит сообщение «РИА Новости». В комментарии ТАСС ведомство подчеркнуло, что «речи об ответных мерах не идет» rbc.group Трамп показал письмо Токаеву про пошлины для Казахстана в 25% Политика rbc.group 7 июля президент США Дональд Трамп показал письма о введении пошлин с 1 августа на товары из ряда стран, включая Казахстан. «Если по какой-либо причине вы решите ввести свои тарифы, то, на каком бы уровне вы их ни установили, эта цифра будет добавлена к нашим 25%. Пожалуйста, поймите, что эти тарифы необходимы для исправления торговых барьеров», — сказано в письме Трампа на имя президента Казахстана Касым-Жомарта Токаева. Фото: realDonaldTrump / TruthФото: realDonaldTrump / Truth 2 апреля Трамп анонсировал введение «зеркальных» пошлин для около 200 стран из-за торгового дисбаланса. Казахстан стал единственной страной в Центральной Азии, к которой применили повышенную ставку — 27%. Для остальных ставка была минимальной — 10%. Мера должна была вступить в силу 9 апреля, президент США отложил ее на 90 дней для ведения торговых переговоров. Читайте РБК в Telegram.	10	\N	2025-07-08 10:25:01	2025-07-08 10:25:01
1351	4670	primakov-nazval-nezakonnym-zaderzhanie-rossiyskih-aytishnikov-v-baku	Примаков назвал незаконным задержание российских айтишников в Баку	https://s0.rbk.ru/v6_top_pics/media/img/2/37/347519168018372.jpeg	По словам главы Россотрудничества, в российском обществе нет уверенности в справедливости обвинений, которые Азербайджан выдвинул задержанным в июле россиянам Евгений Примаков (Фото: Михаил Гребенщиков / РБК) Москва убеждена, что россияне, которых в начале июля арестовали в Азербайджане, были задержаны незаконно. Об этом в интервью РБК заявил глава Россотрудничества Евгений Примаков. Примаков — РБК: Снаряды и учебники взаимозависимы и влияют друг на друга Политика «Сейчас посольство в Азербайджане предпринимает все необходимые усилия, чтобы помочь нашим согражданам, которые были, как мы абсолютно убеждены, совершенно незаконно задержаны, причем с применением грубейшей силы, — сказал Примаков. — Думаю, мало кто в России верит в то, что эти айтишники являются наркоторговцами, как их назвали в Азербайджане. Понимаю, что следствие и суд разберутся. Но в нашем обществе уверенности в справедливости этих обвинений нет». Video Отношения России с Азербайджаном обострились после того, как 27 июня в Екатеринбурге российские силовики задержали 50 граждан Азербайджана по делам о нескольких убийствах, в том числе 24-летней давности. По ходу задержания некоторые из них были госпитализированы, двое скончались — как заявили в российском Следственном комитете, один умер от сердечной недостаточности. Баку выразил протест, а спустя несколько дней в Азербайджане силовики задержали восьмерых россиян по делу о транзите наркотиков из Ирана и киберпреступлениях. Их арестовали на четыре месяца. На видео из суда у задержанных были видны синяки и кровоподтеки. Как стало известно, один из задержанных — разработчик по внедрению искусственного интеллекта, другие — сотрудники IT-компаний. rbc.group В чем причина обострения между Россией и Азербайджаном Политика За последние полгода это не первое обострение в отношениях Москвы и Баку. В феврале Азербайджан потребовал от России закрыть Русский дом. Как рассказал РБК Примаков, сейчас организация в Баку не действует — до последнего времени культурные мероприятия проводил соответствующий отдел российского посольства. «Наш культурный центр в Баку был закрыт, и мы с этим не согласны. Азербайджанская сторона заявила, что наш культурный центр должен быть зарегистрирован в качестве местного юридического лица, как это обозначено в межправительственном соглашении, подписанном еще в 90-е годы. Мы многие годы запрашивали и МИД, и Минюст Азербайджана, как, по какой форме это должно быть сделано, но нам не отвечали. И сейчас, как мы понимаем, по совокупности разных причин и обстоятельств, Азербайджан вспомнил о том, что культурный центр, оказывается, не зарегистрирован», — рассказал глава Россотрудничества. Он обратил внимание на то, что двустороннее соглашение Баку при этом не денонсировал.	4	\N	2025-07-08 10:35:03	2025-07-08 10:35:03
1352	4798	u-rosakkreditacii-smenilsya-rukovoditel	У Росаккредитации сменился руководитель	https://s0.rbk.ru/v6_top_pics/media/img/3/15/347519595957153.jpeg	Руководителем Росаккредитации стал замглавы Минэка Дмитрий Вольвач. Его предшественник Назарий Скрыпник, возглавлявший ведомство с весны 2020-го, освобожден от должности по собственному желанию Дмитрий Вольвач (Фото: Валерий Шарифулин / ТАСС) Заместитель министра экономического развития России Дмитрий Вольвач назначен на должность руководителя Федеральной службы по аккредитации (Росаккредитация). Соответствующее распоряжение подписал премьер-министр Михаил Мишустин. В документе сказано, что от занимаемой с марта 2021 года должности замглавы Минэка Вольвач освобождается. «Назарий Скрыпник, до настоящего времени руководивший Федеральной службой по аккредитации, освобожден от занимаемой должности по его просьбе», — говорится в сообщении на сайте правительства. rbc.group Скрыпник возглавлял Россакредитацию с апреля 2020 года, в 2019-м занимал должности помощника и заместителя руководителя ведомства. До этого он работал юристом в екатеринбургских компаниях, включая «МегаФон», в 2013–2017 годах был директором по правовым вопросам в филиале «МегаФона» в Санкт-Петербурге. В 2017–2018 годах возглавлял департамент ЗАО «Биокад» (биотехнологическая компания) в Петербурге. rbc.group Кремль объяснил смену главы Минтранса Политика Дмитрий Вольвач родился в 1972 году. Он имеет три высших образования, степень кандидата юридических наук. В 1998–2000 годах работал в столичной межрайонной инспекции Министерства по налогам и сборам (ныне — Федеральная налоговая служба). В 2000–2005 годах занимал различные должности в этом министерстве, в том числе пост начальника управления кредитных организаций (2002–2005). С 2005-го и до назначения на пост замглавы Минэка Вольвач занимал различные должности в ФНС. В частности, он возглавлял управления ведомства по Архангельской и Псковской областям, Ненецкому автономному округу и Ставропольскому краю. В 2011–2019 годах Вольвач возглавлял управления трансфертного ценообразования и международного сотрудничества, стандартов и международного сотрудничества, международного сотрудничества и валютного контроля Федеральной налоговой службы. В октябре 2019 году был назначен на должность заместителя руководителя ФНС, а в марте 2021-го — на пост замглавы Минэкономразвития. Читайте РБК в Telegram.	2	\N	2025-07-08 12:05:03	2025-07-08 12:05:03
1353	4813	kak-vyglyadit-navodnenie-v-tehase-gde-pogibli-100-chelovek	Как выглядит наводнение в Техасе, где погибли 100 человек		Video В результате масштабных наводнений, охвативших шесть округов Техаса, погибли не менее 104 человек, сообщает NBC News. Наибольшее число жертв зафиксировано в округе Керр — здесь погибли 56 взрослых и 28 детей. Среди погибших — 27 воспитанниц и вожатых летнего христианского лагеря для девочек Camp Mystic. К вечеру 7 июля в пострадавшем регионе сохраняется высокая вероятность новых внезапных паводков, пишет The New York Times. Метеорологи предупреждают, что даже кратковременные дожди могут привести к новым затоплениям в этой уязвимой зоне. Ранее президент США Дональд Трамп заявил о намерении посетить наиболее пострадавшие районы Техаса. Наводнение в округе Керр произошло из-за сильных ливней. Число жертв наводнений в Техасе превысило 100 Общество rbc.group Читайте РБК в Telegram.	8	\N	2025-07-08 12:05:03	2025-07-08 12:05:03
1354	4829	the-times-rasskazala-chto-na-ukraine-smirilis-s-zatyanuvshimsya-konfliktom	The Times рассказала, что на Украине смирились с затянувшимся конфликтом	https://s0.rbk.ru/v6_top_pics/media/img/7/52/347520015007527.jpeg	У украинцев может появиться реальный шанс на «мирное сосуществовании с русскими», но не сейчас, считает экс-министр обороны Резников. При этом он указал, что Москве и Киеву нужно продолжать переговоры Фото: Вячеслав Ратынский / Reuters Конфликт Украины и России не удастся завершить в скором времени, пишет The Times, приводя мнение экс-министра обороны Украины Алексея Резника. Издание отмечает, что его прогноз отражает растущее смирение многих украинцев с затянувшимися боевыми действиями. По мнению Резникова, который возглавлял Минобороны Украины в 2021–2023 годах, даже если удастся договориться о прекращении огня и создании буферных зон, продолжится «гибридная война». «Я думаю, что только после смены руководства в России у нас появится реальный шанс жить в мирном сосуществовании с русскими», — сказал Резников в интервью The Times. Путин заявил о готовности России к третьему раунду переговоров с Украиной Политика rbc.group Резников также прокомментировал возобновившиеся в мае переговоры российской и украинской делегаций. Он считает, что таким образом Москва хочет послать сигнал Вашингтону, чтобы избежать дальнейших санкций. Тем не менее он согласился, что сторонам нужно продолжать диалог, как минимум для того, чтобы добиться частичного прекращения огня, например в небе. rbc.group Первые за три года переговоры представителей Москвы и Киева прошли в Стамбуле. Стороны встретились уже дважды — 16 мая и 2 июня. Президент Владимир Путин говорил, что Россия выступает за остановку боевых действий, но необходимо выработать наиболее эффективные пути движения к миру. Президент Украины Владимир Зеленский настаивает, что необходимо достичь соглашения о прекращении боев. The Washington Post (WP) со ссылкой на высокопоставленный украинский источник сообщала, что Киев прежде рассчитывал добиться прекращения огня в середине 2025 года. Предполагалось, что перемирие положительно скажется на экономической ситуации в стране: после заявлений президента США Дональда Трампа о скором урегулировании конфликта бизнесмены внутри Украины и за рубежом настроились на «мирные дивиденды». Но надежды рухнули, когда внимание Трампа переключилось на другие конфликты, отмечала WP. Bloomberg писал, что ставка на прекращение огня сделала госдолг Украины лидером по доходности. Однако по мере того, как перспективы выполнения Трампом обещания об урегулировании конфликта становились все более туманными, инвесторам пришлось умерить оптимизм, отмечало агентство. По оценкам Bloomberg, в 2025 году долларовые облигации Украины принесли инвесторам убытки более чем на 10%. Путин неоднократно подчеркивал, в том числе во время недавнего разговора с Трампом, что Россия продолжает искать пути решения конфликта, но не откажется от поставленных целей. В Кремле отмечали, что речь идет о национальных интересах и обеспечении безопасности России. Летом 2024 года Путин среди условий для мира перечислял полный вывод войск Украины из республик Донбасса, Херсонской и Запорожской областей, а также признание этих регионов, Крыма и Севастополя российскими регионами. Украина считает эти условия ультиматумом. Читайте РБК в Telegram.	10	\N	2025-07-09 08:05:02	2025-07-09 08:05:02
1355	4824	bi-zone-nazvala-samye-populyarnye-shemy-kriptomoshennikov-v-telegram	BI.ZONE назвала самые популярные схемы криптомошенников в Telegram		Специалисты компании по управлению цифровыми рисками BI.ZONE Brand Protection предупредили о двух распространенных сценариях фишинговых атак в Telegram. По информации компании, злоумышленники стали чаще атаковать пользователей, используя темы криптовалют и быстрого заработка. BI.ZONE — компания по управлению цифровыми рисками, которая помогает организациям безопасно развивать бизнес в киберпространстве. BI.ZONE разрабатывает собственные продукты для обеспечения устойчивости IT‑инфраструктур любого размера и оказывает широкий спектр услуг по киберзащите: от расследования инцидентов и мониторинга угроз до создания стратегий по кибербезопасности и комплексного аутсорсинга профильных функций. С 2016 года компания реализовала более 1600 проектов в сферах финансов, телекоммуникаций, энергетики, авиации и многих других, защитив свыше 800 клиентов. rbc.group Специалисты BI.ZONE обнаружили, что во II квартале 2025 года количество фишинговых сайтов, нацеленных на пользователей Telegram, увеличилось до 12,5 тыс. — это почти в 2 раза больше, чем в I квартале. rbc.group МВД рассказало о схемах мошенничества с вредоносными программами Общество По информации компании, Telegram привлекает мошенников большой аудиторией. Эксперты отмечают популярность двух сценариев обмана. В первой схеме мошенники создают фишинговые ресурсы, имитирующие страницу авторизации в Telegram или на Fragment — официальной площадке мессенджера для купли-продажи логинов и телефонных номеров. «Мы наблюдаем активный рост числа фишинговых ресурсов, которые имитируют различные официальные платформы, чтобы получить доступ к аккаунтам и криптоактивам пользователей Telegram. Схема с поддельными токенами показывает, что мошенники быстро адаптируются к популярным тематикам и постоянно обновляющимся функциям мессенджера», — пояснил руководитель BI.ZONE Brand Protection Дмитрий Кирюшкин. При входе фейковые сайты запрашивают у пользователя код подтверждения. Если пользователь отправляет его, аккаунт попадает в руки злоумышленников. Они получают доступ к криптокошельку и личной информации жертвы, например паролям, реквизитам банковских карт и фотографиям документов, которые многие хранят в чатах или папке «Избранное», пояснили в компании. При втором сценарии злоумышленник предлагает жертве купить у нее редкий цифровой подарок в Telegram за крупную сумму. В качестве оплаты мошенник присылает поддельные токены. С первого взгляда они неотличимы от настоящих, однако не имеют никакой реальной ценности. Кирюшкин посоветовал внимательно проверять адрес посещаемых страниц и мини-приложений, не переходить по подозрительным ссылкам и не отвечать на предложения «быстрого заработка» — это одна из самых распространенных манипуляций злоумышленников. Читайте РБК в Telegram.	8	\N	2025-07-09 08:05:03	2025-07-09 08:05:03
1356	4826	v-peterburge-studentka-sobrala-5-mln-na-vypusknoy-i-ischezla	В Петербурге студентка собрала ₽5 млн на выпускной и исчезла		В Санкт-Петербурге перед выпускным Педиатрического университета студентка, собравшая деньги, пропала вместе с 5 млн руб., рассказали студенты вуза и их родители, пишет «Фонтанка». Выпускной должен был пройти 12 июля в банкетном зале в Петергофе. Студенты готовились к празднику с начала учебного года. В Перми начали расследовать массовое отравление во время выпускного Общество rbc.group Девушка сама пожелала заниматься сбором денег, и около 400 человек перевели ей на праздник по 18 тыс. руб. Всего студенты шестого курса собрали на праздник около 7 млн руб, большая часть из них была у их сокурсницы. rbc.group Однако за несколько дней до выпускного, 6 июля, девушка призналась, что потеряла полученные деньги — это около 5 млн руб. Студенты обратились в полицию и уведомили деканат о случившемся. «Сейчас мы с другими выпускниками активно ищем площадку для проведения выпускного, ведь мы ждали его 6 лет. Много кто не готов отдавать еще деньги, у многих потеряно доверие, состоится ли выпускной — пока неизвестно, так как за три дня очень сложно что-то найти и организовать», — сказала одна из выпускниц.  Читайте РБК в Telegram.	5	\N	2025-07-09 08:05:03	2025-07-09 08:05:03
1357	4817	zelenskiy-poruchil-aktivizirovat-vse-kontakty-s-vashingtonom	Зеленский поручил «активизировать все контакты» с Вашингтоном	https://s0.rbk.ru/v6_top_pics/media/img/2/88/347520278703882.jpeg	Зеленский поручил министру обороны и главкому активизировать контакты с Соединенными Штатами и добавил, что ждет результатов в ближайшее время. До этого Трамп пообещал разблокировать поставки оборонительного оружия Украине Владимир Зеленский (Фото: APA Images via ZUMA Press Wire / ТАСС) Президент Украины Владимир Зеленский поручил министру обороны Рустему Умерову и главкому Вооруженных сил Украины (ВСУ) Александру Сырскому «активизировать все контакты с американской стороной». Об этом украинский лидер заявил в вечернем обращении, оно опубликовано в телеграм-канале Зеленского. По словам президента Украины, сейчас есть «необходимые политические заявления и решения», и задача властей — как можно быстрее их реализовать. Зеленский подчеркнул, что прежде всего это касается противовоздушной обороны, а также других поставок от Вашингтона. rbc.group «Ожидаю результатов этих контактов в ближайшее время, и, в частности, на этой неделе готовим форматы встреч наших команд — военных и политических», — сказал он. rbc.group Медведев призвал «никак» не относиться к словам Трампа о поставках оружия Политика В начале июля стало известно о приостановке поставок США некоторых видов оружия Украине, в том числе ракет для системы ПВО Patriot. В Белом доме это объяснили необходимостью оценки запасов американского арсенала. Позднее Трамп заявил о намерении продолжить и нарастить поставки оружия Киеву, поскольку «они должны иметь возможность защищать себя». В частности, речь идет о ракетах-перехватчиках для Patriot. В Кремле заявили, что продолжение военной помощи Киеву со стороны Вашингтона не способствует мирному урегулированию конфликта. Заместитель председателя Совета безопасности России Дмитрий Медведев призвал не обращать внимания на слова американского президента о поставках оружия Украине. Читайте РБК в Telegram.	5	\N	2025-07-09 08:05:03	2025-07-09 08:05:03
1358	4827	v-finlyandii-sankcii-protiv-rossii-sprovocirovali-rost-torgovli-rublyami	В Финляндии санкции против России спровоцировали рост торговли рублями		Санкции Финляндии против России повлекли за собой увеличение объема торговли рублями в торговых центрах, пишет газета Iltalehti. Услуги менял стали популярны после весны 2022 года, когда банковские переводы между Финляндией и Россией были прерваны из-за санкций. Обстоятельства создали трудности для тех, кому нужно было перевести деньги между странами, например, родственникам, живущим по другую сторону восточной границы Финляндии. В Финляндии рассказали, что эпоха «стирания границ» ушла Политика rbc.group Один из способов решения проблемы — обмен валюты между частными лицами с помощью социальных сетей. Так, на канале «Обмен валюты в Финляндии» почти 24 тыс. участников. Они живут в разных частях страны, но, согласно объявлениям, большинство из них из столичного региона, пишет издание. rbc.group Человек, которому нужен обмен валюты, может оставить сообщение на канале, указав сумму денег, место встречи и способ обмена. Чаще всего предлагают услугу обмена валют выходцы из России и Украины, отметило издание. Евро на рубли меняют преимущественно в торговых центрах столичного региона Финляндии — в Эспоо, Хельсинки и Вантаа, по курсу 89—90 рублей за евро. Обмен происходит наличными, так как люди опасаются мошенников, пишет газета. В отделе финансовой разведки Национальной уголовной полиции Финляндии подчеркнули, что обмен валюты между частными лицами остается вне контроля властей. Читайте РБК в Telegram.	2	\N	2025-07-09 08:05:03	2025-07-09 08:05:03
1360	4819	glava-cru-dolozhit-trampu-o-primenenii-himicheskogo-oruzhiya-na-ukraine	Глава ЦРУ доложит Трампу о применении химического оружия на Украине	https://s0.rbk.ru/v6_top_pics/media/img/6/29/347520220559296.jpeg	Глава ЦРУ пообещал доложить Трампу о применении химического оружия на Украине, в чем ранее Минобороны Нидерландов обвинило Россию. Москва отвергает эти обвинения Дональд Трамп (Фото: Joe Raedle/Getty Images) Президенту Дональду Трампу представят сведения о применении химического оружия на Украине, заявил глава ЦРУ Джон Рэтклифф на заседании кабинета министров. Трансляцию мероприятия вела пресс-служба Белого дома. Во время заседания Трампа спросили о химическом оружии, и он адресовал вопрос Рэтклиффу. «Безусловно, если задокументировано применение химического оружия, то это незаконно и нарушает все международные правила ведения вооруженных конфликтов и соглашения», — ответил тот и добавил, что не может раскрыть на заседании те разведывательные данные, которые может представить Траммпу в частном порядке. rbc.group В Минобороны заявили о подготовке Киевом провокации с химическим оружием Политика rbc.group Ранее в июле Министерство обороны Нидерландов и Служба военной разведки и безопасности обвинили Россию в применении химического оружия на Украине, в частности, хлорпикрина. Об этом заявлял, в частности, министр обороны Рубен Брекельманс. Хлорпикрин имеет резкий запах и в высоких концентрациях является ядовитым. Вещество раздражает кожу и слизистую, вызывает слезотечение, смыкание век, может иметь удушающее действие. Организация по запрещению химического оружия ведет три списка опасных химикатов, хлорпикрин входит в последний из них. Россия ратифицировала КЗХО в 1997 году. В постпредстве России при Организации по запрещению химического оружия (ОЗХО) заявили «РИА Новости» о надуманности этих обвинений и добавили, что члены НАТО получили «направление» обвинять Москву в нарушении Конвенции по запрещению химоружия (КЗХО) «любыми способами и методами». Российские власти также заявляли ранее, что ВСУ могут применять отравляющие вещества для ведения боев. Так, в августе 2024 года российские военные нашли в одном из их тайников подготовленные к применению токсичные вещества. В том же году в Минобороны заявили, что Украина готовит провокацию и намерена обвинить Россию в использовании отравляющих веществ в зоне проведения спецоперации. Читайте РБК в Telegram.	4	\N	2025-07-09 08:05:04	2025-07-09 08:05:04
1363	4821	skolko-azerbaydzhan-prodaet-v-rossiyu-i-importiruet-iz-nee-infografika	Сколько Азербайджан продает в Россию и импортирует из нее. Инфографика		За задержаниями в Екатеринбурге последовали демарши и аресты в Баку. Новое обострение между Россией и Азербайджаном поставило под вопрос торговые отношения стран. Экономические связи государств — в инфографике РБК Россия после Италии и Турции занимает третье место среди крупнейших торговых партнеров Азербайджана. Согласно данным Государственного статистического комитета республики, в 2023 году на Россию пришлось 8,5% товарооборота страны, или $4,4 млрд (из $51,2 млрд). За последние три года страны нарастили взаимную торговлю, следует из базы данных ООН Comtrade. За период с апреля 2022 года по март 2025-го включительно товарооборот между Россией и Азербайджаном вырос почти на 3%, или более чем на $1 млрд в денежном выражении. rbc.group При этом товарные потоки распределены неравномерно: Азербайджан импортирует больше, чем экспортирует. На протяжении последних трех лет поставки из России в Азербайджан стабильно превышали встречный поток из Азербайджана в Россию в 2–3 раза, а в начале 2025 года разрыв увеличился до пяти раз ($1,2 млрд против $234 млн). Аналогично средняя доля экспорта из Азербайджана в Россию в структуре общего экспорта страны за последние три года составила 4%, тогда как доля импорта — 18,1%. rbc.group Азербайджан импортирует из России преимущественно топливо, драгоценные металлы и металлопродукцию, а также продовольственные товары, сельхозсырье, машины, оборудование, транспортные средства и древесину. В Россию Азербайджан поставляет фрукты, овощи и пластмассы, а также текстиль и хлопок. Новый виток обострения между странами начался в конце июня, когда силовики задержали в Екатеринбурге уроженцев Азербайджана по подозрению в причастности к убийствам и покушениям, двое из них скончались при задержании. Последовала череда демаршей и задержаний с обеих сторон. В частности, несколько дней спустя в Баку задержали журналистов «Sputnik Азербайджан» (входит в МИА «Россия сегодня»), представительство которого было ликвидировано в феврале 2025 года, и еще восьмерых россиян по делу о транзите наркотиков из Ирана и киберпреступлениях. На фоне обострения Азербайджан заморозил сотрудничество с Россией в сфере экономики и отказался от переговоров по некоторым проектам, рассказал депутат парламента республики Расим Мусабеков.	4	\N	2025-07-09 08:05:04	2025-07-09 08:05:04
1359	4818	v-sheremetevo-na-fone-ataki-drona-na-moskvu-ostanavlivali-polety	В Шереметьево на фоне атаки дрона на Москву останавливали полеты	https://s0.rbk.ru/v6_top_pics/media/img/4/00/347520214155004.jpeg	В Шереметьево временно запретили полеты, сообщили в Росавиации. Собянин сообщил в то же время о двух сбитых дронах, которые летели на Москву Фото: Zuma \\ ТАСС В столичном аэропорту Шереметьево временно ограничили прием и выпуск самолетов, заявил представитель Росавиации Артем Кореняко в 2:48 мск. Онн подчеркнул, что ограничения необходимы для обеспечения безопасности полетов. «Экипажи ВС, авиадиспетчеры и службы аэропорта принимают все необходимые меры для обеспечения безопасности полетов — это приоритет», — написал он в телеграм-канале. rbc.group Ограничения сняли примерно через полчаса после начала их действия — в 3:15 мск. rbc.group В то же время мэр Сергей Собянин сообщил, что ПВО Минобороны сбили летевший на Москву беспилотник. Через несколько минут он добавил, что российские военные уничтожили еще один дрон, летевший на столицу. В Шереметьево на фоне ограничений отменили и задержали две сотни рейсов Общество Ограничения в Шереметьево и других российских аэропортах вводят на фоне угроз атак беспилотников. Так, 7 июля отменили всего более 190 рейсов. В частности, в Шереметьево отменили на вылет и прилет в общей сложности более 65 рейсов, в, а из Домодедово не смог вылететь только один самолет. Тогда отмены рейсов затронули и другие российские города, среди них Петербург, Сочи, Казань. Читайте РБК в Telegram.	7	\N	2025-07-09 08:05:03	2025-07-09 08:05:03
1361	4820	ukraina-obyavila-v-rozysk-rukovoditeley-minprosveshcheniya-i-banka-rossii	Украина объявила в розыск руководителей Минпросвещения и Банка России	https://s0.rbk.ru/v6_top_pics/media/img/2/05/347520327609052.jpeg	СБУ и МВД Украины объявили в розыск глав Минпросвещения и Банка России Сергея Кравцова и Эльвиру Набиуллину. Их также внесли в списки сайта «Миротворец» Эльвира Набиуллина (Фото: Максим Константинов/ТАСС) Служба безопасности Украины (СБУ) и МВД страны объявили в розыск главу Центробанка Эльвиру Набиуллину и министра просвещения Сергея Кравцова, следует из базы данных украинских ведомств. МВД разыскивает обоих по статье о «посягательстве на территориальную целостность и неприкосновенность Украины». Набиуллина находится в розыске по линии украинского МВД с января 2023 года, а Кравцов — с апреля 2025 года. По информации ТАСС, глава российского Минпросвещения столько же находится в розыске по базе данных СБУ. Ему предъявлены обвинения, в частности, за «оправдание действий России» и «посягательство на территориальную целостность Украины». rbc.group Кроме того, оба чиновника включены в черные списки украинского сайта «Миротворец». rbc.group Свыше 26 тыс. украинцев не пустили в Россию по подозрению в связях с СБУ Политика СБУ регулярно заочно предъявляет обвинения российским политикам, военным, деятелям культуры и общественным фигурам. Обвинения касаются, как правило, посягательства на территориальную целостность Украины. В качестве доказательств используются публичные заявления, выступления, участие в мероприятиях, поддержка российских военных действий. Так, в декабре 2024 года СБУ сообщила о заочном приговоре к 15 годам колонии спикера Госдумы Вячеслава Володина. Среди заочно обвиненных деятелей культуры — певец Григорий Лепс, телеведущая Ольга Скабеева, актер Иван Охлобыстин. В России также возбуждены дела в отношении высокопоставленных украинских политиков и военных. Так, в июле 2024 года российское МВД объявило в розыск экс-командующего оперативного командования «Запад» вооруженных сил Украины генерала Игоря Довганя. Читайте РБК в Telegram.	4	\N	2025-07-09 08:05:04	2025-07-09 08:05:04
1362	4822	bloomberg-uznal-o-zhelanii-es-sozdat-fond-v-100-mlrd-dlya-podderzhki-kieva	Bloomberg узнал о желании ЕС создать фонд в €100 млрд для поддержки Киева	https://s0.rbk.ru/v6_top_pics/media/img/9/22/347520259872229.jpeg	В ЕС изучают возможность создания фонда в €100 млрд для поддержки Украины. Его могут внести в семилетний бюджет организации, в таком случае выплаты продолжатся с 2028 по 2034 год Фото: Станислав Красильников/ТАСС В Европейском союзе рассматривают возможность создания специального фонда размером €100 млрд ($117 млрд) для поддержки Украины с 2028 года, пишет Bloomberg со ссылкой на источники. По словам источника агентства, в Европе задумались о таком варианте, поскольку российско-украинский конфликт «не имеет никаких признаков окончания». Фонд может стать частью следующего семилетнего бюджета ЕС, то есть выплаты начнутся в 2028 году и продолжатся до 2034 года. Предложение ЕС по этому долгосрочному бюджету ожидается в конце июля. Финансирование для Киева начнут выделять, если государства-члены примут это решение в рамках переговоров по бюджету. rbc.group Украина и США договорились о первом заседании фонда полезных ископаемых Политика rbc.group Этот шаг, пишет агентство, еще сильнее «переложит бремя поддержки Украины на Европу, а не на США». Bloomberg напомнил, что ЕС предоставил Украине поддержку в размере почти €160 млрд ($187 млрд) с начала российской спецоперации. В 2025 году США начали сокращать свою активность в вопросе поддержки Украины. Представители Госдепа прямо заявили, что Вашингтон больше не собирается играть роль посредника в переговорах между Россией и Украиной, а также ограничил военную и разведывательную помощь Киеву. Евросоюз, реагируя на изменение позиции США, начал наращивать собственную военную и финансовую поддержку Украины. В 2025 году страны ЕС пообещали Украине военную помощь на сумму €23 млрд, а также выделили кредиты на 30 млрд евро, обеспеченные замороженными российскими активами. Несмотря на рост поддержки, ЕС сталкивается с проблемами, в том числе нехватка собственных военных запасов, а также политические разногласия между странами-членами по поводу объема и формата помощи. Россия осуждает как военную, так и финансовую помощь Украине со стороны ЕС и США. Кремль считает, что это затягивает конфликт и препятствует мирному урегулированию. Передачу Киеву доходов от замороженных российских активов Россия считает незаконными. Читайте РБК в Telegram.	10	\N	2025-07-09 08:05:04	2025-07-09 08:05:04
1364	4849	pervyy-zammera-krasnoyarska-stal-svidetelem-po-ugolovnomu-delu	Первый заммэра Красноярска стал свидетелем по уголовному делу		Первый заммэра Красноярска Мацак находится у следователя. По какому делу он проходит свидетелем, не уточнятся. Утром МВД сообщило, что одного из руководителей автотранспортного предприятия заподозрили в превышении полномочий Первого заместителя мэра Красноярска Александра Мацака доставили на допрос как свидетеля по уголовному делу, сообщает «РИА Новости» со ссылкой на источник. Чиновник подтвердил РЕН ТВ, что находится на беседе у следователя. О каком деле речь, собеседник агентства не уточнил, сказав только, что оно связано с одним из подразделений городской администрации. Телеграм-канал KrasMash пишет, что Мацак проходит свидетелем по делу, связанному с махинациями при ремонте дорог. rbc.group Суд арестовал мэра Красноярска по делу о взятке в ₽180 млн Политика rbc.group Утром 9 июля МВД Красноярска сообщило, что одного из руководителей специализированного автотранспортного предприятия заподозрили в превышении полномочий (ч. 1 ст. 285). По данным ведомства, с мая по июнь 2022 года он не раз снимал с маршрута спецтехнику организации для работ в загородном поселке в Березовском районе и на дачном участке своего знакомого. При этом за работу не платили, ущерб составил более 220 тыс. руб. Имени подозреваемого и названия компании в полиции не привели. РЕН писал, что Мацака допрашивают по делу о коррупции в связи с арестом мэра Красноярска Владислава Логинова, но NGS24.RU это не подтверждает. Логинову вменяют получение более 180 млн руб. «в виде денег и оплаты строительства бани» от коммерсанта за победу его компании в конкурсе на ремонт дорог. Чиновника поместили под стражу в начале июня, обязанности главы города исполняет Алексей Шувалов. Мацак стал первым заммэра Красноярска в мае, до этого он возглавлял департамент городского хозяйства и транспорта. С осени 2023-го до конца 2024-го чиновник руководил местным управлением дорог, инфраструктуры и благоустройства. Читайте РБК в Telegram.	6	\N	2025-07-09 08:25:02	2025-07-09 08:25:02
1365	4882	cnn-uznal-chto-hegset-ne-soobshchil-trampu-o-priostanovke-postavok-kievu	CNN узнал, что Хегсет не сообщил Трампу о приостановке поставок Киеву	https://s0.rbk.ru/v6_top_pics/media/img/9/05/347520291258059.jpeg	Глава Пентагона Хегсет не сообщил президенту США о решении приостановить поставки оружия Украине. Ранее Трамп заявил, что Вашингтон продолжит отправлять оружие Киеву Пит Хегсет (Фото: Aaron Schwartz / Global Look Press) Глава Пентагона Пит Хегсет не сообщил администрации президента США Дональда Трампа о своем решении приостановить поставки вооружений Украине заранее. Об этом сообщает телеканал CNN со ссылкой на источники. На заседании с кабинетом министров Трамп заявил, что он не несет ответственности за этот шаг. Отвечая на вопрос, кто санкционировал паузу в поставках оружия, Трамп ответил: «Я не знаю, почему вы не говорите мне?» Республиканец подчеркнул, что Вашингтон продолжит отправлять оружие на Украину. rbc.group В начале июля Politico и NBC сообщили, что США приостановили поставки некоторых видов оружия Украине, включая ракеты для системы ПВО Patriot. Белый дом объяснил остановку поставок «стандартной проверкой» Пентагоном всей военной помощи, которую США оказывают всем странам и регионам. Киев утверждает, что официально не получал каких-либо уведомлений по поводу приостановки поставок оружия. rbc.group По информации источников CNN, Трамп попросил Хегсета только оценить запасы оружия США, но не останавливать поставки Украине. Решение главы Пентагона источники связали с тем, что у Хегсета нет начальника штаба или доверенных советников для координации важных политических решений с межведомственными партнерами. Это уже второй случай в 2025 году, когда Хегсет решил остановить поток американского оружия в Украину, «застав врасплох» других чиновников, пишет CNN. В прошлый раз это случилось в феврале, тогда решение быстро отменили. Россия выступает против поставок военной помощи Украине. Президент Владимир Путин неоднократно говорил, что западные страны, поставляя Киеву вооружения, лишь затягивают боевые действия. Читайте РБК в Telegram.	7	\N	2025-07-09 08:45:01	2025-07-09 08:45:01
1366	4929	v-codah-zapretyat-zanimatsya-mayningom	В ЦОДах запретят заниматься майнингом	https://s0.rbk.ru/v6_top_pics/media/img/7/89/347519064111897.jpeg	Ко второму чтению в законопроект о ЦОДах включили создание реестра дата-центров, их правовое определение и запрет на майнинг. Бизнес рассчитывает, что это ускорит развитие рынка на фоне дефицита вычислительных мощностей Фото: Михаил Гребенщиков / РБК Правительство и депутаты Госдумы доработали поправки, регламентирующие деятельность центров обработки данных (ЦОД). Об этом РБК сообщил представитель вице-премьера — руководителя аппарата правительства Дмитрия Григоренко, под руководством которого велась работа по регулированию. Изначально проект был оформлен как поправки в закон «О связи». В 2020 году президент России поручил правительству проработать вопрос льготной поддержки ЦОДов и помочь им сократить издержки на электроэнергию. Годом позже правительство разработало поправки и внесло их в Госдуму. В первом чтении законопроект был принят в 2022 году. В нынешней версии помимо закона «О связи» документ вносит изменения в законы «О концессионных соглашениях», «О государственно-частном партнерстве», «О цифровых финансовых активах», которые предлагают: rbc.group отнести ЦОДы к сооружениям связи и скорректировать определение для таких объектов (теперь это совокупность зданий или помещений, используемых для размещения оборудования для обработки и хранения данных); Минцифры будет вести реестр ЦОДов; владельцы таких объектов смогут войти в реестр на добровольной основе; требования для этого будет определять правительство; в ЦОДах, включенных в реестр, будет запрещено размещать майнинговую инфраструктуру и добывать криптовалюту. rbc.group По словам источника РБК, знакомого с ходом разработки законопроекта, его второе чтение может пройти до конца июля. Зачем нужны изменения По словам представителя аппарата Григоренко, цифровизация и внедрение искусственного интеллекта предполагают работу с огромными массивами данных, и чтобы эффективно хранить и обрабатывать эту информацию, необходимо увеличивать количество и мощности ЦОДов. «Первый шаг — это прозрачное и понятное регулирование. В первую очередь законодательно закрепляем, что ЦОД — это объект связи, а не просто серверная. Четкие правила создадут основу для дополнительных мер поддержки, привлечения частных инвестиций и развития технологий», — рассчитывает он. Создание реестра, по ожиданию правительства, устранит «бюрократические проволочки», так как статус ЦОДа можно будет подтвердить одной выпиской. Например, дата-центры как объекты связи смогут в упрощенном порядке подключаться к магистральной электросети (ЕНЭС), отметил представитель аппарата Григоренко. Источник РБК, участвующий в работе над финальной версией законопроекта, объяснил, что таким образом ЦОДы смогут получать электроэнергию по льготным тарифам, а не по полной стоимости, что должно снизить их операционные расходы. ЦОДы предложили запитать от магистральной электросети Бизнес Российские IT-компании сейчас сталкиваются со значительным дефицитом дата-центров, что усугубляется развитием искусственного интеллекта, требующего большого количества вычислительных мощностей. В прошлом году об их нехватке и сложностях с поиском территорий для строительства ЦОДов заявляли представители Сбербанка и Т-банка. Без четкого определения дата-центра все труднее реализовывать новые проекты по их созданию, подключать энергетику, получать меры поддержки, согласен гендиректор координационного совета по ЦОДам и облачным технологиям (АНО КС ЦОД) Дмитрий Бедердинов. По его словам, все, кто строит и развивает инфраструктуру ЦОДов в стране, поддерживают представленную редакцию, потому что обсуждаемое определение позволит шире и эффективнее привлекать инвестиции в отрасль, которые сейчас очень нужны в связи с растущим дефицитом мощностей дата-центров. Сегодня в России нет заметной поддержки рынка центров обработки данных со стороны государства, хотя в крупнейших странах это крайне поддерживаемая, субсидируемая часть IT-отрасли, отметил технический директор РТК-ЦОД Алексей Забродин. Он предполагает, что именно на эту задачу и направлено готовящееся регулирование. По его словам, определение ЦОДа само по себе не решит каких-либо проблем, но позволит начать двигаться в сторону их решения. Среди основных вопросов Забродин назвал доступ к электричеству, выделение земли под строительство дата-центров, низкую рентабельность на фоне высокой ключевой ставки, а также тарифы на электричество, которые надо субсидировать под дата-центры, как и строительство в условиях высокой ключевой ставки. Зачем запрещать майнинг в ЦОДах По словам одного из собеседников РБК, знакомого с обсуждением законопроекта, запрет на майнинг появился в нем как превентивная мера, чтобы исключить возможные попытки майнеров претендовать на льготы и послабления, которые распространяются на объекты связи. НТВ решил зарабатывать на собственных ЦОДах в новом телецентре Технологии и медиа Это требование участников рынка энергетики, которые хотят не допустить, чтобы операторы майнинговой инфраструктуры мимикрировали под операторов дата-центров, подтверждает президент Ассоциации участников отрасли ЦОД Игорь Дорофеев. Бедердинов отметил, что уже сейчас при подключении к энергетическим компаниям операторов ЦОДов просят доказать, что они не являются майнерами. «Главное требование к ЦОДу — его надежность и безотказное функционирование. Поскольку клиенты дата-центров редко переезжают с площадок, для их владельцев критически важны юридическая чистота объекта, право владения землей и т.д.», — указал он. При этом Бедердинов считает, что основными условиями для включения в реестр ЦОДов будут мощность объекта, его месторасположение и класс надежности на основе отечественной модели классификации. Но прорабатываются и другие параметры, отметил он. Создание реестра позволит государству более точно оценивать объем и распределение инфраструктуры, а участникам рынка — подтверждать свой статус и надежность для клиентов и партнеров, согласен технический директор Selectel Кирилл Малеванов. В то же время он отметил, что среди данных, которые, как обсуждается, будет необходимо предоставить, чтобы войти в реестр, могут быть чувствительные, например данные о фактической загрузке дата-центра. «Нужно понимать, вся ли информация действительно нужна. Также важно, чтобы добровольность предоставления данных сохраняла гибкость для бизнеса без административных барьеров», — отметил Малеванов. По мнению Дорофеева, вместо реестра дата-центров целесообразнее было бы создать реестр операторов таких объектов. Именно операторы несут ответственность, являются бенефициарами возможных преференций, а кроме того, их сильно меньше, чем ЦОДов, и проще администрировать, пояснил Дорофеев. РБК направил запросы в МТС, IXcellerate и Cloud.ru (ранее SberCloud). Читайте РБК в Telegram.	9	\N	2025-07-09 09:15:02	2025-07-09 10:06:34
1406	5779	tokaev-otvetil-na-pismo-trampa-o-poshlinah-dlya-kazahstana	Токаев ответил на письмо Трампа о пошлинах для Казахстана	https://s0.rbk.ru/v6_top_pics/media/img/5/38/347521304029385.jpeg	Токаев направил ответное письмо американскому лидеру, который решил с августа ввести для продукции из Казахстана пошлину в 25%. Он отметил, что Астана привержена развитию торговых связей с Вашингтоном и готова к поиску компромисса Касым-Жомарт Токаев (Фото: Сергей Бобылев / Sputnik / Reuters) Президент Казахстана Касым-Жомарт Токаев направил ответное письмо американскому лидеру Дональду Трампу, сообщила пресс-служба главы республики. В нем он выразил уверенность, что Астана и Вашингтон найдут компромисс по торговой проблеме. Токаев подчеркнул, что Казахстан в качестве давнего торгового и инвестиционного партнера Соединенных Штатов привержен развитию «справедливых, предсказуемых, взаимовыгодных» торговых связей. Он также подтвердил готовность продолжать конструктивный диалог, который позволит разработать рациональное решение вопросов торговли. Свое письмо Трамп отправил Токаеву в начале недели, объявив о решении с 1 августа ввести 25-процентную импортную пошлину на всю казахстанскую продукцию, поставляемую на американский рынок. Свое решение Трамп объяснил необходимостью устранить торговый дисбаланс с Казахстаном, который, как он указал, «представляет серьезную угрозу» экономике и национальной безопасности США. При этом он подчеркнул, что США согласны продолжать работу с Казахстаном. rbc.group Фото: realDonaldTrump / TruthФото: realDonaldTrump / Truth rbc.group Аналогичные письма о пошлинах от Трампа получили лидеры более десяти государств. Для некоторых из них будут действовать такие же пошлины, как и для Казахстана — 25% — включая Бруней, Молдавию, Южную Корею и Японию. Для ЮАР, Алжира, Ливии, Ирака и Шри-Ланки, согласно опубликованным Трампом письмам, пошлины будут установлены на уровне 30%, для Лаоса и Мьянмы — 40%. Самая высокая тарифная ставка у Бразилии — 50%. Причиной для этого решения он назвал судебное преследование экс-президента Жаира Болсонару и цензуру американских платформ в Бразилии. Трамп объявил о резком повышении тарифов на поставки из 185 стран в начале апреля 2025 года. Предполагалось, что минимальная базовая таможенная пошлина 10% начнет действовать с 5 апреля, а индивидуальные для отдельных стран — с 9 апреля. Трамп отложил эту меру на 90 дней, чтобы за этот срок провести переговоры о торговых соглашениях. Срок истекал 9 июля, в ночь на 8 июля президент США продлил его до 1 августа. Читайте РБК в Telegram.	4	\N	2025-07-10 10:05:03	2025-07-10 10:18:33
1371	5179	yandeks-obyasnil-rost-cen-v-taksi-v-rossiyskih-regionah	«Яндекс» объяснил рост цен в такси в российских регионах	https://s0.rbk.ru/v6_top_pics/media/img/6/81/347520506404816.jpeg	Фото: Алексей Белкин / NEWS.ru / РБК Удорожание автомобилей и их обслуживания, ужесточение миграционной политики, а также необходимостью привлекать новых водителей высокой зарплатой — все это приводит к повышению тарифа на такси в российских городах, сообщили РБК в «Яндекс такси». Сервис изучил динамику средней стоимости минуты поездки в регионах с июля 2024 года по июнь 2025-го. Согласно результатам проведенного анализа, заметней всего подорожали поездки в Ленинградской области — на 18%, с 25,7 до 30,4 руб. В Московской области тариф вырос за год на 16%, с 31,4 до 36,3 руб. С похожим темпом (16% за год) дорожало такси в Воронежской области, где минута поездки теперь обходится пассажиру в среднем в 24,6 руб. «Яндекс Такси» снизит тарифы на поездки с детьми Экономика rbc.group В Самарской области тариф вырос на 15% (22,2 руб/мин), в Пермском крае — на 14% (23 руб/мин). На 13% увеличился тариф у таксистов Свердловской области (23 руб/мин), Волгоградской области (21,5 руб/мин), Красноярского края (23,1 руб/мин) и Нижегородской области (24,8 руб/мин). В Башкирии минута поездки подорожала на 12%, с 20,3 до 22,7 руб., а в соседнем Татарстане — на 10%, с 22 до 24,2 руб., как и в Омской области, где стоимость минуты выросла с 19,1 до 21 руб. Медленней всего тариф рос в Челябинской области — на 8%, с 20,2 до 21,7 руб. rbc.group При этом по сравнению с предыдущим годом сервис зафиксировал более низкие темпы повышения тарифа. Аналитики связали это с нормализацией ситуации на рынке: стало больше автомобилей и реже срабатывали повышающие коэффициенты. Читайте РБК в Telegram.	8	\N	2025-07-09 12:45:02	2025-07-09 12:45:02
1372	5170	associaciya-investorov-uznala-o-sluchayah-aresta-akciy-yugk-u-minoritariev	Ассоциация инвесторов узнала о случаях ареста акций ЮГК у миноритариев		После остановки на Мосбирже торгов акциями ЮГК стало известно о случаях ареста этих бумаг у миноритариев. Это связано с обеспечительными мерами суда, сообщили в ВТБ. Генпрокуратура требует передачи ЮГК государству Южуралзолото UGLD — Фото: Илья Наймушин / РИА Новости Депозитарий брокера ВТБ наложил арест на акции «Южуралзолота» по крайней мере у некоторых клиентов. Об этом сообщил «РБК Инвестициям» председатель правления Ассоциации розничных инвесторов (АРИ) Илья Херсонцев, также это следует из депозитарного отчета, который один из клиентов ВТБ предоставил «РБК Инвестициям» (на фото). В документе говорится, что ценные бумаги  находятся «под арестом». Пресс-служба ВТБ подтвердила арест акций «Южуралзолота», в том числе у миноритариев. Отчет депозитария брокера ВТБ, направленный частному инвестору, о том, что его акции ЮГК находятся под арестом. (Фото: РБК Инвестиции) Херсонцев допустил, что депозитарий ВТБ наложил арест на акции миноритарных акционеров на основании исполнительного листа, выданного судом в рамках рассмотрения иска о передаче активов золотодобытчика в собственность государства. По его словам, исполнительный лист содержит формулировку «арестовать акции», которую депозитарий указанного брокера трактовал не в пользу миноритарных акционеров и поэтому наложил арест на все акции, а не только мажоритариев. «Банк осуществил перевод ценных бумаг ПАО «ЮГК» на отдельный раздел счета депо в соответствии с поступившими документами о принятии обеспечительных мер на основании судебного решения. Все действия банка соответствуют действующему законодательству и выполняются на основании официально полученной информации», — сообщил «РБК Инвестициям» представитель ВТБ. По его словам, депозитарий автоматически вернет бумаги клиентов обратно в торговый раздел счета, если получит новые или обновленные документы, которые будут предусматривать изменение ранее установленных ограничений. Предварительное заседание по делу ЮГК прошло 8 июля в закрытом режиме. По его итогам суд назначил на 10 июля основное заседание по иску Генпрокуратуры об обращении в доход государства доли основного владельца «Южуралзолото» Константина Струкова в компании и УК ЮГК. По иску были приняты обеспечительные меры, их суть не раскрывалась. «РБК Инвестиции  » направили запросы в пресс-службы крупнейших российских брокеров, Банка России и Национального расчетного депозитария (НРД). По словам заместителя генерального директора по брокерскому бизнесу финансовой группы «Финам» Дмитрия Леснова, в инвесткомпании пока не получали от НРД информации об аресте акций клиентов Мосбиржа приостановила торги акциями «Южуралзолота» Южуралзолото , Иск , Акции , Брокер 4 июля Мосбиржа полностью приостановила торги акциями компании во всех режимах на основании предписания Банка России. Регулятор тогда объяснил это решение словами «дать рынку успокоиться». Вслед за Мосбиржей такую же меру приняли и на СПБ Бирже. Финансовый инструмент, используемый для привлечения капитала. Основные типы ценных бумаг: акции (предоставляет владельцу право собственности), облигации (долговая ценная бумага) и их производные. Подробнее Инвестиции — это вложение денежных средств для получения дохода или сохранения капитала. Различают финансовые инвестиции (покупка ценных бумаг) и реальные (инвестиции в промышленность, строительство и так далее). В широком смысле инвестиции делятся на множество подвидов: частные или государственные, спекулятивные или венчурные и прочие. Подробнее	4	\N	2025-07-09 12:45:02	2025-07-09 12:45:02
1367	5011	nad-rossiey-za-noch-sbili-86-dronov	Над Россией за ночь сбили 86 дронов	https://s0.rbk.ru/v6_top_pics/media/img/2/04/347520388063042.jpeg	Больше всего дронов сбито в Курской области. Хинштейн сообщал, что в Рыльске под удар попали корпус больницы и здание скорой, пострадали двое Фото: Алексей Коновалов / ТАСС Средства противовоздушной обороны за ночь сбили 86 украинских дронов над Россией, сообщает Минобороны. Четыре беспилотника были уничтожены над Московским регионом, из них два летели на Москву. В Курской области сбиты 23 дрона, в Брянской — 15, в Тульской — 16. Еще по 12 — над Белгородской и Орловской областями. Два дрона уничтожили в Смоленской области, еще по одному — в Воронежской и Рязанской областях. Мэр Москвы Сергей Собянин сообщал об уничтожении дронов в 2:49 и 3:02 мск, не приведя подробностей. В аэропорту Шереметьево в это время вводили ограничения на прием и выпуск самолетов. rbc.group Собянин сообщил о двух сбитых дронах на подлете к Москве Политика rbc.group О работе ПВО в течение ночи отчитывались власти еще нескольких регионов. В Курской области, по словам врио губернатора Александра Хинштейна, под удар попали инфекционный корпус Рыльской центральной районной больницы, здание скорой и административное здание ЗАО «Агрофирма Рыльская», двое ранены. Накануне вечером атаке подвергся Курск, погибли три человека, в том числе сотрудник Росгвардии, еще семеро пострадали. Читайте РБК в Telegram.	7	\N	2025-07-09 10:05:02	2025-07-09 10:29:20
1368	5057	tayvan-nachal-samye-masshtabnye-ucheniya-v-svoey-istorii	Тайвань начал самые масштабные учения в своей истории	https://s0.rbk.ru/v6_top_pics/media/img/9/09/347520461150099.jpeg	Ежегодные учения «Ханьгуан» продлятся десять дней, вдвое дольше обычного, тайваньские военные отработают сценарии вторжения Китая. В маневрах примут участие рекордные 20 тыс. резервистов и мирные жители Фото: Ann Wang / Reuters В среду, 9 июля, на Тайване начались ежегодные военные учения «Ханьгуан», сообщает Focus Taiwan. Они продолжатся десять дней, до 18 июля, что вдвое дольше обычного. Традиционно маневры, которые проводятся на острове с 1984 года, длятся пять дней и четыре ночи. Они призваны проверить боеготовность Тайваня на случай китайского вторжения. В этот раз к учениям привлекут рекордные 20 тыс. резервистов, пишет Bloomberg. Участвовать будут и гражданские: они проверят подвалы крупной сети супермаркетов, переоборудованные в укрытия, а местные власти — готовность оказывать базовые услуги и поставки в условиях кризиса. rbc.group «Цель учений в этом году — укрепить способность Тайваня к долгосрочному сопротивлению и укрепить устойчивость как в армии, так и в гражданском обществе», — заявил внештатный научный сотрудник Института исследований национальной обороны и безопасности в Тайбэе Чэ Чжун. В маневрах военные задействуют больше техники, закупленной у США, в частности реактивные системы залпового огня HIMARS (первые боевые испытания систем прошли в мае). По словам Чэ Чжуна, учения решили продлить в том числе из-за необходимости протестировать новое оружие, особенно беспилотники. rbc.group Рютте описал звонок Си Цзиньпина Путину в случае нападения на Тайвань Политика Как сообщили в Министерстве национальной обороны Тайваня, в первые дни военные отработают противостояние китайской тактике «серой зоны», которая подразумевает перекрытие доступа к портам острова береговой охраной. Затем, с 13 по 18 июля, маневры перейдут в фазу «полномасштабных боевых действий», в том числе проведение противодесантных операций на побережье. Китай считает Тайвань своей провинцией, но Тайбэй настаивает на своей независимости. Financial Times со ссылкой на источники в Минобороны Тайваня писала в мае, что китайские ВВС и ракетные войска усовершенствовались до такой степени, что «могут в любой момент» атаковать остров. В Пекине допускали применение военной силы, чтобы взять остров под контроль, заявляя при этом, что стремятся к «мирному воссоединению». Читайте РБК в Telegram.	9	\N	2025-07-09 10:35:01	2025-07-09 10:35:01
1369	5083	perestrelka-i-smert-podozrevaemogo-v-podgotovke-podryva-mosta-video	Перестрелка и смерть подозреваемого в подготовке подрыва моста. Видео		Video ФСБ показала видео с мужчиной, который, по версии следствия, планировал устроить подрыв моста в Саратовской области. Подозреваемый оказал вооруженное сопротивление. На оперативных кадрах, снятых с беспилотника через тепловизор, показан момент, когда его застрелили. На другом фрагменте можно увидеть тайник, где нашли канистру со взрывчаткой. ФСБ застрелила готовившего подрыв моста в Саратовской области Политика Читайте РБК в Telegram.	5	\N	2025-07-09 10:45:04	2025-07-09 10:45:04
1370	5121	cnn-opublikoval-audiozapis-s-ugrozoy-trampa-razbombit-moskvu-k-chertyam	CNN опубликовал аудиозапись с угрозой Трампа «разбомбить Москву к чертям»	https://s0.rbk.ru/v6_top_pics/media/img/1/81/347520413618811.jpeg	На записи с встречи Трампа с донорами в 2024 году республиканец пересказывает беседу с Путиным, в ходе которой отговаривал его от начала боев на Украине. По словам республиканца, Путин «на 10%» поверил в угрозу разбомбить Москву Дональд Трамп (Фото: Kevin Lamarque / Reuters) CNN опубликовал аудиозаписи от 2024 года, сделанные во время предвыборных мероприятий тогда еще кандидата в президенты США Дональда Трампа, на которых он рассказывает спонсорам, что отговаривал российского президента Владимира Путина от начала военных действий против Украины, пригрозив «разбомбить Москву». Об этих словах Трампа стало известно в прошлом году, в частности, в мае 2024-го об этом писала The Washington Post, но аудио прежде не обнародовали. CNN уточняет, что записи были сделаны на встречах республиканца с донорами в Нью-Йорке и Флориде. Доступ к ним получили журналисты Джош Доус, Тайлер Пейджер и Айзек Арнсдорф, авторы книги о выборах в США 2024 года. «Я сказал Путину: «Если вы войдете в Украину, я разбомблю Москву к чертям. Говорю вам, у меня нет выбора». А потом [Путин] такой: «Я вам не верю». «Он сказал: «Не может быть», а я сказал: «Может», — говорит Трамп на одной из записей. По словам республиканца, Путин поверил ему «на 10%». Когда именно состоялась эта беседа, политик не уточнил. rbc.group Трамп заявил о планах устроить России «маленький сюрприз» Политика rbc.group Со слов Трампа, позже он сделал аналогичное предупреждение в разговоре с китайским лидером Си Цзиньпином: заявил, что, если Китай вторгнется на Тайвань, США «разбомбят к чертям» Пекин. «Он подумал, что я сошел с ума, он переспросил: «Пекин? Вы собираетесь разбомбить...», — процитировал Трамп председателя КНР. По словам политика, Си тоже поверил ему «на 10%», хотя «хватило бы и 5%». После этого, утверждает Трамп, у него с Си «никогда не было проблем». Во время предвыборной кампании республиканец неоднократно заявлял, что при нем конфликт России и Украины не начался бы, и обещал завершить военные действия в короткие сроки. В первые дни на посту президента он говорил, что обе стороны готовы к соглашению о мире, однако со временем разочаровался как в Путине, так и в президенте Украины Владимире Зеленском. Трамп не раз допускал, что США откажутся от посредничества в урегулировании из-за отсутствия прогресса. Накануне, 8 июля, Трамп вновь заявил, что «недоволен» Путиным и добавил, что «очень серьезно» рассматривает возможность введения санкций против России. В Кремле отмечали, что Россия внимательно относится ко всем заявлениям Трампа, заинтересована в достижении своих целей, предпочтительно «политико-дипломатическими средствами». «Но пока это не представляется возможным, мы продолжаем нашу спецоперацию», — говорил пресс-секретарь президента Дмитрий Песков. Что касается санкций, власти России считают их незаконными, с Москвой нельзя разговаривать «языком ультиматумов», заявляли в Кремле. Читайте РБК в Telegram.	3	\N	2025-07-09 11:25:02	2025-07-09 11:25:02
1373	5172	roskosmos-obyasnil-ekonomiey-otkaz-ot-proektov-sputnikovyh-gruppirovok	«Роскосмос» объяснил экономией отказ от проектов спутниковых группировок	https://s0.rbk.ru/v6_top_pics/media/img/6/62/347520522560626.jpeg	Глава «Роскосмоса» сообщил, что несколько проектов предложили бизнесу, но «частники пока интереса не проявили». Вернуться к проектам по созданию спутниковых группировок для обеспечения доступа в интернет «не будет проблемой» Фото: Андрей Любимов / РБК «Роскосмос» приостановил проекты по созданию спутниковых группировок «Марафон-IoT» и «Скиф», чтобы уменьшить расходы федерального бюджета, заявил «РИА Новости» глава госкорпорации Дмитрий Баканов. «Ряд проектов, которые были в рамках предыдущей версии национального проекта [по освоению космоса], мы предлагаем бизнесу. <…> Частники к указанным проектам пока интереса не проявили», — сообщил Баканов, добавив, что вернуть их «не будет проблемой». В июне Баканов говорил, что «Скиф» и «Марафон-IoT» отсутствуют в новом нацпроекте «в том облике, в котором они были до этого». rbc.group «Роскосмос» начал переговоры о строительстве космодромов в странах Азии Общество rbc.group «Марафон-IoT» разрабатывается для обеспечения доступа в интернет с разных устройств, а «Скиф» — для предоставления услуг спутникового интернета обычным абонентам. Они должны были стать частью реализуемой «Роскосмосом» федеральной программы «Сфера». Сама программа по-прежнему актуальна, уточнил Баканов. «Роскосмос» заключил контракты на изготовление этих спутниковых группировок с компанией «Информационные спутниковые системы им. академика Решетнева» в 2023 году, но тогда госкорпорация нашла средства только на половину плановой численности аппаратов, сообщала информационная группа Comnews. Изначально проекты предполагали вывести на орбиту 264 спутника «Марафон-IoT» и 12 «Скифов». Эксперты в разговоре с изданием отмечали, что система «Марафон-IoT» в соответствии с исходным техническим заданием разрабатывалась для контроля и управления беспилотными скоростными средствами, в том числе воздушными беспилотниками. Президент Владимир Путин утвердил новый национальный проект по космосу в середине июня. Он включает восемь направлений, в том числе атомную энергетику в космосе и научный космос. До 2036 года на проект планируют выделить 4,4 трлн руб. Читайте РБК в Telegram.	2	\N	2025-07-09 12:45:02	2025-07-09 12:45:02
1374	5174	merc-zayavil-chto-v-uregulirovanii-na-ukraine-diplomatiya-ischerpana	Мерц заявил, что в урегулировании на Украине дипломатия исчерпана	https://s0.rbk.ru/v6_top_pics/media/img/0/34/347520487429340.jpeg	Германия продолжит помогать Украине, пообещал Мерц. МИД предупреждал, что будет рассматривать удары по целям России с использованием Taurus как прямое участие Берлина в конфликте Фридрих Мерц (Фото: Christian Mang / Reuteres) Канцлер Германии Фридрих Мерц во время обсуждений государственного бюджета в бундестаге пообещал Украине дальнейшую помощь со стороны Берлина, «несмотря на сопротивление левых и пророссийских правых», передает корреспондент РБК. «Дипломатические средства [урегулирования] исчерпываются», — заявил он и раскритиковал российские удары по украинской территории. Канцлер поблагодарил тех, кто поддержал поправки к Конституции, которые позволяют «приложить значительные усилия для восстановления обороноспособности» страны. В начале июля Мерц говорил, что поставки Украине крылатых дальнобойных ракет Taurus, о которых долгое время просил Киев, «остаются вариантом», но договоренностей с президентом Владимиром Зеленским пока нет. Канцлер отмечал, что обучение украинских военных этой системе займет около полугода и оно еще не начато. rbc.group Мерц заявил, что конфликт на Украине не решить военным путем Политика rbc.group Ранее Мерц допускал возможность передачи таких систем в случае координации с европейскими союзниками. Дальность полета ракет Taurus — 500 км. В начале мая агентство DPA сообщило, что правительство Германии перестанет размещать в открытом доступе сведения о поставках Украине ракетных установок, танков, систем ПВО и другого вооружения и будет держать эту информацию в тайне. Позже это подтвердил глава МИД Йохан Вадефуль, заявив, что Берлин будет действовать таким образом, «чтобы это не было предсказуемо для России». Списки переданного Украине оружия публикуются на сайте правительства Германии, данные в нем актуальны по состоянию на середину апреля. Россия осуждает поставки оружия Украине. Кремль назвал передачу дальнобойного оружия Киеву шагом к дальнейшей эскалации конфликта. В российском МИДе подчеркивали, что удары по российским целям с использованием Taurus будут рассматриваться как прямое участие Германии в конфликте. Мерц отвергал такую возможность. Несмотря на готовность к поставкам оружия Украине, Мерц выражал уверенность, что конфликт невозможно решить военным путем, и призывал повысить экономическое давление на Москву. Кремль отмечал, что Россия имеет «изрядный опыт» противостояния западным санкциям, которые считает незаконными, и будет стараться «максимально минимизировать» их последствия. Читайте РБК в Telegram.	10	\N	2025-07-09 12:45:02	2025-07-09 12:45:02
1375	5166	rossiyskie-voyska-zanyali-tolstoy-v-dnr	Российские войска заняли Толстой в ДНР	https://s0.rbk.ru/v6_top_pics/media/img/3/12/347520524984123.jpeg	Российские подразделения продвинулись вдоль шоссе на Днепропетровскую область Фото: сервис «Яндекс.Карты» Подразделения российской группировки «Восток» заняли населенный пункт Толстой в Донецкой народной республике. Минобороны сообщило, что его взятие стало «результатом активных и решительных действий». Толстой находится к северу от села Поддубное (было также занято российскими подразделениями) и шоссе, ведущего в Днепропетровскую область. Также в зоне военной операции за последние сутки произошли следующие события: rbc.group подразделения группировки «Cевер» нанесли удары по позициям восьми украинских бригад и двух полков в районах населенных пунктов Рыжевка, Кондратовка, Варачино, Яблоновка, Юнаковка, Писаревка, Садки, Новая Сечь, Ольховатка, Хатнее, Меловое; подразделения группировки «Запад» нанесли удары по позициям пяти бригад в районах населенных пунктов Купянск, Благодатовка, Колодези, Яцковка, Зеленая Долина; подразделения группировки «Юг» нанесли удары по позициям девяти бригад в районах населенных пунктов Николаевка, Переездное, Славянск, Северск, Миньковка, Серебрянка, Щербиновка; подразделения группировки «Центр» нанесли удары по позициям 13 бригад и двух полков в районах населенных пунктов Красноармейск, Родинское, Димитров, Муравка, Удачное, Петровского, Гродовка, Новоподгородное, Филия; подразделения группировки «Bосток» нанесли удары по позициям восьми бригад в районах населенных пунктов Камышеваха, Bольное Поле, Bоскресенка, Темировка, Ольговское, Малиновка, Полтавка; подразделения группировки «Днепр» нанесли удары по позициям девяти бригад в районах населенных пунктов Каменское, Плавни, Орехов, Новоандреевка, Степовое, Антоновка, Садовое. rbc.group Общие потери ВСУ за сутки в военном ведомстве оценили более чем в 1250 человек. Среди уничтоженной техники в сводке упомянуты в том числе три танка, САУ Krab.	9	\N	2025-07-09 12:45:03	2025-07-09 12:45:03
1376	5169	na-tayvane-nachalis-krupneyshie-v-istorii-ucheniya-po-otrazheniyu-ataki-knr	На Тайване начались крупнейшие в истории учения по отражению атаки КНР	https://s0.rbk.ru/v6_top_pics/media/img/4/62/347464494253624.jpeg	На Тайване стартуют учения с имитацией вторжения армии КНР. Власти острова, разведка США и ряд экспертов считают, что подобное может произойти уже в 2027-м. Насколько неизбежен конфликт и как он мог бы развиваться — в статье РБК Фото: Chris McGrath / Getty Images Девятого июля на Тайване начнутся ежегодные военные учения «Ханьгуан», которые продлятся десять дней — вдвое дольше, чем в предыдущие годы. К маневрам привлечено рекордное число участников: к регулярным войскам присоединятся более 22 тыс. резервистов. В Министерстве обороны Китайской Республики сообщили, что учения пройдут в формате «беспрецедентных десятидневных круглосуточных боевых стрельб», что позволит максимально их приблизить к реальным боевым условиям. В ходе учений будет смоделирован многоэтапный конфликт. На первом этапе остров столкнется с угрозами в «серой зоне» — кибератаками и экономическим давлением. Затем тайваньским вооруженным силам предстоит отразить «совместный огневой удар и морскую переправу десантной группы» Народно-освободительной армии Китая (НОАК). Военнослужащие и резервисты будут отрабатывать тактику ведения боя как на прибрежных участках, где возможна высадка предполагаемого противника, так и в условиях города. Параллельно на острове пройдут учения по гражданской обороне в случае ракетной атаки и эвакуации. С этой целью в столице и крупных городах приостановят работу предприятий и движение транспорта. После гражданской войны в Китае, завершившейся в 1949 году победой коммунистов, прежнее правительство перебралось с материкового Китая на Тайвань и продолжало настаивать, что является единственной легитимной властью. Вплоть до 1970-х годов подобного мнения придерживалась значительная часть международного сообщества: представительство в ООН было у Китайской Республики (Тайвань), и большинство стран не признавали коммунистическое правительство Китайской Народной Республики. Однако в 1971 году Тайбэй утратил место в ООН, а со временем и дипломатическую поддержку. Сейчас независимость Тайваня признают лишь Ватикан и 11 государств: Белиз, Гватемала, Гаити, Маршалловы Острова, Палау, Парагвай, Сент-Китс и Невис, Сент-Люсия, Сент-Винсент и Гренадины, Тувалу и Эсватини. Пекин считает Тайвань своей отколовшейся провинцией, в то время как Тайбэй отвергает модель «Одна страна — две системы», предложенную КНР. rbc.group Насколько в ближайшие годы вероятна война в Тайваньском проливе rbc.group В последнее время 2027 год все чаще называют вероятным временем вторжения Китая на Тайвань. Впервые подобная оценка прозвучала в 2021 году, когда адмирал Филип Дэвидсон, тогдашний глава Индо-Тихоокеанского командования США, заявил на слушаниях в конгрессе, что лидер КНР Си Цзиньпин поручил НОАК быть готовой к захвату Тайваня к 2027 году. В феврале 2023 года директор ЦРУ Уильям Бернс подтвердил, что, по данным американской разведки, Пекин действительно ориентируется на этот срок при аккумулировании военного потенциала, необходимого для установления контроля над островом. В марте 2025 года Министерство обороны Тайваня впервые официально обозначило 2027 год как вероятный срок начала агрессии со стороны КНР. На майском саммите по безопасности «Диалог Шангри-Ла» министр обороны США Пит Хегсет вновь акцентировал внимание на этой дате: «НОАК наращивает потенциал, необходимый для этого [вторжения в 2027 году], с головокружительной скоростью. НОАК готовится к этому каждый день». Аналитический портал The Interpreter выделяет несколько причин, почему 2027 год упоминается чаще других в качестве дедлайна войны в Тайваньском проливе: это будет год 100-летия НОАК и XXI съезда Коммунистической партии Китая (КПК), на котором Си может быть переизбран на беспрецедентный четвертый срок. 2027 год также станет заключительным в президентском сроке нынешнего лидера Тайваня Лая Циндэ — в январе 2028-го на острове должны пройти выборы. На XX съезде КПК была поставлена задача по реализации «столетних целей борьбы» в сфере военного строительства к юбилейному 2027 году, напомнил директор Центра комплексных европейских и международных исследований Василий Кашин в беседе с РБК. По его словам, модернизация НОАК будет включать в себя создание новой системы стратегического сдерживания, изменение системы военных закупок, а также широкое внедрение в вооруженные силы искусственного интеллекта и автоматизации. США и их союзники начали разыгрывать битву за Тайвань Политика Риторика КНР в отношении Тайваня в последние годы звучит все жестче. В феврале 2025 года сингапурское издание ThinkChina обратило внимание, что в китайских правительственных документах и заявлениях за 2024–2025 годы, посвященных тайваньской проблематике, из стандартных формулировок о необходимости воссоединения с островом пропал эпитет «мирное». А в начале марта агентство Reuters отметило, что в докладе премьер-министра КНР Ли Цяна не было упоминания «мирного воссоединения» с Тайванем, а тональность заявлений на эту тему стала заметно агрессивнее. На вопрос о возможной смене курса официальный представитель канцелярии по делам острова при китайском Госсовете Чэнь Биньхуа ответил, что «мирное воссоединение <…> остается основополагающей политикой для решения тайваньского вопроса», но подчеркнул готовность властей к «решительным мерам» в случае провокаций. В последней «Белой книге» китайского правительства, посвященной тайваньскому вопросу и опубликованной в августе 2022 года, говорится, что Пекин оставляет за собой право применить силу в случае «вмешательства внешних сил и любой сепаратистской деятельности». «Немирные средства — крайняя мера при непреодолимых обстоятельствах», — подчеркивается в документе. Симона Грано, руководитель направления исследований отношений Китая и Тайваня Института азиатских и восточных исследований Университета Цюриха, отметила в комментарии РБК, что необходимость присоединить Тайвань для Си обусловлена не только историческими и идеологическими факторами, но и геополитическими амбициями. Захват острова укрепит военное влияние КНР и позволит Пекину ослабить позиции США в Азиатско-Тихоокеанском регионе, разорвав так называемую первую островную цепь в Азии, куда также входят Япония и Филиппины. «И, наконец, есть экономические причины, связанные с превосходством Тайваня в производстве полупроводников, которые также имеют жизненно важное значение для будущего развития Китая в военной и гражданских областях», — отметила эксперт. Вместе с тем Грано усомнилась, что Китаю выгодно «открывать новый фронт» в условиях экономического спада, высокого уровня безработицы среди молодежи, кризиса на рынке недвижимости и необходимости диверсификации торговых связей из-за тарифной войны, начатой Дональдом Трампом. «Я полагаю, что Китай стремится к 2027 году обрести способность и ресурсы для проведения такой операции, но это не означает, что он немедленно воспользуется этой возможностью, даже если она появится», — предположила эксперт. Кашин разделяет эту точку зрения. По его мнению, предпринимаемые Пекином усилия в сфере военного строительства необязательно означают его стремление начать войну за Тайвань именно в 2027 году, но указывают на желание чувствовать себя уверенно при любом сценарии. Эксперт отметил, что обстановка в регионе значительно ухудшилась, после того как в 2022 году Тайвань посетила тогдашний спикер палаты представителей Нэнси Пелоси, что было воспринято Пекином как намеренное оскорбление и пересечение красных линий. Кризис может разразиться в любой момент как реакция на те или иные политические события на острове, считает Кашин. «Например, если китайцы посчитают, что отсутствуют даже малейшие перспективы решения тайваньской проблемы мирным путем, они могут пойти на реализацию кампании жесткого военного давления с целью заставить тайваньское руководство принять китайские условия», — предположил он. По оценке эксперта, важнейшей предпосылкой к мирному решению могло бы стать признание Тайванем так называемого консенсуса 1992 года, выработанного на двусторонних переговорах, согласно которому материк и Тайвань являются частью «единого Китая». Как и когда может начаться конфликт Согласно последнему ежегодному докладу The Military Balance 2025, материковый Китай значительно превосходит Тайвань как по размеру военного бюджета ($235 млрд против $18,9 млрд в 2024 году), так и по численности армии (2 млн против 169 тыс.). Тайвань располагает значительным числом резервистов (1,7 млн против 510 тыс. у КНР), которые могут быть мобилизованы в случае конфликта. Но Китай имеет явное преимущество в боевой технике, особенно в количестве боевых бронированных машин, танков, артиллерии, авиации и флота, включая авианосцы и подводные лодки. Кроме того, с 2020 года КНР также примерно втрое увеличила запас высокоточных баллистических и крылатых ракет (до 3,5 тыс.) и почти удвоила количество пусковых установок (до 1,5 тыс.), говорится в прошлогоднем отчете Пентагона. Однако потенциальное вторжение на Тайвань будет сопряжено для Китая с рядом сложностей, отмечают эксперты. Из-за сезонных муссонов у НОАК есть всего два окна для потенциальной высадки — апрель и октябрь. На эти же месяцы часто приходятся и китайские военно-морские маневры в регионе, в том числе весенние учения «Гром над проливом — 2025А» (до нынешнего года — «Совместный меч»). Ландшафт Тайваня также затрудняет высадку десанта: восточный берег слишком скалист и не подходит для этих целей, а западное побережье окружают отмели, где глубина не превышает 15 м. Впрочем, решение этой проблемы НОАК уже нашла. В январе этого года стало известно о строительстве в Китае специальных барж, похожих на те, что союзные силы во время Второй мировой войны использовали в качестве плавучих причалов при высадке в Нормандии. С весны китайские власти приступили к их испытаниям — кадры с баржами были показаны в конце марта в эфире государственного телеканала CCTV. В передаче отмечалось, что они могут быть задействованы после того, как НОАК обеспечит превосходство на воде и в воздухе. Выстроившись в ряд, три таких судна могут создать рампу общей протяженностью около 820 м, поясняет The New York Times. По оценке исследователя вашингтонского Совета по международным отношениям Дэвида Сакса, на переброску сотен тысяч китайских солдат через Тайваньский пролив потребуются несколько недель и значительный флот, а каждая из перебросок может занять несколько часов. При этом военные приготовления КНР, включая стягивание подразделений в восточные провинции Фуцзянь и Гуандун, будет легко вычислить по спутниковым снимкам, обратил внимание эксперт. В 2021 году Министерство обороны Тайваня предупреждало, что КНР может осуществить нападение под прикрытием учений и застать власти острова врасплох. Военный аналитик Том Шугарт обнаружил, что НОАК стала задействовать в военно-морских учениях гражданские грузовые суда, которые обычно используются для перевозки автомобилей, — их применение в начале боевых действий также может обеспечить эффект неожиданности. Ключевым элементом возможной операции станет морская блокада Тайваня, о чем открыто говорят китайские военные эксперты. «Если Тайвань потеряет морские пути снабжения, его ресурсы быстро истощатся, социальный порядок нарушится, а жизнь населения окажется под угрозой», — заявил профессор Национального университета обороны НОАК, генерал-майор Мэн Сянцин в эфире CCTV (цитата по AFP). Дело в том, что Тайвань на 96% зависит от импорта энергоресурсов, включая нефть, уголь и природный газ, а также ввозит морем порядка 70% продовольственных товаров. Командование восточного театра военных действий НОАК, ответственное за операции в проливе, на апрельских учениях «Гром над проливом» отрабатывало как раз «блокаду стратегических районов и морских путей», что также подтверждает подготовку к подобному сценарию. Как Тайвань наращивает подготовку к военному конфликту с Китаем Политика Успех возможной военной операции КНР будет во многом зависеть от эффективности координации между армией, авиацией, флотом и десантными войсками, считает Симона Грано. Она также допустила, что Пекин может предпринять попытку «обезглавить» руководство Тайваня, в том числе физически устранив президента Лая Циндэ, чтобы предотвратить консолидацию общества вокруг тайваньских властей. С этой целью Пекин может попытаться создать на острове пятую колонну из внедренных агентов, и ужесточение мер по борьбе со шпионажем и диверсиями, объявленное Лаем в марте 2025 года, отчасти вызвано этими угрозами, предположила эксперт (только за последний год на Тайване было несколько скандалов, связанных со шпионажем на КНР, включая случаи с вербовкой охранников президентского офиса и бывших сотрудников правящей Демократической прогрессивной партии). Как поведут себя США и соседи Китая Главным фактором неопределенности в случае военной эскалации станет вмешательство или невмешательство в конфликт США и их союзников, а также степень этого вмешательства, считает Кашин. «Если Тайвань сопротивляется в одиночку, то его падение — это вопрос времени, причем, скорее всего, считаных недель — максимум», — прогнозирует он. Вашингтон не имеет официальных дипломатических отношений с Тайбэем, но поставляет ему оружие в рамках принятого в 1979 году Закона об отношениях с Тайванем. США публично придерживаются политики «одного Китая». Но 46-й президент США Джо Байден заявлял о готовности задействовать американские войска для защиты Тайваня. Дональд Трамп пока не раскрывал свою позицию на этот счет. Однако министр финансов США Скотт Бессент заявил в начале марта, что Трамп убежден: Китай не предпримет вторжения на Тайвань в период, пока во главе КНР Си Цзиньпин. Опрошенные РБК эксперты также предположили, что в случае вступления США в конфликт в него будет вовлечена и союзная Япония. На территории этой азиатской страны находится примерно 54 тыс. американских военнослужащих — больше, чем в любой другой стране мира. Значительная их часть, около 30 тыс., — контингент военных баз, расположенных на Окинаве (около 700 км от Тайваня). Один из самых южных островов Японии Йонагуни расположен в 110 км к северу от Тайваня. На нем проживают всего 1,7 тыс. человек, но в 2016 году там была открыта военная база, а в начале 2025-го стало известно о планах разместить на острове зенитно-ракетный комплекс (ЗРК) Type-03. На подготовку Японии к возможному участию в конфликте указывает и то, что в марте 2025 года правительство страны впервые представило планы по эвакуации 120 тыс. жителей и туристов с островов, расположенных вблизи Тайваня. А в июне «Никкэй Симбун» сообщила о строительстве бомбоубежищ на южных островах. Согласно индексу Global Firepower 2025, силы самообороны Японии занимают восьмое место в мире по военной мощи, а США и КНР — первое и третье соответственно. Япония ведет интенсивное военное строительство: в декабре 2022 года Токио утвердил новую оборонную стратегию, предусматривающую наращивание военных расходов до 2% ВВП к 2027 году (по итогам 2025 года, как ожидается, будет преодолена отметка в 1,8%). Япония совместно с США производит ракеты средней дальности AMRAAM и зенитные PAC-3 MSE для систем Patriot, а во время мартовского визита Хегсета в Токио обсуждалось совместное производство противокорабельных ракет SM-6. Важным плацдармом для американских военных также могут стать Филиппины из-за их географической близости к возможному театру боевых действий: самая северная группа филиппинских островов Батанес находится менее чем в 200 км от Тайваня. По соглашению от 2014 года США получили доступ к девяти военным объектам на Филиппинах, два из которых находятся вблизи Тайваня. Япония и Филиппины проводят регулярные учения совместно с США, а в июле 2024 года они заключили оборонный пакт, позволяющий им размещать военнослужащих на территории друг друга. Угроза вступления в конфликт США и Японии не заставит КНР отказаться от операции захвата, если решение о ней все же будет принято, убежден Кашин. Он пояснил, что Пекин не может позволить себе безвозвратно утратить Тайвань: это важная часть общественного договора, который состоит в том, что, придя к власти, КПК прервала «столетие унижений», а поражение и утрата острова делегитимизирует ее в глазах общества. И Китай готовился к сценарию, при котором на защиту Тайваня встанут США и у него сохранится преимущество в виде непосредственной близости к зоне боевых действий. «Но это будет беспрецедентное потрясение, тяжелая, большая, высокотехнологичная война на море, предсказать ход которой нелегко, поскольку подобного рода войн не было после Второй мировой», — подчеркнул Кашин.	9	\N	2025-07-09 12:45:03	2025-07-09 12:45:03
1377	5185	minoborony-zayavilo-ob-udare-kinzhalom-po-voennym-aerodromam-ukrainy	Минобороны заявило об ударе «Кинжалом» по военным аэродромам Украины	https://s0.rbk.ru/v6_top_pics/media/img/1/88/347520524169881.jpeg	Фото: Алексей Никольский / РИА Новости Российские военные в ночь на 9 июля атаковали инфраструктуру военных аэродромов Украины, сообщает Минобороны. Групповой удар был нанесен высокоточным оружием большой дальности воздушного базирования, в том числе гиперзвуковыми ракетами «Кинжал» и ударными беспилотниками большой дальности. В ведомстве заявили, что все назначенные объекты поражены. Материал дополняется	10	\N	2025-07-09 13:05:02	2025-07-09 13:05:02
1378	5195	fsb-zastrelila-gotovivshego-podryv-mosta-v-saratovskoy-oblasti	ФСБ застрелила готовившего подрыв моста в Саратовской области		По версии ФСБ, мужчина поддерживал контакты с Украиной и после взрыва моста собирался отправиться в эту страну для участия в боях. Силовики изъяли 11 кг взрывчатки и пистолет Макарова Video Россиянин готовился подорвать железнодорожный мост в Саратовской области, при задержании в момент изъятия взрывчатки из тайника «он оказал вооруженное сопротивление и в результате ответным огнем был уничтожен», заявил центр общественных связей ФСБ. По данным спецслужбы, мужчина был сторонником признанной в России террористической и запрещенной организации (ее название не уточняется). Он поддерживал контакты с Украиной и после взрыва собирался отправиться туда «для принятия участия в боевых действиях», заявили в ФСБ. В Петербурге ФСБ задержала девушку в момент закладки бомбы под машину Политика rbc.group Силовики изъяли самодельную взрывчатку массой 11 кг, пистолет Макарова и боеприпасы. Уголовное дело заведено по статьям о незаконном изготовлении (ч. 2 ст. 223.1) и обороте взрывчатых веществ (ч. 3 ст. 222.1), по ним грозят сроки до 15 и 12 лет соответственно. В конце июня ФСБ сообщила, что в Подмосковье двое россиян готовили теракт против военного. Их обнаружили, когда те доставали взрывчатку из тайника. При задержании мужчины «оказали вооруженное сопротивление», их застрелили ответным огнем, заявили в ведомстве, назвав россиян «пособниками украинских спецслужб». На прошлой неделе в Петербурге задержали девушку 2002 года рождения, которая закладывала бомбу под машину сотрудника оборонного предприятия. По версии ФСБ, она сама связалась с представителями украинских спецслужб и «изъявила желание принять участие в диверсионно-террористической деятельности» в обмен на помощь с получением гражданства страны ЕС. Читайте РБК в Telegram.	2	\N	2025-07-09 13:05:02	2025-07-09 13:05:02
1379	5204	v-otnoshenii-kakih-stran-tramp-obeshchaet-vvesti-novye-poshliny-infografika	В отношении каких стран Трамп обещает ввести новые пошлины. Инфографика	https://s0.rbk.ru/v6_top_pics/media/img/6/63/347519832489636.jpeg	7 июля президент США Дональд Трамп отправил 14 государствам письма о введении с 1 августа тарифных пошлин на импорт товаров. В апреле он уже анонсировал пошлины выше 10% для 86 стран и территорий, но позже отложил их на 90 дней Трейдеры работают на Нью-Йоркской фондовой бирже, 7 июля 2025 (Фото: Spencer Platt / Getty Images) 2 апреля президент США Дональд Трамп анонсировал введение импортных пошлин для 211 стран и территорий. В отношении большинства из них с 5 апреля вводилась базовая пошлина в размере 10%. 86 государств и территорий столкнулись с повышенными тарифами в размере от 11 до 50%. Они должны были вступить в силу 9 апреля, однако президент заявил, что многие захотели договориться о более выгодных условиях, и сначала отложил введение пошлин на 90 дней — до 9 июля, а потом продлил отсрочку до 1 августа, дав понять, что срок может быть еще сдвинут в индивидуальном порядке (позже он отказался от этих слов, написав в Truth Social, что «никаких продлений не будет»). На время переговоров пошлины для всех стран были снижены до «базовых» 10%. В отношении государств, с которыми США не смогут достичь прогресса в торговых переговорах, с 1 августа будут введены повышенные пошлины, пояснил министр финансов США Скотт Бессент. Пока письма о введении пошлин получили 14, но глава Минфина допустил, что их число может вырасти до сотни. Несмотря на слова Трампа в апреле, что более 75 стран обратились к властям США, чтобы договориться о снижении тарифных ставок, к июлю Штаты смогли заключить торговые сделки только с Вьетнамом, Великобританией и Китаем. В начале июля Бессент заявил, что страна близка еще к нескольким сделкам, известно, что США ведут переговоры с Евросоюзом. Почему тарифные переговоры США с крупнейшими партнерами зашли в тупик Политика rbc.group Тарифы, о которых было объявлено 7 июля, затронули преимущественно азиатские страны. Среди 14 участниц списка есть крупнейшие торговые партнеры США — Япония и Южная Корея. Согласно данным за май 2025 года, на них приходится 4,36 и 4,16% американского импорта соответственно, они занимают восьмое и девятое места в списке крупнейших импортеров. Также письма получили Казахстан (анонсирована пошлина в размере 25%) и Сербия (35%). В случае введения ответных тарифов Трамп пообещал повысить уже введенные пошлины на 25%. 8 июля министр торговли США Говард Лютник рассказал, планируется рассылка еще 15-20 писем в течение двух дней. rbc.group Также 7 июля Трамп заявил, что США введут 10-процентные пошлины в отношении стран, которые поддерживают «антиамериканскую политику БРИКС» (саммит объединения прошел 6–7 июля в Бразилии). На следующий день президент США пообещал «довольно скоро» ввести 10-процентные импортные пошлины в отношении самих стран БРИКС. В Кремле ответили, что деятельность БРИКС «никогда не была и не будет направлена против каких-то третьих стран». В начале года президент также грозил ввести пошлины в размере 100% против членов БРИКС, если те попытаются заменить доллар другой валютой. Кроме того, 8 июля Трамп анонсировал пошлины в размере 50% на ввоз в США меди и «очень, очень высокую ставку, около 200%», на фармацевтику. Reuters узнал условие введения США новых пошлин за поддержку БРИКС Политика Читайте РБК в Telegram.	5	\N	2025-07-09 13:15:01	2025-07-09 13:15:01
1380	5299	sud-reshil-ubrat-pamyatnik-stalinu-v-vologde-i-vernut-dengi-za-nego	Суд решил убрать памятник Сталину в Вологде и вернуть деньги за него	https://s0.rbk.ru/v6_top_pics/media/img/8/13/347520565473138.jpeg	Фото: filimonov_official / Telegram Памятник Иосифу Сталину нужно убрать с территории музея в Вологде и вернуть изготовителю монумента, а сам предприниматель должен вернуть в бюджет области 10,5 млн руб., потраченных на его изготовление. Такое решение принял Арбитражный суд Вологодской области. «Иск удовлетворить полностью», — говорится в карточке дела. rbc.group В апреле прокуратура Вологодской области обратилась в областной арбитражный суд с требованием признать недействительным контракт на создание памятника Иосифу Сталину, установленный на территории музея «Вологодская ссылка» в декабре 2024 года, вернуть предпринимателю Екатерине Ложеницыной памятник и взыскать в пользу музея 10,5 млн руб. rbc.group Истцом выступала региональная прокуратура, ответчиком — государственный музей-заповедник «Вологодская ссылка» и предприниматель Екатерина Ложеницына. К судебному разбирательству иск был принят 29 мая, заседание было назначено на 24 июня, но его отложили и назначили новое — на 9 июля. У школы в Вологодской области поставили памятник Сталину Общество Источник РБК в правительстве региона ранее уточнил, что ведомство оспаривает именно закупку, а не саму установку памятника. Статуя Иосифа Сталина в шинели была создана скульптором Константином Кубышкиным, эскиз монумента выбрал лично губернатор Вологодской области Георгий Филимонов. Жители Вологды раскритиковали установку памятника Сталину и создали петицию с требованием пересмотреть решение о его установке еще до ее начала. Читайте РБК в Telegram.	8	\N	2025-07-09 14:15:02	2025-07-09 14:15:02
1381	5313	v-rossiyu-privezut-1-mln-migrantov-iz-indii-iz-za-deficita-kadrov	В Россию привезут 1 млн мигрантов из Индии из-за дефицита кадров	https://s0.rbk.ru/v6_top_pics/media/img/7/67/347520600172677.jpeg	Андрей Беседин (Фото: Алексей Никольский / РИА Новости) В Россию приедет 1 млн мигрантов из Индии из-за нехватки высококвалифицированных кадров, заявил агентству ЕАН глава Уральской торгово-промышленной палаты Андрей Беседин. «Насколько я слышал от своих индийских коллег, до конца года в Россию, в том числе и Свердловскую область, приедет 1 млн специалистов из Индии. В Екатеринбурге открывается новое Генконсульство этой страны, которое будет заниматься этими вопросами», — сказал он. Беседин подчеркнул, что промышленным предприятиям необходимо наращивать объемы производства. Однако, по его словам, в регионе отсутствует достаточное количество сотрудников. Часть рабочих участвует в военной операции на Украине, а молодежь не идет на заводы «из-за допущенной ранее идеологической ошибки в стране». rbc.group Беседин добавил, что с Шри-Ланкой, Северной Кореей также ведется работа по этому направлению. Он отметил, что работа с трудовыми мигрантами из указанных стран будет непростой. rbc.group Материал дополняется	1	\N	2025-07-09 14:25:03	2025-07-09 14:25:03
1387	5411	byvshego-voronezhskogo-ministra-zaderzhali-na-sleduyushchiy-den-posle-otstavki	Бывшего воронежского министра задержали на следующий день после отставки	https://s0.rbk.ru/v6_top_pics/media/img/3/86/347520616501863.jpeg	Накануне губернатор Александр Гусев подписал указ об увольнении министра предпринимательства, торговли и туризма Воронежской области Геннадия Швыркова по собственному желанию, он занимал этот пост с августа 2024 года Геннадий Швырков (Фото: пресс-служба правительства Воронежской области) Задержан экс-министр предпринимательства, торговли и туризма Воронежской области Геннадий Швырков, об этом сообщают ТАСС, «РИА Новости» и «TV Губерния». Накануне губернатор Александр Гусев подписал указ об увольнении министра, сообщается на сайте регионального правительства. Швырков покинул пост по собственному желанию. «Геннадий Швырков покидает должность в связи с досрочным прекращением полномочий по собственной инициативе с 8 июля», — говорится в сообщении. По данным «TV Губерния», задержание чиновника может быть связано с его деятельностью на посту главы администрации Семилукского района. rbc.group РБК направил запрос в ФСБ Воронежской области. rbc.group Швырков занимал должность министра с августа 2024 года, до этого он более шести лет, с марта 2018 года по август прошлого года, возглавлял администрацию Семилукского района. В прошлом году от имени губернатора ему вручили почетную грамоту за многолетний плодотворный труд, большой личный вклад в социально-экономическое развитие региона. До этого Швырков был удостоен почетного знака правительства «Благодарность от земли Воронежской». В феврале 2025 года был задержан бывший замминистра торговли и предпринимательства Александр Кукин по делу о мошенничестве при реализации нацпроекта «Туризм и индустрия гостеприимства». Дело связано с семилукской базой отдыха «Мадагаскар». По нему также проходит владелец базы отдыха Евгений Ягодкин. Оба арестованы. В 2023 году Ягодкин, по версии следствия, получил грант в 10 млн руб. на благоустройство территории пляжа, но работы не выполнили в срок.  Читайте РБК в Telegram.	7	\N	2025-07-09 15:25:03	2025-07-09 15:25:03
1382	5315	kreml-zayavil-o-masse-feykov-posle-audio-s-ugrozoy-trampa-bombit-moskvu	Кремль заявил о массе фейков после аудио с угрозой Трампа бомбить Москву	https://s0.rbk.ru/v6_top_pics/media/img/6/87/347520542042876.jpeg	Песков не подтвердил и не опроверг данные о разговоре Трампа с Путиным, в ходе которого республиканец угрожал «разбомбить Москву». Он отметил, что «фейков очень много» и политики не разговаривали, когда Трамп не был президентом Дмитрий Песков (Фото: Михаил Гребенщиков / РБК) В Кремле не знают, является ли фейком аудиозапись, на которой Дональд Трамп рассказывает, как грозил Владимиру Путину «разбомбить Москву к чертям», сказал журналистам пресс-секретарь президента России Дмитрий Песков, передает корреспондент РБК Запись выступления Трампа на предвыборных встречах с донорами в Нью-Йорке и Флориде в 2024 году выложил CNN. На ней республиканец сообщил, что отговаривал Путина от начала боев на Украине, заявив, что в противном случае США нанесут удар по Москве. Со слов Трампа, Путин поверил ему «на 10%». Когда именно разговаривали политики, он не уточнил. Как отметил Песков, просить его подтвердить, действительно ли республиканец это говорил, как минимум некорректно, поскольку действие происходило в США, а сам он работает в Москве. rbc.group «Фейков сейчас очень много, зачастую фейков гораздо больше, чем правдивой информации», — добавил он. rbc.group CNN опубликовал аудиозапись с угрозой Трампа «разбомбить Москву к чертям» Политика Песков отметил также, что в момент, когда была сделана запись, Трамп еще не был главой государства. В этот период Путин не проводил с республиканцем переговоров, указали в Кремле и рекомендовали обратиться с вопросами в Белый дом. С начала 2025 года Путин и Трамп говорили по телефону шесть раз, последняя беседа состоялась 3 июля. По ее итогам республиканец сказал, что недоволен, так как «не добился никакого прогресса» по Украине. Москва рассчитывает, что Вашингтон продолжит усилия по урегулированию, заявили в Кремле, комментируя ужесточение риторики Трампа по отношению к России. Читайте РБК в Telegram.	9	\N	2025-07-09 14:25:03	2025-07-09 14:25:03
1383	5326	reshetnikovu-v-dume-napomnili-o-chubayse-i-liberalah-prezhnego-razliva	Решетникову в Думе напомнили о Чубайсе и либералах «прежнего разлива»	https://s0.rbk.ru/v6_top_pics/media/img/6/50/347520595424506.jpeg	Вячеслав Володин  (Фото: Наталья Шатохина / NEWS.ru / РБК) Спикер Госдумы Вячеслав Володин заявил, что в российском правительстве под видом либералов иногда работают «скрытые большевики». Об этом он заявил на пленарном заседании нижней палаты парламента, обращаясь к министру экономического развития Максиму Решетникову. Министр извинился перед депутатами и сказал, что впервые представляет в Думе законопроект. «Я извиняюсь за какие-то процедурные нюансы, потому что первый закон, который я представляю в Государственной Думе», — сказал Решетников. rbc.group Володин попросил его не извиняться за процедурные вопросы, а изучать их. rbc.group «Потому что процедура, нормы, правила есть демократия. А вы, как либерал в правительстве, должны это свято чтить. А у нас, получается, как будто в правительство либерал приходит, а на самом деле это скрытый большевик. И начинают продвигать всё», — ответил Володин. Он продолжил, вспомнив Анатолия Чубайса, который в 90-х годах занимал в правительстве должности вице-премьера и министра финансов. «Вот так же приходил Чубайс. А сейчас где он? Поэтому вы изучите это все и этим руководствуйтесь. И поверьте, у вас не будет тех ошибок, которые совершили либералы прежнего разлива», — резюмировал Володин. Материал дополняется	9	\N	2025-07-09 14:35:01	2025-07-09 14:35:01
1384	5357	advokat-soobshchil-o-rospuske-torpedo-v-sluchae-isklyucheniya-iz-rpl	Адвокат сообщил о роспуске «Торпедо» в случае исключения из РПЛ	https://s0.rbk.ru/v6_top_pics/media/img/5/44/347520603776445.jpeg	В четверг, 10 июля, на заседании контрольно-дисциплинарного комитета РФС будет рассмотрен вопрос участия «Торпедо» в РПЛ в связи с задержанием руководителей клуба по делу о подкупе судей ФК «Торпедо» (Фото: ФК «Торпедо») Футбольный «Торпедо» распустят в случае исключения команды из Российской премьер-лиги в связи с делом о подкупе судей. Об адвокат владельца клуба Леонида Соболева сообщил «РИА Новости» «Футбольный клуб «Торпедо» будет распущен, если команду исключат из РПЛ», — сообщил Андрей Алешкин. В июне Соболев и директор клуба Валерий Скородумов были отправлены в СИЗО по делу об оказании противоправного влияния на результат матчей с участием клуба. rbc.group Судья отказался сдавать матч. Что важно знать об арестах в «Торпедо» Спорт rbc.group Во вторник, 8 июля, РБК со ссылкой на источники сообщил, что был задержан футбольный арбитр Богдан Головко по подозрению в совершении сознательной ошибки в пользу «Торпедо» в матче заключительного тура Первой лиги с «КАМАЗом». В четверг, 10 июля, на заседании контрольно-дисциплинарного комитета РФС будет рассмотрен вопрос участия «Торпедо» в РПЛ. «Торпедо» по итогам прошлого сезона заняло второе место в Первой лиге и вернулось в высший дивизион российского футбола.	10	\N	2025-07-09 14:45:02	2025-07-09 14:45:02
1385	5361	estoniya-prigrozila-zablokirovat-antirossiyskiy-paket-sankciy-es	Эстония пригрозила заблокировать антироссийский пакет санкций ЕС	https://s0.rbk.ru/v6_top_pics/media/img/9/97/347520584919979.jpeg	Маргус Цахкна (Фото: Omar Havana / Getty Images) Эстония может заблокировать принятие 18-го пакета санкций Евросоюза против России, если из него исключат введение более низкого потолка цен на российскую нефть до $45 за баррель. Об этом заявил министр иностранных дел Эстонии Маргус Цахкна телерадиокомпании ERR. «Мы совершенно четко придерживаемся мнения, что снижение потолка цен на нефть должно быть включено в этот пакет. У нас очень твердая позиция по этому вопросу», — заявил Маргус Цахкна. Снизить потолок цен на российскую сырую нефть с $60 до $45 за баррель предложила Еврокомиссия. Предполагалось, что мера войдет в 18-й пакет антироссийских санкций. Однако средиземноморские страны выступили против этого требования. rbc.group В ЕК назвали размер снижения потолка цен на российскую нефть Политика rbc.group Цахкна напомнил, что действующий потолок цен в $60 за баррель не снижался на протяжении двух лет из-за отсутствия поддержки со стороны западных стран. Но против снижения лимита выступили США. Как писало издание Politico, от этого решения в итоге отказался и Евросоюз из-за эскалации конфликта между Израилем и Ираном, на фоне которого резко выросли цены на нефть. Читайте РБК в Telegram.	8	\N	2025-07-09 14:55:04	2025-07-09 14:55:04
1386	5393	espch-obvinil-rossiyu-v-narushenii-prav-na-ukraine-i-krushenii-mh17	ЕСПЧ обвинил Россию в нарушении прав на Украине и крушении MH17	https://s0.rbk.ru/v6_top_pics/media/img/9/63/347520628729639.jpeg	Суд в Страсбурге впервые вынес подобные решения. В Кремле заявили, что Москва считает их ничтожными и не собирается исполнять. Россия в 2022 году вышла из-под юрисдикции ЕСПЧ Место крушения пассажирского самолета «Малайзийских авиалиний» Boeing 777 (Фото: Михаил Почуев / ТАСС) Европейский суд по правам человека признал Россию виновной по двум делам: о нарушении норм международного права на Украине с начала полномасштабных боев в 2022 году, а также о крушении малайзийского Boeing MH17 в Донбассе в 2014 году. Как сообщает AP, ЕСПЧ выносит подобные вердикты впервые. Дела против России инициировали Нидерланды и Украина. Решения во многом носят «символический характер» пишет AP, поскольку Москва в 2022 году вышла из-под юрисдикции ЕСПЧ. Это произошло вскоре после того как страна покинула Совет Европы, в котором состояла с 1996 года. Российские власти заявляли, что перестали исполнять решения суда в Страсбурге из-за их «откровенно политизированного характера». Пресс-секретарь президента Дмитрий Песков в разговоре с журналистами 9 июля подтвердил, что Россия не намерена исполнять решения суда: «Считаем их ничтожными. Это все, что можно сказать». rbc.group Нидерланды заявили, что совет ИКАО счел Россию виновной в крушении MH17 Политика rbc.group Boeing 777 «Малайзийских авиалиний», следовавший из Амстердама в Куала-Лумпур, разбился 17 июля 2014 года. Все 298 человек на борту погибли. Расследование продолжалось несколько лет. В ноябре 2022-го суд в Гааге пришел к выводу, что самолет был сбит из ЗРК «Бук» с поля под поселком Первомайский. Виновными признали трех человек, включая бывшего главу Минобороны ДНР Игоря Гиркина (Стрелкова, сейчас отбывает в России четырехлетний срок по делу об экстремизме) и заочно приговорили к пожизненному заключению. В мае Совет Международной организации гражданской авиации (ИКАО) также признал Россию ответственной за катастрофу. Кремль отказался принять это решение, напомнив, что Москва не участвовала в расследовании. Российская сторона вышла из спора в ИКАО летом 2024 года. Власти России настаивают на непричастности к катастрофе. В 2015 году свои выводы представил производитель «Буков» концерн «Алмаз-Антей», заявив, что лайнер сбили одной из старых модификаций ракет, не стоящих на вооружении российской армии, но используемых на Украине. Западные эксперты к российским версиям не прислушались, говорил президент Владимир Путин. Россия также обвиняла Украину в нарушении прав человека, соответствующий иск в ЕСПЧ был подан в 2021 году. В нем, среди прочего, тоже говорилось о катастрофе Boeing. В 2023 году суд в Страсбурге закрыл дело, заявив, что российская сторона после выхода из-под его юрисдикции перестала отвечать на запросы. Читайте РБК в Telegram.	9	\N	2025-07-09 15:15:03	2025-07-09 15:15:03
1388	5470	kreml-raskryl-otnoshenie-k-uzhestocheniyu-ritoriki-trampa-v-otnoshenii-putina	Кремль раскрыл отношение к ужесточению риторики Трампа в отношении Путина	https://s0.rbk.ru/v6_top_pics/media/img/0/76/347520540817760.jpeg	Россия спокойно относится к словам Трампа, намерена продолжать диалог с Вашингтоном и рассчитывает, что США не откажутся от усилий по урегулированию между Москвой и Киевом, сказал Песков Дональд Трамп (Фото: Nathan Howard / Reuters) В Кремле «достаточно спокойно» относятся к тому, что президент США Дональд Трамп стал жестче высказываться по отношению к Владимиру Путину, заявил журналистам пресс-секретарь российского президента Дмитрий Песков. «Скажем так, у Трампа в целом достаточно жесткая стилистика», — указал Песков. Он добавил, что Москва намерена продолжать диалог с Вашингтоном и «линию на починку изрядно поломанных двусторонних отношений», а также рассчитывает, что США продолжат усилия по урегулированию, несмотря на решение о возобновлении поставок оружия Киеву. Трамп накануне заявил, что недоволен действиями Путина и рассматривает возможность «устроить маленький сюрприз» России. Так он ответил на вопрос о готовности ввести санкции против Москвы из-за продолжающихся боев на Украине. Свое недовольство республиканец выражал и ранее, в частности после разговора с Путиным в начале июля, отметив, что «не добился никакого прогресса». rbc.group Трамп заявил о планах устроить России «маленький сюрприз» Политика rbc.group Пресс-секретарь президента России отметил заявления американского лидера о том, что урегулирование конфликта Москвы и Киева оказалось сложнее, чем Трамп думал с самого начала. Россия заявляла, что решить конфликт «в одну ночь» невозможно, напомнил Песков. Сейчас Россия ждет от Украины предложений по третьему раунду переговоров, сообщили в Кремле. Первые два прошли в Стамбуле 16 мая и 2 июня. На них стороны договорились об обменах военнопленными и телами погибших бойцов, а также представили друг другу свои версии меморандумов об урегулировании. Как заявил Песков, продолжение переговоров в интересах Украины, «потому что ситуация на земле меняется ежедневно». «Мы идем вперед. Каждый новый день украинской стороне придется соглашаться с новыми реалиями», — заявил он. Читайте РБК в Telegram.	8	\N	2025-07-09 16:05:00	2025-07-09 16:05:00
1389	5473	siloviki-prishli-s-obyskami-k-glave-mihaylovskogo-teatra-i-mhat-kehmanu	Силовики пришли с обысками к главе Михайловского театра и МХАТ Кехману	https://s0.rbk.ru/v6_top_pics/media/img/9/73/347520639298739.jpeg	Владимир Кехман (Фото: Сергей Бобылев / ТАСС) К главе Михайловского театра и МХАТ Владимиру Кехману пришли силовики в рамках дела о растрате, пишет «Фонтанка». Обыски проводит центральный аппарат СК, сообщают 78.ru и «Известия». По данным «Фонтанки», Кехман был доставлен в СК после встречи с ФСБ утром 9 июля в Подмосковье. 78.ru сообщает, что он был задержан еще накануне. rbc.group Кехман только что вернулся из-за границы, пишет «Фонтанка». Дело связано с контрактами на реконструкцию старой сцены МХАТ. rbc.group Источник «Известий» также рассказал, что обыски у Кехмана проходят по делу о присвоении и растрате при реконструкции сцены МХАТ. Оно возбуждено СК по материалам ФСБ. Собеседник уточнил, что глава Михайловского театра и МХАТ не задержан, его пригласили в СК в качестве свидетеля. По делу проходят несколько неустановленных лиц. РБК обратился за комментарием в пресс-службу СКР, к Владимиру Кехману, направил запрос в ЦОС ФСБ, в пресс-службу Михайловского театра, в МХАТ имени Горького. Кехман возглавил МХАТ в 2021 году, сменив Татьяну Доронину. Кроме того, он руководит Михайловским театром в Петербурге. Бывшему главбуху МХАТа им. Горького дали четыре года условно за кражу Общество Кехман стал генеральным директором МХАТ им. Горького в октябре 2021 года. Через несколько дней после назначения нового гендиректора художественный руководитель театра Эдуард Бояков сообщил об увольнении. По его словам, написать заявление предложил ему Кехман. Позднее глава театра заявил о «беспределе в управленческой структуре» МХАТа. По его словам, в нетворческом штате находилось большое количество людей, которые «вообще не нужны». Он увидел в этом «абсолютно ложную искусственную надстройку для разбазаривания государственных денег». Гендиректор МХАТа обвинил в «разорении» театра прежнюю команду с худруком Бояковым. В декабре того же года Кехман сообщил, что с мая 2022 года в здании МХАТа им. Горького начнется капитальный ремонт, а завершится он в октябре По его оценкам, капитальный ремонт обойдется в 5–6 млрд руб. Материал дополняется	4	\N	2025-07-09 16:05:01	2025-07-09 16:05:01
1390	5523	vo-francii-zvonok-makrona-putinu-obyasnili-principom-krasnogo-telefona	Во Франции звонок Макрона Путину объяснили принципом красного телефона	https://s0.rbk.ru/v6_top_pics/media/img/6/76/347520630746766.jpeg	Ядерные державы имеют «особые обязательства» по отношению друг к другу, заявил министр обороны Франции Себастьян Лекорню, комментируя звонок Макрона Путину. Он напомнил о принципе красного телефона из фильмов времен холодной войны Эмманюэль Макрон (Фото: Ludovic Marin / Reuters) Ядерные державы должны вести диалог по принципу красного телефона, который показывают «в фильмах времен холодной войны», заявил в интервью Valeurs французский министр обороны Себастьян Лекорню. Так он прокомментировал недавний разговор Владимира Путина и президента Франции Эмманюэля Макрона. «Я последние три года постоянно объяснял, что у ядерных держав есть особые обязательства по отношению друг к другу», — заявил Лекорню, отметив важность коммуникации между лидерами стран, обладающих ядерным оружием. Министр обороны Франции напомнил, что Макрон звонил Путину по вопросу атомной энергетики и Запорожской АЭС в сентябре 2022 года. Лекорню добавил, что, когда президент Франции попросил его позвонить Сергею Шойгу, бывшему министру обороны России, они вели диалог о ядерных проблемах и борьбе с терроризмом. rbc.group «Это принцип красного телефона, который мы видим в фильмах времен холодной войны: ядерные державы должны разговаривать друг с другом», — подчеркнул глава Министерства обороны Франции. rbc.group В последний раз Путин поговорил с Макроном 1 июля, этот разговор стал первым почти за три года. Во время разговора обсуждалась ситуация на Ближнем Востоке, в том числе конфронтация Ирана и Израиля, иранская ядерная программа. Песков объяснил цель беседы Путина с Макроном словами «давно не общались» Политика Разговор российского и французского президентов был важен для Франции, поскольку последняя, как и Россия, является гарантом Договора о нераспространении ядерного оружия, заявил тогда Макрон. «Я позвонил ему [Путину] прежде всего для того, чтобы обсудить иранский вопрос и необходимость сохранения Договора о нераспространении ядерного оружия. Он выразил готовность содействовать. Было очень важно заручиться этим согласием, поскольку Франция также несет ответственность за обеспечение стабильности», — отметил лидер Франции. Le Parisien узнала причину звонка Макрона Путину Политика Макрон был заинтересован в мнении и совете российского лидера Владимира Путина по ситуации в Иране и Договору о нераспространении ядерного оружия, заявила тогда на брифинге официальный представитель кабмина Франции Софи Прима. В конце июня Макрон во время телефонного разговора с президентом Ирана Масудом Пезешкианом призвал его придерживаться Договора о нераспространении ядерного оружия (ДНЯО) и сотрудничать с Международным агентством по атомной энергии (МАГАТЭ). 13 июня Израиль начал операцию против ядерных объектов Ирана, Тегеран отреагировал ответной операцией. После того как на протяжении девяти дней стороны обменивались ударами, в конфликт вмешались США. Они также нанесли удары по объектам иранской ядерной программы в Фордо, Натанзе и Исфахане. В ответ Иран 23 июня атаковал крупнейший американский военный объект на Ближнем Востоке — авиабазу Аль-Удейд в Катаре. 24 июня американский президент Дональд Трамп сообщил о прекращении огня между Израилем и Ираном. Москва выступает против распространения ядерного оружия, в том числе появления его у Ирана. При этом, по мнению российского президента, Иран имеет право на использование ядерных технологий в мирных целях.	2	\N	2025-07-09 16:35:00	2025-07-09 16:35:00
1391	5534	cnn-soobshchil-chto-tramp-ne-sklonen-otdavat-pobedu-na-ukraine-rossii	CNN сообщил, что Трамп «не склонен» отдавать победу на Украине России	https://s0.rbk.ru/v6_top_pics/media/img/0/44/347520674625440.jpeg	Дональд Трамп (Фото: Andrew Harnik / Getty Images) Американский президент Дональд Трамп в данный момент «менее склонен отдавать победу» на Украине России, сообщили два знакомых с ситуацией источника телеканала CNN. Об этом они сказали в контексте приостановки военной помощи Украине. Трамп накануне заявил, что недоволен действиями Путина и рассматривает возможность «устроить маленький сюрприз» России. Так он ответил на вопрос о готовности ввести санкции против Москвы из-за продолжающихся боев на Украине. В Кремле заявили, что «достаточно спокойно» относятся к тому, что президент США Путину, отметив его «достаточно жесткую стилистику» в целом. Собеседники CNN также рассказали, что глава Пентагона Пит Хегсет не сообщал администрации Трампа о своем решении приостановить поставки вооружений Украине. По информации источников, Трамп попросил министра обороны только оценить запасы оружия США, но не останавливать поставки Киеву. Решение главы Пентагона источники связали с тем, что у Хегсета нет начальника штаба или доверенных советников для координации важных политических решений с межведомственными партнерами. Материал дополняется	8	\N	2025-07-09 16:45:02	2025-07-09 16:45:02
1392	5596	ssha-vozobnovili-postavki-chasti-oruzhiya-ukraine	США возобновили поставки части оружия Украине		США возобновили поставки Украине артиллерийских боеприпасов и реактивных снарядов GMRLS, сообщают AP и Reuters. Это произошло спустя более недели после паузы в поставках. Трамп говорил, что не отдавал такого приказа Администрация президента США Дональда Трампа возобновила отправку некоторых видов оружия Украине, сообщили два американских чиновника The Associated Press. По их данным, в число поставляемых вооружений входят боеприпасы калибром 155 мм и высокоточные управляемые ракеты GMLRS. Как отмечает AP, неясно, когда именно возобновились поставки. О том, что Вашингтон возобновил поставки и отправляет Киеву артиллерийские снаряды калибром 155-мм и ракеты для реактивных установок MLRS, также пишет Reuters. Два американских чиновника не уточнили агентству, сколько именно оружия было отправлено и завершена ли поставка. rbc.group Трамп ответил на вопрос о приказе приостановить поставки оружия Украине Политика rbc.group О приостановке США поставок части вооружений, включая ракеты для комплексов Patriot, Politico и NBC News сообщили 1 июля. Белый дом объяснил остановку поставок «стандартной проверкой» Пентагоном всей военной помощи, которую США оказывают всем странам и регионам. Киев утверждал, что официально не получал каких-либо уведомлений по поводу приостановки поставок оружия. Трамп заявил, что не отдавал такого приказа, и распорядился возобновить поставки. По данным CNN, президент США поручил шефу Пентагона Питу Хегсету оценить запасы оружия США, а тот не уведомил Белый дом о решении приостановить поставки вооружений Украине. Associated Press писало, что решение застало Трампа врасплох и он недоволен уровнем координации между Пентагоном и Белым домом.  Москва осуждает военную помощь Киеву. Читайте РБК в Telegram.	8	\N	2025-07-10 08:05:02	2025-07-10 08:05:02
1393	5593	politico-uznalo-trebovanie-trampa-k-zakonu-o-sankciyah-protiv-rossii	Politico узнало требование Трампа к закону о санкциях против России	https://s0.rbk.ru/v6_top_pics/media/img/3/57/347520931367573.jpeg	Белый дом требует от конгресса больше полномочий для Трампа по возможному ужесточению санкций против России, чтобы президент мог отменить ограничения, выяснило Politico. Сенаторы надеются одобрить инициативу до каникул в августе Фото: Ken Cedeno / Reuters Белый дом «концептуально открыт» к одобрению законопроекта об ужесточении санкций США против России, но документ должен дать президенту исключительный контроль над этими мерами и право отменить ограничения, пишет Politico со ссылкой на высокопоставленный источник в администрации. «В нынешней версии решения президента по внешней политике будут подвергаться микроменеджменту со стороны конгресса <...> Это для нас неприемлемо», — пояснил собеседник издания, знакомый с точкой зрения президента США. Пока конгрессменам и Белому дому не удалось достичь компромисса о разделении полномочий в части снятия санкций, говорят источники Politico. «Мы все еще работаем с ними», — подтвердил лидер республиканского большинства в сенате Джон Тьюн. rbc.group Другой источник из Республиканской партии рассказал, что Трамп «создал себе репутацию человека, способного договариваться о чем угодно и где угодно, а [президент России Владимир] Путин выставил его в глупом свете». rbc.group Париж пообещал «самые жесткие санкции» ЕС против России Политика Будущее законопроекта об ужесточении санкций США против России будет определено на этой неделе, заявил Тьюн в беседе с PunchbowlNews. Сенатор рассказал о желании принять законопроект, который станет «очень сильным сигналом», поскольку «европейцы также ждут лидерства» от Соединенных Штатов. Он планирует согласовать движение документа с палатой представителей и Белым домом. Тьюн выразил надежду, что закон будет принят сенатом до августовских каникул. «С потоком оружия, принятием этого законопроекта и введением европейцами санкций, я думаю, что это лучший шанс усадить Путина за стол переговоров. Я уверен, президент [Трамп] готов к нашим действиям», — сказал автор законопроекта, сенатор Линдси Грэм. CNN опубликовал аудиозапись с угрозой Трампа «разбомбить Москву к чертям» Политика Трамп накануне заявил, что недоволен действиями Путина и рассматривает возможность «устроить маленький сюрприз» России. Так он ответил на вопрос о готовности ввести санкции против Москвы из-за продолжающегося конфликта России и Украины. В Кремле «достаточно спокойно» относятся к тому, что Трамп стал жестче высказываться по отношению к Путину, заявил журналистам пресс-секретарь российского президента Дмитрий Песков. «Скажем так, у Трампа в целом достаточно жесткая стилистика», — добавил он. Российские власти называют западные санкции неэффективными и нелегитимными, требуя отменить ограничения. Читайте РБК в Telegram.	8	\N	2025-07-10 08:05:02	2025-07-10 08:05:02
1394	5594	franciya-po-zaprosu-ssha-zaderzhala-rossiyskogo-basketbolista	Франция по запросу США задержала российского баскетболиста	https://s0.rbk.ru/v6_top_pics/media/img/2/92/347520978510922.jpeg	Франция 23 июня задержала российского баскетболиста Даниила Касаткина по запросу США, где его подозревают в причастности к хакерской сети. 8 июля ему продлили ареста. Спортсмен отвергает обвинения и жалуется на потерю веса Даниил Касаткин (Фото: pbc_mba / Telegram) Российского баскетболиста Даниила Касаткина задержали во Франции по запросу США, сообщает AFP. По данным агентства, спортсмен был задержан 23 июня в парижском аэропорту Руасси — Шарль-де-Голль, куда он прибыл с невестой. На слушаниях в Париже 8 июля ему продлили арест. США подозревают Касаткина в причастности к хакерской группировке, действовавшей с помощью программ-вымогателей в 2020-2022 годах, пишет AFP. Вашингтон считает, что баскетболист вел переговоры о выкупе. Сам спортсмен отрицает обвинения. Ему грозит экстрадиция. rbc.group Адвокат Касаткина Фредерик Бело заявил журналистам, что его подзащитный — «ноль в информатике и даже не может установить приложение». По словам защитника, спортсмен купил подержанный компьютер. «Он ничего не трогал в компьютере: компьютер был либо взломан, либо хакер продал его ему, чтобы действовать под прикрытием другого человека», — сказал Бело. rbc.group Он ходатайствовал об освобождении своего подзащитного под залог, отмечая, что нахождение под арестом негативно влияет на его физическое состояние и может поставить под угрозу его дальнейшую спортивную карьеру. По словам самого баскетболиста, за время содержания под стражей его вес снизился с 95 до 89 кг, и он не чувствует себя в безопасности в камере. Призер чемпионата мира покинул баскетбольный ЦСКА Спорт Даниилу Касаткину 26 лет. Он — воспитанник спортивной школы олимпийского резерва ЦСКА, неоднократно становился победителем Первенств России в составе команды СШОР или сборных Москвы. В 2015 году был признан самым ценным игроком Первенства России среди юниоров 1999 года рождения. В Первенстве Детско-юношеской баскетбольной лиги (ДЮБЛ) в сезонах 2014/2015 и 2015/2016 играл за динамовские команды. В 2016 году отправился учиться в школу в США, а в 2018-м поступил в Государственный университет Пенсильвании, за команду которого отыграл несколько матчей в Национальной ассоциации студенческого спорта (NCAA). В 2019 году он вернулся в России и играл в Суперлиге 1 за «Химки — Подмосковье». В 2021 году перешел в команду МБА-МАИ, выступающую в Единой лиге ВТБ. Вместе с МБА Касаткин дважды становился бронзовым призером Кубка России (в сезонах 2022/2023 и 2024/2025), принял участие в 172 матчах команды и преодолел планку 1,5 тыс. очков за клуб. 3 июля МБА-МАИ объявил об уходе Касаткина из команды.	3	\N	2025-07-10 08:05:02	2025-07-10 08:05:02
1395	5595	putin-uvolil-odnogo-iz-zamestiteley-lavrova	Путин уволил одного из заместителей Лаврова	https://s0.rbk.ru/v6_top_pics/media/img/8/96/347520845593968.jpeg	Сам Михаил Богданов, освобожденный от должностей спецпредставителя Путина по Ближнему Востоку и странам Африки и замглавы МИДа, заявил: «Уже пора. Возраст, пенсия» Михаил Богданов (Фото: МИД России) Президент Владимир Путин освободил Михаила Богданова от должности своего специального представителя по Ближнему Востоку и странам Африки, следует из указа. Он также уволен с поста замглавы МИДа, следует из другого указа. Дипломат занимал пост спецпредставителя президента с октября 2014 года, а замминистра иностранных дел — с июня 2011-го. Богданов, комментируя «Известиям» свое увольнение, заявил: «Уже пора. Возраст, пенсия». ТАСС со ссылкой на источник сообщает, что он написал заявление по собственному желанию «в силу возраста». rbc.group В январе этого года Путин продлил замглавы МИДа срок государственной службы до 2 марта 2026 года. Богданову в марте исполнилось 73 года. rbc.group РБК направил запрос в департамент информации и печати МИД России. В МИДе заявили, что Москва обсуждает с Дамаском судьбу российских баз Политика Предельный возраст пребывания на госслужбе — 65 лет. Для некоторых категорий госслужащих (в частности руководителей) он может быть продлен до 70 лет. Соответствующее решение с согласия самого госслужащего может принять госорган или должностное лицо, назначившее того на должность. Эта норма не распространяется на тех госслужащих, кого назначает президент России. Михаил Богданов родился 2 марта 1952 года в Москве. В 1974-м окончил Московский государственный институт международных отношений МИД СССР, с тех пор пребывал на дипломатической службе и занимал различные должности в МИДе и посольствах. В частности, был послом России в Израиле (1997–2002), послом в Египте и полномочным представителем России при Лиге арабских государств (2005–2011). На посту заместителя Сергея Лаврова курировал, в частности, отношения России со странами Ближнего Востока и Африки, проблематику сирийского урегулирования и т.д. В феврале прошлого года Путин объявил благодарность Богданову. Он также награжден орденами «За заслуги перед Отечеством» III и IV степени, Александра Невского, Почета, Дружбы и др. Читайте РБК в Telegram.	4	\N	2025-07-10 08:05:03	2025-07-10 08:05:03
1396	5582	gossekretar-ssha-rubio-vstretitsya-s-lavrovym	Госсекретарь США Рубио встретится с Лавровым		Рубио встретится с Лавровым на полях мероприятий по линии АСЕАН в Малайзии. В расписании госсекретаря США встреча назначена на 13:00 мск. В МИД России подтвердили, что «встреча прорабатывается» Госсекретарь США Марко Рубио собирается встретиться с российским министром иностранных дел Сергеем Лавровым 10 июля на полях мероприятий по линии АСЕАН в Малайзии, сообщают Reuters и AFP со ссылкой на высокопоставленного представителя Госдепартамента. Официальный представить МИД России Мария Захарова подтвердила РБК эти данные. «Такая встреча прорабатывается», — рассказала она. Согласно расписанию Рубио на сайте Госдепа, его встреча с Лавровым 10 июля запланирована на 18:00 по местному времени (13:00 мск). rbc.group Лавров прилетел в Малайзию для участия в мероприятиях по линии АСЕАН Политика rbc.group До этого Рубио и Лавров несколько раз разговаривали по телефону. Их личная встреча впервые состоялась на переговорах России и США в Эр-Рияде в феврале. Замглавы российского МИДа Сергей Рябков в июне рассказывал, что Лавров и Рубио находятся в постоянном контакте. 4 июля российский министр отправил американскому коллеге телеграмму с поздравлением с Днем независимости США. Он выразил надежду, что отношения между странами «обретут стабильность и предсказуемость», но подчеркнул необходимость учитывать «реалии на земле». Читайте РБК в Telegram.	8	\N	2025-07-10 08:05:03	2025-07-10 08:05:03
1397	5584	u-glavy-mhat-i-mihaylovskogo-teatra-kehmana-obnaruzhili-dolgi-v-17-8-mlrd	У главы МХАТ и Михайловского театра Кехмана обнаружили долги в ₽17,8 млрд		В банке исполнительных производств, в отношении Кехмана открыто восемь дел о задолженностях Директор МХАТ имени М. Горького и художественный руководитель Михайловского театра Владимир Кехман, у которого 9 июля прошли обыски по делу о растрате при реконструкции старой сцены театра, имеет долг по кредитам на сумму 17,8 млрд руб. Об этом сообщают ТАСС и «РИА Новости». «Кехман имеет задолженность по кредитным платежам. Общая сумма превышает 17,8 млрд руб.», — сказал собеседник агентства. В банке исполнительных производств, в отношении Кехмана открыто восемь таких производств: шесть связаны с долгами по кредитам, кроме ипотеки, два — с задолженностью по исполнительному делу. rbc.group Силовики пришли в МХАТ после обысков у Кехмана. Видео Общество rbc.group Накануне, 9 июля сотрудники правоохранительных органов провели обыски у Кехмана. По данным ТАСС, обыски провели также в МХАТ, были изъяты документы и электронные носители, все доставлено в Главной следственное управление Следственного комитета. Было возбуждено дело по ч. 4 ст. 160 Уголовного кодекса России — присвоение или растрата, совершенные организованной группой либо в особо крупном размере. Максимальное наказание по статье — лишение свободы на срок до десяти лет. Кехмана доставили на допрос, его статус определят позже, следственные действия продолжаются, уточнял ТАСС. По информации «Известий», его пригласили в СК в качестве свидетеля, по делу проходят несколько неустановленных лиц. Кехман только что вернулся из-за границы, пишет «Фонтанка». Дело связано с контрактами на реконструкцию старой сцены МХАТа. Читайте РБК в Telegram.	6	\N	2025-07-10 08:05:03	2025-07-10 08:05:03
1398	5586	duda-prigrozil-zakryt-klyuchevoy-hab-po-postavkam-voennoy-pomoshchi-ukraine	Дуда пригрозил закрыть ключевой хаб по поставкам военной помощи Украине		Дуда отметил, что Украина и союзники по НАТО считают своим аэропорт в Жешуве, через который Киеву поставляется более 80% помощи, и пригрозил закрыть его, «если кому-то что-то не нравится». Москва осуждает военную помощь Киеву Польша может закрыть аэропорт Жешува, через который проходит бóльшая часть военной помощи Украине, если Киев и его западные союзники продолжат считать его «своей собственностью», заявил польский президент Анджей Дуда в интервью журналистам изданий Otwarta Konserwa, Klub Jagielloński i Nowy Ład. Дуда обратил внимание, что Польшу «не приглашали в очень важные международные органы, в которых было принято решение о доставке помощи Украине через нашу территорию». Он назвал такую ситуацию «скандалом», отметив, что это следует обсуждать не с Киевом, а с союзниками по НАТО. «Нужно иметь мужество, чтобы разговаривать с немцами, с американцами», — добавил польский президент. «Я думаю, что и украинцы, и наши союзники просто думают, что аэропорт в Жешуве и наши автомагистрали принадлежат им, извините, как будто это их. Ну, это не их, это наше. Если кому-то что-то не нравится, мы закрываем это и до свидания, да, делаем ремонт. Мы закрываем аэропорт в Жешуве и доставляйте [военную помощь] Украине морем, воздухом, не знаю, сбрасывайте на парашютах, разбирайтесь. Разберитесь, если вы считаете, что мы вам не нужны», — заявил Дуда (цитата по Onet). rbc.group Логистический хаб в аэропорту Жешув-Ясенка играет ключевую роль в поставках западного оружия и военной помощи Украине. Этот хаб расположен всего в 80 км от украинской границы и служит основным транзитным пунктом для американской и союзной военной помощи Киеву, включая оружие, боеприпасы и технику. Через Жешув-Ясенку проходит более 80–90% всей военной помощи Украине, поставляемой странами НАТО и партнерами. Это делает его стратегически важным центром поддержки украинских вооруженных сил. rbc.group Главный хаб по поставкам оружия Украине будут охранять норвежские F-35 Политика До этого Дуда подчеркивал, что Польша «во многом спасла» Украину, поскольку первой поставила ей тяжелую технику в начале боевых действий.  В августе на смену Дуде придет избранный в июне президентом историк Кароль Навроцкий. Он выступает против членства Украины в ЕС и НАТО. В России Навроцкий объявлен в розыск в связи с причастностью к сносу памятников Красной армии на территории Польши. ABC News после первого случая, когда США приостановили поставки вооружений Украине в начале марта, сообщал, что для логистического центра военной помощи Украине в Жешуве это может стать угрозой. По данным телеканала, оттуда было выведено несколько американских подразделений военного снабжения. Москва осуждает военную помощь Киеву. Читайте РБК в Telegram.	2	\N	2025-07-10 08:05:04	2025-07-10 08:05:04
1407	5782	pokupateli-zamorozhennyh-akciy-ssha-pozhalovalis-na-lishnie-nalogi-v-rossii	Покупатели замороженных акций США пожаловались на лишние налоги в России		После запуска внебиржевых торгов иностранными акциями инвесторы начали жаловаться на начисление налога на матвыгоду, который превышает стоимость актива. Ассоциация инвесторов попросила ЦБ и Минфин разобраться в вопросе Индекс МосБиржи IMOEX +0,68% Фото: Shutterstock Инвесторы, которые приобрели иностранные ценные бумаги на внебиржевых торгах, столкнулись с проблемой начисления налога на материальную выгоду, который иногда может превышать стоимость самого актива. Ассоциация розничных инвесторов (АРИ) направила обращение в Банк России и Минфин с целью устранения казуса при расчете налога на матвыгоду по иностранным ценным бумагам  . В письме от 30 июня 2025 года на имя первого заместителя председателя Банка России Владимира Чистюхина, cтатс-секретаря — заместителя министра финансов Алексея Сазанова и заместителя министра финансов Ивана Чебескова (есть у «РБК Инвестиций») указано, что в АРИ поступают жалобы от инвесторов, которые считают начисление налога при покупке бумаг на Мосбирже необоснованным. В Минфине «РБК Инвестициям» подтвердили получение обращения и рекомендовали обратиться с этим вопросом в Банк России, поскольку он относится к компетенции регулятора. «РБК Инвестиции  » также направили запросы в пресс-службы Банка России и Московской биржи. rbc.group Налог на материальную выгоду возникает после покупки актива по цене ниже рыночной либо при его безвозмездном получении. В классической ситуации, если инвестор покупает акцию по одной цене, а продает дороже, то он обязан уплатить налог с разницы. Применительно к внебиржевому рынку проблема состоит в том, что сейчас в налоговом законодательстве ценой покупки считается не та, которая была сформирована в биржевом стакане биржи или брокера, а цена базового актива на иностранной бирже, например цена акции Apple на бирже NASDAQ, отмечает председатель правления ассоциации розничных инвесторов (АРИ) Илья Херсонцев. Почему инвесторы платят повышенный налог После того как весной 2022 года европейские депозитарии Euroclear и Clearstream перестали работать с Национальным расчетным депозитарием (НРД), биржевые сделки с иностранными ценными бумагами стали недоступны. Вместо этого ряд брокеров («Т-Инвестиции», «Финам»), а затем и Мосбиржа организовали внебиржевые торги заблокированными активами внутри российского контура. Купить и продать заблокированные активы могут только квалифицированные инвесторы, а неквалифицированным доступны только продажи. Мосбиржа запустила внебиржевые торги заблокированными акциями из США Обмен заблокированными активами , НРД , Санкции , Мосбиржа При этом бумаги в российском контуре сейчас продаются с большим дисконтом к ценам на мировых площадках. «Например, вы можете сегодня купить акцию Apple на внебиржевом рынке Московской биржи за ₽6,8 тыс., в то время как на американской бирже NASDAQ ее стоимость составляет ₽16,4 тыс. в пересчете на рубли. Дополнительно брокер посчитает налог на материальную выгоду с разницы между ₽16,4 тыс. и ₽6,8 тыс. То есть вам придется доплатить государству еще примерно ₽1,2 тыс. в виде налога на материальную прибыль независимо от того, за какую цену вы потом продадите этот актив и даже если вы продадите его в убыток», — объясняет сложившуюся проблему Херсонцев. Рыночная цена, с которой впоследствии и высчитывается налог на матвыгоду, определяется приказом ФСФР России от 09.11.2010 № 10-65/пз-н. Согласно документу, для определения рыночной (расчетной) цены ценной бумаги могут использоваться цены российских организаторов торгов, котировки на покупку, объявленные брокерами, а также цены с иностранных фондовых бирж (для обращающихся на организованном рынке ценных бумаг). По словам Херсонцева, инвесторы столкнулись с «юридическим парадоксом», поскольку концепция рыночной цены предполагает ее доступность участникам рынка при обычных усилиях, а торги на иностранных площадках недоступны российским инвесторам. «Зарубежную цену актива нельзя учитывать как рыночную для России. Если ничего не изменить, каждый следующий покупатель этой же бумаги будет платить такой же налог, и в итоге государство получит с одного актива налогов больше, чем он стоит», — считает председатель правления АРИ. Более того, брокер взимает налог на материальную выгоду не сразу, а при выводе средств со счета или по итогам года. «Гипотетически возможна ситуация, когда инвестор будет должен государству налогов больше, чем вложил в такие ценные бумаги, если будет неоднократно их приобретать и продавать», — допускает Херсонцев. Руководитель направления нормотворчества и регуляторных инициатив Ассоциации владельцев облигаций (АВО) Алексей Пономарев соглашается, что проблема начисления матвыгоды на реализацию заблокированных иностранных бумаг есть. По словам эксперта, при покупке некоторых бумаг, из-за того что цена на иностранных биржах в восемь-девять раз выше, налог на матвыгоду превысит цену покупки. «То есть, просто купив бумагу и даже еще не получив дохода от продажи, инвестор сразу же попадает на налог в сумме более 100% от стоимости покупки», — отмечает Пономарев. Что предлагается сделать В обращении ассоциация просит Минфин и ЦБ рассмотреть возможность внесения изменений в нормативные правовые акты, которые исключили бы возможность определения рыночной (расчетной) цены заблокированных бумаг, исходя из цен на иностранных фондовых биржах. Вместо этого рыночная цена заблокированных бумаг может уже сейчас определяться российским организатором торгов в соответствии с положениями приказа ФСФР в отдельных режимах торгов организатора торгов, в том числе в режиме ОТС Т+ — безадресные торги Московской биржи. Однако для этого необходимы соответствующие разъяснения от Банка России и Минфина России, считают в АРИ. «На наш взгляд, это повысит ликвидность  на торгах и сделает цену заблокированных активов более высокой, что является также хорошей мерой по защите прав тысяч инвесторов и станет важным шагом для укрепления доверия к государству в текущих непростых условиях», — подчеркивает председатель правления АРИ. Что думают налоговые юристы и представители профильных ассоциаций Принятие предложения АРИ позволит опираться на реально рыночную цену, сформированную российской инфраструктурой, и устранить искажения при расчете налоговой базы таких бумаг, считает советник практики банковского и финансового права, рынков капитала адвокатского бюро ЕПАМ Максим Барышев. «Это позволит не облагать налогом нереальную «бумажную» прибыль, которой у инвестора нет», — добавляет он. Пономарев из АВО также считает, что предлагаемый ассоциацией инвесторов подход может решить сложившуюся проблему. В то же время он допускает риск перетока средств инвесторов в иностранные инструменты, что прямо противоречит целям повышения капитализации  российского фондового рынка. Генеральный директор консалтинговой компании «ТаксМейт» Валерия Назаренко, напротив, считает, что предложение не окажет существенного влияния на ситуацию. «Возможно, для отдельных инвесторов это решит проблему, но глобально вряд ли. Это еще больше усложнит расчет налоговой базы и создаст дополнительный объем работы для налоговых консультантов в части подготовки деклараций и корректировки некорректно рассчитанных сумм налога», — считает юрист. По ее словам, проблема заключается не в самом наличии матвыгоды, а в том, что инвестор недостаточно проинформирован обо всех налоговых последствиях, покупая иностранные ценные бумаги. «Важно учитывать налоговые последствия, так как налог на доход от материальной выгоды может существенно повлиять на доходность такого инструмента. Тогда весь смысл инвестирования в эти бумаги теряется», — объясняет эксперт. Внебиржевые торги акциями США: стоит ли продавать сейчас или подождать Акции , США , Мосбиржа Эксперт считает, что лучше рассмотреть введение налоговых льгот для матвыгоды. Как показывает практика, льготы хорошо влияют на инвесторов при выборе того или иного продукта, замечает она. Другим вариантом могло бы стать внесение материальной выгоды в налоговую базу по ценным бумагам, чтобы ее можно было сальдировать с убытками от других ценных бумаг, добавляет Назаренко. Барышев из адвокатского бюро ЕПАМ считает целесообразным также создать понятный и прозрачный механизм для фиксирования котировок по таким заблокированным ИЦБ, понятным брокерам, инвесторам и ФНС России, а также сформировать и опубликовать список заблокированных ИЦБ, по которым будут признаваться котировки внутри России аналогично инициативе АРИ по льготе долгосрочного владения (ЛДВ). Список должен совместно вестись ЦБ и Минфином России, синхронизироваться с ФНС России и брокерами и обновляться на регулярной основе. Термин, обозначающий вероятность быстрой продажи активов по рыночной или близкой к рыночной цене. Подробнее Стоимость компании на рынке, рассчитанная из количества акций компании, умноженного на их текущую цену. Капитализация фондового рынка – суммарная стоимость ценных бумаг, обращающихся на этом рынке. Финансовый инструмент, используемый для привлечения капитала. Основные типы ценных бумаг: акции (предоставляет владельцу право собственности), облигации (долговая ценная бумага) и их производные. Подробнее Инвестиции — это вложение денежных средств для получения дохода или сохранения капитала. Различают финансовые инвестиции (покупка ценных бумаг) и реальные (инвестиции в промышленность, строительство и так далее). В широком смысле инвестиции делятся на множество подвидов: частные или государственные, спекулятивные или венчурные и прочие. Подробнее	1	2025-07-10 10:18:07	2025-07-10 10:05:03	2025-07-10 10:18:07
1399	5590	rossiyane-ocenili-skolko-smogut-prozhit-bez-zarplaty	Россияне оценили, сколько смогут прожить без зарплаты	https://s0.rbk.ru/v6_top_pics/media/img/4/63/347520684460634.jpeg	24% имеющих накопления россиян смогут продержаться без зарплаты на накоплениях от 1 до 2 месяцев. Больше года прожить смогут 6%. У 38% россиян накоплений нет вообще Фото: Михаил Гребенщиков / РБК Накоплений россиян хватит в среднем на 4 месяца жизни без зарплаты. При этом почти 40% населения не имеет никаких сбережений, следует из результатов исследования сервиса по поиску работы SuperJob (есть у РБК). Опрос был проведен с 30 июня по 8 июля 2025 года среди 1600 экономически активных граждан старше 18 лет. Согласно данным опроса, 38% россиян не имеют никаких сбережений. rbc.group Среди тех, кто все же смог сформировать «подушку безопасности»: 13% смогут прожить без зарплаты меньше месяца; 24% — от одного до двух месяцев; 12% — от трех до шести месяцев; 7% — от полугода до года; и лишь 6% — более года. rbc.group Исследование также показало, что 78% граждан следят за своими финансами, а 80% планируют свои доходы и расходы. Почти половина опрошенных рассчитывают свои финансы на полгода вперед. «В целом за последнее время россияне стали внимательнее относиться к своим финансам — по сравнению с аналогичным исследованием 2023 года увеличилось число тех, кто ведет финансовый учет (+12 процентных пунктов) и планирует свой бюджет (+10 процентных пунктов)», — отметили исследователи. Россияне рассказали, на сколько хватит их финансовой подушки безопасности Финансы Чаще за финансами следят мужчины, чем женщины. Они планируют траты на более длительный срок и высоко оценивают свою финансовую грамотность. В прошлом году 15% россиян среди тех, у кого были накопления, говорили, что их хватит на срок от трех до шести месяцев, а 12% — на полгода и больше, 27% — для жизни в течение трех и более месяцев, говорилось в совместном исследовании аналитического центра НАФИ и страховой компании «Росгосстрах Жизнь» (есть у РБК). Читайте РБК в Telegram.	3	\N	2025-07-10 08:05:04	2025-07-10 08:05:04
1400	5588	kinoprokatchiki-soobshchili-o-massovom-perenose-premer-zarubezhnyh-filmov	Кинопрокатчики сообщили о массовом переносе премьер зарубежных фильмов	https://s0.rbk.ru/v6_top_pics/media/img/4/51/347520734194514.jpeg	Премьеры иностранных лент, которые должны были выйти в России этим летом, массово откладываются из-за проблем с выдачей прокатных удостоверений. Источники РБК пояснили, что это связано с грядущими изменениями законодательства Фото: Сергей Булкин / NEWS.ru / РБК Российские прокатчики иностранных фильмов стали массово сообщать о переносе запланированных премьер на три-четыре недели, сообщили РБК два источника в киносетях и два — в компаниях-дистрибьюторах. О случаях подобных переносов в последние несколько дней также писал отраслевой телеграм-канал Cinemaplex. По словам источников, переносы затронули больше десятка релизов, которые должны были выйти на большой экран в июле и августе. Например, кинопрокатная компания «Вольга» одновременно с мировой премьерой 24 июля должна была представить германо-британский мультфильм «Пушистый форсаж: Гран-при». Но 9 июля она уведомила сети о переносе премьеры на 14 августа. Еще один мультфильм того же прокатчика «Зверопоезд» выйдет не 14 августа, как было запланировано, а 11 сентября. Компания World Pictures более чем на месяц перенесла «Пункт назначения: высотка 613». Global Film на две недели сдвинул старт комедийного боевика «Взвести курки», а «Кинологистика» — хоррора «Улыбка. Новый кошмар». По сообщениям Cinemaplex, переносы связаны с задержками в выдаче прокатных удостоверений Минкультуры, без которых выпуск фильма невозможен. РБК направил запрос в пресс-службу министерства. rbc.group Как открываются и закрываются кинотеатры в России. Инфографика Технологии и медиа rbc.group Глава «Кинологистики» Анатолий Сергеев пояснил РБК, что формально правила выдачи прокатных удостоверений не менялись десятки лет, но «внезапно изменился подход к их соблюдению». Дело в том, что процедура подразумевает получение штампа Госфильмофонда, куда сдается фильм для подтверждения технических характеристик. Поскольку эта процедура занимает до 25 рабочих дней, а кинопрокатчики «в 90% случаев все делают в режиме тотального цейтнота», руководство Минкультуры «шло навстречу и позволяло подать фильм и документы, не дожидаясь штампа Госфильмофонда», — говорит глава «Кинологистики». «Минкультуры закрывало на это требование глаза, но сейчас почему-то все изменилось, — объясняет Сергеев. — Причем это касается только прокатчиков, распространяющих иностранные фильмы. С российскими пока такой проблемы нет». Еще один источник в крупной киносети утверждает, что проблема касается «не столько иностранных, сколько мелких релизов» и связана в первую очередь с тем, что из-за обсуждаемого в Госдуме законопроекта, по которому прокатные удостоверения нужно будет получать в том числе для контента в онлайн-кинотеатрах, многие стриминги уже массово начали подавать заявления в Минкультуры. «В результате там просто перегруз, — утверждает он. — Крупным прокатчикам удается договориться о проверке вне очереди, а мелких откладывают». Что проблема вызвана именно «коллапсом» из-за обсуждаемого законопроекта о прокатных удостоверениях на контент интернет-сервисов, сказал источник еще в одной крупной киносети. «Это не затронуло российские фильмы, так как они сами по себе в приоритете, а вот интересы иностранных лент лоббировать некому», — пояснил собеседник. Министерства поспорили из-за прокатных удостоверений в онлайн-кинотеатрах Технологии и медиа Проект изменений в законы «Об информации» и «О государственной поддержке кинематографа», предлагающий запретить выдачу прокатных удостоверений фильмам, если в них идет речь об отрицании или дискредитации «российских духовных ценностей», был принят Госдумой в первом чтении 24 июня 2025 года. Ключевой составляющей документа стало закрепление в нормативной базе обязанности площадок, включенных в реестр аудиовизуальных сервисов (АВС, в основном это онлайн-кинотеатры), получать прокатные удостоверения на все единицы контента, доступные в их библиотеках. Онлайн-кинотеатры уже предупредили, что принятие этих поправок приведет отрасль к коллапсу, так как библиотеки сервисов насчитывают десятки тысяч единиц контента, большая часть которых не имеет прокатных удостоверений. В «Кинопоиске» заявили, что «исходя из того числа прокатных удостоверений, которое Минкультуры оформляет ежегодно, оформление разрешений на такой объем контента займет у регуляторов несколько лет». Медиа-коммуникационный союз, объединяющий «Ростелеком», «Триколор», «Газпром-Медиа», онлайн-кинотеатр «Иви» и других крупных участников медиарынка, просил депутатов доработать законопроект ко второму чтению и убрать из финальной версии необходимость получать прокатные удостоверения на контент, обнародованный до вступления новых норм в силу. Депутаты Сергей Боярский и Антон Горелкин заявили о готовности к диалогу с отраслью, чтобы «выработать оптимальный баланс». Но источник РБК, знакомый с ходом обсуждений законопроекта, отмечал, что, скорее всего, необходимость получать прокатные удостоверения на весь контент стримингов сохранится. Читайте РБК в Telegram.	3	\N	2025-07-10 08:05:04	2025-07-10 08:05:04
1401	5591	v-kieve-progremeli-vzryvy	В Киеве прогремели взрывы		В Киеве работают силы ПВО, сообщают власти, призвав жителей оставаться в укрытиях. В городе и Киевской области действует воздушная тревога В Киеве работают силы противовоздушной обороны, объявил мэр украинской столицы Виталий Кличко в телеграм-канале. В городе и Киевской области действует воздушная тревога. Незадолго до полуночи Киевская областная военная администрация также сообщала о работе сил ПВО.  Кличко призвал жителей не покидать укрытия. Около 2:00 мск он и глава военной администрации Киева Тимур Ткаченко вновь сообщили о работе ПВО в городе. По словам Ткаченко, обломки упали на нежилое здание и на открытом пространстве в Шевченковском районе Киева. rbc.group ТСН и «Суспiльне» пишут о звуках взрывов в Киеве. rbc.group Кличко позднее заявил о пожарах в нескольких районах украинской столицы, включая загоревшуюся заправку в Дарницком районе. Ткаченко утверждает, что два человека погибли, 13 пострадали. В Киеве сообщили о работе ПВО Политика Прошлой ночью в Киеве также работали силы ПВО. О взрывах и работе ПВО сообщали также власти Днепра и нескольких городов на западе Украины, в том числе Луцка в Волынской области. Российское Минобороны позже отчиталось о групповом ударе по инфраструктуре украинских военных аэродромов. В ведомстве заявили, что все назначенные объекты поражены. Минобороны России подчеркивает, что удары наносятся только по военным и энергетическим объектам Украины и связанной с ними инфраструктуре. Читайте РБК в Telegram.	1	\N	2025-07-10 08:05:04	2025-07-10 08:05:04
1402	5671	nebo-nad-kievom-zatyanulo-dymom-posle-vzryvov	Небо над Киевом затянуло дымом после взрывов	https://s0.rbk.ru/v6_top_pics/media/img/3/39/347521261668393.jpeg	Небо над Киевом затянуло дымом после серии взрывов, зафиксировано загрязнение воздуха. В Киевской области трижды за ночь объявлялась воздушная тревога Фото: Nikoletta Stoyanova / Getty Images После ночных атак небо над Киевом затянуло дымом, сообщают украинское издание «Страна.ua» и агентство УНИАН. О плохом качестве воздуха в столице также сообщает «РБК-Украина». Со ссылкой на данные сервиса SaveEcoBot УНИАН пишет, что индекс качества воздуха в некоторых районах Киева сейчас достигает отметки 150 и больше при норме в 50. На данный момент наиболее критическая ситуация — на правом берегу Киева, отмечает агентство. Начальник городской военной администрации Тимур Ткаченко попросил жителей Киева плотно закрыть окна. «Очень много дыма. Сейчас на связи с главами районов ситуация контролируемая. Впереди очень много работы, буду сообщать в течение дня о ходе работ по ликвидации», — написал он в телеграм-канале. rbc.group В Киеве прогремели взрывы Политика rbc.group В ночь на 10 июля в Киевской области три раза объявлялась воздушная тревога. Сирены также сработали в соседней Черниговской области, Одесской, Сумской и Харьковской областях. В украинской столице первые предупредительные сигналы прозвучали в 01:03 по местному времени (совпадает с мск), после этого раздались взрывы, сообщает «РБК-Украина». По информации мэра Киева Виталия Кличко, повреждения зафиксированы в пяти районах: Шевченковском, Дарницком, Соломенском, Голосеевском и Подольском. Читайте РБК в Telegram.	2	\N	2025-07-10 08:55:03	2025-07-10 08:55:03
1403	5698	v-oae-nachalas-vstrecha-pashinyana-i-alieva	В ОАЭ началась встреча Пашиняна и Алиева	https://s0.rbk.ru/v6_top_pics/media/img/3/79/347521270407793.jpeg	Никол Пашинян и Ильхам Алиев во время переговоров в Абу-Даби, Объединённые Арабские Эмираты, 10 июля 2025 года (Фото: пресс-служба президента Азербайджанской Республики) Премьер-министр Армении Никол Пашинян и президент Азербайджана Ильхам Алиев начали переговоры в столице ОАЭ Абу-Даби. Об этом сообщили пресс-служба армянского правительства и азербайджанского президента. Пресс-служба президента Азербайджана опубликовала снимки со встречи, на которых запечатлены лидеры стран, пожимающие друг другу руки. Пресс-секретарь армянского премьер-министра Назели Багдасарян отметила, что встреча проходит в рамках мирного процесса между Арменией и Азербайджаном. Со стороны Еревана в переговорах участвуют вице-премьер Мгер Григорян, секретарь Совета безопасности Армен Григорян, министр иностранных дел Арарат Мирзоян и вице-спикер Национального Собрания Республики Армения Рубен Рубинян. Со стороны Баку во встрече приняли участие министр иностранных дел Азербайджана Джейхун Байрамов, вице-премьер Шахин Мустафаев и советник президента Азербайджана Хикмет Гаджиев. rbc.group Переговоры о заключении мирного договора между Азербайджаном и Арменией ведутся несколько лет. В марте внешнеполитические ведомства двух стран сообщили, что мирное соглашение готово к подписанию. Документ пока официально не опубликован, но известно, что в нем 17 статей. В соглашении Армения и Азербайджан признают территориальную целостность и нерушимость границ друг друга и исходя из этого проводят делимитацию и демаркацию своих границ. rbc.group За последний месяц Баку и Ереван согласовали две важные статьи, которые подтверждают неразмещение сил третьих стран вдоль границы и взаимный отзыв претензий из международных судов. Также стороны договорились воздержаться от подачи исков по спорным вопросам, которые существовали до подписания соглашения. Материал дополняется	4	\N	2025-07-10 09:15:03	2025-07-10 09:15:03
1404	5702	fox-uznal-o-sledstvii-protiv-zayavivshih-o-vmeshatelstve-rossii-v-vybory	Fox узнал о следствии против заявивших о вмешательстве России в выборы	https://s0.rbk.ru/v6_top_pics/media/img/0/14/347521248705140.jpeg	В отношении бывших глав ЦРУ и ФБР, которые заявили о «вмешательстве» России в выборы президента США в 2016 году, начато уголовное расследование, сообщает Fox. Москва называла обвинения во вмешательстве беспочвенными Джон Бреннан (Фото: Alex Wong / Getty Images) В отношении бывших руководителей ЦРУ и ФБР Джона Бреннана и Джеймса Коми начато уголовное расследование, связанное с возможными нарушениями при попытке доказать связь президента США Дональда Трампа с Россией, сообщает Fox News Digital со ссылкой на источники в американском Минюсте. По словам собеседников Fox News Digital, доказательства правонарушений Бреннана для возможного судебного преследования представил действующий директор ЦРУ Джон Рэтклифф. Их он передал директору ФБР Кэшу Пателю. Дополнительные подробности источники Fox News Digital рассказать отказались. The Washington Post (WP) отмечает, что информация об уголовном расследовании в отношении бывших руководителей ЦРУ и ФБР появилась после того, как стало известно, что оба находятся под «пристальным вниманием» в связи с их расследованием о возможном вмешательстве России в выборы президента США в 2016 году. Об этом в частности писала The New York Times. rbc.group Источник WP также подтвердил, что на прошлой неделе Рэтклифф передал информацию о Бреннане в ФБР для возбуждения уголовного дела по обвинению в даче ложных показаний Конгрессу. При этом детали расследования в отношении Коми пока неизвестны. Также неясно, насколько далеко продвинулось расследование в отношении бывших чиновников и какие обвинения могут быть предъявлены, если таковые вообще будут, отмечает газета. rbc.group «Президент Трамп был прав. Те, кто участвовал в этом политическом скандале, должны ответить за мошенничество, которое они совершили против президента Трампа, и за ложь, которую они говорили американскому народу», — прокомментировала Fox News Digital. ЦРУ выявило нарушения в докладе о вмешательстве России в выборы 2016 года Политика В 2016 году спецслужбы США обвинили Россию во вмешательстве в американский избирательный процесс с целью поддержать кандидатуру Дональда Трампа и очернить его соперницу Хиллари Клинтон.После победы Трампа в 2016 году расследованием возможного вмешательства России в американские выборы занималась комиссия под руководством спецпрокурора Роберта Мюллера. Она пришла к выводу, что давление на американских избирателей при помощи поддельных аккаунтов в социальных сетях действительно было. Однако в 2019 году Минюст США обнародовал его итоговый доклад, в котором спецпрокурор признал, что не выявил сговора. В июле 2025 года ЦРУ заявило, что оценка американской разведки относительно вмешательства России в выборы была составлена с многочисленными процедурными нарушениями и могла быть политически мотивированной. В докладе ведомства отмечалось, что повлиять на аналитиков, заставив их согласиться с ложной версией о сговоре Трампа и России, могли утечки в СМИ. По словам Рэтклиффа, расследование проводилось в рамках «нетипичного и коррумпированного процесса на фоне политически ангажированной атмосферы». Сам Трамп неоднократно отвергал подозрения в каких-либо неправомерных контактах с российскими официальными лицами. Москва также называла беспочвенными выводы о попытках повлиять на ход выборов в США. Читайте РБК в Telegram.	9	\N	2025-07-10 09:15:03	2025-07-10 09:15:03
1405	5774	franciya-i-britaniya-dogovoryatsya-o-koordinacii-svoih-yadernyh-sil	Франция и Британия договорятся о «координации» своих ядерных сил	https://s0.rbk.ru/v6_top_pics/media/img/1/80/347521185142801.jpeg	Франция и Британия подпишут обновленное оборонное соглашение, которое включает положение о том, что средства сдерживания обеих стран могут «координироваться», а серьезные угрозы Европе вызовут ответную реакцию обеих стран Эмманюэль Макрон и Кир Стармер (Фото: Keystone Press Agency / Global Look Press) Премьер-министр Великобритании Кир Стармер и президент Франции Эмманюэль Макрон 10 июля договорятся об углублении ядерного сотрудничества двух стран и более тесной работе в области ядерного сотрудничества, сообщает британское правительство. Британия и Франция являются единственными ядерными державами в Европе. Важным шагом станет декларация, в которой впервые будет указано, что средства сдерживания обеих стран независимы, но могут «координироваться», а серьезные угрозы Европе вызовут ответные действия Лондона и Парижа, подчеркнули в правительстве Британии. «Таким образом, любому противнику, угрожающему жизненно важным интересам Великобритании или Франции, может противостоять мощь ядерных сил обеих стран. Сотрудничество между обеими странами в области ядерных исследований также будет углубляться, в то же время они будут совместно работать над поддержанием международной архитектуры нераспространения», — говорится в публикации. rbc.group Кроме того, страны планируют производить больше крылатых ракет Storm Shadow (французский аналог — SCALP) и модернизировать линии производства этих снарядов. В то же время Франция и Британия начнут следующий этап совместного проекта по созданию одновременно противокорабельных и дальнобойных ракет, которые должны заменить Storm Shadow. rbc.group Также декларация, которую британское правительство называет «Ланкастер-хаус 2.0», то есть обновленным соглашением, принятым в Ланкастер-хаусе в 2010 году, включает партнерство в разработке высокотехнологичного радиочастотного вооружения, такого как микроволновое оружие и средства постановки помех, которые могут быть использованы для борьбы с беспилотниками и ракетами. Страны будут пытаться использовать возможности искусственного интеллекта, чтобы разработать алгоритмы для синхронных ударов своих ракет и беспилотников. Россия разорвет договор со Швецией об обмене данными о ядерных установках Политика Кроме того, Британия и Франция расширят свои силы совместного развертывания, «переориентировав их на защиту Европы, перейдя к боевой готовности для сдерживания и противодействия любым противникам». Отмечается, что в эти силы впервые будут интегрированы космические и кибертехнологии. По словам министра обороны Британии Джона Хили, новый этап оборонного сотрудничества двух стран призван повысить боеспособность и обеспечить возможность совместного действия их вооруженных сил «от Крайнего Севера до Черного моря». «Это партнерство укрепляет наше лидерство в Европе, обеспечивает постоянную поддержку Украины и посылает четкий сигнал нашим противникам о том, что вместе мы становимся сильнее», — сказал он. В начале марта Макрон объявил о начале «стратегических дебатов» о защите европейских союзников Франции французским ядерным оружием. МИД России увидел в словах Макрона «нотки ядерного шантажа» и «амбиции Парижа стать ядерным «патроном» всей Европы, предоставив ей свой «ядерный зонтик». Москва пообещала учесть его слова в своем оборонном планировании. В конце июня в Германии заявили, что Берлин должен получить доступ к ядерным арсеналам Парижа и Лондона или создать новый европейский «ядерный зонтик». Сегодня «ядерный зонтик» в Европе обеспечивают США. По подсчетам «Бюллетеня ученых-атомщиков» на 2023 год, в Европе находилось около 100 ядерных бомб B61 — это единственный вид нестратегического ядерного оружия в арсенале США. Они размещены на шести авиабазах в пяти странах, с которыми США заключили соответствующие двусторонние соглашения. В отличие от США, Британия и Франция не обладают всеми компонентами ядерной триады: Британия опирается только на морской компонент, Франция — на морской и воздушный. Британские и французские арсеналы в разы меньше, чем американские: в то время как, по данным «Бюллетеня», у Вашингтона 3,7 тыс. ядерных боеголовок, у Парижа их 290, а у Лондона — 225. Читайте РБК в Telegram.	8	\N	2025-07-10 10:05:02	2025-07-10 10:05:02
1408	5854	politico-uznalo-o-shoke-v-evrope-iz-za-menyayushchihsya-resheniy-ssha-po-ukraine	Politico узнало о шоке в Европе из-за меняющихся решений США по Украине	https://s0.rbk.ru/v6_top_pics/media/img/0/97/347521326836970.jpeg	Европа в шоке от недавних «нескоординированных» действий администрации США по Украине. Как отметил источник Politico, в то время как Трамп стал «более последовательным» в поддержке Киева, руководство Пентагона заняло иную позицию Дональд Трамп (Фото: Nathan Howard / Reuters) В Европе растет напряженность из-за недавних изменений в политике администрации президента США Дональда Трампа по Украине, а также замешательство относительно того, кто главный в Пентагоне, сообщает Politico со ссылкой на источники. Издание отмечает, что в таких условиях европейским политикам все сложнее разрабатывать какую-либо стратегию по Украине. Многие европейские союзники были в шоке, когда Пентагон на прошлой неделе решил приостановить поставку части вооружений Украине. Однако позднее Трамп пообещал отправить Киеву больше оружия, раскритиковав президента России Владимира Путина. Как отметил один из опрошенных Politico европейских чиновников, становится все труднее понять, что происходит внутри администрации президента США. По его мнению, сам Трамп стал «более последовательным» в своей поддержке Украины», в то время как руководство Пентагона заняло иную точку зрения. «Ничто больше не удивляет. Мы должны быть готовы ко всему», — заявил другой собеседник издания. rbc.group По словам еще одного источника, в Европе сложилось общее впечатление, что администрация действует «крайне нескоординированно» по вопросу Украины. «Многие лидеры стран НАТО просто пытаются угнаться за меняющимися настроениями в Вашингтоне», — указал он. rbc.group Трамп пообещал поставить больше оружия Украине Политика При этом Белый дом утверждает, что администрация не меняла свою стратегию по Украине. «Нет ничего более последовательного, чем внешняя политика президента Трампа. Он всегда будет ставить Америку на первое место и хочет мира на Украине и во всем мире», — заявила заместитель пресс-секретаря Белого дома Анна Келли. Она отметила, что Трамп принял решение направить Киеву вооружение сразу после того, как Пентагон завершил проверку всей военной помощи, которую США оказывают всем странам и регионам мира. The Wall Street Journal писала, что Трамп во время беседы с президентом Украины Владимиром Зеленским заявил, что он не стоит за приостановкой поставок оружия. Он отметил, что поручил провести проверку запасов Пентагона после ударов по Ирану в прошлом месяце, но не заморозил поставки. В ночь на 10 июля AP и Reuters сообщили, что Вашингтон возобновил поставки Киеву артиллерийских боеприпасов и реактивных снарядов GMRLS. Россия выступает против поставок военной помощи Украине. Путин неоднократно говорил, что западные страны, поставляя Киеву вооружения, лишь затягивают боевые действия. Читайте РБК в Telegram.	6	\N	2025-07-10 10:55:02	2025-07-10 11:17:39
1409	5909	mid-nazval-zayavlenie-guterrisha-po-ukraine-priznakom-ego-blizorukosti	МИД назвал заявление Гутерриша по Украине признаком его близорукости	https://s0.rbk.ru/v6_top_pics/media/img/2/12/347521346824122.jpeg	МИД России расценивает недавние заявления генсека ООН, осудившего атаку российских беспилотников на Украине, как политически ангажированные. По мнению ведомства, Гутерриш «тиражирует ложь» в пользу Украины Антониу Гутерриш (Фото: Manon Cruz / Reuters) МИД России раскритиковал заявление генерального секретаря ООН Антониу Гутерриша, в котором тот осудил «крупнейшую за три года» атаку России на Украину. Российское внешнеполитическое ведомство сочло его высказывания провокацией и призвало чиновников ООН отказаться от «ангажированного курса». В заявлении, опубликованном на сайте МИД России, говорится, что заявление Гутерриша снова показали «его политическую ангажированность и близорукость», которые выражаются «в практически безоглядной поддержке» Украины. «Гутерриш и его подчиненные регулярно подхватывают и тиражируют ложь, фабрикуемую киевским режимом и западными столицами и направленную на дискредитацию России. Последовательно замалчивают вопиющие нарушения Киевом международного гуманитарного права или в лучшем случае ограничиваются призывами к обеим сторонам к сдержанности», — говорится в заявлении. rbc.group По мнению российского МИДа, поводом для представленных генсеком ООН оценок во многом стали «весьма двусмысленные» формулировки докладов гендиректора МАГАТЭ Рафаэля Гросси по ситуации на ЗАЭС, где не упоминаются атаки украинских военных. «Абсурдно предполагать, будто у России могут быть основания создавать трудности для безопасной эксплуатации российской Запорожской АЭС. Именно на Москве лежит ответственность за обеспечение безопасности ЗАЭС, российская сторона делает все для решения этой задачи», — добавили в ведомстве. rbc.group Лавров обвинил генсека ООН в «откровенном» злоупотреблении полномочиями Политика МИД подчеркнул, что при проведении военной операции российская сторона «принимает исчерпывающие меры для неукоснительного соблюдения международного гуманитарного права». Целью атак являются только военные объекты на территории Украине, отметило ведомство. Заявление, на которое обратило внимание МИД, было опубликовано 5 июля. В нем говорится, что генсек ООН осуждает «серию масштабных атак на Украину», с применением ракет и беспилотников. «По имеющимся сообщениям, это самая крупная волна ударов за более чем три года войны. В результате обстрелов была нарушена подача электроэнергии на Запорожскую атомную электростанцию, что вновь подтверждает сохраняющиеся угрозы ядерной безопасности», — отметил он. Гутерриш призвал к «полному, немедленному и безоговорочному прекращению огня» на Украине как первому шагу на пути к «справедливому, всеобъемлющему и устойчивому миру». Минобороны России подчеркивает, что удары наносятся только по военным и энергетическим объектам Украины и связанной с ними инфраструктуре. Читайте РБК в Telegram.	5	\N	2025-07-10 11:25:03	2025-07-10 11:25:03
1410	5904	eksport-szhizhennogo-gaza-iz-rossii-ruhnul-na-fone-sankciy-evrosoyuza	Экспорт сжиженного газа из России рухнул на фоне санкций Евросоюза	https://s0.rbk.ru/v6_top_pics/media/img/8/58/347520727702588.jpeg	Поставки сжиженного углеводородного газа из России на экспорт в первом полугодии 2025 года упали на 22%, посчитали в «ОМТ Консалт». Эксперты считают, что даже такое снижение по году будет «не самым плохим результатом» «Газпром» GAZP ₽120,26 +0,49% Купить ЛУКОЙЛ LKOH ₽5 963 +0,49% Купить Танкер-газовоз у побережья острова Сахалин (Фото: Артем Житенев / РИА Новости) Россия за первые шесть месяцев 2025 года сократила экспорт сжиженного углеводородного газа (СУГ) на 21,8% в годовом выражении — предварительно до 1,3 млн т, подсчитали в консалтинговой компании «ОМТ Консалт» по запросу РБК. Снижение происходит на фоне санкций Евросоюза, окончательно вступивших в силу 20 декабря 2024 года. Сжиженный углеводородный газ, получаемый из попутного нефтяного газа, может использоваться для отопления домов, в качестве автомобильного топлива, а также в производстве нефтехимической продукции. Ограничения ЕС по нему были объявлены еще в 2023 году, но сначала действовал годовой переходный период. Под санкции попал практически весь перечень СУГ, в частности сжиженные пропан и бутан, этилен, пропилен, бутилен и бутадиен. При этом Европа традиционно была основным рынком сбыта для российских сжиженных углеводородных газов, в 2022 году на нее приходилось порядка 80% экспорта этой продукции. А основными покупателями СУГ из России были Польша и страны Прибалтики. Весь прошлый год российские экспортеры стремились перенаправить продукцию на доступные им рынки Центральной Азии и Китая. И хотя общий экспорт все равно снизился, часть объемов поступили новым покупателям. Так, агентство Argus оценивало, что за 11 месяцев 2024 года экспорт СУГ из России уменьшился на 7% год к году — до 3 млн т, но поставки отдельно в Европу снизились на 27% — до 1,6 млн т. При этом в 3,4 раза вырос железнодорожный экспорт в центральноазиатские страны, а в Китай — на 42%. rbc.group В целом, согласно оценке «ОМТ Консалт», экспорт сжиженных углеводородных газов из России в 2024 году уменьшился только на 1,5% к уровню 2023 года, до 3,3 млн т, а товарное производство СУГ (исключает внутризаводскую переработку и расход под собственные нужды предприятия) составило 12,5 млн т, снизившись всего на 0,6% год к году. rbc.group Россия перенаправила экспорт сжиженного газа в Азию перед санкциями ЕС Бизнес В этом году ввиду отсутствия Европы как экспортного направления основным рынком сбыта для российских экспортеров стал Китай. На него в первом полугодии предварительно пришлось 17,7% всего экспорта (234,1 тыс. т). Но при этом почти такую же долю заняли Тунис (17,4%, или 230,3 тыс. т) и Афганистан (17,3%, или 229,2 тыс. т). На четвертом месте оказалась Турция, куда за шесть месяцев 2025 года поступило 10,9% экспорта, или 144,3 тыс. т. Замыкает пятерку крупнейших по величине рынков для российских СУГ Белоруссия с долей 7% (93,3 тыс. т). В «ОМТ Консалт» отмечают, что часть сжиженных углеводородных газов, направляемых в Белоруссию, потребляется внутренним рынком, но при этом часть по-прежнему уходит далее в сторону Польши и стран Балтии. Крупнейшими экспортерами, по оценкам экспертов, в первом полугодии были «ЗапСибНефтехим» («Сибур», 28,7%), Оренбургский ГПЗ («Газпром», 18,3%), Иркутская нефтяная компания (ИНК, 14,4%), «ЛУКОЙЛ-Пермнефтеоргсинтез» (7,3%) и Сургутский ЗСК («Газпром», 5%). Эти же предприятия вошли в число крупнейших производителей. Совокупный выпуск товарных СУГ по итогам первого полугодия 2025 года увеличился на 3,1% к аналогичному периоду прошлого года, до 6,5 млн т. РБК направил запрос в пресс-службу Минэнерго. Каковы дальнейшие перспективы Руководитель практики Kept по оказанию услуг компаниям нефтегазового сектора Максим Малков считает, что снижение экспорта СУГ из России примерно на 20% сохранится до тех пор, пока поставки не будут полностью перераспределены на другие рынки. При этом Сергей Фролов, управляющий партнер NEFT Research, считает, что «итоговое снижение по году на 20% будет не самым плохим результатом на фоне фактической потери европейского рынка, который до момента вступления в силу санкций ЕС был основным для российских компаний». В связи с этим внутренний рынок СУГ в России, вероятно, будет профицитен, и давление на него ощущается уже сейчас, говорят эксперты «ОМТ Консалт». Так, по данным Петербургской биржи (СПбМТСБ), национальный биржевой индекс цен на СУГ по итогам торгов 9 июля вырос на 2,49% — до 12,148 тыс. руб. за тонну. Однако показатель все первое полугодие 2025 года находится в пределах диапазона 11–16 тыс. руб. за тонну СУГ, то есть вблизи значений, к которым индекс опустился в преддверии вступления санкций ЕС в действие. По оценкам Фролова, в ближайшей перспективе спрос на внутреннем рынке будет расти в основном за счет увеличения потребления СУГ как сырья для нефтехимической промышленности. «В частности, два крупных проекта, в которых СУГ используется как сырье, реализует компания «Сибур». Это Амурский ГХК и второй комплекс дегидрирования пропана на «ЗапСибНефтехиме», — напоминает эксперт. Цены на сжиженный газ в России обрушились на фоне эмбарго Евросоюза Бизнес Таким образом, «на ближайшие несколько лет тенденция по экспорту СУГ на азиатские рынки (Китай, Центральная Азия, Турция) сохранится», прогнозируют в «ОМТ Консалт». При этом возможен и выход на новые рынки, например в Индию, но для расширения экспортных направлений «чувствуется нехватка перевалочных и логистических мощностей». «Прежде всего, необходимо строительство специализированного морского терминала на Дальнем Востоке. В настоящее время такого терминала нет, и весь экспорт осуществляется по железной дороге, но возможности таких поставок ограничены», — рассуждает Фролов. Малков напоминает, что экспорт СУГ осуществляется как по морю на LPG-танкерах, так и в специализированных ж/д цистернах. При этом транспортировать такой товар легче, чем, например, сжиженный природный газ (СПГ). Поэтому, объясняет он, эффективны и комбинированные схемы, когда сначала газ поставляется в цистернах до портов, а затем переваливается на танкеры. «Подобные проекты уже реализуются в Черноморском бассейне, на евразийском и дальневосточном направлениях. Безусловно, необходимые перевалочные мощности будут введены в ближайшее время, но пока этот процесс не завершен», — замечает эксперт. В то же время необходимо помнить, что мировой рынок СУГ очень насыщен и высококонкурентен, предупреждает Малков. Поэтому новые рынки для России, вероятно, будут формироваться не органическим ростом, а за счет перераспределения существующих потоков в условиях санкций. Так, Европа будет перекупать СУГ у других производителей или трейдеров по более высоким ценам, а поставщики из России придут на рынки, откуда эти объемы начнут уходить. «Сейчас, например, около 25% турецкого рынка СУГ приходится на российские поставки. В целом потенциальными крупными рынками сбыта для отечественных СУГ являются страны Центральной Азии и АТР. Особенно это касается Индонезии и Вьетнама, а также Китая и Монголии. В этих странах либо высокоразвита или продолжает развиваться культура использования газомоторного топлива, либо присутствуют крупные нефтегазохимические предприятия», — заключает он. Читайте РБК в Telegram.	8	\N	2025-07-10 11:25:03	2025-07-10 11:25:03
1411	5958	v-moskve-prostilis-s-romanom-starovoytom-fotoreportazh	В Москве простились с Романом Старовойтом. Фоторепортаж		В Центральной клинической больнице Москвы простились с бывшим главой Минтранса Романом Старовойтом. О смерти 53-летнего чиновника стало известно днем 7 июля, через несколько часов после его отставки. Старовойт покончил жизнь самоубийством. На церемонию приехали члены правительства, включая преемника министра Андрея Никитина. Кто еще посетил прощание — в фоторепортаже РБК. Читайте РБК в Telegram. Фото: Андрей Любимов / РБК На прощание приехал Андрей Никитин. С февраля 2025 года он занимал пост замминистра транспорта, а после отставки Старовойта возглавил ведомство. В разговоре с журналистами Никитин назвал ушедшего «достойным человеком». Фото: Андрей Любимов / РБК В Кремле ранее заявили, что самоубийство Старовойта «шокировало и нас тоже». По словам пресс-секретаря президента Дмитрия Пескова, Владимиру Путину было «незамедлительно доложено» о случившимся. «Информация такого рода всегда трагическая и печальная», — добавил он. Там подчеркивали, что отставка Старовойта не была связана с утратой доверия, но причину увольнения не назвали. Старовойт возглавлял Минтранс с мая 2024 года. Ранее, с 2019 года, он был губернатором Курской области. Фото: Андрей Любимов / РБК На прощение приехали члены правительства. В их числе зампред правительства Дмитрий Патрушев. Фото: Андрей Любимов / РБК Зампред правительства Александр Новак также прибыл на церемонию. Фото: Андрей Любимов / РБК Вице-премьер Дмитрий Григоренко. Фото: Андрей Любимов / РБК Справа — зампред правительства Дмитрий Чернышенко. Фото: Андрей Любимов / РБК Церемонию также посетили министр экономического развития Максим Решетников (слева) и глава Минцифры Максут Шадаев (в центре). На фото они перед началом церемонии. Фото: Андрей Любимов / РБК Вице-премьер Марат Хуснуллин также приехал на прощание со Старовойтом. Фото: Андрей Любимов / РБК Фото: Андрей Любимов / РБК Министр сельского хозяйства Оксана Лут и глава Минпромторга Антон Алиханов. Фото: Сергей Савостьянов / ТАСС Глава РЖД, бывший первый замминистра транспорта Олег Белозеров. Фото: Андрей Любимов / РБК Бывшего министра похоронят в Санкт-Петербурге. «Фонтанка» писала, что хотя Старовойт родился в Курске, он окончил школу в Ленинградской области, а карьеру начал в Санкт-Петербурге. Телеграм-канал Baza писал, что в городе живут брат и отец погибшего. Фото: Андрей Любимов / РБК Фото: Андрей Любимов / РБК Портрет бывшего министра транспорта Романа Старовойта на церемонии прощания в ЦКБ, 10 июля 2025 года	1	\N	2025-07-10 11:55:03	2025-07-10 11:55:03
1412	5966	na-proshchanie-so-starovoytom-priehali-preemnik-v-mintranse-i-8-ministrov	На прощание со Старовойтом приехали преемник в Минтрансе и 8 министров		Члены правительства приехали на церемонию прощания со Старовойтом. Среди них — вице-премьеры Григоренко, Новак и Хуснуллин, а также министры — Шадаев, Решетников, Любимова, Лут и Алиханов Фото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБК На церемонию прощания с Романом Старовойтом приехал его преемник на должности министра транспорта Андрей Никитин, передает корреспондент РБК. Также на церемонию приехали и другие члены правительства — вице-премьеры Дмитрий Григоренко, Александр Новак и Марат Хуснуллин. Кроме них приехали министр цифрового развития Максут Шадаев, глава Минэкономразвития Максим Решетников, министр культуры Ольга Любимова, министр сельского хозяйства Оксана Лут и глава Минпромторга Антон Алиханов. rbc.group Стало известно возможное место похорон экс-министра Старовойта Политика rbc.group Церемония проходит в Центральной клинической больнице. Она началась в 9:00 и пройдет до 11:00, передает корреспондент РБК. Похоронят Старовойта в Санкт-Петербурге. Старовойт покончил жизнь самоубийством — об этом стало известно 7 июля. Ранее в этот день президент России Владимир Путин отправил Старовойта в отставку с поста главы Минтранса. На месте нашли наградной пистолет Старовойта, на парковке рядом — машину Tesla. Что известно о самоубийстве экс-министра транспорта Старовойта. Главное Политика Читайте РБК в Telegram.	2	\N	2025-07-10 12:45:01	2025-07-10 12:45:01
1422	6196	lavrov-i-rubio-zavershili-peregovory-v-kuala-lumpure	Лавров и Рубио завершили переговоры в Куала-Лумпуре		Переговоры проходили в Куала-Лумпуре на полях саммита АСЕАН. Встреча длилась порядка 50 минут Video Делегации России и США, возглавляемые главой МИД России Сергеем Лавровым и госсекретарем США Марко Рубио, завершили переговоры в Куала-Лумпуре на полях саммита АСЕАН, передает корреспондент РБК. Встреча длилась около 50 минут. С российской стороны во встрече участвовали и.о. директора департамента Атлантики МИД России Кирилл Михайлов, начальник отдела департамента Северной Америки МИД России Александр Посылкин. С американской — помощник госсекретаря США по политическим вопросам Элисон Хукер и директор отдела планирования политики Государственного департамента США Майкл Энтон. Лавров в День независимости США напомнил Рубио о «реалиях на земле» Политика rbc.group Предыдущая личная встреча Лаврова и Рубио состоялась в феврале в Эр-Рияде. Политики также несколько раз разговаривали друг с другом по телефону. Замглавы российского МИДа Сергей Рябков в июне рассказывал, что Лавров и Рубио находятся в постоянном контакте. 4 июля российский министр отправил американскому коллеге телеграмму с поздравлением с Днем независимости США. Он выразил надежду, что отношения между странами «обретут стабильность и предсказуемость», но подчеркнул необходимость учитывать «реалии на земле». Вашингтон после прихода к власти американского президента Дональда Трампа пытался выступить посредником в урегулировании между Москвой и Киевом. Рубио и Лавров, в частности, контактировали по этому вопросу. Кроме того, США и Россия вели контакты по вопросам дипломатических «раздражителей» с американской администрацией. Российский МИД сообщил 6 июля, что дата новых переговоров пока не назначена. Читайте РБК в Telegram.	9	2025-07-10 15:30:42	2025-07-10 15:05:03	2025-07-10 15:30:42
1483	7120	reuters-uznal-o-gotovnosti-es-soglasovat-18-y-paket-sankciy	Reuters узнал о готовности ЕС согласовать 18-й пакет санкций	https://s0.rbk.ru/v6_top_pics/media/img/0/09/347524477332090.jpeg	Предварительно все страны Евросоюза одобрили новый пакет ограничений, в том числе Словакия, выяснил Reuters. Среди новых мер — снижение потолка цен на нефть до $47 за баррель и его дальнейший «плавающий» курс Евро/Рубль EUR/RUB — — BRENT BRENT $70,34 +4,99% Фото: Руслан Шамуков / ТАСС Представители европейских стран рассчитывают в понедельник, 14 июля, согласовать 18-й пакет санкций против России, включая снижение предельной цены на российскую нефть, пишет Reuters, ссылаясь на четыре источника. В случае согласования, официально пакет мер будет принят на следующий день, на встрече министров иностранных дел в Брюсселе. Сейчас согласованы все элементы пакета, но у одного государства остались технические оговорки относительно нового ограничения — Словакия согласилась на новые меры, но добивается гарантий от Европейской комиссии насчет планов постепенного прекращения поставок российского газа. В числе согласованных решений — механизм для установления динамической предельной стоимости на российскую нефть. Согласно замыслу, стоимость нефти будет на 15% ниже средней рыночной цены сырой нефти за последние шесть месяцев (вместо трех, изначально предложенных Еврокомиссией). rbc.group Первоначальная предельная цена составит примерно $47 за баррель (сейчас — $60), утверждает один из источников. Эту сумму получили, усреднив стоимость барреля российской нефти за последние 22 недели и вычтя 15%, объясняет агентство. rbc.group МЭА поставило под сомнение способность России сохранить добычу нефти Бизнес Обсуждение понижения потолка цен на нефть активизировалось в связи с рыночными потрясениями из-за войны Ирана и Израиля: уровень в $60 стал неактуальным, писал Reuters. На некоторое время мировые цены на нефть выросли до $80 за баррель, а затем снова упали. Российские власти считают западные санкции против энергетического сектора неэффективными и не оказывающими воздействия на экономику России. «Когда был установлен потолок 60 долларов, это не повлияло. Это означает, что установите хоть ноль — все равно это не будет влиять», — уверен вице-премьер Александр Новак. Читайте РБК в Telegram.	2	\N	2025-07-14 07:55:03	2025-07-14 07:55:03
1485	7123	suspilne-nazvalo-kogo-zelenskiy-sobralsya-naznachit-premerom	«Суспільне» назвало, кого Зеленский собрался назначить премьером	https://s0.rbk.ru/v6_top_pics/media/img/5/15/347524378059155.jpeg	Свириденко 39 лет. Последние четыре года она занимает должность вице-премьера по экономике. Свириденко в апреле представляла Украину на подписании ресурсной сделки с США Юлия Свириденко (Фото: Kay Nietfeld / dpa / Global Look Press) Украинский президент Владимир Зеленский предложит должность главы правительства первому вице-премьеру Юлии Свириденко, сообщают «Суспільне» и «РБК-Украина» со ссылкой на источники. Завтра Зеленский и Свириденко встретятся, чтобы обсудить формат и членов нового кабинета министров, утверждает «Суспільне». По сведениям обоих изданиях, действующий премьер Денис Шмыгаль займет должность министра обороны, а нынешний министр обороны Рустем Умеров уедет послом в США. Вечером в 13 июля Зеленский встретился со Шмыгалем и заявил затем подготовке «ощутимой управленческой трансформации», которая «позволит сократить расходы на содержание государственного аппарата, обеспечить значительную дерегуляцию и направить максимум имеющихся ресурсов на защиту Украины и украинцев». Накануне, 12 июля, украинский президент встретился с Умеровым и анонсировал решения об улучшении динамики в отношениях с США. rbc.group FT узнала, как на Западе видят мнение Трампа о Путине и Зеленском Политика rbc.group Юлии Свириденко 39 лет. Она окончила Киевский национальный торгово-экономический университет (сейчас Государственный торгово-экономический университет), получила степень магистра по специальности «менеджмент антимонопольной деятельности», а затем окончила аспирантуру по направлению «экономика и управление национальным хозяйством», работала в коммерческих компаниях. В правительство она пришла в 2019 году, став замминистра развития экономики, торговли и сельского хозяйства Украины. В 2020 и 2021 годах Свириденко представляла украинскую сторону в рабочей подгруппе по социально-экономическим вопросам Контактной группы по урегулированию конфликта в Донбассе, тогда же она была замглавы офиса президента. Первым вице-премьером Свириденко стала в ноябре 2021 года, она курирует экономику. Весной 2025 года она со стороны Украины подписала ресурсную сделку с США. Читайте РБК в Telegram.	3	\N	2025-07-14 07:55:04	2025-07-14 07:55:04
1413	5968	torpedo-isklyuchili-iz-rossiyskoy-premer-ligi-posle-skandala-s-sudyami	«Торпедо» исключили из Российской премьер-лиги после скандала с судьями		Также московский клуб заплатит денежный штраф Московское «Торпедо» исключено из состава участников ближайшего сезона Российской премьер-лиги (РПЛ). Об этом «РБК Спорт» сообщили два источника, знакомые с ситуацией. Также московский клуб заплатит денежный штраф. В июне владелец «Торпедо» Леонид Соболев и директор клуба Валерий Скородумов были отправлены в СИЗО по делу об оказании противоправного влияния на результат матчей с участием клуба. Они предложили судье взятку, но последний отказался. Во вторник, 8 июля, РБК со ссылкой на источники сообщил, что был задержан футбольный арбитр Богдан Головко по подозрению в совершении сознательной ошибки в пользу «Торпедо» в матче заключительного тура Первой лиги с «КАМАЗом». Отмечалось, что судья не поставил пенальти в ворота «Торпедо». Адвокат Соболева 9 июля сообщил «РИА Новости», что в случае исключения из РПЛ «Торпедо» распустят.	7	\N	2025-07-10 12:45:01	2025-07-10 13:14:16
1414	6018	byvshiy-ukrainskiy-razvedchik-rasskazal-ob-ubiystve-polkovnika-sbu-v-kieve	Бывший украинский разведчик рассказал об убийстве полковника СБУ в Киеве	https://s0.rbk.ru/v6_top_pics/media/img/9/29/347521402678299.jpeg	В Киеве в результате стрельбы был убит полковник СБУ. По словам бывшего украинского разведчика Червинского, в него выстрелили пять раз. Киевская полиция подтвердила факт стрельбы и убийство мужчины, но его личность не раскрыла Фото: Brendan Hoffman / Getty Images Полковник Службы безопасности Украины (СБУ) Иван Воронич был убит в результате стрельбы в Киеве, сообщил Роман Червинский, ранее служивший в силах специальных операций Украины (ССО) и Главном управлении разведки (ГУР) Минобороны Украины. По его словам, неизвестный выстрелил в него как минимум пять раз. Об убийстве полковника СБУ также пишет бывший депутат Верховной рады Игорь Мосийчук. Он утверждает, что нападавшему удалось скрыться с места происшествия. «В результате выстрелов пострадавший получил многочисленные проникающие огнестрельные ранения, от которых умер на месте происшествия», — написал Мосийчук в телеграм-канале. Главное управление Национальной полиции в Киеве ранее сообщило, что в Голосеевском районе украинской столицы произошла стрельба, в результате погиб мужчина. Однако информацию о погибшем ведомство не раскрыло. rbc.group Сейчас на месте происшествия работают следственно-оперативные группы районного и главного управлений полиции, сотрудники уголовного розыска, кинологи и другие службы. Обстоятельства происшествия устанавливаются, отметили в ведомстве. rbc.group Двумя днями ранее, 8 июля, в Киеве был застрелен подполковник Вооруженных сил Украины. По информации, внефракционного депутата Верховной рады Артема Дмитрука, погибший занимал должность заместителя начальника городского территориального центра комплектования (аналог военкомата). Читайте РБК в Telegram.	7	\N	2025-07-10 13:15:02	2025-07-10 13:21:48
1451	6618	akcii-vtb-ruhnuli-na-24-na-fone-dividendnogo-gepa	Акции ВТБ рухнули на 24% на фоне дивидендного гэпа		11 июля — первый день, когда акции ВТБ торгуются без дивидендов. Банк выплатит акционерам дивиденды за 2024 год в размере ₽25,58 на акцию ВТБ VTBR -1,05% Фото: Shutterstock Акции ВТБ (VTBR) в начале торгов в пятницу, 11 июля, снизились на 24,13% и на минимуме достигли ₽70,91 за штуку, свидетельствуют данные Мосбиржи на 10:00 мск. Позднее падение замедлилось: на 10:13 мск бумаги теряли 22,59% и торговались на отметке ₽72,35 за акцию. Объем торгов к этому моменту, по данным Мосбиржи, уже превысил ₽4,2 млрд (без учета РЕПО). Из-за резкого падения акций Мосбиржа запустила по ним дискретный аукцион. Он начался в 10:14 мск и завершился в 10:44 мск. «Произошло снижение на 20% и более в течение десяти минут подряд текущей цены акций от цены закрытия предыдущего торгового дня (₽93,97)», — говорится в сообщении площадки. rbc.group Дискретный аукцион — особый механизм, с помощью которого Мосбиржа снижает волатильность  на рынке. Биржа  собирает с участников торгов заявки на покупку и продажу акций в стакан. Он применяется вместо обычного режима торгов при изменении цены акции от цены закрытия предыдущего торгового дня более чем на 20% в течение десяти минут подряд. Сессия дискретных аукционов состоит из трех аукционов по десять минут. Через 30 минут после начала аукциона торги возобновляются в обычном режиме. ВТБ VTBR ₽93,46 (-1,05%) 1д 1н 1м 3м 1г Все время График... После завершения дискретного аукциона падение котировок все еще превышало 20% по сравнению с уровнем закрытия торгов в четверг, 10 июля. По состоянию на 10:45 мск котировки падали на 22,19%, до ₽72,73. Объем торгов с начала основной сессии, по данным Мосбиржи, на тот момент уже превысил ₽5 млрд (без учета РЕПО). Причиной снижения котировок ВТБ стал дивидендный гэп  . В четверг, 10 июля, был последний день, когда акции можно было купить под дивиденды   — за 2024 год акционеры получат по ₽25,58 на акцию. По цене закрытия 10 июля это давало дивдоходность 27%. Как правило, акции во время дивидендного гэпа падают на величину дивидендов. Аналитик «Т-Инвестиций» Егор Дахтлер считает, что для восстановления котировок ВТБ потребуется время. Факторами, которые способны ускорить восстановление, могут стать дальнейшее снижение ставок и публикация результатов банка по МСФО за второй квартал 2025 года. Акции МТС потеряли более 16% на фоне дивидендного гэпа МТС , Дивидендный гэп , Акции , Дивиденды Аналитики «Альфа-Инвестиций» полагают, что дальнейшая динамика акций будет зависеть еще от нескольких факторов: решения Банка России по ключевой ставке 25 июля. Смягчение денежно-кредитной политики регулятора — позитив для банка; объявления параметров допэмиссии; потенциального геополитического потепления и снятия санкций с ВТБ. Однако пока прогресса в этом вопросе нет и ожидать позитивного драйвера можно еще долго. Но ключевой фактор скорости закрытия дивидендного гэпа — это какие дивиденды будут в 2026-м и последующих годах, отмечают в «Альфа-Инвестициях». «Из-за сложностей с достижением нормативов достаточности капитала нет гарантий, что банк продолжит распределять 50% чистой прибыли. <...> Однако можно предположить, что в случае улучшения рыночного сентимента акции будут стремиться к закрытию гэпа», — заключили в брокерской компании. В конце апреля наблюдательный совет ВТБ неожиданно для рынка рекомендовал выплатить дивиденды акционерам в размере ₽25,58 на акцию за 2024 год. Тогда на фоне этой новости бумаги банка взлетели более чем на 24%. Решение набсовета стало сюрпризом, потому что в предыдущий раз ВТБ выплачивал дивиденды лишь по итогам 2020 года. Более того, в феврале этого года первый зампред правления банка Дмитрий Пьянов сообщал, что ВТБ не планирует дивидендных выплат в силу «беспрецедентного количества одновременно проявляющихся негативных факторов», которые влияют на достаточность капитала банка. Среди таких факторов он назвал в том числе высокую ключевую ставку, введение антициклической надбавки и увеличение налоговой нагрузки. В апреле Пьянов объяснил журналистам резкое изменение решения ВТБ по выплате дивидендов более слабым развитием рынка кредитования и возможностями привлечения капитала. По словам главы ВТБ Андрея Костина, группа в прошлом году превысила целевые показатели, предусмотренные стратегией развития по прибыли и количеству активных розничных клиентов, что и позволило рекомендовать выплаты на год раньше. Объем дивидендов за 2024 год составит 50% от чистой прибыли группы ВТБ по МСФО. По итогам 2024 года чистая прибыль банка по международным стандартам достигла рекордных ₽551,4 млрд, следует из его отчетности. В июне 2025 года президент России Владимир Путин подписал распоряжение направлять доходы государства от дивидендов ВТБ за 2024–2028 годы на финансирование Объединенной судостроительной корпорации (ОСК). Согласно документу, дивиденды будут направлены в том числе на финансирование модернизации мощностей корпорации. ОСК перешла во временное управление ВТБ по решению правительства в августе 2023 года. Ранее корпорация подчинялась напрямую Минпромторгу. Изменчивость цены в определенный промежуток времени. Финансовый показатель в управлении финансовыми рисками. Характеризует тенденцию изменчивости цены – резкое падение или рост приводит к росту волатильности. Подробнее Существенный ценовой разрыв между ценой бумаги в период между закрытием и открытием торгов. Регламентированный рынок, где встречаются продавцы и покупатели, торгующие различными активами: акциями, облигациями, валютой, фьючерсами, товарами. Стать участником торгов на бирже может каждый – для этого нужно открыть брокерский счет. Каждая сделка заключается по рыночной цене, совершается практически мгновенно, а также регистрируется и контролируется. Подробнее Дивиденды — это часть прибыли или свободного денежного потока (FCF), которую компания выплачивает акционерам. Сумма выплат зависит от дивидендной политики. Там же прописана их периодичность — раз в год, каждое полугодие или квартал. Есть компании, которые не платят дивиденды, а направляют прибыль на развитие бизнеса или просто не имеют возможности из-за слабых результатов. Акции дивидендных компаний чаще всего интересны инвесторам, которые хотят добиться финансовой независимости или обеспечить себе достойный уровень жизни на пенсии. При помощи дивидендов они создают себе источник пассивного дохода. Подробнее	9	\N	2025-07-11 10:55:01	2025-07-11 10:55:01
1415	6029	lavrov-vstretilsya-s-rubio-v-kuala-lumpure	Лавров встретился с Рубио в Куала-Лумпуре	https://s0.rbk.ru/v6_top_pics/media/img/7/56/347521300008567.jpeg	Встреча Рубио и Лаврова на полях АСЕАН готовилась, сообщала ранее представитель МИД России Мария Захарова. Марко Рубио по прибытии Малайзию для участия в саммите министров иностранных дел стран АСЕАН, 10 июля 2025 года (Фото: Mandel Ngan / Reuters) Глава МИД России Сергей Лавров проводит встречу с госсекретарем США Марко Рубио в Куала-Лумпуре на полях министерских мероприятий по линии АСЕАН, передает корреспондент РБК. Первая личная встреча Лаврова и Рубио прошла в рамках российско-американских консультаций в Эр-Рияде в феврале. Они также провели несколько телефонных разговоров, а 4 июля российский министр направил своему американскому коллеге поздравительную телеграмму по случаю Дня независимости США. О том, что встреча Лаврова и Рубио пройдет, сообщала РБК официальный представитель МИД России Мария Захарова. rbc.group Марко Рубио приехал на АСЕАН, куда приехал и Лавров Политика rbc.group До этого Лавров встретился с главой МИД Китая Ван И. Читайте РБК в Telegram.	2	\N	2025-07-10 13:25:04	2025-07-10 13:25:04
1416	6056	byvshie-sotrudniki-obvinili-moet-hennessy-v-domogatelstvah-i-toksichnosti	Бывшие сотрудники обвинили Moet Hennessy в домогательствах и токсичности	https://s0.rbk.ru/v6_top_pics/media/img/0/04/347521430422040.webp	Штаб-квартира LVMHПодпишитесь на телеграм-канал «РБК Вино»Бывшие сотрудники Moet Hennessy, производящей шампанское Dom Perignon и коньяк Hennessy, обвинили компанию в запугиваниях и домогательствах, из-за которых они были вынуждены уволиться, пишет Financial Times. Статья вышла под заголовком «Дело о сексуальных домогательствах в Moet Hennessy проливает свет на культуру компании». В ней говорится о бывшей сотруднице Марии Гаспарович и о еще 20 бывших и действующих сотрудниках, которые рассказали о нездоровой атмосфере в конгломерате.Гаспарович уволена в июне прошлого года, через четыре месяца после того, как уведомила отдел кадров о предполагаемых правонарушениях со стороны старших коллег. Она утверждает, что сначала появились слухи о том, что она пыталась соблазнить генерального директора Moеt Hennessy Филиппа Шауса и одного из клиентов компании, а потом начальники попросили ее пройти тренинг по «антисоблазнению», если она хочет продвинуться по службе.Гаспарович обратилась с иском в совет по трудовым спорам (этот французский орган рассматривает дела, касающиеся трудовых отношений), потребовав компенсации в размере €1,3 млн. Также она изложила свою позицию в социальных сетях. Последнее стало поводом для ответного иска о клевете со стороны Moet Hennessy, рассказал FT источники, осведомленные об этом вопросе.Собеседник газете, близкий к группе LVMH, заявил, что Гаспарович неправильно истолковала предложение компании повысить свою квалификацию. Другие источники сказали, что, по мнению руководства холдинга, Гаспарович пытается шантажировать компанию.Moet Hennessy отказалась официально комментировать ситуацию, уточнив, что обращение в совет по трудовым спорам является обычной практикой для французского рынка труда.Moet Hennessy Louis Vuitton (LVMH) является крупнейшим в мире конгломератом люксовых брендов. Группа объединяет 75 брендов категорий люкс и премиум, в том числе производителей одежды, аксессуаров, часов и украшений Louis Vuitton и Dior, шампанских вин Moet & Chandon, коньяка Hennessy, вина Chateau Cheval Blanc и других.Группе принадлежат 26 винных домов. Среди самых ее известных производителей вин и крепких алкогольных напитков — Moet & Chandon, Krug, Veuve Clicquot, Hennessy и Chateau d'Yquem. Старейшая винодельня — Clos des Lambrays, основана в 1365 году. Выручка группы за 2023 год составила более €6,6 млрд.Кроме Гаспарович, Financial Times нашла еще четырех женщин-сотрудниц, работавших в парижской штаб-квартире Moet Hennessy, которые рассказали о случаях буллинга и домогательств. Еще несколько человек рассказали о токсичной атмосфере в компании. По словам одного из сотрудников, начальник «орал на людей, как будто это был модный дом в 1990-х, хотя мы находимся в 2025 году — такое поведение больше недопустимо». Он рассказал, как люди уходили из компании буквально «за ночь» и что это приняло «разрушительные масштабы».В сентябре 2024 года генеральный директор Moеt Hennessy Филипп Шаус и руководитель отдела кадров Паула Фаллоуфилд попытались урегулировать ситуации. Они сообщили, что каждое сообщение о ненормальных отношениях было тщательно рассмотрено. «Мы стремимся создать положительную рабочую атмосферу... Более того, мы также настроены сделать все возможное, чтобы защитить репутацию Moet Hennessy», — написали они.В ноябре 2024 года Александр Арно, сын владельца конгломерата LVMH Бернара Арно, получил пост заместителя генерального директора Moet Hennessy. Однако к маю подразделение столкнулось со спадом продаж по всему миру. Reuters сообщил, что подразделение собирается сократить численность своего персонала на 13%, чтобы справиться с кризисом.	9	\N	2025-07-10 13:35:02	2025-07-10 13:35:02
1417	6071	evroparlament-otklonil-votum-nedoveriya-ursule-fon-der-lyayen	Европарламент отклонил вотум недоверия Урсуле фон дер Ляйен	https://s0.rbk.ru/v6_top_pics/media/img/9/28/347521429499289.jpeg	Урсула фон дер Ляйен (Фото: Johannes Simon / Getty Images) Вотум недоверия председателю Еврокомиссии (ЕК) Урсуле фон дер Ляйен и ее исполнительной коллегии не сумел пройти голосование в Европарламенте, сообщает Euroactive. В ходе голосования 360 депутатов Европарламента проголосовали против резолюции, 175 — за, а 18 воздержались. Это значительно ниже требуемого порога в две трети голосов избирателей и не менее 361 депутата Европарламента, проголосовавших «за». Инициатива о вотуме недоверия была выдвинута ультраправым депутатом от румынской партии «Альянс за объединение румын» (AUR) Георге Пиперя. Он собрал 75 подписей членов ЕП при 72 минимально необходимых для вынесения предложения на голосование.  Материал дополняется.	10	\N	2025-07-10 13:45:02	2025-07-10 13:45:02
1418	6077	peskov-obyasnil-otsutstvie-putina-na-proshchanii-so-starovoytom	Песков объяснил отсутствие Путина на прощании со Старовойтом	https://s0.rbk.ru/v6_top_pics/media/img/4/85/347521402895854.jpeg	Путин далеко не всегда посещает траурные церемонии, заявил Песков, комментируя прощание с экс-главой Минтранса. О смерти Старовойта стало известно 7 июля, через несколько часов после отставки. Он покончил жизнь самоубийством Владимир Путин (Фото: Администрация Президента России) Президент России Владимир Путин не всегда имеет возможность посетить траурные мероприятия, сообщил пресс-секретарь президента Дмитрий Песков, комментируя отсутствие главы государства на церемонии прощания с бывшим министром транспорта Романом Старовойтом, передает корреспондент РБК. «Здесь не бывает никакой обязаловки. Не могу просто сказать, кто ездил. Это всегда личное решение каждого», — сказал Песков. Пресс-секретарь президента уточнил, что сегодня Путин работает в Кремле. На вторую половину него запланировано совещание с министром просвещения России Сергеем Кравцовым, министром науки и высшего образования Валерием Фальковым и вице-премьером Дмитрием Чернышенко. rbc.group На прощание со Старовойтом приехали преемник в Минтрансе и 8 министров Политика rbc.group Прощание со Старовойтом прошло в Центральной клинической больнице в Москве. Церемонию посетил его преемник на должности министра транспорта Андрей Никитин, вице-премьеры Дмитрий Григоренко, Александр Новак и Марат Хуснуллин, министр цифрового развития Максут Шадаев, глава Минэкономразвития Максим Решетников, министр культуры Ольга Любимова, министр сельского хозяйства Оксана Лут и глава Минпромторга Антон Алиханов. Подписанный Путиным указ об отставке Старовойта с поста главы Минтранса был опубликован 7 июля. В тот же день стало известно, что он покончил жизнь самоубийством. По словам Пескова, президенту доложили о случившемся «незамедлительно». Похоронить бывшего министра транспорта планируют в Санкт-Петербурге. Фото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБКФото: Андрей Любимов / РБК Читайте РБК в Telegram.	5	\N	2025-07-10 13:55:02	2025-07-10 13:55:02
1419	6085	kreml-nazval-glavnoe-uslovie-dlya-vozobnovleniya-raboty-aeroporta-v-krymu	Кремль назвал главное условие для возобновления работы аэропорта в Крыму	https://s0.rbk.ru/v6_top_pics/media/img/8/06/347521431666068.jpeg	Аэропорт в Крыму возобновит работу, когда появятся необходимые условия — безопасность полетов и пассажиров, заявил Песков. Накануне Минтранс объявил об открытии аэропорта Геленджика. Власти также допускали полеты в Симферополь Фото: Максим Константинов / Global Look Press При принятии решений о возобновлении работы аэропортов во главе угла стоят вопросы безопасности, заявил пресс-секретарь президента России Дмитрий Песков, передает корреспондент РБК. Журналисты обратили внимание на планы по возобновлению работы аэропорта Геленджика, о которых Минтранс объявил 9 июля. Пескова спросили, как в Кремле оценивают перспективы открытия аэропортов в Крыму, а также других приграничных регионах. «Это не наша прерогатива, это прерогатива Минтранса, наших военных, специальных ведомств. Главный аспект, который принимается во внимание, — это безопасность, обеспечение безопасности полетов, пассажиров — это то, что стоит во главе угла. Как только условия созреют для этого, то запустится, конечно же, и Крым», — сказал Песков. rbc.group Росавиация назвала дату готовности аэропорта Геленджика к принятию рейсов Общество rbc.group Воздушная гавань в Геленджике так же, как и другие десять аэропортов на юге России, не принимала и не отправляла рейсы с февраля 2022 года. Росавиация приостановила их работу по соображениям безопасности после начала боевых действий на Украине. Предполагается, что самолеты начнут летать на курорт 18 июля. На этой неделе руководитель Росавиации Дмитрий Ядров и глава Крыма Сергей Аксенов обсуждали возможное возобновление работы аэропорта в Симферополе. Аксенов заявил о готовности немедленно открыть воздушную гавань при получении соответствующего распоряжения от президента Владимира Путина. Он отметил, что авиация остается для Крыма основным видом транспорта, без которого республика теряет определенную долю туристов. Читайте РБК в Telegram.	4	\N	2025-07-10 13:55:02	2025-07-10 13:55:02
1420	6187	ukraina-peredala-rossii-dvoih-detey-pri-posrednichestve-katara	Украина передала России двоих детей при посредничестве Катара	https://s0.rbk.ru/v6_top_pics/media/img/4/16/347521441731164.jpeg	Две сестры в возрасте 10 и 6 лет, находившиеся на Украине, воссоединились с близкими в России, рассказала Львова-Белова. Участие в переговорах с украинской стороной принял Катар, содействие в возвращении детей оказал Красный Крест Мария Львова-Белова (Фото: пресс-служба Совета Федерации / АГН «Москва») Аппарат уполномоченного при президенте России по правам ребенка при посредничестве Катара вернул еще двоих детей, которые находились на территории Украины, сообщила детский омбудсмен Мария Львова-Белова. «Продолжаем нашу работу по воссоединению детей с близкими в России, на Украине и в других странах. В этот раз с Украины в Россию к маме при нашем содействии приехали две дочери», — сказала Львова-Белова. Девочкам десять и шесть лет. Омбудсмен рассказала, что на Украине две сестры оказались в 2020 году, когда поехали в гости вместе с бабушкой. Однако из-за коронавирусных ограничений и начала военной операции не смогли вернуться в Россию, где их ждала мама. rbc.group «Мы взяли ситуацию в работу, чтобы помочь в воссоединении семьи. Спасибо Государству Катар — за участие в переговорах с украинской стороной, транспортные и другие расходы, сопровождение детей и их близких. Помогал Международный комитет Красного Креста, представители профильных ведомств», — отметила она. rbc.group Омбудсмен заявила о подготовке списка детей для возвращения в Россию Политика На сегодняшний день с учетом вернувшихся девочек с родственниками в России воссоединились 24 ребенка из 16 семей, с родственниками на Украине и в третьих странах — 101 ребенок из 81 семьи. Во время второго раунда переговоров в Стамбуле, который прошел 2 июня, украинская делегация передала российской стороне список детей, которых хочет вернуть. Глава российской делегации Владимир Мединский рассказал, что в нем было указано 339 имен. Он подчеркнул, что это «никем не похищенные» дети, а «с риском вытащенные из зоны боевых действий». В Кремле также отмечали, что речь идет об «эвакуации» и случаев разделения семей не было. Уполномоченная украинского президента по правам ребенка Дарья Герасимчук после начала боевых действий заявила, что Россия «депортировала» 11 тыс. детей. Читайте РБК в Telegram.	2	\N	2025-07-10 14:55:04	2025-07-10 14:55:04
1421	6189	mid-raskryl-temy-peregovorov-rubio-i-lavrova-v-kuala-lumpure	МИД раскрыл темы переговоров Рубио и Лаврова в Куала-Лумпуре		Video Глава российского МИДа Сергей Лавров на полях саммита АСЕАН в Куала-Лумпуре обменялся мнениями с госсекретарем США Марко Рубио по урегулированию вокруг Украины, обстановке вокруг Ирана и Сирии, а также ряду других международных проблем, заявили в ведомстве. Там сообщили, что в развитие договоренностей президентов России и США, в том числе достигнутых по итогам последнего телефонного разговора 3 июля, министр и глава Госдепартамента провели «обстоятельную сверку часов по всему спектру вопросов двусторонней повестки дня и ситуации в мире». «Состоялся предметный и откровенный обмен мнениями по урегулированию вокруг Украины, обстановке вокруг Ирана и Сирии, а также ряду других международных проблем», — сказано в заявлении на сайте МИДа. Лавров и Рубио завершили переговоры в Куала-Лумпуре Политика rbc.group Стороны подтвердили обоюдный настрой на поиск «мирных развязок конфликтных ситуаций», восстановление российско-американского экономического и гуманитарного сотрудничества, а также беспрепятственных контактов между обществами двух стран. Последнему, в частности, могло бы способствовать возобновление прямого авиасообщения, отмечается в заявлении МИДа. Материал дополняется Читайте РБК в Telegram.	6	2025-07-10 15:30:38	2025-07-10 15:05:02	2025-07-10 15:30:38
1423	6251	kak-rossiya-i-ssha-reanimiruyut-otnosheniya-drug-s-drugom-infografika	Как Россия и США «реанимируют» отношения друг с другом. Инфографика		Лавров и Рубио обсудили Украину, ситуацию вокруг Ирана и Сирии, а также двусторонние отношения на министерском саммите АСЕАН в Куала-Лумпуре. Как Москва и Вашингтон «реанимируют» отношения двух стран — в инфографике РБК Как общаются президенты 3 июня президенты России и США Владимир Путин и Дональд Трамп провели телефонный разговор. Лидеры обсудили конфликты на Украине и на Ближнем Востоке. На вопрос американского лидера о перспективах прекращения огня, Путин ответил, что страна продолжает поиск «политического переговорного решения». Возможность личной встречи президентов не обсуждалась, отмечают в Кремле. rbc.group Это уже шестой разговор Путина и Трампа: до этого они созванивались 12 февраля, 18 марта, 19 мая, 4 и 14 июня. rbc.group Трамп сообщил о намерении Путина ответить на атаку ВСУ на аэродромы Политика Как США и Россия восстанавливают диалог Возвращение Дональда Трампа в Белый дом оживило контакты Вашингтона и Москвы, фактически остановленные после начала военной операции на Украине. Диалог идет на разных уровнях — от экспертного до высшего. Стороны проводят телефонные беседы, переговорщики ездят в Россию и США, а также проводят встречи в третьих странах. С начала февраля количество подтвержденных контактов между властями России и США превысило 25. 18 февраля в Саудовской Аравии прошли первые за три года полноценные российско-американские переговоры, в том же месяце две делегации встретили в Стамбуле. Среди вопросов, которые обсуждались, были боевые действия на Украине, возобновление работы посольств в Москве и Вашингтоне, а также подготовка к возможной встрече на высшем уровне. Встреча президентов может состояться в ближайшие месяцы, говорил в конце марта спецпосланник Трампа Стивен Уиткофф. С начала февраля он летал в Россию четыре раза: 11 февраля, 13 марта, 11 и 25 апреля. Все три раза его принимал Путин (первую встречу Кремль не прокомментировал, остальные объявлял официально). Как прошли «библиотечные» переговоры Путина с посланником Трампа. Главное Политика В начале апреля в Вашингтон прилетал спецпредставитель Путина по инвестиционно-экономическому сотрудничеству с зарубежными странами глава РФПИ Кирилл Дмитриев. По данным CNN, ради этого визита с него даже временно сняли американские санкции. Трамп в начале марта заявил, что «хорошо ладит» с Владимиром Путиным, хоть и придерживается жесткой позиции в отношении России. Российский президент, в свою очередь, признавал, что администрация Трампа «делает все возможное» для восстановления диалога с Москвой. 13 апреля пресс-секретарь президента России Дмитрий Песков отмечал, что «реанимировать отношения» с США приходится практически с нуля и не стоит ждать «сиюминутных результатов».	2	\N	2025-07-10 15:35:03	2025-07-10 15:35:03
1424	6317	sobyanin-soobshchil-ob-unichtozhenii-dvuh-dronov-na-podlete-k-moskve	Собянин сообщил об уничтожении двух дронов на подлете к Москве	https://s0.rbk.ru/v6_top_pics/media/img/5/43/347521520837435.jpeg	Фото: Алексей Коновалов / ТАСС Российские средства ПВО уничтожили дрон на подлете к Москве, сообщил в телеграм-канале мэр города Сергей Собянин. «ПВО Минобороны сбили беспилотник, летевший на Москву. На месте падения обломков работают специалисты экстренных служб», — говорится в сообщении, которое мэр опубликовал в 15:44. Через 24 минуты Собянин написал об уничтожении еще одного летевшего на Москву беспилотника. Предыдущий раз Собянин сообщал об уничтожении беспилотников на подлете к Москве в ночь на 9 июля, тогда силы ПВО сбили два дрона. В целях обеспечения безопасности столичный аэропорт Шереметьево вводил ограничения на прием и выпуск воздушных судов. Силы ПВО уничтожили ночью 14 дронов Политика Вечером 6 июля ПВО сбила шесть беспилотников, летевших на Москву. rbc.group Ранее Минобороны сообщило об уничтожении за прошедшие сутки 185 беспилотников. rbc.group Читайте РБК в Telegram.	5	\N	2025-07-10 16:25:03	2025-07-10 16:25:03
1425	6324	solnechnaya-energiya-vpervye-stala-glavnym-istochnikom-energii-v-es	Солнечная энергия впервые стала главным источником энергии в ЕС	https://s0.rbk.ru/v6_top_pics/media/img/1/94/347521532676941.jpeg	Солнечная энергетика обходит по объемам производства электроэнергии атомные станции и ветрогенераторы, однако технологий для накопления таких объемов электроэнергии пока не существует Фото: Christopher Furlong / Getty Images Солнечная энергия впервые стала главным источником энергии в ЕС, передает Reuters со ссылкой на данные аналитической компании Ember. В июне ее доля в общем объеме выработки составила 22,1%, что выше прошлогоднего показателя (18,9%). Атомные электростанции и ветрогенераторы суммарно произвели 21,8% и 15,8% электроэнергии в странах ЕС соответственно. Анализ Ember показывает, что не менее 13 стран Евросоюза, в том числе Германия, Испания и Нидерланды, достигли наивысших месячных объемов производства электроэнергии, полученной от солнечных панелей. Так, по данным Bloomberg, в четверг Франция достигла рекордного уровня выработки солнечной энергии, что привело к падению цен ниже нуля из-за переизбытка дешевой электроэнергии в сетях. rbc.group Согласно данным оператора энергосистемы RTE, в 14:00 по парижскому времени солнечные электростанции страны выработали рекордные 19,5 гигаватт, что покрыло почти 40% национального спроса на электроэнергию. rbc.group Электроэнергия, как и нефть с газом, торгуется на оптовых рынках, но имеет ключевое отличие: если топливо можно хранить в резервуарах до востребования, то технологий для накопления таких объемов электроэнергии пока не существует. Поскольку электричество производится и потребляется мгновенно, цены могут уходить в отрицательную зону, когда генерация значительно превышает спрос, а излишки невозможно сохранить для будущего использования.	4	\N	2025-07-10 16:25:04	2025-07-10 16:25:04
1426	6328	kakie-rossiyskie-aeroporty-ostayutsya-zakrytymi-s-fevralya-2022-goda-karta	Какие российские аэропорты остаются закрытыми с февраля 2022 года. Карта	https://s0.rbk.ru/v6_top_pics/media/img/3/56/347521474849563.jpeg	Аэропорт Геленджика возобновляет работу, на следующей неделе он примет первый рейс. Какие российские аэропорты остаются закрытыми с февраля 2022 года — на карте РБК Фото: пресс-служба аэропорта Геленджик 24 февраля 2022 года Росавиация объявила о приставке работы 11 аэропортов на юге и в центральной части России. Оказались закрыты воздушные гавани Анапы, Белгорода, Брянска, Воронежа, Геленджика, Краснодара, Курска, Липецка, Ростова-на-Дону, Симферополя и Элисты. Изначально меры ввели до 2 марта, но позднее многократно продлевали (после 49-го уведомления о продлении запрета на полеты Росавиация прекратила их публикацию). РЖД ввели дополнительные поезда в города, оставшиеся без авиасообщения. rbc.group Как открывали аэропорты rbc.group В середине декабря 2023 года тестовый рейс принял аэропорт Краснодара. Полет из Минеральных Вод выполнили без пассажиров для проверки всех аспектов взаимодействия диспетчерских и аэропортовых служб, уточнили в Росавиации. Воздушную гавань не открыли. Регион регулярно подвергается атакам беспилотников. В начале мая 2024 года Росавиация сняла ограничения на выполнение полетов в аэропорт Элисты. Он работает ежедневно с 9:00 до 19:00 мск. Открытие полетов в Геленджик оценили как двукратный рост числа туристов Общество 9 июля 2025 года Минтранс объявил об открытии аэропорта Геленджика. Росавиация уточнила, что воздушная гавань сможет принимать и отправлять рейсы уже с четверга, 10 июля, полеты будут выполняться с 8:30 до 20:00 мск. «Аэрофлот» открыл продажу билетов в Геленджик с 18 июля.	10	\N	2025-07-10 16:25:04	2025-07-10 16:25:04
1427	6370	evrokomissiya-obyavila-o-sozdanii-fonda-rekonstrukcii-ukrainy	Еврокомиссия объявила о создании фонда реконструкции Украины	https://s0.rbk.ru/v6_top_pics/media/img/7/56/347521474133567.jpeg	Италия, Германия, Франция и Европейский инвестиционный банк решили создать фонд восстановления Украины. Фон дер Ляйен также объявила о согласии выделить Киеву еще два транша на €1 и €3 млрд. Всего Украина получила от ЕК €165 млрд Урсула фон дер Ляйен (Фото: Yves Herman / Reuters) Глава Еврокомиссии Урсула фон дер Ляйен объявила о создании крупнейшего фонда прямых инвестиций на Украине. Первоначальный капитал фонда составит €220 млн, а к 2026 году европейские союзники рассчитывают привлечь €500 млн. Также фон дер Ляйен представила новый пакет соглашений с международными и государственными финансовыми учреждениями на сумму €2,3 млрд для поддержки усилий Украины по восстановлению и реконструкции. Этот новый пакет включает в рамках программы инвестиций €1,8 млрд в виде кредитных гарантий, остальные средства — €580 млн — в виде грантов. Ожидается, что программа позволит привлечь до €10 млрд инвестиций. «ЕС подтверждает свою роль самого сильного партнера Украины, не просто ее главного донора, но и ключевого инвестора в ее будущее. Мы стремимся привлечь до €10 млрд на восстановление предприятий, открытие больниц и обеспечение энергетической безопасности. Европа на стороне Украины — сегодня и завтра», — сказала фон дер Ляйен на конференции по восстановлению Украины в Риме (цитата по сайту Еврокомиссии). rbc.group Bloomberg узнал о желании ЕС создать фонд в €100 млрд для поддержки Киева Политика rbc.group Поддерживаемый Еврокомиссией фонд реконструкции Украины создан при сотрудничестве с Европейским инвестиционным банком, Францией, Германией, Италией и Польшей. Он будет способствовать развитию экосистемы прямых инвестиций на Украине, привлекая новый капитал и объединяя игроков рынка, отметила фон дер Ляйен. Также Еврокомиссия объявила о выделении Украине €1 млрд в рамках шестого транша пакета макрофинансовой помощи, общий размер которого составляет €18,1 млрд. Параллельно с этим европейские союзники одобрили передачу €3,05 млрд из фонда поддержки Украины. На поддержку Украины Евросоюз за три прошедших года направил уже €165 млрд, а по состоянию на 2025 год финансирование из Брюсселя закрывает 84% бюджетных расходов Киева, обратила внимание фон дер Ляйен. Россия осуждает любую поддержку Украины со стороны Запада — как военную, так и финансовую. Читайте РБК в Telegram.	5	\N	2025-07-10 16:55:01	2025-07-10 16:55:01
1475	7090	sledovateli-prishli-s-obyskami-v-administraciyu-mahachkaly	Следователи пришли с обысками в администрацию Махачкалы		В администрации Махачкалы и двух управлениях мэрии прошли обыски. Следственные действия связаны с уголовным делом о халатности при расселении жителей аварийного общежития. Непригодным для проживания его признали в 2017 году Video Следственным отделом по Советскому району Махачкалы СУ СК по Дагестану возбуждено уголовное дело по факту халатности при расселении аварийного общежития. В рамках дела следователи провели обыски в администрации Махачкалы и двух управлениях мэрии — МКУ «Управление по делам ГО и ЧС города Махачкалы» и МКУ «Управление по жилищным вопросам». В пресс-службе регионального СК уточнили, что речь идет об общежитии № 2, которое расположено на улице Азизова в Ленинском районе Махачкалы. Несмотря на то что в 2017 году здание было признано аварийным и подлежащим сносу, жильцам до сих пор не предоставили благоустроенное жилье. Ситуацию усугубил произошедший в прошлом году пожар, в результате которого четвертый этаж общежития оказался полностью разрушен и не пригоден для проживания. «Должностными лицами администрации в нарушение действующего законодательства жилые помещения лицам, проживающим в общежитии, взамен аварийных не предоставлены, материальная помощь не оказана, чем существенно нарушены права и законные интересы граждан», — заявили в СУ СК по Дагестану. В ходе расследования уголовного дела признаны потерпевшими и допрошены в этом качестве 33 лица, проживающих в общежитии. «Принимаются меры по предоставлению временного жилья и выплаты материальной помощи семьям, чьи жилые помещения и имущество уничтожены полностью либо частично», — отметили в ведомстве. В ближайшее время руководитель СУ СК России по Дагестану Дмитрий Беляев проведет личный прием потерпевших по уголовному делу. rbc.group Проверить ситуацию с аварийным общежитием в Махачкале 17 июня потребовал председатель СК Александр Бастрыкин. В СК обратилась жительница Дагестана, сообщившая о неудовлетворительном состоянии общежития, построенного более 50 лет назад. Она рассказала, что кровля здания разрушена, конструкции приходят в негодность, помещения затапливаются, а инженерные системы изношены. Из-за непригодного для проживания состояния общежития женщина, имеющая на иждивении ребенка-инвалида, вынуждено переехала в арендованную квартиру, сообщали тогда в ведомстве. Читайте РБК в Telegram.	1	\N	2025-07-11 16:55:03	2025-07-11 16:55:03
1428	6383	nspk-nazvala-prichinu-sboev-v-rabote-sbp	НСПК назвала причину сбоев в работе СБП	https://s0.rbk.ru/v6_top_pics/media/img/1/96/347521551972961.jpeg	Фото: Михаил Гребенщиков / РБК Скорость обработки операций по системе быстрых платежей (СБП) замедлилась в результате неполадок в работе одного из провайдеров. Об этом сообщила пресс-служба Национальной системы платежных карт (НСПК). «Из-за инцидента на стороне провайдера мы фиксируем увеличение времени обработки операций по СБП. Мы сообщим дополнительно, когда все сервисы вновь начнут работать в штатном режиме», — говорится в сообщении. СБП предупредила о проблемах с оплатой из-за ограничений сети в Москве Общество rbc.group 10 июля пользователи интернет-банкинга начали сообщать сбоях в работе сервиса СБП — количество жалоб резко взлетело с 16:00. следует из данных сервиса Downdetector. Также сообщают о проблемах в работе банковских приложений. rbc.group СБП была запущена Банком России и НСПК в начале 2019 года. Система позволяет банковским клиентам в режиме реального времени переводить деньги между счетами разных банков по номеру мобильного телефона, привязанному к счету. Минимальный суточный лимит переводов в СБП, который может установить банк для своего клиента, составляет 150 тысяч рублей. С 1 января 2021 года система стала доступна клиентам большинства банков. Читайте РБК в Telegram.	1	\N	2025-07-10 17:05:02	2025-07-10 17:05:02
1429	6386	mvd-nazvalo-razmer-vzyatki-arbitru-za-pomoshch-torpedo-v-reshayushchem-matche	МВД назвало размер взятки арбитру за помощь «Торпедо» в решающем матче		Футбольный арбитр Богдан Головко, которого 8 июля задержали по подозрению в совершении сознательной ошибки в пользу «Торпедо», был отправлен под домашний арест Главному судье матча «Торпедо» — «Камаз» Богдану Головко были переданы 1,5 млн рублей. Об этом в своем Telegram-канале сообщила официальный представитель МВД России Ирина Волк. «Предварительно установлено, что руководителями клуба через посредника главному судье матча переданы денежные средства в сумме 1,5 млн рублей за оказание противоправного влияния на результат данного спортивного соревнования», — сказала Волк. Представитель МВД России отметила, в жилищах главного арбитра матча и посредника проведены обыски, в результате которых были изъяты средства связи и другие предметы, имеющие доказательственное значение. rbc.group Головко предъявлены обвинения по ст. 184 УК за оказание противоправного влияния на результат официального спортивного соревнования, ему грозит до семи лет лишения свободы. Арбитр на данный момент отправлен под домашний арест. rbc.group Во вторник, 8 июля, РБК со ссылкой на источники сообщил, что был задержан футбольный арбитр Богдан Головко по подозрению в совершении сознательной ошибки в пользу «Торпедо» в матче заключительного тура Первой лиги с «Камазом». Отмечалось, что судья не поставил пенальти в ворота «Торпедо». КДК РФС 10 июля исключил «Торпедо» из РПЛ «за попытку организации договорных матчей в футбольных соревнованиях». В заявлении РФС говорилось о трех матчах с участием «Торпедо» (игра против "Камаза" упомянута не была). В июне владелец «Торпедо» Леонид Соболев и директор клуба Валерий Скородумов были отправлены в СИЗО по делу об оказании противоправного влияния на результат матчей с участием клуба. Они предложили судье взятку, но последний отказался.	6	\N	2025-07-10 17:05:03	2025-07-10 17:05:03
1430	6412	u-beregov-sen-trope-zagorelas-superyahta	У берегов Сен-Тропе загорелась суперъяхта		Пожар произошел на яхте Sea Lady II. Она была построена в 1986 году и отремонтирована в 2024-м. Судно ходит под мальтийским флагом и предлагается в аренду за €80 тыс. Video Во Франции в порту Сен-Тропе загорелась 41-метровая суперъяхта Sea Lady II, сообщает газета Nice-Matin. По данным издания, дым начал подниматься около 20:00 (21:00 мск) 10 июля, вскоре после задымления загорелась носовая часть яхты. Прибывшие на место пожарные начали тушить огонь с помощью пожарных машин и пожарного катера, к 21:00 (22:00 мск) они смогли подняться на борт, но затем огонь перекинулся на нижнюю палубу Sea Lady. Как сообщает France Bleu, в борьбе с огнем принимали участие около 30 пожарных. Россиянина задержали в США при попытке угнать яхту Общество По состоянию на 23:00 (00:00 мск) пожар все еще продолжается на трех верхних палубах. Двое мужчин в возрасте 24 и 30 лет, которые надышались дымом от горящего пластика, были эвакуированы с яхты. rbc.group Как сообщили источники издания, пожар начался с кокпита (место для размещения экипажа. — РБК), размещенного на третьей палубе. Для защиты Средиземного моря от загрязнения вокруг яхты было установлено боновое заграждение (плавучая преграда, изготовленная из прочных материалов и предназначенная для ограничения распространения загрязняющих веществ. — РБК). По информации France Bleu, яхта Sea Lady II была построена в 1986 году и отремонтирована в 2024-м. Судно ходит под мальтийским флагом и предлагается в аренду за €80 тыс. евро в неделю без учета сборов. Читайте РБК в Telegram.	4	\N	2025-07-11 08:05:03	2025-07-11 08:05:03
1431	6408	sboy-proizoshel-v-rabote-steam	Сбой произошел в работе Steam		Пользователи также сообщили о проблемах с загрузкой игр Dota 2 и Counter-Strike 2 Сбой произошел в работе игрового сервиса Steam, следует из данных сервисов Downdetector и «Сбой. рф». По данным Downdetector, к 01:30 мск поступила 1571 жалоба. «Сбой.рф». зафиксировал 1279 сообщений о неполадках к 01:15. Пользователи жалуются на проблемы с соединением, входом в личный кабинет, загрузкой Steam. Больше всего жалоб поступило из Москвы, Санк-Петербурга и Подмосковья, следует из данных «Сбой. рф». rbc.group Пользователи также сообщают о проблемах с загрузкой игр Dota 2 и Counter-Strike 2. rbc.group Steam опроверг утечку данных об аккаунтах пользователей Технологии и медиа В прошлый раз перебои в работе платформы Steam фиксировались в апреле. Тогда сбой наблюдался не только в России, но и за рубежом. Пользователи, в частности, жаловались на то, что сервер «вылетает». Steam — это американский онлайн-магазин компьютерных игр, один из крупнейших в мире. Платформа принадлежит американской компании Valve Corp., которая изначально создавала его для продвижения игр своего производства, включая игры из серий Half-Life и Counter Strike. Позже в Steam стало появляться больше видеоигр других компаний. По данным SteamDB, только в 2023 году в Steam вышло 14,457 тыс. видеоигр. Читайте РБК в Telegram.	4	\N	2025-07-11 08:05:04	2025-07-11 08:05:04
1432	6410	politico-svyazalo-poshliny-trampa-dlya-brazilii-s-ego-gnevom-iz-za-briks	Politico связало пошлины Трампа для Бразилии с его гневом из-за БРИКС	https://s0.rbk.ru/v6_top_pics/media/img/1/74/347522083778741.jpeg	Президент США «злится каждый раз, когда видит усилия БРИКС по дедолларизации», рассказал бывший главный стратег Белого дома Стив Бэннон. МИД России заявлял, что «БРИКС — «не антиамериканское объединение» Дональд Трамп (Фото: Anna Moneymaker / Getty Images) Недовольство президента США Дональда Трампа саммитом БРИКС в Рио-де-Жанейро побудило его направить письмо с изложением новых пошлин в отношении Бразилии, пишет Politico со ссылкой на четыре источника. Трамп пригрозил Бразилии 50-процентными пошлинами, обвинив ее в «охоте на ведьм» против бывшего президента Жаира Болсонару, находящегося сейчас под следствием по делу о перевороте в 2022 году. По словам двух собеседников, Белый дом посчитал, что другие меры наказания, такие как санкции, займут слишком много времени или будут слишком сложными. rbc.group «Но БРИКС перевесил чашу весов», — пояснил бывший специальный посланник президента США по Латинской Америке Маурисио Клавер-Кароне, близкий соратник госсекретаря Марко Рубио. rbc.group Трамп пригрозил базовыми пошлинами в размере 15% или 20% Политика По словам бывшего главного стратега Белого дома Стива Бэннона, Трамп «злится каждый раз, когда видит усилия БРИКС по дедолларизации». «Рио не помог», — сказал он. Президент Бразилии Луис Инасиу Лула да Силва уже объявил, что введет ответные 50-процентные тарифы в отношении США. Американский лидер на днях пригрозил странам, поддерживающим БРИКС, десятипроцентными пошлинами. До этого он обещал 100-процентные тарифы, если объединение попытается заменить доллар, и утверждал, что «БРИКС мертв». Замглавы российского МИДа Сергей Рябков в ответ на слова главы Белого дома заверял, что БРИКС — «не антиамериканское объединение, и ничего в повестке дня БРИКС не содержит антиамериканской составляющей». В Кремле говорили, что страны БРИКС не обсуждают создание новой валюты, и предлагали экспертам «более подробно повестку дня БРИКС разъяснить» Трампу. Читайте РБК в Telegram.	4	\N	2025-07-11 08:05:04	2025-07-11 08:05:04
1433	6397	lavrov-peregovoril-s-rubio-na-vstreche-glav-mid-stran-uchastnic-vas	Лавров переговорил с Рубио на встрече глав МИД стран-участниц ВАС		Video Министр иностранных дел Сергей Лавров пообщался с госсекретарем США Марко Рубио на полях встречи министров иностранных дел стран-участниц Восточноазиатского саммита (ВАС) в Куала-Лумпуре, передает корреспондент РБК. Рубио подмигнул Лаврову. Видео Политика Накануне Лавров и Рубио провели переговоры, которые продлились около 50 минут. В МИДе сообщили, что стороны обменялись мнениями по урегулированию российско-украинского конфликта, обстановке вокруг Ирана и Сирии и другим международным проблемам. Также госсекретарь США и глава российского внешнеполитического ведомства отметили важность работы по нормализации деятельности дипмиссий в России и Соединенных Штатах. Это была вторая личная встреча Рубио и Лаврова. Первая состоялась в середине февраля в Эр-Рияде, когда Москва и Вашингтон возобновили двухсторонние контакты после прихода к власти в США новой администрации. rbc.group Читайте РБК в Telegram.	2	\N	2025-07-11 08:05:04	2025-07-11 08:05:04
1434	6400	rossiyskie-razrabotchiki-poprosili-zamenit-windows-pri-provedenii-ege	Российские разработчики попросили заменить Windows при проведении ЕГЭ	https://s0.rbk.ru/v6_top_pics/media/img/8/89/347521535131898.jpeg	Разработчики софта попросили проводить ЕГЭ только на российских операционках. Они считают, что текущие правила, разрешающие только Windows, нарушают законы об импортозамещении и создают риски безопасности данных школьников Фото: Максим Богодвид / РИА Новости Российские разработчики программного обеспечения попросили проводить единый госэкзамен (ЕГЭ) на отечественных операционных системах. Это следует из письма Ассоциации разработчиков программных продуктов (АРПП) «Отечественный софт» (объединяет более 300 российских IT-компаний, в том числе 1С, «Лабораторию Касперского» и др.) в адрес Минцифры, Рособрнадзора и Минпросвещения. Копия письма есть у РБК, ее подлинность подтвердил представитель Минцифры. В письме ассоциация ссылается на методические рекомендации Рособрнадзора по подготовке и проведению ЕГЭ в 2025 году: из них следует, что экзамен должен проводиться только на Windows (разработчик — американская Microsoft). Такое указание, по мнению АРПП, идет вразрез с действующим законодательством, которое обязывает госучреждения переходить на отечественное программное обеспечение. В частности, ассоциация привела в пример указ президента «О мерах безопасности критической информационной инфраструктуры», который с 1 января 2025-го обязал органы госвласти и их заказчиков не использовать иностранное ПО. Также с 1 января этого года действует постановление правительства №1875, которое запрещает закупки иностранного ПО, и предусматривает меры, стимулирующие закупки отечественного софта. С 1 сентября этого года также вступит в силу закон, который разрешит использовать на критических объектах только софта из реестра Минцифры. rbc.group Производитель заявил о риске сбоя канатных дорог из-за иностранного софта Бизнес rbc.group Помимо нарушения закона и госполитики в части импортозамещения использование иностранного ПО в школах несет финансовые и образовательные риски, указывает АРПП. В частности, зависимость от Windows делает экзаменационный процесс уязвимым: поддержка со стороны иностранного разработчика может быть прекращена из-за санкций, и такие системы потенциально могут передавать данные за пределы России, создавая риск утечки персональной информации учеников и учителей, что нарушает закон «О персональных данных». Покупка и обновление лицензий Windows требует постоянных бюджетных трат, а российские операционные системы часто предлагают более выгодные условия для госучреждений. Кроме того, используя только иностранную операционную систему, школьники и учителя лишаются возможности осваивать отечественные цифровые решения, что снижает их навыки работы с российскими технологиями, которые становятся все более востребованными на рынке труда, предупредила АРПП. РБК направил запрос в Рособрнадзор и Минпросвещения Исходя из указанных рисков ассоциация предлагает обеспечить интеграцию экзаменационных систем с отечественными операционками (Astra Linux от ГК «Астра», РЕД ОС от «Ред софт», ALT Linux от «Базальт СПО» и «РОСА ОС» от «НТЦ ИТ РОСА») и создать тестовую зону для проверки совместимости при обновлениях. Также, по мнению АРПП, нужно внести изменения в методички по подготовке и проведению ЕГЭ и закрепить в них использование российского офисного софта («Р7 Офис», «МойОфис»), исключив упоминание Windows. Представитель Минцифры уточнил, что для замены иностранных продуктов министерство рекомендует использовать решения из реестра отечественного софта. Сейчас, по его словам, там находится более 26,5 тыс. продуктов, среди которых есть и общесистемное ПО, и программы для образовательных учреждений. Бизнес попросил субсидии на замену зарубежного софта в строительстве Технологии и медиа В сентябре 2023 года министр просвещения Сергей Кравцов сообщал, что все российские школы полностью перешли на отечественное программное обеспечение. При этом в августе 2024-го глава комитета по информатизации образования АРПП «Отечественный софт» Анастасия Горелова заявляла, что примерно 60% школ и вузов перешли на российский софт, уточняя, что речь идет обо всех видах программного обеспечения, а не только операционных системах. Она отмечала, что не во всех образовательных учреждениях удалось заменить инженерный софт, а также ПО для станков и аналогичных устройств. В феврале 2025-го в реестр отечественного ПО включили операционную систему «Московской электронной школы» (ОС «МЭШ», разработчик — Департамент информационных технологий Москвы), которая работает на базе Linux. Правительство Москвы тогда сообщало, что в 2025 году школы Москвы будут проводить основной государственный экзамен (ОГЭ) на этой системе. Сооснователь и заместитель гендиректора Postgres Professional Иван Панченко отмечал, что «ОС МЭШ» — не новая операционная система, а «очередной дистрибутиве Linux, который заточен под школьные задачи». «ОС МЭШ» установлена на интерактивных панелях, моноблоках в компьютерных классах в школах столицы и на ноутбуках педагогов, создавая полноценную экосистему с поддержкой многочисленных устройств, рассказал РБК представитель ДИТ. В 2025 году, после включения в реестр отечественного софта, система впервые применялась для проведения итоговой аттестации школьников, включая основной и тренировочный ОГЭ в компьютерной и письменной формах, подготовку и печать необходимых материалов, а также перевод бланков участников в электронный вид в аудиториях пунктов проведения экзаменов. «Процесс выпускных испытаний прошел в штатном режиме, операционная система показала себя как стабильный, надежный и качественный инструмент», — дополнил представитель ДИТ. Читайте РБК в Telegram	9	\N	2025-07-11 08:05:05	2025-07-11 08:05:05
1435	6399	drozdenko-predupredil-o-snizhenii-signala-interneta-iz-za-ugrozy-bpla	Дрозденко предупредил о «снижении сигнала интернета» из-за угрозы БПЛА		Губернатор Ленинградской области Александр Дрозденко предупредил о «возможном частичном понижении сигнала мобильного интернета», об этом он сообщил в телеграм-канале. В регионе объявлена опасность БПЛА, сообщил он. Позднее представитель Росавиации Артем Кореняко сообщил, что в Пулково ввели временные ограничения на прием и выпуск рейсов. rbc.group Из-за атак дронов 6 июля в Санкт-Петербурге и области были зафиксированы проблемы с сотовой связью и мобильным интернетом. Дрозденко заявлял о «частичном понижении сигнала с 4G до 2G». rbc.group С 5 по 7 июля в Ленобласти отразили несколько атак беспилотников. 5 июля дроны были сбиты над Тосненским районом и Гатчинским округом. Вечером следующего дня два беспилотника были уничтожены в Киришском районе. Утром 7 июля еще три дрона сбили в Лужском районе. Губернатор говорил, что жертв и разрушений нет. На фоне атак было нарушено воздушное сообщение в петербургском аэропорту Пулково. Всего за период с 4 по 7 июля было отменено более 170 рейсов. Потери ООО «Воздушные ворота Северной столицы» (ВВСС, оператор аэропорта Пулково) оцениваются в 50-55 млн руб. Читайте РБК в Telegram.	2	\N	2025-07-11 08:05:05	2025-07-11 08:05:05
1437	6403	reuters-uznal-chto-ek-predlozhit-gibkiy-potolok-cen-na-rossiyskuyu-neft	Reuters узнал, что ЕК предложит гибкий потолок цен на российскую нефть	https://s0.rbk.ru/v6_top_pics/media/img/1/85/347521689197851.jpeg	ЕК предлагает автоматизированно устанавливать потолок цен на $15 ниже рыночной цены барреля, пишет Reuters. Власти подчеркивали, что потолок цен никак не влияет на экспорт российских ресурсов Фото: Максим Богодвид / РИА Новости Еврокомиссия предложит государствам Евросоюза ввести «гибкий» потолок цен на российскую нефть, который будет устанавливаться на $15 ниже рыночной цены барреля. Об этом сообщает агентство Reuters со ссылкой на четырех европейских дипломатов. Предложение может быть выдвинуто на этой неделе в рамках дискуссий о новом проекте пакета антироссийских санкций. Оно станет попыткой преодолеть возражения некоторых государств — членов Евросоюза насчет ввода ограничений. Действующий потолок цен заложен на уровне $60 за баррель. Однако колебания на рынках, вызванные июньским конфликтом Израиля и Ирана, сделали эту планку неактуальной, отмечает Reuters: на некоторое время мировые цены на нефть выросли до $80 за баррель, а затем снова упали. rbc.group Четыре источника в ЕС рассказали Reuters, что Еврокомиссия разрабатывает механизм, который позволит скорректировать ограничение с учетом изменений мировых цен на нефть. rbc.group Politico узнало об отказе ЕС от снижения потолка цен на российскую нефть Политика По словам одного из источников, документ все еще пересматривается и предусматривает более автоматизированный процесс пересмотра потолка цен для его адаптации к мировым ценам. Пока неясно, какой будет максимальная цифра, но отправной точкой может стать сумма чуть более $45 за баррель, сказал один из собеседников Reuters. Страны G7 ввели потолок цен на российскую нефть в декабре 2022 года. В феврале 2023 года начали действовать ограничения на нефтепродукты: $100 за баррель на дизтопливо (так как оно продается с наценкой по сравнению с сырой нефтью) и $45 за баррель на мазут, продающийся с дисконтом. Россия ввела ответные меры и запретила экспорт нефти и нефтепродуктов по контрактам, условия которых следуют потолку нефтяных цен. В середине июня Еврокомиссия предложила странам G7 снизить потолок цен на российскую сырую нефть с $60 до $45 за баррель в рамках 18-го пакета санкций. Однако средиземноморские страны выступили против этого требования. По сведениям Bloomberg, против снижения потолка цен на российскую нефть также оказались США. Эстония, в свою очередь, пригрозила заблокировать принятие 18-го пакета санкций Евросоюза против России, если из него исключат введение более низкого потолка цен на российскую нефть до $45 за баррель. Для введения новых санкций необходимо согласие всех стран — членов ЕС. Россия считает санкции западных стран незаконными и требует их отмены. Снижение потолка цен до $45 за баррель невыгодно самому Евросоюзу, потолок цен никак не влияет на экспорт российских ресурсов, говорил вице-премьер Александр Новак. «Да, это накладывает определенные изменения логистической инфраструктуры и так далее, но в целом наши объемы по производству и экспорту не изменились», — отмечал он. Читайте РБК в Telegram.	4	\N	2025-07-11 08:05:05	2025-07-11 08:05:05
1436	6405	reuters-soobshchil-o-planah-trampa-vpervye-vydelit-ukraine-paket-vooruzheniy	Reuters сообщил о планах Трампа впервые выделить Украине пакет вооружений	https://s0.rbk.ru/v6_top_pics/media/img/3/31/347522087197313.jpeg	До этого США при администрации Трампа только отправляли помощь, которая была одобрена еще при Байдене. Стоимость пакета может составить примерно $300 млн, в него могут войти в том числе Patriot, сообщает агентство Фото: Omar Marques / Getty Images Президент США Дональд Трамп впервые за второй президентский срок сам выделит Украине пакет вооружений, сообщает Reuters. До этого момента США при его администрации только отправляли поставки, которые были одобрены еще при предыдущем главе Белого дома Джо Байдене. Оружие для ВСУ будет взято из запасов Пентагона. Стоимость пакета вооружений может составить примерно $300 млн, в него планируют включить ракеты Patriot и наступательные ракеты средней дальности, окончательное решение о составе примут 10 июля, рассказали источники агентства. У правительства США остались $3,86 млрд, согласованных с конгрессом для выделения Украине. В последний раз средства для помощи украинской армии выделил Байден в начале января. rbc.group Трамп ответил на вопрос о приказе приостановить поставки оружия Украине Политика rbc.group На прошлой неделе Politico и NBC сообщили, что США приостановили отправку Украине некоторых видов вооружений. Белый дом объяснил решение ревизией американской военной помощи. По словам источников CNN, президент Дональд Трамп попросил главу Пентагона Пита Хегсета только оценить запасы оружия, но не останавливать поставки Киеву. Телеканал позднее уточнил, что Хегсет не сообщал Трампу о приостановке поставок на Украину. На этой неделе американский лидер заявил, что Соединенные Штаты отправят Украине новые партии оружия. Он также сказал, что был бы первым, кто узнал о паузе в поставках оружия Украине, или сам отдал бы такой приказ, но пока такого шага не предпринимал. По данным AP и Reuters, Вашингтон возобновил поставки артиллерийских боеприпасов и реактивных снарядов GMRLS. В Кремле, комментируя сообщения о приостановке поставок вооружений Киеву, заявляли: «Чем меньше ракет поступает на Украину, тем ближе конец специальной военной операции». Читайте РБК в Telegram.	10	\N	2025-07-11 08:05:05	2025-07-11 08:05:05
1438	6415	sovkombank-nashel-pokupatelya-na-biznes-centr-v-rayone-lubyanki	Совкомбанк нашел покупателя на бизнес-центр в районе Лубянки	https://s0.rbk.ru/v6_top_pics/media/img/2/47/347521654102472.jpeg	Совкомбанк продал здание бывшего доходного дома Романова в центре Москвы. Новым владельцем особняка в Большом Кисельном переулке стала West Wind Group, работающая с коммерческой недвижимостью Фото: Квар К. / сервис «Яндекс.Карты» Совкомбанк договорился с West Wind Group о продаже ей офисного комплекса в Большом Кисельном переулке рядом со станцией метро. «Лубянка». Об этом РБК рассказали два консультанта на рынке недвижимости, работавшие с объектом. По их словам, сделка находится на финальной стадии, а после завершения всех процедур покупатель станет владельцем здания общей площадью 6,7 тыс. кв. м. Представители West Wind Group, Совкомбанка и компании Ricci, которую участники рынка называют консультантом в этой транзакции, от комментариев отказались. Здание в Большом Кисельном переулке, по данным Росреестра, было построено в 1914 году. Когда-то на его месте находилась городская усадьба фабрикантов Затрапезных, которые еще в первой половине XVIII века объединили здесь несколько мелких дворов. Во время пожара 1812 года имение не пострадало, но в 1810-1830-х годах было решено его перестроить. В конце XIX века его собственником стал Н. Т. Подрезов-Тихонов, который согласовал здесь возведение доходного дома «для торговых и конторских помещений». После этого здание было вновь перестроено уже при новом владельце И.С. Романове, у него появились черты раннего модерна. В 1920-1930-ые годы здание надстроили пятым этажом. rbc.group Burberry продлил аренду офиса в центре Москвы на фоне закрытия бутиков Бизнес rbc.group Объект несколько раз менял собственника, свидетельствуют данные системы СПАРК. К примеру, в 2000-ые годы им владело агентство «Недвижимость, капитал, интеграция» и компания «Александр Хаус». А в 2014 году здание перешло на баланс банка «Восточный», который в 2021 году приобрел Совкомбанк. Скорее всего, решение о продаже комплекса связано со стратегией финансовой организации по реализации непрофильных активов, полагает директор по направлению рынков капитала IBC Real Estate Николай Горюнов. Об этом же говорит и исполнительный директор Remain Александр Богданов. Стоимость офисного комплекса в Большом Кисельном переулке Горюнов оценивает в 1,2-1,3 млрд руб. Богданов говорит о 1,2-1,4 млрд руб.  Логичнее всего сделать здесь гибкий офис, рассуждает Горюнов, добавляя, что это может потребовать вложения в размере 700-800 млн руб. Выкупающая объект West Wind Group была создана в 2004 году, она специализируется на редевелопменте офисных и административных зданий, бизнес-центров, а также управлении коммерческой недвижимостью. Среди ее проектов — комплексы «Сады Этрета» на Цветном бульваре, Arkenston на улице Усачева, Sugar Factory на Земляном валу. Читайте РБК в Telegram.	9	\N	2025-07-11 08:15:01	2025-07-11 08:15:01
1439	6419	semafor-rasskazal-o-zakodirovannyh-poslaniyah-trampa-rossii-i-ukraine	Semafor рассказал о «закодированных посланиях» Трампа России и Украине	https://s0.rbk.ru/v6_top_pics/media/img/6/89/347521727726896.jpeg	Трамп сменой риторики хочет дать понять Путину и Зеленскому, что «все возможно, если они не отступят», сказал Semafor источник. В Кремле говорили, что «достаточно спокойно» относятся к ужесточению риторики республиканца Дональд Трамп (Фото: Nathan Howard / Reuters) Президент США Дональд Трамп сменой риторики относительно российско-украинского конфликта направляет «закодированные послания» Киеву и Москве. Об этом изданию Semafor заявил источник, близкий к главе государства. «И [президенту России Владимиру] Путину, и [украинскому президенту Владимиру] Зеленскому важно знать: все возможно, если они не отступят», — сказал изданию собеседник. Некоторые соратники Трампа, с которыми поговорил Semafor, назвали смену риторики частью его переговорной стратегии, остальные уверены в сдвиге позиции республиканца. rbc.group «Президент стал немного активнее противостоять Владимиру Путину», — заявила Semafor сенатор-республиканец от штата Айова Джони Эрнст. Российский президент, по ее мнению, «играет с Соединенными Штатами», и Трамп это понимает. rbc.group Рубио назвал вариант дальнейших действий США в отношении России Политика США после прихода Трампа к власти попытались выступить посредником в урегулировании конфликта России и Украины. Республиканец возобновил контакты с российским коллегой, а с Зеленским в конце февраля вступил в открытый конфликт после перепалки в Белом доме на публике. В начале июля Трамп в очередной раз созвонился с Путиным, после чего заявил о своем недовольстве разговором. Он посетовал, что не смог добиться прогресса в урегулировании на Украине. В Кремле в ответ сослались на слова Путина, что Россия заинтересована в урегулировании конфликта, предпочтительно, политико-дипломатическими средствами. «Но пока это не представляется возможным, мы продолжаем нашу спецоперацию», — сказал пресс-секретарь российского президента Дмитрий Песков. После беседы с Путиным Трамп поговорил с Зеленским и пообещал поставить Украине больше оружия. Накануне президент США вновь заявил, что недоволен действиями Путина и рассматривает возможность «устроить маленький сюрприз» России. Так он ответил на вопрос о готовности ввести санкции против Москвы. В Кремле «достаточно спокойно» относятся к тому, что Трамп стал жестче высказываться по отношению к Путину, ответил на это Песков. Трамп рассматривает ужесточение санкций против России как «реальный вариант», но ему нужна гибкость в вопросах, как и когда будут применяться ограничения: это дает «максимальное влияние в любом разговоре и переговорах», говорил госсекретарь США Марко Рубио. Москва считает санкции западных стран незаконными и осуждает военную помощь Киеву. Читайте РБК в Telegram.	3	\N	2025-07-11 08:15:01	2025-07-11 08:15:01
1440	6424	zelenskiy-obyasnil-pochemu-peregovory-s-rossiey-poka-nevozmozhny	Зеленский объяснил, почему переговоры с Россией пока невозможны	https://s0.rbk.ru/v6_top_pics/media/img/2/28/347521723711282.jpeg	Пока Россия и Украина не завершат обмены, согласованные по итогам предыдущих переговоров, нового раунда не будет, заявил Зеленский. Кремль подтверждал, что дата очередной встречи будет определена после завершения обменов Владимир Зеленский (Фото: Paolo Giandotti / Reuters) Новых переговоров России и Украины пока не будет, поскольку еще не завершились обмены, согласованные по итогам предыдущих раундов. Об этом заявил украинский президент Владимир Зеленский на брифинге после саммита в Риме, передает «РБК-Украина». «Мы должны завершить результат, о котором стороны договорились на второй встрече. А именно закончить с теми обменами, которые были оговорены на второй встрече в Стамбуле. И я думаю, что в ближайшее время соответствующие движения осуществятся», — сказал он. Зеленский добавил, что «после этого команды могут обсуждать подготовку встречи на уровне лидеров». rbc.group «Как я и говорил ранее, мы готовы к любому формату. Безусловно, Украина, Россия и Америка на уровне лидеров — это желательный формат», — сказал украинский президент. rbc.group Кремль назвал интерес Украины в переговорах словами «мы идем вперед» Политика Украина и Россия после трехлетнего перерыва в переговорах провели две встречи в Стамбуле — делегации встречались 16 мая и 2 июня. На последних переговорах стороны обменялись проектами меморандумов с предложениями по прекращению огня, содержание документов и с российской, и с украинской стороны было раскрыто. Практическим итогом встреч стали обмены военнопленными, в том числе тяжелоранеными и теми, кто моложе 25 лет, а также телами погибших бойцов. В июне, в частности, Россия передала Украине останки свыше 6 тыс. человек. Стороны провели обмен пленными в несколько этапов, численность возвращенных Москве и Киеву не раскрывалась. Кремль подтверждал, что дата третьего раунда переговоров с Украиной определится после того, как стороны завершат обмены пленными. Глава МИД России Сергей Лавров говорил, что сроки уже согласовываются. Россия ждет предложений от украинской стороны, подвижек касательно даты новых переговоров пока не было, сообщил пресс-секретарь российского президента Дмитрий Песков 8 июля.	2	\N	2025-07-11 08:15:01	2025-07-11 08:15:01
1441	6445	v-tulskoy-oblasti-iz-za-ataki-dronov-pogib-chelovek	В Тульской области из-за атаки дронов погиб человек	https://s0.rbk.ru/v6_top_pics/media/img/1/32/347522113008321.jpeg	Фото: Дарья Широкова / РБК В Тульской области при атаке дронов погиб один человек, еще один пострадал, сообщил губернатор Дмитрий Миляев в телеграм-канале. «К сожалению, один человек погиб, еще один получил ранения. Пострадавшему оказана необходимая медицинская помощь», — рассказал он. По данным Минобороны, над регионом ночью сбили 13 беспилотников. Миляев добавил, что опасность атаки дронов сохраняется. rbc.group Ранее о гибели человека во время ночной атаки беспилотников сообщили власти Липецкой области. rbc.group Материал дополняется	3	\N	2025-07-11 08:35:02	2025-07-11 08:35:02
1442	6447	v-taganroge-oblomki-drona-upali-na-territorii-aviastroitelnogo-kompleksa	В Таганроге обломки дрона упали на территории авиастроительного комплекса	https://s0.rbk.ru/v6_top_pics/media/img/3/31/347522118292313.jpeg	Фото: Вячеслав Прокофьев / ТАСС В Таганроге обезврежен дрон, его обломки упали на территории Таганрогского авиационного научно-технического комплекса имени Г. М. Бериева (ТАНТК), сообщила мэр Светлана Камбулова в телеграм-канале. «Пострадавших нет. Работают оперативные группы», — отметила она. Ранее в городе была объявлена воздушная опасность. Материал дополняется	9	\N	2025-07-11 08:35:02	2025-07-11 08:35:02
1443	6468	izvestiya-uznali-o-priostanovke-remonta-avianosca-admiral-kuznecov	«Известия» узнали о приостановке ремонта авианосца «Адмирал Кузнецов»	https://s0.rbk.ru/v6_top_pics/media/img/2/17/347522122154172.jpeg	Эксперты допустили, что «Адмирал Кузнецов», который был спущен на воду в 1985 году, могут списать и отправить на утилизацию. Крейсер встал на ремонт в 2018 году после возвращения из Средиземного моря Тяжелый авианесущий крейсер «Адмирал Кузнецов» (Фото: Лев Федосеев / ТАСС) Минобороны может отказаться от восстановления авианесущего крейсера «Адмирал Кузнецов», который стоит на ремонте на 35-м судоремонтном заводе в Мурманске с 2018 года после участия в российской военной операции в Сирии. Об этом сообщают «Известия» со ссылкой на источники. По данным издания, ремонт и модернизация корабля приостановлены, а вопрос о его дальнейшем будущем должен быть решен в ближайшее время. Представители Главкомата ВМФ и Объединенной судостроительной корпорации (ОСК), которой принадлежит судоремонтный завод, обсуждают, есть ли смысл возвращать единственный авианосец в боевой состав флота. Бывший командующий Тихоокеанским флотом Сергей Авакянц считает отказ от продолжения работ оправданным. По его словам, классические авианосцы теряют актуальность из-за высокой уязвимости и затратности, уступая место беспилотным системам. «Адмирал Кузнецов», по его мнению, может быть списан и утилизирован. rbc.group При этом в действующих стратегических документах, в том числе в «Основах государственной политики в области военно-морской деятельности до 2030 года», предусмотрено наличие авианосного соединения как на Северном, так и на Тихоокеанском флоте. rbc.group Военные эксперты расходятся во мнениях. Капитан 1-го ранга Василий Дандыкин настаивает на необходимости авиационного прикрытия в дальней морской зоне и указывает, что Китай и Индия активно развивают свои авианосные программы. Аналогичной позиции придерживается и Илья Крамник из Центра стратегического планирования ИМЭМО РАН. По его мнению, флоту нужен собственный аэродром в море, а это требует наличия авианесущих кораблей. В то же время Крамник признает, что «Кузнецов», который был спущен на воду в 1985 году, а в 1991 году введен в эксплуатацию, сильно устарел. ФСБ сообщила о предотвращении теракта на крейсере «Адмирал Кузнецов» Политика «Адмирал Кузнецов» предназначен, в частности, для поражения крупных надводных целей, защиты морских соединений от атак противника и поддержки операций по десантированию. На корабле могут базироваться 28 самолетов и 24 вертолета. На ремонт авианосец встал по возвращении из похода в Средиземное море, где наносил удары по объектам боевиков в Сирии. По данным Минобороны, тогда «Адмирал Кузнецов» потерял два палубных истребителя Су-33 и МиГ-29КР. Изначально реконструкция оценивалась в 20 млрд руб. В декабре 2019 года на «Адмирале Кузнецове» произошел пожар, при котором погибли два человека, еще 14 пострадали. Суд установил, что он начался из-за искр от сварки — от них загорелась пропитанная мазутом ветошь, а затем огонь уничтожил кабели и электроаппаратуру. Три года спустя ОСК сообщила о «маленьком возгорании» на крейсере, никто не пострадал. Предполагалось, что корабль вернется в состав ВМФ в 2022 году, но сроки завершения ремонта несколько раз переносили. В прошлом марте бывший заместитель начальника Главного штаба ВМФ Владимир Пепеляев допускал, что после модернизации «Адмирал Кузнецов» сохранит свой ударный ракетный комплекс. ТАСС со ссылкой на источник писал, что срок службы авианосца будет продлен на 20 лет. Прошлым летом ФСБ отчиталась о предотвращении теракта на авианосце, организовать который, по данным ведомства, пытались украинские спецслужбы. Читайте РБК в Telegram.	4	\N	2025-07-11 08:45:02	2025-07-11 08:45:02
1479	7130	premer-italii-predosteregla-ot-torgovyh-voyn-na-zapade	Премьер Италии предостерегла от торговых войн на Западе	https://s0.rbk.ru/v6_top_pics/media/img/3/48/347524576718483.jpeg	Конфликт между западными странами из-за взаимных пошлин ослабит обе стороны, предупредила Мелони. На днях Трамп анонсировал введение против Евросоюза 30-процентной пошлины с 1 августа, ЕС предупредил об ответных действиях Джорджа Мелони (Фото: Фото: Guiseppe Lami / EPA / ТАСС) Взаимное введение импортных пошлин приведет к торговой войне среди стран Запада, заявила итальянский премьер Джорджа Мелони. Ее слова передает пресс-служба правительства республики. «Сегодня правительство находится в тесном контакте с Еврокомиссией и всеми заинтересованными сторонами, участвующими в переговорах по тарифам. Торговая война на Западе ослабит нас всех перед лицом глобальных вызовов, с которыми мы все вместе сталкиваемся. У Европы есть экономическая и финансовая мощь, чтобы отстоять свои аргументы и добиться справедливого и разумного соглашения», — сказала Мелони. Европейские товары будут импортироваться в США с пошлиной в 30%, объявил на прошлой неделе американский президент Дональд Трамп. Тарифная ставка вступит в силу с 1 августа. rbc.group Сумма от таможенных сборов при Трампе превысила $100 млрд Экономика rbc.group Президент США пообещал в этот раз не делать отсрочек и предупредил: если Евросоюз решит ввести ответные пошлины, то на этот же уровень будут повышены пошлины США против ЕС. Пока предложения о торговых сделках не устраивают Трампа, сообщает Белый дом. Если решение найдено не будет, Евросоюз введет ответные меры, пообещала глава Еврокомиссии Урсула фон дер Ляйен. С ее слов, ответные действия разработаны для чрезвычайных ситуаций, «пока ситуация отличается». Французский президент Эмманюэль Макрон заявил о необходимости «твердо отстаивать европейские интересы». Минфин Германии призвал к решительным действиям для защиты европейских рабочих мест и компаний в случае провала переговоров с США. Как выяснил Bloomberg, европейские власти разработали два варианты ответных пошлин на случай разных сценариев развитий торговых отношений с США. Согласно «минимальному» набору пошлин, ответные тарифы затронут американские товары на €21 млрд: экспорт сои, некоторых аграрных продуктов и мотоциклов. Второй, более масштабный пакет, рассчитан дополнительно на €95 млрд, он может затронуть ключевые категории американского экспорта, включая самолеты Boeing, автомобили и бурбон. Читайте РБК в Telegram.	6	\N	2025-07-14 07:55:02	2025-07-14 07:55:02
1480	7117	senator-grem-posovetoval-sledit-za-novostyami-naschet-aktivov-rossii	Сенатор Грэм посоветовал следить за новостями насчет активов России	https://s0.rbk.ru/v6_top_pics/media/img/9/68/347524288535689.jpeg	США также собираются продать европейским союзникам большое количество оружия для Украины. Кроме этого, Грэм рассказал о «самом жестком пакете санкций», который скоро примет конгресс Линдси Грэм (Фото: Kent Nishimura / Getty Images) Европа собирается предоставить Украине только проценты по замороженным российским активам, а министр финансов США Скотт Бессент настаивает на радикальных мерах, заявил сенатор США от республиканской партии Линдси Грэм в интервью CBS News. «Не буду забегать вперед, но следите за новостями относительно замороженных активов: европейцы предлагают ограничиться передачей Украине процентов с этих средств, тогда как Бессент настаивает на более радикальных мерах», — сказал Грэм. Кроме этого, по его словам, США намерены продать Европе большое количество оружия. «В ближайшее время будет представлен план масштабных продаж американского вооружения европейским союзникам, которое в итоге поможет Украине», — поделился сенатор. rbc.group Как уточнил Грэм, конгресс США в ближайшее время примет «самый значительный в истории США пакет санкций», который предоставит президенту Дональду Трампу «беспрецедентные рычаги давления». Среди главных целей будут Китай, Индия и Бразилия, отметил сенатор. rbc.group «Это настоящая кувалда в руках президента Трампа, чтобы положить конец этой войне», — сказал он. Politico узнало требование Трампа к закону о санкциях против России Политика Ранее Трамп заявил, что выступит с «важным заявлением» по поводу России в понедельник, 14 июля. Он также сообщил, что окончательное решение о введении новых санкций против Москвы остается за ним. Помимо этого, президент США тогда раскрыл детали «нового соглашения» между США, НАТО и Украиной по поставкам американского оружия. Речь идет о том, что США будут отправлять вооружения НАТО, а затем альянс поставит их Украине и заплатит за них, объяснил он. Евросоюз, Канада, США и Япония заморозили активы российского Центробанка в размере около $300 млрд в виде ценных бумаг и наличных. Из них около $5–6 млрд находятся в США, а большая часть — в Европе, в бельгийском депозитарии Euroclear. Россия считает использование своих заблокированных активов воровством. Москва также выступает против любой помощи Украине и считает, что это лишь затягивает конфликт. Читайте РБК в Telegram.	9	\N	2025-07-14 07:55:02	2025-07-14 07:55:02
1444	6495	v-pulkovo-vveli-vremennuyu-shemu-priema-i-otpravki-reysov-na-chas	В Пулково ввели временную схему приема и отправки рейсов на час	https://s0.rbk.ru/v6_top_pics/media/img/3/91/347522146939913.jpeg	Ранее в аэропорту вводили временные ограничения на полеты. Губернатор Ленинградской области утром 11 июля объявил в регионе опасность БПЛА Фото: Екатерина Кузьмина / РБК Аэропорт Пулково в период с 08:45 до 09:45 мск будет принимать и отправлять рейсы по временной схеме, сообщил официальный представитель Росавиации Артем Кореняко. По его словам, договоренность об этом достигнута с соответствующими органами. Ранее в аэропорту вводили временные ограничения на полеты. Губернатор Ленинградской области Алексаднр Дрозденко утром 11 июля объявил в регионе опасность БПЛА. Он также предупредил о «возможном частичном понижении сигнала мобильного интернета». О возможном ухудшении связи в городе сообщали также в правительстве Петербурга. В аэропорту Пулково ввели ограничения на полеты Политика Пулково уже возобновлял прием рейсов на час 6 июля. Тогда на фоне продолжительных ограничений в аэропорту было отменено на прилет и вылет 90 рейсов, оставались задержанными на вылет 37 рейсов. В тот же день Дрозденко рассказал об уничтожении в Киришском районе Ленинградской области двух беспилотников. Ранее Минобороны сообщило об уничтожении за ночь 155 украинских беспилотников, из них 11 уничтожили над Московским регионом. rbc.group Больше всего — 53 дрона — сбили над Курской областью. Беспилотники также нейтрализовали над Брянской, Смоленской, Белгородской, Тульской, Орловской, Липецкой, Ростовской, Калужской областями, а также над Крымом и акваторией Черного моря. rbc.group В Тульской области в результате атаки дронов погиб человек, еще один пострадал. О гибели человека во время ночной атаки беспилотников также сообщили власти Липецкой области. В Таганроге обломки дрона упали на территории Таганрогского авиационного научно-технического комплекса имени Г.М. Бериева (ТАНТК). Читайте РБК в Telegram.	2	\N	2025-07-11 09:45:01	2025-07-11 09:45:01
1446	6501	nzz-nazvala-dva-sposoba-izbezhat-porazheniya-ukrainy	NZZ назвала два способа избежать поражения Украины	https://s0.rbk.ru/v6_top_pics/media/img/2/34/347522127214342.jpeg	Первый вариант заключается в попытке максимально сократить потери в условиях российского продвижения, второй предполагает постепенное отступление с линии фронта, чтобы сохранить армию Фото: Олег Петрасюк / Reuters У главнокомандующего Вооруженными силами Украины (ВСУ) Александра Сырского остались два основных варианта действий, которые помогут Киеву избежать поражения в военном конфликте с Москвой, пишет швейцарская газета Neue Zürcher Zeitung. Первый заключается в попытке максимально сократить потери в условиях российского продвижения и не дать крупным подразделениям попасть в окружение. Второй подразумевает постепенный отход с линии фронта и занятие новых позиций. Он призван «предотвратить капитуляцию и сохранить армию» даже в случае неблагоприятного для Украины исхода переговоров, сообщает NZZ. Газета пишет, что Украина рассматривает второй вариант, о чем свидетельствует создание укреплений в 20 км от линии фронта. rbc.group NYT узнала о сложном положении украинской армии в районе Константиновки Политика rbc.group У украинских войск, по мнению авторов статьи, нет ресурсов для внезапного нападения на любом участке фронта, а точечные удары по целям в глубине российской территории будут малоэффективны, «разве что в информационном пространстве». Украинской стороне не хватает истребителей, таких как F-35, чтобы добиться превосходства в воздухе, а также боеприпасов для систем HIMARS и средств ПВО. Наиболее интенсивные бои по-прежнему продолжаются в Донбассе, пишет NZZ, отмечая, что активность также наблюдается к северу от Харькова и в глубине Сумской области. Сырский на прошлой неделе говорил об «угрозе новых наступательных действий противника» на харьковском направлении. Минобороны России в последние дни отчитывалось о занятии населенных пунктов в Харьковской области и ударах по позициям ВСУ. Читайте РБК в Telegram.	1	\N	2025-07-11 09:45:02	2025-07-11 09:45:02
1445	6499	sber-snyal-ogranicheniya-po-akciyam-yugk-na-osnovanii-novogo-dokumenta-suda	«Сбер» снял ограничения по акциям ЮГК на основании нового документа суда		Ранее три брокера, входящих в банковские группы, наложили ограничения на акции «Южуралзолота» — «Сбер», Альфа-Банк и ВТБ. В Сбербанке сообщили, что они сняты на основании нового судебного акта Южуралзолото UGLD — Фото: Илья Наймушин / РИА Новости Брокер Сбербанка отменил ранее введенные ограничения по акциям «Южуралзолота» на основании нового документа суда, сообщила пресс-служба кредитной организации в ответ на запрос «РБК Инвестиций». «Сняты ограничения на операции с акциями ПАО «ЮГК», введенные ранее в связи с обеспечительными мерами по всем акциям ПАО «ЮГК». Ограничения сняты на основании нового судебного акта, заменяющего ранее введенные меры», — говорится в сообщении. Содержание прежнего документа суда до сих пор нигде не раскрыто публично. В банке также отметили, что биржевые операции с ценными бумагами «Южуралзолота» будут доступны после возобновления торгов на Московской бирже. rbc.group 9 июля сразу три брокерских подразделения крупных банковских групп арестовали акции «Южуралзолота», в том числе и у частных инвесторов. Первым об аресте акций на основании судебного решения сообщил брокер ВТБ, затем брокер Альфа-банка, третьим был брокер Сбербанка. В «Сбере», впрочем, не сказали прямо об аресте, но заявили о «недоступности» бумаг для клиентов на фоне приостановки торгов на Мосбирже, а также полученных документов из суда. «РБК Инвестиции  » направили запросы в пресс-службы Банка России, Мосбиржи, Национального расчетного депозитария, а также ВТБ и Альфа-Банка. Мосбиржа приостановила торги акциями «Южуралзолота» Южуралзолото , Иск , Акции , Брокер Новость дополняется. Инвестиции — это вложение денежных средств для получения дохода или сохранения капитала. Различают финансовые инвестиции (покупка ценных бумаг) и реальные (инвестиции в промышленность, строительство и так далее). В широком смысле инвестиции делятся на множество подвидов: частные или государственные, спекулятивные или венчурные и прочие. Подробнее	3	2025-07-11 09:52:20	2025-07-11 09:45:01	2025-07-11 09:52:20
1447	6504	tramp-anonsiroval-vazhnoe-zayavlenie-po-rossii	Трамп анонсировал «важное заявление» по России	https://s0.rbk.ru/v6_top_pics/media/img/8/32/347522082295328.jpeg	Президент США заявил, что выступит с заявлением по поводу России в понедельник, 14 июля. Он также сообщил, что окончательное решение о введении новых санкций против Москвы остается за ним Дональд Трамп (Фото: Tasos Katopodis / Getty Images) Президент США Дональд Трамп в интервью NBC News заявил, что выступит с «важным заявлением» по поводу России. По его словам, он «разочарован в России». «Но посмотрим, что произойдет в ближайшие пару недель», — сказал Трамп. «Думаю, в понедельник я сделаю важное заявление по России», — добавил глава Белого дома, но не стал вдаваться в подробности. rbc.group Трамп раскрыл детали «нового соглашения» между США, НАТО и Украиной по поставкам американского оружия. Речь идет о том, что США будут отправлять вооружения НАТО, а затем альянс поставит их Украине и заплатит за них, объяснил он. По словам президента, соглашение было достигнуто на саммите НАТО в прошлом месяце. rbc.group «Мы отправляем оружие в НАТО, и НАТО возместит полную стоимость этого оружия», — объяснил Трамп. Semafor рассказал о «закодированных посланиях» Трампа России и Украине Политика Глава Белого дома также сообщил, что окончательное решение о введении новых санкций против России остается за ним. «Другими словами, это мое решение, если я захочу их применить. Они [конгресс] собираются принять очень серьезный и очень жесткий законопроект о санкциях, но президент сам решает, хочет ли он их применять», — добавил он. В Кремле, говоря об угрозе санкций, заявляли, что с Москвой нельзя разговаривать «языком ультиматумов». Накануне госсекретарь Марко Рубио заявил, что на встрече с делегацией России в Куала-Лумпуре Москвой были озвучены новые предложения по Украине. Их суть он не раскрыл, но добавил, что обсуждалась «дорожная карта» урегулирования конфликта. «Мы обменялись некоторыми идеями и комментариями, которые я верну в Вашингтон уже сегодня вечером в виде звонков и размышлений, и, возможно, там будет что-то, на чем можно было бы строить дальнейшие действия», — сказал глава Госдепа. Он пообещал передать Трампу российское предложение «сразу по возвращении». Говоря о санкциях, Рубио пояснил, что Трамп рассматривает их как «реальный вариант», но хочет гибкости в том, как и когда они будут применяться. Президент США после последнего разговора с российским коллегой Владимиром Путиным, состоявшегося 3 июля, заявил, что не смог достичь никакого прогресса в урегулировании украинского кризиса. Он также отметил, что недоволен прошедшей беседой. Путин в беседе заявил Трампу, что Россия продолжает искать политическое и переговорное решение конфликта, говорили в Кремле. В Кремле «достаточно спокойно» относятся к тому, что Трамп стал жестче высказываться по отношению к Путину, заявлял пресс-секретарь российского президента Дмитрий Песков. На следующий день после разговора с Путиным Трамп созвонился с украинским президентом Владимиром Зеленским. Последний позднее назвал разговор «максимально продуктивным» и лучшим за все время, а Трамп пообещал поставить Украине больше оружия. По данным издания Semafor, Трамп сменой риторики направляет «закодированные послания» Киеву и Москве и хочет дать понять Путину и Зеленскому, что «все возможно, если они не отступят». Читайте РБК в Telegram.	7	\N	2025-07-11 09:45:02	2025-07-11 09:52:26
1448	6514	kommersant-uznal-o-pokazaniyah-o-svyazyah-strukova-s-gubernatorom	«Коммерсантъ» узнал о показаниях о связях Струкова с губернатором	https://s0.rbk.ru/v6_top_pics/media/img/4/21/347522161176214.jpeg	Струков через своих подчиненных оплачивал дни рождения челябинского губернатора, обеспечивал помещениями фонд его супруги и дарил им к праздникам продовольственные наборы, прозвучало на закрытом суде Константин Струков (Фото: Вадим Ахметов / URA.ru / ТАСС) Заместителя председателя законодательного собрания Челябинской области и главу «Южуралзолото Группа Компаний» (ЮГК) Константина Струкова связывали неформальные отношения со многими чиновниками, включая челябинского губернатора Алексея Текслера и его супругу Ирину Текслер, об этом стало известно из показаний гендиректора ряда коммерческих фирм Сергея Евтеева, которые тот дал в ходе разбирательства по иску Генпрокуратуры о конфискации «Южуралзолота», пишет «Коммерсантъ». Как утверждает Евтеев, Струков лично готовил для супругов Текслер продовольственные наборы с яблоками, овощами и соком собственного производства. Жене Текслера и его заместителю Анатолию Векшину дарили абонементы в фитнес-клуб, которым руководит Евтеев, но Текслер воспользовалась им лишь раз, а также ей передавали коробки с вином и шампанским. Кроме того, как утверждает Евтеев, по просьбе Ирины Текслер периодически устраивались ужины в принадлежащем Струкову ресторане БЦ «Челябинск-Сити», где у нее была 25-процентная скидка, а за счет средств УК «ЮГК» оплачивались счета за два фуршета в парке «Зарядье» в Москве на суммы от 400 тыс. до 800 тыс. руб. по случаю празднования в январе 2024 и 2025 годов дня рождения ее мужа. rbc.group Помимо того, по словам Евтеева, супруга губернатора, которая является учредителем Фонда социальных, культурных и образовательных инициатив — 2020, арендовала помещения в «Челябинск-Сити» площадью 100 кв. м всего за 5 тыс. руб. Там дважды проводились мероприятия Союза промышленников и предпринимателей Челябинской области, в которых участвовал глава региона. rbc.group Евтеев также пояснил в суде, что лишь номинально владел долями в уставном капитале ООО «Арбат-Сити», ООО «Трансальянс», ООО «Южноуральская технологистическая компания» и ООО «Уралтранскомплект», бенефициаром которых был Струков. Согласно показаниям в суде вице-президента УК «ЮГК» Ларисы Ивлевой, работавшей в организациях холдинга «Южуралзолото» с 1993 года, президент ЮГК поручал своим подчиненным покупать подарки для многих руководителей. В частности, по ее словам, этим занималась главный юрист ООО «УК «ЮГК» Наталья Убей-Волк. Последняя, со слов Ивлевой, рассказывала, как периодически передавала подарочные сертификаты чиновникам — например, бывшему замгубернатора Челябинской области, врио губернатора Ненецкого автономного округа Ирине Гехт. В пресс-службе областного правительства не стали комментировать изданию возможные неформальные связи Текслера и других лиц со Струковым. РБК направил запрос в аппарат губернатора Алексея Текслера. В ЮГК ответили на сообщения о задержании главы компании Струкова Бизнес На прошлой неделе Генпрокуратура обратилась в Советский районный суд Челябинска с требованием обратить в доход государства активы заместителя председателя Законодательного собрания Челябинской области и главы «Южуралзолото Группа Компаний» (ЮГК) Константина Струкова, которые, по мнению ведомства, были приобретены владельцем «Южуралзолота» с использованием служебного положения. Сейчас они оформлены на его дочь Александру Струкову, имеющую гражданство Швейцарии, и доверенных лиц. В офисах «Южуралзолота» и связанных со Струковым челябинских компаниях прошли обыски. По мнению прокуратуры, Струков в 1997 году установил контроль над госпредприятием «Южуралзолото», когда был назначен директором компании при челябинском губернаторе Петре Сумине (занимал пост с 1997 по 2010 год). «Южуралзолото» было преобразовано в ОАО, а затем — через процедуру банкротства — перешло подконтрольной Струкову структуре ПАО «Южуралзолото Группа Компаний». Активы предприятия были выведены в пользу нового юрлица, где Струков сохранил ключевые управленческие позиции. В 2022 году доля в ЮГК была оформлена на кипрскую компанию Ugold Limited, номинальным владельцем которой значилась его дочь. После возврата акций в российскую юрисдикцию они вновь были зарегистрированы на Струкова. Генпрокуратура считает, что владелец «Южуралзолота» «сосредоточил в своем подчинении ключевые активы в данной сфере, монополизировав стратегическую отрасль по добыче золота в Уральском и других федеральных округах». Читайте РБК в Telegram.	8	\N	2025-07-11 09:55:02	2025-07-11 09:55:02
1449	6575	vlasti-peterburga-predupredili-ob-uhudshenii-kachestva-mobilnogo-interneta	Власти Петербурга предупредили об ухудшении качества мобильного интернета	https://s0.rbk.ru/v6_top_pics/media/img/2/48/347522143096482.jpeg	Фото: Дарья Широкова / РБК Комитет по информатизации и связи Санкт-Петербурга предупредил жителей города о возможном ухудшении качества мобильного интернета и связи. Сообщение об этом появилось на странице ведомства в социальной сети «ВКонтакте». Это связано с обеспечением безопасности, пояснили в комитете. Издание «Фонтанка» пишет, что на отсутствие связи жалуются жители Центрального, Красносельского, Фрунзенского и Московского районов города. rbc.group В Таганроге обломки дрона упали на территории авиастроительного комплекса Политика rbc.group Ранее губернатор Ленинградской области Александр Дрозденко объявил в регионе опасность БПЛА. Он также предупредил о «возможном частичном понижении сигнала мобильного интернета». В аэропорту Пулково для обеспечения безопасности ввели временные ограничения на прием и отправку рейсов. Силы ПВО 6 июля сбили два беспилотника в Киришском районе Ленинградской области. Жертв и разрушений в результате атаки не было. Вечером 5 июля Дрозденко сообщил об отражении средствами РЭБ атаки беспилотников в Тосненском районе области. Читайте РБК в Telegram.	1	\N	2025-07-11 10:35:01	2025-07-11 10:35:01
1481	7129	tramp-anonsiroval-otpravku-oruzhiya-dlya-ukrainy-za-schet-evropy	Трамп анонсировал отправку оружия для Украины за счет Европы	https://s0.rbk.ru/v6_top_pics/media/img/8/14/347524519841148.jpeg	Европейские страны заплатят за поставляемое Украине оружие, рассказал Трамп. Он уклонился от вопроса об антироссийских санкциях и предложил дождаться завтрашнего дня Дональд Трамп (Фото: Samuel Corum / Consolidated News Photos / Global Look Press) США отправят Украине дополнительное оружие, в том числе ракеты к зенитно-ракетным комплексам Patriot, за которые заплатят страны Евросоюза, сообщил журналистам американский президент Дональд Трамп на военной базе Эндрюс. «Мы направим [Украине] разные образцы современного военного [оборудования]. И они заплатят нам за него 100%», — сказал Трамп и уточнил, что обсудит этот вопрос на встрече с генсеком НАТО Марком Рютте. Республиканец сказал, что «пока не определился с количеством» ракет Patriot, которые получат ВСУ, но украинская сторона «получат некоторую [часть], потому что им нужна защита, но заплатит за них Евросоюз, мы ничего не платим за это, но мы их направим, для нас это просто бизнес, и мы направим им Patriot». rbc.group Президент США ушел от вопроса о возможности ужесточения санкций против России. Он сказал: «Посмотрим, что будет завтра». rbc.group Сенатор Грэм посоветовал следить за новостями насчет активов России Политика На прошлой неделе Трамп пообещал отправить Украине больше вооружений: Они должны иметь возможность защищать себя. Они сейчас получают очень сильные удары. Мы собираемся отправлять больше оружия, в первую очередь оборонительного». Как рассказал республиканец, США договорились с НАТО и Украиной, что американская сторона будет отправлять вооружение альянсу, а тот оплатит их и передаст Киеву. На понедельник, 14 июля, президент США анонсировал «важное заявление» по поводу России и вновь упомянул, что «разочарован» в ней. Сенатор-республиканец Линдси Грэм посоветовал следить за новостями о заблокированных российских активах и анонсировал продажу Европе большой партии оружия, которую та передаст ВСУ: «В ближайшее время будет представлен план масштабных продаж американского вооружения европейским союзникам, которое в итоге поможет Украине». Российские власти требуют прекратить поставки оружия Украине и снять санкции. «Скажем так, у Трампа в целом достаточно жесткая стилистика», — оценили в Кремле ужеточение риторики в отношении Москвы. По словам представителя российского президента Дмитрия Пескова, Россия планирует продолжать диалог с США и «линию на починку изрядно поломанных двусторонних отношений». Читайте РБК в Telegram.	10	\N	2025-07-14 07:55:03	2025-07-14 07:55:03
1450	6581	eks-glavu-raek-grebennikova-arestovali-po-delu-o-gosizmene	Экс-главу РАЭК Гребенникова арестовали по делу о госизмене	https://s0.rbk.ru/v6_top_pics/media/img/4/95/347522129360954.jpeg	Сергей Гребенников (Фото: Сергей Бобылев / ТАСС) Лефортовский суд Москвы арестовал экс-директора Российской ассоциации электронных коммуникаций (РАЭК) Сергея Гребенникова по делу о государственной измене, следует из данных картотеки суда. Заседание состоялось 10 июля, суд удовлетворил ходатайство об избрании меры пресечения в виде заключения под стражу по ст. 275 Уголовного кодекса (государственная измена). Решение должно вступить в силу 15 июля. По информации источника Русской службы Би-би-си, дело о госизмене могли возбудить по итогам обыска, который проходил по делу о покушении на сбыт наркотиков. В конце мая Тверской суд Москвы вынес Гребенникову приговор по делу о сбыте наркотиков в особо крупном размере. rbc.group Фотографа из Перми приговорили к 16 годам колонии по делу о госизмене Политика rbc.group Портал Roem со ссылкой на источники, знакомые с ходом рассмотрения дела, сообщал, что глава РАЭК получил по делу семь лет. Прокуратура требовала для Гребенникова 11 лет заключения (минимальный срок наказания по ч. 3 ст. 228.1 УК — восемь лет). Однако суд учел то, что Гребенников ранее не привлекался к уголовной ответственности и имеет на иждивении мать. В начале июня вынесенный ему приговор был обжалован. В апелляционном постановлении по первому делу Гребенникова говорилось, что у него есть вид на жительство в США, а также квартира в Германии. Гребенников возглавил РАЭК в 2022 году. РАЭК объединяет свыше 150 игроков рынка электронных коммуникаций, занимается развитием нормативно-правового поля по защите интересов участников рынка, поддержкой проектов в отраслевом образовании и науке. Читайте РБК в Telegram.	2	\N	2025-07-11 10:35:01	2025-07-11 10:35:01
1452	6621	rassmotrenie-iska-rosnano-k-chubaysu-zakryli-ot-publiki-iz-za-tayny	Рассмотрение иска «Роснано» к Чубайсу закрыли от публики из-за тайны	https://s0.rbk.ru/v6_top_pics/media/img/7/67/347521616771677.jpeg	Арбитражный суд перевел в закрытый режим процесс по иску «Роснано» к Чубайсу и бывшим топ-менеджерам госкорпорации. Представители компании настаивали, что в деле содержится коммерческая тайна, связанная с разработкой планшетов Анатолий Чубайс (Фото: Олег Яковлев / РБК) Арбитражный суд Москвы удовлетворил ходатайство государственной корпорации «Роснано» о рассмотрении в закрытом режиме иска к экс-главе компании Анатолию Чубайсу и еще семи бывшим топ-менеджерам. Основанием для закрытия процесса стало заявление истца о наличии в материалах дела сведений, составляющих коммерческую тайну. Представитель Чубайса Павел Хлюстов настаивал на продолжении процесса в открытом режиме и заявил, что за требованием закрыть процесс стоит не защита конфиденциальной информации, а стремление «скрыть отсутствие результатов» пятилетней работы нового руководства «Роснано», передает корреспондент РБК из зала суда. На заседании Арбитражного суда Москвы в пятницу представители «Роснано» заявили, что открытость судебного процесса может привести к разглашению конфиденциальной информации. Речь идет об иске на 5,6 млрд руб., связанном с проектом Plastic Logic — попыткой создания в России производства гибких планшетов для школ. «Роснано» настаивает, что проект не достиг поставленных целей, а выделенные на него средства были разворованы и направлены на зарубежные счета. Разглашение тайны, отмечают юристы, может навредить корпоративным интересам. rbc.group Представитель Анатолия Чубайса Павел Хлюстов выступил против закрытия судебного разбирательства. Он напомнил, что сам проект гибких планшетов с момента своего запуска носил открытый характер, продвигался публично и находился под пристальным вниманием общества. «Почему теперь, когда этот проект стал предметом судебного разбирательства, должно быть иначе?» — задался вопросом адвокат. По его словам, Чубайс готов «открыто доказать свою невиновность, отчитаться за каждую потраченную копейку». Хлюстов считает, что правосудие не должно вестись в условиях секретности, «вопреки гарантированному законом общественному контролю». rbc.group Проект по созданию гибких планшетов начался в 2011 году, когда Анатолий Чубайс возглавлял «Роснано» — он занимал должность генерального директора госкорпорации в период с 2008 по декабрь 2020 года. Идея заключалась в разработке и внедрении в школьную систему инновационного устройства, способного заменить бумажные учебники. В рамках проекта «Роснано» инвестировало около 7,1 млрд руб. в ирландскую компанию Plastic Logic, рассчитывая построить завод в Зеленограде и запустить производство гибких электронных дисплеев нового поколения. В 2011 году Чубайс продемонстрировал образец планшета Владимиру Путину, занимавшему тогда поста премьер-министра, заявив, что устройство будет работать на основе российских технологий. Однако вскоре стало ясно, что проект не реализуется в полном объеме — строительство завода в России было свернуто, а все средства продолжили направляться зарубежным юрлицам. Впоследствии Счетная палата указала на отсутствие в Plastic Logic технологической документации и оборудования, а само предприятие было ликвидировано. Адвокат также усомнился в законности самого ходатайства «Роснано», указав, что на протяжении всех лет материалы проекта никак не были связаны с коммерческой тайной. По словам Хлюстова, истец не обозначал документы как конфиденциальные, не вводил для них специальный режим и не предпринимал шагов по защите сведений. «Если они сами не заботились о сохранении своих якобы секретных данных, закон не дает им теперь возможности требовать у суда, чтобы он сделал это за них», — подчеркнул он. Более того, представитель Чубайса увидел в требовании о закрытии процесса попытку «уклониться от ответственности за итоги работы» текущего руководства госкорпорации. Как утверждал Хлюстов, именно решение прекратить финансирование проекта преждевременно привело к тому, что технология, разработанная в России, была утрачена и впоследствии оказалась у иностранных производителей, которые «наладили массовое производство и получили мировые награды». «Роснано» объяснила иск на ₽5,6 млрд к Чубайсу и семи топ-менеджерам Общество Тем не менее суд счел доводы юристов «Роснано» обоснованными и постановил продолжить рассмотрение иска в закрытом режиме. Таким образом, оставшаяся часть судебных заседаний пройдет в закрытом режиме, а присутствовать на рассмотрении иска смогут только непосредственные участники процесса. Иск к бывшему руководству госкорпорации поступил в Арбитражный суд Москвы в конце марта этого года. Помимо Анатолия Чубайса, среди ответчиков бывшие топ-менеджеры корпорации — Юрий Удальцов, Олег Киселев, Борис Подольский, Герман Пихоя, Дмитрий Пимкин, Владимир Аветисян и Николай Тычинин. Все они занимали руководящие должности в структуре компании или в аффилированных с ней организациях. По ходатайству «Роснано» суд наложил арест на их имущество и средства в пределах 5,6 млрд руб. Исполнительные производства в отношении ответчиков уже инициированы службой судебных приставов. Попытка юристов добиться снятия ареста с активов Анатолия Чубайса оказалась частично успешной: апелляционный суд сохранил обеспечительные меры, но разрешил использовать 50% пенсии и иных доходов. После своего ухода из госкорпорации Чубайс занимал должность специального представителя президента России по связям с международными организациями для достижения целей устойчивого развития, однако весной 2022 года, вскоре после начала военной операции на Украине, подал в отставку и покинул страну. Причины своего отъезда Чубайс публично не комментировал. Уголовных дел в отношении него не возбуждено, однако его имя неоднократно фигурировало в делах против бывших топ-менеджеров «Роснано» — в частности, Бориса Подольского, арестованного в феврале 2025 года по обвинению в злоупотреблении полномочиями, и Олега Киселева, объявленного в международный розыск.	10	\N	2025-07-11 11:05:02	2025-07-11 11:05:02
1453	6642	poyavilis-kadry-s-kladbishcha-gde-horonyat-starovoyta	Появились кадры с кладбища, где хоронят Старовойта		Экс-глава Минтранса покончил с собой в день отставки, 7 июля. Старовойт родился в Курске, но его похоронят в Петербурге — здесь он начинал свою карьеру Глава Республики Алтай Андрей Турчак (справа на первом плане)(Фото: Петр Ковалев / ТАСС)Уполномоченный по защите прав предпринимателей в Санкт-Петербурге Валерий Калугин(Фото: Петр Ковалев / ТАСС)Фото: Петр Ковалев / ТАССПредседатель Комитета по градостроительству и архитектуре Санкт-Петербурга Юлия Киселева(Фото: Петр Ковалев / ТАСС) Опубликованы кадры со Смоленского кладбища в Санкт-Петербурге, где начались похороны бывшего главы Минтранса Романа Старовойта. Проститься приехали бывшая жена, дочери и мать экс-министра. На церемонию прибыли также коллеги Старовойта, петербургские чиновники и губернатор Ленобласти Александр Дрозденко. rbc.group В Петербурге начались похороны Старовойта Политика rbc.group Его похоронят на Прямой дорожке кладбища около часовни Ксении Петербургской, пишет 78.ru. Старовойт родился в Курске, но хоронят его в Северной столице — здесь он начинал карьеру. В городе также живет часть его родных. Утром 10 июля в столичной Центральной клинической больнице прошла церемония прощания со Старовойтом. В Москве простились с Романом Старовойтом. Фоторепортаж Фотогалерея  7 июля тело 53-летнего Романа Старовойта обнаружили в Одинцово с огнестрельным ранением. На месте также нашли наградной пистолет. СК сообщил, что, по предварительной версии, Старовойт покончил с собой. Это произошло в тот же день, когда его отправили в отставку. Временно исполняющим обязанности министра транспорта назначили зама Старовойта — Андрея Никитина. Позже Госдума и президент России Владимир Путин утвердили назначение Никитина. В день отставки Старовойт успел провести оперативное совещание со своими заместителями. Как писал «Коммерсантъ», когда он узнал об увольнении, написал сообщение в группе Минтранса — закончил фразой «честь имею». «Ъ» рассказал о прощальном сообщении Старовойта в группе Минтранса Политика Читайте РБК в Telegram.	10	\N	2025-07-11 11:15:01	2025-07-11 11:15:01
1454	6672	sobyanin-rasskazal-o-domah-zadumyvavshihsya-do-togo-kak-pridet-kommunizm	Собянин рассказал о домах, задумывавшихся до того, как придет коммунизм	https://s0.rbk.ru/v6_top_pics/media/img/7/34/347522135601347.jpeg	Многие 9- и 12-этажные дома «еще хуже хрущевских пятиэтажек» с точки зрения безопасности, заявил Собянин. Он сообщил, что стареющую жилую застройку будут включать в программу реновации постепенно Фото: Владислав Шатило / РБК Власти Москвы будут поэтапно включать стареющую жилую застройку в программу реновации, заявил «РИА Новости» мэр Сергей Собянин. По его словам, чтобы «город был всегда вечно молодым и современным», застраивать промзоны или свободные площадки недостаточно, нужно заниматься также «морально и физически устаревшим жилфондом». «У нас задумывалось, что многие серии домов должны служить 30–40–50 лет, потом придет коммунизм, и это все перестроит. Коммунизма нет, дома остались», — сказал мэр. Собянин отметил, что с точки зрения безопасности конструкций многие 9- и 12-этажные дома «еще хуже хрущевских пятиэтажек», поэтому власти думают о работе и над этой категорией. В пятиэтажках «просто жить невозможно», но представить, что они рухнут, довольно сложно, добавил мэр. rbc.group В странах Запада вопрос со старым жильем решается иначе, заявил Собянин: «Признали аварийным дом, всех выселили, до свидания». Если такой подход применить в Москве, это приведет к «градостроительному хаосу», считает он: «Точечно то тут, то там начнут выселять дома, переселять, как раньше говорили, за 101-й километр. Так не должно быть». rbc.group Путин подписал закон о новых правилах переселения в Москве по реновации Общество Программу реновации в Москве утвердили в 2017 году, она проходит в три этапа, последний из которых должен завершиться в 2023-м. Всего в программу включено 5175 домов, в которых расположено более 350 тыс. квартир общей площадью 16,4 млн кв. м. Изначально реновация была направлена на снос «морально и физически устаревших» пятиэтажек, но позже власти начали отмечать, что срок эксплуатации более высоких домов — девятиэтажек 1960–1970-х годов постройки — тоже подходит к концу. По данным столичного департамента градостроительной политики на апрель 2025-го, было начато расселение свыше 1,2 тыс. старых домов, 612 из них снесли. В 89 районах Москвы построили около 6 млн кв. м жилья, сообщал в июне заммэра Владимир Ефимов. Читайте РБК в Telegram.	2	\N	2025-07-11 11:35:01	2025-07-11 11:35:01
1455	6688	minoborony-soobshchilo-o-zanyatii-zelenoy-doliny	Минобороны сообщило о занятии Зеленой Долины	https://s0.rbk.ru/v6_top_pics/media/img/6/07/347522252192076.jpeg	Фото: сервис «Яндекс.Карты» Минобороны сообщило о занятии населенного пункта Зеленая Долина в Донецкой Народной Республике. Добиться этого удалось благодаря активным действиям подразделений группировки «Запад». Материал дополняется	5	\N	2025-07-11 12:35:02	2025-07-11 12:35:02
1456	6693	lavrov-otvetil-slovami-trampa-o-bolshih-syurprizah-na-vopros-ob-ukraine	Лавров ответил словами Трампа о «больших сюрпризах» на вопрос об Украине	https://s0.rbk.ru/v6_top_pics/media/img/7/07/347522148662077.jpeg	Лавров сообщил, что подтвердил Рубио позицию России по Украине, но не стал пояснять слов госсекретаря США о новом плане по урегулированию: «Есть вещи, которые не комментируются» Марко Рубио и Сергей Лавров (слева направо) (Фото: МИД России) Глава МИД России Сергей Лавров на пресс-конференции по итогам участия в мероприятиях по линии АСЕАН в Куала-Лумпуре не стал пояснять слова госсекретаря США Марко Рубио о новом плане по Украине, отметив, что «есть вещи, которые не комментируются», передает корреспондент РБК. «Я хочу ответить словами Дональда Трампа: «Так я вам и скажу, ждите больших сюрпризов», — заявил министр. Video Рубио накануне сообщил, что Москва озвучила новые предложения по Украине на переговорах на полях саммита АСЕАН. Суть плана госсекретарь не раскрыл, но сказал, что обсуждалась «дорожная карта» урегулирования между Россией и Украиной. Рубио заявил, что Россия озвучила новые предложения по Украине Политика rbc.group Журналисты попросили Лаврова уточнить, в чем состоят новые подходы и какая из сторон их предложила. «Да, мы обсуждали Украину, мы подтвердили ту позицию, которую президент Путин излагал, в том числе в очередной раз 3 июля в разговоре с Трампом», — ответил министр. Как сообщили в Кремле, Путин в ответ на призыв Трампа к скорейшему прекращению боев заявил о приверженности политическому решению конфликта, но подчеркнул, что Россия не откажется от своих целей. Американский президент заявил о готовящемся «сюрпризе» для России ранее на этой неделе, отвечая на вопрос о готовности ужесточить санкции из-за продолжающихся боев. Сенат США вскоре должен рассмотреть проект от республиканца Линдси Грэма, который предложил торговые тарифы в 500% против торговых партнеров Москвы. Трамп отметил, что окончательное решение о санкциях остается за ним, и пообещал в понедельник, 14 июля, сделать «важное заявление» о России. По итогам последней беседы с Путиным Трамп заявил, что «не добился никакого прогресса», а на этой неделе несколько раз выразил недовольство действиями России на Украине. В Кремле сообщили, что «достаточно спокойно» относятся к ужесточению риторики политика, Москва намерена продолжать диалог с Вашингтоном и рассчитывает, что США не откажутся от усилий по урегулированию между Россией и Украиной. Читайте РБК в Telegram.	2	\N	2025-07-11 12:35:02	2025-07-11 12:35:02
1457	6695	sud-snyal-trebovaniya-aresta-s-akciy-minoritariev-yuzhuralzolota	Суд снял требования ареста с акций миноритариев «Южуралзолота»		Брокер Альфа-банка снял ранее наложенный арест с акций «Южуралзолота». Сегодня утром ограничения по бумагам ЮГК отменил «Сбер» на основании новых документов суда Южуралзолото UGLD — Фото: Михаил Гребенщиков / РБК Брокер Альфа-банка снял арест с акций «Южуралзолота» на основании определения суда, сообщили «РБК Инвестициям» в пресс-службе финансовой организации. В документе, на который она ссылается, уточняется, что блокировка активов не распространяется на миноритарных акционеров. Ранее Сбербанк снял ограничения по бумагам ЮГК. «Мы получили новое определение Советского районного суда города Челябинска, в соответствии с которым изменены обеспечительные меры. Оно уточняет, что блокировка активов не распространяется на миноритарных акционеров. Как следствие, мы сняли блокировки с акций миноритариев и ждем возобновления торгов на Московской бирже. Как только биржа  получит такое же определение и возобновит торги, наши клиенты снова смогут совершать операции с акциями ЮГК», — сообщили в Альфа-банке. 3 июля сразу три брокерских подразделения крупных банковских групп наложили ограничения на акции «Южуралзолота», в том числе и у частных инвесторов. Первым об аресте акций на основании судебного решения сообщил брокер ВТБ, затем брокер Альфа-банка, третьим был брокер Сбербанка. rbc.group «Сбер» снял ограничения по акциям ЮГК на основании нового документа суда Южуралзолото , Акции , Брокер Ранее Мосбиржа приостановила торги акциями «Южуралзолота», сославшись на предписание Банка России. В регуляторе тогда пояснили, что решение было принято «дабы дать рынку успокоиться» на фоне высокой волатильности в бумагах компании. Позднее аналогичную меру предприняла и СПБ Биржа. Эксперты сообщали «РБК Инвестициям», что основным условием для возобновления торгов акциями ЮГК станет принятие судебного решения по иску Генпрокуратуры об обращении в доход государства доли основного владельца «Южуралзолота» Константина Струкова. Рассмотрение судом дела о передаче активов Струкова в госсобственность продолжится 11 июля. Банки начали снимать арест с акций «Южуралзолото». Что об этом известно Если у инвестора остались бумаги ЮГК, которые он не может реализовать из-за приостановки торгов, то есть возможность продать их на внебиржевом рынке. Однако эксперты предупреждают о больших дисконтах и низкой ликвидности  со стороны покупателей. Новость дополняется. Термин, обозначающий вероятность быстрой продажи активов по рыночной или близкой к рыночной цене. Подробнее Регламентированный рынок, где встречаются продавцы и покупатели, торгующие различными активами: акциями, облигациями, валютой, фьючерсами, товарами. Стать участником торгов на бирже может каждый – для этого нужно открыть брокерский счет. Каждая сделка заключается по рыночной цене, совершается практически мгновенно, а также регистрируется и контролируется. Подробнее	10	\N	2025-07-11 12:35:03	2025-07-11 12:35:03
1458	6685	k-belgorodskomu-zamgubernatora-i-biznesmenam-podali-isk-na-1-mlrd	К белгородскому замгубернатора и бизнесменам подали иск на ₽1 млрд	https://s0.rbk.ru/v6_top_pics/media/img/8/45/347522196622458.jpeg	Вице-губернатор Белгородской области и экс-глава управления капстроительства «благодаря злоупотреблению властью» заключили 26 соглашений на строительство фортификаций, но компании не выполнили обязательств, считают в прокуратуре Рустэм Зайнуллин (на экране) (Фото: Евгений Мартынов / ТАСС) Генпрокуратура подала иск к организаторам строительства фортификационных сооружений в Белгородской области, требуя взыскать с них почти 1 млрд руб., сообщает «Коммерсантъ». Ответчиками выступают вице-губернатор региона Рустэм Зайнуллин, которого в июне арестовали на два месяца по статье о мошенничестве, бывший начальник областного управления капитального строительства Алексей Сошников, бизнесмены Сергей Петряков, Иван Новиков, Константин Зимин и Дмитрий Боровлев, а также компании «Регион Сибирь» и «Стройинвестрезерв». Помимо Зайнуллина, под стражей находятся Петряков, Новиков и Зимин, а Сошников проходит по делу свидетелем. Останкинский суд Москвы принял обеспечительные меры, арестовав имущество и счета ответчиков, пишет газета. В иске прокуратуры говорится, что в 2022–2024 годах Белгородской области выделили 19,5 млрд руб. из федерального бюджета на строительство взводных опорных пунктов, противотанковых пирамид, блиндажей, укреплений для техники, окопов и рвов на границе с Украиной. Подрядчиком было управление капстроительства, которое до декабря 2022 года возглавлял Сошников. По версии ведомства, они вместе с Зайнуллиным «использовали служебное положение в личных целях и интересах третьих лиц» для незаконного обогащения за счет средств, выделенных на оборону. rbc.group Силовики задержали белгородского вице-губернатора Зайнуллина Политика rbc.group Чиновники заключили с «Регион Сибирью» и «Стройинвестрезервом» Петрякова и Боровлева 26 соглашений на 1 млрд 139 млн руб. Из этой суммы бизнесмены получили почти 925 млн руб «благодаря злоупотреблению властью» со стороны Зайнуллина и Сошникова. Часть средств в дальнейшем прогнали через компании, принадлежащие доверенным лицам вице-губернатора — Зимину и Новикову, — и передали чиновнику. По данным надзорного ведомства, «Регион Сибирь» и «Стройинвестрезерв» не выполнили обязательств по строительству объектов, сроки исполнения договоров неоднократно переносили. Зайнуллин и Сошников «свои корыстные потребности поставили превыше интересов Родины», говорится в иске. В марте суд в Курске удовлетворил аналогичный иск к бывшим руководителям региональной Корпорации развития, которая в том числе отвечала за установку оборонительных сооружений, и другим истцам на 4,1 млрд руб. Бывший глава корпорации Владимир Лукин и его заместители были арестованы в декабре, а в апреле под стражу отправили Алексея Смирнова, который возглавлял Курскую область с мая по декабрь 2024 года. Источники РБК говорили, что расследование повлияло на отставку министра транспорта Романа Старовойта (руководил министерством в 2019–2024 годах). 7 июля стало известно, что Старовойт покончил с собой. Читайте РБК в Telegram.	6	\N	2025-07-11 12:35:03	2025-07-11 12:35:03
1459	6717	vlasti-soobshchili-o-gibeli-komandira-155-y-brigady-morskoy-pehoty	Власти сообщили о гибели командира 155-й бригады морской пехоты	https://s0.rbk.ru/v6_top_pics/media/img/6/16/347522240738166.jpeg	Погиб командир 155-й бригады морской пехоты Сергей Ильин, сообщили власти Урмарского муниципального округа 10 июля — в этот день состоялись похороны полковника. Сейчас бригада носит имя замглавкома ВМФ, погибшего в начале июля Сергей Ильин (Фото: правительство Урмарского муниципального округа Чувашии) Во время военной операции погиб командир 155-й бригады морской пехоты полковник Сергей Ильин. О его гибели сообщили власти Урмарского муниципального округа Чувашии. Ильин родился в селе Мусирмы в этом округе. Власти района уточнили, что полковник «совершил бессмертный подвиг, отдав свою жизнь за нашу Родину». Сообщение о смерти датировано 10 июля. В нем указано: «Сегодня мы провожаем в последний путь уроженца села Мусирмы, гвардии полковника». Дату и место гибели военнослужащего власти не уточнили. rbc.group «Сергей Юрьевич погиб, защищая свободу и независимость той страны, которую он так любил. Это трагическая утрата для нашего округа, Чувашии и всей страны», — говорится в сообщении. rbc.group Путин присвоил 155-й Курской бригаде имя погибшего замглавкома ВМФ Политика В начале июля стало известно о гибели бывшего командира 155-й бригады генерал-майора Михаила Гудкова, которого в марте назначили заместителем главнокомандующего ВМФ. О его смерти сообщил губернатор Приморья Олег Кожемяко (155-я бригада — подразделение Тихоокеанского флота). «Российская газета» писала, что 155-я бригада во главе с Гудковым участвовала в боевых действиях в Курской области. Генерал Гудков погиб во время боевой работы в приграничном районе Курской области, сообщало позднее Минобороны. 6 июля Гудкова посмертно наградили медалью «Золотая звезда» за «мужество и героизм, проявленные в ходе специальной военной операции», — он стал первым в современной истории дважды Героем России. С того же дня 155-я бригада стала именоваться «155-я отдельная гвардейская Курская орденов Жукова и Суворова бригада морской пехоты имени дважды Героя Российской Федерации генерал-майора Михаила Евгеньевича Гудкова». Читайте РБК в Telegram.	2	\N	2025-07-11 12:55:02	2025-07-11 12:55:02
1460	6735	kreml-otvetil-na-poslanie-merca-k-putinu	Кремль ответил на послание Мерца к Путину	https://s0.rbk.ru/v6_top_pics/media/img/2/50/347522275226502.jpeg	Фридрих Мерц (Фото: Antonio Masiello / Getty Images) Страны Европы, которые обсуждают финансовую помощь Украине, хотят сподвигнуть Киев к дальнейшему продолжению боевых действий, к «войне до последнего украинца», заявил журналистам пресс-секретарь президента Дмитрий Песков, передает корреспондент РБК. Так он ответил на просьбу прокомментировать обращение канцлера Германии Фридриха Мерца к российскому президенту Владимиру Путину. «Мой посыл довольно прост — мы не сдадимся», — заявил он накануне на конференции в Риме по вопросам восстановления Украины. Тогда же Мерц озвучил послание к властям США, призвав их остаться «с европейцами, по эту сторону». Канцлер отметил, что у Берлина и Вашингтона схожие интересы. Материал дополняется	3	\N	2025-07-11 13:05:03	2025-07-11 13:05:03
1461	6739	starovoyta-pohoronili-v-peterburge	Старовойта похоронили в Петербурге	https://s0.rbk.ru/v6_top_pics/media/img/8/61/347522268125618.jpeg	Фото: Петр Ковалев / ТАСС Гроб с телом бывшего министра транспорта Романа Старовойта опустили в могилу на Смоленском кладбище в Санкт-Петербурге, передает «Фонтанка». Перед этим люди, пришедшие проститься с чиновником, произнесли несколько слов. Например губернатор Ленинградской области Александр Дрозденко сказал, что Старовойт «был человеком слова и дела, человеком результата» и напомнил о его участии в строительстве трассы «Скандинавия», которая проходит от Санкт-Петербурга через Выборг до границы с Финляндией. Замглавы «Росавтодора», бывший руководитель администрации Курской области Александр Шматков заявил, что Старовойт «всегда был рядом и не сидел в кабинете, каждая суббота была рабочей». rbc.group Старовойт был губернатором региона в 2018–2024 годах, до этого несколько лет возглавлял «Росавтодор». Министром транспорта его назначили в прошлом мае. 7 июля его отправили в отставку (новым главой Минтранса стал Андрей Никитин), а через несколько часов стало известно, что Старовойт покончил с собой. Его тело с огнестрельным ранением обнаружили в Одинцовском городском округе, рядом нашли наградной пистолет. rbc.group Проститься с бывшим министром, помимо членов семьи, пришли губернатор Петербурга Александр Беглов, другие петербургские чиновники, глава АвтоВАЗа и экс-министр транспорта Максим Соколов. Материал дополняется	3	\N	2025-07-11 13:05:03	2025-07-11 13:05:03
1462	6775	orenburg-sygraet-v-novom-sezone-rpl-vmesto-isklyuchennogo-torpedo	«Оренбург» сыграет в новом сезоне РПЛ вместо исключенного «Торпедо»	https://s0.rbk.ru/v6_top_pics/media/img/2/20/347522275108202.jpeg	КДК РФС накануне исключил московский клуб из РПЛ «за попытку организации договорных матчей в футбольных соревнованиях». «Оренбург» в прошлом сезоне занял предпоследнее место в РПЛ и вылетел в Первую лигу Фото: ФК «Оренбург» «Оренбург» заменит московское «Торпедо» в Российской премьер-лиге (РПЛ) в сезоне 2025/26. Об этом сообщают «Чемпионат» и «РБ Спорт». Такое решение было принято на заседании бюро исполкома РФС. РБК обратился за комментариями в РФС. rbc.group Накануне КДК РФС исключил «Торпедо» из РПЛ «за попытку организации договорных матчей в футбольных соревнованиях». В заявлении РФС говорилось о трех матчах с участием «Торпедо». rbc.group Владелец «Торпедо» Леонид Соболев и директор клуба Валерий Скородумов на данный момент находятся в СИЗО по делу об оказании противоправного влияния на результат матчей с участием клуба. «Оренбург» в прошлом сезоне занял предпоследнее, 15-е место в РПЛ и вылетел в Первую лигу. Главный тренером команды является босниец Владимир Слишкович, ранее работавший в московском «Спартаке». Обсудите новость в телеграм-канале «РБК Спорт».	4	\N	2025-07-11 13:25:03	2025-07-11 13:25:03
1463	6787	zaluzhnyy-predlozhil-ssha-peredat-ukraine-gotovye-k-utilizacii-rakety	Залужный предложил США передать Украине готовые к утилизации ракеты	https://s0.rbk.ru/v6_top_pics/media/img/1/31/347522247829311.jpeg	У США есть ракеты Hellfire, срок эксплуатации которых подходит к концу, напомнил Залужный, указав, что Киеву это оружие «жизненно необходимо». Кремль заявлял, что чем меньше ракет поступает на Украину, тем ближе конец конфликта Валерий Залужный (Фото: Finnbarr Webster / Getty Images) У США есть большие запасы устаревших или готовых к утилизации ракет, передача которых Украине могла бы стать «действенным решением» для защиты от российских ударов, написал в статье для «Украинской правды» посол страны в Великобритании и бывший главком ВСУ Валерий Залужный. В качестве примера он привел ракеты класса «воздух — поверхность» Hellfire, отметив, что по данным на конец 2023 года у Соединенных Штатов было более 170 тыс. этих боеприпасов различных модификаций. По словам Залужного, значительную часть ракет выпустили в 1998–2018 годах, в то время как срок эксплуатации не превышает 25 лет. «Следовательно, значительная часть устаревшего вооружения будет утилизирована или передана другим странам-союзникам», — написал посол, добавив, что для Украины оно «жизненно необходимо». rbc.group Reuters сообщил о планах Трампа впервые выделить Украине пакет вооружений Политика rbc.group Ракеты AGM-114 Hellfire выпускаются с 1982 года, их производит Lockheed Martin. В 2019 году на вооружение армии США поступили ракеты класса «воздух — земля» AGM-179 Joint Air-to-Ground Missile (JAGM), которые призваны заменить Hellfire. В этом году Lockheed Martin собирается представить морскую версию JAGM. В начале июля Politico и NBC News сообщили о паузе в поставках части американского оружия Украине, включая ракеты для комплексов Patriot. По их данным, решение месяц назад принял руководитель политического отдела Пентагона Элбридж Колби. Президент США Дональд Трамп заявил, что не отдавал подобных приказов. На этой неделе Соединенные Штаты возобновили поставки некоторых видов вооружений. По данным Axios, Трамп пообещал президенту Украины Владимиру Зеленскому «немедленно» отправить 10 ракет-перехватчиков для Patriot и помочь в поиске дополнительных поставок. Российская сторона требует от западных государств прекратить оказание Украине военной помощи. «Чем меньше ракет поступает на Украину, тем ближе конец специальной военной операции», — заявляли в Кремле. Читайте РБК в Telegram.	3	\N	2025-07-11 13:35:04	2025-07-11 13:35:04
1464	6828	v-irake-kurdy-nachali-sdavat-oruzhie-posle-samorospuska-partii	В Ираке курды начали сдавать оружие после самороспуска партии		В Турции, Ираке и Сирии началась сдача оружия курдами. Сдать оружие до этого призвал глава РПК Абдулла Оджалан, который сидит в тюрьме в Турции Video В провинцию Сулеймания в северном Ираке прибыли первые курды из запрещенной в Турции Рабочей партии Курдистана (РПК), для того чтобы сдать оружие, сообщает телеканал NTV. По его данным, в составе первой группы 20–30 членов РПК, их возглавляет высокопоставленный функционер партии. Разоружение проходит в пещере у подножия горы Касана, недалеко от дороги в Сулейманию, передает из Северного Ирака корреспондент NTV. CNN Turk добавляет, что курды бросают свое оружие прямо в огонь в присутствии представителей разведок Турции и Ирака. Если процесс разоружения в Сулеймании пройдет без осложнений, то в будущем станут разбивать желающих на группы по 40–50 человек, отмечает телеканал. Помимо Ирака оставить оружие можно будет в самой Турции и Сирии. Ожидается, что сделать это должны будут около 2 тыс. человек за 3–5 месяцев. По данным CNN Turk, в Турции изъявила желание разоружиться группа из примерно 200 человек. Самое тяжелое вооружение, что у них есть, — это минометы и снаряды к ним. Курдские формирования получали их от США. У них нет танков, ракет и зенитного оружия, писал Reuters. rbc.group Лидер турецких курдов из тюрьмы призвал завершить этап вооруженной борьбы Политика Курды — это ираноязычный народ на Ближнем Востоке. Они проживают преимущественно на сопредельных территориях Турции, Ирака, Ирана и Сирии и в других странах. Общая численность — примерно 30 млн человек, из них более половины живут в Турции, составляя примерно 18–20% местного населения. Неофициальной столицей турецких курдов считается город Диярбакыр. Рабочая партия Курдистана была основана в 1978 году, с 1984 года вела партизанско-террористическую борьбу с правительством и турецкой армией за создание независимого Курдистана. Основатель и лидер РПК Абдулла Оджалан с 1999 года отбывает пожизненное заключение в турецкой тюрьме на острове Имралы. В феврале 2025-го лидер РПК Абдулла Оджалан в письме к соратникам из тюрьмы призвал РПК сложить оружие и самораспуститься. В мае по итогам двухдневного съезда с участием 232 делегатов партия объявила о прекращении вооруженной борьбы и самороспуске. Анкара пообещала проконтролировать разоружение членов РПК при содействии Багдада и Дамаска. Также власти Турции собираются пересмотреть статус около 5000 членов РПК в тюрьмах с учетом совершенных ими преступлений, оставшихся приговоров, их возраста и состояния здоровья. Некоторых после пересмотра их дел могут отпустить на свободу. Читайте РБК в Telegram.	6	\N	2025-07-11 13:55:03	2025-07-11 13:55:03
1466	6903	zhiteli-kieva-snyali-pervyy-s-2022-goda-grazhdanskiy-samolet-nad-gorodom	Жители Киева сняли первый с 2022 года гражданский самолет над городом		Самолет вылетел из Днепра и летел над Киевом. Украинские сми пишут, что в небе заметили грузовой самолет Ан-124. Video В небе над Киевом появился гражданский самолет, хотя с начала военной операции в 2022 году воздушное пространство над украинской столицей официально закрыто. Кадры с летящим бортом, снятые жителями города, опубликованы в соцсетях, передает «Страна.ua». Судя по данным онлайн-сервиса Flightradar24, замеченный над Киевом борт вылетел из Днепра, конечная точка его маршрута скрыта, как и тип самолета. К моменту опубликования материала, самолет все еще находится в небе Украины. При максимальном увеличении на видео можно прочитать на хвосте самолета «Антонов». Это может быть тяжелый грузовой Ан-124 из числа оставшихся в распоряжении украинской авиакомпании «Антонов», уточняет «Страна.ua». Как полагает издание, компания решила «перегнать» свой самолет из Днепропетровска за границу. В начале февраля киевский аэропорт «Борисполь» заявил, что готов возобновить прием и отправку пассажирских самолетов в течение месяца с момента открытия воздушного пространства в Украине, напоминает «РБК Украина». rbc.group Читайте РБК в Telegram.	9	\N	2025-07-11 14:45:01	2025-07-11 14:45:01
1482	7119	byvshiy-glava-rkk-energiya-soglasilsya-na-prekrashchenie-dela-protiv-sebya	Бывший глава РКК «Энергия» согласился на прекращение дела против себя	https://s0.rbk.ru/v6_top_pics/media/img/3/67/347524422267673.jpeg	Виталия Лопоту подозревали в заключении невыгодных контрактов «из личного карьеризма» и «руководствуясь корыстной заинтересованностью». Он добивался признания невиновности, но решил «просто махнуть рукой» Виталий Лопота (слева) (Фото: Михаил Почуев / ТАСС) Мособлсуд закрыл уголовное дело против бывшего руководителя ракетно-космической корпорации (РКК) «Энергия» Виталия Лопоты, пишет «Коммерсантъ». Лопота рассказал изданию, что согласился на прекращение дела в связи с истечением срока давности, поскольку устал добиваться реабилитирующего решения суда. «Я четыре года упорно отказывался от прекращения дела по нереабилитирующим обстоятельствам, но тут решил просто махнуть рукой», — объяснил он. По мнению Лопоты, у суда «были все документы», доказывающие невиновность, а борьба потеряла смысл. С позицией Лопоты согласился второй подсудимый, вице-президент по финансово-экономической и правовой деятельности Александр Пызин, а также прокурор. Другие фигуранты, замгендиректора Завода экспериментального машиностроения (ЗЭМ) Александр Литвинов и первый вице-президент РКК «Энергия» Александр Стрекалов согласились на прекращение своего уголовного дела еще раньше. rbc.group Дело касалось проекта «Морской старт» (Sea Launch) — проекта морской платформы для запуска космических аппаратов, созданного в 1995 году. Стартовая площадка базировалась в акватории Тихого океана вблизи кораллового Острова Рождества. Дело завели в 2014 году. Лопоту подозревали в злоупотреблении полномочиями при осуществлении проекта «Морской старт» в 2010–2014 годах, которое привело к убыткам в размере 4,2 млрд руб. По версии следствия, Лопота с сообщниками, «руководствуясь корыстной заинтересованностью, с целью получения выгоды и преимуществ для себя, а также из личного карьеризма» совершал действия, заведомо невыгодные для РКК «Энергия». В частности, Лопоте вменяли заключение договоров финансирования «заведомо убыточного проекта» «Морской старт». Все заключенные соглашения, которые фигурируют в материалах расследования, следствие сочло экономически нецелесообразными. Материалы уголовного дела поступили в Мособлсуд прошлой осенью, они насчитывали примерно 300 томов. Лопота рассказал, что лишь обвинительное заключение заняло 581 страницу, а еще на 16 страницах разместились его комментарии. По его подсчетам, процесс из-за большого количества материалов и свидетелей мог занянуться на несколько лет. rbc.group Лопота отрицал свою вину и называл «Морской старт» успешным проектом, который за несколько лет привлек до 40 млрд руб. заказов и принес доход в размере 7 млрд руб. По его версии, злоупотреблений при реализации проекта не было, а все заключаемые соглашения проходили проверку в Счетной палате, правительстве и других контролирующих ведомствах. РКК «Энергия» — одна из ведущих ракетно-космических предприятий России. Корпорация занимается производством космических кораблей «Союз» и «Прогресс», разрабатывает полный спектр ракетной и космической техники — от ракет-носителей до пилотируемых орбитальных станций. Лопоте 74 года. Он возглавлял РКК «Энергия» с 2007 по 2014 год. На счету Лопоты свыше 300 научных трудов и монографий, 60 патентов на изобретения. Что такое «Морской старт» Проект по запуску собираемых на Украине из российских комплектующих ракет-носителей «Зенит» — «Морской старт» — создан в 1995 году. Стартовая площадка базировалась в акватории Тихого океана вблизи кораллового Острова Рождества. Учредителями изначально были американская корпорация Boeing (40%), «Энергия» (25%), норвежское судостроительное предприятие Kvaerner (сейчас — Aker Solutions, 20%), украинские КБ «Южное» (5%) и ПО «Южмаш» (10%). В эксплуатации ракетно-космический комплекс «Морской старт» находится с 1998 года. За период действия проекта с космодрома было произведено 36 запусков, в том числе 32 успешных, один частично успешный и три неудачных. В 2014 году, на фоне конфликта на территории Украины и прекращения поставок ракет днепропетровским «Южмашем», пуски с космодрома были приостановлены. За время существования «Морского старта» у проекта несколько раз сменялись владельцы. Читайте РБК в Telegram.	1	\N	2025-07-14 07:55:03	2025-07-14 07:55:03
1465	6895	glava-genshtaba-francii-nazval-stranu-prioritetnoy-celyu-kremlya	Глава Генштаба Франции назвал страну «приоритетной целью Кремля»	https://s0.rbk.ru/v6_top_pics/media/img/7/53/347522321214537.jpeg	Глава Генштаба Франции считает, что Россия представляет долгосрочную угрозу. Об этом же заявлял Макрон, но призывал к диалогу с Москвой. Кремль считает, что в НАТО Россию изображают «исчадием ада» ради повышения военных расходов Тьерри Буркхард (Фото: Romuald Meigneux / Keystone Press Agency / Global Look Press) Россия представляет для Франции «долгосрочную и непосредственную угрозу», заявил на пресс-конференции начальник Главного штаба вооруженных сил страны Тьерри Буркхард. «Кремль сделал нас приоритетной целью», — сказал он (цитата по Le Parisien), отметив, что Франция пострадала от кибератак, а соседние страны — от различных диверсий. В Кремле называли подобные обвинения в адрес Москвы безосновательными и абсурдными. Буркхард предупредил, что действия России могут «привести к всевозможным эксцессам». rbc.group Что значит решение Британии и Франции создать ядерный альянс Политика rbc.group По мнению начальника Генштаба, победа России в военном конфликте с Украиной стала бы «настоящим поражением Европы», поскольку на карту поставлена безопасность «Старого Света». В связи с этим, заявил Буркхард, необходим «европейский ответ». Угрозой Россию называл и президент Франции Эмманюэль Макрон, по словам которого, Москва превратила конфликт с Украиной в глобальный. В то же время он призвал Европу задуматься о будущем диалоге с Москвой, подчеркнув, что «в постоянной эскалации» оставаться нельзя. 1 июля Макрон впервые с сентября 2022 года поговорил с российским президентом Владимиром Путиным по телефону. Помимо Украины, они обсудили Ближний Восток, в Кремле сообщили, что лидерам нужно было услышать друг от друга изложение своих позиций «со всеми нюансами». Французский министр обороны Себастьян Лекорню отметил, что ядерные державы должны вести диалог по принципу красного телефона, который показывают «в фильмах времен холодной войны». Путин, комментируя заявления о возможном вторжении России в страны Европы, заявлял, что представители НАТО «сами себе придумали эту страшилку и повторяют ее из года в год». В Кремле считают, что руководство альянса изобразило Россию «исчадием ада», чтобы мотивировать членов блока повысить расходы на оборону до 5% ВВП. Читайте РБК в Telegram.	10	\N	2025-07-11 14:45:01	2025-07-11 15:58:47
1484	7122	stoit-li-zhdat-alkogolnyh-novinok-na-polkah-rossiyskih-magazinov	Стоит ли ждать алкогольных новинок на полках российских магазинов	https://s0.rbk.ru/v6_top_pics/media/img/9/85/347522320673859.webp	Российский рынок крепкого алкоголя поделен между крупнейшими брендами. Могут ли в таких условиях появиться новые бренды, не связанные с крупными производителями, и сможем ли мы встретить их на полках магазинов, рассказываем в материале «РБК Вино»Российский рынок крепкого алкоголя поделен между крупнейшими брендамиОбсудите материал в телеграм-канале «РБК Вино»СодержаниеНа российском рынке крепкого алкоголя доминируют крупные производители. В основных категориях спиртного на топ-10 самых популярных брендов приходится от 77 до 57% продаж (ниже только у водки — 38%), а на топ-40 — от 69,5 до 95%, следует из данных агентства А.LIST, подготовленных совместно с аналитическим агентством «ЭТА.Лаб». В роме на топ-40 самых популярных брендов приходится 95% продаж, в джине — 92%, в виски — 89%, в ликерах — 88,5%, в коньяке — 81%, в водке — 69,5%.Самая большая доля у лидера рынка: в джине — 46,2% продаж, в роме — 24,1%, в ликерах — 15,6%, в виски — 13,7%, в коньяке — 10%, а в водке — 6,1%. В каждой категории доминируют российские бренды. Среди топ-3 самых продаваемых брендов зарубежные игроки есть только в ликерах и роме.Текущую рыночную ситуацию участники рынка объясняют историческими особенностями, уходом западных игроков в 2022 году и политикой торговых сетей.Президент компании Ladoga Вениамин Грабар говорит, что джин, виски, ром — это такие категории, где высока лояльность к бренду со стороны потребителя. В них же произошли самые серьезные изменения после ухода мировых игроков с российского рынка. «Появилось много новых продуктов, однако закрепиться смогли далеко не все, а уж добиться успеха — и вовсе единицы. Сейчас идет тренд на укрупнение — потребитель этих категорий определил для себя любимчиков, которые и составляют львиные доли», — говорит Вениамин Грабарь.Исторически в России было зарегистрировано большое количество брендов водки, что обуславливает высокую конкуренцию на этом рынке, считает Руслан Брагин, руководитель направления крепкого алкоголя виноторговой компании Fort. По его словам, рынок водки, коньяка и ликеров более сегментирован, в нем больше игроков, поэтому и сложнее добиться лидерства в этих категориях. «В случае с водкой играет огромную роль региональный фактор. В каждом городе есть свой ЛВЗ со своими торговыми марками и поклонниками в виде местного населения», — добавляет Вениамин Грабар.Основные продажи в крепком алкоголе формируют три федеральные сети: «Магнит», «Пятерочка» и «Красное и Белое», говорит Артем Садыков, начальник управления продаж «Башспирта». «Место на полке там весьма ограниченно. И если на водку приходится один-два стеллажа, то экзотика в виде российского джина, рома или виски может претендовать максимум на 2 SKU (товарная позиция в магазине. — «РБК Вино»), одним из которых будет лидер продаж, а вторым будет продукт по минимальной розничной цене», — объясняет Артем Садыков. По его словам, это приводит к ситуации, когда компания, открывшая сегмент и не допустившая больших ошибок в продвижении, будет продолжать лидировать в категории.Ожидать новинок, как утверждают участники рынка, стоит в водке, а также во вкусовых вариантах традиционных напитков.«Мое мнение, что на сегодняшний день перспективы у новых брендов есть только в сегменте водки и в меньшей степени коньяков. Джин монополизирован. У российского виски или рома нет достаточного авторитета, и если внешнеполитическая обстановка изменится в ближайшие пару лет, то в страну вернутся транснационалы с их бюджетами, и непонятно, кто в той ситуации выиграет», — считает Артем Садыков из «Башспирта».На сегодняшний день перспективы у новых брендов есть только в сегменте водки и в меньшей степени коньяковАлександр Афонин говорит, что потребителям стоит ждать новинок в сегментах текилы, дистилляты и водка. Павел Победкин видит большой потенциал в категории коктейлей, аперитивов и ликеров. По его словам, в магазинах будут появляться варианты традиционного алкоголя с новыми вкусами. «Сегодня потребителя все больше привлекают неожиданные вкусы, необычные сочетания и формат подачи. Люди хотят экспериментов — им интересно пробовать то, чего раньше не было, — говорит Павел Победкин. — Главный драйвер — удивление и новизна. Бренды, способные предложить нестандартный вкус или формат, получают шанс завоевать потребителя даже в насыщенной категории».Также эксперты предсказывают появление подчеркнуто локальных марок в традиционно западных категориях — виски, ром, джин. Так, доцент кафедры менеджмента Президентской академии в Санкт-Петербурге Максим Черниговский считает, что подобные новинки будут возникать в категориях локальных крафтовых виски и джинах, где потребитель все чаще ищет «русский продукт», ликерах и настойках на травяной или ягодной основе. Эксперт говорит, что шансы есть прежде всего у нишевых продуктов. «Примеры малых солодовых дистиллерий, успешно запускающих собственные односолодовые линейки, доказывают: при точном позиционировании и интересной истории нишевые новинки могут пробиться даже в высококонцентрированных сегментах», — говорит Максим Черниговский.Доминирование крупнейших игроков препятствует появлению новых федеральных брендов, считает большинство опрошенных участников рынка.Текущая ситуация на рынке создает серьезные барьеры для входа на него, отметил Андрей Московский. По его словам, новому бренду в джине или виски необходимо доказать качество и обеспечить широкую дистрибуцию, что требует значительных маркетинговых инвестиций и договоренностей с ретейлом. «Ключевой вопрос — чем новый продукт отличается от существующих: по цене (ретейлу важна маржа и быстрая оборачиваемость), по сырью: здесь преимущество у производителей с полным циклом, которые способны создать действительно уникальный продукт даже в «традиционных» категориях вроде водки или настоек», — объясняет Андрей Московский. По его словам, большинство напитков сейчас лишь играют со вкусом, но базовая матрица неизменна, так как выгоднее просто расширять линейку под зонтичным брендом: это дешевле, быстрее, остается лишь отыграть вкус и упаковку.Руслан Брагин говорит, что в сложившихся ситуациях особую важность играет концепция, упаковка и легенда нового бренда, то, в каком ценовом сегменте он конкурирует и насколько его философия соответствует взглядам потребителя. «Порой одно лишь лидерство по дистрибуции, присутствие во всех сетях, максимальная доступность делают бренд лидером в продажах», — говорит эксперт.Некоторые производители, наоборот, считают, что высокая концентрация — это сигнал для производителей: ниша перспективна, и на ней можно работать. «При относительно небольшом числе сильных игроков появляется окно возможностей», — объясняет председатель совета директоров ПАО «АГК», конечный бенефициар «КЛВЗ Кристалл» Павел Победкин. По его словам, удачный продукт может быстро привлечь внимание покупателя, занять заметную долю и обеспечить хорошую маржинальность, поэтому именно в таких «плотных» категориях можно ожидать приток новинок, особенно креативных и нестандартных.Бренд-директор крепкого портфеля Luding Group Александр Афонин также не считает высокую долю в продажах у лидеров рынка препятствием для вывода новых брендов. «Новинки будут появляться и создавать конкуренцию монополистам. Мы видим лидеров в каждом из сегментов, но осознанно вступаем в эту игру», — говорит он.Низкая цена позволяет привлечь внимание закупщика федеральной сетиГлавный вопрос, который волнует потребителя и обеспечивает успех алкогольных новинок, — цена.По словам Андрея Московского, низкая цена позволяет привлечь внимание закупщика федеральной сети. «По оценкам, у нас примерно до трети покупателей готовы попробовать новинки если они попадают в их ожидания по цене в категории», — говорит эксперт. Важнейший момент для сохранения конкурентной цены — наличие собственного сырья. Это будет поощрять производителей полностью локализовать производство, отказываясь от импортного сырья.Максим Черниговский также считает, что выделиться только за счет цены у новичков не получится, поэтому ждать новинок в эконом-сегменте не стоит: «В сегментах с высокой концентрацией лидеры диктуют условия в ретейле, поэтому малым брендам остается выделяться за счет уникального продукта и эмоционального позиционирования».С учетом того, что самый низший ценовой сегмент занят, а премиум ограничен снижением покупательской способности населения, наибольшее число новинок будет возникать в среднем и высоко-среднем сегменте, считает Руслан Брагин.	6	\N	2025-07-14 07:55:03	2025-07-14 07:55:03
1467	6930	gladkov-nazval-putinu-odnu-iz-glavnyh-problem-belgorodskoy-oblasti	Гладков назвал Путину одну из главных проблем Белгородской области	https://s0.rbk.ru/v6_top_pics/media/img/2/05/347522323275052.jpeg	В Белгородской области «один из очень сложных показателей» в России с рождаемостью, заявил Гладков. По данным Белгородстата, в 2024 году рождаемость в регионе снизилась на 8,4% Вячеслав Гладков (Фото: Администрация Президента России) Одна из основных проблем в Белгородской области, которую не решили власти, — это вопрос увеличения рождаемости, заявил глава региона Вячеслав Гладков на встрече с президентом Владимиром Путиным. Гладков напомнил, что Путин поставил задачу повышать рождаемость по всей стране. Она содержится в прошлогоднем указе «О национальных целях развития» до 2030 года, президент называл поддержку многодетности в числе приоритетов. «С рождаемостью один из очень сложных показателей не только в Центральном федеральном округе, но и в стране, поэтому мы две основные отрасли выбрали, с нашей точки зрения, приоритетными — это здравоохранение и образование», — сказал губернатор (цитата по сайту Кремля). rbc.group Власти предложили исключить фактор «гостевых рождений» из статистики Экономика rbc.group По данным Белгородстата, в 2024 году в области родились 9 179 детей, за год показатель снизился на 8,4% с 10 024 в 2023-м. Среди родившихся доля первенцев составила 40,1%, доля повторных рождений — 59,7%, в том числе вторых детей — 36,1%, третьих — 15,8%, четвертых и более — 7,8%. Общий коэффициент рождаемости за 2024 год составил 6,1 родившихся на тысячу человек, годом ранее — 6,6. С 2021 года число новорожденных в Белгородской области сократилось на 3 тыс., с 12 233, рассказывал в июне Гладков. Гладков рассказал об анархии из-за отселения администрации в приграничье Политика В минувшем ноябре губернатор призывал создавать комфортные условия для жизни и воспитания детей, предупредив, что Белгородская область рискует потерять жителей, если все финансовые ресурсы направлять только на военные нужды: «Если будем деньги все тратить на войну, все люди уйдут». Читайте РБК в Telegram.	5	\N	2025-07-11 15:05:02	2025-07-11 15:05:02
1468	6969	nyt-uznala-o-proverkah-otnosheniya-k-nachalstvu-v-fbr-na-poligrafe	NYT узнала о проверках отношения к начальству в ФБР на полиграфе	https://s0.rbk.ru/v6_top_pics/media/img/7/61/347522279779617.jpeg	После смены руководства персонал ФБР стали чаще тестировать на полиграфе, задавая вопросы об отношении к главе спецслужбы, пишет NYT. Источники газеты говорят, что пренебрежительное отношение к нему может привести к увольнению Фото: Дмитрий Коротаев / Epsilon / Getty Images Федеральное бюро расследований (ФБР) США стало чаще проверять сотрудников на полиграфе после того, как должность главы бюро занял Кэш Патель, сообщает The New York Times (NYT) со ссылкой на источники. NYT отмечает, что обычно ФБР прибегает к таким тестам, чтобы выявить людей, которые могли раскрыть или уже раскрыли секретную информацию. Теперь проверки посвящены выяснению отношения служащих к главе ФБР, их число измеряется десятками, утверждают источники. Однако, пишет газета, количество тех, кого спрашивали именно о Пателе, неизвестно. Сенат утвердил Кэша Пателя на должность директора ФБР в феврале 2025 года. В 2017 году был старшим советником по борьбе с терроризмом в комитете по разведке Палаты представителей конгресса. В феврале 2019-го Патель стал сотрудником Совета нацбезопасности, а спустя год перешел в аппарат директора Национальной разведки. В январе 2021 года, после того как Белый дом возглавил Джо Байден, Патель покинул госслужбу и вошел в совет управляющих медиакомпании Трампа Trump Media & Technology Group, которой принадлежит социальная сеть Truth Social. На должность директора ФБР Пателя номинировал лично Трамп в ноябре 2024 года. rbc.group Использование полиграфа и характер интервью указывает на внимание главы ФБР к своему публичному имиджу, указывает NYT. Источники газеты сочли подобные проверки политически мотивированными. Бывшие сотрудники бюро полагают, что пренебрежительное отношение к Кэшу Пателю или его заместителю Дэну Бонджино может стоить агентам работы. rbc.group Глава ФБР рассказал о тайной комнате в штаб-квартире ведомства Политика Специалисты по полиграфии предположили, что вопрос, говорили ли сотрудники что-либо негативное о Пателе, мог звучать в конце интервью. Таким образом можно отследить определенные физиологические реакции участника, чтобы сравнить их с ответами на другие вопросы, пояснили опрошенные NYT эксперты. В начале июля была опубликована редакционная статья NYT, в которой говорилось, что Трамп превращает ФБР в инструмент по продвижению собственных политических интересов и мешает ведомству обеспечивать безопасность американских граждан, бороться с терроризмом и организованной преступностью. Бонджино назвал публикацию «плохо продуманной нападкой». По его мнению, издание намеренно скрыло важные результаты работы бюро при новом руководстве, акцентировав внимание на кадровых изменениях. Читайте РБК в Telegram.	2	\N	2025-07-11 15:35:02	2025-07-11 15:35:02
1469	7023	glava-razvedki-ukrainy-dopustil-vozmozhnost-peremiriya-do-konca-goda	Глава разведки Украины допустил возможность перемирия до конца года	https://s0.rbk.ru/v6_top_pics/media/img/4/68/347522381905684.jpeg	Прекращение огня на Украине до конца 2025 года — реалистичная цель, заявил руководитель ГУР Кирилл Буданов. Путин говорил, что Россия готова продолжать переговоры с Украиной, но в первую очередь будет добиваться собственных целей Кирилл Буданов (Фото: Евгений Малолетка / AP / ТАСС) Прекращения огня между Украиной и Россией возможно достигнуть «задолго до конца года», заявил руководитель Главного управления разведки (ГУР) Минобороны Украины Кирилл Буданов в интервью Bloomberg. «Реалистично ли это сделать — да. Сложно ли это — нет. Для этого нужно как минимум три стороны — Украина, Россия и США. И мы добьемся этого», — сказал глава ГУР. Буданов также выразил уверенность, что США «в ближайшем будущем» продолжат оказывать поддержку Украине и Вашингтон сможет отправить Киеву дополнительные системы противовоздушной обороны. Он также отметил, что президент США Дональд Трамп «последователен» в своих действиях и судить о нем по медийным характеристикам не стоит. «Как глава спецслужбы я знаю больше», — добавил он. rbc.group В начале июля Politico и NBC сообщили о приостановке поставок США некоторых видов оружия Украине, в том числе ракет для системы ПВО Patriot. Информацию подтвердили в Белом доме, объяснив это необходимостью оценки собственных запасов. Позднее Трамп заявил о намерении продолжить и нарастить поставки оружия Украине, чтобы она могла «защищать себя». Он отметил, что речь идет в первую очередь об оборонительных вооружениях, и пообещал «немедленно» отправить Украине десять ракет-перехватчиков для Patriot, а также помочь в поиске дополнительных поставок. rbc.group Президент России Владимир Путин неоднократно говорил, в том числе во время недавнего разговора с Трампом, что Россия продолжает искать пути решения конфликта с Украиной. При этом глава государства подчеркивал, что Россия будет добиваться поставленных целей. Нужный для России результат, по словам Путина, — устранить причины конфликта на Украине и обеспечить условия для долгосрочного мира. Кремль заявил об ожидании предложений Киева по продолжению переговоров Политика Украина и Россия после трехлетнего перерыва в переговорах провели две встречи в Стамбуле — делегации встречались 16 мая и 2 июня. На последних переговорах стороны обменялись проектами меморандумов с предложениями по прекращению огня. Путин отмечал, что российская и украинская версии документа «абсолютно противоположны» друг другу. При этом он подтвердил готовность России к третьему раунду переговоров. Президент Украины Владимир Зеленский говорил, что представители Киева и Москвы смогут встретиться, когда завершатся обмены, согласованные по итогам предыдущих раундов. Читайте РБК в Telegram.	6	\N	2025-07-11 16:15:02	2025-07-11 16:15:02
1470	7026	razrabotchika-superkompyuterov-abramova-prigovorili-k-shtrafu-150-tys	Разработчика суперкомпьютеров Абрамова приговорили к штрафу ₽150 тыс.	https://s0.rbk.ru/v6_top_pics/media/img/8/15/347522328461158.jpeg	Суд Ярославской области приговорил члена-корреспондента РАН, доктора физико-математических наук Сергея Абрамова к штрафу в размере 150 тыс. руб., признав его виновным в финансировании деятельности экстремистской организации Сергей Абрамов (Фото: Юрий Машков / ТАСС) Переславский суд Ярославской области в пятницу приговорил члена-корреспондента РАН, доктора физико-математических наук Сергея Абрамова к штрафу в размере 150 тыс. руб., признав его виновным в финансировании деятельности экстремистской организации (ст. 282.3 УК). Об этом РБК сообщил сам Абрамов. Прокурор просил назначить Абрамову штраф в размере 450 тыс. руб. Поводом для возбуждения дела стали семь транзакций общей суммой около 7 тыс. руб., которые, как считает следствие, были направлены в адрес Фонда борьбы с коррупцией (признан экстремистской организацией и запрещен, ликвидирован и внесен в список иностранных агентов). Сторона защиты настаивала на полном оправдании ученого. Обвинение утверждало, что переводы были осуществлены с банковской карты, оформленной на имя Абрамова, в период с августа 2021 года по февраль 2022 года. На основании этих данных прокурор просил оштрафовать ученого на 450 тыс. руб. rbc.group Сам обвиняемый вину не признал. Он заявил, что не совершал инкриминируемых переводов и не был осведомлен об их осуществлении. По словам Абрамова, карта действительно оформлена на его имя, однако доступ к ней и к его ноутбуку могли иметь третьи лица. Как пояснил ученый, устройство не было защищено паролем, работало в режиме непрерывной загрузки, а сохраненные пароли и отсутствие двухфакторной аутентификации создавали техническую возможность для несанкционированного использования. rbc.group На заседаниях выступали специалисты в области информационной безопасности и представители банковского сектора. Представитель ПАО «Сбербанк» сообщил суду, что выписки по спорным операциям не содержат сведений о получателе платежей и не позволяют достоверно установить личность отправителя. Как отметил эксперт, идентификаторы торговых точек, фигурирующие в банковской информации, не являются уникальными и могут совпадать у разных продавцов. Запросы в иностранные банки, через которые могли проходить транзакции, следствием направлены не были. Обвинение запросило штраф для разработчика суперкомпьютеров Абрамова Общество Сергей Абрамов был задержан весной 2023 года, после чего провел несколько месяцев под домашним арестом. Позднее мера пресечения была изменена на подписку о невыезде. На стадии следствия ученого внесли в перечень Росфинмониторинга как причастного к экстремистской деятельности. В числе приобщенных к делу были характеристики, представленные коллегами и академическим сообществом. В них Абрамов описывается как «ведущий специалист в области системного программирования», автор научных инициатив, связанных с разработкой отечественных суперкомпьютеров, в том числе в рамках Союзного государства. До 2022 года он занимал пост директора расположенного в Ярославской области Института программных систем им. А.К. Айламазяна РАН, затем продолжил работу в качестве главного научного сотрудника института.	7	\N	2025-07-11 16:15:02	2025-07-11 16:15:02
1471	7033	sud-konfiskoval-aktivy-vladelca-yuzhuralzolota-v-dohod-gosudarstva	Суд конфисковал активы владельца «Южуралзолота» в доход государства	https://s0.rbk.ru/v6_top_pics/media/img/1/66/347521578882661.jpeg	3 июля Генпрокуратура подала иск с требованием передать активы президента и основного акционера компании «Южуралзолото» (ЮГК) Константина Струкова в доход государства. Советский районный суд Челябинска удовлетворил иск Южуралзолото UGLD — — Купить Константин Струков (Фото: Донат Сорокин / ТАСС) Советский районный суд Челябинска по иску Генпрокуратуры конфисковал доли в золотодобывающей группе компаний «Южуралзолото» и другие активы бизнесмена Струкова и его окружения в доход государства. Суд проходил в закрытом режиме, передает ТАСС. Струков занимает 78-ю строчку в рейтинге самых богатых людей России по версии Forbes с состоянием $1,9 млрд. С 2000 года он является депутатом Законодательного собрания Челябинской области, а с 2017-го — заместителем его председателя от «Единой России». Одновременно бизнесмен состоит в комитете по экологии и природопользованию, что, как указано в иске, обеспечивало ему доступ к информации о приоритетных инфраструктурных проектах в сфере недропользования. Таким образом, по мнению Генпрокуратуры, Струков имел возможность вводить такое нормативное регулирование, которое было выгодно бизнес-интересам подконтрольных ему коммерческих организаций. Надзорное ведомство требовало обратить в доход государства активы, которые, по мнению прокуратуры, были приобретены Струковым с использованием служебного положения. Среди других ответчиков по делу — предполагаемые аффилированные лица бизнесмена. В списке третьих лиц — ПАО «Южуралзолото Группа Компаний», ООО «УК ЮГК», а также компании «Бизнес-Актив», «Хоум» и «Уралвент», зарегистрированные в Челябинске. Так, по данным ведомства, Струков незаконно получил ЮГК и еще десять компаний под контроль, используя свои должности и положение в органах госвласти. Сейчас они оформлены на его дочь Александру Струкову, имеющую гражданство Швейцарии, и доверенных лиц. Банки начали снимать арест с акций «Южуралзолото». Что об этом известно Подписка на РБК В 1997 году бизнесмен установил контроль над государственным предприятием «Южуралзолото», когда был назначен директором компании при губернаторе Челябинской области Петре Сумине (занимал пост с 1997 по 2010 год). Предприятие было преобразовано в ОАО, а затем — через процедуру банкротства — передано подконтрольной Струкову структуре ПАО «Южуралзолото Группа Компаний». Активы предприятия были выведены в пользу нового юридического лица, где Струков сохранил ключевые управленческие позиции. ЮГК производит 450 тыс. унций золота в год, осваивает месторождения на территории Челябинской области, Красноярского края и Хакасии. Ежегодная выручка составляет 54 млрд руб., валовая прибыль — 34 млрд руб. Тем самым депутат, курирующий недропользование, «сосредоточил в своем подчинении ключевые активы в данной сфере, монополизировав стратегическую отрасль по добыче золота в Уральском и других федеральных округах», говорилось в иске Генпрокуратуры. Источник РБК сообщал, что, по версии надзорного органа, доходы от бизнеса Струков выводил в значительных объемах за границу, где «он и его родственники приобретают недвижимость, автомобили, яхты и иные предметы роскоши, а доходы организаций не идут на повышение зарплаты сотрудников и на поддержание безопасной работоспособности оборудования, что влечет наступление чрезвычайных ситуаций». В августе 2024 года по решению Уральского управления Ростехнадзора на 90 суток были приостановлены горные работы на карьерах «Березняковский», «Светлинское», «Курасан», «Южный Курасан» в Челябинской области из-за нарушений требований промбезопасности. В результате добыча золота на Уральском хабе группы компаний «Южуралзолото» по итогам прошлого года сократилась почти вдвое — с 6,6 до 3,4 т. 3 июля в челябинских офисах компаний, связанных со Струковым, прошли обыски, писал РБК. В тот же день бизнесмен сообщил агентству Ura.ru, что находится в Хакасии, где ему вручили награду, а также сказал, что никуда из России не уехал и не собирается этого делать. В правительстве республики сообщили, что Струкову вручили орден «За заслуги перед Хакасией». В ходе разбирательства по иску Генпрокуратуры Сергей Евтеев, гендиректор коммерческих фирм, бенефициаром которых является Струков, дал показания, из которых следует, что бизнесмена связывали неформальные отношения со многими чиновниками, включая челябинского губернатора Алексея Текслера и его супругу Ирину Текслер, писал «Коммерсантъ». Как утверждал Евтеев, Струков лично готовил для супругов Текслер продовольственные наборы с яблоками, овощами и соком собственного производства. Кроме того, жене Текслера и его заместителю Анатолию Векшину дарили абонементы в фитнес-клуб, которым руководит Евтеев. По просьбе Ирины Текслер периодически устраивались ужины в принадлежащем Струкову ресторане БЦ «Челябинск-Сити», где у нее была 25-процентная скидка, а за счет средств УК «ЮГК» оплачивались счета за два фуршета в парке «Зарядье» в Москве на суммы от 400 тыс. до 800 тыс. руб. по случаю празднования в январе 2024 и 2025 годов дня рождения ее мужа, говорил Евтеев. Читайте РБК в Telegram.	7	\N	2025-07-11 16:15:03	2025-07-11 16:15:03
1472	7037	chto-evropeyskie-soyuzniki-poobeshchali-ukraine-na-sammite-v-rime	Что европейские союзники пообещали Украине на саммите в Риме	https://s0.rbk.ru/v6_top_pics/media/img/8/09/347522308318098.jpeg	В столице Италии завершилась Конференция по восстановлению Украины. Европа и США намерены и дальше помогать ей оружием. Сроки третьего раунда переговоров между Москвой и Киевом по-прежнему неясны. Подробнее — в материале РБК Фото: Remo Casilli / Reuters 11 июля в Риме завершилась двухдневная Конференция по восстановлению Украины (Ukraine Recovery Conference — URC). Ее работа идет по четырем направлениям: бизнес, человеческий капитал, местные и региональные проблемы, вступление в ЕС и реформы на этом пути. По этим темам на встрече состоялись пленарные сессии, панельные дискуссии и семинары с участием политиков, бизнесменов, представителей гражданского общества. Но примечательна конференция была не решениями насчет реконструкции Украины, а новыми заявлениями о ее военной поддержке и мирном урегулировании. Конференция в Риме — четвертая встреча в таком формате. Предыдущие три прошли в 2022, 2023, 2024 годах в Лугано, Лондоне и Берлине соответственно. Конференция по восстановлению выросла из Конференции по реформированию Украины — в этом формате украинские власти и их международные партнеры встречались в 2017, 2018, 2019 и 2021 годах. Какие решение приняты относительно помощи Украине rbc.group Европейские союзники анонсировали в Риме создание специального фонда для реконструкции страны с первоначальным капиталом €220 млн. В проекте примут участие Италия, Германия, Франция и Европейский инвестиционный банк. Ожидается, что к 2026 году они смогут привлечь €500 млн. Глава Еврокомиссии Урсула Фон дер Ляйен также представила новый пакет соглашений с международными и государственными финансовыми учреждениями на сумму почти €2,4 млрд, которые будут направлены на поддержку восстановления Украины. В рамках этой инициативы €1,8 млрд будут выделены в виде кредитных гарантий, а остальные средства (€580 млн) — в виде грантов. В Брюсселе рассчитывают, что программа позволит привлечь до €10 млрд инвестиций. rbc.group Конкретные предложения выдвинули и отдельные страны ЕС. В частности, глава МИД Нидерландов Каспар Велдкамп пообещал выделить €300 млн на восстановление страны, из них — €30 млн в рамках программы Ukraine Partnership Facility. В Риме обсуждали и дальнейшую военную помощь. 10 июля там прошла встреча «коалиции желающих» — группы из 30 поддерживающих Украину стран, преимущественно европейских, создание которой инициировали после возвращения в Белый дом Дональда Трампа Великобритания и Франция. Впервые в ее заседании участвовали делегаты США — спецпредставитель президента по Украине Кит Келлог и два сенатора — республиканец Линдси Грэм (в России включен в перечень террористов и экстремистов) и демократ Ричард Блюменталь. В Москве последовательно осуждают поставки западного оружия Украине, утверждая, что они только затягивают военный конфликт. В день встречи коалиции стало известно, что Трамп готовится одобрить новый пакет военной помощи, — по данным Reuters, его объем составит порядка $300 млн и в него могут войти системы Patriot и ракеты средней дальности. Правда, источники финансирования эти поставок остались неясными. Не исключено, что они будут европейскими — в интервью NBC 10 июля Трамп заявил, что США отправляет оружие НАТО, «а затем НАТО поставляет это оружие Украине, и НАТО платит за это оружие». Украина до этого, опасаясь, что американские поставки закончатся, заявила, что готова покупать у США оружие. «Мы передавали американской стороне большой пакет, который мы хотим купить. Купить в том или ином виде», — заявил в апреле президент Украины Владимир Зеленский, оценивая возможные закупки в $50 млрд. Прежде новая американская администрация не принимала решений о поставках оружия — в этом году они шли в рамках пакета объемом $3,86 млрд, который перед уходом из Белого дома одобрил Джо Байден. США дважды приостанавливали эти поставки — в первый раз в марте, через несколько дней после малоудачного визита украинского лидера в Белый дом, и затем в начале июля (американцы объяснили это «стандартной проверкой» предоставляемой США военной помощи). В обоих случаях пауза длилась около недели. «Мы собираемся отправить больше оружия. Мы должны. Они должны иметь возможность защищать себя. Они сейчас получают очень сильные удары. Мы собираемся отправлять больше оружия, в первую очередь оборонительного», — заявил Трамп 8 июля. Состав нынешнего пакета американской помощи официально не был обнародован. Зеленский 10 июля сообщил лишь, что на встрече с Келлогом в Риме они обсудили закупки американского оружия, усиление противовоздушной обороны (ПВО), совместное оборонное производство и его локализацию на Украине. Киев также настаивает на новых антироссийских санкциях, в частности, введения вторичных рестрикций против покупателей российской нефти; эту тему Зеленский обсуждал с Грэмом и Блюменталем. Как отмечает Politico, у европейских союзников складывается впечатление, что американская администрация действует крайне нескоординированно на украинском направлении. «Многие лидеры стран НАТО просто пытаются угнаться за меняющимися настроениями в Вашингтоне», — сказал собеседник издания. Канцлер ФРГ Фридрих Мерц обратился в Риме с посланием к Трампу. «Оставайтесь с нами, с европейцами», — сказал он, добавив, что у них с американцами схожие интересы. Ранее Мерц заявил, что дипломатические способы урегулирования конфликта исчерпаны, и пообещал продолжить поддержку Украины. На конференции в Риме он также подтвердил готовность Германии профинансировать для Киева покупку двух ЗРК Patriot. «Я обсудил этот вопрос с Трампом и также попросил его поставить эти системы», — сказал канцлер, уточнив, что министры обороны США и Германии ведут соответствующие переговоры, но окончательное решение еще не принято. На полях конференции Мерц и Зеленский также обсудили расширение сотрудничества в оборонной области (в мае страны согласовали схему совместного производства дальнобойного оружия на Украине). 11 июля, комментируя выступление Мерца, пресс-секретарь президента России Дмитрий Песков назвал канцлера ФРГ «яростным апологетом конфронтационности во всем с Россией и агрессивной мобилизации Европы» и заявил, что Москва это учитывает при планировании дальнейших действий. Есть ли прогресс в урегулировании конфликта О дипломатическом урегулировании на Украине сейчас, в отличие от весны 2025 года, говорят гораздо меньше. Москва и Киев провели два раунда прямых консультаций в Стамбуле — 16 мая и 2 июня, после которых обменялись военнопленными по формуле «1 тыс. на 1 тыс.» и проводят обмены телами погибших солдат по формуле «6 тыс. на 6 тыс.». На второй встрече делегации передали друг другу меморандумы с мирными предложениями; предполагалось, что их обсудят на третьем заседании. Российские представители говорили, что ее дату согласуют после 22 июня, но она так и не объявлена. «Он [процесс] продолжается. Работа идет, но здесь, я еще раз повторяю, мы ждем предложения украинской стороны по срокам продолжения раундов двусторонних прямых переговоров», — заявил 11 июля Песков. Зеленский же считает, что до тех пор, пока не завершатся все согласованные на второй встрече обмены, третьего раунда не будет. По мнению украинского лидера, для «достижения серьезного результата» и «окончания войны» надо готовить встречу президентов — наиболее желаемой он назвал саммит России, Украины и США. Вашингтон тем временем усиливает критическую риторику в адрес Москвы. В последнее время состоялось уже шесть телефонных разговоров между Путиным и Трампом, последний — 3 июля, и после него президент США заявил, что недоволен и «не добился никакого прогресса» в урегулировании. В интервью NBC глава Белого дома сказал, что «разочарован в России», и пообещал 14 июля сделать «важное заявление». 10 июля на полях АСЕАН в Куала-Лумпуре прошла встреча главы российского внешнеполитического ведомства Сергея Лаврова с госсекретарем США Марко Рубио. По словам Рубио, Лавров передал ему новые предложения об урегулировании, которые он отправил в Вашингтон. «Это не гарантирует достижение мира, но это концепция, которую я передам президенту сразу по возвращении», — сказал политик и напомнил: американская администрация обсуждает с Конгрессом законопроект о новых санкциях против России. «Президент Дональд Трамп сказал, что это доступная для него опция», — подчеркнул Рубио. Европейцы также продолжают проработку предложений об урегулировании. К моменту консультаций в Риме их идея направить миротворческие силы на Украину для контроля над режимом прекращения огня приобрела более предметные очертания. Заявления на этот счет сделали президент Франции Эммануэль Макрон и премьер-министр Великобритании Кир Стармер, которые присоединились к встрече по видеосвязи из Лондона. Макрон сообщил, что численность франко-британских экспедиционных сил, которые могут послужить основой для военного контингента на Украине, может быть увеличена до 50 тыс. человек. Стармер анонсировал создание постоянной штаб-квартиры «коалиции желающих» — сначала ее разместят в Париже, а через 12 месяцев переведут в Лондон; в перспективе отделение организации также должно появиться в Киеве. По словам британского премьера, приоритет коалиции — «обеспечить максимальную устойчивость» Украины при прекращении огня. Что значит решение Британии и Франции создать ядерный альянс Политика Как ожидается, европейские силы будут включать в себя экспертов по логистике и инструкторов; их цель — восстановить вооруженные силы Украины, а также обеспечить безопасность украинского неба и Черного моря. По-прежнему не определена роль США в этой инициативе, хотя европейские союзники рассчитывают на гарантии безопасности от Вашингтона. В апреле The Telegraph сообщала, что Соединенные Штаты согласились предоставить разведывательную и логистическую поддержку «коалиции желающих», однако официальных заявлений на этот счет так и не последовало. По итогам заседания «коалиции желающих» правительство Великобритании опубликовало совместное заявление. В нем отмечено, что участники «поддерживают дальнейшие мирные переговоры между Украиной и Россией, высоко оценивая усилия президента Трампа по налаживанию мирного процесса при поддержке США и других партнеров». А пока продолжаются боевые действия, «коалиция желающих» согласилась уделять первоочередное внимание обеспечению Украины военной и финансовой поддержкой. В частности, они подтвердили готовность предоставить в этом году не менее €40 млрд, что соответствует обязательству, которое страны-члены НАТО взяли на себя в 2024 году.	10	\N	2025-07-11 16:25:01	2025-07-11 16:25:01
1473	7063	politico-rasskazalo-ob-utrate-doge-poziciy-i-roli-posle-uhoda-maska	Politico рассказало об утрате DOGE позиций и роли после ухода Маска	https://s0.rbk.ru/v6_top_pics/media/img/5/14/347522352273145.jpeg	DOGE покинули как минимум восемь человек, занимавших при Маске руководящие должности, также ушли некоторые другие высокопоставленные сотрудники. Департамент стал сокращать активность после ухода Маска с госслужбы в конце мая Илон Маск (Фото: Kevin Dietsch / Getty Images) Некоторые из ключевых сотрудников Департамента эффективности государственного управления (DOGE), работавших в ведомстве при первом составе под руководством предпринимателя Илона Маска, покинули правительство США. Об этом сообщает Politico со ссылкой на внутренние документы и источники, знакомые с ситуацией. По данным газеты, как минимум восемь ключевых сотрудников из первого состава DOGE уволились из администрации США. Это: Стив Дэвис, операционный директор DOGE; Николь Холландер, руководившая сокращением правительственного вмешательства в разные сферы; Брэд Смит, возглавлявший команду DOGE в Министерстве здравоохранения и социальных служб, осуществивший наиболее масштабные кадровые сокращения; Крис Стэнли, помощник Маска, продвигавший распространение спутниковых терминалов Starlink; Кэти Миллер, директор по коммуникациям DOGE; Аманда Скейлз, бывший руководитель аппарата управления кадровой политики. Одна из первых людей, курировавших в DOGE исключения из массовых увольнений; главный юрисконсульт DOGE Джеймс Бернхэм; Том Краузе, ранее занимавший должность замглавы американского Минфина по налогам. rbc.group Экс-сотрудник DOGE заявил, что без Маска департамент «заскулит» Политика rbc.group Высокопоставленный чиновник Белого дома, с которым поговорило Politico, связал увольнения с тем, что многие сотрудники DOGE, как и Маск, были особыми государственными служащими. Срок их полномочий строго ограничен. Источник также отметил, что названные руководители DOGE «никогда не планировали делать карьеру в правительстве». Также, пишет Politico, как минимум семь сотрудников DOGE, большинство из которых имели высокий уровень доступа в нескольких федеральных ведомствах, ушли со своих постов. По меньшей мере еще трое готовятся уйти, утверждает газета со ссылкой на другой осведомленный источник и внутренние документы. Спустя полтора месяца после ухода Маска с госслужбы DOGE в значительной степени утратил свои позиции из-за отставок, судебных исков, бюрократических препон и потери идейного вдохновителя, пишет газета. В течение шести месяцев любой человек, желающий попасть в штаб-квартиру DOGE на шестом этаже здания Управления общих служб, должен был сначала пройти мимо вооруженной охраны, все имена сверялись с заранее утвержденным списком. Теперь, как пишет Politico, охраны на месте нет, табличку в лифте рядом с кнопкой шестого этажа с надписью «Доступ только авторизованным лицам» также убрали. DOGE — временный федеральный орган США, созданный в январе 2025 года по указу президента Дональда Трампа. Его куратором был миллиардер и близкий соратник Трампа Илон Маск. Задача DOGE — сокращение государственных расходов и реструктуризация федеральных агентств. В команду DOGE первоначально входили более 50 человек, примерно треть из которых раньше работала с Маском в Tesla, SpaceX и других его компаниях. После ухода Маска с госслужбы в конце мая департамент стал постепенно сокращать активность. Отношения Трампа и Маска ухудшились. Читайте РБК в Telegram.	3	\N	2025-07-11 16:35:02	2025-07-11 16:35:02
1474	7074	sobyanin-ocenil-nadezhnost-moskovskoy-sistemy-zashchity-ot-dronov	Собянин оценил надежность московской системы защиты от дронов	https://s0.rbk.ru/v6_top_pics/media/img/8/36/347522390464368.jpeg	Московская система противодействия дронам, возникшая через совместную работу госструктур, городских служб и содействия жителей, показала высокую надежность, заявил Собянин. Ранее он говорил, что ПВО Москвы сбивает 99,9% целей Фото: Кирилл Каллиников / РИА Новости Московская система противодействия дронам прошла достаточно большие испытания и демонстрирует высокую степень надежности. Об этом заявил мэр Москвы Сергей Собянин. Он отметил, что город активно поддерживает российские Вооруженные силы в борьбе с атаками дронов. «Мы со своей стороны всемерно помогаем противовоздушной обороне с помощью всех своих технологических и информационных достижений, обеспечения строительства новых позиций, взаимодействия между различными службами», — рассказал мэр. Собянин сообщил об уничтожении еще одного дрона, летевшего на Москву Политика В обеспечении безопасности, как уточнил Собянин, задействованы такие ведомства, как Росгвардия и МВД, а также система «112», городские аварийные службы. Кроме того, в этом принимают участие и сами москвичи. Совместная работа всех этих структур и служб создала эффективную систему защиты Москвы, заключил глава города. rbc.group Москва периодически подвергается атакам беспилотников на фоне военной операции, из-за этого городские аэропорты регулярно приостанавливают полеты. Накануне и позавчера Собянин также сообщал об уничтожении нескольких дронов на подлете к столице. Если ПВО сбивает больше 80% целей — это отличный результат, а система воздушной обороны Москвы сбивает свыше 99% целей, говорил Собянин в конце июня в интервью телеканалу РБК. «В мире никто ничего подобного не достигал», — подчеркивал мэр. Video Читайте РБК в Telegram.	3	\N	2025-07-11 16:45:01	2025-07-11 16:45:01
1476	7106	mosbirzha-i-spb-birzha-nazvali-datu-vozobnovleniya-torgov-akciyami-yugk	Мосбиржа и СПБ Биржа назвали дату возобновления торгов акциями ЮГК		Мосбиржа и СПБ Биржа приостановили торги акциями ЮГК 4 июля. В ЦБ пояснили, что рынку нужно дать время, чтобы успокоиться. До этого акции ЮГК за три дня обвалились на 29% на фоне обысков и иска Гепрокуратуры Южуралзолото UGLD — Лензолото LNZL -10,1% Лензолото LNZLP -19,91% «Полюс» PLZL -1,33% Золото GOLD +1,04% «Бурятзолото» BRZL -3,34% Фото: Илья Наймушин / РИА Новости Мосбиржа и СПБ Биржа  с 14 июля возобновят торги акциями одной из крупнейших золотодобывающих компаний России ЮГК («Южуралзолото»). Торги возобновятся в связи с отменой предписания Банка России. Об этом говорится в сообщениях торговых площадок. На Мосбирже торги стартуют с аукциона открытия (09:50–10:00 мск). 14 июля акции ЮГК будут доступны на основной и вечерней торговых сессиях. В последующие дни сделки с бумагами компании можно будет заключать во всех торговых сессиях. На СПБ Бирже торги акциями ЮГК начнутся 14 июля в 10:00 мск и будут доступны участникам торгов для совершения сделок во всех режимах. С 15 июля торги будут проводиться во всех режимах по стандартному расписанию с 07:00 мск. В будние дни в режиме основных торгов акции ЮГК будут доступны для заключения сделок с 07:00 до 23:50 мск, включая утреннюю и вечернюю дополнительные сессии. rbc.group В выходные дни начиная с 19 июля акции ЮГК на СПБ Бирже будут доступны для заключения сделок в режиме основных торгов с 10:00 до 23:50 мск. Мосбиржа и СПБ Биржа приостановили торги акциями «Южуралзолота» (UGLD) 4 июля по предписанию Банка России. В связи с ситуацией, когда возникла очень высокая волатильность по этой бумаге и потенциальные очень высокие потери, неоправданные для инвесторов, ЦБ принял решение временно приостановить торги данным инструментом, чтобы дать рынку успокоиться, заявил зампред ЦБ Филипп Габуния в кулуарах Финансового конгресса в Санкт-Петербурге. Банки начали снимать арест с акций «Южуралзолото». Что об этом известно Капитализация  компании «Южуралзолото» упала в общей сложности более чем на 29% за три дня на фоне обысков в офисах золотодобытчика, а также иска Генпрокуратуры об изъятии доли мажоритарного акционера. Согласно данным терминала TradingView, последняя сделка с бумагами золотодобывающей компании была совершена 4 июля в 10:29 мск. Котировки закрылись на отметке ₽0,4768 (-0,13% к закрытию предыдущей торговой сессии). Объем free-float компании ЮГК по состоянию на 4 июля составил 10%, а капитализация на момент остановки торгов — ₽106,22 млрд. На торгах 2 июля акции ЮГК обрушились почти на 15% после сообщения о том, что ФСБ и Следственный комитет провели обыски в подразделениях «Южуралзолота». По словам источника РБК, обыски связаны с тем, что ранее были выявлены нарушения правил охраны окружающей среды, промышленной безопасности и эксплуатации промышленных объектов на земельных участках ЮГК в Пластовском и Еткульском районах Челябинской области. В самом «Южуралзолоте» сообщали, что компания работает штатно. В четверг, 3 июля, стало известно, что Генпрокуратура России подала в суд иск об обращении в доход государства доли основного владельца «Южуралзолота» Константина Струкова. Генпрокуратура считает, что Струков незаконно получил ЮГК и еще десять компаний под контроль, используя свои должности и положение в органах госвласти. В тот же день Советский районный суд Челябинска одобрил ходатайство Генпрокуратуры об обеспечительных мерах по иску об обращении в доход государства активов Константина Струкова. Суть обеспечительных мер не раскрывалась. Акции отреагировали на новость об иске новым падением почти на 17%. ЮГК могут передать в госсобственность. Какие риски у частных инвесторов 9 июля сразу три брокерских подразделения крупных банковских групп ввели ограничения по акциям «Южуралзолота», в том числе и у частных инвесторов. Первым об аресте акций на основании судебного решения сообщил брокер ВТБ, затем брокер Альфа-банка, третьим был брокер Сбербанка. Но уже утром 11 июля пресс-служба «Сбера» объявила о том, что брокер снял ограничения по акциям ЮГК на основании нового документа суда, затем брокер Альфа-банка также снял арест с акций «Южуралзолота» на основании определения суда, сообщили «РБК Инвестициям» в пресс-службе финансовой организации. В документе суда, на который ссылались брокеры, уточняется, что блокировка активов не распространяется на миноритарных акционеров. Брокер ВТБ также снял ограничения по акциям ЮГК после того, как получил новый судебный документ, касающийся операций с акциями золотодобытчика, принадлежащими миноритариям. В связи с этим ограничения были сняты, а бумаги возвращены на торговый раздел, сообщил «РБК Инвестициям» представитель ВТБ. В пятницу, 11 июля, стало известно, что Советский районный суд Челябинска по иску Генпрокуратуры конфисковал доли в золотодобывающей группе компаний «Южуралзолото» и другие активы бизнесмена Струкова и его окружения в доход государства. Суд проходил в закрытом режиме. Суд снял требования ареста с акций миноритариев «Южуралзолота» Альфа-Банк , Южуралзолото , Акции ЮГК была основана в 1997 году. Это одна из крупнейших золотодобывающих компаний России. По собственной оценке, компания занимает четвертое место в стране по объему добычи и второе — по ресурсной базе. Компания работает в Челябинской области, Красноярском крае и Хакасии. ЮГК производит 450 тыс. унций золота в год. Первичное публичное размещение акций ЮГК на Московской бирже состоялось 22 ноября 2023 года. Бумаги торгуются под тикером  UGLD. С 20 декабря 2024 года акции компании были включены в базу расчета индекса Мосбиржи и индекса РТС. Стоимость компании на рынке, рассчитанная из количества акций компании, умноженного на их текущую цену. Капитализация фондового рынка – суммарная стоимость ценных бумаг, обращающихся на этом рынке. Краткое обозначение акций компании, валюты или товара на бирже. Чаще всего состоит из букв, использованных в названии компании. Реже — из цифр (на азиатских биржах). В тикерах облигаций указаны базовые характеристики ценной бумаги — обычно цифрами. Тикеры валют состоят из трех букв. Первые две обозначают страну, а третья — первая буква в названии валюты (например, RUR — это российский рубль, а USD — доллар США). Регламентированный рынок, где встречаются продавцы и покупатели, торгующие различными активами: акциями, облигациями, валютой, фьючерсами, товарами. Стать участником торгов на бирже может каждый – для этого нужно открыть брокерский счет. Каждая сделка заключается по рыночной цене, совершается практически мгновенно, а также регистрируется и контролируется. Подробнее	10	\N	2025-07-11 17:05:02	2025-07-11 17:05:02
1477	7132	zvezdy-nhl-razgromili-igrokov-khl-v-matche-goda-s-perevesom-v-12-shayb	Звезды НХЛ разгромили игроков КХЛ в «Матче года» с перевесом в 12 шайб	https://s0.rbk.ru/v6_top_pics/media/img/0/27/347524302579270.jpeg	Звезды НХЛ, среди которых были Александр Овечкин, Артемий Панарин и Евгений Малкин, провели в Москве «Матч года» с лучшими игроками КХЛ. Встреча завершилась со счетом 15:3 Александр Овечкин (Фото: Сергей Савостьянов / ТАСС) Команда из российских игроков Национальной хоккейной лиги (НХЛ) обыграла сборную Континентальной хоккейной лиги (КХЛ) в благотворительном «Матче года». Встреча на «ЦСКА Арене» в Москве завершилась со счетом 15:3. У команды российских игроков НХЛ хет-триком отметился Василий Подколзин, по две шайбы забросили Максим Цыплаков и Кирилл Марченко. По разу отличились Артемий Панарин, Андрей Свечников, Павел Бучневич, Евгений Малкин, Александр Овечкин, Кирилл Капризов, Матвей Мичков и Андрей Кузьменко. В составе КХЛ голами отметились Илья Ковальчук, Виталий Кравцов и Николай Голдобин. В буллитной серии победу также одержала команда НХЛ (2:1). rbc.group Первый номер драфта НХЛ-2012 рассказал об «удивительных событиях» в КХЛ Спорт rbc.group Подобный матч прошел во второй раз. В 2024 году встреча завершилась со счетом 8:8. Тогда  «Матч года» собрал более 12 тыс. зрителей и 10 млн руб.	1	\N	2025-07-14 07:55:01	2025-07-14 07:55:01
1478	7127	ofz-zoloto-ili-akcii-kuda-vlozhit-dividendy-i-chto-vazhno-znat-investoru	ОФЗ, золото или акции: куда вложить дивиденды и что важно знать инвестору		В июле-августе инвесторы получат ₽460 млрд дивидендов и только часть из них будет реинвестирована в рынок акций, посчитали в инвестбанке «Синара». «РБК Инвестиции» спросили аналитиков, куда выгоднее вложить средства Сбербанк SBER -1,32% ЛУКОЙЛ LKOH -1,7% «Газпром» GAZP -0,54% По подсчетам инвестиционного банка «Синара», с июля по начало августа частные инвесторы получат около ₽460 млрд дивидендов (Фото: Shutterstock) Материал носит исключительно ознакомительный характер и не содержит индивидуальных инвестиционных рекомендаций. В этой статье: Стоит ли покупать акции К каким компаниям присмотреться Каких компаний лучше избегать Топ-5 альтернативных инструментов Какие вопросы задать себе для взвешенного решения rbc.group В этом дивидендном сезоне сразу несколько эмитентов  отказались выплачивать дивиденды, объяснив такое решение необходимостью оставить средства для поддержания финансовой стабильности. Но большая часть компаний все же утвердила распределение прибыли между акционерами. Как подсчитал персональный брокер инвестиционного банка «Синара» Артем Рассказов, из приблизительно ₽2 трлн дивидендов, которые ожидаются с июля по начало августа, лишь около ₽460 млрд достанется физлицам и только часть этих средств будет реинвестирована обратно в российский рынок акций. Перед инвесторами сейчас стоит вопрос: куда вложить полученные выплаты? Выбор неочевиден: цены на рынке акций привлекательны, но для краткосрочных вложений бумаги несут высокие риски. В то же время интересны длинные ОФЗ, которые дают возможность зафиксировать высокую доходность. «РБК Инвестиции  » разбирались с аналитиками, куда выгоднее вложить полученные в этом сезоне дивиденды  в зависимости от горизонта инвестиций и степени риска. Стоит ли реинвестировать дивиденды в акции Руководитель отдела инвестиционного консультирования «Т-Инвестиций» Кирилл Комаров рекомендует реинвестировать дивиденды обратно в рынок акций, пользуясь его дешевизной. «На наш взгляд, сейчас рынок акций может находиться на локальном дне и получить новый драйвер роста в ближайшие недели, по мере того как будет приближаться июльское решение по ставке и при условии, что выходящие макроданные не ухудшат текущих трендов», — говорит Комаров. Опрошенные аналитики при этом обращают внимание на горизонт вложений — чем он меньше, тем выше риски. С горизонтом вложения один год Большинство экспертов отметили, что реинвестирование на короткий срок — один год — в условиях неопределенности несет большие риски. «В базовом прогнозе мы ожидаем рост российского рынка на факторе смягчения ДКП, но также видим риски рецессии  части экономики, не связанной с ВПК. Поэтому инвестор, скорее всего, столкнется с высокой волатильностью  и рискует сделать ставку не на те акции», — предостерегает инвестиционный стратег ИК «Алор Брокер» Павел Веревкин. По его мнению, сейчас высокие ставки делают альтернативные инструменты, такие как облигации  или банковские депозиты, более привлекательными в краткосрочной перспективе, поскольку они обеспечивают предсказуемую доходность с меньшим риском. Инвестиционный консультант ФГ «Финам» Иван Пуховой соглашается, что если инвестор планирует вывести через год вложенные средства, то акции будут не лучшей идеей, так как можно получить убыток. По его мнению, чем короче срок инвестирования, тем более консервативный инструмент стоит выбирать. В свою очередь, эксперт по фондовому рынку «БКС Мир инвестиций» Андрей Смирнов считает, что на горизонте года можно получить потенциальную двузначную доходность от реинвестирования в бумаги после дивгэпа. По его словам, подобным образом инвестор усредняет позицию, автоматически рассчитывая на закрытие гэпа  к следующей выплате. Артем Рассказов из инвестбанка «Синара» считает, что для инвесторов, рассматривающих горизонт инвестирования от одного года, покупка акций может стать одним из наиболее успешных вложений. «В нашем базовом сценарии целевой уровень индекса Мосбиржи на конец 2025 года — 3450 пунктов. Рост от текущих значений в этом случае может составить 28% за второе полугодие 2025 года», — поясняет Рассказов. С горизонтом вложения 3-5 лет По мнению Андрея Смирнова, долгосрочный горизонт для акций выглядит более перспективным. «За 3-5 лет рынок имеет свойство сглаживать большинство шоков, что не исключает рисков. Кроме того, включается в работу эффект сложного процента», — говорит он. Павел Веревкин из «Алор Брокер» соглашается, что долгосрочные инвестиции позволяют сгладить краткосрочные колебания рынка, а эффект сложного процента от реинвестирования дивидендов может значительно увеличить капитал. Аналогичной точки зрения придерживается и Иван Пуховой из «Финама». «Срок 3-5 лет уже более похож на оптимальный для акций, так как есть время переждать просадки и застои на рынке и потенциально получить еще несколько раз денежные потоки», — поясняет он. Минфин оценил массовый отказ компаний от дивидендов за 2024 год Минфин , Обмен заблокированными активами , Санкции , ПМЭФ Какие акции перспективны для вложения дивидендов Если инвестор хочет реинвестировать дивиденды обратно в рынок акций, то интересными могут быть некоторые банки и компании, ориентированные на внутренний рынок (Фото: Shutterstock) По мнению Павла Веревкина, реинвестировать дивиденды прежде всего стоит в компании банковского сектора. Среди них эксперт выделяет Сбербанк, отмечая его высокую рентабельность, стабильные финансовые результаты и ожидаемые дивиденды в 2026 году на уровне ₽35-36 на акцию. А также «Т-Технологии», драйвером для которого выступает интеграция с Росбанком, и Совкомабнк — по оценке Веревкина, при снижении ключевой ставки бумаги будут расти опережающими темпами. Кроме того, аналитик выделяет «Яндекс» с высоким темпом роста выручки и «Транснефть» за счет предсказуемого денежного потока, не зависящего от конъюнктуры на сырьевых рынках, и потенциально высоких дивидендов по итогам 2025 года. Ведущий аналитик «Цифра брокер» Наталия Пырьева считает, что в текущих реалиях стоит рассматривать бумаги компаний, ориентированных на внутренний рынок, которые обладают сильной финансовой позицией, запасом ликвидности  и комфортной долговой нагрузкой. К таким эмитентам она относит Сбербанк, «Ренессанс Страхование», «Мать и дитя», «Полюс». Помимо этого, по мнению Пырьевой, небольшую часть портфеля можно отвести на бумаги быстро развивающихся фармацевтических компаний — «Промомеда» и «Озон Фармацевтики». Кирилл Комаров из «Т-Инвестиций» назвал шесть перспективных компаний для вложения полученных дивидендов в этом сезоне и обозначил драйверы их роста: ЛУКОЙЛ. Финансово устойчивая компания с объемной чистой денежной позицией, стабильными дивидендами и дисконтом более 40% к историческому уровню EV/EBITDA. Cбербанк. Крупнейший в стране банк демонстрирует устойчивость к росту стоимости фондирования и сохраняет высокую рентабельность капитала даже в сложной макросреде. «Полюс». Золотодобытчик интересен в первую очередь из-за благоприятной конъюнктуры на рынке золота. В «Т-Инвестициях» ожидают, что цены на драгметалл останутся на высоком уровне в 2025 году, позволяя «Полюсу» поддерживать высокую маржу и продолжать стабильно выплачивать дивиденды. X5. Аналитики считают, что крупнейший продовольственный ретейлер в России может преподнести дивидендный сюрприз. Суммарно в 2025 брокер ждет от компании ₽1030 дивидендов на акцию. Дивидендная доходность на следующие 12 месяцев, при таких дивидендах, около 30%. Это существенно выше текущего консенсус-прогноза. «Яндекс» и Ozon. Эти компании продолжают наращивать рентабельность при сохранении значительного потенциала для дальнейшего роста. Кроме того, их акции не выглядят дорогими по мультипликаторам. Герман Греф назвал активы для вложения ₽1 млн на год и 5 лет Сбербанк , Герман Греф , Акции , Вклад , ПМЭФ К каким акциям стоит отнестись осторожно В то же время примерами неоднозначных бумаг для реинвестирования могут выступать обыкновенные акции МТС и привилегированные акции «Татнефти», говорит Андрей Смирнов из БКС. «Финансовая модель и конъюнктура рынка ставит под сомнение скорый возврат котировок к прежним отметкам. Кроме того, размер будущих выплат остается под вопросом», — поясняет Смирнов. По его мнению, не стоит покупать и бумаги компаний, которые демонстрируют слабые результаты в текущей рыночной конъюнктуре, а именно «Норникель», НЛМК (и весь металлургический сектор), АЛРОСА, «Газпром», «Магнит». Эксперт считает, что перспективы будущих щедрых дивидендов туманны, а финансовые результаты не позволяют говорить об устойчивом росте. Артем Рассказов из инвестбанка «Синара» худшую динамику ожидает от IT-сектора и компаний с большим free-float за рубежом («Татнефть», НОВАТЭК, «Норникель», НЛМК, «Магнит», МТС), так как риск навеса расконвертированных акций российских эмитентов и расписок в Euroclear по-прежнему велик. Иван Пуховой из «Финама» к аутсайдерам в вопросе реинвестирования отнес компании с высоким долгом — «Мечел» и «Сегежу». Аналитики «ВТБ Мои Инвестиции» обновили топ-10 акций России ВТБ , Россия , Акции , Норникель , Полюс , Русал , Ростелеком Топ-5 альтернативных вариантов инвестиций Помимо акций, реинвестировать дивиденды можно в ОФЗ, корпоративные и замещающие облигации, а также в золото и валюту (Фото: Shutterstock) ОФЗ. По мнению Ивана Пухового, текущая ситуация уникальна тем, что дает возможность зафиксировать в дальних бумагах купонную доходность выше 11-12% годовых, что выше средней дивидендной доходности индекса Мосбиржи. «Причем этот денежный поток гарантирован государством. Для тех, кто ищет рублевые доходности на долгий срок, это идеальное решение», — считает эксперт. Корпоративные облигации. Как отмечает Андрей Смирнов, это инструменты с более высоким уровнем риска, которые позволяют увеличить ожидаемую доходность относительно ОФЗ. Кирилл Комаров также выделяет корпоративные рублевые облигации, поясняя, что пока ключевая ставка остается высокой, еще есть возможность купить среднесрочные облигации надежных эмитентов с доходностью выше 20%. Он полагает, что по мере разворота монетарной политики Банка России можно дополнительно заработать на росте их рыночной стоимости. Замещающие облигации. В этом случае речь также идет о дальних выпусках, говорит Иван Пуховой. Такие инструменты могут дать доходность около 5-6% годовых в долларах. «Однако валютная составляющая защищает капитал от обесценения национальной валюты. Данный инструмент больше подходит тем, кто измеряет свою жизнь в долларах», — считает Пуховой. Валюта. «Неожиданно доходными в текущем году могут стать инвестиции в инвалюты. Рубль остается чрезмерно крепким, несмотря на разностороннее влияние важных факторов, например, цен нефти. В связи с этим наиболее вероятно ослабление рубля к концу года», — говорит Андрей Смирнов. Золото. «Несмотря на то, что потенциал роста стоимости драгметалла в долларах выглядит ограниченным в рамках 2025 года, для российского инвестора аномально крепкий рубль создает благоприятную точку входа в этот актив», — говорит Кирилл Комаров. По его словам, по мере потенциального ослабления национальной валюты рублевая цена золота будет расти, что обеспечит дополнительную рублевую доходность за счет валютной переоценки. Артем Рассказов также обращает внимание на то, что золото — проверенный временем защитный актив, который позволяет инвесторам частично застраховать риск геополитической нестабильности. В Goldman Sachs заговорили о долларе как о рискованной валюте Goldman Sachs , Доллар , Прогнозы Какие вопросы помогут принять решение по реинвестированию дивидендов Как мы уже разбирали выше, большое значение при выборе инструмента инвестиций играет горизонт вложений. Но есть еще несколько важных факторов, которые стоит учесть. Какова толерантность к риску? По мнению Павла Веревкина из «Алор Брокер», инвестор должен оценить, готов ли он к изменчивости цены акций или предпочитает консервативные инструменты — облигации или депозиты. По его словам, высокая толерантность к риску позволяет рассмотреть акции, тогда как низкая указывает на необходимость выбора менее волатильных активов. Иван Пуховой из «Финама» добавляет, что стоит обозначить конкретную цифру, сколько инвестор готов потерять на вложениях. Какие финансовые цели? Если цель — получение пассивного дохода, стоит сосредоточиться на акциях с высокой дивидендной доходностью или облигациях с регулярными купонными выплатами, считает Веревкин. Но если основная цель инвестора — увеличить капитал, то лучше рассмотреть акции роста. Планируются ли крупные траты в ближайшее время? Андрей Смирнов из «БКС Мир инвестиций» рекомендует определить, сколько денег инвестору нужно держать в кэше с учетом расходов на 3-6 месяцев и на 12 месяцев. Важен ли регулярный денежный поток? В таком случае стоит обращать внимание на интервальность выплат, если речь идет об облигациях или дивидендных акциях, говорит Артем Рассказов из инвестбанка «Синара». Какой доступный капитал и структура портфеля? Как считает Павел Веревкин, инвестор должен оценить, насколько полученные дивиденды значимы для его портфеля, и определить, нужно ли диверсифицировать вложения, например, между акциями, облигациями, драгметаллами для снижения рисков. Не превышает ли доля одной бумаги или сектора 15-20% портфеля? Если ответ — «да», то стоит провести ребалансировку портфеля. Что будет с экономикой? Андрей Смирнов рекомендует рассчитывать, как изменение ставки ЦБ, инфляции, курса рубля отразятся на выбранном активе. Термин, обозначающий вероятность быстрой продажи активов по рыночной или близкой к рыночной цене. Подробнее Макроэкономический термин, обозначающий значительное снижение экономической активности. Главный показатель рецессии – снижение ВВП два квартала подряд. Изменчивость цены в определенный промежуток времени. Финансовый показатель в управлении финансовыми рисками. Характеризует тенденцию изменчивости цены – резкое падение или рост приводит к росту волатильности. Подробнее Лицо, выпускающее ценные бумаги. Эмитентом может быть юридическое лицо (компании, органы исполнительной власти или местного самоуправления). Существенный ценовой разрыв между ценой бумаги в период между закрытием и открытием торгов. Долговая ценная бумага, владелец которой имеет право получить от выпустившего облигацию лица, ее номинальную стоимость в оговоренный срок. Помимо этого облигация предполагает право владельца получать процент от ее номинальной стоимости либо иные имущественные права. Облигации являются эквивалентом займа и по своему принципу схожи с процессом кредитования. Выпускать облигации могут как государства, так и частные компании. Инвестиции — это вложение денежных средств для получения дохода или сохранения капитала. Различают финансовые инвестиции (покупка ценных бумаг) и реальные (инвестиции в промышленность, строительство и так далее). В широком смысле инвестиции делятся на множество подвидов: частные или государственные, спекулятивные или венчурные и прочие. Подробнее Дивиденды — это часть прибыли или свободного денежного потока (FCF), которую компания выплачивает акционерам. Сумма выплат зависит от дивидендной политики. Там же прописана их периодичность — раз в год, каждое полугодие или квартал. Есть компании, которые не платят дивиденды, а направляют прибыль на развитие бизнеса или просто не имеют возможности из-за слабых результатов. Акции дивидендных компаний чаще всего интересны инвесторам, которые хотят добиться финансовой независимости или обеспечить себе достойный уровень жизни на пенсии. При помощи дивидендов они создают себе источник пассивного дохода. Подробнее	3	\N	2025-07-14 07:55:02	2025-07-14 07:55:02
1486	7125	chelsi-obygral-pszh-i-stal-pobeditelem-klubnogo-chempionata-mira	«Челси» обыграл ПСЖ и стал победителем клубного чемпионата мира	https://s0.rbk.ru/v6_top_pics/media/img/4/35/347524422325354.jpeg	Встреча завершилась со счетом 3:0 Фото: Luke Hales/Getty Images Лондонский «Челси» обыграл французский «Пари Сен-Жермен» в финале клубного чемпионата мира. Встреча на стадионе «Метлайф» завершилась со счетом 3:0. Забитыми мячами отличились полузащитник Коул Палмер (22-я и 30-я минуты) и форвард Жоао Педро (43). «Челси» обыграл ПСЖ в первом тайме финала клубного чемпионата мира Спорт rbc.group На 84-й минуте в составе ПСЖ прямую красную карточку получил Жоау Невеш. rbc.group Судья Антон Щетинин, выступающий под флагом Австралии уроженец России, стал ассистентом главного арбитра матча Алиреза Фагани. Палмер стал первым англичанином, оформившим дубль финале клубного чемпионата мира ФИФА. «Челси» второй раз в истории турнира стал чемпионом. Впервые клуб выиграл клубный чемпионат мира в 2022 году. В составе ПСЖ выступает российский голкипер Матвей Сафонов, который в этом матче остался в запасе.  В обновленном формате клубного мирового первенства впервые участвуют 32 клуба (вместо прежних семи) из шести конфедераций. Игры проходили на 12 стадионах в 11 городах США. Групповой этап состоял из восьми групп по четыре команды; в плей‑офф выходили первые два из каждой группы. Призовой фонд: $1 млрд — рекорд для футбольных клубных турниров. Чемпион получит до $125 млн, помимо солидарных выплат.	4	\N	2025-07-14 07:55:04	2025-07-14 07:55:04
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rbc-news
--

COPY public.users (id, name, email, role, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
1	Admin	admin@local	admin	\N	$2y$12$YvhOkyPJWfT6tyqcNAuXpug8ctxKP5ZzR3wgdBEdU4auVDs1OAntC	\N	2025-07-01 10:14:57	2025-07-01 10:14:57
2	Test User	test@example.com	regular	2025-07-01 10:14:57	$2y$12$CPuJVFyAc.6wXrGx9dNfu.1mXlDaJUG5NLuZpttnML6nPSV8pjWWi	PDbyIIO5TL	2025-07-01 10:14:57	2025-07-01 10:14:57
43	UserName	user@email	regular	\N	$2y$12$M7jL9xMBvOUqmWQjRoIdJuMyRKDXBILLmYzKHkyyEGIUtoXInBRUu	\N	2025-07-09 13:18:41	2025-07-09 13:18:41
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rbc-news
--

SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rbc-news
--

SELECT pg_catalog.setval('public.news_id_seq', 1486, true);


--
-- Name: page_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rbc-news
--

SELECT pg_catalog.setval('public.page_links_id_seq', 7148, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rbc-news
--

SELECT pg_catalog.setval('public.users_id_seq', 43, true);


--
-- PostgreSQL database dump complete
--

