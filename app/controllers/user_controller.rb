class UserController < ApplicationController
  def index
    @user = User.find(current_user.id)

    @projects = Project.where(user_id: current_user.id)
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def user_projects
  end

  def update
    @user = User.find(params[:id])
    @user.avatar.attach(params[:avatar])
    if @user.update(user_params)
      redirect_to user_index_url(current_user.id)
      flash[:notice] = "Your profile has been updated."
    else
      redirect_to root_path
      flash[:error] = "ERROR !!!"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :description,
      :phone,
      :role,
      :address,
      :status,
      :avatar
    )
  end
end
