DELIMITER $$
CREATE PROCEDURE `kursori2`(
    IN p_old VARCHAR(45),
    IN p_new VARCHAR(45)
)
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_class VARCHAR(45);

    DECLARE students_cursor CURSOR FOR
        SELECT idOpiskelija, Luokatunnus FROM Opiskelija WHERE Luokatunnus = p_old;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN students_cursor;

    students_loop: LOOP
        FETCH students_cursor INTO v_id, v_class;
        IF done THEN
            CLOSE students_cursor;
            LEAVE students_loop;
        END IF;
        UPDATE Opiskelija
        SET Luokatunnus = p_new
        WHERE idOpiskelija = v_id;
    END LOOP students_loop;

END$$
