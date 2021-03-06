require "test_helper"

feature "Creating New Article as an author" do
  scenario "Create a new article, reroute to display" do
    sign_in(:author)

    # Visit the new article page
    visit new_article_path

    # Fill in blanks with text and submit
    fill_in 'Title', with: 'Created a test article'
    fill_in 'Body', with: 'Created body for test article'
    click_button 'Create Article'

    # Confirm reroute to new post and it's contents
    page.text.must_include 'Article was successfully created'
    page.text.must_include 'Created a test article'
    page.text.must_include 'Status: Unpublished'

    # Confirm post attributes the author
    page.has_css? ".author"
    page.text.must_include users(:author).email
  end
end

feature "Visitors cannot create articles" do
  scenario "visitors do not see new article button" do
    visit articles_path
    page.wont_have_link "New Article"
  end

  scenario "visitors cannot visit new_article_path" do
    visit new_article_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end
end

feature "Creating an article as an editor" do
  scenario "editors can create a new article" do
    sign_in(:editor)
    visit new_article_path
    fill_in "Title", with: "Test publish title"
    fill_in "Body", with: "Test publish body"
    click_on "Create Article"
    page.text.must_include "Test publish title"
  end
end
