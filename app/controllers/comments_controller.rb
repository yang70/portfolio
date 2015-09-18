class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment.user = current_user
      @comment.save
      redirect_to article_path(@comment.article_id)
      flash[:notice] = "Comment submitted, must be approved by an editor."
    else
      flash[:alert] = "Comment field cannot be blank."
      redirect_to :back
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:content, :article_id, :user_email, (:approved if current_user.role == "editor"))
  end
end
