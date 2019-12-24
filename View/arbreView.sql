CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `arbreview` AS
    SELECT 
        `arbre`.`PK_Arbre` AS `PK_Arbre`,
        `arbre`.`NomArbre` AS `NomArbre`,
        GETARBRE(`arbre`.`PK_Arbre`) AS `ListFournisseurs`
    FROM
        `arbre`