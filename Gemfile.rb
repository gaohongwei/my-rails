# Gemfile



# Added by Gaohong Wei
gem 'bcrypt' # Use ActiveModel has_secure_password
gem 'jwt'
gem 'devise'
gem 'cancancan'
gem 'pundit'
gem 'faraday'
gem 'rest-client'
gem 'awesome_print', require: true

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'byebug', platform: :mri

end


group :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end