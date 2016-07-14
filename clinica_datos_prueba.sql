--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.6
-- Dumped by pg_dump version 9.4.6
-- Started on 2016-07-12 20:07:42 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2279 (class 0 OID 16387)
-- Dependencies: 173
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO area VALUES (2, 'Cuartos de Consulta', true, NULL);
INSERT INTO area VALUES (3, 'Cuartos de Enfermería', true, NULL);
INSERT INTO area VALUES (4, 'Despacho de Medicamentos', true, NULL);
INSERT INTO area VALUES (5, 'Sala de Cirugía', true, NULL);
INSERT INTO area VALUES (1, 'Atención Infantil', true, NULL);


--
-- TOC entry 2314 (class 0 OID 16537)
-- Dependencies: 208
-- Data for Name: tipo_centro; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO tipo_centro VALUES (1, 'Hospital Regional', true, NULL);
INSERT INTO tipo_centro VALUES (2, 'Hospital Urgencias', true, NULL);
INSERT INTO tipo_centro VALUES (3, 'Clínica Médica', true, NULL);
INSERT INTO tipo_centro VALUES (4, 'Hospital Infantil', true, NULL);
INSERT INTO tipo_centro VALUES (5, 'Laboratorio Clinico', true, NULL);
INSERT INTO tipo_centro VALUES (6, 'Clínica Estetica', true, NULL);
INSERT INTO tipo_centro VALUES (7, 'Clínica Oncológica', true, NULL);
INSERT INTO tipo_centro VALUES (8, 'Clínica Oftalmológica', true, NULL);
INSERT INTO tipo_centro VALUES (9, 'Clínica Tercera Edad', true, NULL);
INSERT INTO tipo_centro VALUES (10, 'Farmacia', true, NULL);
INSERT INTO tipo_centro VALUES (11, 'Farmacia Natural', true, NULL);
INSERT INTO tipo_centro VALUES (12, 'Clínica Comunitaria', false, NULL);
INSERT INTO tipo_centro VALUES (13, 'Hospital Oncológico', false, NULL);
INSERT INTO tipo_centro VALUES (14, 'Clínica Neonatal', false, NULL);
INSERT INTO tipo_centro VALUES (15, 'Centro de Rehabilitación', false, NULL);
INSERT INTO tipo_centro VALUES (16, 'Hospital Tercera Edad', true, NULL);
INSERT INTO tipo_centro VALUES (17, 'Centro Fisioterapeutico', false, NULL);
INSERT INTO tipo_centro VALUES (18, 'Farmacia Generica', NULL, NULL);


--
-- TOC entry 2290 (class 0 OID 16424)
-- Dependencies: 184
-- Data for Name: centro; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO centro VALUES (1, 5, 'Hospital Arturo Morales de Metapán', 'Hospital Arturo Morales de Metapán', '37.2 N', '23.9 O', '1990-05-02', true, 'Ubicado en Metapán');
INSERT INTO centro VALUES (2, 4, 'Hospital Benjamín Bloom', 'Hospital de Niños Benjamín Bloom', '31.2 E', '254.9 S', '1995-07-02', true, NULL);
INSERT INTO centro VALUES (3, 3, 'Hospital San Juan de Dios', 'Hospital San Juan de Dios', '317.2 N', '823.9 S', '1998-05-12', true, 'Ubicado en Santa Ana');
INSERT INTO centro VALUES (4, 2, 'Hospital Nacional de La Unión', 'Hospital Nacional de La Unión', '37.2 N', '23.9 O', '2000-05-21', true, NULL);
INSERT INTO centro VALUES (5, 1, 'Hospital Nuestra Sra. De Fátima', 'Hospital Nacional de Cojutepeque Nuestra Sra. De Fátima', '337.2 N', '283.9 O', '1991-05-22', true, NULL);


--
-- TOC entry 2280 (class 0 OID 16394)
-- Dependencies: 174
-- Data for Name: area_centro; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO area_centro VALUES (1, 1, 1, 'Salas', true);
INSERT INTO area_centro VALUES (2, 1, 2, 'Salas', true);
INSERT INTO area_centro VALUES (4, 2, 3, 'Salas', true);
INSERT INTO area_centro VALUES (5, 3, 4, 'Salas', true);
INSERT INTO area_centro VALUES (3, 3, 5, 'Salas', true);
INSERT INTO area_centro VALUES (4, 4, 6, 'Salas', true);
INSERT INTO area_centro VALUES (1, 5, 7, 'Salas', true);


--
-- TOC entry 2316 (class 0 OID 16546)
-- Dependencies: 210
-- Data for Name: tipo_espacio; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO tipo_espacio VALUES (1, 'Camas', true, NULL);
INSERT INTO tipo_espacio VALUES (2, 'Cuartos', true, NULL);
INSERT INTO tipo_espacio VALUES (3, 'Cupos', true, NULL);
INSERT INTO tipo_espacio VALUES (4, 'Turnos', true, NULL);
INSERT INTO tipo_espacio VALUES (5, 'Pasillos', true, NULL);


--
-- TOC entry 2295 (class 0 OID 16449)
-- Dependencies: 189
-- Data for Name: espacio; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO espacio VALUES (1, 1, 'Área de atención 1', true, NULL);
INSERT INTO espacio VALUES (2, 2, 'Área de atención 2', true, NULL);
INSERT INTO espacio VALUES (3, 3, 'Área de atención 3', true, NULL);
INSERT INTO espacio VALUES (4, 4, 'Área de atención 4', true, NULL);
INSERT INTO espacio VALUES (5, 5, 'Área de atención 5', true, NULL);


--
-- TOC entry 2281 (class 0 OID 16398)
-- Dependencies: 175
-- Data for Name: area_centro_espacio; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO area_centro_espacio VALUES (1, 1, 1, 1, 'area centro espacio', true);
INSERT INTO area_centro_espacio VALUES (2, 2, 2, 2, 'area centro espacio 2', true);
INSERT INTO area_centro_espacio VALUES (3, 3, 3, 3, 'area centro espacio 3', true);
INSERT INTO area_centro_espacio VALUES (4, 4, 4, 4, 'area centro espacio 4', true);
INSERT INTO area_centro_espacio VALUES (5, 5, 5, 5, 'area centro espacio 5', true);
INSERT INTO area_centro_espacio VALUES (1, 6, 6, 6, 'area centro espacio 6', true);
INSERT INTO area_centro_espacio VALUES (2, 7, 7, 7, 'area centro espacio 7', true);


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 176
-- Name: area_centro_espacio_id_area_centro_espacio_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('area_centro_espacio_id_area_centro_espacio_seq', 7, true);


