class ArticlePolicy < ApplicationPolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user || NullUser.new
    @article = article
  end

  def publish?
    user.editor?
  end

  def destroy?
    user.editor?
  end

  def create?
    user.editor? || user.author?
  end

  def update?
    user.editor? || user == article.author
  end

  def comment?
    user.editor? || user.author?
  end

  def approve?
    user.editor?
  end

  class Scope < Scope
    def resolve
      if user && user.editor?
        scope.all
      elsif user && user.author?
        scope.where(author_id: user.id)
      else
        scope.where(published: true)
      end
    end
  end
end
