
class Recipe <ActiveRecord::Base
  has_many :user_recipes
  has_many :users, through: :user_recipes
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes

  def self.add_recipe
    puts "What is the name of the recipe?"
    $recipe_name = gets.chomp
  end

  def self.saves_recipe
      Recipe.create(name: $recipe_name)
      puts "saved!"
  end

  def self.add_ingredients_to_recipe
    $ingredient_array.each do |ingredient|
      self.find_by(name: $recipe_name).ingredients << Ingredient.find_by(name: ingredient)
    end

  end



end
