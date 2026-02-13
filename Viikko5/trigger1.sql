DELIMITER $$


CREATE TRIGGER opiskelija_after_insert
AFTER INSERT ON Opiskelija
FOR EACH ROW
BEGIN
    INSERT INTO Muutokset (pvm, toiminto)
    VALUES (NOW(), 'Lisäys opiskelijatauluun');
END$$


CREATE TRIGGER opiskelija_after_update
AFTER UPDATE ON Opiskelija
FOR EACH ROW
BEGIN
    INSERT INTO Muutokset (pvm, toiminto)
    VALUES (NOW(), 'Muutos opiskelijatauluun'););
END$$


