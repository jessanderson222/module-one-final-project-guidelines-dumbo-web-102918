
class User <ActiveRecord::Base
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  has_many :user_recipes
  has_many :recipes, through: :user_recipes

  def self.create_new_or_not
    puts "Is this correct ? (Y/N)"

    case (gets.chomp.downcase)
    when 'y'
    user =  User.find_or_create_by(name: $name, username: $username)
    when 'n'
      get_name
      get_username
    else
      puts "sorry"
      get_name
      get_username
    end
    user 
    # returns the user instance

  end

  def viewing_all_ingredients_of_user
    self.ingredients
  end

  def update_ingredients
    puts "What ingredient do you want to update?"
    old_ingredient = gets.chomp

    puts "What is the new ingredient?"
    new_ingredient = gets.chomp

    self.ingredients.find_by(name: old_ingredient).update(name: new_ingredient)
  end

  def update_recipe
    puts "What recipe do you want to update?"
    old_recipe = gets.chomp

    puts "What is the new recipe name?"
    new_recipe = gets.chomp

    self.recipes.find_by(name: old_recipe).update(name: new_recipe)

    #add the update ingredients for recipe later
  end


# binding.pry

end
