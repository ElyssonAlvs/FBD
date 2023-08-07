--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2022-08-30 15:10:14

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
-- TOC entry 6 (class 2615 OID 9441726)
-- Name: eventos; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA eventos;


SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 9441734)
-- Name: evento; Type: TABLE; Schema: eventos; Owner: -
--

CREATE TABLE eventos.evento (
    id_evento integer NOT NULL,
    nome character varying(50) NOT NULL,
    dt date,
    h_inicio integer,
    h_fim integer,
    limite_pessoas integer,
    nome_local character varying(50)
);


--
-- TOC entry 198 (class 1259 OID 9441732)
-- Name: evento_id_evento_seq; Type: SEQUENCE; Schema: eventos; Owner: -
--

CREATE SEQUENCE eventos.evento_id_evento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 198
-- Name: evento_id_evento_seq; Type: SEQUENCE OWNED BY; Schema: eventos; Owner: -
--

ALTER SEQUENCE eventos.evento_id_evento_seq OWNED BY eventos.evento.id_evento;


--
-- TOC entry 201 (class 1259 OID 9441742)
-- Name: ingresso; Type: TABLE; Schema: eventos; Owner: -
--

CREATE TABLE eventos.ingresso (
    id_ingresso integer NOT NULL,
    id_evento integer,
    cpf_usuario character varying(11),
    lote integer,
    valor double precision
);


--
-- TOC entry 200 (class 1259 OID 9441740)
-- Name: ingresso_id_ingresso_seq; Type: SEQUENCE; Schema: eventos; Owner: -
--

CREATE SEQUENCE eventos.ingresso_id_ingresso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 200
-- Name: ingresso_id_ingresso_seq; Type: SEQUENCE OWNED BY; Schema: eventos; Owner: -
--

ALTER SEQUENCE eventos.ingresso_id_ingresso_seq OWNED BY eventos.ingresso.id_ingresso;


--
-- TOC entry 197 (class 1259 OID 9441727)
-- Name: usuario; Type: TABLE; Schema: eventos; Owner: -
--

CREATE TABLE eventos.usuario (
    nome character varying(50) NOT NULL,
    cpf character varying(11) NOT NULL
);


--
-- TOC entry 2696 (class 2604 OID 9441737)
-- Name: evento id_evento; Type: DEFAULT; Schema: eventos; Owner: -
--

ALTER TABLE ONLY eventos.evento ALTER COLUMN id_evento SET DEFAULT nextval('eventos.evento_id_evento_seq'::regclass);


--
-- TOC entry 2697 (class 2604 OID 9441745)
-- Name: ingresso id_ingresso; Type: DEFAULT; Schema: eventos; Owner: -
--

ALTER TABLE ONLY eventos.ingresso ALTER COLUMN id_ingresso SET DEFAULT nextval('eventos.ingresso_id_ingresso_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 9441734)
-- Dependencies: 199
-- Data for Name: evento; Type: TABLE DATA; Schema: eventos; Owner: -
--

INSERT INTO eventos.evento (id_evento, nome, dt, h_inicio, h_fim, limite_pessoas, nome_local) VALUES (1, 'Festival de Quixadá', '2022-10-31', NULL, NULL, NULL, 'Praça do Leão');


--
-- TOC entry 2833 (class 0 OID 9441742)
-- Dependencies: 201
-- Data for Name: ingresso; Type: TABLE DATA; Schema: eventos; Owner: -
--



--
-- TOC entry 2829 (class 0 OID 9441727)
-- Dependencies: 197
-- Data for Name: usuario; Type: TABLE DATA; Schema: eventos; Owner: -
--

INSERT INTO eventos.usuario (nome, cpf) VALUES ('Alexandre Silva', '00011133344');


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 198
-- Name: evento_id_evento_seq; Type: SEQUENCE SET; Schema: eventos; Owner: -
--

SELECT pg_catalog.setval('eventos.evento_id_evento_seq', 1, true);


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 200
-- Name: ingresso_id_ingresso_seq; Type: SEQUENCE SET; Schema: eventos; Owner: -
--

SELECT pg_catalog.setval('eventos.ingresso_id_ingresso_seq', 1, false);


--
-- TOC entry 2701 (class 2606 OID 9441739)
-- Name: evento evento_pkey; Type: CONSTRAINT; Schema: eventos; Owner: -
--

ALTER TABLE ONLY eventos.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id_evento);


--
-- TOC entry 2705 (class 2606 OID 9441757)
-- Name: ingresso pk_ingresso; Type: CONSTRAINT; Schema: eventos; Owner: -
--

ALTER TABLE ONLY eventos.ingresso
    ADD CONSTRAINT pk_ingresso PRIMARY KEY (id_ingresso);


--
-- TOC entry 2703 (class 2606 OID 9441759)
-- Name: evento uk_evento; Type: CONSTRAINT; Schema: eventos; Owner: -
--

ALTER TABLE ONLY eventos.evento
    ADD CONSTRAINT uk_evento UNIQUE (nome);


--
-- TOC entry 2699 (class 2606 OID 9441731)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: eventos; Owner: -
--

ALTER TABLE ONLY eventos.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (cpf);


--
-- TOC entry 2707 (class 2606 OID 9441751)
-- Name: ingresso fk_usuario; Type: FK CONSTRAINT; Schema: eventos; Owner: -
--

ALTER TABLE ONLY eventos.ingresso
    ADD CONSTRAINT fk_usuario FOREIGN KEY (cpf_usuario) REFERENCES eventos.usuario(cpf);


--
-- TOC entry 2706 (class 2606 OID 9441746)
-- Name: ingresso ingresso_id_evento_fkey; Type: FK CONSTRAINT; Schema: eventos; Owner: -
--

ALTER TABLE ONLY eventos.ingresso
    ADD CONSTRAINT ingresso_id_evento_fkey FOREIGN KEY (id_evento) REFERENCES eventos.evento(id_evento);


-- Completed on 2022-08-30 15:10:15

--
-- PostgreSQL database dump complete
--
