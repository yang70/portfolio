require 'simplecov'
SimpleCov.start
require 'coveralls'
Coveralls.wear!
Rails.env = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ActiveSupport::TestCase
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end

def sign_in(role = :editor)
  # Log in authorized user
  visit new_user_session_path
  fill_in "Email", with: users(role).email
  fill_in "Password", with: "password"
  click_on "Log in"
end

def create_comment(role = :author)
  sign_in(role)
  visit article_path(articles(:post1))
  fill_in "comment_content", with: "Test comment"
  click_on "Sign Out"
end

system 'rubocop'
