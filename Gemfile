source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'commonmarker', '~> 0.23.2'
gem 'contentful', '~> 2.16'
gem 'dry-rails', '~> 0.4.0'
gem 'github-markup', '~> 4.0'
gem 'pagy', '~> 5.7'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.1'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rails-controller-testing', '~> 1.0'
  gem 'rspec-rails', '~> 5.0'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'rubocop', '~> 1.24'
  gem 'rubocop-rspec', '~> 2.7'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end
