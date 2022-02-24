# frozen_string_literal: true

require 'spec_helper'

describe ThingsController, type: :controller do
  include AeSkipAssetPipeline::HelperMethods
  describe 'render the page' do
    render_views

    def expected_pattern(page)
      return /image_of_thing-[0-9a-f]{16,}/ if page == 'image_tag_page'

      /thing/
    end

    describe 'assets pipeline should work when we do not skip them' do
      around(:each) do |example|
        with_asset_pipeline_enabled(true) do
          example.run
        end
      end

      ThingsController::PAGES.each do |page|
        it "#{page} shows the compiled asset path" do
          get page
          expect(response).to have_http_status(:ok)
          expect(response.body).to match(expected_pattern(page))
        end
      end
    end

    describe 'assets pipeline should return empty when we skip them' do
      around(:each) do |example|
        with_asset_pipeline_enabled(false) do
          example.run
        end
      end

      ThingsController::PAGES.each do |page|
        it "#{page} should not show the compiled asset path" do
          get page
          expect(response).to have_http_status(:ok)
          expect(response.body).not_to match(expected_pattern(page))
        end
      end
    end
  end
end
