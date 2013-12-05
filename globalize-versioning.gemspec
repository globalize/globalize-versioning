Gem::Specification.new do |s|
  s.name         = 'globalize-versioning'
  s.version      = '4.0.0.alpha.1'
  s.authors      = ['Sven Fuchs', 'Josh Adams', 'Philip Arndt', 'Chris Salzberg']
  s.email        = 'nobody@globalize-rails.org'
  s.homepage     = 'http://github.com/globalize/globalize-versioning'
  s.summary      = 'Rails I18n de-facto standard library for ActiveRecord model/data translation'
  s.description  = "#{s.summary}."
  s.license      = "MIT"

  s.files        = Dir['{lib/**/*,[A-Z]*}']
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'

  s.add_dependency 'globalize',    '>= 4.0.0.alpha.3'

  s.add_dependency 'paper_trail',  '~> 3.0.0.beta'

  s.add_development_dependency 'database_cleaner', '>= 1.2.0'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-colorize'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rdoc'

  s.add_development_dependency 'rake'
end
