# frozen_string_literal: true

require_relative 'lib/ae_skip_asset_pipeline/version'

Gem::Specification.new do |spec|
  spec.name          = 'ae_skip_asset_pipeline'
  spec.version       = AeSkipAssetPipeline::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.author        = 'AppFolio'
  spec.email         = 'opensource@appfolio.com'
  spec.description   = 'GSkip asset pipeline in tests.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/appfolio/ae_skip_asset_pipeline'
  spec.license       = 'MIT'
  spec.files         = Dir['**/*'].select { |f| f[%r{^(lib/|LICENSE.txt|.*gemspec)}] }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('< 3.5')
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.add_dependency('activesupport', ['>= 7.2', '< 8.2'])
end
