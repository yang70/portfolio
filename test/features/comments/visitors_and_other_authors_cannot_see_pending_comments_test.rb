require 'test_helper'

feature "non logged in visitor and other authors cannot see pending commments" do
  scenario "non logged in visitors cannot see pending comments" do
    visit article_path(articles(:post1))
    page.text.wont_include "Test comment"
  end

  scenario "other authors cannot see pending comments" do
    sign_in(:author)
    visit article_path(articles(:post2))
    page.text.wont_include "Editor test comment"
    page.text.wont_include "Pending"
  end
end
