require_relative '../config/environment'
require_relative './helpers.rb'

welcome
puts "HELLO WORLD"
get_name
get_username
username_name
$username = User.create_new_or_not
Recipe.add_recipe
Ingredient.add_ingredients
Ingredient.changes_ingredients_to_array
Ingredient.saves_ingredient
Recipe.saves_recipe
Recipe.add_ingredients_to_recipe
User.add_recipe_to_user
User.saves_ingredient_to_user
