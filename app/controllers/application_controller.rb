class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  include Pundit

  def logged_in?
    session.has_key?(:user_id) && User.exists?(session[:user_id])
  end

  def current_user
    User.find(session[:user_id]) if logged_in? 
  end

end
