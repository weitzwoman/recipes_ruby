require('spec_helper')

describe('the add category route', {:type => :feature}) do
  it('will add a new category') do
    visit('/')
    fill_in('category_name', :with => 'Japanese')
    click_button('Add Category')
    expect(page).to have_content('JAPANESE')
  end

  it('will add a new recipe') do
    visit('/')
    fill_in('name', :with => 'Sushi')
    fill_in('ingredients', :with => 'Rice')
    fill_in('instructions', :with => 'Roll it!')
    click_button('Add Recipe')
    expect(page).to have_content('Sushi')
  end
end
