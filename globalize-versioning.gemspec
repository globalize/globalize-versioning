# encoding: utf-8
require File.expand_path('../lib/globalize/versioning/version.rb', __FILE__)

Gem::Specification.new do |s|
  s.name         = 'globalize-versioning'
  s.version      = Globalize::Versioning::VERSION
  s.authors      = ['Philip Arndt', 'Chris Salzberg']
  s.email        = 'nobody@globalize-rails.org'
  s.homepage     = 'http://github.com/globalize/globalize-versioning'
  s.summary      = 'Adapter for using versioning gems with Globalize'
  s.description  = "Provides support for using versioning gems such as PaperTrail with Globalize."
  s.license      = "MIT"

  s.files        = Dir['{lib/**/*,[A-Z]*}']
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = 'globalize-versioning'

  s.add_dependency 'activerecord', '>= 3.2.0', '< 6'
  s.add_dependency 'activemodel', '>= 3.2.0', '< 6'
  s.add_dependency 'globalize', '>= 3.0.4', '< 6'

  s.add_dependency 'paper_trail',  '>= 3.0.0', '< 6'

  s.add_development_dependency 'database_cleaner', '>= 1.2.0'
  s.add_development_dependency 'minitest'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rdoc'

  s.add_development_dependency 'rake'
end
