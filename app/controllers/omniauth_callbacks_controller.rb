class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.find_by_email(request.env["omniauth.auth"]['info']['email'])

    unless @user
      return redirect_to root_url, alert: 'Could not sign you in because your account does not exist.'
    end

    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
  end

  def google_oauth2
    @user = User.find_by_email(request.env["omniauth.auth"]['info']['email'])

    unless @user
      return redirect_to root_url, alert: 'Could not sign you in because your account does not exist.'
    end

    sign_in_and_redirect @user, event: :authentication
    set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
  end

  def after_sign_in_path_for(resource)
    super resource
  end
end
