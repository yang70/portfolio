[![Build Status](https://travis-ci.org/yang70/portfolio.svg?branch=master)](https://travis-ci.org/yang70/portfolio)
# Portfolio - Matthew G. Yang

  <img src="https://s3-us-west-2.amazonaws.com/yangportfoliobucket/layoutpics/headshot.jpg" width="200">

By [Matthew Yang](http://www.matthewgyang.com).

## Description
**Portfolio** This is a portfolio Rails application

It includes a welcome page with links to features including the blog, journal and projects.

The journal includes a user sign up/authentication system by incorporating the [Devise gem](https://github.com/plataformatec/devise).

## Specifications

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

## Special Notes

Continuing to add the ability to make notes by modifying Rails scaffolding, see screenshot:

![Screenshot 1](app/assets/images/articles_screenshot.png)

Have added the ability to add image url's to the projects resource.

## Credit
**Styling The basic HTML structure and CSS is from a Zurb Foundation template located [here](http://foundation.zurb.com/templates/portfolio-theme.html)

These gem instructions were taken directly from the following github repos:

[minitest-rails](https://github.com/blowmage/minitest-rails)

[minitest-rails-capybara](https://github.com/blowmage/minitest-rails-capybara)

[minitest-reporters](https://github.com/kern/minitest-reporters)
