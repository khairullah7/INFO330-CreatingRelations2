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

	CREATE TABLE IF NOT EXISTS classification3nf AS
	SELECT classfication, experience_growth, height_m, hp, type1, type2, weight_kg, 
	generation, is_legendary, capture_rate
	FROM imported_pokemon_data;

	CREATE TABLE IF NOT EXISTS abilities3nf AS
	FOREIGN KEY(abilities) REFERENCES imported_pokemon_data(abilities)
	SELECT abilities, sp_attack, sp_defense, speed, defense
	FROM imported_pokemon_data;

	CREATE TABLE IF NOT EXISTS against3nf AS
	SELECT against_bug, against_dark, against_dragon, against_electric, against_fairy,
	against_fight, against_fire, agaisnt_flying, against_ghost,
    against_grass, against_ground, agaisnt_ice, against_normal,
	against_poison, against_psychic, agaisnt_rock, agaisnt_steel, agaisnt_water
	FROM imported_pokemon_data;

	CREATE TABLE IF NOT EXISTS bases3nf AS
	SELECT base_egg_steps, base_happiness, base_total
	FROM imported_pokemon_data;
