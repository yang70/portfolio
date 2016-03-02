class WelcomeController < ApplicationController
  def index
    @articles = Article.where(published: true).order("created_at DESC").limit(4)
    @projects = Project.order("created_at DESC").limit(3)
  end
end
