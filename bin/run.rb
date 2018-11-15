require_relative '../config/environment'
require_relative './helpers.rb'

welcome

def adding_recipes #creates recipes with ingredient;stores them
  Recipe.add_recipe
  Ingredient.add_ingredients
  Ingredient.changes_ingredients_to_array
  Ingredient.saves_ingredient
  Recipe.saves_recipe
  Recipe.add_ingredients_to_recipe
end

def methods #methods that are not used yet
User.add_recipe_to_user
User.saves_ingredient_to_user
search_recipe
end

def user_signin #methods with users
  puts "HELLO WORLD"
  get_name
  get_username
  username_name
  $username = User.create_new_or_not
end

#menu prompt objects
prompt = TTY::Prompt.new(active_color: :cyan)
prompt2 = TTY::Prompt.new(active_color: :cyan)

#Menu with recipes
choices = %w(Search Update Create View Exit)
user = prompt.select("Hi! What would you like to do with your recipes?", choices)

if user == "Search"
  search_recipe
elsif user == "Update"
  User.update_recipe
elsif user == "Create"
  adding_recipes
elsif user == "View"
  user2 = prompt2.select("What would you like view?", %w(Recipes Ingredients))
elsif user[0] == "Exit"
  exit
end

#Viewing lists prompts
if user2 == "Recipes"
  viewing_all_recipes_of_user
elsif user2 == "Ingredients"
  viewing_all_ingredients_of_user
end
