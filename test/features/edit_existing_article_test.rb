require "test_helper"

feature "EditExistingArticle" do
  scenario "edit an existing article" do
    # Visit the index page and click the edit button of existing article
    article = articles(:post1).id
    visit article_path(article)
    click_on 'Edit'

    # Fill in a blank with new info and submit
    fill_in 'Title', with: 'My edited article'
    click_on 'Update Article'

    # Verify new info was added to the post
    page.text.must_include 'Article was successfully updated'
    page.text.must_include 'My edited article'
  end
end
