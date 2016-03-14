source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', :github => 'rails/rails', :branch => 'master'#gecici  '5.0.0.beta1'
gem 'rails', '5.0.0.beta3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', github: "rails/coffee-rails"
# See https://github.com/rails/execjs#readme for more supported runtimes, to use omniauth
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', github: 'rails/turbolinks' #gecici
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem "devise", :github => 'plataformatec/devise', :branch => 'master'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
# sitepoint devise tutorial
gem 'bootstrap-sass'
gem 'jquery-turbolinks'
gem 'delayed_job_active_record'
gem 'foreman'
# sitepoint redis tutorial from 2015
#gem 'redis'
#gem 'redis-namespace'
#gem 'redis-rails'
#gem 'redis-rack-cache'
#actioncable
gem 'puma', '~> 2.16'
#gem 'actioncable', github: 'rails/actioncable'
group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
end
gem 'acts_as_commentable'
gem 'acts-as-taggable-on', :github => 'mbleigh/acts-as-taggable-on', :branch => 'master'
gem 'em-hiredis'
gem 'redis'
gem 'mocha'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem "fog-aws"
gem "mini_magick"
gem 'kaminari', :git => "git://github.com/amatsuda/kaminari.git", :branch => 'master'
gem 'searchkick'
gem "mailboxer", github: 'mailboxer/mailboxer'
gem "select2-rails"
gem 'pundit'
gem 'sprockets-rails', github: "rails/sprockets-rails"
gem 'font-awesome-rails'



# gem 'aws-sdk', '~> 1.6'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :production do
#  gem 'unicorn'
  gem 'pg'
end
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
