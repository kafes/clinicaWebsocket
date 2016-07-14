--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.6
-- Dumped by pg_dump version 9.4.6
-- Started on 2016-07-12 20:06:59 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11861)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 16387)
-- Name: area; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE area (
    id_area integer NOT NULL,
    nombre character varying(255),
    activo boolean DEFAULT true,
    observaciones text
);


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE area IS 'Define las areas de atencion medica que un centro puede tener';


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN area.id_area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN area.id_area IS 'Identificador del area';


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN area.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN area.nombre IS 'Nombre del area';


--
-- TOC entry 174 (class 1259 OID 16394)
-- Name: area_centro; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE area_centro (
    id_area integer,
    id_centro integer,
    id_area_centro bigint NOT NULL,
    nombre character varying(255),
    activo boolean DEFAULT true
);


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE area_centro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE area_centro IS 'Define las areas de atencion que posee un centro especifico';


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN area_centro.id_area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN area_centro.id_area IS 'Identificador del area';


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN area_centro.id_centro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN area_centro.id_centro IS 'Identificador del centro de atencion';


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN area_centro.id_area_centro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN area_centro.id_area_centro IS 'Identificador unico del area de un centro de trabajo';


--
-- TOC entry 175 (class 1259 OID 16398)
-- Name: area_centro_espacio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE area_centro_espacio (
    id_espacio integer,
    id_area_centro bigint,
    id_area_centro_espacio bigint NOT NULL,
    id_area_centro_espacio_padre bigint,
    nombre character varying(255),
    activo boolean DEFAULT true
);


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 175
-- Name: TABLE area_centro_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE area_centro_espacio IS 'Define los espacios que un area del centro de atencion posee';


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN area_centro_espacio.id_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN area_centro_espacio.id_espacio IS 'Identificador del espacio';


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN area_centro_espacio.id_area_centro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN area_centro_espacio.id_area_centro IS 'Identificador del area del centro de atencion';


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN area_centro_espacio.id_area_centro_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN area_centro_espacio.id_area_centro_espacio IS 'Identificador del espacio para el area del centro de trabajo';


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN area_centro_espacio.id_area_centro_espacio_padre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN area_centro_espacio.id_area_centro_espacio_padre IS 'Identificador del espacio del area del centro de atencion del que depende el registro actual';


--
-- TOC entry 176 (class 1259 OID 16402)
-- Name: area_centro_espacio_id_area_centro_espacio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE area_centro_espacio_id_area_centro_espacio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 176
-- Name: area_centro_espacio_id_area_centro_espacio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE area_centro_espacio_id_area_centro_espacio_seq OWNED BY area_centro_espacio.id_area_centro_espacio;


--
-- TOC entry 177 (class 1259 OID 16404)
-- Name: area_centro_id_area_centro_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE area_centro_id_area_centro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 177
-- Name: area_centro_id_area_centro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE area_centro_id_area_centro_seq OWNED BY area_centro.id_area_centro;


--
-- TOC entry 178 (class 1259 OID 16406)
-- Name: area_id_area_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE area_id_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 178
-- Name: area_id_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE area_id_area_seq OWNED BY area.id_area;


--
-- TOC entry 179 (class 1259 OID 16408)
-- Name: asignacion_personal_centro_area; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE asignacion_personal_centro_area (
    id_asignacion_personal_centro_area bigint NOT NULL,
    id_personal bigint,
    id_area_centro bigint NOT NULL,
    fecha_desde date DEFAULT now(),
    fecha_hasta date
);


--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 179
-- Name: TABLE asignacion_personal_centro_area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE asignacion_personal_centro_area IS 'Asignacion del personal a un area del centro de atencion';


--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN asignacion_personal_centro_area.id_asignacion_personal_centro_area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN asignacion_personal_centro_area.id_asignacion_personal_centro_area IS 'Identificador de la asignacion del personal al area de un centro';


--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN asignacion_personal_centro_area.id_personal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN asignacion_personal_centro_area.id_personal IS 'Identificador del personal';


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN asignacion_personal_centro_area.id_area_centro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN asignacion_personal_centro_area.id_area_centro IS 'Identificador del area del centro de atencion';


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN asignacion_personal_centro_area.fecha_hasta; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN asignacion_personal_centro_area.fecha_hasta IS 'Fecha hasta la que se ha asignado al personal de acuerdo a su contrato. Si se deja vacia quiere decir asignacion permanente';


--
-- TOC entry 180 (class 1259 OID 16412)
-- Name: asignacion_personal_centro_ar_id_asignacion_personal_centro_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE asignacion_personal_centro_ar_id_asignacion_personal_centro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 180
-- Name: asignacion_personal_centro_ar_id_asignacion_personal_centro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE asignacion_personal_centro_ar_id_asignacion_personal_centro_seq OWNED BY asignacion_personal_centro_area.id_asignacion_personal_centro_area;


--
-- TOC entry 181 (class 1259 OID 16414)
-- Name: asignacion_personal_centro_area_espacio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE asignacion_personal_centro_area_espacio (
    id_asignacion_personal_centro_area bigint NOT NULL,
    id_area_centro_espacio bigint NOT NULL,
    id_turno bigint NOT NULL,
    observaciones text
);


--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN asignacion_personal_centro_area_espacio.id_asignacion_personal_centro_area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN asignacion_personal_centro_area_espacio.id_asignacion_personal_centro_area IS 'Identificador del personal asociado al area del centro de atencion';


--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN asignacion_personal_centro_area_espacio.id_area_centro_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN asignacion_personal_centro_area_espacio.id_area_centro_espacio IS 'Identificador del espacio en un area del centro de atencion';


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 181
-- Name: COLUMN asignacion_personal_centro_area_espacio.id_turno; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN asignacion_personal_centro_area_espacio.id_turno IS 'Identificador del turno';


--
-- TOC entry 182 (class 1259 OID 16420)
-- Name: asignacion_personal_centro_area_espacio_id_turno_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE asignacion_personal_centro_area_espacio_id_turno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 182
-- Name: asignacion_personal_centro_area_espacio_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE asignacion_personal_centro_area_espacio_id_turno_seq OWNED BY asignacion_personal_centro_area_espacio.id_turno;


