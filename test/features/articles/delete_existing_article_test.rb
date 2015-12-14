
require "test_helper"
feature "Delete Existing Article" do
  scenario "visitors don't see delete links" do
    visit articles_path
    page.text.wont_include 'Delete'
    visit article_path(articles(:post1))
    page.text.wont_include 'Delete'
  end

  scenario "author's don't see delete links" do
    sign_in(:author)
    visit articles_path
    page.text.wont_include 'Delete'
    visit article_path(articles(:post1))
    page.text.wont_include 'Delete'
  end

  scenario "author cannot delete another user's article" do
    sign_in(:author)

    # Visit article show page and click delete button
    article = articles(:post2)
    visit article_path(article)
    page.text.wont_include 'Delete'
  end

  scenario "delete an existing article as editor" do

    # Visit article show page and click delete button
    article = articles(:post1)
    sign_in(:editor)
    visit article_path(article)
    click_on 'Delete'

    # Verify article was deleted
    save_and_open_page
    page.text.must_include 'destroyed'

    # For test to pass, must run with $RAILS_ENV=test rake
    # Verify article no longer in index
    page.text.wont_include articles(:post1).title
  end
end
