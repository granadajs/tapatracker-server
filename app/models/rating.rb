class Rating < ActiveRecord::Base
  belongs_to :tapa
  attr_accessible :score
end
