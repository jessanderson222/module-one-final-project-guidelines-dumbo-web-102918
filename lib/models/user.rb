
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
    self.find_by(name: $name).ingredients
  end

  def viewing_all_recipes_of_user
    self.find_by(name: $name).recipes
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

  def self.add_recipe_to_user
      User.find_by(name: $name).recipes << Recipe.find_by(name: $recipe_name)
      puts "success!"
  end

  def self.saves_ingredient_to_user
    puts "Which ingredients do you have? (seperate ingredients with a comma)"
    $ingredients = gets.chomp

    $ingredient_array2 = $ingredients.split(/,\s?/).uniq
    $ingredient_array2.each do |ingredient|
      self.find_by(name: $name).ingredients << Ingredient.find_or_create_by(name: ingredient)
    end

    puts "done!"
  end



end
