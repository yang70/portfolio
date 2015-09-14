# require "test_helper"

# feature "As a new user, successfully sign up" do
#   scenario "sign up" do
#     # given a registration form
#     visit '/'
#     click_on 'Sign Up'

#     # when I register with valid info
#     fill_in "Email", with: "test@example.com"
#     fill_in "Password", with: "password"
#     fill_in "Password confirmation", with: "password"
#     click_on "Sign up"

#     # then I should be signed up
#     page.must_have_content "Welcome! You have signed up successfully"
#     page.wont_have_content "There was a problem with you sign up"
#   end
# end
