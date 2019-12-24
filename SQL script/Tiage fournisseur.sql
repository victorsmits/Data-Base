use Tree;

#Vendeurs de pins triés par code postal

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