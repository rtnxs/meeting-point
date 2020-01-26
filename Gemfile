source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'carrierwave'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'devise'
gem 'devise-i18n'
gem 'fog-aws'
gem 'pundit'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.1'
gem 'rails-i18n', '~> 6.0.0'
gem 'rmagick'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'pundit-matchers', '~> 1.6.0'
  gem 'rspec-rails', '~> 3.4'
  gem 'sqlite3', '~> 1.4'
  gem 'simplecov'
end

group :development do
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.6'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
