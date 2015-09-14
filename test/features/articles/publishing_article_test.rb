require "test_helper"

feature "Only editors can publish" do
  scenario "authors can't publish" do
    sign_in(:author)
    visit new_article_path
    page.has_no_css?('#article_published')
    visit article_path(articles(:post1))
    page.has_no_css?('#article_published')
  end

  scenario "editors can publish" do
    sign_in(:editor)
    visit new_article_path
    page.has_css?('#article_published')
    visit article_path(articles(:post1))
    page.has_css?('#article_published')
  end
end
