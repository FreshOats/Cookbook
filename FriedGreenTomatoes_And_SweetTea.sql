INSERT INTO Recipes (Recipe_Name, Servings, Drink_Pairing)
VALUES
('California-Georgia Fusion Gluten-Free Fried Green Tomatoes with Cashew-Serrano Relish', 2, 'Sweet Tea'),
('Sweet Tea', 4, NULL);

INSERT INTO Ingredients (Ingredient, Quantity, Recipe, Step_number, Substitutes)
VALUES
('Luzianne Cup Sized Iced Tea Bag/Family Sized Tea Bag', '4 bags/1 bag', 'Sweet Tea', 1, 'Black Tea - 4 bags'),
('Water', '1 quart', 'Sweet Tea', 1, NULL),
('Sugar', '1/4 cup', 'Sweet Tea', 2, 'It aint sweet tea if you dont use sugar!'), 
('Lemon', 'A few slices', 'Sweet Tea', 3, 'Orange wedges, mint sprigs'); 

INSERT INTO Steps (Recipe, Step_Number, Instruction)
VALUES
('Sweet Tea', 1, 'Boil 2 cups of water. Add tea bags to the water, steep for 3-5 minutes; remove tea bags.'),
('Sweet Tea', 2, 'Add sugar to the hot tea, stir to dissolve. Add the concentrate to the remaining 2 cups of COLD water'),
('Sweet Tea', 3, 'Pour over a glass full of ice. Garnish with lemons or not, your choice.'); 