# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-runkeeper/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-runkeeper"
  s.version     = OmniAuth::RunKeeper::VERSION
  s.authors     = ["Masaki Ishihara"]
  s.email       = ["m.ishihara@gmail.com"]
  s.homepage    = "https://github.com/m4i/omniauth-runkeeper"
  s.summary     = %q{OmniAuth strategy for RunKeeper}
  s.description = s.summary

  s.rubyforge_project = "omniauth-runkeeper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.0'
  s.add_runtime_dependency 'multi_json', '>= 1.0.4'
end
