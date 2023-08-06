--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-12 18:37:47

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
-- TOC entry 2863 (class 0 OID 9351273)
-- Dependencies: 199
-- Data for Name: departamento; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

INSERT INTO empresa.departamento VALUES ('Matriz', 1, NULL, NULL);
INSERT INTO empresa.departamento VALUES ('Administração', 4, NULL, NULL);
INSERT INTO empresa.departamento VALUES ('Pesquisa', 5, '33344555587', NULL);


--
-- TOC entry 2866 (class 0 OID 9351291)
-- Dependencies: 202
-- Data for Name: dependente; Type: TABLE DATA; Schema: empresa; Owner: postgres
--



--
-- TOC entry 2862 (class 0 OID 9351258)
-- Dependencies: 198
-- Data for Name: funcionario; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

INSERT INTO empresa.funcionario VALUES ('Fernando', 'T', 'Wong', '33344555587', '1955-12-06', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, NULL, 5, NULL);
INSERT INTO empresa.funcionario VALUES ('João', 'B', 'Silva', '12345678966', '1985-01-09', 'R Flores 781, São Paulo, SP', 'M', 30000, '33344555587', 5, NULL);
INSERT INTO empresa.funcionario VALUES ('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'R Lima, 35, Curitiba, PR', 'F', 25000, '12345678966', 4, NULL);
INSERT INTO empresa.funcionario VALUES ('Barbara', 'A', 'Silva', '11122233355', NULL, 'Rua x', NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2861 (class 0 OID 9351255)
-- Dependencies: 197
-- Data for Name: localizacoes_dep; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

INSERT INTO empresa.localizacoes_dep VALUES (1, 'Quixada');
INSERT INTO empresa.localizacoes_dep VALUES (1, 'Fortaleza');
INSERT INTO empresa.localizacoes_dep VALUES (4, 'Capistrano');
INSERT INTO empresa.localizacoes_dep VALUES (5, 'Crateus');


--
-- TOC entry 2864 (class 0 OID 9351278)
-- Dependencies: 200
-- Data for Name: projeto; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

INSERT INTO empresa.projeto VALUES ('projetoA', 1, 'Fortaleza', 1);
INSERT INTO empresa.projeto VALUES ('projetoB', 2, 'Quixadá', 4);
INSERT INTO empresa.projeto VALUES ('projetoC', 3, 'Caucaia', 5);
INSERT INTO empresa.projeto VALUES ('ProjetoX', 10, 'Fortaleza', 5);


--
-- TOC entry 2865 (class 0 OID 9351283)
-- Dependencies: 201
-- Data for Name: trabalha_em; Type: TABLE DATA; Schema: empresa; Owner: postgres
--



-- Completed on 2022-05-12 18:37:47

--
-- PostgreSQL database dump complete
--
