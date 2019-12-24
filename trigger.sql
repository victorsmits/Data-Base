use Tree;

create TRIGGER DeleteEvent
    AFTER DELETE ON LienArbresFournisseurs FOR EACH ROW
BEGIN
    DECLARE NomFour varchar(45);
    DECLARE NomA varchar(45);
    Select
            Nom into NomFour
    from
        Fournisseurs
    where
            Fournisseurs.PK_Fournisseur = old.FK_Fournisseurs ;

    Select
        NomArbre into NomA
    from
        Arbre
    where
            Arbre.PK_Arbre = old.FK_Arbre;

    insert into DeleteLienArbresFournisseurs(NomFournisseur, NomArbre, Prix, Nb, EventDate, UserName)
    values(NomFour,NomA, old.Prix, old.Nb, Now(), User());
ENDSELECT * FROM Tree.DeleteLienArbresFournisseurs;