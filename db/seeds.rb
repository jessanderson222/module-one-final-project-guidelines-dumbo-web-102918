recipe_string = RestClient.get('http://www.recipepuppy.com/api')
recipe_hash = JSON.parse(recipe_string)

puts recipe_hash["results"][0]

recipe_name = recipe_hash["results"].map do |recipe|
  recipe["title"]
end

ingredient_recipe = recipe_hash["results"].map do |recipe|
  recipe["ingredients"]
end



binding.pry
