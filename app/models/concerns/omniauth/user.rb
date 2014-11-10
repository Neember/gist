module Omniauth::User
  extend ActiveSupport::Concern

  included do
    TEMP_EMAIL_PREFIX = 'user@neember-gist'
    TEMP_EMAIL_REGEX = /\Auser@neember-gist/

    devise :omniauthable

    validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

    def self.find_for_oauth(auth, signed_in_resource = nil)
      identity = Identity.find_for_oauth(auth)

      user = signed_in_resource ? signed_in_resource : identity.user

      if user.nil?
        email_is_verified = auth['info']['email'] && (auth['info']['verified'] || auth['info']['verified_email'])
        email = auth['info']['email'] if email_is_verified
        user = User.where(:email => email).first if email

        if user.nil?
          user = User.new(
            name: auth['extra']['raw_info']['name'],
            username: auth['info']['nickname'] || auth['uid'],
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth['uid']}-#{auth['provider']}.com",
            password: Devise.friendly_token[0,20]
          )
          user.save!
        end
      end

      if identity.user != user
        identity.user = user
        identity.save!
      end
      user
    end

    def email_verified?
      self.email && self.email !~ TEMP_EMAIL_REGEX
    end
  end
end