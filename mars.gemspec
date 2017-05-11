# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mars/version'

Gem::Specification.new do |spec|
  spec.name          = "mars"
  spec.version       = Mars::VERSION
  spec.authors       = ["Albina Halenkova"]
  spec.email         = ["Albina_Halenkova1@epam.com"]
  spec.summary       = %q{Calculation point position of rovers on Mars}

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
