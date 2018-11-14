
#write methods here

def welcome
  puts "Welcome to your Recipe Book!"
  pp User.all.map {|user| user.username}
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

def get_id
  puts "what ingredient do you have?"
  ingredient = gets.chomp
  var = Ingredient.find_by(name: ingredient)
  var2 = var.id

  array = IngredientRecipe.all.where(ingredient_id: var2)

  array2 = array.map {|ir| ir.recipe_id}
  array2.map {|id| Recipe.find(id) }
end
