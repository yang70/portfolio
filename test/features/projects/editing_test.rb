# require "test_helper"

# feature "Editing an existing project" do
#   scenario "visit the index and edit a project" do
#     # Visit existing project index
#     visit edit_project_path(projects(:project1))

#     # input new values and click update
#     fill_in "Name", with: "Updated name"
#     fill_in "Technologies used", with: "Updated technologies"
#     click_button "Update Project"

#     # verify new values were saved
#     page.text.must_include "Success"
#     page.text.must_include "Updated name"
#     page.text.must_include "Updated technologies"
#     page.text.wont_include "Fixture project 1"
#   end

#   scenario "incorrectly edit a project" do
#     # Visit existing project
#     visit edit_project_path(projects(:project1))

#     # Attempt to submit invalid values
#     fill_in "Name", with: "No"
#     fill_in "Technologies used", with: ''
#     click_button "Update Project"

#     # Change should not be saved, edit page should be rerendered
#     page.text.must_include "prohibited"
#     page.text.must_include "can't be blank"
#     page.text.must_include "Name is too short"
#   end
# end
