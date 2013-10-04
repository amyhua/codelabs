source 'http://rubygems.org'

gem 'rails', '3.2.14'
gem 'simple_form'
gem 'font-awesome-rails'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'


# Bundle the extra gems:
gem 'sorcery', '0.7.4'
gem 'jquery-rails'
# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'anjlab-bootstrap-rails', '>= 3.0.0.0', :require => 'bootstrap-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
group :development, :test do
  gem 'sqlite3'
  gem "test-unit", "~> 2.3.0"
  gem "rspec", "~> 2.5.0"
  gem 'rspec-rails', "~> 2.5.0"
end
group :production do
  gem 'pg'
end