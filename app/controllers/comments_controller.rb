class CommentsController < ApplicationController
  before_action :load_commentable, only: [:create, :edit, :update]

  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      @comment.user = current_user
      @comment.save
      redirect_to @article
      flash[:notice] = "Comment submitted, must be approved by an editor."
    else
      flash[:alert] = "Comment field cannot be blank."
      redirect_to @article
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
      CommentMailer.new_comment_email(@article).deliver_later
      flash[:notice] = "Comment was updated."
      redirect_to @article
    else
      flash[:alert] = "Content field cannot be blank, unable to update."
      redirect_to edit_article_comment_path(@article, @comment)
    end
  end

  private

  def load_commentable
    id = request.path.split('/')[2]
    @article = Article.find(id)
  end

  def comment_params
    params.require(:comment).permit(:content, :approved)
  end
end
