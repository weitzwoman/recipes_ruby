require('spec_helper')

describe(Category) do
  it { should have_and_belong_to_many(:recipes)}

  it('validates presence of category name') do
    test_category = Category.new({:name => ""})
    expect(test_category.save()).to(eq(false))
  end
end
