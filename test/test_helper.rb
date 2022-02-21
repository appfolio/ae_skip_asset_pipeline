# frozen_string_literal: true

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
    add_filter %r{\A/test}
  end
end

require 'ae_skip_asset_pipeline'
require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/minitest'

require 'action_view'

MiniTest::Reporters.use! unless ENV['RM_INFO']

module ActionView
  class Base
    def javascript_pack_tag(*args)
      super
      "super with args: #{args}"
    end

    def javascript_packs_with_chunks_tag(*args)
      super
      "super with args: #{args}"
    end

    def javascript_include_tag(*args)
      super
      "super with args: #{args}"
    end

    def stylesheet_pack_tag(*args)
      super
      "super with args: #{args}"
    end

    def stylesheet_packs_with_chunks_tag(*args)
      super
      "super with args: #{args}"
    end

    def stylesheet_link_tag(*args)
      super
      "super with args: #{args}"
    end

    def path_to_asset(source, options={})
      super
      "super with source: #{source} options: #{options}"
    end
  end
end
