require "test_helper"

feature "Sign In and Out" do
  scenario "sign in a user and sign out" do
    visit new_user_session_path
    fill_in "Email", with: "author@example.com"
    fill_in "Password", with: "password"
    click_on "Log in"
    page.text.must_include "Signed in successfully."
    click_on "Sign Out"
    page.text.must_include "Signed out successfully"
  end
end
