--This establishes the Cookbook Database and adds tables for 2 recipes to start
USE master;
GO

IF	DB_ID('Cookbook') IS NOT NULL
BEGIN
	ALTER DATABASE Cookbook SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Cookbook;
END;
GO

CREATE DATABASE Cookbook;
GO

USE Cookbook;
GO

BEGIN TRANSACTION;
GO




CREATE TABLE Recipes
(
	Recipe_name		VARCHAR(100) 	NOT NULL
		PRIMARY KEY,
	Servings		INT				NOT NULL, 
	Drink_Pairing	VARCHAR(50)
);


INSERT INTO Recipes (Recipe_Name, Servings, Drink_Pairing)
VALUES
('Ancho Fish Tacos', 2, 'Cadillac Margarita'),
('Cadillac Margarita', 1,  NULL);

CREATE TABLE Ingredients
(
	Ingredient		VARCHAR(50)		NOT NULL,
	Quantity		VARCHAR(50)		NOT NULL,
	Recipe			VARCHAR(100)			, 
	Step_number		INT						,
	Substitutes		VARCHAR(50)				,
	PRIMARY KEY (Ingredient, Recipe, Step_number)
);

INSERT INTO Ingredients (Ingredient, Quantity, Recipe, Step_number, Substitutes)
VALUES
('Yellow Onion', '1 small-medium sized', 'Ancho Fish Tacos', 1, NULL), 
('Red Wine Vinegar', 'As needed', 'Ancho Fish Tacos', 1, NULL),
('Olive Oil', '1/4 Cup', 'Ancho Fish Tacos', 2, 'Vegetable Oil'), 
('Ancho Chili (ground)', '1.5 tsp', 'Ancho Fish Tacos', 2, 'Chipotle Chili Powder, Chili Powder'),
('Oregano', '1.5 tsp', 'Ancho Fish Tacos', 2, NULL), 
('Cumin', '1/2 tsp', 'Ancho Fish Tacos', 2, NULL), 
('Cilantro (fresh, chopped)', '2-3 tbsp', 'Ancho Fish Tacos', 2, '1 tsp dry Coriander'), 
('Red Wine Vinegar', 'As needed', 'Ancho Fish Tacos', 3, NULL),
('White Fish (tilapia, catfish, cod, mahi mahi)', '2-3 fillets', 'Ancho Fish Tacos', 4, 'Any white fish'),
('Salt', 'As needed', 'Ancho Fish Tacos', 4, NULL),
('Corn Tortillas, Soft', '6-10 small tortillas', 'Ancho Fish Tacos', 6, 'Other tortillas, may substitute as burrito'),
('Sour Cream', 'As preferred', 'Ancho Fish Tacos', 7, NULL), 
('Lime (juice)', '1 slice per taco', 'Ancho Fish Tacos', 7, 'Lemon'),
('Cilantro (fresh, chopped)', 'As preferred', 'Ancho Fish Tacos', 7, NULL), 
('Reposado Tequila', '1.5 oz', 'Cadillac Margarita', 2, 'Any good tequila'), 
('Cointreau', '1 oz', 'Cadillac Margarita', 2, 'Triple Sec'), 
('Gran Marnier', '1 oz', 'Cadillac Margarita', 3, NULL), 
('Lime Juice (fresh)', '1 oz', 'Cadillac Margarita', 2, 'Lemon Juice (fresh)'), 
('Ice', 'As needed', 'Cadillac Margarita', 2, NULL), 
('Lime', '1 wedge', 'Cadillac Margarita', 1, 'Lemon'), 
('Kosher Salt', 'As needed', 'Cadillac Margarita', 1, 'Flaky Salt, Sea Salt, NOT iodized salt')
;




CREATE TABLE Steps
(
	Recipe			VARCHAR(100)	NOT NULL,
	Step_Number		INT				NOT NULL,
	Instruction		VARCHAR(500)	NOT NULL,
	PRIMARY KEY (Recipe, Step_Number)
);


INSERT INTO Steps (Recipe, Step_Number, Instruction)
VALUES
('Cadillac Margarita', 1, 'Slice lime into wedges, rub a wedge around the rim of the glass. Dip the edge of the rim into a plate of salt.'),
('Cadillac Margarita', 2, 'Fill mixing glass with ice; add Tequila, Lime Juice, Cointreau. Stir until cold.'),
('Cadillac Margarita', 3, 'Pour into salted glass. Carefully pour Gran Marnier over inverted spoon at the top of the drink.'),
('Ancho Fish Tacos', 1, 'Marinate Onions - Slice onion and place in plastic bag, add red wine vinegar to cover. Set aside for 30+ minutes'), 
('Ancho Fish Tacos', 2, 'Marinate Fish - Add olive oil to bowl with ancho chili powder, cumin, oregano, and chopped cilantro. Place fish in plastic bag, add the mix. Marinate in refrigerator for 30+ minutes. Both marinades can go overnight.'), 
('Ancho Fish Tacos', 3, 'Cook Onions - Heat frying pan over medium-high heat. Add marinating onions with red with vinegar. Fry onions until soft, adding more red wine vinegar or water so onions do not burn. Reduce liquid when onions are soft. Set oinions aside.'), 
('Ancho Fish Tacos', 4, 'Cook Fish - Heat cast-iron or non-stick pan over medium high heat. Remove fish from marinade and place directly on hot pan. Season with salt, cook 4 minutes. Flip and cook 2 more minutes'), 
('Ancho Fish Tacos', 5, 'Remove pan from heat, flake fish with a fork, add remaining marinade from bag or bowl; mix in the hot pan, set aside.'),
('Ancho Fish Tacos', 6, 'Heat tortillas on a clean/dry pan or skillet. Flip with bottom starts browning. Keep tortillas warm after removing by covering with foil.'),
('Ancho Fish Tacos', 7, 'Assemble tacos - add fish to the tortilla, squeeze lime wedge over fish, top with onions, then add sour cream and cilantro'),
('Ancho Fish Tacos', 8, 'Optional Suggestions: Avocado slices, Cotija cheese (or feta crumbles), salsa, hot sauce!');





COMMIT TRANSACTION;
