source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', github: 'rails/rails', branch: 'master'
gem 'jquery-rails'
gem 'compass-rails', github: 'Compass/compass-rails', branch: 'master'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'puma'
gem 'therubyracer'
gem 'less-rails', git: 'git://github.com/metaskills/less-rails.git'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'autoprefixer-rails'
gem 'bootstrap-generators', '~> 3.3.4'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'simple_form'
gem 'mysql2', '~> 0.3.13'
gem 'redcarpet'
gem 'rails_12factor'
gem 'gemoji'
gem 'slack-api'
gem 'browserify-rails'
gem 'react-rails'
gem 'kaminari'
# NOTE: rails_serve_static_assets は rails_12factor の依存gemなので指定する必要は無いが、
#  v0.0.4 では rails5 に対応したコミットが含まれていないため master を指定
#  refs: https://github.com/heroku/rails_serve_static_assets/commit/4c187a8c36019dfa84704ce0e35efef859a516dc
gem 'rails_serve_static_assets', github: 'heroku/rails_serve_static_assets', branch: 'master'


group :development, :test do
  gem 'annotate'
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'spring'
  gem 'rspec'
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'rubocop', require: false
  gem 'hirb'
  gem 'hirb-unicode'
end

group :development do
  gem 'web-console', '~> 3.0'
end
