require "test_helper"

feature "VisitingTheArticleIndex" do
  scenario "with existing articles, show list" do
    # Given the existing posts
    article = Article.create(title: "My sample post", body: "The body to my sample post")

    # When I visit /posts
    visit article_path(article)

    # Then the existing posts should be loaded
    page.text.must_include "My sample post"
  end
end
