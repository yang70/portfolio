require "test_helper"

feature "EditExistingArticle" do
  scenario "edit an existing article" do
    # Create a new article
    article = Article.create(title: 'My new article', body: 'Body of my new article')

    # Visit the index page and click the edit button
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