--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 177
-- Name: area_centro_id_area_centro_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('area_centro_id_area_centro_seq', 7, true);


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 178
-- Name: area_id_area_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('area_id_area_seq', 5, true);


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 180
-- Name: asignacion_personal_centro_ar_id_asignacion_personal_centro_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('asignacion_personal_centro_ar_id_asignacion_personal_centro_seq', 7, true);


--
-- TOC entry 2311 (class 0 OID 16523)
-- Dependencies: 205
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO personal VALUES (1, 'Jesse', 'Solorzano Rosa', '30982711-6', '2016-02-05');
INSERT INTO personal VALUES (2, 'Bruce', 'Morgan', '14126317-5', '2015-12-21');
INSERT INTO personal VALUES (3, 'Angela', 'Edwards', '77869044-7', '2015-11-21');
INSERT INTO personal VALUES (4, 'Martin', 'Ramos', '76405049-4', '2015-09-26');
INSERT INTO personal VALUES (5, 'Scott', 'Meyer', '04097853-2', '2015-05-09');
INSERT INTO personal VALUES (6, 'Larry', 'Price', '14769317-7', '2015-05-21');
INSERT INTO personal VALUES (7, 'Antonio', 'Cook', '86250073-4', '2015-06-06');
INSERT INTO personal VALUES (8, 'Lillian', 'Vasquez', '09100649-X', '2016-02-21');
INSERT INTO personal VALUES (9, 'Craig', 'Davis', '03012328-2', '2016-01-24');
INSERT INTO personal VALUES (10, 'Sara', 'Thompson', '89518980-0', '2016-01-27');
INSERT INTO personal VALUES (11, 'Melissa', 'Burton', '35494386-9', '2015-07-14');
INSERT INTO personal VALUES (12, 'Pamela', 'Watson', '26519781-X', '2015-11-22');
INSERT INTO personal VALUES (13, 'Cheryl', 'Gilbert', '71889805-9', '2015-05-15');
INSERT INTO personal VALUES (14, 'Laura', 'Bailey', '75040991-6', '2015-06-15');
INSERT INTO personal VALUES (15, 'Catherine', 'Kennedy', '50710749-9', '2016-01-01');
INSERT INTO personal VALUES (16, 'Debra', 'Fox', '11405475-X', '2015-04-02');
INSERT INTO personal VALUES (17, 'Joseph', 'Carroll', '13142073-1', '2015-11-29');
INSERT INTO personal VALUES (18, 'Jennifer', 'Gordon', '61208252-7', '2015-11-14');
INSERT INTO personal VALUES (19, 'Paula', 'Jordan', '20366219-3', '2016-01-31');
INSERT INTO personal VALUES (20, 'Charles', 'Rose', '35813065-8', '2015-05-22');
INSERT INTO personal VALUES (21, 'Richard', 'Franklin', '58533924-6', '2015-06-16');
INSERT INTO personal VALUES (22, 'Rachel', 'Hall', '96797088-2', '2016-02-20');
INSERT INTO personal VALUES (23, 'Carl', 'Reyes', '20611526-4', '2015-05-29');
INSERT INTO personal VALUES (24, 'Linda', 'West', '10707765-9', '2015-09-18');
INSERT INTO personal VALUES (25, 'Paul', 'Nichols', '53981376-4', '2015-10-17');
INSERT INTO personal VALUES (26, 'Martha', 'Castillo', '27293805-0', '2016-01-11');
INSERT INTO personal VALUES (27, 'Janet', 'Nguyen', '95783943-8', '2015-08-23');
INSERT INTO personal VALUES (28, 'Phyllis', 'Snyder', '70340613-6', '2015-10-13');
INSERT INTO personal VALUES (29, 'Christine', 'Carter', '86939245-9', '2015-12-24');
INSERT INTO personal VALUES (30, 'Samuel', 'Gordon', '94787419-5', '2015-07-08');
INSERT INTO personal VALUES (31, 'Elizabeth', 'Romero', '24537678-9', '2016-01-27');
INSERT INTO personal VALUES (32, 'Sandra', 'Peterson', '75399173-8', '2015-11-18');
INSERT INTO personal VALUES (33, 'Brandon', 'Owens', '57518592-6', '2015-03-29');
INSERT INTO personal VALUES (34, 'Kevin', 'Williamson', '90427515-5', '2015-05-25');
INSERT INTO personal VALUES (35, 'Lois', 'Moore', '85992790-X', '2016-01-28');
INSERT INTO personal VALUES (36, 'Jose', 'Bryant', '57619368-9', '2016-03-06');
INSERT INTO personal VALUES (37, 'Peter', 'Dunn', '72103632-2', '2015-04-25');
INSERT INTO personal VALUES (38, 'Margaret', 'Gray', '19640965-X', '2015-05-02');
INSERT INTO personal VALUES (39, 'Denise', 'Rodriguez', '43922717-8', '2015-06-13');
INSERT INTO personal VALUES (40, 'Paula', 'Lopez', '57460510-1', '2015-10-26');
INSERT INTO personal VALUES (41, 'Bonnie', 'Bishop', '89882173-7', '2015-12-04');
INSERT INTO personal VALUES (42, 'William', 'Diaz', '57543067-2', '2015-12-04');
INSERT INTO personal VALUES (43, 'Mary', 'Ellis', '65066765-X', '2016-01-01');
INSERT INTO personal VALUES (44, 'Michael', 'Gutierrez', '44000480-8', '2015-11-13');
INSERT INTO personal VALUES (45, 'Martin', 'Harvey', '70269848-4', '2015-11-12');
INSERT INTO personal VALUES (46, 'Nancy', 'Payne', '79955196-5', '2015-09-25');
INSERT INTO personal VALUES (47, 'Ashley', 'Butler', '66873248-8', '2016-02-07');
INSERT INTO personal VALUES (48, 'Susan', 'Graham', '93552889-9', '2015-05-08');
INSERT INTO personal VALUES (49, 'Janice', 'Morrison', '48497747-3', '2015-07-26');
INSERT INTO personal VALUES (50, 'Robin', 'Stone', '13873748-7', '2015-06-12');
INSERT INTO personal VALUES (51, 'Jeremy', 'Parker', '49328474-X', '2016-01-30');
INSERT INTO personal VALUES (52, 'Albert', 'Banks', '06763909-9', '2016-02-05');
INSERT INTO personal VALUES (53, 'Lisa', 'Hunt', '62783005-3', '2015-03-20');
INSERT INTO personal VALUES (54, 'Alice', 'Chavez', '83264066-5', '2015-06-29');
INSERT INTO personal VALUES (55, 'Ruby', 'George', '98989531-2', '2015-12-14');
INSERT INTO personal VALUES (56, 'Tina', 'Gomez', '84236595-9', '2015-07-18');
INSERT INTO personal VALUES (57, 'Wayne', 'Diaz', '97075141-1', '2015-12-15');
INSERT INTO personal VALUES (58, 'Steven', 'Webb', '10189322-6', '2015-11-04');
INSERT INTO personal VALUES (59, 'Christine', 'Wilson', '31043351-5', '2015-08-18');
INSERT INTO personal VALUES (60, 'Diane', 'Payne', '51015646-0', '2015-03-14');
INSERT INTO personal VALUES (61, 'Janet', 'Reid', '29213871-4', '2015-04-13');
INSERT INTO personal VALUES (62, 'Eugene', 'King', '13684346-6', '2015-06-21');
INSERT INTO personal VALUES (63, 'Janet', 'Walker', '47036427-4', '2015-09-02');
INSERT INTO personal VALUES (64, 'Kathy', 'Turner', '47081880-4', '2015-12-02');
INSERT INTO personal VALUES (65, 'Theresa', 'Owens', '55301809-5', '2015-08-13');
INSERT INTO personal VALUES (66, 'Steve', 'Parker', '88767723-8', '2016-01-01');
INSERT INTO personal VALUES (67, 'Albert', 'Matthews', '50251377-X', '2015-05-06');
INSERT INTO personal VALUES (68, 'Christopher', 'Lynch', '36908010-4', '2016-01-29');
INSERT INTO personal VALUES (69, 'Bruce', 'Williams', '75919193-2', '2015-05-03');
INSERT INTO personal VALUES (70, 'Gloria', 'Gordon', '20717223-2', '2016-03-02');
INSERT INTO personal VALUES (71, 'Ruth', 'Moreno', '78475283-5', '2015-12-01');
INSERT INTO personal VALUES (72, 'Jacqueline', 'Gibson', '61079168-9', '2015-09-23');
INSERT INTO personal VALUES (73, 'Juan', 'Williamson', '28328043-5', '2015-05-31');
INSERT INTO personal VALUES (74, 'Denise', 'White', '70630212-X', '2015-05-09');
INSERT INTO personal VALUES (75, 'Ernest', 'Nguyen', '36589190-7', '2016-01-24');
INSERT INTO personal VALUES (76, 'Ryan', 'Sullivan', '38199990-6', '2015-08-09');
INSERT INTO personal VALUES (77, 'Anna', 'Watkins', '45203001-3', '2015-04-08');
INSERT INTO personal VALUES (78, 'Nancy', 'Hughes', '96755653-0', '2015-07-14');
INSERT INTO personal VALUES (79, 'John', 'Lawrence', '24395134-6', '2015-11-03');
INSERT INTO personal VALUES (80, 'Benjamin', 'Carter', '74228938-2', '2015-08-03');
INSERT INTO personal VALUES (81, 'Michael', 'Bell', '42516143-0', '2016-02-10');
INSERT INTO personal VALUES (82, 'Donna', 'Long', '48549382-3', '2015-08-09');
INSERT INTO personal VALUES (83, 'Cheryl', 'White', '43121630-3', '2015-03-28');
INSERT INTO personal VALUES (84, 'Nancy', 'Hicks', '77194565-9', '2016-02-10');
INSERT INTO personal VALUES (85, 'Judith', 'Robertson', '26030349-4', '2015-04-04');
INSERT INTO personal VALUES (86, 'Kathleen', 'Burke', '45986911-3', '2016-01-20');
INSERT INTO personal VALUES (87, 'Martin', 'Nguyen', '85406512-9', '2015-05-31');
INSERT INTO personal VALUES (88, 'Evelyn', 'Harris', '70611624-6', '2015-04-07');
INSERT INTO personal VALUES (89, 'Jeremy', 'Bryant', '13507719-8', '2016-01-06');
INSERT INTO personal VALUES (90, 'Shirley', 'Peters', '18577848-X', '2015-04-29');
INSERT INTO personal VALUES (91, 'Joseph', 'Rogers', '12754895-3', '2015-05-03');
INSERT INTO personal VALUES (92, 'Mark', 'Olson', '52800111-2', '2016-01-08');
INSERT INTO personal VALUES (93, 'Ralph', 'Ellis', '71033539-5', '2015-04-15');
INSERT INTO personal VALUES (94, 'Joe', 'Reyes', '56660453-8', '2015-08-21');
INSERT INTO personal VALUES (95, 'Anne', 'Stevens', '50139829-0', '2016-03-03');
INSERT INTO personal VALUES (96, 'Theresa', 'Evans', '41863246-7', '2016-02-05');
INSERT INTO personal VALUES (97, 'Terry', 'Davis', '51422430-3', '2015-10-17');
INSERT INTO personal VALUES (98, 'Douglas', 'Crawford', '62573844-3', '2015-11-16');
INSERT INTO personal VALUES (99, 'Carl', 'Nelson', '66302375-0', '2016-02-19');
INSERT INTO personal VALUES (100, 'Bobby', 'Wells', '13752551-8', '2015-08-15');


