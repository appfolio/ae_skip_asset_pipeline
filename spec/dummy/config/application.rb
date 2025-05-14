# frozen_string_literal: true

# Set up gems listed in the Gemfile.
require 'action_controller'
require 'rails'
require 'webpacker'
require 'sprockets/rails'

module AeSkipAssetPipelineApp
  class Application < Rails::Application
    config.load_defaults "#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}"
    config.root = File.expand_path('../', __dir__)
    config.assets.precompile += ['image_of_thing.gif', 'things/stuff.css', 'things/stuff.js']
  end
end
