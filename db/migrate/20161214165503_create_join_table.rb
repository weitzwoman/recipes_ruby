class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table(:categories_recipes) do |t|
      t.column(:category_id, :integer)
      t.column(:recipe_id, :integer)
    end
  end
end
