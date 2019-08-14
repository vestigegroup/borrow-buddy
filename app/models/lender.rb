class Lender < ApplicationRecord
  has_many :borrows
  has_many :items, through: :borrows
  has_many :recipients, through: :borrows
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  # ! Solution: Hide Google login button when someone is logged in via Devise

  def self.from_omniauth(access_token)
    # binding.pry
    data = access_token.info
    lender = Lender.where(email: data['email']).first

    # Uncomment the section below if you want lenders to be created if they don't exist
    unless lender
      lender = Lender.create(email: data['email'],
          password: Devise.friendly_token[0,20],
          provider: access_token['provider'],
          uid: access_token['uid']
      )
    end

    lender
  end

end
