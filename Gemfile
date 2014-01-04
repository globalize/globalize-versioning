source 'https://rubygems.org'

# once these versions of globalized are released, we can remove this
if ENV['RAILS_3']
  gem 'globalize', github: 'globalize/globalize', branch: 'gut_versioning_3-0'
end

gemspec

# Per https://github.com/bmabey/database_cleaner/issues/224
gem 'database_cleaner', github: 'bmabey/database_cleaner', branch: 'master'

group :test do
  gem 'pry'
  gem 'pry-nav'
end
