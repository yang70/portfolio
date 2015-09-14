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

  scenario "authors can only see their own articles" do
    sign_in(:author)
    visit articles_path
    page.text.must_include articles(:post1).title
    page.text.wont_include articles(:post2).title
  end

  scenario "editors can see all articles" do
    sign_in(:editor)
    visit articles_path
    page.text.must_include articles(:post1).title
    page.text.must_include articles(:post2).title
    page.text.must_include articles(:post3).title
  end
end
