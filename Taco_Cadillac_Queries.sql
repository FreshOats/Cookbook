SELECT	DISTINCT(Ingredient), MAX(Quantity) AS Quantity, MAX(Units) AS Units
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


--What music should we listen to? 
SELECT	*
FROM	Recipes AS R
		INNER JOIN 
		Band AS B ON B.Band = R.Band_Pairing

-- For the party planning committee, we need music, food and drinks
-- We're planning for 17 employees and Bob Vance of Vance Refrigeration
-- Will need about 40 drinks for Mexican Themed party
-- Angela will only permit 1 food, 1 cocktail (begrudgingly), and 1 CD
SELECT	A.Band, 
		A.Album, 
		T.Title, 
		A.Recipe_Pairing, 
		A.Drink_Pairing
FROM	Album AS A
		INNER JOIN 
		Album_Tracks T
			ON T.Band = A.Band 
			AND T.Album = A.Album
ORDER BY T.Track

-- How many servings does each recipe provide?
--Determine the quantites for a larger group
SELECT	Recipe_name, Servings 
FROM	Recipes;

-- To provide food for approximately 20 people, we will need to scale up the food x 10
-- To provide drinks, accounting for some people drinking 0 (Angela) and others more (Meredith), but trying to 
-- keep this as an In-Office party without sending people home drunk, 40 drinks so Recipe x 40
SELECT	Ingredient, MAX(Quantity)*10 AS Total_Needed, MAX(Units) AS Units
FROM	Ingredients
WHERE	Recipe = 'Ancho Fish Tacos'
GROUP BY Ingredient
UNION
SELECT	Ingredient, MAX(Quantity)*40 AS Total_Needed, MAX(Units) AS Units
FROM	Ingredients
WHERE	Recipe = 'Cadillac Margarita'
GROUP BY Ingredient
ORDER BY Ingredient 

-- 100 lime wedges will come from 17 limes
-- There are about 25 ounces in a 750mL bottle
