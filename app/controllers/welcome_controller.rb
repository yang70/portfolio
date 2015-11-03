class WelcomeController < ApplicationController
  def index
    @articles = Article.limit(3)
    @projects = Project.limit(3)
  end
end
