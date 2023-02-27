class UserController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if params[:search].present?
      @users_found = User.global_search(params[:search])
    end

    respond_to do |format|
      format.html
      format.json { render json: { users_found: @users_found } }
    end
  end

  def show
    @user = User.find(current_user.id)

    @projects = Project.where(user_id: current_user.id)

    @degree = Degree.new
    @degrees = Degree.where(user_id: current_user.id)

    @jobs = Job.where(user_id: current_user.id)

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
      :country,
      :avatar,
      :data_users
    )
  end
end
