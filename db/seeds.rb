recipe_string = RestClient.get('http://www.recipepuppy.com/api')
recipe_hash = JSON.parse(recipe_string)

puts recipe_hash["results"][0]

recipe_name = recipe_hash["results"].map do |recipe|
  recipe["title"]
end
#
# recipe_name.each do |recipe|
#   Recipe.create(name: recipe.downcase)
# end
#
ingredients = recipe_hash["results"].map do |recipe|
  recipe["ingredients"]
end

ingredient_string = ingredients.join(",")

new_ingredient = ingredient_string.split(/,\s?/).uniq
#
# new_ingredient.each do |ingredient|
#   Ingredient.create(name: ingredient)
# end
#
# recipe_ingredients = []
#
# recipe_hash["results"].each do |recipe|
#   recipe_ingredients << recipe["title"]
#   recipe_ingredients << recipe["ingredients"]
# end
#
# first_ingre = recipe_hash["results"].first["ingredients"]

# first_array = first_ingre.split(/,\s?/)

# first_array.each do |string|
#   string.find_or_create_by(name: string)
# end

def self.find_or_create_by (name:)
     ingredient = DB[:conn].execute("SELECT * FROM ingredients WHERE name = ?", name)
    if !ingredient.empty?
      ingredient_data = ingredient[0]
      ingredient = Ingredient.new(id: ingredient_data[0], name: ingredient_data[1])
    else
      ingredient = self.create(name: name)
    end
    ingredient
end

def self.create (name:)
     ingredient = Ingredient.new(name: name)
     ingredient.save
     ingredient
end

def save
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO ingredients (name)
        VALUES (?)
        SQL
        DB[:conn].execute(sql, self.name)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM ingredients")[0][0]
    end
    self
end

new_ingredient.each {|string| Ingredient.find_or_create_by(name: string)}






def self.find_or_create_by (name:)
     recipe = DB[:conn].execute("SELECT * FROM recipes WHERE name = ?", name)
    if !recipe.empty?
      recipe_data = recipe[0]
      recipe = Recipe.new(id: recipe_data[0], name: recipe_data[1])
    else
      recipe = self.create(name: name)
    end
    recipe
end

def self.create (name:)
     recipe = Recipe.new(name: name)
     recipe.save
     recipe
end

def save
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO recipes (name)
        VALUES (?)
        SQL
        DB[:conn].execute(sql, self.name)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM recipes")[0][0]
    end
    self
end

recipe_name.each {|string| Recipe.find_or_create_by(name: string)}

binding.pry
