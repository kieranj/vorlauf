$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vorlauf/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "vorlauf"
  s.version       = Vorlauf::VERSION
  s.authors       = ["Kieran Johnson"]
  s.email         = ["hello@invisiblelines.com"]
  s.homepage      = "http://www.invisiblelines.com"
  s.summary       = "Beer recipe emulator/tools"
  s.description   = s.summary

  s.files         = Dir['Gemfile', 'README.md', 'Rakefile', 'lib/**/*']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'virtus'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'rb-inotify'
  s.add_development_dependency 'rb-fsevent'
end
