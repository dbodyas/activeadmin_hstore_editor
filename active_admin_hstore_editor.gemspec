# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_admin_hstore_editor/version'

Gem::Specification.new do |spec|
  spec.name          = "active_admin_hstore_editor"
  spec.version       = ActiveAdminHstoreEditor::VERSION
  spec.authors       = ["Bohdan Derevenets"]
  spec.email         = ["dbodyas@gmail.com"]

  spec.summary       = %q{hstore_editor extension for ActiveAdmin}
  spec.description   = %q{Integrate jQuery josdejong/jsoneditor plugin to ActiveAdmin}
  spec.homepage      = "https://github.com/dbodyas/active_admin_hstore_editor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "coffee-rails"
  spec.add_dependency "activeadmin", ">= 1.1", "< 3.a"
end
