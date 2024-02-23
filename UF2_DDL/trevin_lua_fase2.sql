/* *****************************************************
//  INS TIC de Barcelona
//	CFGS DAM-DAW
//	M2: Bases de dades. UF2: Llenguatge SQL
//	PRÀCTICA UF2. FASE 2
//	AUTOR: Jordi Quesada
//	DATA: 18/12/2023
****************************************************** */

/*                ATENCIÓ:                   */
/*  NO MODIFIQUEU RES ENTRE AQUESTA LINEA I LA 60 */

/* BORRAT DE TAULES */
/* QUAN ESTIGUIN CREADES LES CLAUS FORANES CALDRÀ TENIR PRESENT L'ORDRE: */
/* PARTIDO PREVIA A EQUIP. ESTADISTICAS PREVIA A JUGADOR. JUGADOR PREVIA A EQUIP */
DROP TA partido;
DROP TABLE IF EXISTS estadisticas;
DROP TABLE IF EXISTS jugador;
DROP TABLE IF EXISTS equipo;

/* CREACIO DE LA TAULA EQUIP */
CREATE TABLE equipo (
  nombre varchar(20),
  ciudad varchar(20) NOT NULL,
  conferencia char(4) NOT NULL,
  division varchar(9) NOT NULL
);


/* CREACIO DE LA TAULA JUGADOR */
CREATE TABLE jugador (
  codigo mediumint,
  nombre varchar(30) NOT NULL,
  procedencia varchar(20),
  altura char(4),
  peso smallint,
  posicion varchar(5),
  nombre_equipo varchar(20) NOT NULL
);

/* CREACIO DE LA TAULA ESTADISTICAS */
CREATE TABLE estadisticas (
  codigo mediumint,
  temporada char(5),
  puntos_por_partido float,
  asistencias_por_partido float,
  tapones_por_partido float,
  rebotes_por_partido float
);

/* CREACIO DE LA TAULA PARTIDO */
CREATE TABLE partido (
  codigo mediumint,
  equipo_local varchar(20) NOT NULL,
  equipo_visitante varchar(20) NOT NULL,
  puntos_local smallint,
  puntos_visitante smallint,
  temporada char(5) NOT NULL
);
/* AFEGEIX A PARTIR D'AQUESTA LÍNIA LA SOLUCIÓ PLANTEJADA A LA FASE 2 */
œ
/* Restriccions per Equipo */
ALTER TABLE equipo
  ADD CONSTRAINT PK_equipo PRIMARY KEY (nombre),
  ADD CONSTRAINT CHK_conferencia CHECK (
    conferencia = 'East' OR 
    conferencia = 'West'),
  ADD CONSTRAINT CHK_division CHECK (
      division = 'Atlantic' OR 
      division = 'Central' OR
      division = 'SouthEast' OR
      division = 'NorthWest' OR
      division = 'Pacific' OR
      division = 'SouthWest'
    );

/* Restriccions per Jugador */
ALTER TABLE jugador
  ADD CONSTRAINT PK_jugador PRIMARY KEY (codigo),
  ADD CONSTRAINT FK_jugador_equipo FOREIGN KEY (nombre_equipo) REFERENCES equipo(nombre),
  ADD CONSTRAINT CHK_posicion CHECK (
      posicion = 'G-F-C' OR 
      posicion = 'G-F-C' OR
      posicion = 'F-G-C' OR
      posicion = 'F-C-G' OR
      posicion = 'C-G-F' OR
      posicion = 'C-F-G' OR
      posicion = 'G-F' OR
      posicion = 'G-C' OR
      posicion = 'F-G' OR
      posicion = 'F-C' OR
      posicion = 'C-G' OR
      posicion = 'C-F' OR
      posicion = 'C' OR
      posicion = 'G' OR
      posicion = 'F'
    );

/* Restriccions per Estadisticas */
ALTER TABLE estadisticas
  ADD CONSTRAINT PK_estadisticas PRIMARY KEY (codigo, temporada),
  ADD CONSTRAINT FK_estadisticas_jugador FOREIGN KEY (codigo) REFERENCES jugador(codigo),
  ADD constraint ch_punts CHECK (puntos_por_partido >= 0),
  ADD CONSTRAINT ch_asists CHECK (asistencias_por_partido >= 0),
  ADD CONSTRAINT ch_tapones CHECK (tapones_por_partido >= 0),
  ADD CONSTRAINT ch_rebotes CHECK (rebotes_por_partido >= 0);

/* Restriccions per Partido */
ALTER TABLE partido
  ADD CONSTRAINT PK_partido PRIMARY KEY (codigo),
  ADD CONSTRAINT FK_partido_equipo_local FOREIGN KEY (equipo_local) REFERENCES equipo(nombre),
  ADD CONSTRAINT FK_partido_equipo_visitante FOREIGN KEY (equipo_visitante) REFERENCES equipo(nombre);