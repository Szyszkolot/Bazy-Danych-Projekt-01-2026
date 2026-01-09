INSERT INTO ubezpieczenie (gosc_id, wizyta_id, data_zakupu)
SELECT gosc_id, wizyta_id, data_wizyty
FROM wizyty;

UPDATE ubezpieczenie
SET suma = 30;

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

INSERT INTO niedostepnosci_atrakcji (atrakcja_id, data_od, data_do, powod)
VALUES (2, '2024-09-07', '2024-09-09', 'awaria'),
        (5, '2025-05-04', '2024-05-20', 'awaria'),
        (7, '2025-06-15', '2025-06-16', 'Naprawa liny asekuracyjnej'),
        (9, '2025-08-17', '2025-09-20', 'awaria'),
        (12, '2025-09-26', '2025-09-30', 'awaria');