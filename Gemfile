source 'http://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug-base19x', '>= 0.11.30.pre10'
  gem 'ruby-debug-ide', '>= 0.4.17.beta14'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
end
group :test do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
end
group :production do
#  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer' ,:platforms => :ruby              
  gem 'sass-rails'#, "  ~> 3.1.0"
  gem 'coffee-rails'#, "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'
