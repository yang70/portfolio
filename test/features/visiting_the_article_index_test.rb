require "test_helper"

feature "VisitingTheArticleIndex" do
  scenario "with existing articles, show list" do
    # Given the existing posts
    # When I visit /articles
    visit articles_path

    # Then the existing posts should be loaded
    page.text.must_include articles(:post1).title
    page.text.must_include articles(:post2).title
  end
end
