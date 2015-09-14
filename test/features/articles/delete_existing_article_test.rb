
require "test_helper"
feature "Delete Existing Article" do
  scenario "visitors don't see delete links" do
    visit articles_path
    page.text.wont_include 'Destroy'
    visit article_path(articles(:post1))
    page.text.wont_include 'Destroy'
  end

  scenario "author's don't see delete links" do
    sign_in(:author)
    visit articles_path
    page.text.wont_include 'Destroy'
    visit article_path(articles(:post1))
    page.text.wont_include 'Destroy'
  end

  scenario "author cannot delete another user's article" do
    sign_in(:author)

    # Visit article show page and click delete button
    article = articles(:post2)
    visit article_path(article)
    page.text.wont_include 'Destroy'
  end

  scenario "delete an existing article as editor" do
    sign_in(:editor)

    # Visit article show page and click delete button
    article = articles(:post1)
    visit article_path(article)
    click_on 'Destroy'

    # Verify article was deleted
    page.text.must_include 'destroyed'

    # For test to pass, must run with $RAILS_ENV=test rake
    # Verify article no longer in index
    page.text.wont_include articles(:post1).title
  end
end
