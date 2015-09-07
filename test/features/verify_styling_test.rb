require "test_helper"

feature "VerifyStyling" do
  scenario "check for evidence of foundation use" do
    visit root_path
    page.html.must_include "columns"
    page.html.must_include "row"
  end
end