--
-- TOC entry 2285 (class 0 OID 16408)
-- Dependencies: 179
-- Data for Name: asignacion_personal_centro_area; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO asignacion_personal_centro_area VALUES (1, 1, 1, '2010-04-12', '2016-02-12');
INSERT INTO asignacion_personal_centro_area VALUES (2, 2, 2, '2010-04-11', NULL);
INSERT INTO asignacion_personal_centro_area VALUES (3, 3, 3, '2011-04-11', NULL);
INSERT INTO asignacion_personal_centro_area VALUES (4, 3, 4, '2005-04-11', NULL);
INSERT INTO asignacion_personal_centro_area VALUES (5, 4, 5, '2002-04-11', NULL);
INSERT INTO asignacion_personal_centro_area VALUES (6, 4, 7, '2011-02-11', NULL);
INSERT INTO asignacion_personal_centro_area VALUES (7, 5, 6, '1995-06-15', NULL);


--
-- TOC entry 2287 (class 0 OID 16414)
-- Dependencies: 181
-- Data for Name: asignacion_personal_centro_area_espacio; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO asignacion_personal_centro_area_espacio VALUES (1, 1, 1, NULL);
INSERT INTO asignacion_personal_centro_area_espacio VALUES (2, 2, 2, NULL);
INSERT INTO asignacion_personal_centro_area_espacio VALUES (3, 3, 3, NULL);
INSERT INTO asignacion_personal_centro_area_espacio VALUES (4, 4, 4, NULL);
INSERT INTO asignacion_personal_centro_area_espacio VALUES (5, 5, 5, NULL);
INSERT INTO asignacion_personal_centro_area_espacio VALUES (6, 6, 6, NULL);
INSERT INTO asignacion_personal_centro_area_espacio VALUES (7, 7, 7, NULL);


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 182
-- Name: asignacion_personal_centro_area_espacio_id_turno_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('asignacion_personal_centro_area_espacio_id_turno_seq', 1, false);


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 183
-- Name: asignacion_personal_centro_area_id_area_centro_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('asignacion_personal_centro_area_id_area_centro_seq', 7, true);


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 185
-- Name: centro_id_centro_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('centro_id_centro_seq', 5, true);


