--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

DROP DATABASE paintings;
--
-- Name: paintings; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE paintings WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE paintings OWNER TO postgres;

\connect paintings

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
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    index bigint,
    artist_id bigint,
    full_name text,
    first_name text,
    middle_names text,
    last_name text,
    nationality text,
    style text,
    birth bigint,
    death bigint
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- Name: canvas_size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.canvas_size (
    index bigint,
    size_id bigint,
    width bigint,
    height double precision,
    label text
);


ALTER TABLE public.canvas_size OWNER TO postgres;

--
-- Name: completedacct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.completedacct (
    index bigint,
    account_id text,
    district_id bigint,
    frequency text,
    parseddate text,
    year bigint,
    month bigint,
    day bigint
);


ALTER TABLE public.completedacct OWNER TO postgres;

--
-- Name: completedcard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.completedcard (
    index bigint,
    card_id text,
    disp_id text,
    type text,
    year bigint,
    month bigint,
    day bigint,
    fulldate text
);


ALTER TABLE public.completedcard OWNER TO postgres;

--
-- Name: museum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.museum (
    index bigint,
    museum_id bigint,
    name text,
    address text,
    city text,
    state text,
    postal text,
    country text,
    phone text,
    url text
);


ALTER TABLE public.museum OWNER TO postgres;

--
-- Name: museum_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.museum_hours (
    index bigint,
    museum_id bigint,
    day text,
    open text,
    close text
);


ALTER TABLE public.museum_hours OWNER TO postgres;

--
-- Name: product_size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_size (
    index bigint,
    work_id bigint,
    size_id text,
    sale_price bigint,
    regular_price bigint
);


ALTER TABLE public.product_size OWNER TO postgres;

--
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    index bigint,
    work_id bigint,
    subject text
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- Name: work; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.work (
    index bigint,
    work_id bigint,
    name text,
    artist_id bigint,
    style text,
    museum_id double precision
);


ALTER TABLE public.work OWNER TO postgres;

--
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artist (index, artist_id, full_name, first_name, middle_names, last_name, nationality, style, birth, death) FROM stdin;
\.
COPY public.artist (index, artist_id, full_name, first_name, middle_names, last_name, nationality, style, birth, death) FROM '$$PATH$$/3357.dat';

--
-- Data for Name: canvas_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.canvas_size (index, size_id, width, height, label) FROM stdin;
\.
COPY public.canvas_size (index, size_id, width, height, label) FROM '$$PATH$$/3358.dat';

--
-- Data for Name: completedacct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.completedacct (index, account_id, district_id, frequency, parseddate, year, month, day) FROM stdin;
\.
COPY public.completedacct (index, account_id, district_id, frequency, parseddate, year, month, day) FROM '$$PATH$$/3355.dat';

--
-- Data for Name: completedcard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.completedcard (index, card_id, disp_id, type, year, month, day, fulldate) FROM stdin;
\.
COPY public.completedcard (index, card_id, disp_id, type, year, month, day, fulldate) FROM '$$PATH$$/3356.dat';

--
-- Data for Name: museum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.museum (index, museum_id, name, address, city, state, postal, country, phone, url) FROM stdin;
\.
COPY public.museum (index, museum_id, name, address, city, state, postal, country, phone, url) FROM '$$PATH$$/3359.dat';

--
-- Data for Name: museum_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.museum_hours (index, museum_id, day, open, close) FROM stdin;
\.
COPY public.museum_hours (index, museum_id, day, open, close) FROM '$$PATH$$/3360.dat';

--
-- Data for Name: product_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_size (index, work_id, size_id, sale_price, regular_price) FROM stdin;
\.
COPY public.product_size (index, work_id, size_id, sale_price, regular_price) FROM '$$PATH$$/3361.dat';

--
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject (index, work_id, subject) FROM stdin;
\.
COPY public.subject (index, work_id, subject) FROM '$$PATH$$/3362.dat';

--
-- Data for Name: work; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.work (index, work_id, name, artist_id, style, museum_id) FROM stdin;
\.
COPY public.work (index, work_id, name, artist_id, style, museum_id) FROM '$$PATH$$/3363.dat';

--
-- Name: ix_artist_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_artist_index ON public.artist USING btree (index);


--
-- Name: ix_canvas_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_canvas_size_index ON public.canvas_size USING btree (index);


--
-- Name: ix_completedacct_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_completedacct_index ON public.completedacct USING btree (index);


--
-- Name: ix_completedcard_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_completedcard_index ON public.completedcard USING btree (index);


--
-- Name: ix_museum_hours_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_museum_hours_index ON public.museum_hours USING btree (index);


--
-- Name: ix_museum_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_museum_index ON public.museum USING btree (index);


--
-- Name: ix_product_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_product_size_index ON public.product_size USING btree (index);


--
-- Name: ix_subject_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_subject_index ON public.subject USING btree (index);


--
-- Name: ix_work_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_work_index ON public.work USING btree (index);


--
-- PostgreSQL database dump complete
--

