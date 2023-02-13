class UserController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User information updated !!"
      redirect_to root_path
    else
      flash[:error] = "ERROR !!!"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end
end
