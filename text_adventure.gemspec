# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'text_adventure/version'

Gem::Specification.new do |spec|
  spec.name          = "text_adventure"
  spec.version       = TextAdventure::VERSION
  spec.authors       = ["Christian Simon"]
  spec.email         = ["simon@swine.de"]

  spec.summary       = %q{A new text adventure}
  spec.description   = %q{A new text adventure}

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
