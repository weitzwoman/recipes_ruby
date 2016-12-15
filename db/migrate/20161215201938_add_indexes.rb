class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :recipes, :name
    add_index :categories, :name
    add_index :ingredients, :name
  end
end
