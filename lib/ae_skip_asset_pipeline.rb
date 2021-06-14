# frozen_string_literal: true

require 'active_support'
require 'ae_skip_asset_pipeline/version'

module AeSkipAssetPipeline
  mattr_accessor :enabled

  module AssetPipelineMethods
    def javascript_pack_tag(*args)
      super unless AeSkipAssetPipeline.enabled
    end

    def javascript_packs_with_chunks_tag(*args)
      super unless AeSkipAssetPipeline.enabled
    end

    def javascript_include_tag(*args)
      super unless AeSkipAssetPipeline.enabled
    end

    def stylesheet_pack_tag(*args)
      super unless AeSkipAssetPipeline.enabled
    end

    def stylesheet_packs_with_chunks_tag(*args)
      super unless AeSkipAssetPipeline.enabled
    end

    def stylesheet_link_tag(*args)
      super unless AeSkipAssetPipeline.enabled
    end

    def path_to_asset(source, options={})
      super(source, options.merge(skip_pipeline: AeSkipAssetPipeline.enabled))
    end
  end

  module HelperMethods
    def save_current_state_and_set_asset_pipeline_enabled(enabled = true)
      @current_skip_status = AeSkipAssetPipeline.enabled
      AeSkipAssetPipeline.enabled = !enabled
    end

    def restore_old_state_of_asset_pipeline_enabled
      AeSkipAssetPipeline.enabled = @current_skip_status
    end

    def with_asset_pipeline_enabled(enabled = true)
      save_current_state_and_set_asset_pipeline_enabled(enabled)
      yield
      restore_old_state_of_asset_pipeline_enabled
    end
  end
end

AeSkipAssetPipeline.enabled = ENV['USE_PRECOMPILED_ASSETS'] != '1'

ActiveSupport.on_load(:action_view) do
  prepend AeSkipAssetPipeline::AssetPipelineMethods
end
