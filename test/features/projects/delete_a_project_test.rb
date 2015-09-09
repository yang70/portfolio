require "test_helper"

feature "Delete A Project" do
  scenario "delete an existing project" do
    visit project_path(projects(:project1))

    click_on "Destroy"

    page.text.must_include "Success! Project was destroyed."
  end
end
