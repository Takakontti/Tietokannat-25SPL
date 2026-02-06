CREATE PROCEDURE `lisaa_teos` (
	in f_teos_nimi varchar(200),
    in f_isbn varchar(20),
    in f_julkaisuvuosi int,
    in f_etunimi varchar(50),
    in f_sukunimi varchar(50)
    )
BEGIN
	declare v_teos_id int;
    declare v_tekija_id int;
    
    insert into	teos (nimi, isbn, julkaisuvuosi)
    values (f_teos_nimi, f_isbn, f_julkaisuvuosi);
    
    set v_teos_id = last_insert_id();
    
    select tekija_id
    into v_tekija_id
    from tekija
    where etunimi = f_etunimi
    and sukunimi = f_sukunimi;
    
    if v_tekija_id is null then
		insert into tekija (etunimi, sukunimi)
        values (f_etunimi, f_sukunimi);
        
		set v_tekija_id = last_insert_id();
	end if;
    
    insert into teos_tekija (teos_id, tekija_id)
    values (v_teos_id, v_tekija_id);
    
END