--
-- TOC entry 183 (class 1259 OID 16422)
-- Name: asignacion_personal_centro_area_id_area_centro_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE asignacion_personal_centro_area_id_area_centro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 183
-- Name: asignacion_personal_centro_area_id_area_centro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE asignacion_personal_centro_area_id_area_centro_seq OWNED BY asignacion_personal_centro_area.id_area_centro;


--
-- TOC entry 184 (class 1259 OID 16424)
-- Name: centro; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE centro (
    id_centro integer NOT NULL,
    id_tipo_centro integer,
    nombre_corto character varying(155),
    nombre_oficial character varying(255),
    latitud character varying(255),
    longitud character varying(255),
    fecha_inicio date,
    activo boolean DEFAULT true,
    observaciones text
);


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 184
-- Name: TABLE centro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE centro IS 'Centro de atencion';


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN centro.id_centro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN centro.id_centro IS 'Identificador del centro de atencion';


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN centro.id_tipo_centro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN centro.id_tipo_centro IS 'Identificador del tipo de centro';


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 184
-- Name: COLUMN centro.fecha_inicio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN centro.fecha_inicio IS 'fecha de apertura o fundacion';


--
-- TOC entry 185 (class 1259 OID 16431)
-- Name: centro_id_centro_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE centro_id_centro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 185
-- Name: centro_id_centro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE centro_id_centro_seq OWNED BY centro.id_centro;


--
-- TOC entry 186 (class 1259 OID 16433)
-- Name: diagnostico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE diagnostico (
    id_diagnostico bigint NOT NULL,
    nombre character varying(255),
    activo boolean DEFAULT true,
    observaciones text
);


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE diagnostico; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE diagnostico IS 'Determina los posibles diagnosticos que pueden asignarse dentro del sistema';


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN diagnostico.id_diagnostico; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN diagnostico.id_diagnostico IS 'Identificador del diagnostico';


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN diagnostico.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN diagnostico.nombre IS 'Nombre del diagnostico';


--
-- TOC entry 187 (class 1259 OID 16440)
-- Name: diagnostico_examen; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE diagnostico_examen (
    id_diagnostico bigint NOT NULL,
    id_examen bigint NOT NULL,
    obligatorio boolean DEFAULT false,
    observaciones text
);


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE diagnostico_examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE diagnostico_examen IS 'Examenes requeridos por un diagnostico';


--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN diagnostico_examen.id_diagnostico; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN diagnostico_examen.id_diagnostico IS 'Identificador del diagnostico';


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN diagnostico_examen.id_examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN diagnostico_examen.id_examen IS 'Identificador del examen';


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN diagnostico_examen.obligatorio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN diagnostico_examen.obligatorio IS 'Define si el examen es obligatorio para poder concluir en un diagnostico';


--
-- TOC entry 188 (class 1259 OID 16447)
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE diagnostico_id_diagnostico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 188
-- Name: diagnostico_id_diagnostico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE diagnostico_id_diagnostico_seq OWNED BY diagnostico.id_diagnostico;


--
-- TOC entry 189 (class 1259 OID 16449)
-- Name: espacio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE espacio (
    id_espacio integer NOT NULL,
    id_tipo_espacio integer,
    nombre character varying(255) NOT NULL,
    activo boolean DEFAULT true,
    observaciones text
);


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 189
-- Name: TABLE espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE espacio IS 'Define los espacios fisicos que upeden existir. Por ejemplo cama, camilla, catre, etc. para tipo de espacio camas';


--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN espacio.id_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN espacio.id_espacio IS 'Identificador del espacio';


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN espacio.id_tipo_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN espacio.id_tipo_espacio IS 'Identificador del tipo de espacio';


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN espacio.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN espacio.nombre IS 'Nombre del espacio fisico';


--
-- TOC entry 190 (class 1259 OID 16456)
-- Name: espacio_id_espacio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE espacio_id_espacio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 190
-- Name: espacio_id_espacio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE espacio_id_espacio_seq OWNED BY espacio.id_espacio;


--
-- TOC entry 191 (class 1259 OID 16458)
-- Name: especialidad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE especialidad (
    nombre character varying(255) NOT NULL,
    activo boolean,
    observaciones text,
    id_especialidad integer NOT NULL,
    id_tipo_especialidad integer
);


--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 191
-- Name: TABLE especialidad; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE especialidad IS 'Profesiones o especialidades medicas que un empleado puede tener';


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN especialidad.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN especialidad.nombre IS 'Nombre de la especialidad';


--
-- TOC entry 192 (class 1259 OID 16464)
-- Name: examen; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE examen (
    id_examen bigint NOT NULL,
    id_tipo_examen integer,
    nombre character varying(255),
    activo boolean DEFAULT true,
    descripcion text,
    observaciones text
);


--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 192
-- Name: TABLE examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE examen IS 'Examenes medicos disponibles para ser realizados';


--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN examen.id_examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN examen.id_examen IS 'Identificador del examen';


--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN examen.id_tipo_examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN examen.id_tipo_examen IS 'Identificador dle examen';


--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 192
-- Name: COLUMN examen.descripcion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN examen.descripcion IS 'Descripcion del examen';


--
-- TOC entry 193 (class 1259 OID 16471)
-- Name: ingreso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ingreso (
    id_ingreso bigint NOT NULL,
    id_tipo_ingreso integer,
    id_paciente bigint,
    fecha_ingreso date DEFAULT now(),
    hora_ingreso time without time zone DEFAULT now(),
    fecha_egreso date,
    hora_egreso time without time zone,
    observaciones text
);


--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN ingreso.id_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso.id_ingreso IS 'Identificador del ingreso';


--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN ingreso.id_tipo_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso.id_tipo_ingreso IS 'Identificador del tipo de ingreso';


--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN ingreso.id_paciente; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso.id_paciente IS 'Identificador del paciente';


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN ingreso.fecha_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso.fecha_ingreso IS 'Fecha de ingreso del paciente';


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN ingreso.hora_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso.hora_ingreso IS 'Hora de ingreso';


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN ingreso.fecha_egreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso.fecha_egreso IS 'Fecha de egreso en caso de ser hospitalizacion';


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN ingreso.hora_egreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso.hora_egreso IS 'Hora de egreso';


