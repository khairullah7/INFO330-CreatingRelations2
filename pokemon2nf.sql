	WITH split(pokedex_number, abilities, ability2) AS (
	SELECT pokedex_number, '' AS abilities, abilities|| ',' AS ability2
	FROM imported_pokemon_data
	UNION ALL
		SELECT pokedex_number,
			substr(ability2, 0, instr(ability2, ',')) AS abilities,
			substr(ability2, instr(ability2, ',')+1) AS ability2
		FROM split
		WHERE ability2 !=''
	)
	SELECT pokedex_number, abilities
	FROM split
	WHERE abilities !=''
	ORDER BY pokedex_number;

	CREATE TABLE IF NOT EXISTS pokemon2NF1 AS
	SELECT pokedex_number, name
	FROM imported_pokemon_data;

	CREATE TABLE IF NOT EXISTS pokemon2NF2 AS
	SELECT pokedex_number, abilities, classfication
	FROM imported_pokemon_data;

	SELECT * FROM pokemon2NF1;
	SELECT * FROM pokemon2NF2;
