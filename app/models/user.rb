class User <ActiveRecord::Base
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  has_many :user_recipes
  has_many :recipes, through: :user_recipes

end 
