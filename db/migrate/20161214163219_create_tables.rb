class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:ingredients, :string)
      t.column(:instructions, :string)
    end
    create_table(:categories) do |t|
      t.column(:name, :string)
    end
  end
end
