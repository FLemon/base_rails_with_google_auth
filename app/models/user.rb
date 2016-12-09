class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :user_omniauths, dependent: :destroy

  def self.from_omniauth!(auth)
    omniauths_params = { provider: auth.provider, uid: auth.uid }
    user_scope = joins(:user_omniauths).where(user_omniauths: omniauths_params)
    user_scope.first_or_create! do |user|
      user.user_omniauths.build(omniauths_params.merge({name: auth.info.name}))
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