--
-- TOC entry 194 (class 1259 OID 16479)
-- Name: ingreso_detalle; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ingreso_detalle (
    id_ingreso bigint NOT NULL,
    id_asignacion_personal_centro_area bigint NOT NULL,
    id_area_centro_espacio bigint NOT NULL,
    id_turno bigint NOT NULL,
    fecha_detalle date,
    hora_detalle time without time zone,
    observaciones text
);


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 194
-- Name: TABLE ingreso_detalle; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE ingreso_detalle IS 'Almacena la informacion de las personas que atienden a una persona en su ingreso, esto incluye cada una de las citas';


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN ingreso_detalle.id_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle.id_ingreso IS 'Identificador del ingreso';


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN ingreso_detalle.id_asignacion_personal_centro_area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle.id_asignacion_personal_centro_area IS 'Identificador del personal en el centro';


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN ingreso_detalle.id_area_centro_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle.id_area_centro_espacio IS 'Identificador del espacio fisico';


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN ingreso_detalle.id_turno; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle.id_turno IS 'Identificador del turno';


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN ingreso_detalle.fecha_detalle; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle.fecha_detalle IS 'Fecha del evento';


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 194
-- Name: COLUMN ingreso_detalle.hora_detalle; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle.hora_detalle IS 'Hora del evento';


--
-- TOC entry 195 (class 1259 OID 16485)
-- Name: ingreso_detalle_diagnostico; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ingreso_detalle_diagnostico (
    id_diagnostico bigint,
    id_ingreso bigint,
    id_asignacion_personal_centro_area bigint,
    id_area_centro_espacio bigint,
    id_turno bigint,
    id_ingreso_detalle_diagnostico bigint NOT NULL,
    fecha_diagnostico date DEFAULT now(),
    fecha_confirmacion date,
    argumento text,
    observaciones text
);


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 195
-- Name: TABLE ingreso_detalle_diagnostico; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE ingreso_detalle_diagnostico IS 'Diagnosticos asociados a un ingreso';


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN ingreso_detalle_diagnostico.id_diagnostico; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_diagnostico.id_diagnostico IS 'Identificador del diagnostico';


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN ingreso_detalle_diagnostico.id_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_diagnostico.id_ingreso IS 'Identificador del ingreso';


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN ingreso_detalle_diagnostico.id_asignacion_personal_centro_area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_diagnostico.id_asignacion_personal_centro_area IS 'Identificador del personal';


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN ingreso_detalle_diagnostico.id_area_centro_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_diagnostico.id_area_centro_espacio IS 'Identificador del espacio';


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN ingreso_detalle_diagnostico.id_turno; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_diagnostico.id_turno IS 'Identificador del turno';


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN ingreso_detalle_diagnostico.id_ingreso_detalle_diagnostico; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_diagnostico.id_ingreso_detalle_diagnostico IS 'Identificador del diagnostico en el ingreso';


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN ingreso_detalle_diagnostico.fecha_diagnostico; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_diagnostico.fecha_diagnostico IS 'Fecha de diagnostico';


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 195
-- Name: COLUMN ingreso_detalle_diagnostico.argumento; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_diagnostico.argumento IS 'Argumento para concluir el diagnostico';


--
-- TOC entry 196 (class 1259 OID 16492)
-- Name: ingreso_detalle_diagnostico_id_ingreso_detalle_diagnostico_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ingreso_detalle_diagnostico_id_ingreso_detalle_diagnostico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 196
-- Name: ingreso_detalle_diagnostico_id_ingreso_detalle_diagnostico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ingreso_detalle_diagnostico_id_ingreso_detalle_diagnostico_seq OWNED BY ingreso_detalle_diagnostico.id_ingreso_detalle_diagnostico;


--
-- TOC entry 197 (class 1259 OID 16494)
-- Name: ingreso_detalle_examen; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ingreso_detalle_examen (
    id_ingreso bigint,
    id_asignacion_personal_centro_area bigint,
    id_area_centro_espacio bigint,
    id_turno bigint,
    id_examen bigint,
    fecha_realizacion date DEFAULT now(),
    fecha_orden date DEFAULT now(),
    hora_realizacion time without time zone,
    id_ingreso_detalle_examen bigint NOT NULL
);


--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE ingreso_detalle_examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE ingreso_detalle_examen IS 'Examenes realizados durante un ingreso';


--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN ingreso_detalle_examen.id_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_examen.id_ingreso IS 'Identificador del ingreso';


--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN ingreso_detalle_examen.id_asignacion_personal_centro_area; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_examen.id_asignacion_personal_centro_area IS 'Identificador del personal';


--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN ingreso_detalle_examen.id_area_centro_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_examen.id_area_centro_espacio IS 'Identificador del espacio fisico';


--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN ingreso_detalle_examen.id_turno; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_examen.id_turno IS 'Identificador del turno';


--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN ingreso_detalle_examen.id_examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_examen.id_examen IS 'Identificador del examen';


--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN ingreso_detalle_examen.fecha_realizacion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_examen.fecha_realizacion IS 'Fecha de realizacion del examen';


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN ingreso_detalle_examen.fecha_orden; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_examen.fecha_orden IS 'Fecha de orden de realizacion del examen';


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN ingreso_detalle_examen.hora_realizacion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_examen.hora_realizacion IS 'Hora de realizacion del examen';


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN ingreso_detalle_examen.id_ingreso_detalle_examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN ingreso_detalle_examen.id_ingreso_detalle_examen IS 'Identificador del examen realizado';


--
-- TOC entry 198 (class 1259 OID 16499)
-- Name: ingreso_detalle_examen_id_ingreso_detalle_examen_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ingreso_detalle_examen_id_ingreso_detalle_examen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 198
-- Name: ingreso_detalle_examen_id_ingreso_detalle_examen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ingreso_detalle_examen_id_ingreso_detalle_examen_seq OWNED BY ingreso_detalle_examen.id_ingreso_detalle_examen;


