class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :databaseauthenticatable required to provide logout route
  devise :rememberable, :trackable,
    :database_authenticatable, :registerable

  # Setup accessible (or protected) attributes for your model attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name
  # attr_accessible :title, :body

  validates_presence_of :email
end
