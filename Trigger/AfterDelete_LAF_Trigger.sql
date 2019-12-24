CREATE DEFINER = CURRENT_USER TRIGGER `Tree`.`LienArbresFournisseurs_AFTER_DELETE` AFTER DELETE ON `LienArbresFournisseurs` FOR EACH ROW
BEGIN
    DECLARE NomFour varchar(45);
    DECLARE NomA varchar(45);
SELECT 
    Nom
INTO NomFour FROM
    Fournisseurs
WHERE
    Fournisseurs.PK_Fournisseur = old.FK_Fournisseurs;

SELECT 
    NomArbre
INTO NomA FROM
    Arbre
WHERE
    Arbre.PK_Arbre = old.FK_Arbre;

    insert into DeleteLienArbresFournisseurs(NomFournisseur, NomArbre, Prix, Nb, EventDate, UserName)
    values(NomFour,NomA, old.Prix, old.Nb, Now(), User());
END
