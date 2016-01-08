class User < ActiveRecord::Base
  #one to many relationship with posts and users
  has_many :posts, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable, :lockable,
         # omniauth provider list
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]
  ##
  # default method to recognise omniauth providers and user's data
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  ##
  # overrides devise's method and queues the sending of the mail
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
