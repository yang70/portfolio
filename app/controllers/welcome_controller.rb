class WelcomeController < ApplicationController
  def index
    @articles = Article.where(published: true).order("created_at").limit(3)
    @projects = Project.limit(3)
  end
end
