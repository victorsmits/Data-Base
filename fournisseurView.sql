CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `fournisseurview` AS
    SELECT 
        `fournisseurs`.`PK_Fournisseur` AS `PK_Fournisseur`,
        `fournisseurs`.`Nom` AS `Nom`,
        `fournisseurs`.`Prenom` AS `Prenom`,
        `fournisseurs`.`Rue` AS `Rue`,
        `fournisseurs`.`FK_CodePostal` AS `FK_CodePostal`,
        `fournisseurs`.`Cpays` AS `Cpays`,
        GETNAMEPAYS(`fournisseurs`.`Cpays`) AS `getNamePays(Fournisseurs.Cpays)`
    FROM
        `fournisseurs`