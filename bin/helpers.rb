
#write methods here

def welcome
  # font = TTY::Font.new(:standard)
  # font2 = TTY::Font.new(:straight)
  # pastel = Pastel.new
  # pastel2 = Pastel.new
  # puts pastel2.green(font2.write("Welcome to the"))
  # puts pastel.yellow(font.write("Book of Food!"))
  # pp User.all.map {|user| user.username}
end

def get_name
  puts "What's your name?"
  $name = gets.chomp
  puts "hi #{$name}"
end

def get_username
  puts "What is your username?"
  $username = gets.chomp
end

# def find_current_user
#   User.find_or_create_by(username: $username)
# end

def user_sign_in
  user = User.find_or_create_by(username: $username)
  user
end

def username_name
  puts "Hi, #{$name}, username: #{$username}"
end

def welcome_user
  puts "Welcome back, #{user_sign_in.name}"
end

def search_recipe
  puts "what ingredient do you havee?"
  ingredient2 = gets.chomp.downcase
  array =  Ingredient.find_by(name: ingredient2).recipes
  reciarray = array.map {|recipe| recipe.name}
  puts reciarray
end
def adding_recipes #creates recipes with ingredient;stores them
  Recipe.add_recipe
  Ingredient.add_ingredients
  Ingredient.changes_ingredients_to_array
  Ingredient.saves_ingredient
  Recipe.saves_recipe
  Recipe.add_ingredients_to_recipe
  User.add_recipe_to_user
end

def methods #methods that are not used yet
User.saves_ingredient_to_user
end

def new_user
  get_name
  get_username
  username_name
  $current = user_sign_in
  # User.create_new_or_not
end

def returning_user
  get_username
  $current = user_sign_in
  # find_current_user #user.create_new_or_not
  welcome_user
end
