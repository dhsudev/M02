-- Ex 43
select * from Empleats where Ciutat_dpt="Barcelona" order by sou desc;
-- Ex 44
select * from Empleats where nom_Empl like "%g%";
-- Ex 47
select * from Empleats order by sou desc, nom_Empl asc;
-- Ex 48
select * from Empleats where Ciutat_dpt="Tarragona" or Ciutat_dpt="Barcelona";
select * from Empleats where Ciutat_dpt in ("Barcelona","Tarragona"); 
-- Ex 49
-- Ex 51
select * from Projectes order by length(Nom_proj);
-- 55
-- 56



select TRIM(SUBSTRING(nom, INSTR(nom, ' '), CHAR_LENGTH(nom))) from estudiant;
select TRIM(SUBSTRING(nom, 1, INSTR(nom, ' '))) from estudiant;