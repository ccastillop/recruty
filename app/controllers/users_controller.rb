class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = policy_scope(User.all)
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

end
