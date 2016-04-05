source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta2', '< 5.1'
gem 'sass-rails', '~> 5.0'
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
# NOTE: 以下のIssueのため
# releaseはされてないのでGitHubを直接見に行く
# https://github.com/amatsuda/kaminari/issues/774
gem 'kaminari', github: 'amatsuda/kaminari'
gem 'redis', '~> 3.0'
# NOTE: 下記PRがマージされるまではエラーが出るので、個人のブランチを使用
#  https://github.com/heroku/rails_stdout_logging/pull/20
gem 'rails_stdout_logging', github: 'kibitan/rails_stdout_logging', branch: 'compatible_rails5'
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'

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
