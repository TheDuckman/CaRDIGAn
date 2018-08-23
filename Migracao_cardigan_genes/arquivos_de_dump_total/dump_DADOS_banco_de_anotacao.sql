--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: banco_de_anotacao; Type: TABLE DATA; Schema: public; Owner: pato
--

COPY public.banco_de_anotacao (id_banco, nome, alias_banco) FROM stdin;
1	MiRBase	miRBase
2	HGNC	\N
3	Gene Symbol	GAF
4	ENSEMBL	Ensembl
\.


--
-- Name: banco_de_anotacao_id_banco_seq; Type: SEQUENCE SET; Schema: public; Owner: pato
--

SELECT pg_catalog.setval('public.banco_de_anotacao_id_banco_seq', 4, true);


--
-- PostgreSQL database dump complete
--

