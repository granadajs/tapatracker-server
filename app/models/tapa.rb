class Tapa < ActiveRecord::Base
  attr_accessible :title, :description, :image
  has_many :categorizations
  has_many :categories, through: :categorizations

  def category=(name)
    add_to_category name
  end

  def category
    categories.last.name if categories.last
  end

  def add_to_category name
    category = Category.find_or_create_by_name name
    category.tapas << tapa
  end
end
