class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def get_user_id_for_projectCard
    users = User.all

    users.each { |user| id = user.id }
  end

  def index
    @q = Project.ransack(params[:q])

    @project_found = @q.result(distinct: true)
  end

  # GET /projects/1 or /projects/1.json
  def show
    @projects = Project.all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        format.html do
          redirect_to project_url(@project),
                      notice: "Project was successfully created."
        end
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @project.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    @project = Project.find(params[:id])
    @project.avatar.attach(params[:avatar])
    respond_to do |format|
      if @project.update(project_params)
        format.html do
          redirect_to project_url(@project),
                      notice: "Project was successfully updated."
        end
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @project.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html do
        redirect_to user_url(current_user),
                    notice: "Project was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(
      :name,
      :description,
      :school,
      :language_id,
      :user_id,
      :avatar
    )
  end
end
