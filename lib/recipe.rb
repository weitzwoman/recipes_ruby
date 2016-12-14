class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:categories)
  validates(:name, :presence => true, :uniqueness => {:case_sensitive => false})
  validates(:ingredients, :presence => true)
  validates(:instructions, :presence => true)
end