--
-- TOC entry 2292 (class 0 OID 16433)
-- Dependencies: 186
-- Data for Name: diagnostico; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO diagnostico VALUES (1, 'Ébola', true, NULL);
INSERT INTO diagnostico VALUES (2, 'Diarrea', true, NULL);
INSERT INTO diagnostico VALUES (3, 'Cáncer de Pulmón', true, NULL);
INSERT INTO diagnostico VALUES (4, 'Zika', true, NULL);
INSERT INTO diagnostico VALUES (5, 'Gripe Común', true, NULL);
INSERT INTO diagnostico VALUES (6, 'Dengue', true, NULL);


--
-- TOC entry 2321 (class 0 OID 16566)
-- Dependencies: 215
-- Data for Name: tipo_examen; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO tipo_examen VALUES (1, 'Hemograma', true, NULL);
INSERT INTO tipo_examen VALUES (2, 'Neurología', true, NULL);
INSERT INTO tipo_examen VALUES (3, 'Andrología', true, NULL);
INSERT INTO tipo_examen VALUES (4, 'Urología', true, NULL);
INSERT INTO tipo_examen VALUES (5, 'Alergología', true, NULL);


--
-- TOC entry 2298 (class 0 OID 16464)
-- Dependencies: 192
-- Data for Name: examen; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO examen VALUES (1, 1, 'Exámen de Sangre', true, 'Extracción de la sangre del paciente para detectar anomalías', NULL);
INSERT INTO examen VALUES (2, 2, 'Escaneo del craneo', true, 'Encontrar posibles roturas del cráneo con una radiografia', NULL);
INSERT INTO examen VALUES (3, 3, 'Exámen de Próstata', true, 'Analisis de la prostata para encontrar posibles tumores o infecciones en el parato reproductor masculino', NULL);
INSERT INTO examen VALUES (4, 4, 'Exámen de Orina', true, 'analisis de la orina del paciente para determinar posibles infecciones en la el aparato urinario', NULL);
INSERT INTO examen VALUES (5, 5, 'Exámen de Alergia', true, 'Estudio sobre la causa de sintomas como picazon, inflamación e irritación nasal, como parte de una alergia', NULL);
INSERT INTO examen VALUES (6, 2, 'Exámen de Páncreas', true, 'Esadsadad', NULL);


--
-- TOC entry 2293 (class 0 OID 16440)
-- Dependencies: 187
-- Data for Name: diagnostico_examen; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO diagnostico_examen VALUES (1, 1, true, NULL);
INSERT INTO diagnostico_examen VALUES (2, 2, false, NULL);
INSERT INTO diagnostico_examen VALUES (3, 3, true, NULL);
INSERT INTO diagnostico_examen VALUES (4, 4, true, NULL);
INSERT INTO diagnostico_examen VALUES (5, 5, false, NULL);


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 188
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('diagnostico_id_diagnostico_seq', 5, true);


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 190
-- Name: espacio_id_espacio_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('espacio_id_espacio_seq', 5, true);


--
-- TOC entry 2318 (class 0 OID 16555)
-- Dependencies: 212
-- Data for Name: tipo_especialidad; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO tipo_especialidad VALUES (1, 'Cirugía', NULL, true);
INSERT INTO tipo_especialidad VALUES (2, 'Anestesiología', NULL, true);
INSERT INTO tipo_especialidad VALUES (3, 'Cardiología', NULL, true);
INSERT INTO tipo_especialidad VALUES (4, 'Hematología', NULL, true);
INSERT INTO tipo_especialidad VALUES (5, 'Dermatología', NULL, true);


--
-- TOC entry 2297 (class 0 OID 16458)
-- Dependencies: 191
-- Data for Name: especialidad; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO especialidad VALUES ('Cirujano General', true, NULL, 1, 1);
INSERT INTO especialidad VALUES ('Hematólogo', true, NULL, 3, 4);
INSERT INTO especialidad VALUES ('Anestesiologa Pediátrica', true, NULL, 4, 2);
INSERT INTO especialidad VALUES ('Dermatólogo', true, NULL, 5, 5);
INSERT INTO especialidad VALUES ('Cirujano Pediátrico', true, 'Es', 7, 2);
INSERT INTO especialidad VALUES ('Cirujano Pediátrico', true, 'As', 2, 1);


