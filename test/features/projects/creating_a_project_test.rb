# require "test_helper"

# feature "Be able to create a new project" do
#   scenario "creating a new project" do
#     # Visit projects index
#     visit projects_path

#     # Start creating new project
#     click_on "New project"

#     fill_in 'Name', with: 'My project'
#     fill_in 'Technologies used', with: 'Rails, Ruby, Bootstrap, HTML, CSS, Javascript'
#     click_button 'Create Project'

#     # Verify project was created
#     page.text.must_include 'Project has been created'
#     assert page.has_css?(".notice"), "Expected flash notice, none found"
#     page.status_code.must_equal 200
#   end

#   scenario "attempt to create a new project but fail" do
#     # Visit projects index
#     visit projects_path

#     # Start creating new project
#     click_on "New project"

#     # Fill in name with invalid info
#     fill_in 'Name', with: 'a'
#     fill_in 'Technologies used', with: ''

#     # Attempt to save with invalie info
#     click_button 'Create Project'

#     # Verify error messages
#     current_path.must_match(/projects$/)
#     page.text.must_include "Project could not be saved"
#     page.text.must_include "Name is too short"
#     page.text.must_include "Technologies used can't be blank"
#   end
# end
