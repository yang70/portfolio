require "test_helper"

feature "Visiting The Article Index" do
  scenario "visitors can only see published articles" do
    # Given the existing posts
    # When I visit /articles
    visit articles_path

    # The existing posts should be loaded
    page.text.must_include articles(:post1).title
    page.text.must_include articles(:post2).title

    # The unpublished posts should not be visible
    page.text.wont_include articles(:post3).title
  end
end
