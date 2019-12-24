Use Tree;
start Transaction;
	Select
		*
	from
		`Select all`
	where
		FK_Arbre = (
			select
				PK_Arbre
			from
				Arbre
			where NomArbre = 'Pins');

update LienArbresFournisseurs
	set Prix = Prix *1.10
    where FK_Arbre = (
			select
				PK_Arbre
			from
				Arbre
			where NomArbre = 'Pins');
	rollback;
    commit;