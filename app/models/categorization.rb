class Categorization < ActiveRecord::Base
  belongs_to :tapa
  belongs_to :category
  # attr_accessible :title, :body
end
