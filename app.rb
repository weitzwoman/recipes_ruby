require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  #all categories
  #all recipes
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
