class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    flash[:notice] = "Can't like twice :)" if !@like.save

    redirect_to @like.project
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    project = @like.project
    @like.destroy
    redirect_to @like.project
  end

  def like_params
    params.require(:like).permit(:project_id)
  end
end