--
-- TOC entry 2308 (class 0 OID 16508)
-- Dependencies: 202
-- Data for Name: paciente; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO paciente VALUES (104, 'Fafa', 'Escalante', '2015-04-30', '2016-04-30', NULL);
INSERT INTO paciente VALUES (1, 'Lois', 'Nelson', '1950-04-30', '2015-12-14', NULL);
INSERT INTO paciente VALUES (2, 'Lori', 'Jackson', '1982-10-15', NULL, NULL);
INSERT INTO paciente VALUES (3, 'Brandon', 'Black', '1973-12-07', NULL, NULL);
INSERT INTO paciente VALUES (4, 'Scott', 'Fowler', '1987-07-01', NULL, NULL);
INSERT INTO paciente VALUES (5, 'Matthew', 'Carpenter', '1970-09-11', NULL, NULL);
INSERT INTO paciente VALUES (6, 'Adam', 'Gardner', '2015-06-23', NULL, NULL);
INSERT INTO paciente VALUES (7, 'Frances', 'Berry', '2002-03-03', NULL, NULL);
INSERT INTO paciente VALUES (8, 'Paul', 'Richards', '1969-02-14', NULL, NULL);
INSERT INTO paciente VALUES (9, 'Theresa', 'Burns', '1981-09-26', NULL, NULL);
INSERT INTO paciente VALUES (10, 'Todd', 'Hudson', '1968-05-29', '2015-12-14', NULL);
INSERT INTO paciente VALUES (11, 'Kathryn', 'Porter', '1998-10-13', NULL, NULL);
INSERT INTO paciente VALUES (12, 'Philip', 'Austin', '2003-12-30', NULL, NULL);
INSERT INTO paciente VALUES (13, 'Marilyn', 'Stone', '1954-05-03', NULL, NULL);
INSERT INTO paciente VALUES (14, 'Carlos', 'Kennedy', '1955-02-03', NULL, NULL);
INSERT INTO paciente VALUES (15, 'Larry', 'Howell', '1961-12-20', '2016-01-14', NULL);
INSERT INTO paciente VALUES (16, 'Peter', 'Diaz', '1977-02-13', NULL, NULL);
INSERT INTO paciente VALUES (17, 'Pamela', 'Mcdonald', '1983-04-06', NULL, NULL);
INSERT INTO paciente VALUES (18, 'John', 'Patterson', '2015-04-20', NULL, NULL);
INSERT INTO paciente VALUES (19, 'Annie', 'Graham', '1990-02-09', NULL, NULL);
INSERT INTO paciente VALUES (20, 'Raymond', 'Brown', '2002-07-29', NULL, NULL);
INSERT INTO paciente VALUES (21, 'Eugene', 'Hansen', '1957-08-03', NULL, NULL);
INSERT INTO paciente VALUES (22, 'Lawrence', 'Edwards', '2000-07-28', NULL, NULL);
INSERT INTO paciente VALUES (23, 'Juan', 'Hunt', '2013-04-03', NULL, NULL);
INSERT INTO paciente VALUES (24, 'Lillian', 'Richards', '1985-11-25', NULL, NULL);
INSERT INTO paciente VALUES (25, 'Bonnie', 'Mills', '1987-12-20', NULL, NULL);
INSERT INTO paciente VALUES (26, 'Louis', 'Diaz', '1989-10-14', NULL, NULL);
INSERT INTO paciente VALUES (27, 'Anthony', 'Willis', '1972-02-20', NULL, NULL);
INSERT INTO paciente VALUES (28, 'Alan', 'Hernandez', '1989-12-24', NULL, NULL);
INSERT INTO paciente VALUES (29, 'Billy', 'Burke', '1987-02-25', NULL, NULL);
INSERT INTO paciente VALUES (30, 'Adam', 'Chapman', '1972-03-29', NULL, NULL);
INSERT INTO paciente VALUES (31, 'Elizabeth', 'Kennedy', '1998-06-24', NULL, NULL);
INSERT INTO paciente VALUES (32, 'Christina', 'Knight', '1971-09-30', NULL, NULL);
INSERT INTO paciente VALUES (33, 'Sean', 'Garza', '2009-01-03', NULL, NULL);
INSERT INTO paciente VALUES (34, 'Dennis', 'Campbell', '2013-04-14', NULL, NULL);
INSERT INTO paciente VALUES (35, 'Harold', 'Daniels', '1981-08-23', NULL, NULL);
INSERT INTO paciente VALUES (36, 'Henry', 'Lynch', '1993-04-24', NULL, NULL);
INSERT INTO paciente VALUES (37, 'Jeffrey', 'Burton', '1976-11-01', NULL, NULL);
INSERT INTO paciente VALUES (38, 'Willie', 'Carr', '1950-08-01', NULL, NULL);
INSERT INTO paciente VALUES (39, 'Denise', 'Rodriguez', '1970-07-21', NULL, NULL);
INSERT INTO paciente VALUES (40, 'Douglas', 'Coleman', '1973-02-19', NULL, NULL);
INSERT INTO paciente VALUES (41, 'Kathleen', 'Lee', '1955-07-17', NULL, NULL);
INSERT INTO paciente VALUES (42, 'Willie', 'Rogers', '1972-11-20', NULL, NULL);
INSERT INTO paciente VALUES (43, 'Kimberly', 'Washington', '1973-08-08', NULL, NULL);
INSERT INTO paciente VALUES (44, 'Randy', 'Elliott', '1989-09-14', NULL, NULL);
INSERT INTO paciente VALUES (45, 'Sandra', 'Kim', '2009-08-26', NULL, NULL);
INSERT INTO paciente VALUES (46, 'Martha', 'Coleman', '1964-09-12', '2016-02-14', NULL);
INSERT INTO paciente VALUES (47, 'Theresa', 'Long', '1978-03-28', NULL, NULL);
INSERT INTO paciente VALUES (48, 'Martin', 'Pierce', '1968-08-31', NULL, NULL);
INSERT INTO paciente VALUES (49, 'Patrick', 'Snyder', '1989-01-17', NULL, NULL);
INSERT INTO paciente VALUES (50, 'Frances', 'Collins', '1973-01-11', NULL, NULL);
INSERT INTO paciente VALUES (51, 'Kathleen', 'Bishop', '1963-09-21', NULL, NULL);
INSERT INTO paciente VALUES (52, 'Donna', 'Coleman', '1996-06-18', NULL, NULL);
INSERT INTO paciente VALUES (53, 'Elizabeth', 'Phillips', '1950-10-21', NULL, NULL);
INSERT INTO paciente VALUES (54, 'Ann', 'Bell', '1967-11-08', NULL, NULL);
INSERT INTO paciente VALUES (55, 'Arthur', 'Mendoza', '1966-11-03', NULL, NULL);
INSERT INTO paciente VALUES (56, 'Margaret', 'Garza', '1970-03-19', NULL, NULL);
INSERT INTO paciente VALUES (57, 'Russell', 'Medina', '2006-10-28', NULL, NULL);
INSERT INTO paciente VALUES (58, 'Julie', 'Oliver', '1982-01-24', NULL, NULL);
INSERT INTO paciente VALUES (59, 'Andrew', 'Ruiz', '1987-05-03', NULL, NULL);
INSERT INTO paciente VALUES (60, 'Mary', 'Simmons', '1984-03-17', NULL, NULL);
INSERT INTO paciente VALUES (61, 'Thomas', 'Richardson', '1958-11-27', NULL, NULL);
INSERT INTO paciente VALUES (62, 'Janice', 'Hansen', '1991-04-10', NULL, NULL);
INSERT INTO paciente VALUES (63, 'Henry', 'Gilbert', '1953-11-01', '2015-11-14', NULL);
INSERT INTO paciente VALUES (64, 'Dorothy', 'Grant', '1976-09-11', NULL, NULL);
INSERT INTO paciente VALUES (65, 'Russell', 'Black', '1979-03-14', NULL, NULL);
INSERT INTO paciente VALUES (66, 'Emily', 'Phillips', '1990-08-26', NULL, NULL);
INSERT INTO paciente VALUES (67, 'Gloria', 'Crawford', '1986-01-19', NULL, NULL);
INSERT INTO paciente VALUES (68, 'Michelle', 'Harvey', '1979-12-14', NULL, NULL);
INSERT INTO paciente VALUES (69, 'Helen', 'Washington', '1998-09-21', NULL, NULL);
INSERT INTO paciente VALUES (70, 'Judy', 'Harrison', '1976-01-04', NULL, NULL);
INSERT INTO paciente VALUES (71, 'Paula', 'Long', '2006-09-12', NULL, NULL);
INSERT INTO paciente VALUES (72, 'Harold', 'Patterson', '1988-12-02', NULL, NULL);
INSERT INTO paciente VALUES (73, 'Joan', 'Butler', '1998-10-01', NULL, NULL);
INSERT INTO paciente VALUES (74, 'Howard', 'Fox', '1951-12-08', NULL, NULL);
INSERT INTO paciente VALUES (75, 'Louise', 'Graham', '2006-10-30', NULL, NULL);
INSERT INTO paciente VALUES (76, 'Eric', 'Ellis', '1965-03-09', NULL, NULL);
INSERT INTO paciente VALUES (77, 'Patrick', 'Hanson', '1955-05-31', NULL, NULL);
INSERT INTO paciente VALUES (78, 'Rachel', 'Andrews', '1951-07-15', NULL, NULL);
INSERT INTO paciente VALUES (79, 'Juan', 'Hamilton', '2011-03-07', NULL, NULL);
INSERT INTO paciente VALUES (80, 'Larry', 'White', '1998-10-27', NULL, NULL);
INSERT INTO paciente VALUES (81, 'Michael', 'Montgomery', '1968-03-27', NULL, NULL);
INSERT INTO paciente VALUES (82, 'Jesse', 'Rivera', '1951-10-11', '2016-01-24', NULL);
INSERT INTO paciente VALUES (83, 'Ernest', 'Griffin', '2008-12-14', NULL, NULL);
INSERT INTO paciente VALUES (84, 'Ronald', 'Morris', '1988-03-06', NULL, NULL);
INSERT INTO paciente VALUES (85, 'Linda', 'Smith', '2007-12-26', NULL, NULL);
INSERT INTO paciente VALUES (86, 'Ryan', 'Stephens', '1961-04-26', NULL, NULL);
INSERT INTO paciente VALUES (87, 'Donald', 'Vasquez', '1968-09-26', NULL, NULL);
INSERT INTO paciente VALUES (88, 'Craig', 'Nichols', '1976-01-02', NULL, NULL);
INSERT INTO paciente VALUES (89, 'Robert', 'Anderson', '1964-09-24', NULL, NULL);
INSERT INTO paciente VALUES (90, 'Sandra', 'James', '1959-01-30', NULL, NULL);
INSERT INTO paciente VALUES (91, 'Barbara', 'Long', '1959-04-17', NULL, NULL);
INSERT INTO paciente VALUES (92, 'Julie', 'Lopez', '1957-06-29', NULL, NULL);
INSERT INTO paciente VALUES (93, 'Patrick', 'Hudson', '2011-03-13', NULL, NULL);
INSERT INTO paciente VALUES (94, 'Bonnie', 'Cole', '2008-08-24', NULL, NULL);
INSERT INTO paciente VALUES (95, 'Earl', 'Cunningham', '1992-04-05', NULL, NULL);
INSERT INTO paciente VALUES (96, 'Anne', 'Rodriguez', '1977-07-27', NULL, NULL);
INSERT INTO paciente VALUES (97, 'Barbara', 'Wood', '1964-06-13', NULL, NULL);
INSERT INTO paciente VALUES (98, 'Phillip', 'Long', '2007-07-12', NULL, NULL);
INSERT INTO paciente VALUES (99, 'Robert', 'Morris', '1954-06-26', NULL, NULL);
INSERT INTO paciente VALUES (100, 'Teresa', 'Williams', '1957-07-02', NULL, NULL);
INSERT INTO paciente VALUES (102, 'David', 'Melara', '2015-04-30', '2016-04-30', NULL);
INSERT INTO paciente VALUES (103, 'Tua', 'Ramos', '2015-04-30', '2016-04-30', NULL);
INSERT INTO paciente VALUES (101, 'Fito', 'Olmos', '2016-04-16', NULL, NULL);


