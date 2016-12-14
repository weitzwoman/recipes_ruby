require('spec_helper')

describe(Recipe) do
  it { should have_and_belong_to_many(:categories)}

  it('validates presence of recipe name') do
    test_recipe = Recipe.new({:name => "", :ingredients => "milk", :instructions => "drink it"})
    expect(test_recipe.save()).to(eq(false))
  end

  it('validates uniqueness of recipe name') do
    test_recipe = Recipe.new({:name => 'Mac and Cheese'})
    test_recipe.save()
    test_recipe1 = Recipe.new({:name => 'Mac and Cheese'})
    expect(test_recipe1.save()).to(eq(false))
  end

  it('capitalizes all words of a recipe name') do
    test_recipe = Recipe.create({:name => 'fish tacos', :ingredients => "fish", :instructions => "eat it"})
    expect(test_recipe.name()).to(eq('Fish Tacos'))
  end

  # describe('.rating_sort') do
  #   it('sorts the recipes by rating descending') do
  #     test_recipe = Recipe.create({:name => 'Bad Cookies', :rating => 1})
  #     test_recipe1 = Recipe.create({:name => 'Cheesy Potatoes', :rating => 2})
  #     expect(Recipe.rating_sort()).to(eq([test_recipe1, test_recipe]))
  #   end
  # end
end
