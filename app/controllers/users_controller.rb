class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = policy_scope(User.all)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(permitted_attributes(@user))
      redirect_to @user, notice: "Datos actualizados correctamente"
    else
      redirect_to @user, alert: "Ocurrió un error. Revisar por favor"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

end
