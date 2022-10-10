source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Simple wrapper for safely handling passwords
gem "bcrypt", "~> 3.1.7"
# Faster booting ruby/rails apps
gem "bootsnap", require: false
# Font-Awesome web fonts and stylesheets
gem "font-awesome-rails"
# Wrapper for Gravatar URLs
gem "gravtastic"
# Manage modern JavaScript in Rails without transpiling or bundling
gem "importmap-rails"
# Creating JSON sructures
gem "jbuilder"
# HTTP 1.1 server for Ruby/Rack applications
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
# Rack-based asset packaging system that concatenates and serves JavaScript, CoffeeScript, CSS, Sass, and SCSS
gem "sprockets-rails"
# Modest JavaScript framework for the HTML
gem "stimulus-rails"
# Speed of a single-page web application without having to write any JavaScript
gem "turbo-rails"
# Rails way to harness the power of SQL "EXISTS" statement
gem "where_exists"

group :development, :test do
  # Debugger
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # SQLite3 database engine
  gem "sqlite3", "~> 1.4"
end

group :development do
  # Debugging tool
  gem "web-console"
end

group :test do
  # Integration testing tool for rack based web applications
  gem "capybara"
  # The W3C WebDriver protocol to automate popular browsers for testing
  gem "selenium-webdriver"
  # Runing Selenium tests more easily with install and updates for all supported webdrivers
  gem "webdrivers"
end

group :production do
  # Ruby interface to the PostgreSQL RDBMS
  gem "pg"
end
