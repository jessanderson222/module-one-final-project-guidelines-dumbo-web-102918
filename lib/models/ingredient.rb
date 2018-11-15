

class Ingredient <ActiveRecord::Base
  has_many :user_ingredients
  has_many :users, through: :user_ingredients
  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes

  def self.add_ingredients
    puts "For this recipe: #{$recipe_name}, what are the ingredients? (seperate each ingredient with a comma)"

    $ingredient_string = gets.chomp
  end

  def self.changes_ingredients_to_array
     $ingredient_array = $ingredient_string.split(/,\s?/).uniq
    puts $ingredient_array
  end

  def self.saves_ingredient
    $ingredient_array.each do |ingredient|
      self.find_or_create_by(name: ingredient)
    end
    puts "saved!"
  end

  def self.create_ingredients
    self.add_ingredients
    self.changes_ingredients_to_array
    self.saves_ingredient
  end

end
