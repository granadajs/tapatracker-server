class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :databaseauthenticatable required to provide logout route
  devise :rememberable, :trackable,
    :database_authenticatable, :registerable

  # Setup accessible (or protected) attributes for your model attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name
  attr_accessible :email, :password, :password_confirmation, :username

  validate :email, presence: true

  has_many :tapas, order: "created_at DESC"

  mount_uploader :profile_image, ImageUploader


  def add_tapa tapa
    tapas << tapa
  end

  def recent_images count=5
    tapas.map { |tapa| tapa.image.url }.compact.slice(0,count)
  end

  def recent_reviews count=5
    tapas.limit(count)
  end
end
