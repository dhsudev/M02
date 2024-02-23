/* *****************************************************
//  INSTITUT TIC DE BARCELONA
//	CFGS: DAM 1A
//	M2: Bases de dades. UF2: Llenguatge SQL
//	PRÀCTICA UF2. FASE 4
//	AUTOR: Lua Trevin Hernaiz
//	DATA: 26/01/24
****************************************************** */

SELECT j.nombre as NOM, e.temporada as TEMP, e.Puntos_por_partido as PPP, e.Rebotes_por_partido as RBP
FROM estadisticas e JOIN jugador j
ON (e.codigo = j.codigo)
WHERE (e.temporada like ('06/07') or (e.temporada like '07/08')) and j.Procedencia like ('SPAIN') and j.Posicion like ('%G%')
order by e.temporada, e.Puntos_por_partido;


SELECT e.nombre as EQUIPO, j.nombre as NOMBR, j.posicion as POSIC, j.altura as ALCADA
FROM equipo e JOIN jugador j
ON (e.nombre = j.nombre_equipo)
WHERE substring(trim(j.altura), 1, 1) >= 7 and e.ciudad like 'Los Angeles';

SELECT j.nombre as NOM, j.nombre_equipo as EQUIP, e.temporada as TEMP, e.Puntos_por_partido as Punts, e.Rebotes_por_partido as Rebots, e.Asistencias_por_partido as 'ASSIST.'
FROM jugador j NATURAL JOIN estadisticas e
WHERE (e.Puntos_por_partido > 25) and (e.Asistencias_por_partido > 7 or e.Rebotes_por_partido > 12);

SELECT CONCAT(el.nombre,'(', el.ciudad,')') as 'LOCAL', CONCAT(ev.nombre,'(', ev.ciudad,')') as "VISITANTE", CONCAT(p.puntos_local, '-', p.puntos_visitante) as "RESULTAT"
FROM partido p JOIN equipo el on (p.equipo_local = el.nombre) JOIN equipo ev on (p.equipo_visitante = ev.nombre)
WHERE (el.conferencia like "EAST" and ev.conferencia like "WEST") and (p.puntos_visitante > p.puntos_local) and (p.puntos_visitante - p.puntos_local > 100);

SELECT j.nombre as NOM, CONCAT(eq.nombre,'(', eq.ciudad,')') as EQUIP, j.posicion as POSICIO, e.Puntos_por_partido as PUNTS_PER_PARTIT
FROM jugador j JOIN equipo eq on (j.nombre_equipo = eq.nombre) NATURAL JOIN estadisticas e
WHERE e.temporada like "04/05" and e.Puntos_por_partido > 25;