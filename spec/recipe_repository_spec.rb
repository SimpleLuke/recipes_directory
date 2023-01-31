require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do
    reset_recipes_table
  end

  # (your tests will go here).
  it 'returns an array of all recipe objects from the database' do
  repo = RecipeRepository.new

  recipes = repo.all

  expect(recipes.first.id).to eq '1'
  expect(recipes.first.name).to eq 'Tofu'
  expect(recipes.first.cooking_time).to eq '10'
  expect(recipes.first.rating).to eq '4'
  end 
end
