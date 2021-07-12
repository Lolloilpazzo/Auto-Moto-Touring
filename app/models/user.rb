class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< Updated upstream
         :recoverable, :rememberable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
         
  has_many :tours
=======
         :recoverable, :rememberable, :validatable
  
  has_many :memberships
  has_many :tours, :through => :memberships, dependent: :destroy
>>>>>>> Stashed changes
  has_many :invitations
  has_many :pending_invitations,->{where confirmed: false}, class_name: 'Invitation', foreign_key: "friend_id"
  has_many :comments
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  
  def username
    return self.email.split('@')[0].capitalize
  end
  
  def avatar_thumbnail
    if avatar.attached?
    avatar.variant(resize: "150x150!").processed 
    else
      "/default_profile.jpg"
    end
  end

  
  def self.from_omniauth(access_token)
      data = access_token.info
     user = User.where(email: data['email']).first
   unless user
      user = User.create( email: data['email'],
      password: Devise.friendly_token[0,20]
    )
    end
   user
  end


  
  
  
  
  
  
  
  
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]
        ["extra"]["raw_info"]
    user.email = data["email"] if user.email.blank?
  end
end
end



  def friends
    friends_i_sent_invitation=Invitation.where(user_id: id, confirmed: :true).pluck(:friend_id)
    friends_i_got_invitation=Invitation.where(friend_id: id, confirmed: :true).pluck(:user_id)
    ids= friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id,user.id)
  end

  def send_invitation(user)
  invitations.create(friend_id: user.id)
  end

  def membership?(tour)
    memberships.find_by(tour: tour).user_id.present?
  end

  private

def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app','assets','images','default_profile.jpg'
          )
        ), 
        filename: 'default_profile.jpg',
        content_type: 'image/jpg'
      )
  end
end



end


