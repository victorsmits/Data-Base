CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `select all` AS
    SELECT 
        `arbre`.`PK_Arbre` AS `PK_Arbre`,
        `arbre`.`NomArbre` AS `NomArbre`,
        `codepostal`.`PK_CodePostal` AS `PK_CodePostal`,
        `codepostal`.`CodePostal` AS `CodePostal`,
        `codepostal`.`Commune` AS `Commune`,
        `fournisseurs`.`PK_Fournisseur` AS `PK_Fournisseur`,
        `fournisseurs`.`Nom` AS `Nom`,
        `fournisseurs`.`Prenom` AS `Prenom`,
        `fournisseurs`.`Rue` AS `Rue`,
        `fournisseurs`.`FK_CodePostal` AS `FK_CodePostal`,
        `fournisseurs`.`Cpays` AS `Cpays`,
        `lienarbresfournisseurs`.`PK_LienArbreFournisseurs` AS `PK_LienArbreFournisseurs`,
        `lienarbresfournisseurs`.`FK_Arbre` AS `FK_Arbre`,
        `lienarbresfournisseurs`.`FK_Fournisseurs` AS `FK_Fournisseurs`,
        `lienarbresfournisseurs`.`Prix` AS `Prix`,
        `lienarbresfournisseurs`.`Nb` AS `Nb`,
        `pays`.`PK_Pays` AS `PK_Pays`,
        `pays`.`NomPays` AS `NomPays`
    FROM
        ((((`arbre`
        JOIN `codepostal`)
        JOIN `fournisseurs`)
        JOIN `lienarbresfournisseurs`)
        JOIN `pays`)