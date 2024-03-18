-- Active: 1708085372039@@127.0.0.1@3306@fase3
/* *****************************************************
//  INSTITUT TIC DE BARCELONA
//	CFGS: DAM 1A
//	M2: Bases de dades. UF2: Llenguatge SQL
//	PRÀCTICA UF2. FASE 5
//	AUTOR: Lua Trevin Hernaiz
//	DATA: 26/01/24
****************************************************** */

SELECT
    equipo_local AS NOM,
    COUNT(*) AS PARTITS,
    MAX(puntos_local) AS PUNTS_MAX,
    MIN(puntos_local) AS PUNTS_MIN,
    SUM(puntos_local) AS PUNTS_TOT,
    ROUND(AVG(puntos_local), 2) AS PUNTS_PROMIG
FROM Partido
WHERE equipo_local = 'Bulls';

SELECT
    p.equipo_local AS NOM,
    COUNT(*) AS PARTITS,
    MAX(p.puntos_local) AS PUNTS_MAX,
    MIN(p.puntos_local) AS PUNTS_MIN,
    SUM(p.puntos_local) AS PUNTS_TOT,
    ROUND(AVG(p.puntos_local), 2) AS PUNTS_PROMIG
FROM Partido as p JOIN Equipo as e 
ON (p.equipo_local = e.Nombre)
WHERE e.Division like('Pacific')
GROUP BY p.equipo_local
ORDER BY PUNTS_PROMIG;

SELECT
   	j.Nombre AS NOM,
    COUNT(*) AS TEMPORADES,
    MAX(e.Puntos_por_partido) AS MAX_PPP,
    MIN(e.Puntos_por_partido) AS MIN_PPP,
    ROUND(AVG(e.Puntos_por_partido), 2) AS PROMIG_PPP
FROM Estadisticas as e JOIN Jugador as j
ON (e.codigo = j.codigo)
WHERE j.Nombre_equipo like ('Lakers')
GROUP BY e.codigo
ORDER BY TEMPORADES DESC, PROMIG_PPP;

SELECT
   	j.Nombre AS NOM,
    COUNT(*) AS TEMPORADES,
    MAX(e.Puntos_por_partido) AS MAX_PPP,
    MIN(e.Puntos_por_partido) AS MIN_PPP,
    ROUND(AVG(e.Puntos_por_partido), 2) AS PROMIG_PPP
FROM Estadisticas as e JOIN Jugador as j ON (e.codigo = j.codigo)
JOIN Equipo as eq on (j.Nombre_equipo = eq.Nombre)
WHERE eq.Conferencia = 'West'
GROUP BY e.codigo
HAVING TEMPORADES > 10 and MIN_PPP > 10
ORDER BY TEMPORADES DESC, PROMIG_PPP;


SELECT codigo as CODI, ROUND(AVG(`Puntos_por_partido`),2) as PUNTS_PROMIG
FROM `Estadisticas`
where codigo = ANY(select codigo from `Jugador` where `Procedencia` like ('Spain'))
GROUP BY codigo;

SELECT e.codigo as CODIGO, j.`Nombre` as NOMBRE, j.`Nombre_equipo` as EQUIPO, e.temporada as TEMPORADA, `Puntos_por_partido` as PPP
from `Estadisticas` as e natural join `Jugador` as j
where e.`Puntos_por_partido` >= (
	select MAX(`Puntos_por_partido`)
	from `Estadisticas` 
	where codigo = ANY(
			select codigo 
			from `Jugador` 
			where `Nombre_equipo` like('Lakers')))	
	and j.`Nombre_equipo`<>'Lakers';