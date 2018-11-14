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

  case (gets.chomp)
  when 'Y'.downcase
    User.find_or_create_by(name: $name, username: $username)
  when 'N'.downcase
    get_name
    get_username
  else
    puts "sorry"
    get_name
    get_username
  end

end
