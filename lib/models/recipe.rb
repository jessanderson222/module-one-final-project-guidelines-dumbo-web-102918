class Recipe <ActiveRecord::Base
  has_many :user_recipes
  has_many :users, through: :user_recipes
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes

  def add_recipe
    puts "What is the name of the recipe?"
    $recipe_name = gets.chomp
  end

  def saves_recipe
      Recipe.create(name: $recipe_name)
  end

  def add_ingredients_to_recipe
    $ingredient_array.each do |ingredient|
      Recipe.self.ingredients << Ingredient.find_by(name: ingredient)
    end

  end



end
