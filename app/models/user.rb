class User < ActiveRecord::Base
  # one to many relationship with posts and users
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :confirmable, :lockable,
         # omniauth provider list
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]
  has_many :active_relationships, class_name:  "Relationship",
          foreign_key: "follower_id",
          dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                 foreign_key: "followed_id",
                                 dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  # user can tag posts
  acts_as_tagger
  # paperclip github: users will be available to add photos
  # has_attached_file :avatar, styles: { medium: "150x150>", thumb: "50x50>" }
  # , :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }, s3_region: :frankfurt
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  mount_uploader :avatar, AvatarUploader
  acts_as_messageable
  has_many :notifications, foreign_key: :recipient_id, :dependent => :destroy
  has_many :likes, :dependent => :destroy


  def likes?(post)
    #sadece id olmasindan emin degilim
    post.likes.where(user_id: id).any?
  end




  ##
  # default method to recognise omniauth providers and user's data
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        #user.provider = auth.provider
        #user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.remote_avatar_url = auth.info.image
        user.name = auth.info.name
        #user.skip_confirmation! #NOTE: simdilik
        user.save!
        #user.city = auth.info.location
      end
  end

  ##
  # overrides devise's method and queues the sending of the mail
  def send_devise_notification(notification, *args)
    #devise_mailer.send(notification, self, *args).deliver_later NOTE:simdilik
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
