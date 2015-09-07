require "test_helper"

feature "CanAccessWelcome" do
  scenario "is displaying welcome" do
    visit root_path
    page.must_have_content "About"
  end
end
