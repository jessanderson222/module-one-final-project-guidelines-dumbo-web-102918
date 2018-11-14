
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
  puts "what ingredient do you havee?"
  ingredient2 = gets.chomp.downcase
  array =  Ingredient.find_by(name: ingredient2).recipes
  reciarray = array.map {|recipe| recipe.name}
  puts reciarray
end
