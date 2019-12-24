CREATE DEFINER=`root`@`%` FUNCTION `getArbre`(Narbre int(11)) RETURNS char(45) CHARSET utf8mb4
BEGIN
    DECLARE done INT DEFAULT FALSE;
    declare ListeFournisseur nvarchar(500);
    declare np varchar(100);
    declare curseur CURSOR FOR
        SELECT Fournisseurs.Nom FROM Fournisseurs
                                         inner join LienArbresFournisseurs laf on
                Fournisseurs.PK_Fournisseur = laf.FK_Fournisseurs
        where laf.FK_Arbre=Narbre;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN curseur;
    Fetch curseur into np;
    set ListeFournisseur='';
    read_loop: LOOP
        IF done THEN
            LEAVE read_loop;
        END IF;
       set ListeFournisseur= concat(ListeFournisseur,';',np);
        fetch curseur into np;
    end loop;
    CLOSE curseur;
    RETURN ListeFournisseur;
END