require "test_helper"

feature "CreatingNewArticle" do
  scenario "Create a new article, reroute to display" do
    # Visit the new article page
    visit new_article_path

    # Fill in blanks with text and submit
    fill_in 'Title', with: 'Created a test article'
    fill_in 'Body', with: 'Created body for test article'
    click_button 'Create Article'

    # Confirm reroute to new post and it's contents
    page.text.must_include 'Article was successfully created'
    page.text.must_include 'Created a test article'

    # Confirm post attributes the author
    page.has_css? ".author"
    page.text.must_include users(:ruby).email
  end
end
