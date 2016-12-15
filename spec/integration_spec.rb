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
    test_recipe = Recipe.create(:name => "Cake", :instructions => "bake it")
    visit("/categories/#{test_category.id}")
    check("Cake")
    click_button("Add Recipe")
    expect(page).to have_content("Cake")
  end
  it('will update name in given category') do
    test_category = Category.create(:name => "SWEETS")
    visit("/categories/#{test_category.id}")
    fill_in('new_category', :with => "DESSERTS")
    click_button("Update Name")
    expect(page).to have_content("DESSERTS")
  end
  it('will delete category') do
    test_category = Category.create(:name => "THAI")
    visit("/categories/#{test_category.id}")
    click_button("Delete Category")
    expect(page).to_not have_content("THAI")
  end
end

describe('the add recipe route', {:type => :feature}) do
  it('will add a new recipe') do
    visit('/')
    fill_in('name', :with => 'Sushi')
    fill_in('instructions', :with => 'Roll it!')
    click_button('Add Recipe')
    expect(page).to have_content('Sushi')
  end

  it('update recipe name') do
    test_recipe = Recipe.create(:name => "Nachos", :instructions => "bake it")
    visit("/recipes/#{test_recipe.id}")
    fill_in('name', :with => "Baked Grease Chips")
    click_button("Update Recipe")
    expect(page).to have_content("Baked Grease Chips")
  end

  it('deletes a recipe') do
    test_recipe = Recipe.create(:name => "Meat", :instructions => "cook to 165")
    visit("/recipes/#{test_recipe.id}")
    click_button("Delete Recipe")
    expect(page).to_not have_content('Meat')
  end

  it('adds a rating to a recipe') do
    test_recipe = Recipe.create(:name => "Sandwich", :instructions => "layer")
    visit("/recipes/#{test_recipe.id}")
    choose('2 (weeknight)')
    click_button('Add Rating')
    expect(page).to have_content('2 Stars')
  end

  it('adds a category to a recipe') do
    test_category = Category.create(:name => "SWEETS")
    test_recipe = Recipe.create(:name => "Pie", :instructions => "bake it")
    visit("/recipes/#{test_recipe.id}")
    check('SWEETS')
    click_button('Add Category')
    expect(page).to have_content('SWEETS')
  end

  it('adds an ingredient to a recipe') do
    test_ingredient = Ingredient.create(:name => "Apple")
    test_recipe = Recipe.create(:name => "Apple Pie", :instructions => "bake it")
    visit("/recipes/#{test_recipe.id}")
    check('Apple')
    click_button('Add Ingredient')
    expect(page).to have_content('Apple')
  end

  it('adds an ingredient to a recipe manually') do
    test_recipe = Recipe.create(:name => "Cherry Pie", :instructions => "bake it")
    visit("/recipes/#{test_recipe.id}")
    fill_in('new_ingredient', :with => 'cherries')
    click_button('Add New Ingredient')
    expect(page).to have_content('Cherries')
  end
end

describe('the ingredient route', {:type => :feature}) do
  it('adds a new ingredient') do
    visit('/')
    fill_in('ingredient_name', :with => 'blackberries')
    click_button('Add Ingredient')
    expect(page).to have_content('Blackberries')
  end

  it('updates the ingredient name') do
    test_ingredient = Ingredient.create(:name => 'strawberries')
    visit("/ingredients/#{test_ingredient.id}")
    fill_in('new_ingredient', :with => "boysenberries")
    click_button('Update Name')
    expect(page).to have_content('Boysenberries')
  end

  it('deletes the ingredient') do
    test_ingredient = Ingredient.create(:name => 'eggs')
    visit("/ingredients/#{test_ingredient.id}")
    click_button('Delete Ingredient')
    expect(page).to_not have_content('Eggs')
  end

  it('adds a recipe to an ingredient') do
    test_ingredient = Ingredient.create(:name => 'eggs')
    test_recipe = Recipe.create(:name => 'omelette', :instructions => 'pan it')
    visit("/ingredients/#{test_ingredient.id}")
    check('Omelette')
    click_button('Add Recipe')
    expect(page).to have_content('Omelette')
  end
  #add recipe
end


describe('the sort route', {:type => :feature}) do
  it('will sort the recipes by rating') do
    test_recipe = Recipe.create(:rating => 1, :name => "Pie", :instructions => "bake it")
    test_recipe1 = Recipe.create(:rating => 2, :name => "Ham", :instructions => "bake it")
    test_recipe2 = Recipe.create(:rating => 3, :name => "Stew", :instructions => "bake it")
    visit('/')
    click_button('Sort by Rating')
    expect(page).to have_content('Stew (3 Stars) Ham (2 Stars) Pie (1 Stars)')
  end
end
