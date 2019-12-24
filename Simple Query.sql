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

select
	a.NomArbre,
	f.Nom,
    f.Prenom,
	laf.Prix as 'Prix HTVA',
    laf.Prix*1.21 as 'Prix TVAC'
from
	Fournisseurs f
	inner join LienArbresFournisseurs laf on laf.FK_Fournisseurs = f.PK_Fournisseur
	inner join Arbre a on laf.FK_Arbre = a.PK_Arbre
where (a.NomArbre like 'Chênes')
