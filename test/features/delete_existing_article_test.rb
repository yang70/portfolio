require "test_helper"

feature "DeleteExistingArticle" do
  scenario "delete an existing article" do
    # puts page.methods.sort
    # Create an article
    Article.create(title: 'Article for deletion', body: 'Delete this too')

    # Visit articles page and click delete button
    visit articles_path
    assert find('p', :last).has_content?, 'Destroy'
    first(:link, 'Destroy').click

    # Verify article was deleted
    # find('body').has_content? 'destroyed'

    # Verify article no longer in index
    # page.text.wont_include 'Article for deletion'
  end
end
