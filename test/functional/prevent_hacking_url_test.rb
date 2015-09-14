# require "test_helper"

# feature "Authors can't hack URL to publish post or change role" do
#   scenario "Author cannot post directly to create with publish true" do
#     sign_in(:author)
#     post :create, articles: {title: "Direct post", body: "test body"}
#     save_and_open_page
#   end
# end
