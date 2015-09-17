require 'test_helper'

feature "as an editor I can visit an article and see/approve comments" do
  scenario "as editor, visit article and see pending comments, approve" do
    sign_in(:editor)
    visit article_path(articles(:post1))
    page.text.must_include "Test comment"
    page.text.must_include "Pending"
    click_on "Approve comment"
    page.text.must_include "Comment was approved!"
    page.text.wont_include "Pending"
  end
end
