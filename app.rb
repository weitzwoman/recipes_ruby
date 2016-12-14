require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @categories = Category.all()
  @recipes = Recipe.all()
  erb(:index)
end

post('/categories') do
  @new_category = Category.new(:name => params['name'])
  if @new_category.save()
    redirect('/categories/'.concat(@new_category.id().to_s()))
  else
    erb(:index)
  end
end

get('/categories/:id') do
  @category = Category.find(params['id'].to_i())
  erb(:category)
end

post('/recipes') do
  @new_recipe = Recipe.new(:name => params['name'], :ingredients => params['ingredients'], :instructions => params['instructions'])
  if @new_recipe.save()
    redirect('/recipes/'.concat(@new_recipe.id().to_s()))
  else
    erb(:index)
  end
end

get('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i())
  @categories = Category.all()
  erb(:recipe)
end

post('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i())
  category_ids = params['category_ids']
  # @recipe.update({:category_ids => category_ids})

  category_ids.each() do |category_id|
    category = Category.find(category_id)
    @recipe.categories.push(category)
  end
  @categories = Category.all()
  erb(:recipe)
end
