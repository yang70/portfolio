
require "test_helper"

feature "DeleteExistingArticle" do
  scenario "delete an existing article" do

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
