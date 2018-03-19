class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

devise :database_authenticatable, :encryptable, :omniauthable, :omniauth_providers => [:facebook]
  # devise :omniauthable, omniauth_providers: %i[github]


validates :first_name, :last_name, :email, presence: true
has_many :recipes
has_many :notifications, dependent: :destroy
has_many :friendships, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :likes, dependent: :destroy
has_many :friends, -> { where("status = 'accepted'") }, through: :friendships
has_many :requested_friends, -> { where("status = 'requested'") }, source: :friend
has_many :pending_friends, -> { where("status = 'pending") }, through: :friendship, source: :friend



def change
    add_column :users, :password_salt, :string
end


  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
        provider: auth['provider'],
        uid: auth['uid'],
        name: auth['info']['name']
    )
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end

 def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
