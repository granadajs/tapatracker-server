class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  has_many :tapas
end
