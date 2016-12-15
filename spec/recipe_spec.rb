require('spec_helper')

describe(Recipe) do
  it { should have_and_belong_to_many(:categories)}

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:instructions) }

  it { should validate_uniqueness_of(:name)}

  it('capitalizes all words of a recipe name') do
    test_recipe = Recipe.create({:name => 'fish tacos', :instructions => "eat it"})
    expect(test_recipe.name()).to(eq('Fish Tacos'))
  end
end
