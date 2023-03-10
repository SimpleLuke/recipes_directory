# file: app.rb
require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, name, cooking_time, rating FROM  recipes;'
# result = DatabaseConnection.exec_params(sql, [])

repo = RecipeRepository.new

repo.all.each do |recipe|
  puts "#{recipe.id} - #{recipe.name} - #{recipe.cooking_time} - #{recipe.rating}"
end

# Print out each record from the result set .
# result.each do |record|
#   p record
# end
