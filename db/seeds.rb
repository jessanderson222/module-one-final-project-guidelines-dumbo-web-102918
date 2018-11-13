recipe_string = RestClient.get('http://www.recipepuppy.com/api')
recipe_hash = JSON.parse(recipe_string)

puts recipe_hash["results"][0]

recipe_name = recipe_hash["results"].map do |recipe|
  recipe["title"]
end

recipe_name.each do |recipe|
  Recipe.create(name: recipe)
end

ingredients = recipe_hash["results"].map do |recipe|
  recipe["ingredients"]
end

ingredient_string = ingredients.join(", ")

new_ingredient = ingredient_string.split(",").uniq

new_ingredient.each do |ingredient|
  Ingredient.create(name: ingredient)
end

#binding.pry
