
INSERT INTO zakupione_bilety (gosc_id, data_zakupu)
SELECT gosc_id, data_wizyty
FROM wizyty
ORDER BY data_wizyty ASC;

UPDATE rodzaje_biletow
SET opis = case rodzaj_biletu_id
    WHEN 1 THEN 'Bilet dla każdej osoby w wieku od 8 do 70 lat, oferowany w sezonie letnim'
    WHEN 2 THEN 'Bilet dla uczniów w wieku od 8 lat i studentów przysługujący po okazaniu ważnej legitymacji, oferowany w sezonie letnim'
    WHEN 3 THEN 'Bilet dla każdej osoby w wieku od 8 do 70 lat'
    WHEN 4 THEN 'Bilet dla uczniów w wieku od 8 lat i studentów przysługujący po okazaniu ważnej legitymacji'
END
WHERE rodzaj_biletu_id IN (1, 2, 3, 4);

UPDATE zakupione_bilety
SET rodzaj_biletu_id = FLOOR(1 + (RAND() * 4));

INSERT INTO transakcje_finansowe 
(data_transakcji, typ, kwota, opis)
SELECT 
b.data_zakupu AS data_transakcji, 
'BILET' AS typ, c.cena AS kwota, 
CONCAT('Zakup biletu: ', c.cena, ', gość ID ', b.gosc_id) AS opis
FROM zakupione_bilety b JOIN cennik c 
ON b.rodzaj_biletu_id = c.rodzaj_biletu_id;

INSERT INTO transakcje_finansowe
(data_transakcji, typ, kwota, opis)
SELECT data_zakupu, 
'UBEZPIECZENIE', suma,
CONCAT('Zakup ubezpioeczenia ID ', ubezpieczenie_id, ', gość ID ', gosc_id)
FROM ubezpieczenie;

INSERT INTO transakcje_finansowe
(data_transakcji, typ, kwota, opis)
SELECT data_do, 'WYNAGRODZENIA',
kwota_miesieczna, 
CONCAT('wypłata wynagrodzenia ID ', wynagrodzenie_id, ', pracownik_id ', pracownik_id)
FROM wynagrodzenia;






