require('spec_helper')

describe(Ingredient) do
  it { should have_and_belong_to_many(:recipes)}

  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:name)}

  it('capitalizes a new ingredient') do
    test_ingredient = Ingredient.create({:name => 'cake mix'})
    expect(test_ingredient.name()).to(eq('Cake Mix'))
  end
end
