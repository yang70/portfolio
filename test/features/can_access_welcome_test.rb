require "test_helper"

feature "CanAccessWelcome" do
  scenario "is displaying correct content" do
    visit root_path
    page.must_have_content "About"
    page.must_have_content "Recent Blog Posts"
  end
end
