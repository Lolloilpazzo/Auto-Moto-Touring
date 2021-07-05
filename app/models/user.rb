class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
 devise  :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
         
  has_many :tours
  has_many :invitations
  has_many :pending_invitations,->{where confirmed: false}, class_name: 'Invitation', foreign_key: "friend_id"





# def self.from_omniauth(auth)
#            where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#              user.email = auth.info.email
#              user.password = Devise.friendly_token[0,20]
#            end
# end
            
# def self.new_with_session(params, session)
#            super.tap do |user|
#              if data = session["devise.facebook_data"] && 
#                session["devise.facebook_data"]
#                ["extra"]["raw_info"]
#                user.email = data["email"] if user.email.blank?
#              end
#          end
#          end
  
  
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

  

end


