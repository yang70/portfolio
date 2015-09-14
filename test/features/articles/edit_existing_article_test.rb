require "test_helper"

feature "Editing as an author" do
  scenario "author can edit their own article" do
    sign_in(:author)

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

  scenario "author can't edit other people's articles" do
    sign_in(:author)

    # Visit the index page and click the edit button of existing article
    article = articles(:post2).id
    visit article_path(article)
    page.text.wont_include "Edit"
  end
end

feature "Editing articles as an editor" do
  scenario "editors can edit other author's articles" do
    sign_in(:editor)
    article = articles(:post1)
    visit article_path(article)
    click_on "Edit"
    fill_in "Title", with: "Edited title"
    click_on "Update Article"
    page.text.must_include "Article was successfully updated"
    page.text.must_include "Edited title"
  end

  scenario "editors can edit their own articles" do
    sign_in(:editor)
    article = articles(:post2)
    visit article_path(article)
    click_on "Edit"
    fill_in "Title", with: "Edited title"
    click_on "Update Article"
    page.text.must_include "Article was successfully updated"
    page.text.must_include "Edited title"
  end
end

feature "Visitors will not see edit links, cannot visit edit path" do
  scenario "visitors cannot see edit links on index or show" do
    visit articles_path
    page.text.wont_include "Edit"
    first(:link, "View").click
    page.text.wont_include "Edit"
  end

  scenario "visitor cannot visit the edit path for an article directly" do
    visit edit_article_path(articles(:post1))
    page.text.must_include "You need to sign in or sign up before continuing."
  end
end
