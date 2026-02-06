CREATE PROCEDURE `lisaa_lainaus` (
    IN p_kirja_id INT,
    IN p_asiakas_id INT
)
BEGIN

    DECLARE v_tila VARCHAR(20);

    SELECT tila
    INTO v_tila
    FROM Kirja
    WHERE kirja_id = p_kirja_id;

    IF v_tila = 'LAINASSA' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Kirja on jo lainassa';
        
    ELSE
		INSERT INTO Lainaus (kirja_id, asiakas_id)
        VALUES (p_kirja_id, p_asiakas_id);

        UPDATE Kirja
        SET tila = 'LAINASSA'
        WHERE kirja_id = p_kirja_id;
        
    END IF;
END