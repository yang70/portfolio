require 'test_helper'

feature "as an editor I can visit an article and see/approve comments" do
  scenario "as editor, visit article and see pending comments, approve" do
    sign_in(:author)
    visit article_path(articles(:post1))
    fill_in "Enter comment below", with: "Test comment"
    click_on "Create Comment"
    click_on "Sign Out"
    sign_in(:editor)
    visit article_path(articles(:post1))
    page.text.must_include "Test comment"
    page.text.must_include "Comment invisible until approved by an editor"
    first("input[type='checkbox']").set(true)
    click_on "Update"
    page.text.must_include "Comment was updated."
    page.text.wont_include "Comment invisible until approved by an editor"
  end
end
