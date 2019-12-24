CREATE FUNCTION `getNamePays` (Cpays varchar(2) )
RETURNS char(45)
BEGIN
declare Pays varchar(45);
	SELECT 
		NomPays
        into Pays
	FROM 
		Pays
	where
		PK_Pays = Cpays;
RETURN Pays;
END