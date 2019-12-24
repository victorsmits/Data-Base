USE Tree;

SELECT 
    *
FROM
    Arbre a
        INNER JOIN
    LienArbresFournisseurs laf ON a.PK_Arbre = laf.FK_Arbre;