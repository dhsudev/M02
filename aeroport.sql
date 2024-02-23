DROP TABLE IF EXISTS vol;
DROP TABLE IF EXISTS aeroport;

CREATE TABLE aeroport (
  codi char(3),
  nom varchar(30),
  ciutat varchar(30),
  CONSTRAINT pk_aeroport PRIMARY KEY(codi)
);

CREATE TABLE vol (
	numero integer,
	codi_ori char(3),
	codi_dest char(3),
	data date,
	CONSTRAINT pk_vol PRIMARY KEY(numero),
	CONSTRAINT fk_dest  FOREIGN KEY (codi_dest) REFERENCES aeroport(codi),
	CONSTRAINT fk_ori FOREIGN KEY (codi_ori) REFERENCES aeroport(codi)
);

insert into aeroport values('BCN', 'Barcelona El prat', 'Barcelona');
insert into aeroport values('SFO', 'International San Franciso', 'San Francisco');
insert into aeroport values('MAD', 'Barajas', 'Madrid');

insert into vol values(1, 'BCN', 'SFO', '2024-02-06');
insert into vol values(2, 'MAD', 'BCN', '2024-02-16');
insert into vol values(3, 'SFO', 'MAD', '2024-02-13');
insert into vol values(4, 'MAD', 'SFO', '2024-02-06');

select codi as CODI, nom as NOM, ciutat from aeroport; 

select vol.numero as NUMERO_VOL, aeroport.nom as DESTI, aeroport.ciutat as CIUTAT_DESTI from aeroport, vol where vol.codi_dest = aeroport.codi;

select vol.numero as NUMERO_VOL, desti.nom as DESTI, desti.ciutat as CIUTAT_DEST, origen.nom as ORIGEN, origen.ciutat as CIUTAT_ORIGEN 
from aeroport as origen, vol, aeroport as desti 
where vol.codi_dest = desti.codi and vol.codi_ori = origen.codi;

