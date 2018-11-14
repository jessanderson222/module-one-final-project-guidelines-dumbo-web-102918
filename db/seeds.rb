recipe_string = RestClient.get('http://www.recipepuppy.com/api')
recipe_hash = JSON.parse(recipe_string)

puts recipe_hash["results"][0]

recipe_name = recipe_hash["results"].map do |recipe|
  recipe["title"]
end

recipe_name.each do |recipe|
  Recipe.create(name: recipe.downcase)
end

ingredients = recipe_hash["results"].map do |recipe|
  recipe["ingredients"]
end

ingredient_string = ingredients.join(",")

new_ingredient = ingredient_string.split(/,\s?/).uniq

new_ingredient.each do |ingredient|
  Ingredient.create(name: ingredient)
end

recipe_ingredients = []

recipe_hash["results"].each do |recipe|
  recipe_ingredients << recipe["title"]
  recipe_ingredients << recipe["ingredients"]
end

first_ingre = recipe_hash["results"].first["ingredients"]

first_array = first_ingre.split(/,\s?/)

first_array.each do |string|
  string.find_or_create_by(name: string)
end

binding.pry
