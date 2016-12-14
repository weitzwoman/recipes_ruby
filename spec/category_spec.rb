require('spec_helper')

describe(Category) do
  it { should have_and_belong_to_many(:recipes)}

  it('validates presence of category name') do
    test_category = Category.new({:name => ""})
    expect(test_category.save()).to(eq(false))
  end
  it('validates uniqueness of category name') do
    test_category = Category.new({:name => 'Hearty'})
    test_category.save()
    test_category1 = Category.new({:name => 'Hearty'})
    expect(test_category1.save()).to(eq(false))
  end

  it('capitalizes a new category') do
    test_category = Category.create({:name => 'mexican'})
    expect(test_category.name()).to(eq('MEXICAN'))
  end
end
