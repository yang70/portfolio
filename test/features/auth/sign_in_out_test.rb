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

  scenario "sign in with twitter works" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:twitter,
                            {
                              uid: '12345',
                              info: { nickname: 'test_twitter_user' },
                              })
    visit new_user_session_path
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]

    click_on "Sign in with Twitter"
    page.must_have_content "test_twitter_user, you are signed in!"
  end
end
