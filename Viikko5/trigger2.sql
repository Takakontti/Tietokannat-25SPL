DELIMITER $$


CREATE TRIGGER `Opiskelija_BEFORE_DELETE` BEFORE DELETE ON `Opiskelija` FOR EACH ROW
BEGIN
    DECLARE str VARCHAR(500);
    SET str = CONCAT(OLD.idOpiskelija, ' ', OLD.Etunimi, ' ', OLD.Sukunimi, ' ', OLD.Osoite,' ', OLD.Luokatunnus);
    INSERT INTO Roskakori VALUES(NULL, NOW(), str);
END$$


CREATE TRIGGER `Arviointi_BEFORE_DELETE` BEFORE DELETE ON `Arviointi` FOR EACH ROW
BEGIN
    DECLARE str VARCHAR(500);
    SET str = CONCAT(OLD.idArviointi, ' ', OLD.Paivamaara, ' ', OLD.Arvosana, ' ', OLD.idOpiskelija, ' ', OLD.idOpintojakso);
    INSERT INTO Roskakori VALUES(NULL, NOW(), str);
END$$


CREATE TRIGGER `Opintojakso_BEFORE_DELETE` BEFORE DELETE ON `Opintojakso` FOR EACH ROW
BEGIN
    DECLARE str VARCHAR(500);
    SET str = CONCAT(OLD.idOpintojakso, ' ', OLD.Koodi, ' ', OLD.Laajuus, ' ', OLD.Nimi);
    INSERT INTO Roskakori VALUES(NULL, NOW(), str);
END$$


CREATE TRIGGER `Muutokset_BEFORE_DELETE` BEFORE DELETE ON `Muutokset` FOR EACH ROW
BEGIN
    DECLARE str VARCHAR(500);
    SET str = CONCAT(OLD.idMuutokset, ' ', OLD.pvm, ' ', OLD.toiminto);
    INSERT INTO Roskakori VALUES(NULL, NOW(), str);
END$$


