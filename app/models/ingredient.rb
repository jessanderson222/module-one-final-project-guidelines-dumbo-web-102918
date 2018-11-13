class Ingredient <ActiveRecord::Base
  has_many :user_ingredients
  has_many :users, through: :user_ingredients
  has_many :ingredient_recipes
  has_many :recipes, through: :ingredient_recipes

end
