-- Active: 1708085372039@@127.0.0.1@3306@fase3
-- Mostra el títol de les pel·lícules que tinguin
-- més vots que qualsevol de les pel·lícules
-- fetes a l’any 1995 de dos maneres diferents
select titol from pelicula where vots > ANY(select vots from pelicula where anyo = 1995) and anyo<>1995;
select titol from pelicula where vots > (select min(vots) from pelicula where anyo = 1995) and anyo<>1995;

select titol from pelicula where vots > ALL(select vots from pelicula where anyo = 1995) and anyo<>1995;
select titol from pelicula where vots > (select max(vots) from pelicula where anyo = 1995) and anyo<>1995;
-- 80. Mostra els empleats que treballin en algun projecte del client ECIGSA fent servir subconsultes

select `nom_Empl` from `Empleats` where `Codi_proj` = ANY(select `Codi_proj` from projectes where `Codi_cli` = ANY(select `Codi_cli` from `Clients` where `Nom_cli` like 'ECIGSA'));
select `nom_Empl` from `Empleats` natural join projectes natural join `Clients` where `Clients`.`Nom_cli`='ECIGSA';

-- 82. Mostra els empleats que cobren més que el sou promig
select * from `Empleats`;
select avg(sou) from `Empleats`;
select `nom_Empl`, sou from `Empleats` where sou > (select avg(sou) from `Empleats`)