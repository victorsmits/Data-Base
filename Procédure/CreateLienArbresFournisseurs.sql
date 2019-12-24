CREATE PROCEDURE `CreateLienArbreFournisseur` (PK_Arbre int(11), PK_Fournisseur int(11), prix int(11), nb int(11))
BEGIN
insert into LienArbresFournisseurs(FK_Arbre,FK_Fournisseurs,Prix,Nb) 
values(PK_Arbre,PK_Fournisseurs,prix,nb);
Select
PK_LienArbresFournisseurs
From
LienArbresFournisseurs
where
LienArbresFournisseurs.FK_Arbre = PK_Arbre and LienArbresFournisseurs.FK_Fournisseurs = PK_Fournisseur;
END
