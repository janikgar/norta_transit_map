class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    # TODO: Consider changing this to add a catch-all if no Omniauth provider is provided
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
