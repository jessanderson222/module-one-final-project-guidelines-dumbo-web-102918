
#write methods here


def welcome #displays a ascii title
  #random fonts for the welcome screen
  font = TTY::Font.new(:standard)
  font2 = TTY::Font.new(:straight)
  pastel = Pastel.new
  pastel2 = Pastel.new
  puts pastel2.green(font2.write("Welcome to the"))
  puts pastel.yellow(font.write("Book of Food!"))

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
    puts "what ingredient do you have?"
    ingredient2 = gets.chomp.downcase
  if Ingredient.find_by(name: ingredient2) != nil
    array =  Ingredient.find_by(name: ingredient2).recipes
    reciarray = array.map {|recipe| recipe.name}
    puts reciarray
  else
    puts "There are no recipes with that ingredient. Would you like to add one? Y/N"
    input =  gets.chomp.downcase
    if input == "y"
      adding_recipes
      Recipe.all.reload
    else
      "Okay"
    end
  end
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

def new_user #creates new user and saves in user_sign_in method
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

def api_data #saves recipe info to Recipe & Ingredient table from API
  array = []
  array2 = []
  for num in 1..5
    recipe_string = RestClient.get("http://www.recipepuppy.com/api/?p=#{num}")
    recipe_hash = JSON.parse(recipe_string)
    array << recipe_hash["results"]
    array[0..-1][0..-1].each do |item|
      array2 << item
    end
  end
    new_array = array2.flatten

    new_array[0..-1].each do |recipe| #saves recipe names
      Recipe.find_or_create_by(name: recipe["title"])
    end

    #getting string of ingredients from api hash
    ingredients = new_array[0..-1].map do |recipe|
      recipe["ingredients"]
    end

    #turns string into array
    ingredient_array = ingredients.join.split(/,\s?/).uniq

    #saves ingredients from array
    ingredient_array.each do |ingredient|
      Ingredient.find_or_create_by(name: ingredient)
    end


    #attempting to shovel ingredients string to recipe individually

    # new_array[0..-1].each do |recipe|
    #   Recipe.find_by(name: recipe["title"]).ingredients << Ingredient.find_by(name: recipe["ingredients"].split(/,\s?/))
    # end



end
