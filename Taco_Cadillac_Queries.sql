SELECT	DISTINCT(Ingredient), MAX(Quantity), MAX(Units)
FROM	Ingredients
WHERE	Recipe = 'Ancho Fish Tacos'
GROUP BY Ingredient
ORDER BY Ingredient;

SELECT	Step_Number, Instruction
FROM	Steps
WHERE	Recipe = 'Ancho Fish Tacos'
ORDER BY Step_Number;

SELECT	Ingredient, Quantity, Units
FROM	Ingredients
WHERE	Recipe = 'Cadillac Margarita';

SELECT	Step_Number, Instruction
FROM	Steps
WHERE	Recipe = 'Cadillac Margarita'
ORDER BY Step_Number;


SELECT	S.Step_Number, I.Ingredient, S.Instruction
FROM	Steps S
		INNER JOIN 
		Ingredients I	ON S.Recipe = I.Recipe
						AND S.Step_number = I.Step_number
WHERE	S.Recipe = 'Ancho Fish Tacos';



--Query the ingredients needed to make the meal, ignoring the drink pairing
SELECT	DISTINCT(I.Ingredient), I.Substitutes
FROM	Ingredients I
		INNER JOIN 
		Recipes R ON R.Recipe_name = I.Recipe
WHERE	R.Drink_Pairing IS NOT NULL; -- Only Drink Recipes have a NULL drink pairing


--Determine the quantites for a larger group
SELECT	Recipe_name, Servings 
FROM	Recipes;


SELECT	Ingredient, MAX(Quantity)*4 AS Total_Needed, MAX(Units) AS Units
FROM	Ingredients
WHERE	Recipe = 'Ancho Fish Tacos'
GROUP BY Ingredient
UNION
SELECT	Ingredient, MAX(Quantity)*16 AS Total_Needed, MAX(Units) AS Units
FROM	Ingredients
WHERE	Recipe = 'Cadillac Margarita'
GROUP BY Ingredient
ORDER BY Ingredient 

