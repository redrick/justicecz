# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'justicecz/version'

Gem::Specification.new do |spec|
  spec.name          = "justicecz"
  spec.version       = Justicecz::VERSION
  spec.authors       = ["Andrej Antas"]
  spec.email         = ["andrej@antas.cz"]
  spec.summary       = %q{SDK for quering or.justice.cz}
  spec.description   = %q{SDK for quering or.justice.cz}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "faraday"
end
