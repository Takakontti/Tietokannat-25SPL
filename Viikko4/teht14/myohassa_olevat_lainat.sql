CREATE PROCEDURE `myohassa_olevat_lainat` ()
BEGIN
    SELECT
        t.nimi AS teos_nimi,
        k.kirja_id,
        a.etunimi,
        a.sukunimi,
        l.erapaiva
    FROM Lainaus l
        JOIN Kirja k ON l.kirja_id = k.kirja_id

        JOIN Teos t ON k.teos_id = t.teos_id

        JOIN Asiakas a ON l.asiakas_id = a.asiakas_id
    WHERE
        l.palautus_pvm IS NULL
        AND l.erapaiva < CURDATE();
END