class SessionsController < Devise::SessionsController
  def new
    return redirect_to root_url
  end

  def create
    return redirect_to root_url
  end
end