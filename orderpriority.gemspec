# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orderpriority/version'

Gem::Specification.new do |spec|
  spec.name          = "orderpriority"
  spec.version       = Orderpriority::VERSION
  spec.authors       = ["manishankar"]
  spec.email         = ["manishankar2@gmail.com"]
  spec.summary       = %q{Simple way to Prioritize Active Record Ordering}
  spec.description   = %q{Order Active Record by priority is made easy by simple key value pair input ,also maintaining Order Method Chain}
  spec.homepage      = "https://github.com/manishankar2/order_priority"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'activerecord', '>= 3.0'
end
