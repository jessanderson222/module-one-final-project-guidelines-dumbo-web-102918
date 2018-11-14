#write methods here

def welcome
  puts "Hello!"
  pp User.all
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

def username_name
  puts "Hi, #{$name}, username: #{$username}"
end

def create_new_or_not
  puts "Is this correct ? (Y/N)"

  case (gets.chomp.downcase)
  when 'y'
    User.find_or_create_by(name: $name, username: $username)
  when 'n'
    get_name
    get_username
  else
    puts "sorry"
    get_name
    get_username
  end
end


def add_recipe
  puts "What is the name of the recipe?"
  $recipe_name = gets.chomp
end

def add_ingredients
  puts "For this recipe: #{$recipe_name}, what are the ingredients? (seperate each ingredient with a comma)"

  $ingredient_string = gets.chomp
end

def changes_ingredients_to_array
   $ingredient_array = $ingredient_string.split(/,\s?/).uniq
  puts $ingredient_array
end

def saves_ingredient
  $ingredient_array.each do |ingredient|
    Ingredient.find_or_create_by(name: ingredient)
  end
end

def saves_recipe
    Recipe.create(name: $recipe_name)
end

def get_id_for_ingredient
  $array = $ingredient_array.map do |ingredient|
    Ingredient.find_by name: ingredient
  end
  puts $array
end
