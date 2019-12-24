USE Tree;

SELECT 
    *
FROM
    Arbre a
        INNER JOIN
    LienArbresFournisseurs laf ON a.PK_Arbre = laf.FK_Arbre;




SELECT 
    a.NomArbre,
    COUNT(*) AS 'NB Fournisseur',
    MAX(Prix),
    MIN(Prix),
    AVG(Prix)
FROM
    LienArbresFournisseurs laf
        INNER JOIN
    Arbre a ON laf.FK_Arbre = a.PK_Arbre
GROUP BY a.NomArbre
ORDER BY a.NomArbre;




SELECT
	
	f.Nom,
	f.Prenom,
	cp.CodePostal,
	cp.Commune
from 
	Fournisseurs f
    inner join CodePostal cp ON f.FK_CodePostal = cp.PK_CodePostal
    inner join LienArbresFournisseurs laf ON f.PK_Fournisseur = laf.FK_Fournisseurs
    inner join Arbre a on laf.FK_Arbre = a.PK_Arbre
where (a.NomArbre like 'Pins')
Order by cp.CodePostal;




SELECT
	f.Nom,
    f.Prenom,
    SUM(laf.prix *1.21*laf.Nb) as 'Total stock' 
from Fournisseurs f
    inner join LienArbresFournisseurs laf on laf.FK_Fournisseurs = f.PK_Fournisseur
group by f.Nom, f.Prenom;


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
