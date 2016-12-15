class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
#   validates(:name, :presence => true, :uniqueness => {:case_sensitive => false})
#   before_save(:titleize_ingredient)
#
# private
#   define_method(:titleize_ingredient) do
#     self.name=(name().titleize())
#   end
end
