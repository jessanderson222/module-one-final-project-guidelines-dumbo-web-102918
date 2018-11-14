
class UserRecipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  # def user_saves_recipe
  #   User.self.recipes << Recipe.last
  # end
end
