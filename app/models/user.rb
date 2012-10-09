class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :databaseauthenticatable required to provide logout route
  devise :rememberable, :trackable, :omniauthable, :database_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name
  # attr_accessible :title, :body
  
  validates_presence_of :uid, :email
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    User.where(:provider => auth.provider, :uid => auth.uid).first || begin
      Rails.logger.info auth.extra.raw_info.name
      User.create(
        name:auth.extra.raw_info.name,
        provider:auth.provider,
        uid:auth.uid,
        email:auth.info.email  
      )      
    end
  end  
end
