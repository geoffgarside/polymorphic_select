# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "polymorphic_select/version"

Gem::Specification.new do |s|
  s.name        = "polymorphic_select"
  s.version     = PolymorphicSelect::VERSION
  s.authors     = ["Geoff Garside"]
  s.email       = ["geoff@geoffgarside.co.uk"]
  s.homepage    = "https://github.com/geoffgarside/polymorphic_select"
  s.summary     = %q{Rails 3.1 Polymorphic Select helpers}
  s.description = %q{Rails 3.1 Polymorphic Select view helpers and model support}

  s.rubyforge_project = "polymorphic_select"

  s.add_dependency "railties", "~> 3.1"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
