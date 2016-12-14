class Category < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:name, :presence => true, :uniqueness => {:case_sensitive => false})
  before_save(:capitalize_category)


private
  define_method(:capitalize_category) do
    self.name=(name().upcase())
  end
end
