source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'simplecov', require: false
  gem 'selenium-webdriver'
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'faker'
  gem "bullet"
end

gem 'rails', '~> 5.1.6'
gem 'pg', group: :production
gem 'web-console', group: :development
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'bootstrap', '~> 4.1.3'
gem 'chartkick'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'kaminari'
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'pygments.rb'
gem 'masonry-rails'
gem 'ransack'
gem 'redcarpet'
gem 'rack-cors'
gem 'spring'
gem 'spring-watcher-listen', '~> 2.0.0'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
