SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: pmt(double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pmt(interest double precision, principal integer) RETURNS numeric
    LANGUAGE sql
    AS $$
  SELECT ROUND(
    CAST(
      (interest/100/12 * principal)
      / (1 - ((1 + (interest/100/12)) ^ -360))
    AS numeric), 0)
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sales_figures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sales_figures (
    id bigint NOT NULL,
    year integer,
    geo_code character varying,
    jurisdiction character varying,
    zipcode character varying,
    total_sales integer,
    median_value double precision,
    mean_value double precision,
    sales_inside_pfa integer,
    median_value_in_pfa double precision,
    mean_value_in_pfa double precision,
    sales_outside_pfa integer,
    median_value_out_pfa double precision,
    mean_value_out_pfa double precision,
    latitude double precision,
    longitude double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sales_figures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sales_figures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_figures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sales_figures_id_seq OWNED BY sales_figures.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sales_figures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_figures ALTER COLUMN id SET DEFAULT nextval('sales_figures_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: sales_figures sales_figures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_figures
    ADD CONSTRAINT sales_figures_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20171002162635'),
('20171009154555');


