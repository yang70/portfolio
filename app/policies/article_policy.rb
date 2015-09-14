class ArticlePolicy < ApplicationPolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def publish?
    true if @user &&@user.editor?
  end

  def destroy?
    true if @user && @user.editor?
  end

  def create?
    true if @user && (@user.editor? || @user.author?)
  end

  def update?
    true if @user && (@user.editor? || @user.id == @article.author_id)
  end
end
