# frozen_string_literal: true

require 'action_view'
require 'ae_skip_asset_pipeline/version'

module AeSkipAssetPipeline
  mattr_accessor :enabled

  def javascript_packs_with_chunks_tag(*args)
    super unless AeSkipAssetPipeline.enabled
  end

  def javascript_include_tag(*args)
    super unless AeSkipAssetPipeline.enabled
  end

  def stylesheet_packs_with_chunks_tag(*args)
    super unless AeSkipAssetPipeline.enabled
  end

  def stylesheet_link_tag(*args)
    super unless AeSkipAssetPipeline.enabled
  end

  def path_to_asset(source, options = {})
    super(source, options.merge(skip_pipeline: AeSkipAssetPipeline.enabled))
  end
end

AeSkipAssetPipeline.enabled = true

ActionView::Base.prepend AeSkipAssetPipeline

