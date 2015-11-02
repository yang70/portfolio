# require "test_helper"

# feature "verify mailers working for comments" do
#   scenario "approving a comment sends article author a notification email" do
#     sign_in(:editor)
#     visit article_path(articles(:post4))
#     first("input[type='checkbox']").set(true)
#     click_on "Update"
#     ActionMailer::Base.deliveries.last.to.first.must_equal "author@example.com"
#     ActionMailer::Base.deliveries.last.parts.first.body.raw_source.must_include 'Your article titled "Post to check comments" at matthewgyang.com has a new comment!'
#   end
# end
