require "test_helper"

feature "CanAccessWelcome" do
  scenario "is displaying correct content" do
    visit root_path
    page.must_have_content "Blog"
    page.must_have_content "Projects"
  end
end
