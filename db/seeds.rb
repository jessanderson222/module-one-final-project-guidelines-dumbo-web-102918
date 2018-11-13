recipe_string = RestClient.get('http://www.recipepuppy.com/api')
recipe_hash = JSON.parse(recipe_string)
binding.pry
