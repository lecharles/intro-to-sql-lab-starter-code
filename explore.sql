-- Exploration scratchpad for the Carmen Sandiego SQL lab.
-- Records the queries used to learn the schema and build each clue answer.

-- Peek at table shapes before writing any queries.
SELECT * FROM cities LIMIT 5;
SELECT * FROM countrylanguages LIMIT 5;
SELECT * FROM countries LIMIT 5;

-- One-row shape checks per table.
SELECT * FROM countries LIMIT 1;
SELECT * FROM cities LIMIT 1;
SELECT * FROM countrylanguages LIMIT 1;

-- Countries joined to cities on the shared country code.
SELECT * FROM countries JOIN cities ON cities.countrycode = countries.code LIMIT 1;
SELECT * FROM countries JOIN cities ON cities.countrycode = countries.code WHERE cities.name = 'Kabul';

-- Countries joined to countrylanguages. Language lives only in this table.
SELECT * FROM countries JOIN countrylanguages ON countrylanguages.countrycode = countries.code LIMIT 1;
SELECT countries.name, countrylanguages.language, countrylanguages.isofficial FROM countries JOIN countrylanguages ON countrylanguages.countrycode = countries.code WHERE countries.name = 'Afghanistan';
SELECT countries.name, countrylanguages.language FROM countries JOIN countrylanguages ON countrylanguages.countrycode = countries.code WHERE countries.name = 'Aruba';

-- Every country where Italian is spoken, with percentage and population.
SELECT countries.name, countrylanguages.language, countrylanguages.percentage FROM countries JOIN countrylanguages ON countrylanguages.countrycode = countries.code WHERE countrylanguages.language = 'Italian';
SELECT countries.name, countrylanguages.language, countries.population FROM countries JOIN countrylanguages ON countrylanguages.countrycode = countries.code WHERE countrylanguages.language = 'Italian' ORDER BY countries.population ASC;

-- Random sampler to spot check the join shape.
SELECT * FROM countries JOIN cities ON cities.countrycode = countries.code ORDER BY RANDOM() LIMIT 1;

-- Cities in San Marino.
SELECT cities.name, countries.name FROM countries JOIN cities ON cities.countrycode = countries.code WHERE countries.name = 'San Marino';

-- Pattern search with LIKE, scoped to South America.
SELECT cities.name AS city, countries.name AS country FROM countries JOIN cities ON cities.countrycode = countries.code WHERE countries.continent = 'South America' AND cities.name LIKE 'Serra%';

-- Three table join showing all columns from each source.
SELECT countries.code, countries.name, countries.capital, cities.id, cities.name, cities.countrycode, countries.continent, countries.region, countrylanguages.language, countries.population FROM countries JOIN cities ON cities.countrycode = countries.code JOIN countrylanguages ON countrylanguages.countrycode = countries.code WHERE countries.continent = 'South America' AND cities.name LIKE 'Serra%';

-- Capital lookup. Join cities on the capital id instead of the country code.
SELECT countries.name, cities.name, cities.id, countries.capital FROM countries JOIN cities ON cities.id = countries.capital WHERE countries.name = 'Brazil';
SELECT * FROM cities WHERE id = 211;

-- Population lookup for the final riddle.
SELECT * FROM cities WHERE population = 91084;