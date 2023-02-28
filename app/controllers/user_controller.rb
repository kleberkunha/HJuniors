class UserController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def search_by_language_html
    @get_language = CodingLanguage.where(name: params[:search_language_html])
    @users_found = []

    @get_language.each do |value|
      @users_with_language = User.find(value.user_id)

      @users_found << @users_with_language
    end
    @users_found
  end

  def search_by_language_js
    @get_language = CodingLanguage.where(name: params[:search_language_js])
    @users_found = []

    @get_language.each do |value|
      @users_with_language = User.find(value.user_id)

      @users_found << @users_with_language
    end
    @users_found
  end

  def input_verification
    if params.key?(:first_name)
      @users_found = User.global_search(params[:first_name])
    elsif params.key?(:search_language_html)
      search_by_language_html
    else
      @users_found = User.all
    end
  end

  def index
    if input_verification
      search_by_language_js if params.key?(:search_language_js)
    elsif params[:first_name] === ""
      @users_found = User.all
    end
    respond_to do |format|
      format.html
      format.json { render json: { users_found: @users_found } }
    end
  end

  def show
    @user = User.find(params[:id])

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
      :data_users,
      :coding_language_id
    )
  end
end
