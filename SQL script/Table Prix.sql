use Tree;

#Requête pour afficher un tableau avec les prix (HTVA) et les prix (TVAC) pour les chênes de tous les vendeurs

SELECT 
    a.NomArbre,
    f.Nom,
    f.Prenom,
    laf.Prix AS 'Prix HTVA',
    laf.Prix * 1.21 AS 'Prix TVAC'
FROM
    Fournisseurs f
        INNER JOIN
    LienArbresFournisseurs laf ON laf.FK_Fournisseurs = f.PK_Fournisseur
        INNER JOIN
    Arbre a ON laf.FK_Arbre = a.PK_Arbre
WHERE
    (a.NomArbre LIKE 'Chênes')