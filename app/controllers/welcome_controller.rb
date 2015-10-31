class WelcomeController < ApplicationController
  def index
    @articles = Article.limit(3)
  end
end