--
-- TOC entry 199 (class 1259 OID 16501)
-- Name: ingreso_id_ingreso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ingreso_id_ingreso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 199
-- Name: ingreso_id_ingreso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ingreso_id_ingreso_seq OWNED BY ingreso.id_ingreso;


--
-- TOC entry 200 (class 1259 OID 16503)
-- Name: medio_contacto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE medio_contacto (
    id_medio_contacto integer NOT NULL,
    id_tipo_medio_contacto integer,
    nombre character varying(255)
);


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE medio_contacto; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE medio_contacto IS 'Medios de Contacto disponibles';


--
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN medio_contacto.id_medio_contacto; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN medio_contacto.id_medio_contacto IS 'Identificador del medio de contacto';


--
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN medio_contacto.id_tipo_medio_contacto; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN medio_contacto.id_tipo_medio_contacto IS 'Identificador del tipo de medio de contacto';


--
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN medio_contacto.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN medio_contacto.nombre IS 'Nombre del medio de contacto';


--
-- TOC entry 201 (class 1259 OID 16506)
-- Name: medio_contacto_id_medio_contacto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE medio_contacto_id_medio_contacto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 201
-- Name: medio_contacto_id_medio_contacto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE medio_contacto_id_medio_contacto_seq OWNED BY medio_contacto.id_medio_contacto;


--
-- TOC entry 202 (class 1259 OID 16508)
-- Name: paciente; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE paciente (
    id_paciente bigint NOT NULL,
    nombres character varying(255),
    apellidos character varying(255),
    fecha_nacimiento date DEFAULT now(),
    fecha_defuncion date,
    observaciones text
);


--
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN paciente.id_paciente; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente.id_paciente IS 'Identificador del paciente';


--
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN paciente.nombres; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente.nombres IS 'Nombres del paciente';


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN paciente.apellidos; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente.apellidos IS 'Apellidos del paciente';


--
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN paciente.fecha_nacimiento; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente.fecha_nacimiento IS 'Fecha de nacimiento';


--
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN paciente.fecha_defuncion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente.fecha_defuncion IS 'Fecha de defuncion del paciente';


--
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN paciente.observaciones; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente.observaciones IS 'Observaciones del paciente';


--
-- TOC entry 203 (class 1259 OID 16515)
-- Name: paciente_id_paciente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE paciente_id_paciente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 203
-- Name: paciente_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE paciente_id_paciente_seq OWNED BY paciente.id_paciente;


--
-- TOC entry 204 (class 1259 OID 16517)
-- Name: paciente_medio_contacto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE paciente_medio_contacto (
    id_paciente bigint NOT NULL,
    id_medio_contacto integer NOT NULL,
    medio text NOT NULL,
    observaciones text
);


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE paciente_medio_contacto; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE paciente_medio_contacto IS 'Almacena los medios de contactos para los pacientes. Por ejemplo, direcciones personales, de trabajo, numeros de telefono, etc.';


--
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN paciente_medio_contacto.id_paciente; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente_medio_contacto.id_paciente IS 'Identificador del paciente';


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN paciente_medio_contacto.id_medio_contacto; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente_medio_contacto.id_medio_contacto IS 'Identificador del medio de contacto';


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN paciente_medio_contacto.medio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente_medio_contacto.medio IS 'Medio de contacto. Por ejemplo, si se trata de un email, se almacenaria algo como usuario@dominio';


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN paciente_medio_contacto.observaciones; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN paciente_medio_contacto.observaciones IS 'Observaciones o referencias al medio de contacto';


--
-- TOC entry 205 (class 1259 OID 16523)
-- Name: personal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE personal (
    id_personal bigint NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255),
    dui character varying(10) DEFAULT NULL::character varying,
    fecha_ingreso date DEFAULT now()
);


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE personal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE personal IS 'Almacena la informacion del staff de empleados';


--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN personal.id_personal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN personal.id_personal IS 'Identificador del personal';


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN personal.nombres; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN personal.nombres IS 'Nombres del empleado';


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN personal.dui; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN personal.dui IS 'Numero de identificacion DUI';


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN personal.fecha_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN personal.fecha_ingreso IS 'Fecha de ingreso al sistema';


--
-- TOC entry 206 (class 1259 OID 16531)
-- Name: personal_especialidad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE personal_especialidad (
    id_personal bigint NOT NULL,
    id_especialidad integer NOT NULL,
    fecha_desde date,
    principal boolean DEFAULT true
);


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE personal_especialidad; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE personal_especialidad IS 'Almacena las especialidades profesionales de un empleado';


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN personal_especialidad.id_personal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN personal_especialidad.id_personal IS 'Identificador del personal';


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN personal_especialidad.id_especialidad; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN personal_especialidad.id_especialidad IS 'Identificador de la especialidad';


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN personal_especialidad.fecha_desde; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN personal_especialidad.fecha_desde IS 'Fecha de obtencion de la especialidad';


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN personal_especialidad.principal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN personal_especialidad.principal IS 'En caso que se posean varias especialidades, determina si esta es la principal';


--
-- TOC entry 207 (class 1259 OID 16535)
-- Name: personal_id_personal_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE personal_id_personal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 207
-- Name: personal_id_personal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE personal_id_personal_seq OWNED BY personal.id_personal;


--
-- TOC entry 208 (class 1259 OID 16537)
-- Name: tipo_centro; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_centro (
    id_tipo_centro integer NOT NULL,
    nombre character varying(255),
    activo boolean DEFAULT true,
    observaciones text
);


--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN tipo_centro.id_tipo_centro; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_centro.id_tipo_centro IS 'Identificador del tipo de centro de atencion';


--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN tipo_centro.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_centro.nombre IS 'Nombre del tipo de centro';


--
-- TOC entry 209 (class 1259 OID 16544)
-- Name: tipo_centro_id_tipo_centro_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_centro_id_tipo_centro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 209
-- Name: tipo_centro_id_tipo_centro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_centro_id_tipo_centro_seq OWNED BY tipo_centro.id_tipo_centro;


