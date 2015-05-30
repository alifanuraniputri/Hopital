--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2014-11-29 16:09:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 175 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1973 (class 0 OID 0)
-- Dependencies: 175
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 16440)
-- Name: bloodStock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "bloodStock" (
    id integer NOT NULL,
    type character(2),
    stock integer,
    status text
);


ALTER TABLE public."bloodStock" OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16402)
-- Name: doctor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE doctor (
    name text,
    "doctorType" text,
    id integer NOT NULL
);


ALTER TABLE public.doctor OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16432)
-- Name: donation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE donation (
    id integer NOT NULL,
    name text,
    age integer,
    gender character(15),
    disease text,
    "donationNeeded" integer,
    "currentDonation" integer,
    "dueDate" date
);


ALTER TABLE public.donation OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16410)
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schedule (
    id character(15) NOT NULL,
    "userName" character(15),
    "scedhuleType" text,
    "scedhuleDate" date,
    "doctorId" integer,
    note text
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16394)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    password character(15),
    name text,
    "mobileNumber" text,
    "userName" character(15) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 1965 (class 0 OID 16440)
-- Dependencies: 174
-- Data for Name: bloodStock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "bloodStock" (id, type, stock, status) FROM stdin;
\.


--
-- TOC entry 1962 (class 0 OID 16402)
-- Dependencies: 171
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY doctor (name, "doctorType", id) FROM stdin;
dokterDummy	kandungan	1
\.


--
-- TOC entry 1964 (class 0 OID 16432)
-- Dependencies: 173
-- Data for Name: donation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY donation (id, name, age, gender, disease, "donationNeeded", "currentDonation", "dueDate") FROM stdin;
1	pasien Dummy	45	P              	usus buntu	5000000	2000000	2014-12-10
\.


--
-- TOC entry 1963 (class 0 OID 16410)
-- Dependencies: 172
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schedule (id, "userName", "scedhuleType", "scedhuleDate", "doctorId", note) FROM stdin;
1              	userDummy      	USG	2014-12-05	1	-
\.


--
-- TOC entry 1961 (class 0 OID 16394)
-- Dependencies: 170
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (password, name, "mobileNumber", "userName") FROM stdin;
dummy          	User Dummy	000	userDummy      
\.


--
-- TOC entry 1851 (class 2606 OID 16447)
-- Name: bloodStock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "bloodStock"
    ADD CONSTRAINT "bloodStock_pkey" PRIMARY KEY (id);


--
-- TOC entry 1845 (class 2606 OID 16419)
-- Name: doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);


--
-- TOC entry 1849 (class 2606 OID 16439)
-- Name: donation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY donation
    ADD CONSTRAINT donation_pkey PRIMARY KEY (id);


--
-- TOC entry 1847 (class 2606 OID 16421)
-- Name: schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 1843 (class 2606 OID 16401)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userName");


--
-- TOC entry 1852 (class 2606 OID 16422)
-- Name: schedule_doctorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT "schedule_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES doctor(id);


--
-- TOC entry 1853 (class 2606 OID 16427)
-- Name: schedule_userName_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT "schedule_userName_fkey" FOREIGN KEY ("userName") REFERENCES "user"("userName");


--
-- TOC entry 1972 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-11-29 16:09:34

--
-- PostgreSQL database dump complete
--

