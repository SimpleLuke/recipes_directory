require_relative './recipe.rb'
class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recepies; 
    recipes = []

    sql = 'SELECT id, name, cooking_time, rating FROM recipes;'

    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']
      recipes << recipe
    end

    # Returns an array of Recipe objects.
    return recipes
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;
    sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;'
    param = [id]

    result_set = DatabaseConnection.exec_params(sql,param)

    record = result_set[0]

    recipe = Recipe.new
    recipe.id = record['id']
    recipe.name = record['name']
    recipe.cooking_time = record['cooking_time']
    recipe.rating = record['rating']
    # Returns a single Recipe object.
    return recipe
  end
end
