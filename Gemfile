source 'https://rubygems.org'

gem 'bootstrap', '~> 4.3', '>= 4.3.1'
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'
gem 'autoprefixer-rails'
# Allows table pagination
# gem 'will_paginate-bootstrap4'
# gem 'will_paginate', '~> 3.1.0'

# Add Datepicker from Bootstrap
gem 'bootstrap-datepicker-rails'
# Provides cross-browser animations
gem 'animate.css-rails', '~> 3.2.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.10'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bcrypt', '3.1.12'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# for login authentication
gem 'devise'

gem 'activerecord-session_store'

gem 'dotenv-rails'
#for 3rd party authentication
gem 'omniauth'

# User Authentication with Facebook
gem 'omniauth-facebook'

#Paypal SDK
gem 'paypal-checkout-sdk'

#To schedule things
gem 'delayed_job_active_record'
gem 'daemons'

#use cucumber
group :test, :development do
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'simplecov', :require => false
end
#use capybara
gem 'capybara'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.13'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
group :production do
  gem 'pg', '~> 0.21' # for Heroku deployment
  gem 'rails_12factor' #important
end
