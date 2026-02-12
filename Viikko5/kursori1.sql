DELIMITER $$
CREATE PROCEDURE `kursori`(IN merkki CHAR(1))
BEGIN
/*Paikalliset muuttujat*/
DECLARE arvos INT;
DECLARE ID INT;
/*Tosi, kun kursori menee taulun loppuun*/
DECLARE done BOOLEAN;
/*Haetaan kursoriin kaikki tiedot kahdesta sarakkeesta*/
DECLARE arvos_cursor CURSOR for
SELECT idArviointi,Arvosana FROM Arviointi;
/* NOT FOUND-käsittelijä (kun rivit loppuu) */
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
/*Avataan kursori*/
OPEN arvos_cursor;
/*Aloitetaan silmukka*/
arvos_loop: loop
/*Sijoitetaan kursorin arvot rivi kerrallaan muuttujiin*/
FETCH arvos_cursor INTO ID,arvos;
/*Kun kaikki luettu, silmukasta ulos*/
IF done then
CLOSE arvos_cursor;
LEAVE arvos_loop;
END IF;
/*Päivitetään Arvosana-sarakkeen yksi rivi*/
IF merkki = '+' THEN
	IF arvos < 5 THEN
		UPDATE Arviointi SET Arvosana = arvos + 1 WHERE idArviointi = ID;
	END IF;
ELSEIF merkki = '-' THEN
	IF arvos > 1 THEN
		UPDATE Arviointi SET Arvosana = arvos - 1 WHERE idArviointi = ID;
	END IF;
END IF;
END LOOP arvos_loop;
END