-- Active: 1708085372039@@127.0.0.1@3306@simulacreExamen
--		Primera part: Consultes bàsiques
--1. Mostra el nom dels pokemon que tinguin una lletra b al seu nom i
--	que tinguin o un pes superior a 70 o una alçada inferior a 0.5 
--		(resultat: 4)
select nombre
from pokemon
where nombre like ('%b%') and (peso > 70 or altura < 0.5);
--2. Mostra una sola columna que indiqui: “el pokemon: <<nom>>
--	medeix <<alçada>>” però nomès d’aquells pokemons que el nom
--	tingui més de 9 caràcters 
--		(resultat: 16)
select CONCAT('el pokemon ', nombre, ' medeix ', altura)
from pokemon
where CHARACTER_LENGTH(nombre) > 9;

--3. Mostra el nom dels pokemon que el nom comenci i acabi per la
--	mateixa lletra 
--		(resultat: 5)
select nombre
from pokemon
WHERE LEFT(nombre, 1) = RIGHT(nombre, 1);

--		Segona part: Unió de taules
--4. Mostra els nom i la velocitat dels pokemons que tinguin una
--	velocitat superior a 110 
--		(resultat: 8)
SELECT p.nombre as NOM, e.velocidad
from pokemon as p natural join estadisticas_base as e
where e.velocidad > 110;

--5. Mostra el nom i el tipus de tots els pokemon que tinguin un pes
--	entre 55 i 60
--		(resultat: 18)
SELECT p.nombre AS NOM, t.nombre AS TIPO
FROM pokemon p
     INNER JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex
     INNER JOIN tipo t ON pt.id_tipo = t.id_tipo
WHERE p.peso >= 55 AND p.peso <= 60;

--6. Mostra el nom del pokemon, el tipus i el tipus d’atac de tots els
--	pokemon que tinguin una alçada inferior a 0.4 
--		(resultat: 15)
SELECT p.nombre AS NOM, t.nombre AS TIPO, ta.tipo as TIPO_ATAQUE
FROM pokemon p
     INNER JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex
     INNER JOIN tipo t ON pt.id_tipo = t.id_tipo
	 INNER JOIN tipo_ataque ta ON t.id_tipo_ataque = ta.id_tipo_ataque
WHERE p.altura < 0.4;

--		Tercera part: Agrupacions
--7. Mostra quants pokemons tenim de cada tipus 
--		(resultat 15)
select t.nombre as TIPO, count(*) as QTY
FROM pokemon p
     INNER JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex
     INNER JOIN tipo t ON pt.id_tipo = t.id_tipo
GROUP BY t.nombre;

--8. Mostra quants pokemons tenim de cada tipus però nomès si hi ha
--	més de 15 pokemons 
--		(resultat 4)
select t.nombre as TIPO, count(*) as QTY
FROM pokemon p
     INNER JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex
     INNER JOIN tipo t ON pt.id_tipo = t.id_tipo
GROUP BY t.nombre
HAVING QTY > 15;

--9. Mostra el nom dels pokemons i de quants tipus és però només dels
--	pokemon que siguin de més d’un tipus 
--		(resultat: 63)
select p.nombre, count(*)
FROM pokemon p
     INNER JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex
     INNER JOIN tipo t ON pt.id_tipo = t.id_tipo 
GROUP BY nombre
HAVING count(*) > 1;

--		Quarta part: subconsultes
--10. Mostra els pokemon que tinguin més velocitat que el pokemon
--	amb número de pokedex 128 
--		(resultat: 8)
select p.nombre, e.velocidad
from pokemon as p INNER JOIN estadisticas_base as e ON (p.numero_pokedex = e.numero_pokedex)
where e.velocidad > (select velocidad from estadisticas_base WHERE numero_pokedex = 128);

--11. Mostra els pokemon que tinguin més velocitat que Raichu
--		(resultat: 15)
select p.nombre, e.velocidad
from pokemon as p INNER JOIN estadisticas_base as e ON (p.numero_pokedex = e.numero_pokedex)
where e.velocidad > (
	select e.velocidad 
	from estadisticas_base e INNER JOIN pokemon p on (p.numero_pokedex = e.numero_pokedex) 
	WHERE p.nombre LIKE('Raichu'));

--12. Mostra el pokemon amb la velocitat més gran sense fer servir
--	joins només amb subconsultes 
--		(resultat: 1)
select nombre
from pokemon
where numero_pokedex = (
	select numero_pokedex from estadisticas_base where velocidad >= ALL(
		select velocidad from estadisticas_base));

--		Última part: Secció “profe como te pasas”
--13. Mostra el nom dels pokemon i el nom del pokemon al que
--	evolucionen però només dels pokemons que tant l’origen com
--	l’evolucionat tinguin una lletra r al seu nom 
--		(resultat: 24)
select pre.nombre as preEvolucio, ev.nombre as Evolucio
from pokemon as pre 
	INNER JOIN evoluciona_de as rel on (pre.numero_pokedex = rel.pokemon_origen)
	INNER JOIN pokemon as ev on (rel.pokemon_evolucionado = ev.numero_pokedex)
where ev.nombre like ('%r%') and pre.nombre like ('%r%');
--14. Mostra quants pokemons tenim de cada tipus. Atenció volem
--	informació de TOTS els tipus 
--		(resultat 16)
select t.nombre as TIPO, count(p.nombre) as QTY
FROM pokemon p
     INNER JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex
     RIGHT JOIN tipo t ON pt.id_tipo = t.id_tipo
GROUP BY t.nombre;

select *
FROM pokemon p
     INNER JOIN pokemon_tipo pt ON p.numero_pokedex = pt.numero_pokedex
     RIGHT JOIN tipo t ON pt.id_tipo = t.id_tipo
ORDER BY t.nombre;

select * from tipo where nombre like('informatico');