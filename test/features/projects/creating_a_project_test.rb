require "test_helper"

feature "Be able to create a new project" do
  scenario "creating a new project" do
    # Visit projects index
    visit projects_path

    # Start creating new project
    click_on "New project"

    fill_in 'Name', with: 'My project'
    fill_in 'Technologies used', with: 'Rails, Ruby, Bootstrap, HTML, CSS, Javascript'
    click_button 'Create Project'

    # Verify project was created
    page.text.must_include 'Project has been created'
    assert page.has_css?(".notice"), "Expected flash notice, none found"
    page.status_code.must_equal 200
  end
end
