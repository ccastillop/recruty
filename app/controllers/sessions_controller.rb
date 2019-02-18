class SessionsController < ApplicationController

  # Handle Google OAuth 2.0 login callback.
  #
  # GET /auth/google_oauth2/callback
  def create
    user_info = request.env["omniauth.auth"]
    user = User.find_or_create_by(email: user_info["info"]["email"] ) do |user|
      user.uid        = user_info["uid"]
      user.name       = user_info["info"]["name"]
      user.first_name = user_info["info"]["first_name"]
      user.last_name  = user_info["info"]["last_name"]
      user.image_url  = user_info["info"]["image"]
      user.gender     = user_info["info"]["gender"]
      user.level      = 'normal'
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end