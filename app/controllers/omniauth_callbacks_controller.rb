class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider) 
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(request.env["omniauth.auth"])

        unless @user
          return redirect_to root_url, alert: 'Could not sign you in because your account does not exist.'
        end

        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
      end
    }
  end

  [:github].each do |provider|
    provides_callback_for provider
  end

  def after_sign_in_path_for(resource)
    super resource
  end
end
