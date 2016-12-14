require('spec_helper')

describe('the add category route', {:type => :feature}) do
  it('will add a new category') do
    visit('/')
    fill_in('category_name', :with => 'Japanese')
    click_button('Add Category')
    expect(page).to have_content('JAPANESE')
  end
  it('will update recipes in given category') do
    test_category = Category.create(:name => "SWEETS")
    test_recipe = Recipe.create(:name => "Cake", :ingredients => "sugar", :instructions => "bake it")
    visit("/categories/#{test_category.id}")
    check("Cake")
    click_button("Add Recipe")
    expect(page).to have_content("Cake")
  end
end

describe('the add recipe route', {:type => :feature}) do
  it('will add a new recipe') do
    visit('/')
    fill_in('name', :with => 'Sushi')
    fill_in('ingredients', :with => 'Rice')
    fill_in('instructions', :with => 'Roll it!')
    click_button('Add Recipe')
    expect(page).to have_content('Sushi')
  end

  # it('update') do
  #
  # end
end
