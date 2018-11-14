
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
