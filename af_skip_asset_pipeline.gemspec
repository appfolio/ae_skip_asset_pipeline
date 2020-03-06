# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ae_skip_asset_pipeline/version"

Gem::Specification.new do |spec|
  spec.name          = 'ae_skip_asset_pipeline'
  spec.version       = AeSkipAssetPipeline::VERSION
  spec.authors       = ["Appfolio"]

  spec.summary       = %q{Skip asset pipeline in tests}
  spec.description   = %q{Skip asset pipeline in tests}

  spec.files         = Dir['{app,lib}/**/*']
  spec.require_paths = ["lib"]

  spec.add_dependency 'actionview'
end
