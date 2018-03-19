This project is a w.i.p for a recipe app that people can share and connect with others who have eyes and stomachs equal in size. It will take from a recipe API allowing clients to browse different types of recipes and save their favorites to their account. Those who have not signed up can do a general browse of the site but will be prompted to create an account if they wish to have access to further foody goodness. 

In the About the Developer section there will also be a section where the visiter can play two games: tic tac toe using Gosu as a gaming interface and a racing game. 

user < - > recipe  (many to many)
user < friendship > friend  (many to many thru friendship)
user
-------
id
first_name
last_name
email
password


recipe
--------
id 
name
cuisine_type
ingredients = array
instructions
user_id



friend
--------
id
first_name
last_name


friendship
----------
id
user_id
friend_id
