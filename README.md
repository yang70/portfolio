[![Build Status](https://travis-ci.org/yang70/portfolio.svg?branch=master)](https://travis-ci.org/yang70/portfolio)
[![Coverage Status](https://coveralls.io/repos/yang70/portfolio/badge.svg?branch=master&service=github)](https://coveralls.io/github/yang70/portfolio?branch=master)

# Portfolio - A Ruby on Rails application

  <img src="https://s3-us-west-2.amazonaws.com/yangportfoliobucket/layoutpics/headshot.jpg" width="200">

By [Matthew Yang](http://www.matthewgyang.com).

## Special Notes

This projects is still very much in progress, especially the styling!  It is being pushed out in order to get a presence on the web established.

## Description
**Portfolio**

This Rails application includes a welcome page with general information about the author, plus links to current projects, blog with comments (and comment approval system), resume and contact information.

The blog incorporates a user sign up/authentication/authorization system including sign up via Twitter (OmniAuth) by incorporating the following gems:

* [Devise](https://github.com/plataformatec/devise)
* [Pundit](https://github.com/elabs/pundit)
* [Omniauth-Twitter](https://github.com/arunagw/omniauth-twitter)

## Testing

App was created without the default test suite with this command:

```console
rails new portfolio --skip-test-unit
```

Then the following gems were added to the gem file for minitest and capybara:

```ruby
gem "minitest-rails"
```

```console
rails generate minitest:install
```

```ruby
group :test do
  gem "minitest-rails-capybara"
end
```

**Then the following was added to `test/test_helper.rb`**

```ruby
require "minitest/rails/capybara"
```

For colorful tests, added:

```ruby
require "minitest/reporters"
Minitest::Reporters.use!
```

Automatically run rubocop on the project when rake invoked with this line:
```ruby
system 'rubocop'
```

There is a functioning feature test suite that is currenlty passing.

Continuous integration has been implemented with Travis-CI, including adding a status badge to the top of this README

Test coverage is now documented with [SimpleCov](https://github.com/colszowka/simplecov)

Test coverage badge on this README from [COVERALLS](https://coveralls.io/)

## Credit
**Styling The basic HTML structure and CSS is from a Zurb Foundation template located [here](http://foundation.zurb.com/templates/portfolio-theme.html)

These gem instructions were taken directly from the following github repos:

[minitest-rails](https://github.com/blowmage/minitest-rails)

[minitest-rails-capybara](https://github.com/blowmage/minitest-rails-capybara)

[minitest-reporters](https://github.com/kern/minitest-reporters)
