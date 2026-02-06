CREATE PROCEDURE `lisaa_suoritus` (
	IN En VARCHAR(45),
    IN Sn VARCHAR(45),
    IN KK VARCHAR(45),
    IN Arvos INT
)
Aliohjelma:BEGIN
    DECLARE OpiskID INT DEFAULT 0;
    DECLARE OpjaksoID INT DEFAULT 0;

    SELECT idOpiskelija INTO OpiskID
    FROM Opiskelija
    WHERE Etunimi = En AND Sukunimi = Sn;

    IF OpiskID = 0 THEN
        SELECT 'Opiskelijaa ei ole';
        LEAVE Aliohjelma;
    END IF;

    SELECT idOpintojakso INTO OpjaksoID
    FROM Opintojakso
    WHERE Koodi = KK;

    IF OpjaksoID = 0 THEN
        SELECT 'Opintojaksoa ei ole';
        LEAVE Aliohjelma;
    END IF;


    IF Arvos < 0 OR Arvos > 5 THEN
        SELECT 'Arvosanan pitää olla välillä 0-5';
        LEAVE Aliohjelma;
    END IF;


    INSERT INTO Arviointi (Paivamaara, Arvosana, idOpiskelija, idOpintojakso)
    VALUES (CURDATE(), Arvos, OpiskID, OpjaksoID);

    SELECT 'Suoritus lisätty onnistuneesti';

END