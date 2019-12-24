use Tree;

#Totaux de stocks par vendeurs (prix TVAC * quantité)

SELECT
	f.Nom,
    f.Prenom,
    SUM(laf.prix *1.21*laf.Nb) as 'Total stock' 
from Fournisseurs f
    inner join LienArbresFournisseurs laf on laf.FK_Fournisseurs = f.PK_Fournisseur
group by f.Nom, f.Prenom;