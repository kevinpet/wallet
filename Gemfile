source 'http://rubygems.org'

gem 'rails', '3.1.4'
gem "bcrypt-ruby", :require => "bcrypt"
gem 'jquery-rails'

group :development, :test do
  gem 'sqlite3'
end
  
group :development do
  gem 'nifty-generators'
end

group :test do
  gem 'turn', :require => false
  gem 'mocha'
  gem 'minitest'
  gem 'jasmine'
end

group :production do
  gem 'pg'
#  gem 'activerecord-postgresql-adapter'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
