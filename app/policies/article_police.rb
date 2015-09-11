class ArticlePolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def publish?
    @user.rol == "editor"
  end
end