--
-- TOC entry 210 (class 1259 OID 16546)
-- Name: tipo_espacio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_espacio (
    id_tipo_espacio integer NOT NULL,
    nombre character varying NOT NULL,
    activo boolean DEFAULT true,
    observaciones text
);


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE tipo_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE tipo_espacio IS 'Define los tipos de espacios fisicos que pueden existir. Por ejemplo, camas, cuartos, cupos, turnos, etc.';


--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN tipo_espacio.id_tipo_espacio; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_espacio.id_tipo_espacio IS 'Identificador del tipo de espacio fisico';


--
-- TOC entry 2405 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN tipo_espacio.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_espacio.nombre IS 'Nombre del tipo de espacio fisico';


--
-- TOC entry 211 (class 1259 OID 16553)
-- Name: tipo_espacio_id_tipo_espacio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_espacio_id_tipo_espacio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2406 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_espacio_id_tipo_espacio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_espacio_id_tipo_espacio_seq OWNED BY tipo_espacio.id_tipo_espacio;


--
-- TOC entry 212 (class 1259 OID 16555)
-- Name: tipo_especialidad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_especialidad (
    id_tipo_especialidad integer NOT NULL,
    nombre character varying(255) NOT NULL,
    observaciones text,
    activo boolean DEFAULT true
);


--
-- TOC entry 2407 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE tipo_especialidad; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE tipo_especialidad IS 'agrupa las especialidades medicas por afinidad';


--
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN tipo_especialidad.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_especialidad.nombre IS 'Nombre del tipo de especialidad';


--
-- TOC entry 213 (class 1259 OID 16562)
-- Name: tipo_especialidad_id_especialidad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_especialidad_id_especialidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipo_especialidad_id_especialidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_especialidad_id_especialidad_seq OWNED BY especialidad.id_especialidad;


--
-- TOC entry 214 (class 1259 OID 16564)
-- Name: tipo_especialidad_id_tipo_especialidad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_especialidad_id_tipo_especialidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2410 (class 0 OID 0)
-- Dependencies: 214
-- Name: tipo_especialidad_id_tipo_especialidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_especialidad_id_tipo_especialidad_seq OWNED BY tipo_especialidad.id_tipo_especialidad;


--
-- TOC entry 215 (class 1259 OID 16566)
-- Name: tipo_examen; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_examen (
    id_tipo_examen integer NOT NULL,
    nombre character varying(255),
    activo boolean DEFAULT true,
    observaciones text
);


--
-- TOC entry 2411 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE tipo_examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE tipo_examen IS 'Define el tipo de examen medico que puede realizarse';


--
-- TOC entry 2412 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN tipo_examen.id_tipo_examen; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_examen.id_tipo_examen IS 'Identificador del tipo de examen';


--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 215
-- Name: COLUMN tipo_examen.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_examen.nombre IS 'Nombre del tipo de examen';


--
-- TOC entry 216 (class 1259 OID 16573)
-- Name: tipo_examen_id_tipo_examen_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_examen_id_tipo_examen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 216
-- Name: tipo_examen_id_tipo_examen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_examen_id_tipo_examen_seq OWNED BY tipo_examen.id_tipo_examen;


--
-- TOC entry 217 (class 1259 OID 16575)
-- Name: tipo_ingreso; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_ingreso (
    id_tipo_ingreso integer NOT NULL,
    nombre character varying(255),
    activo boolean DEFAULT true,
    observaciones text
);


--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE tipo_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE tipo_ingreso IS 'Define el tipo de ingreso de un paciente. Puede ser hospitalizacion, consulta, visita domiciliar, etc.';


--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN tipo_ingreso.id_tipo_ingreso; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_ingreso.id_tipo_ingreso IS 'Identificador del tipo de ingreso';


--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN tipo_ingreso.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_ingreso.nombre IS 'Nombre del tipo de ingreso';


--
-- TOC entry 218 (class 1259 OID 16582)
-- Name: tipo_ingreso_id_tipo_ingreso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_ingreso_id_tipo_ingreso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 218
-- Name: tipo_ingreso_id_tipo_ingreso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_ingreso_id_tipo_ingreso_seq OWNED BY tipo_ingreso.id_tipo_ingreso;


--
-- TOC entry 219 (class 1259 OID 16584)
-- Name: tipo_medio_contacto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_medio_contacto (
    id_tipo_medio_contacto integer NOT NULL,
    nombre character varying(155),
    expresion_regular character varying(255)
);


--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN tipo_medio_contacto.id_tipo_medio_contacto; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_medio_contacto.id_tipo_medio_contacto IS 'Identificador del tipo de medio de contacto';


--
-- TOC entry 2420 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN tipo_medio_contacto.nombre; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_medio_contacto.nombre IS 'Nombre del medio de contacto';


--
-- TOC entry 2421 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN tipo_medio_contacto.expresion_regular; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN tipo_medio_contacto.expresion_regular IS 'Expresion regular para validar medios de contacto';


--
-- TOC entry 220 (class 1259 OID 16587)
-- Name: tipo_medio_contacto_id_tipo_medio_contacto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_medio_contacto_id_tipo_medio_contacto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2422 (class 0 OID 0)
-- Dependencies: 220
-- Name: tipo_medio_contacto_id_tipo_medio_contacto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_medio_contacto_id_tipo_medio_contacto_seq OWNED BY tipo_medio_contacto.id_tipo_medio_contacto;


