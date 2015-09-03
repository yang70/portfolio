require "test_helper"

feature "DeleteExistingArticle" do
  scenario "delete an existing article" do
    # Create an article
    article = Article.create(title: 'Article for deletion', body: 'Delete this too')

    # Visit article page and click delete button
    visit article_path(article)
    click_link 'Destroy'

    # Verify article was deleted
    page.text.wont_include 'Article for deletion'
  end
end
