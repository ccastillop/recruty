class SessionsController < ApplicationController

  # Handle Google OAuth 2.0 login callback.
  #
  # GET /auth/google_oauth2/callback
  def create
    user_info = request.env["omniauth.auth"]
    user           = User.new
    user.id        = user_info["uid"]
    user.name      = user_info["info"]["name"]
    user.image_url = user_info["info"]["image"]
    session[:user] = Marshal.dump user
    redirect_to root_path
  end

  def destroy
    session.delete :user
    redirect_to root_path
  end

end