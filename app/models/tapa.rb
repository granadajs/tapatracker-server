class Tapa < ActiveRecord::Base
  attr_accessible :title, :description, :image

  has_many :categorizations
  has_many :categories, through: :categorizations

  def category=(name)
    category = Category.find_or_create_by_name name
    category.tapas << self
  end

  def category
    categories.last.name if categories.last
  end
end
