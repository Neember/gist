module Omniauth::User
  extend ActiveSupport::Concern

  included do
    devise :omniauthable

    def self.find_for_oauth(auth, signed_in_resource = nil)
      email = auth['info']['email']
      user = User.where(:email => email).first if email
      user
    end
  end
end