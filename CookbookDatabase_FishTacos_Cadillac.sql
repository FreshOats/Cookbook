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
	Quantity		FLOAT			NOT NULL,
	Units			VARCHAR(50)		NOT NULL,
	Recipe			VARCHAR(100)			, 
	Step_number		INT						,
	Substitutes		VARCHAR(50)				,
	PRIMARY KEY (Ingredient, Recipe, Step_number)
);

INSERT INTO Ingredients (Ingredient, Quantity, Units, Recipe, Step_number, Substitutes)
VALUES
('Yellow Onion', 1, 'small-medium sized', 'Ancho Fish Tacos', 1, NULL), 
('Red Wine Vinegar', 0.5, 'Cups + As needed', 'Ancho Fish Tacos', 1, NULL),
('Olive Oil', 0.25, 'Cup', 'Ancho Fish Tacos', 2, 'Vegetable Oil'), 
('Ancho Chili (ground)', 1.5,  'tsp', 'Ancho Fish Tacos', 2, 'Chipotle Chili Powder, Chili Powder'),
('Oregano', 1.5, 'tsp', 'Ancho Fish Tacos', 2, NULL), 
('Cumin', 0.5, 'tsp', 'Ancho Fish Tacos', 2, NULL), 
('Cilantro (fresh, chopped)', 3, 'tbsp', 'Ancho Fish Tacos', 2, 'tsp dry Coriander'), 
('Red Wine Vinegar', 0, 'as needed', 'Ancho Fish Tacos', 3, NULL),
('White Fish (tilapia, catfish, cod, mahi mahi)', 3, 'fillets', 'Ancho Fish Tacos', 4, 'Any white fish'),
('Salt', 0, 'As needed', 'Ancho Fish Tacos', 4, NULL),
('Corn Tortillas, Soft', 8, 'small tortillas', 'Ancho Fish Tacos', 6, 'Other tortillas, may substitute as burrito'),
('Sour Cream', 1, 'As preferred', 'Ancho Fish Tacos', 7, NULL), 
('Lime', 6, 'wedge', 'Ancho Fish Tacos', 7, 'Lemon'),
('Cilantro (fresh, chopped)', 0, 'As preferred', 'Ancho Fish Tacos', 7, NULL), 
('Reposado Tequila', 1.5, 'oz', 'Cadillac Margarita', 2, 'Any good tequila'), 
('Cointreau', 1, 'oz', 'Cadillac Margarita', 2, 'Triple Sec'), 
('Gran Marnier', 1, 'oz', 'Cadillac Margarita', 3, NULL), 
('Lime Juice (fresh)', 1, 'oz', 'Cadillac Margarita', 2, 'Lemon Juice (fresh)'), 
('Ice', 0, 'As needed', 'Cadillac Margarita', 2, NULL), 
('Lime', 1, 'wedge', 'Cadillac Margarita', 1, 'Lemon'), 
('Kosher Salt', 0, 'As needed', 'Cadillac Margarita', 1, 'Flaky Salt, Sea Salt, NOT iodized salt')
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




CREATE TABLE Album
(
	Album			VARCHAR(100)	NOT NULL, 
	Band			VARCHAR(50)		NOT NULL,
	Recipe_Pairing	VARCHAR(100) 	NOT NULL,
	Drink_Pairing	VARCHAR(50), 
	PRIMARY KEY (Album, Band)
);

INSERT INTO Album (Album, Band, Recipe_Pairing, Drink_Pairing)
VALUES
('Gipsy Kings', 'Gipsy Kings', 'Ancho Fish Tacos', 'Cadillac Margarita')
;


CREATE TABLE Album_Tracks
(
	Album			VARCHAR(100)	NOT NULL,
	Band			VARCHAR(50)		NOT NULL,
	Track			INT				NOT NULL,
	Title			VARCHAR(500)	NOT NULL,
	PRIMARY KEY (Album, Band, Track)
);


INSERT INTO Album_Tracks (Album, Band, Track, Title)
VALUES
('Gipsy Kings', 'Gipsy Kings', 1, 'Bamboleo'), 
('Gipsy Kings', 'Gipsy Kings', 2, 'Tu Quieres Volver'), 
('Gipsy Kings', 'Gipsy Kings', 3, 'Moorea'), 
('Gipsy Kings', 'Gipsy Kings', 4, 'Bem, Bem, Maria'), 
('Gipsy Kings', 'Gipsy Kings', 5, 'Un Amor'), 
('Gipsy Kings', 'Gipsy Kings', 6, 'Inspiration'), 
('Gipsy Kings', 'Gipsy Kings', 7, 'A Mi Manera'), 
('Gipsy Kings', 'Gipsy Kings', 8, 'Djobi, Djobi'), 
('Gipsy Kings', 'Gipsy Kings', 9, 'Faena'), 
('Gipsy Kings', 'Gipsy Kings', 10, 'Quiero Saber'), 
('Gipsy Kings', 'Gipsy Kings', 11, 'Amor, Amor'), 
('Gipsy Kings', 'Gipsy Kings', 12, 'Duende') 
;

COMMIT TRANSACTION






-- Basil Fried Rice Pairings

INSERT INTO Recipes (Recipe_Name, Servings, Drink_Pairing)
VALUES
('Basil Fried Rice', 2, 'Angostura Gin and Tonic'),
('Angostura Gin and Tonic', 1,  NULL);


INSERT INTO Ingredients (Ingredient, Quantity, Units, Recipe, Step_number, Substitutes)
VALUES
('Vegetable Oil', 0.25, 'Cup', 'Basil Fried Rice', 0, 'Canola Oil'),
('Sesame Oil', 2, 'Tsp', 'Basil Fried Rice', 0, NULL)
;

INSERT INTO Steps (Recipe, Step_Number, Instruction)
VALUES
('Angostura Gin and Tonic', 0, ''),
('Basil Fried Rice', 0, ''), 



INSERT INTO Album_Tracks (Album, Band, Track, Title)
VALUES
('Doom Side of the Moon', 'Doom Side of the Moon', 1, 'Speak to Me'),
('Doom Side of the Moon', 'Doom Side of the Moon', 2, 'Breathe (In The Air)'),
('Doom Side of the Moon', 'Doom Side of the Moon', 3, 'On the Run'),
('Doom Side of the Moon', 'Doom Side of the Moon', 4, 'Time'),
('Doom Side of the Moon', 'Doom Side of the Moon', 5, 'The Great Gig In The Sky'),
('Doom Side of the Moon', 'Doom Side of the Moon', 6, 'Money'),
('Doom Side of the Moon', 'Doom Side of the Moon', 7, 'Us And Them'),
('Doom Side of the Moon', 'Doom Side of the Moon', 8, 'Any Colour You Like'),
('Doom Side of the Moon', 'Doom Side of the Moon', 9, 'Brain Damage'),
('Doom Side of the Moon', 'Doom Side of the Moon', 10, 'Eclipse'),
('Encore EP', 'Doom Side of the Moon', 1, 'Have A Cigar'),
('Encore EP', 'Doom Side of the Moon', 2, 'Pigs (Three Different Ones)'),
('Encore EP', 'Doom Side of the Moon', 3, 'Wish You Were Here')
;




INSERT INTO Album (Album, Band, Recipe_Pairing, Drink_Pairing)
VALUES
('Doom Side of the Moon', 'Doom Side of the Moon', 'Basil Fried Rice', 'Angostura Gin and Tonic'),
('Encore EP', 'Doom Side of the Moon', 'Basil Fried Rice', 'Angostura Gin and Tonic');







COMMIT TRANSACTION;