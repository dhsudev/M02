/* *****************************************************
//  INSTITUT TIC DE BARCELONA
//	CFGS: DAM 1A
//	M2: Bases de dades. UF2: Llenguatge SQL
//	PRÀCTICA UF2. FASE 3
//	AUTOR: Lua Trevin Hernaiz
//	DATA: 26/01/24
****************************************************** */

SELECT nombre AS NOM FROM Jugador WHERE Procedencia LIKE 'Spain';

SELECT Nombre, Peso, Altura FROM Jugador WHERE Nombre_equipo = 'Lakers' ORDER BY Peso DESC;

SELECT CONCAT('El jugador ', Nombre, ' medeix ', SUBSTRING(TRIM(altura), 1, POSITION("-" IN TRIM(altura))-1), ' peus i ', SUBSTRING(TRIM(altura), POSITION("-" IN TRIM(altura))+1), ' polzades') AS Pregunta3 FROM Jugador WHERE Nombre_equipo = 'Grizzlies' AND Posicion like '%C%';

SELECT equipo_local AS LOCAL, puntos_local AS PUNTS_LOCAL, equipo_visitante AS VISITANT, puntos_visitante AS PUNTS_VISITANTE from partido where puntos_local = puntos_visitante AND puntos_local > 150;

SELECT equipo_local AS EQ_LOCAL, puntos_local AS PUNTS_LOCAL, equipo_visitante AS EQ_VISITANT, puntos_visitante AS PUNTS_VISITANT, (puntos_visitante - puntos_local) AS DIFERENCE from partido where temporada LIKE "%98/99%" AND equipo_local LIKE "%LAKERS%" AND (puntos_local < puntos_visitante) AND (puntos_visitante - puntos_local >= 65);

SELECT nombre AS NOMBRE, char_length(nombre) from equipo where conferencia like "%west%" and char_length(nombre) >= 10 ORDER BY char_length(nombre) DESC;

SELECT nombre as nom, peso as pes, altura as alcada, posicion as posicion from jugador where (peso >= 280 and posicion like '%F%') or (SUBSTRING(TRIM(Altura),1,1)  < 6 and posicion like 'G'); 

SELECT nombre as nom, Nombre_equipo as equip, ROUND((SUBSTRING(TRIM(altura), 1, POSITION("-" IN TRIM(altura))-1)* 0.31)+(SUBSTRING(TRIM(altura), POSITION("-" IN TRIM(altura))+1)*0.03),2) as alcada_metres from jugador where (Nombre_equipo = 'Knicks' or Nombre_equipo = 'Pistons') and ROUND((SUBSTRING(TRIM(altura), 1, POSITION("-" IN TRIM(altura))-1)* 0.31)+(SUBSTRING(TRIM(altura), POSITION("-" IN TRIM(altura))+1)*0.03),2) > 2.15;

SELECT DISTINCT  Procedencia as PROCEDENCIA from jugador where nombre_equipo like "Nuggets" and nombre like "%y%"

SELECT DISTINCT equipo as EQUIPO from partido where (puntos_local > puntos_visitante) and (puntos_local - puntos_visitante) > 103 and temporada like "98/99" , "99/00" , "00/01";

SELECT DISTINCT equipo_local as EQUIPO from partido where (puntos_local > puntos_visitante) and (puntos_local - puntos_visitante) >= 103 and (temporada like "98/99" or temporada like "99/00" or temporada like  "00/01");