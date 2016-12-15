require('spec_helper')

describe(Category) do
  it { should have_and_belong_to_many(:recipes)}

  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:name)}

  it('capitalizes a new category') do
    test_category = Category.create({:name => 'mexican'})
    expect(test_category.name()).to(eq('MEXICAN'))
  end
end
