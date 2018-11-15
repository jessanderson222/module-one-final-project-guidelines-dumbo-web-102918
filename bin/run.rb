require_relative '../config/environment'
require_relative './helpers.rb'

welcome


#menu prompt objects
prompt = TTY::Prompt.new(active_color: :cyan)
prompt2 = TTY::Prompt.new(active_color: :cyan)
login_prompt = TTY::Prompt.new(active_color: :green)

user = login_prompt.select("Hello! Are you a new user or current user?", %w(New Current))

if user == "New"
  new_user
elsif user == "Current"
  current_user
end


#Menu with recipes
choices = %w(Search Update Create View Exit)
option = prompt.select("Hi! What would you like to do with your recipes?", choices)

if option == "Search"
  search_recipe
elsif option == "Update"
  User.update_recipe
elsif option == "Create"
  adding_recipes
elsif option == "View"
  user2 = prompt2.select("What would you like view?", %w(Recipes Ingredients))
elsif option[0] == "Exit"
  exit
end

#Viewing lists prompts
if user2 == "Recipes"
  User.viewing_all_recipes_of_user
elsif user2 == "Ingredients"
  User.viewing_all_ingredients_of_user
end
