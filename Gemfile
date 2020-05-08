# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.6'

gem 'activeadmin', github: 'activeadmin/activeadmin'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'autoprefixer-rails'
gem 'cloudinary'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'figaro'
gem 'font-awesome-sass'
gem 'friendly_id', '~> 5.2.4'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'jbuilder', '~> 2.5'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.4'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'turbolinks_render'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker', '~> 3.5'

group :development, :test do
  gem 'pry-byebug'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'rails-controller-testing', group: [:test]
gem 'rspec-rails', group: [:test]
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
