require_relative '../config/environment'
require_relative './helpers.rb'

welcome


#menu prompt objects
prompt = TTY::Prompt.new(active_color: :cyan)
prompt2 = TTY::Prompt.new(active_color: :cyan)
login_prompt = TTY::Prompt.new(active_color: :bright_cyan)

user = login_prompt.select("Hello! Are you a new user or current user?", %w(New Current))
if user == "New"
  new_user
elsif user == "Current"
  returning_user
end

current = nil

while (current = $current)
  #Menu with recipes
  choices = %w(Search Update Create View Exit)
  option = prompt.select("Hi! What would you like to do with your recipes?", choices)

  if option == "Search"
    search_recipe
  elsif option == "Update"
    current.update_recipe
  elsif option == "Create"
    adding_recipes
  elsif option == "View"
    user2 = prompt2.select("What would you like view?", %w(Recipes Ingredients Exit))
  elsif option == "Exit"
    exit
    current = nil
  end

  #Viewing lists prompts
  if user2 == "Recipes"
    current.viewing_all_recipes_of_user
  elsif user2 == "Ingredients"
    current.viewing_all_ingredients_of_user
  end
end
