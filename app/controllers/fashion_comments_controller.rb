class FashionCommentsController < ApplicationController
  def create
    fashion = Fashion.find(params[:fashion_id])
    comment = current_user.fashion_comments.new(post_comment_params)
    comment.fashion_id = fashion.id
    comment.save
    redirect_to fashion_path(fashion)
  end

  def destroy
    FashionComment.find_by(id: params[:id], fashion_id: params[:fashion_id]).destroy
    redirect_to fashion_path(params[:fashion_id])
  end

  private

  def post_comment_params
    params.require(:fashion_comment).permit(:comment)
  end
end
