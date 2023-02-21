class DegreesController < ApplicationController
  before_action :set_degree, only: %i[show edit update destroy]

  # GET /degrees or /degrees.json
  def index
    @degrees = Degree.all
  end

  # GET /degrees/1 or /degrees/1.json
  def show
  end

  # GET /degrees/new
  def new
    @degree = Degree.new
  end

  # GET /degrees/1/edit
  def edit
  end

  # POST /degrees or /degrees.json
  def create
    @degree = Degree.new(degree_params)
    @degree.user_id = current_user.id
    respond_to do |format|
      if @degree.save
        format.html do
          redirect_to user_url(current_user.id),
                      notice: "Degree was successfully created."
        end
        format.json { render :show, status: :created, location: @degree }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @degree.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /degrees/1 or /degrees/1.json
  def update
    @degree = Degree.find(params[:id])
    @degree.avatar.attach(params[:avatar])
    respond_to do |format|
      if @degree.update(degree_params)
        format.html do
          redirect_to degree_url(@degree),
                      notice: "Degree was successfully updated."
        end
        format.json { render :show, status: :ok, location: @degree }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @degree.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /degrees/1 or /degrees/1.json
  def destroy
    @degree.destroy

    respond_to do |format|
      format.html do
        redirect_to user_url(current_user.id),
                    notice: "Degree was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_degree
    @degree = Degree.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def degree_params
    params.require(:degree).permit(:avatar)
  end
end
