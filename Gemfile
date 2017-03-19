source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'devise', '~> 4.2.0'

gem 'foundation-rails', '~> 6.3.0.0'
gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sassc-rails', '~> 1.3.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'execjs'
gem 'therubyracer', platforms: :ruby
gem 'jquery-ui-rails', '~> 4.2.1'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'activeadmin', '~> 1.0.0.pre4'
gem 'inherited_resources', git: 'https://github.com/activeadmin/inherited_resources'
gem 'geocoder'
gem 'pg'
gem "paperclip", "~> 5.0.0"
gem 'aws-sdk', '~> 2.3'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
