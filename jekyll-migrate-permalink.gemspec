# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/migrate/permalink/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-migrate-permalink"
  spec.version       = Jekyll::Migrate::Permalink::VERSION
  spec.authors       = ["Max Chadwick"]
  spec.email         = ["mpchadwick@gmail.com"]

  spec.summary       = %q{A custom Jekyll command to help deal with side effects of changing your permalink}
  spec.homepage      = "https://github.com/mpchadwick/jekyll-migrate-permalink"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