--
-- TOC entry 2047 (class 2604 OID 16589)
-- Name: id_area; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY area ALTER COLUMN id_area SET DEFAULT nextval('area_id_area_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 16590)
-- Name: id_area_centro; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY area_centro ALTER COLUMN id_area_centro SET DEFAULT nextval('area_centro_id_area_centro_seq'::regclass);


--
-- TOC entry 2051 (class 2604 OID 16591)
-- Name: id_area_centro_espacio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY area_centro_espacio ALTER COLUMN id_area_centro_espacio SET DEFAULT nextval('area_centro_espacio_id_area_centro_espacio_seq'::regclass);


--
-- TOC entry 2053 (class 2604 OID 16592)
-- Name: id_asignacion_personal_centro_area; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignacion_personal_centro_area ALTER COLUMN id_asignacion_personal_centro_area SET DEFAULT nextval('asignacion_personal_centro_ar_id_asignacion_personal_centro_seq'::regclass);


--
-- TOC entry 2054 (class 2604 OID 16593)
-- Name: id_area_centro; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignacion_personal_centro_area ALTER COLUMN id_area_centro SET DEFAULT nextval('asignacion_personal_centro_area_id_area_centro_seq'::regclass);


--
-- TOC entry 2055 (class 2604 OID 16594)
-- Name: id_turno; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignacion_personal_centro_area_espacio ALTER COLUMN id_turno SET DEFAULT nextval('asignacion_personal_centro_area_espacio_id_turno_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 16595)
-- Name: id_centro; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY centro ALTER COLUMN id_centro SET DEFAULT nextval('centro_id_centro_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 16596)
-- Name: id_diagnostico; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY diagnostico ALTER COLUMN id_diagnostico SET DEFAULT nextval('diagnostico_id_diagnostico_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 16597)
-- Name: id_espacio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY espacio ALTER COLUMN id_espacio SET DEFAULT nextval('espacio_id_espacio_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 16598)
-- Name: id_especialidad; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY especialidad ALTER COLUMN id_especialidad SET DEFAULT nextval('tipo_especialidad_id_especialidad_seq'::regclass);


--
-- TOC entry 2067 (class 2604 OID 16599)
-- Name: id_ingreso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso ALTER COLUMN id_ingreso SET DEFAULT nextval('ingreso_id_ingreso_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 16600)
-- Name: id_ingreso_detalle_diagnostico; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso_detalle_diagnostico ALTER COLUMN id_ingreso_detalle_diagnostico SET DEFAULT nextval('ingreso_detalle_diagnostico_id_ingreso_detalle_diagnostico_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 16601)
-- Name: id_ingreso_detalle_examen; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso_detalle_examen ALTER COLUMN id_ingreso_detalle_examen SET DEFAULT nextval('ingreso_detalle_examen_id_ingreso_detalle_examen_seq'::regclass);


--
-- TOC entry 2073 (class 2604 OID 16602)
-- Name: id_medio_contacto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY medio_contacto ALTER COLUMN id_medio_contacto SET DEFAULT nextval('medio_contacto_id_medio_contacto_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 16603)
-- Name: id_paciente; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY paciente ALTER COLUMN id_paciente SET DEFAULT nextval('paciente_id_paciente_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 16604)
-- Name: id_personal; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY personal ALTER COLUMN id_personal SET DEFAULT nextval('personal_id_personal_seq'::regclass);


--
-- TOC entry 2081 (class 2604 OID 16605)
-- Name: id_tipo_centro; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_centro ALTER COLUMN id_tipo_centro SET DEFAULT nextval('tipo_centro_id_tipo_centro_seq'::regclass);


--
-- TOC entry 2083 (class 2604 OID 16606)
-- Name: id_tipo_espacio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_espacio ALTER COLUMN id_tipo_espacio SET DEFAULT nextval('tipo_espacio_id_tipo_espacio_seq'::regclass);


--
-- TOC entry 2085 (class 2604 OID 16607)
-- Name: id_tipo_especialidad; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_especialidad ALTER COLUMN id_tipo_especialidad SET DEFAULT nextval('tipo_especialidad_id_tipo_especialidad_seq'::regclass);


--
-- TOC entry 2087 (class 2604 OID 16608)
-- Name: id_tipo_examen; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_examen ALTER COLUMN id_tipo_examen SET DEFAULT nextval('tipo_examen_id_tipo_examen_seq'::regclass);


--
-- TOC entry 2089 (class 2604 OID 16609)
-- Name: id_tipo_ingreso; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_ingreso ALTER COLUMN id_tipo_ingreso SET DEFAULT nextval('tipo_ingreso_id_tipo_ingreso_seq'::regclass);


--
-- TOC entry 2090 (class 2604 OID 16610)
-- Name: id_tipo_medio_contacto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipo_medio_contacto ALTER COLUMN id_tipo_medio_contacto SET DEFAULT nextval('tipo_medio_contacto_id_tipo_medio_contacto_seq'::regclass);


--
-- TOC entry 2092 (class 2606 OID 16612)
-- Name: pk_area; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY area
    ADD CONSTRAINT pk_area PRIMARY KEY (id_area);


--
-- TOC entry 2094 (class 2606 OID 16614)
-- Name: pk_area_centro; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY area_centro
    ADD CONSTRAINT pk_area_centro PRIMARY KEY (id_area_centro);


--
-- TOC entry 2096 (class 2606 OID 16616)
-- Name: pk_area_centro_espacio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY area_centro_espacio
    ADD CONSTRAINT pk_area_centro_espacio PRIMARY KEY (id_area_centro_espacio);


--
-- TOC entry 2098 (class 2606 OID 16618)
-- Name: pk_asignacion_personal_centro_area; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY asignacion_personal_centro_area
    ADD CONSTRAINT pk_asignacion_personal_centro_area PRIMARY KEY (id_asignacion_personal_centro_area);


--
-- TOC entry 2100 (class 2606 OID 16620)
-- Name: pk_asignacion_personal_centro_area_espacio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY asignacion_personal_centro_area_espacio
    ADD CONSTRAINT pk_asignacion_personal_centro_area_espacio PRIMARY KEY (id_asignacion_personal_centro_area, id_area_centro_espacio, id_turno);


--
-- TOC entry 2102 (class 2606 OID 16622)
-- Name: pk_centro; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY centro
    ADD CONSTRAINT pk_centro PRIMARY KEY (id_centro);


--
-- TOC entry 2104 (class 2606 OID 16624)
-- Name: pk_diagnostico; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY diagnostico
    ADD CONSTRAINT pk_diagnostico PRIMARY KEY (id_diagnostico);


--
-- TOC entry 2106 (class 2606 OID 16626)
-- Name: pk_diagnostico_examen; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY diagnostico_examen
    ADD CONSTRAINT pk_diagnostico_examen PRIMARY KEY (id_diagnostico, id_examen);


--
-- TOC entry 2108 (class 2606 OID 16628)
-- Name: pk_espacio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY espacio
    ADD CONSTRAINT pk_espacio PRIMARY KEY (id_espacio);


--
-- TOC entry 2111 (class 2606 OID 16630)
-- Name: pk_especialidad; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY especialidad
    ADD CONSTRAINT pk_especialidad PRIMARY KEY (id_especialidad);


--
-- TOC entry 2113 (class 2606 OID 16632)
-- Name: pk_examen; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY examen
    ADD CONSTRAINT pk_examen PRIMARY KEY (id_examen);


--
-- TOC entry 2115 (class 2606 OID 16634)
-- Name: pk_ingreso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT pk_ingreso PRIMARY KEY (id_ingreso);


--
-- TOC entry 2117 (class 2606 OID 16636)
-- Name: pk_ingreso_detalle; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ingreso_detalle
    ADD CONSTRAINT pk_ingreso_detalle PRIMARY KEY (id_ingreso, id_asignacion_personal_centro_area, id_area_centro_espacio, id_turno);


--
-- TOC entry 2119 (class 2606 OID 16638)
-- Name: pk_ingreso_detalle_diagnostico; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ingreso_detalle_diagnostico
    ADD CONSTRAINT pk_ingreso_detalle_diagnostico PRIMARY KEY (id_ingreso_detalle_diagnostico);


--
-- TOC entry 2121 (class 2606 OID 16640)
-- Name: pk_ingreso_detalle_examen; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ingreso_detalle_examen
    ADD CONSTRAINT pk_ingreso_detalle_examen PRIMARY KEY (id_ingreso_detalle_examen);


--
-- TOC entry 2123 (class 2606 OID 16642)
-- Name: pk_medio_contacto; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY medio_contacto
    ADD CONSTRAINT pk_medio_contacto PRIMARY KEY (id_medio_contacto);


--
-- TOC entry 2125 (class 2606 OID 16644)
-- Name: pk_paciente; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paciente
    ADD CONSTRAINT pk_paciente PRIMARY KEY (id_paciente);


--
-- TOC entry 2127 (class 2606 OID 16646)
-- Name: pk_paciente_medio_contacto; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY paciente_medio_contacto
    ADD CONSTRAINT pk_paciente_medio_contacto PRIMARY KEY (id_paciente, id_medio_contacto);


--
-- TOC entry 2129 (class 2606 OID 16648)
-- Name: pk_personal; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY personal
    ADD CONSTRAINT pk_personal PRIMARY KEY (id_personal);


--
-- TOC entry 2131 (class 2606 OID 16650)
-- Name: pk_personal_especialidad; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY personal_especialidad
    ADD CONSTRAINT pk_personal_especialidad PRIMARY KEY (id_personal, id_especialidad);


--
-- TOC entry 2133 (class 2606 OID 16652)
-- Name: pk_tipo_centro; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_centro
    ADD CONSTRAINT pk_tipo_centro PRIMARY KEY (id_tipo_centro);


--
-- TOC entry 2135 (class 2606 OID 16654)
-- Name: pk_tipo_espacio; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_espacio
    ADD CONSTRAINT pk_tipo_espacio PRIMARY KEY (id_tipo_espacio);


--
-- TOC entry 2137 (class 2606 OID 16656)
-- Name: pk_tipo_especialidad; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_especialidad
    ADD CONSTRAINT pk_tipo_especialidad PRIMARY KEY (id_tipo_especialidad);


--
-- TOC entry 2139 (class 2606 OID 16658)
-- Name: pk_tipo_examen; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_examen
    ADD CONSTRAINT pk_tipo_examen PRIMARY KEY (id_tipo_examen);


--
-- TOC entry 2141 (class 2606 OID 16660)
-- Name: pk_tipo_ingreso; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_ingreso
    ADD CONSTRAINT pk_tipo_ingreso PRIMARY KEY (id_tipo_ingreso);


--
-- TOC entry 2143 (class 2606 OID 16662)
-- Name: pk_tipo_medio_contacto; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_medio_contacto
    ADD CONSTRAINT pk_tipo_medio_contacto PRIMARY KEY (id_tipo_medio_contacto);


--
-- TOC entry 2109 (class 1259 OID 16663)
-- Name: fki_especialidad_tipo_especialidad; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fki_especialidad_tipo_especialidad ON especialidad USING btree (id_tipo_especialidad);


--
-- TOC entry 2144 (class 2606 OID 16664)
-- Name: fk_area_centro_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY area_centro
    ADD CONSTRAINT fk_area_centro_area FOREIGN KEY (id_area) REFERENCES area(id_area) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2145 (class 2606 OID 16669)
-- Name: fk_area_centro_centro; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY area_centro
    ADD CONSTRAINT fk_area_centro_centro FOREIGN KEY (id_centro) REFERENCES centro(id_centro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2146 (class 2606 OID 16674)
-- Name: fk_area_centro_espacio_area_centro; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY area_centro_espacio
    ADD CONSTRAINT fk_area_centro_espacio_area_centro FOREIGN KEY (id_area_centro) REFERENCES area_centro(id_area_centro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2148 (class 2606 OID 16679)
-- Name: fk_asignacion_centro_area_centro_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignacion_personal_centro_area
    ADD CONSTRAINT fk_asignacion_centro_area_centro_area FOREIGN KEY (id_area_centro) REFERENCES area_centro(id_area_centro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2149 (class 2606 OID 16684)
-- Name: fk_asignacion_personal_centro_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignacion_personal_centro_area
    ADD CONSTRAINT fk_asignacion_personal_centro_area FOREIGN KEY (id_personal) REFERENCES personal(id_personal) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2150 (class 2606 OID 16689)
-- Name: fk_asignacion_personal_centro_area_espacio_asignacion_personal_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY asignacion_personal_centro_area_espacio
    ADD CONSTRAINT fk_asignacion_personal_centro_area_espacio_asignacion_personal_ FOREIGN KEY (id_asignacion_personal_centro_area) REFERENCES asignacion_personal_centro_area(id_asignacion_personal_centro_area);


--
-- TOC entry 2151 (class 2606 OID 16694)
-- Name: fk_centro_tipo_centro; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY centro
    ADD CONSTRAINT fk_centro_tipo_centro FOREIGN KEY (id_tipo_centro) REFERENCES tipo_centro(id_tipo_centro) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2152 (class 2606 OID 16699)
-- Name: fk_diagnostico_examen_diagnostico; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY diagnostico_examen
    ADD CONSTRAINT fk_diagnostico_examen_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES diagnostico(id_diagnostico) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2153 (class 2606 OID 16704)
-- Name: fk_diagnostico_examen_examen; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY diagnostico_examen
    ADD CONSTRAINT fk_diagnostico_examen_examen FOREIGN KEY (id_examen) REFERENCES examen(id_examen) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2154 (class 2606 OID 16709)
-- Name: fk_espacio_tipo_espacio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY espacio
    ADD CONSTRAINT fk_espacio_tipo_espacio FOREIGN KEY (id_tipo_espacio) REFERENCES tipo_espacio(id_tipo_espacio) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2155 (class 2606 OID 16714)
-- Name: fk_especialidad_tipo_especialidad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY especialidad
    ADD CONSTRAINT fk_especialidad_tipo_especialidad FOREIGN KEY (id_tipo_especialidad) REFERENCES tipo_especialidad(id_tipo_especialidad) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2156 (class 2606 OID 16719)
-- Name: fk_examen_tipo_examne; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY examen
    ADD CONSTRAINT fk_examen_tipo_examne FOREIGN KEY (id_tipo_examen) REFERENCES tipo_examen(id_tipo_examen) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2147 (class 2606 OID 16724)
-- Name: fk_id_area_centro_espacio_espacio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY area_centro_espacio
    ADD CONSTRAINT fk_id_area_centro_espacio_espacio FOREIGN KEY (id_espacio) REFERENCES espacio(id_espacio) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2159 (class 2606 OID 16729)
-- Name: fk_ingreso_detalle_asignacion_personal_centro_area_espacio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso_detalle
    ADD CONSTRAINT fk_ingreso_detalle_asignacion_personal_centro_area_espacio FOREIGN KEY (id_asignacion_personal_centro_area, id_area_centro_espacio, id_turno) REFERENCES asignacion_personal_centro_area_espacio(id_asignacion_personal_centro_area, id_area_centro_espacio, id_turno) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2161 (class 2606 OID 16734)
-- Name: fk_ingreso_detalle_diagnostico_diagnostico; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso_detalle_diagnostico
    ADD CONSTRAINT fk_ingreso_detalle_diagnostico_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES diagnostico(id_diagnostico) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2162 (class 2606 OID 16739)
-- Name: fk_ingreso_detalle_diagnostico_ingreso_detalle; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso_detalle_diagnostico
    ADD CONSTRAINT fk_ingreso_detalle_diagnostico_ingreso_detalle FOREIGN KEY (id_ingreso, id_asignacion_personal_centro_area, id_area_centro_espacio, id_turno) REFERENCES ingreso_detalle(id_ingreso, id_asignacion_personal_centro_area, id_area_centro_espacio, id_turno) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2163 (class 2606 OID 16744)
-- Name: fk_ingreso_detalle_examen_examen; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso_detalle_examen
    ADD CONSTRAINT fk_ingreso_detalle_examen_examen FOREIGN KEY (id_examen) REFERENCES examen(id_examen) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2164 (class 2606 OID 16749)
-- Name: fk_ingreso_detalle_examen_ingreso_detalle; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso_detalle_examen
    ADD CONSTRAINT fk_ingreso_detalle_examen_ingreso_detalle FOREIGN KEY (id_ingreso, id_asignacion_personal_centro_area, id_area_centro_espacio, id_turno) REFERENCES ingreso_detalle(id_ingreso, id_asignacion_personal_centro_area, id_area_centro_espacio, id_turno) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2160 (class 2606 OID 16754)
-- Name: fk_ingreso_detalle_ingreso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso_detalle
    ADD CONSTRAINT fk_ingreso_detalle_ingreso FOREIGN KEY (id_ingreso) REFERENCES ingreso(id_ingreso) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2157 (class 2606 OID 16759)
-- Name: fk_ingreso_paciente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT fk_ingreso_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2158 (class 2606 OID 16764)
-- Name: fk_ingreso_tipo_ingreso; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ingreso
    ADD CONSTRAINT fk_ingreso_tipo_ingreso FOREIGN KEY (id_tipo_ingreso) REFERENCES tipo_ingreso(id_tipo_ingreso) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2165 (class 2606 OID 16769)
-- Name: fk_medio_contacto_tipo_medio_contacto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY medio_contacto
    ADD CONSTRAINT fk_medio_contacto_tipo_medio_contacto FOREIGN KEY (id_tipo_medio_contacto) REFERENCES tipo_medio_contacto(id_tipo_medio_contacto) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2166 (class 2606 OID 16774)
-- Name: fk_paciente_medio_contacto_medio_contacto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY paciente_medio_contacto
    ADD CONSTRAINT fk_paciente_medio_contacto_medio_contacto FOREIGN KEY (id_medio_contacto) REFERENCES medio_contacto(id_medio_contacto) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2167 (class 2606 OID 16779)
-- Name: fk_paciente_medio_contacto_paciente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY paciente_medio_contacto
    ADD CONSTRAINT fk_paciente_medio_contacto_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2168 (class 2606 OID 16784)
-- Name: fk_personal_especialidad_especialidad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY personal_especialidad
    ADD CONSTRAINT fk_personal_especialidad_especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2169 (class 2606 OID 16789)
-- Name: fk_personal_especialidad_personal; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY personal_especialidad
    ADD CONSTRAINT fk_personal_especialidad_personal FOREIGN KEY (id_personal) REFERENCES personal(id_personal) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2016-07-12 20:07:00 CST

--
-- PostgreSQL database dump complete
--

