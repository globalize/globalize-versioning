source 'https://rubygems.org'

gemspec

if ENV['RAILS'] == '3.2'
  gem 'activerecord', '~> 3.2.0'
  gem 'activemodel', '~> 3.2.0'
  gem 'globalize', '~> 3.0.4'
elsif ENV['RAILS'] == '4.0'
  gem 'activerecord', '~> 4.0.0'
  gem 'activemodel', '~> 4.0.0'
  gem 'globalize', '~> 4.0'
elsif ENV['RAILS'] == '4.1'
  gem 'activerecord', '~> 4.1.0'
  gem 'activemodel', '~> 4.1.0'
  gem 'globalize', '~> 4.0'
elsif ENV['RAILS'] == '4.2'
  gem 'globalize', '~> 5.0'
  gem 'paper_trail', '4.0.0.beta2'
else # Rails 5.1
  # The master of globalize currently supports rails 5
  gem 'globalize', github: 'globalize/globalize'
  gem 'paper_trail', '~> 7.1.3'
end
