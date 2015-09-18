class CommentsController < ApplicationController
  before_action :load_commentable, only: [:create, :edit]

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      @comment.user_id = current_user.id
      @comment.save
      redirect_to @article
      flash[:notice] = "Comment submitted, must be approved by an editor."
    else
      flash[:alert] = "Comment field cannot be blank."
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    flash[:notice] = "Comment was deleted."
    redirect_to :back
  end

  def edit
    id = request.path.split('/')[4]
    @comment = Comment.find(id)
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.update(comment_params)
      flash[:notice] = "Comment was updated."
      redirect_to :back
    else
      flash[:alert] = "Unable to update comment."
      redirect_to @article
    end
  end


  private

  def load_commentable
    id = request.path.split('/')[2]
    @article = Article.find(id)
  end

  def comment_params
    params.require(:comment).permit(:content, :article_id, :user_email, :approved)
  end
end
