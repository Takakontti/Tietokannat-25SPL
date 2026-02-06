CREATE PROCEDURE `poista_suoritus` ( 
	IN En VARCHAR(45),
    IN Sn VARCHAR(45),
    IN KK VARCHAR(45)
)
Aliohjelma:BEGIN
    DECLARE OpiskID INT DEFAULT 0;
    DECLARE OpjaksoID INT DEFAULT 0;
    DECLARE SuoritusID INT DEFAULT 0;

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

    SELECT COUNT(*) INTO SuoritusID
    FROM Arviointi
    WHERE idOpiskelija = OpiskID AND idOpintojakso = OpjaksoID;

    IF SuoritusID = 0 THEN
        SELECT 'Suoritusta ei löydy';
        LEAVE Aliohjelma;
    END IF;

    DELETE FROM Arviointi
    WHERE idOpiskelija = OpiskID AND idOpintojakso = OpjaksoID;

    SELECT 'Suoritus poistettu onnistuneesti';
END