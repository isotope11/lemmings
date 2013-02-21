# Maintain your gem's version:
require File.expand_path('../lib/lemmings/version', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lemmings"
  s.version     = Lemmings::VERSION
  s.authors     = ["Josh Adams", "Adam Gamble"]
  s.email       = ["josh@isotope11.com", "agamble@isotope11.com"]
  s.homepage    = ""
  s.summary     = "Lemmings core logic"
  s.description = "Lemming game logic, implemented with actor model / per-lemming threads."

  s.require_paths = ["lib"]

  s.files = `git ls-files`.split($/)
  s.test_files = s.files.grep(%r{^(spec)/})

  s.required_ruby_version = '>= 1.9.3' # that's right.

  s.add_dependency 'celluloid'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'minitest-matchers'
  s.add_development_dependency 'turn'
  s.add_development_dependency 'mocha'
end
