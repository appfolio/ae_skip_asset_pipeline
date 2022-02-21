# frozen_string_literal: true

require 'test_helper'

class AeSkipAssetPipelineTest < Minitest::Test
  class TestClass < ActionView::Base
    include AeSkipAssetPipeline
    include AeSkipAssetPipeline::HelperMethods

    def initialize(one, two, three); end
  end

  def test_that_it_has_a_version_number
    refute_nil AeSkipAssetPipeline::VERSION
  end

  def test_asset_pipeline_methods__enabled
    AeSkipAssetPipeline.enabled = true

    assert_nil test_class.javascript_pack_tag(*args)
    assert_nil test_class.javascript_packs_with_chunks_tag(*args)
    assert_nil test_class.javascript_include_tag(*args)
    assert_nil test_class.stylesheet_pack_tag(*args)
    assert_nil test_class.stylesheet_packs_with_chunks_tag(*args)
    assert_nil test_class.stylesheet_link_tag(*args)
    assert_equal 'super with source: abc options: {:skip_pipeline=>true}', test_class.path_to_asset('abc')
  end

  def test_asset_pipeline_methods__disabled
    AeSkipAssetPipeline.enabled = false

    assert_equal 'super with args: [4, 5, 6]', test_class.javascript_pack_tag(*args)
    assert_equal 'super with args: [4, 5, 6]', test_class.javascript_packs_with_chunks_tag(*args)
    assert_equal 'super with args: [4, 5, 6]', test_class.javascript_include_tag(*args)
    assert_equal 'super with args: [4, 5, 6]', test_class.stylesheet_pack_tag(*args)
    assert_equal 'super with args: [4, 5, 6]', test_class.stylesheet_packs_with_chunks_tag(*args)
    assert_equal 'super with args: [4, 5, 6]', test_class.stylesheet_link_tag(*args)
    assert_equal 'super with source: abc options: {:skip_pipeline=>false}', test_class.path_to_asset('abc')
  end

  def test_helper_methods
    AeSkipAssetPipeline.enabled = true

    test_class.save_current_state_and_set_asset_pipeline_enabled(true)

    assert_predicate test_class.instance_variable_get(:@current_skip_status), :present?
    assert_predicate AeSkipAssetPipeline.enabled, :blank?

    test_class.restore_old_state_of_asset_pipeline_enabled

    assert_predicate AeSkipAssetPipeline.enabled, :present?

    test_class.with_asset_pipeline_enabled(true) { nil }

    assert_predicate test_class.instance_variable_get(:@current_skip_status), :present?
    assert_predicate AeSkipAssetPipeline.enabled, :present?
  end

  private

  def test_class
    @test_class ||= TestClass.new(1, 2, 3)
  end

  def args
    @args ||= [4, 5, 6]
  end
end
