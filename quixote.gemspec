# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "quixote/version"

Gem::Specification.new do |s|
  s.name        = "quixote"
  s.version     = Quixote::VERSION

  s.authors     = ["Matt Sanders"]
  s.email       = ["matt@modal.org"]
  s.homepage    = "https://github.com/nextmat/quixote"
  s.summary     = %q{Simple stateful generator for time-series data}
  s.description = %q{}

  #s.rubyforge_project = "quixote"
  
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[LICENSE]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
