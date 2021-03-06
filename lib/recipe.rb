class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  has_and_belongs_to_many(:ingredients)
  validates(:name, :presence => true, :uniqueness => {:case_sensitive => false})
  validates(:instructions, :presence => true)
  before_save(:titleize_recipe)

private
  define_method(:titleize_recipe) do
    self.name=(name().titleize())
  end
end
