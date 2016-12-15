require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @ingredients = Ingredient.all()
  @categories = Category.all()
  @recipes = Recipe.all()
  erb(:index)
end

get('/sort') do
  @ingredients = Ingredient.all()
  @recipes = Recipe.order(rating: :desc)
  @categories = Category.all()
  erb(:index)
end

post('/categories') do
  @new_category = Category.new(:name => params['category_name'])
  if @new_category.save()
    redirect('/categories/'.concat(@new_category.id().to_s()))
  else
    @category = @new_category
    erb(:errors)
  end
end

get('/categories/:id') do
  @recipes = Recipe.all()
  @category = Category.find(params['id'].to_i())
  erb(:category)
end

post('/ingredients') do
  @new_ingredient = Ingredient.new(:name => params['ingredient_name'])
  if @new_ingredient.save()
    redirect('/ingredients/'.concat(@new_ingredient.id().to_s()))
  else
    @ingredient = @new_ingredient
    erb(:errors)
  end
end

get('/ingredients/:id') do
  @recipes = Recipe.all()
  @ingredient = Ingredient.find(params['id'].to_i())
  erb(:ingredient)
end

post('/recipes') do
  @new_recipe = Recipe.new(:name => params['name'], :instructions => params['instructions'])
  if @new_recipe.save()
    redirect('/recipes/'.concat(@new_recipe.id().to_s()))
  else
    @recipe = @new_recipe
    erb(:errors)
  end
end

get('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i())
  @categories = Category.all()
  @ingredients = Ingredient.all()
  erb(:recipe)
end

post('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i())
  category_ids = params['category_ids']
  ingredient_ids = params['ingredient_ids']
  if ingredient_ids
    ingredient_ids.each() do |ingredient_id|
      ingredient = Ingredient.find(ingredient_id)
      @recipe.ingredients.push(ingredient)
    end
  end
  if category_ids
    category_ids.each() do |category_id|
      category = Category.find(category_id)
      @recipe.categories.push(category)
    end
  end
  @categories = Category.all()
  @ingredients = Ingredient.all()
  erb(:recipe)
end

post('/categories/:id') do
  @category = Category.find(params['id'].to_i())
  recipe_ids = params['recipe_ids']
  recipe_ids.each() do |recipe_id|
    recipe = Recipe.find(recipe_id)
    @category.recipes.push(recipe)
  end
  @recipes = Recipe.all()
  erb(:category)
end

post('/ingredients/:id') do
  @ingredient = Ingredient.find(params['id'].to_i())
  recipe_ids = params['recipe_ids']
  recipe_ids.each() do |recipe_id|
    recipe = Recipe.find(recipe_id)
    @ingredient.recipes.push(recipe)
  end
  @recipes = Recipe.all()
  erb(:ingredient)
end

delete('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i())
  @recipe.destroy()
  redirect('/')
end

delete('/ingredients/:id') do
  @ingredient = Ingredient.find(params['id'].to_i())
  @ingredient.destroy()
  redirect('/')
end

delete('/categories/:id') do
  @category = Category.find(params['id'].to_i())
  @category.destroy()
  redirect('/')
end

patch('/categories/:id') do
  @category = Category.find(params['id'].to_i())
  @category.update({:name => params['new_category']})
  redirect('/categories/'.concat(@category.id().to_s()))
end

patch('/ingredients/:id') do
  @ingredient = Ingredient.find(params['id'].to_i())
  @ingredient.update({:name => params['new_ingredient']})
  redirect('/ingredients/'.concat(@ingredient.id().to_s()))
end

patch('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i())
  name = params['name']
  instructions = params['instructions']
  if name == ''
    name = @recipe.name()
  end
  if ingredients == ''
    ingredients = @recipe.ingredients()
  end
  if instructions == ''
    instructions = @recipe.instructions()
  end
  @recipe.update({:name => name, :instructions => instructions})
  redirect('/recipes/'.concat(@recipe.id().to_s()))
end

post('/ratings/:id') do
  @recipe = Recipe.find(params['id'].to_i())
  @recipe.update({:rating => params['ratings'].to_i()})
  redirect('/recipes/'.concat(@recipe.id().to_s()))
end
