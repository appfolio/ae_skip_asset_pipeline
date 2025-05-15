# frozen_string_literal: true

ENV['RAILS_ENV'] = 'test'

require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end

if ENV['WITH_COVERAGE'] == 'true'
  require 'simplecov'
  SimpleCov.start do
    enable_coverage :branch
    add_filter %r{\A/spec}
  end
end

require 'logger' # Due to issue with activesupport / concurrent-ruby

require File.expand_path('../spec/dummy/config/environment.rb', __dir__)

require 'ae_skip_asset_pipeline'
require 'debug'
require 'rspec'
require 'rspec/rails'
