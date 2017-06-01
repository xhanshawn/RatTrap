# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rat_trap/version'

Gem::Specification.new do |spec|
  spec.name          = "rat_trap"
  spec.version       = RatTrap::VERSION
  spec.authors       = ["xhanshawn"]
  spec.email         = ["xhan@wpi.edu"]

  spec.summary       = "a cli tool for message pack files"
  spec.description   = "a cli tool to quickly access message pack files."
  spec.homepage      = "https://github.com/xhanshawn/RatTrap"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = ["rat"]
  spec.name          = "rat_trap"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "msgpack",   "~> 1.1"
  spec.add_dependency "commander", "~> 4.4"
end