--
-- TOC entry 2323 (class 0 OID 16575)
-- Dependencies: 217
-- Data for Name: tipo_ingreso; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO tipo_ingreso VALUES (1, 'Hospitalización', true, NULL);
INSERT INTO tipo_ingreso VALUES (2, 'Consulta', true, NULL);
INSERT INTO tipo_ingreso VALUES (3, 'Visita Domiciliar', true, NULL);
INSERT INTO tipo_ingreso VALUES (4, 'Retiro de Medicamentos', true, NULL);
INSERT INTO tipo_ingreso VALUES (5, 'Entrega de Exámenes', true, NULL);


--
-- TOC entry 2299 (class 0 OID 16471)
-- Dependencies: 193
-- Data for Name: ingreso; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO ingreso VALUES (10, 1, 2, '2016-04-11', '23:34:35.309315', '2016-06-24', '10:40:00', NULL);
INSERT INTO ingreso VALUES (3, 2, 4, '2014-02-22', '08:00:00', '2016-03-13', '10:40:00', NULL);
INSERT INTO ingreso VALUES (6, 5, 1, '2013-02-22', '08:00:00', '2016-06-24', '10:40:00', NULL);
INSERT INTO ingreso VALUES (24, 2, 9, '2017-12-09', '18:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (27, 2, 9, '2017-12-09', '18:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (30, 2, 9, '2017-12-09', '06:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (31, 2, 9, '2017-12-09', '06:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (33, 1, 9, '2016-12-09', '06:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (37, 1, 1, '2012-01-18', '06:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (38, 1, 1, '2012-01-18', '06:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (39, 3, 3, '2018-12-09', '05:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (40, 3, 3, '2000-10-09', '05:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (41, 3, 4, '2001-10-09', '05:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (42, 4, 7, '2006-10-09', '05:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (43, 1, 6, '2026-10-09', '05:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (44, 1, 10, '2030-07-09', '05:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (45, 2, 14, '2005-05-14', '05:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (46, 2, 10, '2010-05-14', '05:30:00', NULL, NULL, NULL);
INSERT INTO ingreso VALUES (1, 1, 1, '2016-02-22', '08:00:00', '2016-06-24', '10:40:00', 'holi');
INSERT INTO ingreso VALUES (47, 1, 101, '2000-01-26', '23:00:00', '2000-01-27', '22:00:00', NULL);
INSERT INTO ingreso VALUES (48, 1, 101, '1999-12-31', '18:00:00', '1999-12-31', '18:00:00', NULL);
INSERT INTO ingreso VALUES (49, 1, 101, '2000-01-11', '18:00:00', '2000-01-26', '18:00:00', NULL);
INSERT INTO ingreso VALUES (50, 1, 104, '2006-01-12', '04:00:00', '2000-01-14', '07:00:00', NULL);
INSERT INTO ingreso VALUES (51, 2, 3, '2007-01-31', '18:00:00', '2007-01-31', '07:00:00', NULL);
INSERT INTO ingreso VALUES (52, 3, 101, '2000-01-21', '04:00:00', '2000-01-21', '17:00:00', NULL);
INSERT INTO ingreso VALUES (55, 1, 1, NULL, '18:00:00', '2000-01-28', '18:00:00', NULL);
INSERT INTO ingreso VALUES (9, 1, 1, '2014-04-11', '08:42:53.107609', '2016-06-24', '23:40:00', NULL);
INSERT INTO ingreso VALUES (54, 1, 3, '2000-01-24', '06:00:00', '2000-02-02', '17:00:00', 'dgsdfghsesdfdf');
INSERT INTO ingreso VALUES (56, 4, 101, '2007-01-29', '18:00:00', '2006-12-31', '14:00:00', 'tyuhgghffff');
INSERT INTO ingreso VALUES (29, 1, 15, '2017-12-08', '18:30:00', '2017-09-15', '06:00:00', 'se enfermo');
INSERT INTO ingreso VALUES (8, 3, 104, '2010-02-18', '08:00:00', '2016-06-27', '11:40:00', 'dfghjkl');
INSERT INTO ingreso VALUES (4, 3, 1, '2012-02-21', '02:00:00', '2016-07-29', '08:40:00', '');
INSERT INTO ingreso VALUES (11, 1, 104, '2016-06-11', '16:07:11', '2016-08-25', '02:00:00', '');
INSERT INTO ingreso VALUES (57, 1, 1, '2000-01-21', '06:00:00', '2000-01-22', '12:00:00', NULL);
INSERT INTO ingreso VALUES (59, 4, 31, '2000-01-29', '03:00:00', '2000-01-29', '06:00:00', NULL);
INSERT INTO ingreso VALUES (60, 1, 2, '2000-01-01', '00:00:00', '2000-01-01', '00:00:00', NULL);
INSERT INTO ingreso VALUES (61, 1, 101, '2000-01-01', '00:00:00', '2000-01-01', '00:00:00', NULL);
INSERT INTO ingreso VALUES (62, 1, 1, '2000-01-29', '08:00:00', '2000-02-18', '00:00:00', NULL);
INSERT INTO ingreso VALUES (63, 1, 4, '2000-01-01', '00:00:00', '2000-01-01', '00:00:00', NULL);


--
-- TOC entry 2300 (class 0 OID 16479)
-- Dependencies: 194
-- Data for Name: ingreso_detalle; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO ingreso_detalle VALUES (62, 3, 3, 3, '2000-02-18', '00:00:00', 'sadasdasdfdafa');
INSERT INTO ingreso_detalle VALUES (6, 6, 6, 6, '2016-05-13', '13:00:00', NULL);
INSERT INTO ingreso_detalle VALUES (63, 3, 3, 3, '2000-01-01', '00:00:00', 'hfjh');
INSERT INTO ingreso_detalle VALUES (6, 4, 4, 4, '2000-02-02', '04:00:00', NULL);
INSERT INTO ingreso_detalle VALUES (10, 5, 5, 5, '2000-01-22', '06:00:00', NULL);
INSERT INTO ingreso_detalle VALUES (60, 4, 4, 4, '2000-01-01', '00:00:00', NULL);
INSERT INTO ingreso_detalle VALUES (55, 4, 4, 4, '2000-01-27', '18:00:00', NULL);
INSERT INTO ingreso_detalle VALUES (61, 4, 4, 4, '2000-01-01', '00:00:00', NULL);
INSERT INTO ingreso_detalle VALUES (50, 4, 4, 4, '2006-01-12', '04:00:00', NULL);


--
-- TOC entry 2301 (class 0 OID 16485)
-- Dependencies: 195
-- Data for Name: ingreso_detalle_diagnostico; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO ingreso_detalle_diagnostico VALUES (4, 60, 4, 4, 4, 28, '2016-07-04', NULL, NULL, NULL);
INSERT INTO ingreso_detalle_diagnostico VALUES (5, 6, 4, 4, 4, 16, '2016-07-04', NULL, NULL, NULL);
INSERT INTO ingreso_detalle_diagnostico VALUES (4, 6, 6, 6, 6, 11, '2016-07-04', NULL, 'La apendice estaba a punto de reventar', '');
INSERT INTO ingreso_detalle_diagnostico VALUES (3, 6, 6, 6, 6, 37, '2016-07-04', NULL, NULL, NULL);
INSERT INTO ingreso_detalle_diagnostico VALUES (3, 6, 6, 6, 6, 38, '2016-07-04', NULL, NULL, NULL);
INSERT INTO ingreso_detalle_diagnostico VALUES (6, 10, 5, 5, 5, 39, '2016-07-04', NULL, '', '');
INSERT INTO ingreso_detalle_diagnostico VALUES (3, 10, 5, 5, 5, 35, '2016-07-04', '1753-01-21', 'sasd', 'xcvc');
INSERT INTO ingreso_detalle_diagnostico VALUES (6, 10, 5, 5, 5, 36, '2016-07-04', '1753-02-24', 'qwe', 'pppppp');
INSERT INTO ingreso_detalle_diagnostico VALUES (3, 10, 5, 5, 5, 40, '2016-07-04', NULL, NULL, NULL);
INSERT INTO ingreso_detalle_diagnostico VALUES (1, 10, 5, 5, 5, 41, '2016-07-04', NULL, NULL, NULL);
INSERT INTO ingreso_detalle_diagnostico VALUES (2, 6, 6, 6, 6, 21, '2016-07-04', NULL, NULL, NULL);


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 196
-- Name: ingreso_detalle_diagnostico_id_ingreso_detalle_diagnostico_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('ingreso_detalle_diagnostico_id_ingreso_detalle_diagnostico_seq', 41, true);


--
-- TOC entry 2303 (class 0 OID 16494)
-- Dependencies: 197
-- Data for Name: ingreso_detalle_examen; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO ingreso_detalle_examen VALUES (6, 6, 6, 6, 4, '2016-07-07', '2016-07-03', '05:38:25', 121);
INSERT INTO ingreso_detalle_examen VALUES (6, 6, 6, 6, 2, '2016-11-19', '2016-07-03', '15:47:23', 89);
INSERT INTO ingreso_detalle_examen VALUES (6, 6, 6, 6, 4, '2016-07-14', '2016-07-04', NULL, 145);
INSERT INTO ingreso_detalle_examen VALUES (10, 5, 5, 5, 3, NULL, '2016-07-04', NULL, 148);
INSERT INTO ingreso_detalle_examen VALUES (10, 5, 5, 5, 2, NULL, '2016-07-04', NULL, 149);
INSERT INTO ingreso_detalle_examen VALUES (10, 5, 5, 5, 5, '2016-07-31', '2016-07-04', '11:59:13', 150);
INSERT INTO ingreso_detalle_examen VALUES (10, 5, 5, 5, 4, NULL, '2016-07-04', NULL, 151);
INSERT INTO ingreso_detalle_examen VALUES (63, 3, 3, 3, 5, '2016-07-03', '2016-07-03', '12:33:38', 87);
INSERT INTO ingreso_detalle_examen VALUES (60, 4, 4, 4, 2, NULL, '2016-07-02', NULL, 76);
INSERT INTO ingreso_detalle_examen VALUES (63, 3, 3, 3, 6, NULL, '2016-07-03', NULL, 90);
INSERT INTO ingreso_detalle_examen VALUES (6, 4, 4, 4, 2, '2016-10-10', '2016-06-26', '07:00:03', 139);
INSERT INTO ingreso_detalle_examen VALUES (6, 4, 4, 4, 3, '2016-06-26', '2016-06-26', '03:00:00', 9);
INSERT INTO ingreso_detalle_examen VALUES (50, 4, 4, 4, 4, NULL, '2016-07-02', NULL, 67);


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 198
-- Name: ingreso_detalle_examen_id_ingreso_detalle_examen_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('ingreso_detalle_examen_id_ingreso_detalle_examen_seq', 151, true);


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 199
-- Name: ingreso_id_ingreso_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('ingreso_id_ingreso_seq', 63, true);


--
-- TOC entry 2325 (class 0 OID 16584)
-- Dependencies: 219
-- Data for Name: tipo_medio_contacto; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO tipo_medio_contacto VALUES (1, 'Teléfono Fijo', '2xxx-xxxx');
INSERT INTO tipo_medio_contacto VALUES (2, 'Teléfono Celular', '7xxx-xxxx');
INSERT INTO tipo_medio_contacto VALUES (3, 'Correo Electrónico', 'nombre@dominio.tipo');


--
-- TOC entry 2306 (class 0 OID 16503)
-- Dependencies: 200
-- Data for Name: medio_contacto; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO medio_contacto VALUES (1, 1, 'Número de Casa');
INSERT INTO medio_contacto VALUES (2, 1, 'Número Fijo de Trabajo');
INSERT INTO medio_contacto VALUES (3, 2, 'Número Celular de Trabajo');
INSERT INTO medio_contacto VALUES (4, 2, 'Número Celular de Responsable');
INSERT INTO medio_contacto VALUES (5, 3, 'Correo electrónico personal');


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 201
-- Name: medio_contacto_id_medio_contacto_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('medio_contacto_id_medio_contacto_seq', 5, true);


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 203
-- Name: paciente_id_paciente_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('paciente_id_paciente_seq', 104, true);


--
-- TOC entry 2310 (class 0 OID 16517)
-- Dependencies: 204
-- Data for Name: paciente_medio_contacto; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO paciente_medio_contacto VALUES (1, 1, '2445-6665', NULL);
INSERT INTO paciente_medio_contacto VALUES (1, 4, '7445-6665', NULL);
INSERT INTO paciente_medio_contacto VALUES (2, 5, 'micorreo@gmail.com', NULL);
INSERT INTO paciente_medio_contacto VALUES (3, 2, '2225-6555', NULL);
INSERT INTO paciente_medio_contacto VALUES (4, 3, '7145-7688', NULL);
INSERT INTO paciente_medio_contacto VALUES (5, 1, '2145-7688', NULL);


--
-- TOC entry 2312 (class 0 OID 16531)
-- Dependencies: 206
-- Data for Name: personal_especialidad; Type: TABLE DATA; Schema: public; Owner: mortal2016
--

INSERT INTO personal_especialidad VALUES (1, 1, '2010-05-14', true);
INSERT INTO personal_especialidad VALUES (2, 5, '2011-05-14', true);
INSERT INTO personal_especialidad VALUES (3, 2, '2000-05-14', true);
INSERT INTO personal_especialidad VALUES (4, 3, '2015-05-14', true);
INSERT INTO personal_especialidad VALUES (5, 4, '2008-05-14', true);


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 207
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('personal_id_personal_seq', 100, true);


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 209
-- Name: tipo_centro_id_tipo_centro_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('tipo_centro_id_tipo_centro_seq', 20, true);


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_espacio_id_tipo_espacio_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('tipo_espacio_id_tipo_espacio_seq', 5, true);


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipo_especialidad_id_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('tipo_especialidad_id_especialidad_seq', 9, true);


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 214
-- Name: tipo_especialidad_id_tipo_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('tipo_especialidad_id_tipo_especialidad_seq', 5, true);


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_examen_id_tipo_examen_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('tipo_examen_id_tipo_examen_seq', 5, true);


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 218
-- Name: tipo_ingreso_id_tipo_ingreso_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('tipo_ingreso_id_tipo_ingreso_seq', 5, true);


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 220
-- Name: tipo_medio_contacto_id_tipo_medio_contacto_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2016
--

SELECT pg_catalog.setval('tipo_medio_contacto_id_tipo_medio_contacto_seq', 3, true);


-- Completed on 2016-07-12 20:07:42 CST

--
-- PostgreSQL database dump complete
--

