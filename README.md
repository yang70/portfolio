# Personal Website - A Ruby on Rails application

[![Build Status](https://travis-ci.org/yang70/portfolio.svg?branch=master)](https://travis-ci.org/yang70/portfolio)
[![Coverage Status](https://coveralls.io/repos/yang70/portfolio/badge.svg?branch=master&service=github)](https://coveralls.io/github/yang70/portfolio?branch=master)

By [Matthew Yang](http://www.matthewgyang.com).

## Description
This repository is an ongoing project that was created for a couple reasons:

1. To establish a personal website and presence on the web.
2. As a 'playground' to test out different technologies and methods.

As much as I've tried to keep it updated, there are many areas that need to be cleaned up, refactored and ultimately changed as my experience with Rails (and web development in general) has increased.

Below, I'll try to explain some of the features and techniques that have been incorporated into the application.

## Authentication / Authorization
Basic authentication is implemented with a standard [Devise](https://github.com/plataformatec/devise) integration.

Policies and scope are configured using [Pundit](https://github.com/elabs/pundit), and depend on a user's role (basic user, editor, guest author)

New user's have the option of registering using their Twitter account which was implemented using [Omniauth-Twitter](https://github.com/arunagw/omniauth-twitter).

## Mailers

`ActionMailer` is configured to alert the editor of various events with the site, including new user registration and comments.  Email configured in Heroku deployment with the add on [SendGrid](https://sendgrid.com/)

Future plans include moving this action to a background job.

## Picture Upload

Picture uploading to articles was enabled with the [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) gem.  It is configured to upload to AWS S3.

Future plans include allowing users to crop an image after upload using something like [Carrierwave Crop](https://github.com/kirtithorat/carrierwave-crop/), or I might switch to [Paperclip](https://github.com/thoughtbot/paperclip) and [Papercrop](https://github.com/rsantamaria/papercrop).

## Remote JavaScript (RJS)
The projects sections has been created as a single page application (SPA) by incorporating AJAX calls and jQuery using Rails convention.  CRUD action links updated by adding `remote: true` and creating the correct response logic in the controller to respond to html or javascript accordingly.  Then specific javascript 'views' were created, which are just jQuery statements.

## Styling
Styling is my self admitted "weak spot", and I'm working hard to make it a strength!  I started this site by using the [Zurb Foundation](http://foundation.zurb.com/) framework, but have recently swapped it out for [Bootstrap](http://getbootstrap.com/) which I personally find more intuitive.  Additionally there seem to be more resources available for questions/answers.

Ideally, I would like to minimally rely on a framework and institute original styling on my own, which would be future goal.

## Testing
Feature tests are implemented using [Minitest Rails Capybara](https://github.com/blowmage/minitest-rails-capybara) and the corresponding Capybara DSL language.  Example of a Capybara feature test:

```ruby
require "test_helper"

feature "CanAccessWelcome" do
  scenario "is displaying correct content" do
    visit root_path
    page.must_have_content "About"
    page.must_have_content "Recent Blog Posts"
  end
end
```
### Minitest Reporters
Added [Minitest Reporters gem](https://github.com/kern/minitest-reporters) to add a some color and separation to tests.  Here's a [lightning talk](https://www.youtube.com/watch?v=lPu1GwS5QU0&list=PLgUnlWmteg8rV6qFZTs8xjpJVNGv1qt_s&index=41) I gave on the different options.

### Continuous Integration
Continuous integration has been implemented with Travis-CI

### Test Coverage

Test coverage badge on this README from [COVERALLS](https://coveralls.io/)