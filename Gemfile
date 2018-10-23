source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '~> 2.5.1'

gem 'rails', '~> 5.2.1'
gem 'pg', '~> 1.0'
gem 'puma', '~> 3.12'

gem 'active_model_serializers', '~> 0.10.7'
gem 'bootsnap', '~> 1.3', require: false
gem 'counter_culture', '~> 1.12'
gem 'devise', '~> 4.3'
gem 'dotenv-rails', '~> 2.5'
gem 'uglifier', '~> 4.1'
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'
gem 'factory_bot_rails', '~> 4.8'
gem 'faker', '~> 1.7', '>= 1.7.3'
gem 'rspec-rails', '~> 3.7'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'awesome_print', '~> 1.8'
gem 'better_errors', '~> 2.4'
gem 'binding_of_caller', '~> 0.8.0'
gem 'debug-extras'
gem 'listen', '>= 3.0.5', '< 3.2'
gem 'pry-rails'
gem 'web-console', '>= 3.3.0'
gem 'spring'
gem 'spring-watcher-listen', '~> 2.0.0'
gem 'sqlite3'