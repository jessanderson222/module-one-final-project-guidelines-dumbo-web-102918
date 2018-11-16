require_relative '../config/environment'
require_relative './helpers.rb'

system "clear"
api_data

bar = TTY::ProgressBar.new("downloading [:bar]", total: 30)
bar.resize(70)
30.times do
  sleep(0.1)
  bar.advance(1)
end

welcome
#menu prompt objects
prompt = TTY::Prompt.new(active_color: :cyan)
prompt2 = TTY::Prompt.new(active_color: :cyan)
login_prompt = TTY::Prompt.new(active_color: :bright_cyan)

user = login_prompt.select("Hello! Are you a new user or current user?", %w(New Current Exit))
  if user == "New"
    new_user
  elsif user == "Current"
    returning_user
  elsif user == "Exit"
    exit
  end

current = nil
while (current = $current)
  #menu
  option = prompt.select("Hi #{$name}! What would you like to do?") do |menu|
    menu.choice 'Search a recipe', 1
    menu.choice 'Update Recipes', 2
    menu.choice 'Create Recipes', 3
    menu.choice 'Add Ingredients to your Inventory', 4
    menu.choice 'View your Recipes and Ingredients', 5
    menu.choice 'View all Recipes', 6
    menu.choice 'View all Ingredients', 7
    menu.choice 'Exit', 8
  end

  case option
    when 1
      search_recipe
    when 2
      current.update_recipe
    when 3
      adding_recipes
    when 4
      current.adding_ingredients_to_user
    when 5
      user2 = prompt2.select("What would you like view?", %w(Recipes Ingredients Exit))
    when 6
      puts Recipe.all.pluck(:name)
    when 7
      puts Ingredient.all.pluck(:name)
    when 8
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
