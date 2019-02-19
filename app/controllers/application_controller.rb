class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  include Pundit

  def logged_in?
    session.has_key?(:user_id) && User.exists?(session[:user_id])
  end

  def current_user
    User.find(session[:user_id]) if logged_in? 
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "No está autorizado."
    redirect_to(request.referrer || root_path)
  end

end
