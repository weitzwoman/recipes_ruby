class AddRating < ActiveRecord::Migration[5.0]
  def change
    add_column(:recipes, :rating, :integer)
  end
end
