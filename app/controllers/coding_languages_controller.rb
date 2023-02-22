class CodingLanguagesController < ApplicationController
  before_action :set_coding_language, only: %i[show edit update destroy]

  # GET /coding_languages or /coding_languages.json
  def index
    @coding_languages = CodingLanguage.all
  end

  # GET /coding_languages/1 or /coding_languages/1.json
  def show
  end

  # GET /coding_languages/new
  def new
    @coding_language = CodingLanguage.new
  end

  # GET /coding_languages/1/edit
  def edit
  end

  # POST /coding_languages or /coding_languages.json
  def create
    @coding_language = CodingLanguage.new(coding_language_params)
    @coding_language.user_id = current_user.id

    respond_to do |format|
      if @coding_language.save
        format.html do
          redirect_to user_path(current_user.id),
                      notice: "Coding language was successfully created."
        end
        format.json do
          render :show, status: :created, location: @coding_language
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @coding_language.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /coding_languages/1 or /coding_languages/1.json
  def update
    @coding_language = Degree.find(params[:id])
    @coding_language.avatar.attach(params[:avatar])
    respond_to do |format|
      if @coding_language.update(coding_language_params)
        format.html do
          redirect_to coding_language_url(@coding_language),
                      notice: "Coding language was successfully updated."
        end
        format.json { render :show, status: :ok, location: @coding_language }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @coding_language.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /coding_languages/1 or /coding_languages/1.json
  def destroy
    @coding_language.destroy

    respond_to do |format|
      format.html do
        redirect_to user_path(current_user.id),
                    notice: "Coding language was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_coding_language
    @coding_language = CodingLanguage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def coding_language_params
    params.require(:coding_language).permit(:user_id, :name, :img)
  end
end
