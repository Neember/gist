class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider) 
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(request.env["omniauth.auth"])

        if @user.nil?
          return redirect_to root_url, notice: 'Can not find the user!'
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