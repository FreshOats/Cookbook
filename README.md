# Cookbook
This is the repo that goes along with the Medium posts for 

[Justin Papreck](https://medium.com/@justin.papreck)

The first post is
[SELECT recipe FROM website WHERE blog IS NULL](https://medium.com/@justin.papreck/select-recipe-from-website-where-blog-is-null-9b1ac6bd1b5)

This project establishes a database using MS SQL SERVER and subsequently queries different parameters from the website. Each recipe will include the recipe, ingredients, steps, drink pairing, and music pairing. With the music, due to the multiple parameters, the database contains a reference Band table, then an Album table with Band, Album, and Recipe pairing information, and then a separate table for the album tracks. 

![Cookbook_Schema](https://user-images.githubusercontent.com/33167541/214711010-ff7f6244-611c-4863-9dba-ef9529f8c107.png)

The first recipe is for Ancho Fish Tacos paired with a Cadillac Margarita with Gipsy Kings for listening. 


![Taco_Ingredients](https://user-images.githubusercontent.com/33167541/214711174-f767a790-4962-497f-8ee2-f43cf200388d.png)
![Taco_Instructions](https://user-images.githubusercontent.com/33167541/214711181-aadfa196-05c8-4ce3-a0ac-6e2284464634.png)
![Cadillac_Ingredients](https://user-images.githubusercontent.com/33167541/214711210-c8b58836-21a0-45fc-8cea-9d93197348fd.png)
![Cadillac_Instructions](https://user-images.githubusercontent.com/33167541/214711216-b1d21703-7c90-4b16-8535-c08c483afe0e.png)

As the posts continue, the blogs will increase in complexity as there will be more information to gather, group, and sort using Window Functions and Common Table Expressions (WITH clauses). 
