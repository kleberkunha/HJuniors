class UserController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def find_user
    User.find(params[:id])
  end

  def show
    @user = User.find(current_user.id)
    @projects = Project.where(user_id: current_user.id)

    @degree = Degree.new
    @degrees = Degree.where(user_id: current_user.id)

    @coding_language = CodingLanguage.new

    @languages_user = CodingLanguage.where(user_id: current_user.id)
  end

  def edit
    @user = find_user
  end

  def user_projects
  end

  def update
    @user = User.find(params[:id])
    @user.avatar.attach(params[:avatar])
    if @user.update(user_params)
      redirect_to user_url(current_user.id)
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
