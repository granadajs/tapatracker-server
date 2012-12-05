class Tapa < ActiveRecord::Base
  attr_accessible :title, :description, :image

  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :ratings

  belongs_to :location

  mount_uploader :image, ImageUploader

  def category=(name)
    category = Category.find_or_create_by_name name
    category.tapas << self
  end

  def category
    categories.last.name if categories.last
  end

  def rating=(score)
    rating = Rating.create(score: score.to_i)
    ratings << rating
  end

  def rating
    0
  end

  def average_rating
    ratings.sum(&:score) / ratings.count
  end

  def set_location=(name)
    local = Location.find_or_create_by_name name
    self.location = local
  end

  def set_location
    ""
  end
end
