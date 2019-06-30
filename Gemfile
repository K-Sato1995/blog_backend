source 'https://rubygems.org'

ruby '2.4.1'

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
  gem 'pry-rails'
  gem 'faker'
  gem 'bullet'
end

gem 'rails', '~> 5.2.3'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem "bootstrap", ">= 4.3.1"
gem 'chartkick'
gem 'jquery-rails'
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'rack-cors'
gem 'spring'
gem 'ransack'
gem 'spring-watcher-listen', '~> 2.0.0'
gem 'web-console', group: :development
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# GraphQL
# gem 'graphql'
# gem 'graphiql-rails'
