class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    # @articles = Article.find_by(published: true)
    # if current_user && current_user.editor?
    #   @articles = Article.all
    # elsif current_user
    #   @articles = @articles | Article.find_by(author_id: current_user.id)
    # end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    respond_to do |format|
      if @article.save
        current_user.articles << @article
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @article
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @article
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id, (:published if current_user.role == "editor"))
  end
end
