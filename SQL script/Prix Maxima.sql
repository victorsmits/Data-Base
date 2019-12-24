use Tree;

#Prix maxima, minima, prix moyens, nombre de vendeur par espèce

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
