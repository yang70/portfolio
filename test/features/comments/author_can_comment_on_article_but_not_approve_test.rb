require 'test_helper'

feature "author can comment on article but not approve the comment" do
  scenario "log in as author, visit an article and leave comment" do
    sign_in(:author)
    visit article_path(articles(:post1))
    fill_in 'Enter comment below', with: "I'm commenting!"
    click_on 'Create Comment'
    page.text.must_include "Comment submitted, must be approved by an editor."
    page.text.must_include "Pending"
  end
end
