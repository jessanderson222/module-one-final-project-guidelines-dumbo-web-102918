class Ingredient <ActiveRecord::Base
  has_many :user_ingredients
  has_many :users, through: :user_ingredients
  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes

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
      self.find_or_create_by(name: ingredient)
    end
  end

end
