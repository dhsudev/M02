/* *****************************************************
//  Institut TIC de Barcelona
//	CFGS Desenvolupament d'aplicacions Multiplataforma
//	M20: Bases de dades. UF3: PL/SQL
//	PRÀCTICA UF3. FASE 1
//	AUTOR: Lua Trevín Hernaiz
//	DATA: 12/04/2024
****************************************************** */

--------- EXERCICI 1
CREATE OR REPLACE FUNCTION treureEspais(str VARCHAR2) RETURN VARCHAR2 IS
    cleanStr VARCHAR2(20) := '';
    aux VARCHAR2(20) := '';
BEGIN
    # Iterant string
    FOR i IN 1..LENGTH(str) LOOP
        # Caracter actual
        aux := SUBSTR(str, i, 1);
        IF (aux != ' ') THEN
            # Afegir si no es un espai
            cleanStr := cleanStr || aux;
        END IF;
    END LOOP;
    RETURN cleanStr;
END;

-- Execució
-- SELECT treureEspais(' h   o la aa ') AS result FROM dual;

--------- EXERCICI 2
CREATE OR REPLACE FUNCTION kgToLliures(pes_kg NUMBER) RETURN NUMBER IS
BEGIN
    RETURN ROUND(pes_kg * 2.2046);
END;
/
-- Execució
-- SELECT kgToLliures(0.9) AS result FROM dual;

--------- EXERCICI 3
CREATE OR REPLACE FUNCTION lliuresToKg(pes_lb NUMBER) RETURN NUMBER IS
BEGIN
    RETURN ROUND(pes_lb / 2.2046, 1);
END;
/
-- Execució
-- SELECT lliuresToKg(220) AS result FROM dual;

--------- EXERCICI 4
CREATE OR REPLACE FUNCTION esAlcadaValida (str IN VARCHAR2) 
RETURN INT
AS
  valid INT := 1;
  digits INT := 1;
  indexGuio INT;
  peus INT;
  polz INT;
BEGIN
  indexGuio := INSTR(str, '-');
  -- Per ser valid X-YY X-Y
  IF (indexGuio != 2 OR (LENGTH(str) > 4 AND LENGTH(str) < 3)) THEN
    valid := 0;
  ELSE
    IF (LENGTH(str) = 4) THEN
        digits := 2;
    END IF;
    peus := TO_NUMBER(SUBSTR(str, 1, indexGuio - 1));
    polz := TO_NUMBER(SUBSTR(str, indexGuio + 1, digits));
    IF (peus < 0 OR polz < 0 OR peus IS NULL OR polz IS NULL OR polz > 11) THEN
      valid := 0;
    END IF;
  END IF;
  RETURN valid;
END;
/
-- Execucions valides
-- SELECT esAlcadaValida('1-09') AS result FROM dual;
-- SELECT esAlcadaValida('1-9') AS result FROM dual;
-- Execucions invalides
-- SELECT esAlcadaValida('109') AS result FROM dual;
-- SELECT esAlcadaValida('1--9') AS result FROM dual;

--------- EXERCICI 4