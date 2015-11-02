# require 'test_helper'

# feature "non logged in visitor and other authors cannot see pending commments" do
#   scenario "verify comment there for editor" do
#     sign_in(:editor)
#     visit article_path(articles(:post4))
#     page.text.must_include "Test comment"
#   end

#   scenario "non logged in visitors cannot see pending comments" do
#     visit article_path(articles(:post4))
#     page.text.wont_include "Test comment"
#   end

#   scenario "other authors cannot see pending comments" do
#     sign_in(:author)
#     visit article_path(articles(:post4))
#     page.text.wont_include "Test comment"
#   end
# end
