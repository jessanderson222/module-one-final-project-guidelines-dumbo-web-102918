class User <ActiveRecord::Base
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  has_many :user_recipes
  has_many :recipes, through: :user_recipes

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
    # returns the user instance

  end

  def viewing_all_ingredients_of_user
    self.ingredients
  end

# binding.pry

end
