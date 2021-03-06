source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Devise gem provide to a flexible authentication
gem 'devise', '~> 4.4', '>= 4.4.3'

# Use Omniauth Facebook plugin
gem 'omniauth-amazon'

# Use Omniauth Github plugin
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'

# Use Omniauth Google plugin
gem 'omniauth-google-oauth2', '~> 0.4.1'

# Carrierwavwe gem provides a simple and extremely flexible way to upload files from Ruby applications
gem 'carrierwave', '~> 1.2', '>= 1.2.2'

# Minimagik gem is used to manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
gem 'mini_magick', '~> 4.8'

# Tast Rails gem is a plugin for flash messages
gem 'toastr_rails'

# Acts-as-taggable-ongem is used to manipulate tags
gem 'acts-as-taggable-on', :git => 'https://github.com/mbleigh/acts-as-taggable-on'

#
gem 'activeadmin'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Use capybara for test in frotend
  gem 'capybara', '~> 2.13'

  # selenium driver for capybara
  gem 'selenium-webdriver'

  # Use RSpec for unit tests
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  # user Factory bot for ese manitain datatabase
  gem "factory_bot_rails", "~> 4.0"

  # Guard::RSpec allows to automatically & intelligently launch specs when files are modified
  gem 'guard-rspec'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # use cucumber for acceptance tests
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
