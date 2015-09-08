require "test_helper"

feature "CanAccessWelcome" do
  scenario "is displaying welcome" do
    visit 'http://matthewgyang.com'
    page.must_have_content "About"
    page.must_have_content "Projects"
  end
end
