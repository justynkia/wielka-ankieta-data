SELECT * FROM przyszlosc;

--ocena przyszlosc i zmiana pracy

DROP VIEW IF EXISTS "VW_OCENA_OBECNY_RYNEK_VS_PRZYSZLOSC";

CREATE OR ALTER VIEW "VW_OCENA_OBECNY_RYNEK_VS_PRZYSZLOSC" AS
SELECT 
id,
"jak oceniasz obecny rynek pracy w branży data / it" AS "obecny_rynek",
"jak oceniasz przyszłość branży data / it" AS "przyszlosc_rynek"
FROM przyszlosc;


DROP VIEW IF EXISTS "VW_ZMIANA_PRACY";

CREATE OR ALTER VIEW "VW_ZMIANA_PRACY" AS
SELECT 
id,
"czy obecnie rozważasz zmianę pracy" AS "czy_zmiana_pracy",
"zmiana pracy | niskie wynagrodzenie w stosunku do oczekiwań" AS "niskie_wynagrodzenie",
"zmiana pracy | brak możliwości rozwoju lub awansu" AS "brak_rozwoju_lub_awansu",
"zmiana pracy | zbyt duże obciążenie / tempo pracy" AS "duze_obciazenie_tempo",
"zmiana pracy | zbyt mało ciekawych projektów" AS "malo_ciekawych_projektow",
"zmiana pracy | zła organizacja pracy lub chaos decyzyjny" AS "zla_organizacja_lub_chaos", 
"zmiana pracy | słaba komunikacja / współpraca w zespole" AS "slaba_komunikacja_wspolpraca",
"zmiana pracy | problemy z przełożonym / zarządzaniem" AS "problemy_przelozony_zarzad",
"zmiana pracy | brak uznania / niedocenienie pracy" AS "brak_uznania_niedocenienie",
"zmiana pracy | chęć spróbowania czegoś nowego" AS "sprobowanie_czegos_nowego",
"zmiana pracy | zmiana sytuacji życiowej" AS "zmiana_sytuacji_zyciowej"

FROM przyszlosc;


-- ogolne - stanowisko, wyksztalcenie, plec i zarobki
DROP VIEW IF EXISTS "VW_OGOLNE";

CREATE OR ALTER VIEW "VW_OGOLNE" AS
SELECT
o.id,
o."kierunek wykształcenia" AS "wyksztalcenie",
o."płeć" AS "plec",
o.stanowisko,
o."poziom stanowiska (seniority)" AS "seniority",
op.zarobki,
MEDIAN(op.zarobki),
op."jak oceniasz konkurencyjność swojego wynagrodzenia względem rynku" AS "ocena_konkurencyjnosci_wynagrodzenia"
FROM ogolne AS o
JOIN organizacja_pracy AS op ON o.id = op.id;



